create table Breeds
(
    breedID   int auto_increment,
    breedName varchar(255)                               not null,
    type      enum ('dog', 'cat', 'other') default 'cat' not null,
    constraint Breeds_breedID_uindex
        unique (breedID)
);

create index Breeds_type_index
    on Breeds (type);

alter table Breeds
    add primary key (breedID);

INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (1, 'Retrievers (Labrador)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (2, 'German Shepherd Dogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (3, 'Retrievers (Golden)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (4, 'French Bulldogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (5, 'Bulldogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (6, 'Beagles', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (7, 'Poodles', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (8, 'Rottweilers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (9, 'Pointers (German Shorthaired)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (10, 'Yorkshire Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (11, 'Boxers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (12, 'Dachshunds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (13, 'Pembroke Welsh Corgis', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (14, 'Siberian Huskies', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (15, 'Australian Shepherds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (16, 'Great Danes', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (17, 'Doberman Pinschers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (18, 'Cavalier King Charles Spaniels', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (19, 'Miniature Schnauzers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (20, 'Shih Tzu', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (21, 'Boston Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (22, 'Bernese Mountain Dogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (23, 'Pomeranians', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (24, 'Havanese', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (25, 'Shetland Sheepdogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (26, 'Brittanys', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (27, 'Spaniels (English Springer)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (28, 'Pugs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (29, 'Mastiffs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (30, 'Spaniels (Cocker)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (31, 'Vizslas', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (32, 'Cane Corso', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (33, 'Chihuahuas', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (34, 'Miniature American Shepherds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (35, 'Border Collies', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (36, 'Weimaraners', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (37, 'Maltese', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (38, 'Collies', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (39, 'Basset Hounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (40, 'Newfoundlands', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (41, 'Rhodesian Ridgebacks', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (42, 'West Highland White Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (43, 'Belgian Malinois', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (44, 'Shiba Inu', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (45, 'Retrievers (Chesapeake Bay)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (46, 'Bichons Frises', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (47, 'Akitas', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (48, 'St. Bernards', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (49, 'Bloodhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (50, 'Portuguese Water Dogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (51, 'Bullmastiffs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (52, 'Spaniels (English Cocker)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (53, 'Soft Coated Wheaten Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (54, 'Papillons', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (55, 'Australian Cattle Dogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (56, 'Dalmatians', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (57, 'Scottish Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (58, 'Alaskan Malamutes', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (59, 'Samoyeds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (60, 'Airedale Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (61, 'Whippets', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (62, 'Bull Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (63, 'Pointers (German Wirehaired)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (64, 'Chinese Shar-Pei', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (65, 'Wirehaired Pointing Griffons', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (66, 'Great Pyrenees', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (67, 'Dogues de Bordeaux', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (68, 'Cardigan Welsh Corgis', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (69, 'Cairn Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (70, 'Miniature Pinschers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (71, 'Lhasa Apsos', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (72, 'Old English Sheepdogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (73, 'Italian Greyhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (74, 'Greater Swiss Mountain Dogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (75, 'Chow Chows', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (76, 'Irish Wolfhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (77, 'Setters (Irish)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (78, 'Giant Schnauzers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (79, 'Chinese Crested', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (80, 'Staffordshire Bull Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (81, 'Coton de Tulear', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (82, 'Russell Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (83, 'Retrievers (Nova Scotia Duck Tolling)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (84, 'Bouviers des Flandres', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (85, 'American Staffordshire Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (86, 'Rat Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (87, 'Basenjis', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (88, 'Border Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (89, 'Standard Schnauzers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (90, 'Anatolian Shepherd Dogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (91, 'Retrievers (Flat-Coated)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (92, 'Pekingese', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (93, 'Leonbergers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (94, 'Setters (English)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (95, 'Keeshonden', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (96, 'Tibetan Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (97, 'Norwegian Elkhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (98, 'Brussels Griffons', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (99, 'Lagotti Romagnoli', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (100, 'Spaniels (Boykin)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (101, 'Fox Terriers (Wire)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (102, 'Neapolitan Mastiffs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (103, 'Borzois', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (104, 'Japanese Chin', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (105, 'Schipperkes', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (106, 'Belgian Tervuren', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (107, 'Welsh Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (108, 'Norwich Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (109, 'Spinoni Italiani', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (110, 'Miniature Bull Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (111, 'Toy Fox Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (112, 'Silky Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (113, 'Afghan Hounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (114, 'Pointers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (115, 'Setters (Gordon)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (116, 'Irish Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (117, 'Parson Russell Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (118, 'Black Russian Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (119, 'Tibetan Spaniels', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (120, 'Salukis', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (121, 'Boerboels', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (122, 'American Eskimo Dogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (123, 'Fox Terriers (Smooth)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (124, 'Beaucerons', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (125, 'Belgian Sheepdogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (126, 'Norfolk Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (127, 'Bearded Collies', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (128, 'Spaniels (Welsh Springer)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (129, 'Kerry Blue Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (130, 'Bluetick Coonhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (131, 'Tibetan Mastiffs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (132, 'Briards', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (133, 'Manchester Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (134, 'German Pinschers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (135, 'English Toy Spaniels', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (136, 'American Hairless Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (137, 'Treeing Walker Coonhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (138, 'Black and Tan Coonhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (139, 'Australian Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (140, 'Xoloitzcuintli', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (141, 'Bedlington Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (142, 'Redbone Coonhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (143, 'Spaniels (Clumber)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (144, 'Berger Picards', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (145, 'Greyhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (146, 'Setters (Irish Red and White)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (147, 'Lakeland Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (148, 'Affenpinschers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (149, 'Spaniels (Field)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (150, 'Nederlandse Kooikerhondjes', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (151, 'Pumi', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (152, 'Ibizan Hounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (153, 'Spanish Water Dogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (154, 'Portuguese Podengo Pequenos', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (155, 'Icelandic Sheepdogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (156, 'Petits Bassets Griffons Vendeens', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (157, 'Entlebucher Mountain Dogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (158, 'Scottish Deerhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (159, 'Spaniels (Irish Water)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (160, 'Pulik', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (161, 'Finnish Lapphunds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (162, 'Retrievers (Curly-Coated)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (163, 'Kuvaszok', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (164, 'Sealyham Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (165, 'Norwegian Buhunds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (166, 'Spaniels (American Water)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (167, 'Wirehaired Vizslas', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (168, 'Lowchen', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (169, 'Swedish Vallhunds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (170, 'Polish Lowland Sheepdogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (171, 'Plotts', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (172, 'Pharaoh Hounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (173, 'Komondorok', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (174, 'Glen of Imaal Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (175, 'American English Coonhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (176, 'Dandie Dinmont Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (177, 'Grand Basset Griffon Vendeens', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (178, 'Skye Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (179, 'Canaan Dogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (180, 'Spaniels (Sussex)', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (181, 'Pyrenean Shepherds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (182, 'Otterhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (183, 'Cirnechi dell’Etna', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (184, 'Finnish Spitz', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (185, 'Cesky Terriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (186, 'American Foxhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (187, 'Bergamasco Sheepdogs', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (188, 'English Foxhounds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (189, 'Harriers', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (190, 'Chinooks', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (191, 'Norwegian Lundehunds', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (192, 'Sloughis', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (307, 'Abyssinian', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (308, 'Aegean', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (309, 'American Bobtail', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (310, 'American Curl', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (311, 'American Ringtail', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (312, 'American Shorthair', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (313, 'American Wirehair', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (314, 'Aphrodite Giant', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (315, 'Arabian Mau', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (316, 'Asian cat', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (317, 'Foundation stock from Asia', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (318, 'Asian Semi-longhair', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (319, 'Asian Semi-Australian Mist', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (320, 'Balinese', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (321, 'Foundation stock from Thailand', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (322, 'Bambino', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (323, 'Bengal', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (324, 'Bengal Cat (Fia).Birman', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (325, 'Foundation stock from Burma (Myanmar)[5]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (326, 'Bombay', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (327, 'Brazilian Shorthair', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (328, 'British Longhair', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (329, 'British Semi-British Shorthair', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (330, 'Burmese', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (331, 'Burmilla', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (332, 'California Spangled', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (333, 'Chantilly-Tiffany', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (334, 'Chantilly-Chartreux', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (335, 'Chausie', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (336, 'Colorpoint Shorthair', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (337, 'Cornish Rex', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (338, 'Cymric, Manx Longhair or Long-haired Manx[b]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (339, 'Cyprus', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (340, 'Devon Rex', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (341, 'Don Sphynx', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (342, 'Donskoy or Dragon Chinese Li Hua', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (343, 'Dragon Li or Chinese Dwelf', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (344, 'Egyptian Mau', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (345, 'European Shorthair', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (346, 'Exotic Shorthair', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (347, 'Foldex[6]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (348, 'German Rex', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (349, 'Havana Brown', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (350, 'Foundation stock from Thailand', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (351, 'Highlander', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (352, 'Colorpoint Persian[d]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (353, 'Himalayan or Japanese Bobtail', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (354, 'Colorpoint Longhair[f]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (355, 'Foundation stock from Southeast Asia', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (356, 'Javanese or Kanaani', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (357, 'Khao Manee', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (358, 'Kinkalow', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (359, 'Korat', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (360, 'Korean Bobtail', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (361, 'Japanese Bobtail walking.Korn Ja', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (362, 'Kurilian Kuril Islands Bobtail', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (363, 'Kurilian Bobtail or Kuril Lambkin', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (364, 'LaPerm', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (365, 'Lykoi', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (366, 'Maine Coon', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (367, 'Manx', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (368, 'Mekong Bobtail', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (369, 'Minskin', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (370, 'Napoleon', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (371, 'Munchkin', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (372, 'Nebelung', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (373, 'Norwegian Forest Cat', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (374, 'Norwegian Ocicat', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (375, 'Ojos Azules', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (376, 'Oregon Rex', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (377, 'Oriental Bicolor', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (378, 'Foundation stock ultimately from Thailand', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (379, 'Oriental Longhair[g]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (380, 'Foundation stock ultimately from Thailand[5]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (381, 'Oriental Shorthair[g]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (382, 'Foundation stock ultimately from Thailand[5]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (383, 'Persian (modern)', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (384, 'Foundation stock from Greater Iran[5]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (385, 'Persian, Persian (traditional)', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (386, 'Peterbald', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (387, 'Pixie-bob', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (388, 'Pixie-Liebling (obsolete)', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (389, 'Ragdoll', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (390, 'Raas', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (391, 'Russian Blue', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (392, 'Russian White, Russian Black and Russian Tabby', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (393, 'Foundation stock from Russia', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (394, 'Sam Sawet', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (395, 'Savannah', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (396, 'Scottish Fold', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (397, 'Lilac-coated Selkirk Rex', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (398, 'Serengeti', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (399, 'Serrade Petit', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (400, 'Siamese (modern)(for traditional, see Thai below)', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (401, 'Foundation stock from Thailand[5]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (402, 'Siberian Forest Cat;Neva Masquerade (colorpoint variety)', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (403, 'Singapura', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (404, 'Foundation stock from Singapore[5]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (405, 'Snowshoe', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (406, 'Sokoke', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (407, 'Somali', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (408, 'Sphynx', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (409, 'Suphalak', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (410, 'Traditional, Classic, or Old-style Siamese;Wichien Maat[h]', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (411, 'Thai Lilac, Thai Blue Point and Thai Lilac Point', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (412, 'Tonkinese', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (413, 'Toyger', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (414, 'Turkish Angora', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (415, 'Turkish Van', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (416, 'Foundation stock from Turkey', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (417, 'Turkish Vankedisi', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (418, 'Ukrainian Levkoy', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (419, 'Wila Krungthep', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (420, 'York Chocolate', 'cat');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (421, 'other', 'other');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (422, 'other', 'dog');
INSERT INTO Pawsitive.Breeds (breedID, breedName, type) VALUES (423, 'other', 'cat');