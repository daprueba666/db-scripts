# add secure-file-priv="" under [mysqld] in my.ini or /etc/mysql/mysql.conf.d/mysqld.cnf

USE `sotorrent17_12`;

SELECT *
INTO OUTFILE 'PostBlockDiff.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostBlockDiff`;

SELECT *
INTO OUTFILE 'PostBlockDiffOperation.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostBlockDiffOperation`;

SELECT *
INTO OUTFILE 'PostBlockType.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostBlockType`;

SELECT *
INTO OUTFILE 'PostBlockVersion.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostBlockVersion`;

SELECT *
INTO OUTFILE 'PostReferenceGH.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostReferenceGH`;

SELECT *
INTO OUTFILE 'PostType.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostType`;

SELECT *
INTO OUTFILE 'PostVersion.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostVersion`;

SELECT *
INTO OUTFILE 'PostVersionUrl.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostVersionUrl`;