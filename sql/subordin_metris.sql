-- phpMyAdmin SQL Dump
-- version 2.6.1-pl2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jul 13, 2005 at 01:38 PM
-- Server version: 4.0.22
-- PHP Version: 4.3.11
-- 
-- Database: `subordin_metris`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `counter`
-- 

CREATE TABLE `counter` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `count` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `counter`
-- 

INSERT INTO `counter` VALUES (1, 'generer', 2370);

-- --------------------------------------------------------

-- 
-- Table structure for table `dikt`
-- 

CREATE TABLE `dikt` (
  `dikt_id` int(11) NOT NULL auto_increment,
  `tittel` varchar(255) default NULL,
  `lang` text NOT NULL,
  `diktsamling_id` int(11) default NULL,
  PRIMARY KEY  (`dikt_id`)
) TYPE=MyISAM AUTO_INCREMENT=17 ;

-- 
-- Dumping data for table `dikt`
-- 

INSERT INTO `dikt` VALUES (1, 'Rest in Peace', 'no', 1);
INSERT INTO `dikt` VALUES (2, 'En sommerfugl', 'no', 1);
INSERT INTO `dikt` VALUES (3, 'Tribute to a Butterfly', 'no', 1);
INSERT INTO `dikt` VALUES (4, 'Mørkets tjener', 'no', 2);
INSERT INTO `dikt` VALUES (5, 'De spurte meg', 'no', 2);
INSERT INTO `dikt` VALUES (6, 'Pray &#8230;', 'en', 2);
INSERT INTO `dikt` VALUES (7, 'Joker', 'no', 2);
INSERT INTO `dikt` VALUES (8, 'Aldri min', 'no', 2);
INSERT INTO `dikt` VALUES (9, 'Jeg har sett &#8230;', 'no', 2);
INSERT INTO `dikt` VALUES (10, 'Det svarte rommet', 'no', 2);
INSERT INTO `dikt` VALUES (11, 'Jeg er ikke redd &#8230;', 'no', 2);
INSERT INTO `dikt` VALUES (12, '&#8230;', 'no', 2);
INSERT INTO `dikt` VALUES (13, 'Hvis &#8230;', 'no', 2);
INSERT INTO `dikt` VALUES (14, 'Mot et liv &#8230;', 'no', 3);
INSERT INTO `dikt` VALUES (15, 'She laughs, he cries', 'en', 3);
INSERT INTO `dikt` VALUES (16, 'Melankoli &#8230;', 'no', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `diktsamling`
-- 

CREATE TABLE `diktsamling` (
  `diktsamling_id` int(11) NOT NULL auto_increment,
  `Tittel` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`diktsamling_id`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `diktsamling`
-- 

INSERT INTO `diktsamling` VALUES (1, 'The Dungeon of Metris');
INSERT INTO `diktsamling` VALUES (2, 'Servant of Darkness');
INSERT INTO `diktsamling` VALUES (3, '«Blink-dagboka»');

-- --------------------------------------------------------

-- 
-- Table structure for table `typer`
-- 

CREATE TABLE `typer` (
  `type` text NOT NULL,
  `beskrivelse` varchar(255) NOT NULL default ''
) TYPE=MyISAM;

-- 
-- Dumping data for table `typer`
-- 

INSERT INTO `typer` VALUES ('H', 'Uavhengig linje');
INSERT INTO `typer` VALUES ('R', 'Referanse');
INSERT INTO `typer` VALUES ('Q', 'Sitat');

-- --------------------------------------------------------

-- 
-- Table structure for table `vers`
-- 

CREATE TABLE `vers` (
  `vers_id` int(11) NOT NULL auto_increment,
  `linje` varchar(255) NOT NULL default '',
  `type` text NOT NULL,
  `slutt` varchar(255) default NULL,
  `nynorsk` varchar(255) default NULL,
  `linjenr` int(11) NOT NULL default '0',
  `dikt_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vers_id`)
) TYPE=MyISAM AUTO_INCREMENT=144 ;

-- 
-- Dumping data for table `vers`
-- 

INSERT INTO `vers` VALUES (1, 'Det blåser en vind så kald,', 'H', 'M,2,13,38,45,85,113', 'Det blæs ein vind så kald,', 1, 1);
INSERT INTO `vers` VALUES (2, 'At selv døden fryser.', 'R', 'H,44,45', 'At sjølv dauden frys.', 2, 1);
INSERT INTO `vers` VALUES (3, 'Skyggene er mørkere enn vanlig', 'H', '', 'Skuggane er mørkare enn vanleg', 3, 1);
INSERT INTO `vers` VALUES (4, 'Månen &#8230; knallrød.', 'H', 'H,45,74', 'Månen &#8230; knallraud.', 4, 1);
INSERT INTO `vers` VALUES (5, 'Tårene rant ikke.', 'H', 'H,44', 'Tårene rann ikkje.', 5, 1);
INSERT INTO `vers` VALUES (6, 'De frøs til is halvveis i kinnet.', 'R', 'H,44', 'Dei fraus til is halvvegs i kinnet.', 6, 1);
INSERT INTO `vers` VALUES (7, 'Det luktet svovel &#8230;', 'H', 'H,131', 'Det anga svovel &#8230;', 7, 1);
INSERT INTO `vers` VALUES (8, 'Man hørte lyder.', 'H', '', 'Ein høyrde ljodar.', 8, 1);
INSERT INTO `vers` VALUES (9, 'Kvalte skrik, dryppende blod.', 'H', 'H,131', 'Kjøvde skrik, drypande blod.', 9, 1);
INSERT INTO `vers` VALUES (10, 'Men akkurat som tårene,', 'M', '11', 'Men nett som tårene,', 10, 1);
INSERT INTO `vers` VALUES (11, 'Hadde følelsene også frosset fast &#8230;', 'R', '', 'Hadde kjenslene òg frose fast &#8230;', 11, 1);
INSERT INTO `vers` VALUES (12, 'Det blåser en kald vind &#8230;', 'H', 'M,13,38,45,85,113', 'Det blæs ein kald vind &#8230;', 1, 2);
INSERT INTO `vers` VALUES (13, 'Som får selv døden til å fryse.', 'R', 'H,44', 'Som får sjølv dauden til å frysa.', 2, 2);
INSERT INTO `vers` VALUES (14, 'Tårer renner ikke &#8230; kjærligheten er død.', 'H', 'H,44', 'Tårer renn ikkje &#8230; kjærleiken er daud.', 3, 2);
INSERT INTO `vers` VALUES (15, 'Jeg hører skrik. Kvalte skrik.', 'H', 'H,131', 'Eg høyrer skrik. Kjøvde skrik.', 4, 2);
INSERT INTO `vers` VALUES (16, 'Kjedet du ga meg, jenta mi &#8230;', 'H', '7,17,32,81,97,114', 'Kjeda du gav meg, jenta mi &#8230;', 5, 2);
INSERT INTO `vers` VALUES (17, 'Jeg har det fortsatt.', 'R', '', 'Eg har ho framleis.', 6, 2);
INSERT INTO `vers` VALUES (18, 'Men først nå skjønner jeg dine valg.', 'M', '', 'Men fyrst no skjønar eg vala dine.', 7, 2);
INSERT INTO `vers` VALUES (19, 'Først nå skjønner jeg hvem den skyldige var &#8230;', 'H', 'H,130', 'Fyrst no skjønar eg kven den skuldige var &#8230;', 8, 2);
INSERT INTO `vers` VALUES (20, '«Sjelen døde før legemet &#8230; drept av den hun elsket mest.»', 'Q', 'H,61', '«Sjela døydde før lekamen &#8230; drepen av den ho elska mest.»', 9, 2);
INSERT INTO `vers` VALUES (21, 'Beklager, min sommerfugl &#8230;', 'H', '', 'Orsak, sommarfuglen min &#8230;', 10, 2);
INSERT INTO `vers` VALUES (22, 'Beklager alt!', 'H', '', 'Lei for alt!', 11, 2);
INSERT INTO `vers` VALUES (23, 'Vinden blåser fremdeles.', 'H', 'H,45,50', 'Vinden blæs framleis.', 1, 3);
INSERT INTO `vers` VALUES (24, 'Like kaldt, like stille &#8230;', 'H', 'H,42', 'Like kaldt, like stilt &#8230;', 2, 3);
INSERT INTO `vers` VALUES (25, 'Jeg er nå voksen.', 'H', 'H,26,131,142', 'Eg er no vaksen.', 3, 3);
INSERT INTO `vers` VALUES (26, 'Det var du også.', 'R', '', 'Det var du òg.', 4, 3);
INSERT INTO `vers` VALUES (27, 'Jeg har prøvd å komme videre &#8230;', 'H', 'H,M,28,29,30,122,130', 'Eg har freista å koma vidare &#8230;', 5, 3);
INSERT INTO `vers` VALUES (28, 'Med mitt liv.', 'R', 'H,122,130', 'Med livet mitt.', 6, 3);
INSERT INTO `vers` VALUES (29, 'Men nei, det krever altfor mye.', 'M', 'H,131', 'Men nei, det krev altfor mykje.', 7, 3);
INSERT INTO `vers` VALUES (30, 'Glemme deg, blodet, lyden, skrikene &#8230;', 'H', '', 'Gløyma deg, blodet, ljoden, skrika &#8230;', 8, 3);
INSERT INTO `vers` VALUES (31, 'Dybden, kjærligheten &#8230; halskjedet.', 'H', 'H,16,32,42,97', 'Djupna, kjærleiken &#8230; halsbandet.', 9, 3);
INSERT INTO `vers` VALUES (32, 'Ja, vennen. Disse to delfinene jeg bærer ved hjertet.', 'R', '', 'Jau, venen. Desse to delfinane eg ber ved hjartet.', 10, 3);
INSERT INTO `vers` VALUES (33, '«Kjærlighet» og «vennskap».', 'Q', '', '«Kjærleik» og «venskap».', 11, 3);
INSERT INTO `vers` VALUES (34, 'Men det var min skyld.', 'M', '', 'Men det var mi skuld.', 12, 3);
INSERT INTO `vers` VALUES (35, 'Jeg kvalte din sjel, og resten klarte du selv.', 'R', 'H,44', 'Eg kjøvde sjela di, og resten klarde du sjølv.', 13, 3);
INSERT INTO `vers` VALUES (36, 'Perfekt samarbeid, jenta mi. Perfeksjon.', 'H', 'H,130', 'Perfekt samarbeid, jenta mi. Perfeksjon.', 14, 3);
INSERT INTO `vers` VALUES (37, 'Jeg beklager, jeg har ingen flere tårer å gråte &#8230;', 'H', '', 'Eg orsaker, eg har ingen fleire tårer å gråta &#8230;', 15, 3);
INSERT INTO `vers` VALUES (38, 'En varm sommernatt.', 'H', 'H,42', 'Ei varm sommarnatt.', 1, 4);
INSERT INTO `vers` VALUES (39, 'En meg.', 'H', 'H,42,67,81,127', 'Ein meg.', 2, 4);
INSERT INTO `vers` VALUES (40, 'Et hav.', 'H', 'H,39,42,97', 'Eit hav.', 3, 4);
INSERT INTO `vers` VALUES (41, 'En måne.', 'H', 'H,45,74', 'Ein måne.', 4, 4);
INSERT INTO `vers` VALUES (42, 'Og millioner av stjerner.', 'R', '', 'Og millionar av stjerner.', 5, 4);
INSERT INTO `vers` VALUES (43, 'Alt som heter følelser er farget svart.', 'H,44', '', 'Alt som heiter kjensler er farga svart.', 6, 4);
INSERT INTO `vers` VALUES (44, 'Vitnet er ølflasken i handa.', 'R', 'H,45,97,101', 'Vitnet er ølflaska i handa.', 7, 4);
INSERT INTO `vers` VALUES (45, 'Den gråter.', 'R', '', 'Ho græt.', 8, 4);
INSERT INTO `vers` VALUES (46, 'Sjelen snakker til natten.', 'H', 'H,45,48,51,67,68,71,122', 'Sjela talar til natta.', 9, 4);
INSERT INTO `vers` VALUES (47, 'Sjelen utfordrer natten.', 'H', 'H,45,48,51,67,68,71,122', 'Sjela utfordrar natta.', 10, 4);
INSERT INTO `vers` VALUES (48, '«Min natt er større enn deg.»', 'Q', 'H,51', '«Natta mi er større enn deg.»', 11, 4);
INSERT INTO `vers` VALUES (49, 'Sjelen snur seg mot stjernene.', 'H', 'H,45,48,50,51,67,68,71,122', 'Sjela snur seg mot stjernene.', 12, 4);
INSERT INTO `vers` VALUES (50, 'Begynner å le.', 'R', 'H,67', 'Byrjar å le.', 13, 4);
INSERT INTO `vers` VALUES (51, '«Det finnes intet håp. Det finnes ingen framtid.»', 'Q', 'H,48', '«Det finst inga von. Det finst inga framtid.»', 14, 4);
INSERT INTO `vers` VALUES (52, 'De spurte meg hvorfor jeg aldri følte.', 'H', '53', 'Dei spurde meg kvifor eg aldri følte.', 1, 5);
INSERT INTO `vers` VALUES (53, 'Jeg sa jeg var redd.', 'R', '', 'Eg sagde eg var redd.', 2, 5);
INSERT INTO `vers` VALUES (54, 'De spurte meg hvorfor jeg aldri elsket.', 'H', '55', 'Dei spurde meg kvifor eg aldri elska.', 3, 5);
INSERT INTO `vers` VALUES (55, 'Jeg sa jeg var redd.', 'R', '', 'Eg sagde eg var redd.', 4, 5);
INSERT INTO `vers` VALUES (56, 'De spurte meg hvorfor jeg aldri gråt.', 'H', '57,58', 'Dei spurde meg kvifor eg aldri gret.', 5, 5);
INSERT INTO `vers` VALUES (57, 'Jeg sa jeg var redd.', 'R', '', 'Eg sagde eg var redd.', 6, 5);
INSERT INTO `vers` VALUES (58, '&#8230; <em>Jeg sa jeg var redd</em> &#8230;', 'H', 'H,59', '&#8230; <em>Eg sagde eg var redd</em> &#8230;', 7, 5);
INSERT INTO `vers` VALUES (59, '&#8230; <em>Men ingen spurte hvorfor</em> &#8230;', 'M', '', '&#8230; <em>Men ingen spurde kvifor</em> &#8230;', 8, 5);
INSERT INTO `vers` VALUES (60, 'Pray that your loneliness will spur you into finding something to live for &#8230;', 'H', 'H,61', '', 1, 6);
INSERT INTO `vers` VALUES (61, '&#8230; great enough to die for &#8230;', 'R', '', '', 2, 6);
INSERT INTO `vers` VALUES (62, 'Blant seks milliarder andre kort,', 'H', '63,70', 'Blant seks milliardar andre kort,', 1, 7);
INSERT INTO `vers` VALUES (63, 'Er Joker den eneste av sitt slag.', 'R', '', 'Er Joker den einaste av slaget sitt.', 2, 7);
INSERT INTO `vers` VALUES (64, 'Joker kan være alle kort,', 'H', 'M', 'Joker kan vera alle kort,', 3, 7);
INSERT INTO `vers` VALUES (65, 'men ingen andre kort kan være Joker.', 'M', '', 'men ingen andre kort kan vera Joker.', 4, 7);
INSERT INTO `vers` VALUES (66, 'Joker har makt til alt.', 'H', '', 'Joker har makt til alt.', 5, 7);
INSERT INTO `vers` VALUES (67, 'Han er det han ser.', 'R', '59,68', 'Han er det han ser.', 6, 7);
INSERT INTO `vers` VALUES (68, 'Og han ser det han er.', 'R', '', 'Og han ser det han er.', 7, 7);
INSERT INTO `vers` VALUES (69, 'Blant seks milliarder andre kort,', 'H', '63,70', 'Blant seks milliardar andre kort,', 8, 7);
INSERT INTO `vers` VALUES (70, 'Er Joker den eneste av sitt slag &#8230;', 'R', '', 'Er Joker den einaste av slaget sitt &#8230;', 9, 7);
INSERT INTO `vers` VALUES (71, '&#8230; og han føler seg <em>alene</em> &#8230;', 'R', '', '&#8230; og han føler seg <em>åleine</em> &#8230;', 10, 7);
INSERT INTO `vers` VALUES (72, 'Der sitter hun.', 'H', '73,74,76,77,78,79,80,83,84,86,87,89,90,91,92,93,127', 'Der sit ho.', 1, 8);
INSERT INTO `vers` VALUES (73, 'Ser mot havet.', 'R', '40,74,80,81,82,127', 'Ser mot havet.', 2, 8);
INSERT INTO `vers` VALUES (74, 'Hva hun tenker vet ingen &#8230;', 'H', '75,76,77,78,79,80,83,84,85,86', 'Kva ho tenkjer veit ingen &#8230;', 3, 8);
INSERT INTO `vers` VALUES (75, 'Ingen andre enn henne selv.', 'R', '76,77,78,79,80,83,84,85,86', 'Ingen andre enn ho sjølv.', 4, 8);
INSERT INTO `vers` VALUES (76, 'Vet hun at jeg ser på henne?', 'R', '77,78,79,80,83,84,85,86', 'Veit ho at eg ser på ho?', 5, 8);
INSERT INTO `vers` VALUES (77, 'Vet hun at jeg tenker på henne?', 'R', '78,79,80,83,84,85,86', 'Veit ho at eg tenkjer på ho?', 6, 8);
INSERT INTO `vers` VALUES (78, 'Vet hun at jeg er meg?', 'R', '79,80,83,84,85,86', 'Veit ho at eg er meg?', 7, 8);
INSERT INTO `vers` VALUES (79, 'Vet hun at jeg eksisterer?', 'R', '80,83,84,85,86', 'Veit ho at eg eksisterer?', 8, 8);
INSERT INTO `vers` VALUES (80, 'Hun snur seg.', 'H', '72,83', 'Ho snur seg.', 9, 8);
INSERT INTO `vers` VALUES (81, 'Ser på meg.', 'R', '39,82', 'Ser på meg.', 10, 8);
INSERT INTO `vers` VALUES (82, 'Og jeg på henne.', 'R', '', 'Og eg på ho.', 11, 8);
INSERT INTO `vers` VALUES (83, 'Hun sier «Redd meg &#8230;»', 'R', '84,85,86,87,88', 'Ho seier «Redd meg &#8230;»', 12, 8);
INSERT INTO `vers` VALUES (84, 'Jeg sier «Jeg er redd &#8230;»', 'H', '48,51,85', 'Eg seier «Eg er redd &#8230;»', 13, 8);
INSERT INTO `vers` VALUES (85, 'Så går jeg.', 'R', '1,3,4,5,12,34,86,88,89,90,91,92,93,122,131', 'Så går eg.', 14, 8);
INSERT INTO `vers` VALUES (86, 'Hun hører mine steg.', 'R', '87,88,89,90,92,93,122', 'Ho høyrer stega mine.', 15, 8);
INSERT INTO `vers` VALUES (87, 'Det gjør jeg òg, i grunn.', 'R', '88,89,90,92,93', 'Det gjer eg òg, i grunnen.', 16, 8);
INSERT INTO `vers` VALUES (88, 'Jeg hopper ut.', 'R', '89,90,92,93', 'Eg hoppar ut.', 17, 8);
INSERT INTO `vers` VALUES (89, 'Hun blir der.', 'R', '90,91,92,93,127', 'Ho vert der.', 18, 8);
INSERT INTO `vers` VALUES (90, 'Hun blir der &#8230;', 'R', 'H,91,92,93', 'Ho vert der &#8230;', 19, 8);
INSERT INTO `vers` VALUES (91, 'Med andre.', 'R', 'H,92,93,129', 'Med andre.', 20, 8);
INSERT INTO `vers` VALUES (92, 'Aldri min.', 'R', 'H,93,131', 'Aldri mi.', 21, 8);
INSERT INTO `vers` VALUES (93, 'Aldri min &#8230;', 'R', '', 'Aldri mi &#8230;', 22, 8);
INSERT INTO `vers` VALUES (94, 'Jeg har sett mennesker &#8230; som ikke hadde klær på seg.', 'H', '', 'Eg har sett menneske &#8230; som ikkje hadde klede på seg.', 1, 9);
INSERT INTO `vers` VALUES (95, 'Jeg har sett klær &#8230; som ikke hadde mennesker i seg.', 'H', '', 'Eg har sett klede &#8230; som ikkje hadde menneske i seg.', 2, 9);
INSERT INTO `vers` VALUES (96, 'En seng, et bord, en vannkran og noen bøker &#8230;', 'H', 'H,97', 'Ei seng, eit bord, ein vannkran og nokre bøker.', 1, 10);
INSERT INTO `vers` VALUES (97, 'Det var alt jeg hadde i det svarte rommet.', 'R', 'H,107,131', 'Det var alt eg hadde i det svarte rommet.', 2, 10);
INSERT INTO `vers` VALUES (98, 'Ingen vinduer, ingen dører &#8230;', 'H', 'H,99,131', 'Ingen vindauge, ingen dører &#8230;', 3, 10);
INSERT INTO `vers` VALUES (99, 'Bare lukten av frihet som skjulte seg bak det rustne stakitt.', 'R', 'H,131', 'Berre angen av fridom som skjulte seg bak det rusta stakittet.', 4, 10);
INSERT INTO `vers` VALUES (100, 'Dagslys var en fremmed.', 'H', 'H,101', 'Dagsljos var ein framand.', 5, 10);
INSERT INTO `vers` VALUES (101, 'Mennesker likeså.', 'R', 'H,102', 'Menneske like eins.', 6, 10);
INSERT INTO `vers` VALUES (102, 'Virkelige mennesker, altså.', 'R', 'H,103,128', 'Verkelege menneske, altså.', 7, 10);
INSERT INTO `vers` VALUES (103, 'Som ikke svek.', 'R', 'H,106', 'Som ikkje sveik.', 8, 10);
INSERT INTO `vers` VALUES (104, 'De eneste vennene jeg hadde,', 'H', '6,31,50,52,54,56,96,105', 'Dei einaste venene eg hadde,', 9, 10);
INSERT INTO `vers` VALUES (105, 'Var min tjukke papirblokk og min trofaste Parker.', 'R', 'H,103,106', 'Var den tjukke papirblokka mi og mi trufaste Parker.', 10, 10);
INSERT INTO `vers` VALUES (106, 'De gjorde alltid det jeg sa.', 'R', 'H,107', 'Dei gjorde alltid det eg sagde.', 11, 10);
INSERT INTO `vers` VALUES (107, 'I hele 17 år og 15 døgn.', 'R', 'H,108', 'I heile 17 år og 15 døger.', 12, 10);
INSERT INTO `vers` VALUES (108, 'Så lenge har jeg vært her.', 'R', '', 'Så lenge har eg vore her.', 13, 10);
INSERT INTO `vers` VALUES (109, 'Hele livet &#8230; 17 år og 15 døgn.', 'R', 'H,108', 'Heile livet &#8230; 17 år og 15 døger.', 14, 10);
INSERT INTO `vers` VALUES (110, 'En dag vet jeg,', 'H', '2,111', 'Ein dag veit eg,', 15, 10);
INSERT INTO `vers` VALUES (111, 'At min sjel vil knuse denne paradoksale trygghet.', 'R', 'H,112', 'At sjela mi vil knusa denne paradoksale tryggleiken.', 16, 10);
INSERT INTO `vers` VALUES (112, 'Men til da vil jeg være som jeg alltid har vært &#8230;', 'M', '', 'Men til då vil eg vera som eg alltid har vore &#8230;', 17, 10);
INSERT INTO `vers` VALUES (113, 'Alene &#8230;', 'H', '', 'Åleine &#8230;', 18, 10);
INSERT INTO `vers` VALUES (114, 'I det svarte rommet.', 'H', '', 'I det svarte rommet.', 19, 10);
INSERT INTO `vers` VALUES (115, 'Jeg er ikke redd for at de dreper deg &#8230;', 'H', 'H,115', 'Eg er ikkje redd for at dei drep deg &#8230;', 1, 11);
INSERT INTO `vers` VALUES (116, 'Jeg er redd for at jeg ikke kommer til å gråte når de gjør det.', 'R', '', 'Eg er redd for at eg ikkje kjem til å gråta når dei gjer det.', 2, 11);
INSERT INTO `vers` VALUES (117, 'Et menneske uten frykt &#8230;', 'H', 'H,118', 'Eit menneske utan frykt &#8230;', 1, 12);
INSERT INTO `vers` VALUES (118, '&#8230; er et menneske uten håp &#8230;', 'R', '', '&#8230; er eit menneske utan von &#8230;', 2, 12);
INSERT INTO `vers` VALUES (119, 'Hvis jeg åpner hjertet mitt for deg &#8230;', 'H', '120,121', 'Viss eg opnar hjartet mitt for deg &#8230;', 1, 13);
INSERT INTO `vers` VALUES (120, '&#8230; og du ser et lite glimt av lys &#8230;', 'R', '121', '&#8230; og du ser eit lite glimt av ljos &#8230;', 2, 13);
INSERT INTO `vers` VALUES (121, '&#8230; <em>vær så snill å ikke snu hodet</em> &#8230;', 'H', '', '&#8230; <em>ver så snill å ikkje snu hovudet</em> &#8230;', 3, 13);
INSERT INTO `vers` VALUES (122, 'Tar små steg.', 'R', 'H,28,123,124', 'Tek små steg.', 1, 14);
INSERT INTO `vers` VALUES (123, 'Mot et nytt liv.', 'R', 'H,103,124', 'Mot eit nytt liv.', 2, 14);
INSERT INTO `vers` VALUES (124, 'Usikre er de. Men ikke på seg selv &#8230;', 'R', 'H,125', 'Dei er usikre. Men ikkje på seg sjølv &#8230;', 3, 14);
INSERT INTO `vers` VALUES (125, 'De er usikre på deres eksistens i framtiden &#8230;', 'R', 'H,126', 'Dei er usikre på eksistensen deira i framtida &#8230;', 4, 14);
INSERT INTO `vers` VALUES (126, 'Om de vil gidde å fortsette &#8230;', 'R', '', 'Om dei vil idast halda fram &#8230;', 5, 14);
INSERT INTO `vers` VALUES (127, 'Venter på noen &#8230;', 'R', 'H,128,129', 'Ventar på nokon &#8230;', 6, 14);
INSERT INTO `vers` VALUES (128, 'Noen til å hjelpe meg.', 'R', 'H,129', '&#8230; Nokon til å hjelpa meg.', 7, 14);
INSERT INTO `vers` VALUES (129, 'Noen til å drepe den jeg har blitt &#8230;', 'R', '', 'Nokon til å drepa den eg har vorte &#8230;', 8, 14);
INSERT INTO `vers` VALUES (130, 'Levde på en løgn &#8230;', 'R', 'H,131', 'Levde på ei lygn &#8230;', 9, 14);
INSERT INTO `vers` VALUES (131, 'Få meg tilbake i virkeligheten &#8230;', 'H', '', 'Få meg attende i røyndomen &#8230;', 10, 14);
INSERT INTO `vers` VALUES (132, 'She laughs, he cries &#8230;', 'H', '133', '', 1, 15);
INSERT INTO `vers` VALUES (133, 'To what&#8217;s within.', 'R', '134,135', '', 2, 15);
INSERT INTO `vers` VALUES (134, 'Certainly not sunshine.', 'R', '135', '', 3, 15);
INSERT INTO `vers` VALUES (135, 'Lots of black clouds.', 'H', '', '', 4, 15);
INSERT INTO `vers` VALUES (136, 'Mørke stier å gå &#8230;', 'H', '', 'Mørke stigar å gå &#8230;', 1, 16);
INSERT INTO `vers` VALUES (137, 'Tomme ord, døde blikk.', 'H', 'H,138,139', 'Tomme ord, daude blikk.', 2, 16);
INSERT INTO `vers` VALUES (138, 'Tårene renner nå innover i stedet for utover.', 'R', 'H,139', 'Tårene renn no innover i staden for utover.', 3, 16);
INSERT INTO `vers` VALUES (139, 'Alle er like lei &#8230;', 'R', '', 'Alle er like lei &#8230;', 4, 16);
INSERT INTO `vers` VALUES (140, 'Elva renner fremdeles.', 'H', '', 'Elva renn framleis.', 5, 16);
INSERT INTO `vers` VALUES (141, 'Jorda prøver fortsatt å bli svimmel.', 'H', '', 'Jorda freistar framleis å verta svimmel.', 6, 16);
INSERT INTO `vers` VALUES (142, 'Og blodet renner, som vanlig.', 'R', '', 'Og blodet renn, som vanleg.', 7, 16);
INSERT INTO `vers` VALUES (143, 'Alt jeg vil er å knuse noe! Nå.', 'H', '', 'Alt eg vil er å knusa noko! No.', 8, 16);
        