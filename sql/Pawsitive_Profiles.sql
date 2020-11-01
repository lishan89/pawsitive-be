create table Profiles
(
    profileID    int auto_increment,
    petName      varchar(255)                                              null,
    type         enum ('dog', 'cat', 'other')                              null,
    shelterID    int                                                       null,
    breedID      int                                                       null,
    createdDate  datetime                                                  null,
    availability enum ('Not Available', 'Available', 'Pending', 'Adopted') null,
    status       text                                                      null,
    description  text                                                      null,
    isDeleted    tinyint                                                   null,
    constraint Profiles_profileID_uindex
        unique (profileID),
    constraint Profiles_Breeds_breedID_fk
        foreign key (breedID) references Breeds (breedID),
    constraint Profiles_Users_userID_fk
        foreign key (shelterID) references Users (userID)
);

alter table Profiles
    add primary key (profileID);

