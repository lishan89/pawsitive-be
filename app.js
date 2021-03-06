var express = require('express');
var mysql = require('./dbcon.js');
var util = require('./util.js');
var oauthServer = require('express-oauth-server');
var cors = require('cors');
var app = express();
app.use(cors());

var bodyParser = require('body-parser');
var dateFormat = require('dateformat');
app.use(bodyParser.json({limit: '25mb'})); // support json encoded bodies
app.use(bodyParser.urlencoded({
    extended: true,
    limit: '25mb'
})); // support url encoded bodies



app.set('port', 9813);
app.set('mysql', mysql);


// // Add body parser.
// app.use(bodyParser.json());
// app.use(bodyParser.urlencoded({
//     extended: false
// }));

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
    var re = {};
    if (!util.validateEmail(req.body.email) || util.isEmpty(req.body.password)) {
        re.status = "error";
        re.reason = "Wrong email/password";
        re.code = 5001;
        res.send(re);
        return;
    }
    var inserts = [req.body.firstName, req.body.middleName, req.body.lastName, req.body.email, req.body.password, req.body.zipCode, req.body.phoneNumber];
    var sql = "INSERT into Users (firstName, middleName, lastName, email, password, zipCode, phoneNumber) values (?,?,?,?,?,?,?)";
    var mysql = req.app.get('mysql');
    mysql.pool.query(sql, inserts, function(error, results, fields) {
        if (error) {
            console.log(error);
            if (error.errno == 1062) {
                re.status = "error";
                re.reason = "Duplicate email, please try another one.";
                re.code = 5002;
                res.send(re);
                return;
            }
            if (error.errno == 1048) {
                re.status = "error";
                re.reason = "Email cannot be null, please try another one.";
                re.code = 5003;
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
    var re = {};
    if (util.isEmpty(req.body.shelterName)) {
        re.status = "error";
        re.reason = "ShelterName cannot be null.";
        re.code = 6004;
        res.send(re);
        return;
    }
    if (!util.validateEmail(req.body.email) || util.isEmpty(req.body.password)) {
        re.status = "error";
        re.reason = "Wrong email/password";
        re.code = 6001;
        res.send(re);
        return;
    }
    var inserts = [req.body.shelterName, req.body.email, req.body.password, req.body.zipCode, req.body.phoneNumber];
    var sql = "INSERT into Users (shelterName, email, password, zipCode, phoneNumber, isShelter) values (?,?,?,?,?,1)";
    var mysql = req.app.get('mysql');
    mysql.pool.query(sql, inserts, function(error, results, fields) {
        if (error) {
            console.log(error);
            if (error.errno == 1062) {
                re.status = "error";
                re.reason = "Duplicate email, please try another one.";
                re.code = 6002;
                res.send(re);
                return;
            }
            if (error.errno == 1048) {
                re.status = "error";
                re.reason = "Email cannot be null, please try another one.";
                re.code = 6003;
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
    mysql.pool.query('SELECT userID,email,zipCode,phoneNumber,shelterName,isShelter FROM Users where userID=?;', [req.params.id], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows.length > 0 && rows[0].isShelter == 1) {
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
    mysql.pool.query('SELECT userID,email,firstName,middleName,lastName,isAdmin,isShelter,zipCode,phoneNumber FROM Users where userID=?;', [req.params.id], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows.length > 0 && rows[0].isShelter == 0) {
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

app.get('/current', app.oauth.authenticate(), function(req, res) {
    var token = req.headers.authorization.substring(7);
    mysql.pool.query('SELECT user_id FROM oauth_tokens where access_token=?;', [token], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows.length > 0) {
            var keys = Object.keys(req.body);
            var sql = "select userID,email,firstName,middleName,lastName,isAdmin,isShelter,zipCode,phoneNumber,shelterName from Users where userID=?";
            
            mysql.pool.query(sql, [rows[0].user_id], function(error, results, fields) {
                var re = {};
                if (error || results.length <= 0) {
                    console.log('this.sql', this.sql);
                    console.log(error);

                    // next(err);
                    re.status = "error";
                    re.reason = "System Error, please try later.";
                    re.code = 1001;
                    res.send(re);
                    return;
                }
                console.log(results[0]);

                re.status = "success";
                re.data = results[0];
                res.send(re);

            });
        } else {
            res.status(401);
            res.send('unauthrized');

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
        if (rows.length > 0 && rows[0].user_id == req.params.id) {
            var keys = Object.keys(req.body);

            var updates = [];
            var sql = "update Users set ";
            for (var key of keys) {
                sql.concat(key).concat("=?,");
                updates.push(req.body[key]);
            }
            sql = sql.slice(0, -1);
            sql = sql.concat(" where userID=?;")
            updates.push(req.params.id);
            mysql.pool.query(sql, updates, function(error, results, fields) {
                var re = {};
                if (error) {
                    console.log('this.sql', this.sql);
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
        if (rows.length > 0 && rows[0].user_id == req.params.id) {
            var keys = Object.keys(req.body);

            var updates = [];
            var sql = "update Users set ";
            for (var key of keys) {
                sql.concat(key).concat("=?,");
                updates.push(req.body[key]);
            }
            sql = sql.slice(0, -1);
            sql = sql.concat(" where userID=?;")
            updates.push(req.params.id);
            mysql.pool.query(sql, updates, function(error, results, fields) {
                var re = {};
                if (error) {
                    console.log('this.sql', this.sql);
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

app.get('/breed/:id', function(req, res) {
    var context = {};
    var mysql = req.app.get('mysql');
    mysql.pool.query('SELECT * FROM Breeds where breedID=?;',[req.params.id], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows.length > 0) {
            res.send(rows[0]);
        } else {
            res.send("{}");
        }
        
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
        if (rows.length > 0 && rows[0].isAdmin == 1) {
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
        if (rows.length > 0 && rows[0].isAdmin == 1) {

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

app.post('/picture/add', app.oauth.authenticate(), function(req, res) {
    var re = {};
    var token = req.headers.authorization.substring(7);
    mysql.pool.query('SELECT isShelter,userID from Users where userID=(SELECT user_id FROM oauth_tokens where access_token=?);', [token], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows.length > 0 && rows[0].isShelter == 1) {
            mysql.pool.query('SELECT shelterID from profiles where profileID=?;', [req.body.profileID], function(err, profileRows, fields) {
                if (err) {
                    console.log(err);
                    // next(err);
                    res.status(500);
                    res.send('500');
                    return;
                }
                if (profileRows.length > 0 && profileRows[0].shelterID == rows[0].userID) {
                    var inserts = [req.body.picUrl, req.body.profileID];
                    var sql = "insert into pictures (picUrl, profileID) values (?, ?)";
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
                        re.picID = results.insertId;
                        res.send(re);

                    });
                } else {
                    res.status(401);
                    res.send('unauthrized');
                    return;
                }
            });
        } else {
            res.status(401);
            res.send('unauthrized');

            return;
        }

    });

});

app.get('/pictures/:profileId', function(req, res) {
    var context = {};
    var mysql = req.app.get('mysql');
    mysql.pool.query('SELECT * FROM pictures where profileId=?;', [req.params.profileId], function(err, rows, fields) {
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



app.post('/profile/add', app.oauth.authenticate(), function(req, res) {
    var re = {};
    var token = req.headers.authorization.substring(7);
    mysql.pool.query('SELECT isShelter,userID from Users where userID=(SELECT user_id FROM oauth_tokens where access_token=?);', [token], function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        console.log(req.body);
        if (rows.length > 0 && rows[0].isShelter == 1) {

            var inserts = [req.body.petName, req.body.type, req.body.availability, req.body.shelterID, req.body.breedID, req.body.description, req.body.goodWithAnimal, req.body.goodWithChild, req.body.leashed];
            var sql = "insert into Profiles (petName, type, availability, shelterID, breedID, description, goodWithAnimal, goodWithChild, leashed) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
                console.log('this.sql', this.sql);


                re.status = "success";
                re.profileID = results.insertId;
                res.send(re);

            });
        } else {
            console.log("Error");
            re.status = "error";
            re.reason = "You cannot add profile, please make sure you are shelter account.";
            re.code = 1001;
            res.send(re);
            return;
        }


    });

});


//update profile, self
app.post('/profile/edit/:id', app.oauth.authenticate(), function(req, res) {
    var re = {};
    var token = req.headers.authorization.substring(7);
    mysql.pool.query('SELECT isShelter,userID from Users where userID=(SELECT user_id FROM oauth_tokens where access_token=?);', [token], function(err, rows, fields) {
        if (err) {
            console.log('this.sql', this.sql);
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows.length > 0 && rows[0].isShelter == 1) {
            mysql.pool.query('SELECT shelterID from profiles where profileID=?;', [req.params.id], function(err, profileRows, fields) {
                if (err) {
                    console.log('this.sql', this.sql);
                    console.log(err);
                    // next(err);
                    res.status(500);
                    res.send('500');
                    return;
                }
                if (profileRows.length > 0 && profileRows[0].shelterID == rows[0].userID) {
                    var keys = Object.keys(req.body);

                    var updates = [];
                    var sql = "update profiles set ";
                    for (var key of keys) {
                        sql.concat(key).concat("=?,");
                        updates.push(req.body[key]);
                    }
                    sql = sql.slice(0, -1);
                    sql = sql.concat(" where profileID=?;")
                    updates.push(req.params.id);
                    mysql.pool.query(sql, updates, function(error, results, fields) {

                        if (error) {
                            console.log('this.sql', this.sql);
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
                        re.profileID = req.params.id;
                        res.send(re);

                    });
                } else {
                    re.status = "error";
                    re.reason = "You can only edit the profile you added.";
                    re.code = 1001;
                    res.send(re);
                    return;
                }
            });
        } else {
            re.status = "error";
            re.reason = "You can only edit the profile you added.";
            re.code = 1001;
            res.send(re);
            return;
        }

    });

});

//soft delete profile, admin, self
app.post('/profile/delete/:id', app.oauth.authenticate(), function(req, res) {
    var re = {};
    var token = req.headers.authorization.substring(7);
    mysql.pool.query('SELECT isShelter,isAdmin,userID from Users where userID=(SELECT user_id FROM oauth_tokens where access_token=?);', [token], function(err, rows, fields) {
        if (err) {
            console.log('this.sql', this.sql);
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows.length > 0 && (rows[0].isShelter == 1 || rows[0].isAdmin == 1)) {
            mysql.pool.query('SELECT shelterID from profiles where profileID=?;', [req.params.id], function(err, profileRows, fields) {
                if (err) {
                    console.log('this.sql', this.sql);
                    console.log(err);
                    // next(err);
                    res.status(500);
                    res.send('500');
                    return;
                }
                if (profileRows.length > 0 && (profileRows[0].shelterID == rows[0].userID || rows[0].isAdmin == 1)) {
                    var keys = Object.keys(req.body);

                    var updates = [req.params.id];
                    var sql = "update profiles set isDeleted = 1 where profileID=?;";

                    mysql.pool.query(sql, updates, function(error, results, fields) {

                        if (error) {
                            console.log('this.sql', this.sql);
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
                        re.profileID = req.params.id;
                        res.send(re);

                    });
                } else {
                    re.status = "error";
                    re.reason = "You can only delete the profile you added.";
                    re.code = 1001;
                    res.send(re);
                    return;
                }
            });
        } else {
            re.status = "error";
            re.reason = "You can only delete the profile you added.";
            re.code = 1001;
            res.send(re);
            return;
        }

    });

});

//update profile, self
app.post('/profile/adopt/:id', function(req, res) {
    var re = {};
    mysql.pool.query('update profiles set availability = ? where profileID=?;', [req.body.availability, req.params.id], function(err, rows, fields) {
        if (err) {
            console.log('this.sql', this.sql);
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        } 

        re.status = "success";
        re.profileID = req.params.id;
        re.availability = req.body.availability;
        res.send(re);

    });

});

//get profiles by filters
app.post('/profiles', function(req, res) {
    console.log(req.body.filters);
    var keys = Object.keys(req.body.filters);
    console.log(keys);
    var search = [];
    var sql = "select * from Profiles where 1=1 and ";
    for (var key of keys) {
        sql = sql.concat(key);
        sql = sql.concat("=? and ");
        search.push(req.body.filters[key]);
    }
    console.log(sql);
    // if (Array.isArray(req.body.disposition)) {
    //     for (var dis of req.body.disposition) {
    //         sql = sql.concat("disposition like '%".concat(dis).concat("%' and "));
    //     }
    // }

    sql = sql.slice(0, -4);
    sql = sql.concat(";")


    var mysql = req.app.get('mysql');
    mysql.pool.query(sql, search, function(err, rows, fields) {
        if (err) {
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        var re = {};
        re.status = "success";
        re.data = rows;
        res.send(re);
    });
});
//get profile by filters
app.get('/profile/:profileId', function(req, res) {
    var context = {};
    var mysql = req.app.get('mysql');
    mysql.pool.query('SELECT * FROM Profiles where profileID=?;', [req.params.profileId], function(err, rows, fields) {
        if (err) {
            console.log('this.sql', this.sql);
            console.log(err);
            // next(err);
            res.status(500);
            res.send('500');
            return;
        }
        if (rows.length > 0)
            res.send(rows[0]);
        else {
            var re = {};
            re.status = "error";
            re.reason = "Cannot found profile.";
            re.code = 6001;
            res.send(re);
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