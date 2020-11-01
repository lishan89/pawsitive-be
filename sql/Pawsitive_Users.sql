create table Users
(
    userID      int auto_increment,
    email       varchar(511)      not null,
    password    varchar(255)      not null,
    firstName   varchar(255)      null,
    middleName  varchar(255)      null,
    lastName    varchar(255)      null,
    isAdmin     tinyint default 0 null,
    isShelter   tinyint default 0 null,
    zipCode     varchar(20)       null,
    phoneNumber varchar(20)       null,
    shelterName varchar(255)      null,
    constraint Users_email_uindex
        unique (email),
    constraint Users_userID_uindex
        unique (userID)
);

alter table Users
    add primary key (userID);

INSERT INTO Pawsitive.Users (userID, email, password, firstName, middleName, lastName, isAdmin, isShelter, zipCode, phoneNumber, shelterName) VALUES (1, 'lishan@test.com', '123456', null, null, null, 1, 0, null, null, null);
INSERT INTO Pawsitive.Users (userID, email, password, firstName, middleName, lastName, isAdmin, isShelter, zipCode, phoneNumber, shelterName) VALUES (2, 'test2@t.com', '123456', null, null, null, 0, 0, null, null, null);
INSERT INTO Pawsitive.Users (userID, email, password, firstName, middleName, lastName, isAdmin, isShelter, zipCode, phoneNumber, shelterName) VALUES (7, 'test3@t.com', '123456', null, null, null, 0, 0, null, null, null);