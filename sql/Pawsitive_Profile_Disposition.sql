create table Profile_Disposition
(
    ProfileDispositionID int auto_increment,
    profileID            int null,
    dispositionID        int null,
    constraint Profile_Disposition_ProfileDispositionID_uindex
        unique (ProfileDispositionID),
    constraint Profile_Disposition_Dispositions_dispositionID_fk
        foreign key (dispositionID) references Dispositions (dispositionID),
    constraint Profile_Disposition_Profiles_profileID_fk
        foreign key (profileID) references Profiles (profileID)
);

alter table Profile_Disposition
    add primary key (ProfileDispositionID);

