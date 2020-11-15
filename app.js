var express = require('express');
var mysql = require('./dbcon.js');
var oauthServer = require('express-oauth-server');

var app = express();


var bodyParser = require('body-parser');
var dateFormat = require('dateformat');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({
    extended: true
})); // support url encoded bodies



app.set('port', 9813);
app.set('mysql', mysql);


// Add body parser.
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

// Add OAuth server.
app.oauth = new oauthServer({
    model: require('./model')
});

// Post token.
app.post('/oauth/token', app.oauth.token());
//app.post('/oauth/login', app.oauth.grant());


// Get secret.
app.get('/secretPage', app.oauth.authenticate(), function(req, res) {
    // Will require a valid access_token.
    console.log(req.headers.authorization);
    res.send('Secret page');
});

app.get('/publicPage', function(req, res) {
    // Does not require an access_token.
    res.send('Public page');
});

app.post('/user/signup', function(req, res) {
    var inserts = [req.body.firstName, req.body.middleName, req.body.lastName, req.body.email, req.body.password, req.body.zipCode, req.body.phoneNumber];
    var sql = "INSERT into Users (firstName, middleName, lastName, email, password, zipCode, phoneNumber) values (?,?,?,?,?,?,?)";
    var mysql = req.app.get('mysql');
    mysql.pool.query(sql, inserts, function(error, results, fields) {
        var re = {};
        if (error) {
            console.log(error);
            if (error.errno == 1062) {
                re.status = "error";
                re.reason = "Duplicate email, please try another one.";
                re.code = 5001;
                res.send(re);
                return;
            }
            if (error.errno == 1048) {
                re.status = "error";
                re.reason = "Email cannot be null, please try another one.";
                re.code = 5002;
                res.send(re);
                return;
            }

            // next(err);
            re.status = "error";
            re.reason = "System Error, please try later.";
            re.code = 1001;
            res.send(re);
            return;
        }
        console.log(results);

        re.status = "success";
        re.userId = results.insertId;
        re.email = req.body.email;
        res.send(re);

    });
});

app.post('/shelter/signup', function(req, res) {
    if (req.body.shelterName == null) {
        re.status = "error";
        re.reason = "ShelterName cannot be null, please try another one.";
        re.code = 6003;
        res.send(re);
        return;
    }
    var inserts = [req.body.shelterName, req.body.email, req.body.password, req.body.zipCode, req.body.phoneNumber];
    var sql = "INSERT into Users (shelterName, email, password, zipCode, phoneNumber, isShelter) values (?,?,?,?,?,1)";
    var mysql = req.app.get('mysql');
    mysql.pool.query(sql, inserts, function(error, results, fields) {
        var re = {};
        if (error) {
            console.log(error);
            if (error.errno == 1062) {
                re.status = "error";
                re.reason = "Duplicate email, please try another one.";
                re.code = 6001;
                res.send(re);
                return;
            }
            if (error.errno == 1048) {
                re.status = "error";
                re.reason = "Email cannot be null, please try another one.";
                re.code = 6002;
                res.send(re);
                return;
            }

            // next(err);
            re.status = "error";
            re.reason = "System Error, please try later.";
            re.code = 1001;
            res.send(re);
            return;
        }
        console.log(results);

        re.status = "success";
        re.userId = results.insertId;
        re.email = req.body.email;
        res.send(re);

    });
});

app.get('/shelter/:id', function(req, res) {
    var re = {};
    var mysql = req.app.get('mysql');
    mysql.pool.query('SELECT * FROM Users where userID=?;', [req.params.id], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows[0].isShelter == 1) {
            res.send(rows[0]);
        } else {
            re.status = "error";
            re.reason = "The id you provided is not a shelter, please try another one.";
            re.code = 3001;
            res.send(re);
            return;
        }

    });
});

app.get('/user/:id', function(req, res) {
    var re = {};
    var mysql = req.app.get('mysql');
    mysql.pool.query('SELECT * FROM Users where userID=?;', [req.params.id], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows[0].isShelter == 0) {
            res.send(rows[0]);
        } else {
            re.status = "error";
            re.reason = "The id you provided is not a user, please try another one.";
            re.code = 3001;
            res.send(re);
            return;
        }
    });
});

//Only the self can edit info from this api
app.post('/user/edit/:id', app.oauth.authenticate(), function(req, res) {
    var token = req.headers.authorization.substring(7);
    mysql.pool.query('SELECT user_id FROM oauth_tokens where access_token=?;', [token], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows[0].user_id == req.params.id) {
            var updates = [req.body.firstName, req.body.middleName, req.body.lastName, req.body.email, req.body.password, req.body.zipCode, req.body.phoneNumber, req.params.id];
            var sql = "update Users set firstName=?, middleName=?, lastName=?, email=?, password=?, zipCode=?, phoneNumber=? where userID=?";
            mysql.pool.query(sql, updates, function(error, results, fields) {
                var re = {};
                if (error) {
                    console.log(error);

                    // next(err);
                    re.status = "error";
                    re.reason = "System Error, please try later.";
                    re.code = 1001;
                    res.send(re);
                    return;
                }
                console.log(results);

                re.status = "success";
                re.userId = req.params.id;
                res.send(re);

            });
        } else {
            res.status(401);
            res.send('unauthrized');

            return;
        }

    });
});

app.post('/shelter/edit/:id', app.oauth.authenticate(), function(req, res) {
    var token = req.headers.authorization.substring(7);
    mysql.pool.query('SELECT user_id FROM oauth_tokens where access_token=?;', [token], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows[0].user_id == req.params.id) {
            var updates = [req.body.shelterName, req.body.email, req.body.password, req.body.zipCode, req.body.phoneNumber, req.params.id];
            var sql = "update Users set shelterName=?, email=?, password=?, zipCode=?, phoneNumber=? where userID=?";
            mysql.pool.query(sql, updates, function(error, results, fields) {
                var re = {};
                if (error) {
                    console.log(error);

                    // next(err);
                    re.status = "error";
                    re.reason = "System Error, please try later.";
                    re.code = 1001;
                    res.send(re);
                    return;
                }
                console.log(results);

                re.status = "success";
                re.userId = req.params.id;
                res.send(re);

            });
        } else {
            res.status(401);
            res.send('unauthrized');

            return;
        }

    });

});



app.get('/breeds', function(req, res) {
    var context = {};
    var mysql = req.app.get('mysql');
    mysql.pool.query('SELECT * FROM Breeds;', function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }

        res.send(rows);
    });
});

app.post('/breed/add', app.oauth.authenticate(), function(req, res) {
    var re = {};
    var token = req.headers.authorization.substring(7);
    mysql.pool.query('SELECT isAdmin from Users where userID=(SELECT user_id FROM oauth_tokens where access_token=?);', [token], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows[0].isAdmin == 1) {
            if (req.body.type != "dog" && req.body.type != "cat") {
                re.status = "error";
                re.reason = "type only can be dog or cat.";
                re.code = 1001;
                res.send(re);
                return;
            }
            var inserts = [req.body.breedName, req.body.type];
            var sql = "insert into Breeds (breedName, type) values (?,?)";
            mysql.pool.query(sql, inserts, function(error, results, fields) {
                
                if (error) {
                    console.log(error);

                    // next(err);
                    re.status = "error";
                    re.reason = "System Error, please try later.";
                    re.code = 1001;
                    res.send(re);
                    return;
                }
                console.log(results);

                re.status = "success";
                re.breedID = results.insertId;
                res.send(re);

            });
        } else {
            res.status(401);
            res.send('unauthrized');

            return;
        }

    });

});

app.get('/dispositions', function(req, res) {
    var context = {};
    var mysql = req.app.get('mysql');
    mysql.pool.query('SELECT * FROM Dispositions;', function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }

        res.send(rows);
    });
});

app.post('/disposition/add', app.oauth.authenticate(), function(req, res) {
    var re = {};
    var token = req.headers.authorization.substring(7);
    mysql.pool.query('SELECT isAdmin from Users where userID=(SELECT user_id FROM oauth_tokens where access_token=?);', [token], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows[0].isAdmin == 1) {
            
            var inserts = [req.body.dispositionTitle];
            var sql = "insert into Dispositions (dispositionTitle) values (?)";
            mysql.pool.query(sql, inserts, function(error, results, fields) {
                
                if (error) {
                    console.log(error);

                    // next(err);
                    re.status = "error";
                    re.reason = "System Error, please try later.";
                    re.code = 1001;
                    res.send(re);
                    return;
                }
                console.log(results);

                re.status = "success";
                re.dispositionID = results.insertId;
                res.send(re);

            });
        } else {
            res.status(401);
            res.send('unauthrized');

            return;
        }

    });

});




app.use(function(req, res) {
    res.status(404);
    res.send('404');
});

app.use(function(err, req, res, next) {
    console.error(err.stack);
    res.status(500);
    res.send('500');
});

app.listen(app.get('port'), function() {
    console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});