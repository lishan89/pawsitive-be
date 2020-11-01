create table Pictures
(
    pictureID int auto_increment,
    picUrl    varchar(512) null,
    profileID int          null,
    constraint Pictures_pictureID_uindex
        unique (pictureID),
    constraint Pictures_Profiles_profileID_fk
        foreign key (profileID) references Profiles (profileID)
);

alter table Pictures
    add primary key (pictureID);

