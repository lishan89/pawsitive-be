/**
 * Module dependencies.
 */
var mysql = require('./dbcon.js');
var config = require('./config.js');
const bcrypt = require('bcrypt');


/*
 * Get access token.
 */

module.exports.getAccessToken = function(bearerToken, callback) {
  console.log("Bearer " + bearerToken);
  mysql.pool.query('SELECT access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id FROM oauth_tokens WHERE access_token = ?', [bearerToken],
    function(error, results, fields) {
      if(error){
        return callback(error);
      }
      var token = results[0];
      console.log(results);
      callback(null, {
        accessToken: token.access_token,
        client: {id: token.client_id},
        accessTokenExpiresAt: token.access_token_expires_on,
        user: {id: token.user_id}, // could be any object
      });
    });
};

/**
 * Get client.
 */

module.exports.getClient = function (clientId, clientSecret, callback) {
  console.log(clientId);
  console.log(clientSecret);
  console.log(callback);
  mysql.pool.query('SELECT client_id, client_secret, redirect_uri FROM oauth_clients WHERE client_id = ? AND client_secret = ?', [clientId, clientSecret],
    function(error, results, fields) {
      if(error){
        console.log(error);
        return callback(error);
      }
      var oAuthClient = results[0];

      if (!oAuthClient) {
        return;
      }
      console.log(results);
      callback(null, {
        clientId: oAuthClient.client_id,
        clientSecret: oAuthClient.client_secret,
        grants: ['password'], // the list of OAuth2 grant types that should be allowed
      });
    });
};

/**
 * Get refresh token.
 */

module.exports.getRefreshToken = function (bearerToken, callback) {
  mysql.pool.query('SELECT access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id FROM oauth_tokens WHERE refresh_token = ?', [bearerToken],
    function(error, results, fields) {
      if(error){
        return callback(error);
      }
      console.log(results);
      callback(null, results.length > 0 ? results[0] : false);
    });
};

/*
 * Get user.
 */

module.exports.getUser = function (username, password, callback) {
  //password = await bcrypt.hash(config.salt, password);
  //will encrypt password later.
  console.log(username);
  console.log(password);
  console.log(callback);
  mysql.pool.query('SELECT userID FROM Users WHERE email = ? AND password = ?', [username, password],
    function(error, results, fields) {
      if(error){
        console.log("error");
        return callback(error);
      }
      console.log("result");
      console.log(results);
      callback(null, results.length > 0 ? results[0] : false);
    });
};

/**
 * Save token.
 */

module.exports.saveAccessToken = function (token, client, user, callback) {
  mysql.pool.query('INSERT INTO oauth_tokens(access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (?, ?, ?, ?)', [
    token.accessToken,
    token.accessTokenExpiresOn,
    client.id,
    token.refreshToken,
    token.refreshTokenExpiresOn,
    user.id
  ], function(error, results, fields) {
    if(error){
        return callback(error);
    }
    console.log(results);
    callback(null, results.length > 0 ? results[0] : false); // TODO return object with client: {id: clientId} and user: {id: userId} defined
  });
  };

  /**
 * Save token.
 */

module.exports.saveToken = function (token, client, user, callback) {
  console.log(token);
  console.log(client);
  console.log(user);
  mysql.pool.query('INSERT INTO oauth_tokens(access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (?, ?, ?, ?, ?, ?)', [
    token.accessToken,
    token.accessTokenExpiresAt,
    client.clientId,
    token.refreshToken,
    token.refreshTokenExpiresAt,
    user.userID
  ], function(error, results, fields) {
    if(error){
        return callback(error);
    }
    re = {
      "accessToken":token.accessToken, 
      "accessTokenExpiresAt":token.accessTokenExpiresAt, 
      "client":client.clientId, 
      "refreshToken":token.refreshToken, 
      "refreshTokenExpiresAt":token.refreshTokenExpiresAt, 
      "user":user.userID
    }
    console.log(token);
    callback(null, re); // TODO return object with client: {id: clientId} and user: {id: userId} defined
  });
  };