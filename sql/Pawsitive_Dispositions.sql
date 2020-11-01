create table Dispositions
(
    dispositionID    int auto_increment,
    dispositionTitle text not null,
    constraint Dispositions_dispositionID_uindex
        unique (dispositionID)
);

alter table Dispositions
    add primary key (dispositionID);

INSERT INTO Pawsitive.Dispositions (dispositionID, dispositionTitle) VALUES (1, 'Good with other animals');
INSERT INTO Pawsitive.Dispositions (dispositionID, dispositionTitle) VALUES (2, 'Good with children');
INSERT INTO Pawsitive.Dispositions (dispositionID, dispositionTitle) VALUES (3, 'Animal must be leashed at all times');