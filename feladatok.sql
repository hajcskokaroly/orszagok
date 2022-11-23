Mi MADAGASZKÁR fővárosa? 
	SELECT `fovaros` FROM `orszagok` WHERE `orszag` LIKE 'Madagaszkár';
Melyik ország fővárosa OUAGADOUGOU?
	SELECT `orszag` FROM `orszagok` WHERE `fovaros` LIKE 'OUAGADOUGOU';
Melyik ország autójele a TT?
	SELECT `orszag` FROM `orszagok` WHERE `autojel` LIKE 'TT';
Melyik ország pénzének jele az SGD?
	SELECT `orszag` FROM `orszagok` WHERE `penzjel` LIKE 'SGD';
Melyik ország nemzetközi telefon-hívószáma a 61?
	SELECT `orszag` FROM `orszagok` WHERE `telefon` LIKE '61';
Mekkora területű Monaco?
	SELECT `terulet` FROM `orszagok` WHERE `fovaros` LIKE 'Monaco';
Hányan laknak Máltán?  
	SELECT `nepesseg`*1000 FROM `orszagok` WHERE `orszag` LIKE 'Málta';
Mennyi Japán népsűrűsége? 
	SELECT ((`nepesseg`*1000)/`terulet`) FROM `orszagok` WHERE `orszag` LIKE 'Japán';
Hány lakosa van a Földnek? 
	SELECT SUM(`nepesseg`) FROM `orszagok`;
Mennyi az országok területe összesen?
	SELECT SUM(`terulet`) FROM `orszagok`;
Mennyi az országok átlagos népessége? 
	SELECT AVG(nepesseg) FROM `orszagok`;
Mennyi az országok átlagos területe?
	SELECT AVG(terulet) FROM `orszagok`;
Mennyi a Föld népsűrűsége? 
	SELECT ((SUM(nepesseg)*1000)/(SUM(terulet))) FROM `orszagok`;
Hány 1.000.000 km2-nél nagyobb területű ország van? 
	SELECT COUNT(`id`) FROM `orszagok` WHERE `terulet`<1000000;
Hány 100 km2-nél kisebb területű ország van?
	SELECT COUNT(`id`) FROM `orszagok` WHERE `terulet`<100;
Hány 20.000 főnél kevesebb lakosú ország van?
	SELECT orszag FROM `orszagok` WHERE nepesseg<20;
Hány országra igaz, hogy területe kisebb 100 km2-nél, vagy pedig a lakossága kevesebb 20.000 főnél?
	SELECT COUNT(id) FROM `orszagok` WHERE terulet<100 OR nepesseg<20;
Hány ország területe 50.000 és 150.000 km2 közötti?
	SELECT COUNT(`id`) FROM `orszagok` WHERE `terulet` BETWEEN 50 AND 150;
Hány ország lakossága 8 és 12 millió közötti?
	SELECT COUNT(`id`) FROM `orszagok` WHERE `nepesseg` BETWEEN 8000 AND 12000;
Mely fővárosok népesebbek 20 millió főnél?
	SELECT COUNT(`id`) FROM `orszagok` WHERE nep_fovaros>20000;
Mely országok népsűrűsége nagyobb 500 fő/km2-nél?
	SELECT `orszag` FROM `orszagok` WHERE ((`nepesseg`*1000)/`terulet`)>500;
Hány ország államformája köztársaság?
	SELECT COUNT(`id`) FROM `orszagok` WHERE `allamforma` LIKE 'köztársaság';
Mely országok pénzneme a kelet-karib dollár?
	SELECT `orszag` FROM `orszagok` WHERE `penznem` LIKE 'kelet-karib dollár';
Hány ország nevében van benne az "ORSZÁG" szó? 
	SELECT COUNT(id) FROM `orszagok` WHERE `orszag` LIKE '%ország';
Mely országokban korona a hivatalos fizetőeszköz?
	SELECT `orszag` FROM `orszagok` WHERE `penznem` LIKE '%korona';
Mennyi Európa területe?
	SELECT SUM(`terulet`) FROM `orszagok` WHERE `foldr_hely` LIKE '%Európa%';
Mennyi Európa lakossága?
	SELECT (SUM(`nepesseg`))*1000 FROM `orszagok` WHERE `foldr_hely` LIKE '%Európa%';
Mennyi Európa népsűrűsége?
	SELECT ((SUM(`nepesseg`))*1000)/(SUM(`terulet`)) FROM `orszagok` WHERE `foldr_hely` LIKE '%Európa%';
Hány ország van Afrikában?
	SELECT COUNT(`id`) FROM `orszagok` WHERE `foldr_hely` LIKE '%Afrika%';
Mennyi Afrika lakossága?
	SELECT SUM(`nepesseg`)*1000 FROM `orszagok` WHERE `foldr_hely` LIKE '%Afrika%';
Mennyi Afrika népsűrűsége?
	SELECT (SUM(`nepesseg`)*1000)/(SUM(`terulet`)) FROM `orszagok` WHERE `foldr_hely` LIKE '%Afrika%';
Melyek a szigetországok? 
	SELECT `orszag` FROM `orszagok` WHERE `foldr_hely` LIKE '%(szigetország)%';
Mely országok államformája hercegség, vagy királyság?
	SELECT `orszag` FROM `orszagok` WHERE `allamforma` LIKE '%hercegség%' OR `allamforma` LIKE '%királyság%';
Hány országnak nincs autójelzése?
	SELECT COUNT(`id`) FROM `orszagok` WHERE `autojel` LIKE '';
Mennyi a váltószáma az aprópénznek azokban az országokban, ahol nem 100?
	SELECT `valtopenz` FROM `orszagok` WHERE `valtopenz` NOT LIKE '100 %';
Hány ország területe kisebb Magyarországénál? 
	SELECT COUNT(`id`) FROM `orszagok` WHERE `terulet` < (SELECT `terulet` FROM orszagok WHERE orszag LIKE 'Magyarország');
Melyik a legnagyobb területű ország, és mennyi a területe?
	SELECT `orszag`, `terulet` FROM `orszagok` ORDER BY terulet DESC LIMIT 1;
Melyik a legkisebb területű ország, és mennyi a területe?
	SELECT `orszag`, `terulet` FROM `orszagok` ORDER BY terulet ASC LIMIT 1;
Melyik a legnépesebb ország, és hány lakosa van?
	SELECT `orszag`, `nepesseg`*1000 FROM `orszagok` ORDER BY nepesseg DESC LIMIT 1;
Melyik a legkisebb népességű ország, és hány lakosa van?
	SELECT `orszag`, `nepesseg`*1000 FROM `orszagok` ORDER BY nepesseg ASC LIMIT 1;
Melyik a legsűrűbben lakott ország, és mennyi a népsűrűsége?
	SELECT `orszag`, ((`nepesseg`*1000)/`terulet`) FROM `orszagok` ORDER BY ((`nepesseg`*1000)/`terulet`) DESC LIMIT 1;
Melyik a legritkábban lakott ország, és mennyi a népsűrűsége?
	SELECT `orszag`, ((`nepesseg`*1000)/`terulet`) FROM `orszagok` ORDER BY ((`nepesseg`*1000)/`terulet`) ASC LIMIT 1;
Melyik a legnagyobb afrikai ország és mekkora?
	SELECT `orszag`, `terulet` FROM `orszagok` WHERE `foldr_hely` LIKE '%Afrika%' ORDER BY terulet DESC LIMIT 1;
Melyik a legkisebb amerikai ország és hányan lakják?
	SELECT `orszag`, (`nepesseg`*1000) FROM `orszagok` WHERE `foldr_hely` LIKE '%Amerika%' ORDER BY terulet ASC LIMIT 1;
Melyik az első három legsűrűbben lakott "országméretű" ország (tehát nem város- vagy törpeállam)? 
	SELECT `orszag` FROM `orszagok` WHERE `foldr_hely` NOT LIKE '%városállam%' AND `foldr_hely` NOT LIKE '%törpeállam%' ORDER BY (`nepesseg`*1000)/`terulet` DESC LIMIT 3;
Melyik a világ hat legnépesebb fővárosa?
	SELECT `fovaros` FROM `orszagok` ORDER BY `nep_fovaros` DESC LIMIT 6;
Melyik tíz ország egy főre jutó GDP-je a legnagyobb?  
	SELECT `orszag` FROM `orszagok` ORDER BY `gdp` DESC LIMIT 10;
Melyik tíz ország össz-GDP-je a legnagyobb?
	SELECT `orszag` FROM `orszagok` ORDER BY `gdp`*`nepesseg`*1000 DESC LIMIT 10;
Melyik országban a legszegényebbek az emberek?
	SELECT `orszag` FROM `orszagok` ORDER BY `gdp`*`nepesseg`*1000 ASC LIMIT 1;
Melyik a 40. legkisebb területű ország?
	SELECT `orszag` FROM `orszagok` ORDER BY `terulet` LIMIT 1 OFFSET 39;
Melyik a 15. legkisebb népsűrűségű ország?
	SELECT `orszag` FROM `orszagok` ORDER BY (`nepesseg`*1000)/`terulet` LIMIT 1 OFFSET 14;
Melyik a 61. legnagyobb népsűrűségű ország?
	SELECT `orszag` FROM `orszagok` ORDER BY (`nepesseg`*1000)/`terulet` DESC LIMIT 1 OFFSET 60;
Melyik három ország területe hasonlít leginkább Magyaroszág méretéhez?
	SELECT `orszag` FROM `orszagok` ORDER BY ABS((SELECT `terulet` FROM orszagok WHERE `orszag` LIKE 'Magyarország')-terulet) LIMIT 3 OFFSET 1;
Az emberek hányadrésze él Ázsiában? 
	SELECT ((SELECT SUM(`nepesseg`) FROM `orszagok` WHERE `foldr_hely` LIKE '%Ázsia%'))/(SUM(`nepesseg`)) FROM `orszagok`;
A szárazföldek mekkora hányadát foglalja el Oroszország?
	SELECT ((SELECT `terulet` FROM `orszagok` WHERE `orszag` LIKE 'Oroszország'))/(SUM(`terulet`)) FROM `orszagok`;
Az emberek hány százaléka fizet euroval?
	SELECT ((SELECT SUM(`nepesseg`) FROM orszagok WHERE `penznem` LIKE 'euró')/SUM(`nepesseg`))*100 FROM `orszagok`;
Hányszorosa a leggazdagabb ország egy főre jutó GDP-je a legszegényebb ország egy főre jutó GDP-jének?
	SELECT (MAX(`gdp`))/(MIN(`gdp`)) FROM `orszagok` WHERE `gdp` <> 0;
A világ össz-GDP-jének hány százalékát adja az USA?
	SELECT ((SELECT SUM(`gdp`) FROM `orszagok` WHERE `orszag` LIKE 'Amerikai Egyesült Államok')/(SUM(`gdp`)))*100 FROM `orszagok`;
A világ össz-GDP-jének hány százalékát adja az euroövezet?
	SELECT ((SELECT SUM(`gdp`) FROM `orszagok` WHERE `penznem` LIKE 'euro')/(SUM(`gdp`)))*100 FROM `orszagok`;
Melyek azok az átlagnál gazdagabb országok, amelyek nem az európai vagy az amerikai kontinensen találhatóak?

Milyen államformák léteznek Európában?
	SELECT `allamforma` FROM `orszagok` WHERE `foldr_hely` LIKE '%Európa%' GROUP BY `allamforma`; 
Hányféle államforma létezik a világon?
	SELECT COUNT(DISTINCT `allamforma`) FROM `orszagok`; 
Hányféle fizetőeszközt használnak Európában az eurón kívül?
	SELECT COUNT(DISTINCT `penznem`) FROM `orszagok` WHERE `penznem` NOT LIKE 'euro';
Mely pénznemeket használják több országban is?  
	SELECT `penznem` FROM `orszagok` ORDER BY COUNT(`penznem`);
Mely országok államformája egyedi?  
	SELECT `orszag` FROM `orszagok` GROUP BY `allamforma` HAVING COUNT(`allamforma`) = 1;