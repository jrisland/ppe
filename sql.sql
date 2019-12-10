drop database if exists ppe;
create database ppe;
use ppe;

CREATE TABLE client(
        idclient         Int (50) NOT NULL Auto_increment,
        nom              Varchar (50),
        prenom           Varchar (50),
        adresse          Varchar (50),
        email            Varchar (50),   
        numero_passeport Varchar (50),
        tel              Varchar (50),
        mdp              Varchar (50),
	age              Varchar (50),
        PRIMARY KEY (idclient)
);

CREATE TABLE cb(
        idcb         Int NOT NULL Auto_increment,
        nom          Varchar (50) ,
        numero       Varchar (50) ,
        datevalidite Date ,
        crypto       Varchar (4) ,
        idclient     Int NOT NULL,
        PRIMARY key (idclient),
        FOREIGN KEY (idclient) REFERENCES client(idclient)
);

CREATE TABLE aeroport(
        idaeroport Int NOT NULL Auto_increment,
        nom        Varchar (50) ,
        adresse    Varchar (100) ,
	PRIMARY KEY (idaeroport)
);

CREATE TABLE avion(
        idavion   Int (50) NOT NULL Auto_increment,
        nom       Varchar (50),
        nb_places Varchar (50),
        PRIMARY KEY (idavion)
);

CREATE TABLE vol(
        idvol              Int (50) NOT NULL Auto_increment,
        nom                Varchar (50) ,
        datedepart         Date ,
        heuredepart        Time ,
        datearrivee        Date ,
        heurearrivee       Time ,
        idaeroport         Int NOT NULL ,
        idavion            Int NOT NULL ,
        idaeroport_arriver Int NOT NULL,
        PRIMARY KEY (idvol),
        FOREIGN KEY (idaeroport) REFERENCES aeroport(idaeroport),
        FOREIGN KEY (idavion) REFERENCES avion(idavion),
        FOREIGN KEY (idaeroport_arriver) REFERENCES aeroport(idaeroport)
);

CREATE table reserver(
        place int(50),
        classe Varchar (50),
        repas Varchar(50),
        assistance Varchar(200),
        idclient int (50) not null,
        idvol int (50) not null,
        PRIMARY key (idclient,idvol),
        FOREIGN key (idclient) REFERENCES client(idclient),
        FOREIGN key (idvol) REFERENCES vol(idvol)
);

CREATE TABLE service(
        idservice Int (50) NOT NULL Auto_increment,
        nom       Varchar (50),
        PRIMARY KEY (idservice)
);

CREATE TABLE typepartenaire(
        idtype  Int (50)  Auto_increment  NOT NULL ,
        libelle Varchar (50) NOT NULL,
	PRIMARY KEY (idtype)
);

CREATE TABLE partenaire(
        idpartenaire Int (50) NOT NULL Auto_increment,
        nom          Varchar (50) ,
        adresse      Varchar (200) ,
        idtype       Int (50) NOT NULL,
        PRIMARY KEY (idpartenaire),
        FOREIGN KEY (idtype) REFERENCES typepartenaire(idtype)
);

CREATE TABLE location(
        
        immatriculation Varchar (50),
        n_parking       Varchar (50),
        statut          Varchar (50),
        datedebut       Date ,
        datefin         Date ,
        prix            Float ,
        idservice       Int (50) NOT NULL ,
	PRIMARY KEY (idservice),
        FOREIGN KEY (idservice) REFERENCES service(idservice)
);

CREATE TABLE logement(
        idservice     Int (50) NOT NULL ,
        adresse       Varchar (50) ,
        datedebut     Date ,
        datefin       Date ,
        nettoyage     Varchar (50) ,
        proprietaire  Varchar (50) ,
        surface       Varchar (50) ,
        prix          Float ,
	PRIMARY KEY (idservice),
	FOREIGN KEY (idservice) REFERENCES service(idservice)
);

CREATE TABLE promotion(
	idservice   Int NOT NULL,
        pourcentage Varchar (10) ,
        PRIMARY KEY (idservice),
        FOREIGN KEY (idservice) REFERENCES service(idservice)
);

CREATE TABLE disposer(
        idservice Int NOT NULL ,
        idvol     Int NOT NULL ,
        idclient  Int NOT NULL,
   	PRIMARY KEY (idservice,idvol,idclient),
	FOREIGN KEY (idservice) REFERENCES service(idservice),
    	FOREIGN KEY (idvol) REFERENCES vol(idvol),
    	FOREIGN KEY (idclient) REFERENCES client(idclient)
);

/*Les clients*/
INSERT INTO client VALUES(NULL,"Tang","Vaesna", "21 rue Gabriel Sartrouville 78500","vaesna@gmail.com","12345678","0780905636","vaesna","20");
INSERT INTO client VALUES(NULL,"Walter","Trent", "7845 Cecilia St CA 90221","wtrent@gmail.com","USA546T3S","8085550146","walter","20");
INSERT INTO client VALUES(NULL,"Hyu","Jenna", "58 Delaware St.Compton CA 90221","hjenna@gmail.com","USA5608T3S","8085550456","jenna","20");
INSERT INTO client VALUES(NULL,"Howell","John", "778 Bradford St.Bakersfield CA 93309","hjohn@gmail.com","USA513400J","8083330456","john","20");
INSERT INTO client VALUES(NULL,"Price","Ty", "809 8th Road Los Angeles CA 90006","pty@gmail.com","USA51343PJ","8083331111","ty","20");
INSERT INTO client VALUES(NULL,"Holl","Morgan", "9148 Broad St.Watsonville CA 95076","hmorgan@gmail.com","USA513450M","8083332222","morgan","20");
INSERT INTO client VALUES(NULL,"Alexander","Drew", "7661 Sulphur Springs Street Garden Grove CA 92840","dalexander@gmail.com","USA513445J","802367456","drew","20");
INSERT INTO client VALUES(NULL,"Alexander","Emma", "7661 Sulphur Springs Street Garden Grove CA 92840","ealexander@gmail.com","USA512323J","802367333","emma","18");
INSERT INTO client VALUES(NULL,"Alexander","Gemma", "7661 Sulphur Springs Street Garden Grove CA 92840","galexander@gmail.com","USA512323J","802367333","gemma","40");
INSERT INTO client VALUES(NULL,"Alexander","Josh", "7661 Sulphur Springs Street Garden Grove CA 92840","jalexander@gmail.com","USA512323J","802367333","josh","45");
INSERT INTO client VALUES(NULL,"Williams","Paige", "7106 Colonial Lane Winter Springs FL 32708","pwilliams@gmail.com","USA512323P","5125550141","paige","45");
INSERT INTO client VALUES(NULL,"Webb","Summer", "8336 Fairground St.Miami FL 33173","swebb@gmail.com","USA512323S","5125550142","summer","45");
INSERT INTO client VALUES(NULL,"Baker","Charlotte", "674 Ashley Lane Fort Myers FL 33912","cbaker@gmail.com","USA512323B","5125550143","charlotte","45");
INSERT INTO client VALUES(NULL,"Morris","Lucy", "517 Westport Ave.Orlando FL 32835","lmorris@gmail.com","USA512323E","5125550144","lucy","45");
INSERT INTO client VALUES(NULL,"Smith","Chelsea", "35 Market Drive New Port Richey FL 34653","csmith@gmail.com","USA512323D","5125550145","chelsea","45");
INSERT INTO client VALUES(NULL,"Evans","Livie", "7778 Manchester Drive Apopka FL 32703","levans@gmail.com","USA512323C","5125550146","livie","45");
INSERT INTO client VALUES(NULL,"Loire","Julien", "26 rue de Iena Paris", "jloire@gmail.com","FRA678901","0780905635","julien","45");
INSERT INTO client VALUES(NULL,"Dubois","Dylan", "12 rue de Moscow Paris 75009","ddubois@gmail.com","FRA678902","0780905637","dylan","25");
INSERT INTO client VALUES(NULL,"Jolive","Romain", "28 rue Bergé Paris 75009","rjolive@gmail.com","FRA678903","0780905638","romain","18");
INSERT INTO client VALUES(NULL,"Lefevre","Ludovic", "29 rue Verdun Paris 75009","llefevre@gmail.com","FRA678904","0780905639","ludovic","25");
INSERT INTO client VALUES(NULL,"Chastant","Lucas", "12 rue des Vidanges Paris 75009","lchastant@gmail.com","FRA678905","0780905631","lucas","32");
INSERT INTO client VALUES(NULL,"Achar","Thibaut", "11 avenue Matignon Paris 75009","tachar@gmail.com","FRA678906","0780905632","thibaut","22");
INSERT INTO client VALUES(NULL,"Launey","Francois", "10 rue Binet Paris 75009","flauney@gmail.com","FRA678907","0780905633","francois","30");
INSERT INTO client VALUES(NULL,"Gardes","Lisa", "11 avenue honoré Neuilly sur seine 92200","lgardes@gmail.com","FRA678911","0780905644","lisa","23");
INSERT INTO client VALUES(NULL,"Cohen","Eve", "11 avenue Saint Neuilly sur seine 92200","ecohen@gmail.com","FRA678912","0780905643","eve","19");
INSERT INTO client VALUES(NULL,"Becker","Yoann", "8 rue des roses Neuilly sur seine 92200","ybecker@gmail.com","FRA678913","0780905642","yoann","20");
INSERT INTO client VALUES(NULL,"Cooper","Judith", "1 rue Gabriel Neuilly sur seine 92200","jcooper@gmail.com","FRA678914","0780905641","judith","30");
INSERT INTO client VALUES(NULL,"Jacobs","Vanessa", "2 rue des Tuiles Neuilly sur seine 92200","jvanessa@gmail.com","FRA678915","0780905645","vanessa","26");
INSERT INTO client VALUES(NULL,"Coleman","Abi", "9 rue Massenet Neuilly sur seine 92200","acoleman@gmail.com","FRA678916","0780905646","abi","28");
INSERT INTO client VALUES(NULL,"Newman","Jane", "15 rue du Temple Neuilly sur seine 92200","jnewman@gmail.com","FRA678917","0780905647","jane","21");
INSERT INTO client VALUES(NULL,"Orlando","Ellie", "20 rue des Amandes Cap-Breton 40130","eorlando@gmail.com","FRA678937","0631325410","ellie","25");
INSERT INTO client VALUES(NULL,"Jose","Jacob", "20 rue Moliere Cap-Breton 40130", "jjose@gmail.com","FRA678938","0631325411","jacob","23");
INSERT INTO client VALUES(NULL,"Silva","Jordyn","20 rue Stalingrad Cap-Breton 40130","jsilva@gmail.com","FRA678939","0631325412","jordyn","22");
INSERT INTO client VALUES(NULL,"Oliveira","Sylvain", "20 rue Gaumont Cap-Breton 40130","soliveira@gmail.com","FRA678931","0631325413","sylvain","26");
INSERT INTO client VALUES(NULL,"Thuma","Diego", "21 rue des Trelles Narbonne 11100","dthuma@gmail.com","FRA678934","0631325414","diego","29");
INSERT INTO client VALUES(NULL,"Eau","Ayden", "22 rue du Parc Narbonne 11100","aeau@gmail.com","FRA678932","0631325415","ayden","30");
INSERT INTO client VALUES(NULL,"Morisse","Jean", "29 rue Maupassant Narbonne 11100","jmorisse@gmail.com","FRA678936","0631325416","jean","35");
INSERT INTO client VALUES(NULL,"Adam","Olivier", "25 rue du Camp Narbonne 11100","oadam@gmail.com","FRA678933","0631325417","olivier","33");
INSERT INTO client VALUES(NULL,"Yves","Evelyn", "2 rue Dorée Saint Germain En Laye 78100","eyves@gmail.com","FRA678925","0631325421","evelyn","31");
INSERT INTO client VALUES(NULL,"Jean","Mia", "3 avenue des Eponges Saint Germain En Laye 78100","mjean@gmail.com","FRA678926","0631325422","mia","32");
INSERT INTO client VALUES(NULL,"Jault","Connor", "1 avenue Cannoei Saint Germain En Laye 78100","cjault@gmail.com","FRA678927","0631325423","connor","33");
INSERT INTO client VALUES(NULL,"Becker","Brice", "8 rue des Tulipes Saint Germain En Laye 78100","bbecker@gmail.com","FRA678928","0631325424","brice","34");
INSERT INTO client VALUES(NULL,"Cooper","Nathan", "1 rue Orange Saint Germain En Laye 78100","ncooper@gmail.com","FRA678929","0631325425","nathan","35");
INSERT INTO client VALUES(NULL,"Vaili","Mohammed", "7 rue des Sablons Saint Germain En Laye 78100","mvaili@gmail.com","FRA678922","0631325426","mohammed","36");
INSERT INTO client VALUES(NULL,"Nolan","Driss", "89 Plantation Place New South Wales 2795","dnolan@gmail.com","FRA678916","0631325429","driss","24");
INSERT INTO client VALUES(NULL,"Yuga","Anne", "7 Prince Street New South Wales 2795","ayuga@gmail.com","FRA678917","0631325328","anne","22");
INSERT INTO client VALUES(NULL,"Eiti","Paul", "45 Duff Street GRANVILLE 6503","peiti@gmail.com","FRA678915","0631325426","paul","20");
INSERT INTO client VALUES(NULL,"Eiti","Lea", "23 Walpole Avenue PURNIM WEST 2795","leiti@gmail.com","FRA674416","0631325429","lea","27");
INSERT INTO client VALUES(NULL,"Mossa","Yanis", "39 Village Drive INGLEBURN MILPO 2174","ymossa@gmail.com","FRA666917","0621325428","yanis","19");
INSERT INTO client VALUES(NULL,"Walter","Ismael", "66 McLeans Road Queensland 4630","iwalter@gmail.com","FRA888917","0631525428","ismael","18");


/*Les cb des clients enregistrer*/

/*heure local de chaque lieu*/
insert into vol values (null,"Paris-Marseille","2020/01/06","13:00:00","2020/01/06","14:00:00",1,1,2),
(null,"Marseille-Paris","2020/01/07","09:00:00","2020/01/07","10:00:00",2,1,1),
(null,"Paris-Brussel","2020/01/01","14:00:00","2020/01/01","15:00:00",1,2,3),
(null,"Brussel-Paris","2020/01/02","10:00:00","2020/01/02","11:00:00",3,2,1),
(null,"Paris-Pointe a Pitre","2019/12/25","11:50:00","2019/12/25","20:00:00",1,3,4),
(null,"Pointe a Pitre-Paris","2019/12/26","18:50:00","2019/12/27","06:00:00",4,3,1),
(null,"Paris-Luxembourg","2020/01/06","13:00:00","2020/01/06","16:00:00",1,4,5),
(null,"Luxembourg-Paris","2020/01/06","17:00:00","2020/01/06","20:00:00",5,4,1),
(null,"Paris-Miami","2020/06/30","13:00:00","2020/06/31","22:00:00",1,5,6),
(null,"Miami-Paris","2020/07/01","12:00:00","2020/07/01","21:00:00",6,5,1);
insert into vol values (null,"Paris-Bangkok","2020/01/06","10:00:00","2020/01/06","21:00:00",1,6,7),
(null,"Bangkok-Paris","2020/01/07","10:00:00","2020/01/07","21:00:00",7,6,1),
(null,"Bangkok-Phnom Penh","2020/01/07","09:00:00","2019/01/07","10:00:00",7,7,8),
(null,"Phnom Penh-Bangkok","2020/01/07","12:00:00","2020/01/07","13:00:00",8,7,7),
(null,"Paris-Hong Kong","2019/12/15","11:30:00","2019/12/16","23:00:00",1,8,9),
(null,"Hong Kong-Paris","2019/12/16","10:00:00","2020/12/16","22:00:00",9,8,1),
(null,"Paris-Tokyo","2019/12/17","09:00:00","2019/12/18","20:50:00",1,9,10),
(null,"Tokyo-Paris","2019/12/18","10:00:00","2019/12/18","21:00:00",10,9,1);
insert into vol values (null,"Paris-Madrid","2019/12/18","09:00:00","2019/12/18","20:50:00",1,10,11),
(null,"Madrid-Paris","2019/12/19","08:00:00","2020/12/16","20:00:00",11,10,1),
(null,"Paris-Berlin","2019/12/19","15:00:00","2019/12/19","16:50:00",1,11,12),
(null,"Berlin-Paris","2019/12/20","08:00:00","2020/12/20","10:00:00",12,11,1),
(null,"Paris-Los angeles","2019/12/17","09:00:00","2019/12/18","20:50:00",1,12,13),
(null,"los angeles-Paris","2019/12/19","08:00:00","2020/12/19","20:00:00",13,12,1),
(null,"Paris-PortLouis","2019/12/18","11:30:00","2019/12/18","19:00:00",1,13,14),
(null,"PortLouis-Paris","2019/12/19","08:00:00","2020/12/16","16:00:00",14,13,1),
(null,"Paris-Rabat","2020/12/19","09:00:00","2020/12/19","15:50:00",1,14,15);
insert into vol values (null,"Rabat-Paris","2019/12/20","20:00:00","2020/12/21","04:00:00",15,14,1),
(null,"Paris-Riyad","2021/05/17","18:00:00","2021/05/18","20:50:00",1,15,16),
(null,"Riyad-Paris","2021/05/19","08:00:00","2020/12/16","11:00:00",16,15,1),
(null,"Paris-Mexico","2019/12/25","15:00:00","2019/12/26","01:00:00",1,16,17),
(null,"Mexico-Paris","2019/12/19","08:00:00","2020/12/16","20:00:00",17,16,1),
(null,"Paris-Moscou","2021/12/25","10:00:00","2021/12/26","23:00:00",1,17,18),
(null,"Moscou-Paris","2021/12/26","10:00:00","2021/12/26","23:00:00",18,17,1);
insert into vol values (null,"Paris-Sénégal","2020/06/25","19:00:00","2019/06/26","01:00:00",1,18,19),
(null,"Sénégal-Paris","2020/06/26","16:00:00","2020/06/26","22:00:00",19,18,1),
(null,"Paris-Londres","2021/07/15","08:00:00","2021/07/15","10:00:00",1,19,20),
(null,"Londres-Paris","2021/12/25","10:00:00","2021/12/26","23:00:00",20,19,1),
(null,"Paris-Ottawa","2021/03/12","10:00:00","2021/03/12","23:00:00",1,20,21),
(null,"Ottawa-Paris","2021/12/25","12:00:00","2021/12/26","01:00:00",21,20,1),
(null,"Paris-Brasilia","2021/04/04","10:00:00","2021/04/05","22:00:00",1,21,22),
(null,"Brasilia-Paris","2021/04/05","11:00:00","2021/04/05","23:00:00",22,21,1);
insert into vol values (null,"Paris-Alger","2021/06/05","11:00:00","2021/06/05","20:00:00",1,22,23),
(null,"Alger-Paris","2021/06/06","13:00:00","2021/06/06","22:00:00",23,22,1),
(null,"Paris-Canberra","2021/08/15","11:00:00","2021/08/15","20:00:00",1,23,24),
(null,"Canberra-Paris","2021/08/16","19:00:00","2021/08/17","06:00:00",24,23,1);
insert into vol values (null,"Paris-Séoul","2022/06/05","11:00:00","2022/06/06","23:00:00",1,24,25),
(null,"Séoul-Paris","2021/06/06","00:00:00","2021/06/07","12:00:00",25,24,1),
(null,"Paris-Pékin","2021/10/25","22:00:00","2021/10/26","11:00:00",1,25,26),
(null,"Pékin-Paris","2021/10/26","11:00:00","2021/06/27","00:00:00",26,25,1);

/*Les aeroports*/
insert into aeroport values 
(1,"Aéroport Charles De Gaulle","Paris"),
(2,"Aéroport Marseille Provence","Marseille"),
(3,"Aéroport de Brussels","Belgique"),
(4,"Aéroport de Pointe-é-Pitre Le Raizet","Guadeloupe"),
(5,"Aéroport de Luxembourg","Luxembourg"),
(6,"Aéroport international de Miami","Etats unis"),
(7,"Aéroport Suvarnabhumi de Bangkok","Thailand"),
(8,"Aéroport de Phnom Penh","Cambodge"),
(9,"Aéroport international de Hong Kong","Hong Kong"),
(10,"Aéroport international de Tokyo-Haneda","Japon"),
(11,"Aéroport Adolfo-Suérez de Madrid-Barajas","Espagne"),
(12,"Aéroport de Berlin Schénefeld","Allemagne"),
(13,"Aéroport international de Los Angeles","Etats unis"),
(14,"Aéroport international Sir Seewoosagur Ramgoolam","Ile Maurice"),
(15,"Aéroport de Rabat-Salé","Maroc"),
(16,"Aéroport du Roi khaled","Riyad, Arabie Saoudite"),
(17,"Aéroport International de Mexico","Mexique"),
(18,"Aéroport de Moscou-Cheremetievo","Russie"),
(19,"Aéroport de Dakar-Blaise Diagne","Senegale"),
(20,"Aéroport de Londres Heathrow","Angleterre"),
(21,"Aéroport Macdonald-Cartier d'Ottawa","Canada"),
(22,"Aéroport international Presidente Juscelino Kubitschek","Brésil"),
(23,"Aéroport d'Alger - Houari Boumédiéne","Algérie"),
(24,"Aéroport de Canberra","Australie"),
(25,"Aéroport international d'Incheon","Corée du sud"),
(26,"Aéroport international de Pékin","Chine");

/*les avions*/
insert into avion values 
(1,"Aurora","700"),
(2,"Airbus 911","500"),
(3,"Aurora 105","740"),
(4,"Boeing 526","800"),
(5,"Airbus A670","580"),
(6,"Reclaimer S600","1000"),
(7,"Airbus A450","650"),
(8,"F7C Hornet","800"),
(9,"Andromeda","900"),
(10,"Aquila","760"),
(11,"Terrapin","750"),
(12,"Pathfinder","560");
insert into avion values
(13,"Polaris","520"),
(14,"Corvette","660"),
(15,"Hurricane","520"),
(16,"Khartu-Al","540"),
(17,"Starfarer","540"),
(18,"Avenge","660"),
(19,"Buccaneer","630"),
(20,"Titan","630"),
(21,"Gladius","450"),
(22,"P-52 Merlin","360"),
(23,"Carrack","140"),
(24,"Redeemer","120"),
(25,"Javelin","360");


/*logement*/
INSERT INTO logement VALUES (1,"43 rue du Docteur Variot 93110","2019-12-06","2020-01-01","Bien","Han Lee", "62","105");
INSERT INTO logement VALUES (2,"8 Bis Avenue du clocher 93130","2019-12-22","2020-02-29","Propre","Jean Gabriel","75","265");
INSERT INTO logement VALUES (3,"92 Rue raspail 75000","13-01-2020","04-02-2020","Passable","Ibis Hotel","60","102");
INSERT INTO logement VALUES (4,"105 Rue John Kennedy 75015","2020-01-18","2020-02-29","Bien","Zack Rodriguez","102","450");
INSERT INTO logement VALUES (5,"13 Rue Victor Hugo 94215","2020-02-24","2020-03-15","Passable","Hotel Mercure","75","235");
INSERT INTO logement VALUES (6,"100 Queen Street West Toronto ON M5H 2N2, Canada","2020-02-05","2020-03-18","Purification","Diane Walton","110","560");
INSERT INTO logement VALUES (7,"77 Greenville Street, 9th Floor Toronto, Ontario, M5S 1B3","2019-12-02","2020-01-12","Graisse","Laurence Juillivet","92","256");
INSERT INTO logement VALUES (8,"517 Westport Ave.Orlando FL 32835","2019-11-04","2019-12-26","Graisse","Todd Momoa","70","352");
INSERT INTO logement VALUES (9,"255 Ontario Street Militon ON L9I","2019-09-20","2019-12-18","Rempli","Hotel Califor,ia","88","1050");
INSERT INTO logement VALUES (10,"Nonhyeon dong, Gangnam-gu, Seoul 135-010","2020-02-25","2020-03-21","Bien","Yong Deung Po-ku","28","1000");
INSERT INTO logement VALUES (11,"100 Sejongno, Jongno-gu, Seoul 0314","2019-05-13","2019-06-24","Passable","Hong Kil Dong","96","10200");
INSERT INTO logement VALUES (12,"Hana Apartements, 9th floor, Apt. 912, Seoul 2-Dong, Yongsan-gu, Seoul 135-283","2019-07-23","2019-09-23","Propre","Minho Park","1","850");
INSERT INTO logement VALUES (13,"Carrer de la lletra k, 08040 Barcelona","2019-05-26","2019-06-06","Propre","Diego Blanco","250","10805");
INSERT INTO logement VALUES (14,"Av. de elche 166, 03006 Alicante","2018-12-01","2019-01-01","Rempli","Hotel Port Denia","62","665");
INSERT INTO logement VALUES (15,"Carrer de Guipiuseoca, 08930 Saint Andria de Besos","2019-03-03","2019-03-28","Terni","Luis Palacios","93","1629");
INSERT INTO logement VALUES (16,"Musterstrabe 1240 Wie, Osterreich","2018-05-23","2018-06-26","Passable","Max Mustermann","100","1520");
INSERT INTO logement VALUES (17,"Orehbahn 47-48, 20854 Hamboourg, Allemagne","2019-06-02","2019-06-26","Rempli","Anne Horn","99","1990");
INSERT INTO logement VALUES (18,"Ouacholdeerweg 52a, 26133 Oldenbourg, Allemagne","19-10-2019-10-19","25-10-2019-10-25","Propre","Dario Alessandro Barbanti-Flick","210","2301");
INSERT INTO logement VALUES (19,"2 rue d'Indépendance, 16027 Alegiers, Algeria","2019-07-30","2019-08-10","Graisse","Said Mohammed","15","261");
INSERT INTO logement VALUES (20,"56 Broomfield Macroom CO. Cork, 37I8 Ireland","2019-07-31","2019-08-28","Passable","Michel Sullivan","115","2162");
INSERT INTO logement VALUES (21,"12 Avenue Cheikh Anta Diop, 12500 Senegal","2019-05-05","2019-06-19","Terni","Amadou Diop","56","123");
INSERT INTO logement VALUES (22,"201 Springfield, Untied States of America","2019-02-19","2019-03-29","Propre","Tevis Jason","120","1500");
INSERT INTO logement VALUES (23,"Truygguagötu 5, 220 Hafnarifirdi, Iceland","2019-06-22","2019-08-12","Passable","Guömundor Armasson","110","2056");
INSERT INTO logement VALUES (24,"Solothurnstrasse 28, 2544 Bettlach, Switzland","2019-01-18","2019-02-06","Bien","Hotel National Zermatt","98","559");
INSERT INTO logement VALUES (25,"27 Andilina, Triq San Guzepp, 1073 Malta","2019-11-20","2019-12-20","Passable","Dolmen Hotel","153","511");


/*logement-service*/
insert into service values (null,"location appartement");
insert into service values (null,"location maison");
insert into service values (null,"location hotel");
insert into service values (null,"location maison");
insert into service values (null,"location hotel");
insert into service values (null,"location maison");
insert into service values (null,"location appartement");
insert into service values (null, "location appartement");
insert into service values (null, "location hotel");
insert into service values (null,"location appartement");
insert into service values (null,"location maison");
insert into service values (null,"location appartement");
insert into service values (null,"location maison");
insert into service values (null,"location hotel");
insert into service values (null,"location maison");
insert into service values (null,"location appartement");
insert into service values (null,"location appartement");
insert into service values (null,"location maison");
insert into service values (null,"location maison");
insert into service values (null,"location appartement");
insert into service values (null,"location maison");
insert into service values (null,"location maison");
insert into service values (null,"location appartement");
insert into service values (null,"location hotel");
insert into service values (null,"location hotel");


/*promotion*/
INSERT INTO promotion VALUES (1,"50%");
INSERT INTO promotion VALUES (2,"10%");
INSERT INTO promotion VALUES (3,"5%");
INSERT INTO promotion VALUES (4,"25%");
INSERT INTO promotion VALUES (5,"80%");
INSERT INTO promotion VALUES (6,"50%",);
INSERT INTO promotion VALUES (7,"25%");
INSERT INTO promotion VALUES (8,"50%");
INSERT INTO promotion VALUES (9,"20%");
INSERT INTO promotion VALUES (10,"5%");
INSERT INTO promotion VALUES (11,"70%");
INSERT INTO promotion VALUES (12,"5%");
INSERT INTO promotion VALUES (13,"10%");
INSERT INTO promotion VALUES (14,"30%");
INSERT INTO promotion VALUES (15,"30%");
INSERT INTO promotion VALUES (16,"50%");
INSERT INTO promotion VALUES (17,"50%");
INSERT INTO promotion VALUES (18,"70%");
INSERT INTO promotion VALUES (19,"80%");
INSERT INTO promotion VALUES (20,"15%");
INSERT INTO promotion VALUES (21,"25%");
INSERT INTO promotion VALUES (22,"60%");
INSERT INTO promotion VALUES (23,"60%");
INSERT INTO promotion VALUES (24,"10%");
INSERT INTO promotion VALUES (25,"5%");
INSERT INTO promotion VALUES (26,"30%");
INSERT INTO promotion VALUES (27,"10%");
INSERT INTO promotion VALUES (28,"20%");
INSERT INTO promotion VALUES (29,"10%");
INSERT INTO promotion VALUES (30,"50%");
INSERT INTO promotion VALUES (31,"70%");
INSERT INTO promotion VALUES (32,"60%");
INSERT INTO promotion VALUES (33,"80%");
INSERT INTO promotion VALUES (34,"40%");
INSERT INTO promotion VALUES (35,"60%");
INSERT INTO promotion VALUES (36,"10%");
INSERT INTO promotion VALUES (37,"15%");
INSERT INTO promotion VALUES (38,"5%");
INSERT INTO promotion VALUES (39,"15%");
INSERT INTO promotion VALUES (40,"60%");
INSERT INTO promotion VALUES (41,"50%");
INSERT INTO promotion VALUES (42,"50%");
INSERT INTO promotion VALUES (43,"70%");
INSERT INTO promotion VALUES (44,"30%");
INSERT INTO promotion VALUES (45,"10%");
INSERT INTO promotion VALUES (46,"5%");
INSERT INTO promotion VALUES (47,"15%");
INSERT INTO promotion VALUES (48,"20%");
INSERT INTO promotion VALUES (49,"5%");
INSERT INTO promotion VALUES (50,"35%");

/*promotion-service*/
insert into service values (null,"Xbox");
insert into service values (null,"Ubisoft");
insert into service values (null,"Sony");
insert into service values (null,"AGEFOS PME");
insert into service values (null,"AGIRC-ARRCO");
insert into service values (null,"AFT");
insert into service values (null,"AFNOR");
insert into service values (null,"AJE");
insert into service values (null,"ANFA");
insert into service values (null,"AOCDTF");
insert into service values (null,"CASDEN");
insert into service values (null,"CCCA-BTP");
insert into service values (null,"CJD");
insert into service values (null,"CISCO");
insert into service values (null,"CGI" )
insert into service values (null,"CGPME");
insert into service values (null,"DCF");
insert into service values (null,"ECTI");
insert into service values (null,"EDF");
insert into service values (null,"ERDF");
insert into service values (null,"ENACTUS");
insert into service values (null,"ENGIE");
insert into service values (null,"EGEE");
insert into service values (null,"EPA");
insert into service values (null,"Euro-France Association");
insert into service values (null,"FAFIEC");
insert into service values (null,"FAFIH");
insert into service values (null,"FAFSEA");
insert into service values (null,"FEP");
insert into service values (null,"FNTP");
insert into service values (null,"FVD");
insert into service values (null,"Fondation Croissance Responsable");
insert into service values (null,"Fondation d'entreprise KPMG France");
insert into service values (null,"France Industrie");
insert into service values (null,"GRDF");
insert into service values (null,"Ingénieur pour l'école");
insert into service values (null,"INTERGOS");
insert into service values (null,"JOBIRL");
insert into service values (null,"L'ESPER");
insert into service values (null,"Ministère de l'Économie et des Finances");
insert into service values (null,"MEDEF");
insert into service values (null,"OPCA DEFI");
insert into service values (null,"OPCALIA");
insert into service values (null,"OPCALIM");
insert into service values (null,"OPCA Transports et Services");
insert into service values (null,"OPCA 3+");
insert into service values (null,"OPPBTP");
insert into service values (null,"RENAULT");
insert into service values (null,"SAFRAN");
insert into service values (null,"SCHNEIDER ELECTRIC FRANCE");
insert into service values (null,"Xiaomi");


/*location de voiture pour les clients*/
INSERT INTO location VALUES ("AA572BF","01","A louer","2019-12-06","2020-01-01","1540",1);
INSERT INTO location VALUES ("AX589PF","02","Reserver","2019-12-22","2019-02-25","2680",2);
INSERT INTO location VALUES ("EF965TH","03","Reserver","2020-01-13","2020-02-04","1578",3);
INSERT INTO location VALUES ("LH584PR","04","A louer","2020-01-18","2020-02-29","1861",4);
INSERT INTO location VALUES ("MH846ZE","05","A louer","2020-02-24","2020-03-15","1645",5);
INSERT INTO location VALUES ("FT562TY","06","Reserver","2020-02-05","2020-03-18","1245",6);
INSERT INTO location VALUES ("RE646SD","07","Reserver","2019-12-02","2020-01-12","1656",7);
INSERT INTO location VALUES ("FE946QS","08","A louer","2019-11-04","2019-12-26","1325",8);
INSERT INTO location VALUES ("DF564FE","09","A louer","2019-09-20","2019-12-18","1333",9);
INSERT INTO location VALUES ("FQ666FA","10","A louer","2019-02-25","2019-12-18","2264",10);
INSERT INTO location VALUES ("FE956EL","11","Reserver","2019-05-13","2019-06-24","1632",11);
INSERT INTO location VALUES ("DF996FZ","12","A louer","2019-07-23","2019-09-23","1555",12);
INSERT INTO location VALUES ("DS868FT","13","A louer","2019-05-26","2019-06-06","946",13);
INSERT INTO location VALUES ("KJ695VH","14","A Reserver","2018-12-01","2019-01-01","2664",14);
INSERT INTO location VALUES ("FK656FA","15","A louer","2019-03-03","2019-03-28","558",15);
INSERT INTO location VALUES ("FE515VE","16","A louer","2018-05-23","2018-06-26","999",16);
INSERT INTO location VALUES ("GE546FZ","17","Reserver","2019-06-02","2019-06-26","526",17);
INSERT INTO location VALUES ("QD945QA","18","A louer","2019-10-19","2019-10-25","696",18);
INSERT INTO location VALUES ("DA844ZA","19","Reserver","2019-07-30","2019-08-10","1597",19);
INSERT INTO location VALUES ("FF586AF","20","Reserver","2019-07-31","2019-08-28","1698",20);
INSERT INTO location VALUES ("FA878AR","21","A louer","2019-05-05","2019-06-19","1566",21);
INSERT INTO location VALUES ("DF556SD","22","Reserver","2019-02-19","2019-02-29","265",22);
INSERT INTO location VALUES ("FZ564ZEF","23","A louer","2019-02-22","2019-08-12","2569",23);
INSERT INTO location VALUES ("ZZ946ZR","24","Reserver","2019-01-18","2019-12-06","5693",24);
INSERT INTO location VALUES ("AE869FE","25","Reserver","2019-11-20","2019-12-20","865",25);
INSERT INTO location VALUES ("FZ466AR","26","A louer","2019-04-05","2019-04-30","685",26);
INSERT INTO location VALUES ("ZE845ZE","27","Reserver","2020-05-18","2020-06-22","1695",27);
INSERT INTO location VALUES ("ZA616ZE","28","A louer","2019-01-03","2019-01-20","455",28);
INSERT INTO location VALUES ("EJ268ZF","29","Reserver","2019-02-20","2019-02-29","655",29);
INSERT INTO location VALUES ("ZAE99ZD","30","A louer","2020-02-25","2020-03-03","699",30);
INSERT INTO location VALUES ("ZZP86DZ","31","A louer","2020-03-04","2020-03-20","696",31);
INSERT INTO location VALUES ("AEZA650","32","Reserver","2020-03-15","2020-04-20","989",32);
INSERT INTO location VALUES ("AEGZM65","33","A louer","2020-04-28","2020-05-05","1986",33);
INSERT INTO location VALUES ("RK458AE","34","A louer","2019-05-18","2019-05-30","599",34);
INSERT INTO location VALUES ("EK559DA","35","A louer","2019-05-22","2019-06-15","1289",35);
INSERT INTO location VALUES ("SF463FB","36","Reserver","2019-09-01","2019-09-05","596",36);
INSERT INTO location VALUES ("ZAE5946","37","Reserver","2020-04-10","2020-05-06","1996",37);
INSERT INTO location VALUES ("ADZ888F","38","A louer","2019-10-03","2019-11-03","1693",38);
INSERT INTO location VALUES ("AZE595F","39","Reserver","2019-12-08","2019-12-23","546",39);
INSERT INTO location VALUES ("AK659F5","40","A louer","2020-11-22","2020-12-03","569",40);
INSERT INTO location VALUES ("AZE9566","41","Reserver","2019-06-06","2019-06-28","110",41);
INSERT INTO location VALUES ("AZ959ZD","42","Reserver","2019-08-08","2019-08-26","663",42);
INSERT INTO location VALUES ("AF366FE","43","A louer","2020-10-01","2020-10-20","668",43);
INSERT INTO location VALUES ("AZE69FF","44","A louer","2020-01-12","2020-01-24","259",44);
INSERT INTO location VALUES ("AD563DA","45","A louer","2019-12-22","2019-02-25","6992",45);
INSERT INTO location VALUES ("VDD8896","46","Reserver","2019-06-05","2019-07-26","6693",46);


/*location-service*/
insert into service values (null,"Tang");
insert into service values (null,"Walter");
insert into service values (null,"Hyu");
insert into service values (null,"Howell");
insert into service values (null,"Price");
insert into service values (null,"Holl");
insert into service values (null,"Alexander");
insert into service values (null,"Alexander");
insert into service values (null,"Alexander");
insert into service values (null,"Alexander");
insert into service values (null,"William");
insert into service values (null,"Webb");
insert into service values (null,"Baker");
insert into service values (null,"Morris");
insert into service values (null,"Smith");
insert into service values (null,"Evan");
insert into service values (null,"Loire");
insert into service values (null,"Dubois");
insert into service values (null,"Folive");
insert into service values (null,"Lefevre");
insert into service values (null,"Chestant");
insert into service values (null,"Achar");
insert into service values (null,"Gardes");
insert into service values (null,"Cohen");
insert into service values (null,"Becker");
insert into service values (null,"Cooper");
insert into service values (null,"Launey");
insert into service values (null,"Jacobs");
insert into service values (null,"Colemann");
insert into service values (null,"Newmann");
insert into service values (null,"Orlando");
insert into service values (null,"Jose");
insert into service values (null,"Silva");
insert into service values (null,"Olieira");
insert into service values (null,"Thuma");
insert into service values (null,"Eau");
insert into service values (null,"Morisse");
insert into service values (null,"Adam");
insert into service values (null,"Yves");
insert into service values (null,"Jean");
insert into service values (null,"Jault");
insert into service values (null,"Becker");
insert into service values (null,"Cooper");
insert into service values (null,"Voili");
insert into service values (null,"Nolan");
insert into service values (null,"Yuga");
insert into service values (null,"Eiti");
insert into service values (null,"Moussa");
insert into service values (null,"Walter");


/*partenaire*/
insert into partenaire values (null,"xbox","39 Quai du Président Roosevelt 92130",1);
insert into partenaire values (null,"ubisoft","126 Rue de Lagny 93100",2);
insert into partenaire values (null,"sony","92 Avenue de Wagram 75017",3);
insert into partenaire values (null,"AGEFOS PME","187 quai de Valmy 75010",4);
insert into partenaire values (null,"AGIRC-ARRCO","16-18 rue Jules César 75012",5);
insert into partenaire values (null,"AFT","82 rue Cardinet 75017",6);
insert into partenaire values (null,"AFNOR","11 rue Francis de Pressensé 93571 ",7);
insert into partenaire values (null,"AJE","4 rue Léo Delibes 75116 ",8);
insert into partenaire values (null,"ANFA","41-49 rue de la Garenne 92315",9);
insert into partenaire values (null,"AOCDTF","82 rue de l'Hôtel de Ville 75180",10);
insert into partenaire values (null,"CASDEN","91 cours des roches 77424",11);
insert into partenaire values (null,"CCCA-BTP","19 rue du Père Corentin 75680",12);
insert into partenaire values (null,"CJD","19 avenue Georges V 75008",13);
insert into partenaire values (null,"CISCO","11 rue Camille Desmoulins 92782",14);
insert into partenaire values (null,"CGI","18 rue des Pyramides 75001",15);
insert into partenaire values (null,"CGPME","10 terrasse Bellini 92800",16);
insert into partenaire values (null,"DCF","1 villa Georges Sand 75016",17);
insert into partenaire values (null,"ECTI","101-109 rue Jean Jaurès 92300",18);
insert into partenaire values (null,"EDF","22-30 avenue de Wagram 75008",19);
insert into partenaire values (null,"ERDF","102 Terrasse Boieldieu 92085",20);
insert into partenaire values (null,"ENACTUS","204 rue de Crimée 75019",21);
insert into partenaire values (null,"ENGIE","Faubourg de l'Arche 92930",22);
insert into partenaire values (null,"EGEE","14 villa de Lourcine 75014",23);
insert into partenaire values (null,"EPA","32, rue du Faubourg Poissonnière 75010",24);
insert into partenaire values (null,"Euro-France Association","266 avenue Daumesnil 75012",25);
insert into partenaire values (null,"FAFIEC","25 quai Panhard et Levassor 75013",26);
insert into partenaire values (null,"FAFIH","3 rue de la Ville l'Évêque 75008",27);
insert into partenaire values (null,"FAFSEA","53 rue de la Pompe 75179",28);
insert into partenaire values (null,"FEP","34 boulevard Maxime Gorki 94800",29);
insert into partenaire values (null,"FNTP","3 Rue de Berri 75008",30);
insert into partenaire values (null,"FVD","100 avenue du président Kennedy 75016",31);
insert into partenaire values (null,"Fondation Croissance Responsable","33 boulevard Malesherbes 75008",32);
insert into partenaire values (null,"Fondation d'entreprise KPMG France","Immeuble Le Palatin 3 cours du Triangle 92939",33);
insert into partenaire values (null,"France Industrie","17 rue de l'Amiral Hamelin 75116",34);
insert into partenaire values (null,"GRDF","6 rue Condorcet 75009",35);
insert into partenaire values (null,"Ingénieurs Pour l'Ecole","15 rue Beaujon 75008",36);
insert into partenaire values (null,"INTERGROS","18 rue des Pyramides 75001",37);
insert into partenaire values (null,"JOBIRL","10 rue de Villiers 92300",38);
insert into partenaire values (null,"L'ESPER","3 square Max HYMANS 75015",39);
insert into partenaire values (null,"Ministère de l'Économie et des Finances","139 rue de Bercy 75572",40);
insert into partenaire values (null,"MEDEF","55 avenue Bosquet 75330",41);
insert into partenaire values (null,"OPCA DEFI","57 avenue du Général de Gaulle 94166",42);
insert into partenaire values (null,"OPCALIA","47 rue de la Victoire 75009",43);
insert into partenaire values (null,"OPCALIM","20 place des vins de France 76603",44);
insert into partenaire values (null,"OPCA Transports et Services","66 avenue du Maine 75996",45);
insert into partenaire values (null,"OPCA 3+","55 rue du Châteaudun 75009 ",46);
insert into partenaire values (null,"OPPBTP","25 avenue du Général Leclerc 92660",47);
insert into partenaire values (null,"RENAULT","13 - 15 Quai Le Gallo 92100",48);
insert into partenaire values (null,"SAFRAN","2 bd du Général Martial Valin 75724",49);
insert into partenaire values (null,"SCHNEIDER ELECTRIC FRANCE","35 rue Joseph Monnier 92500",50);
