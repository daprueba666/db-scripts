USE `sotorrent17_12`;

SET foreign_key_checks = 0;
# remove auto-increment for import
ALTER TABLE `PostBlockDiff` MODIFY Id INT, DROP PRIMARY KEY, ADD PRIMARY KEY (Id);
LOAD DATA LOCAL INFILE 'PostBlockDiff.csv' INTO TABLE `PostBlockDiff`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
(Id, PostId, PostHistoryId, PredPostBlockVersionId, PostBlockVersionId, PostBlockDiffOperationId, @Text)
SET Text = REPLACE(@Text, '&#xD;&#xA;', '\n');
SET foreign_key_checks = 1;

SET foreign_key_checks = 0;
# remove auto-increment for import
ALTER TABLE `PostVersion` MODIFY Id INT, DROP PRIMARY KEY, ADD PRIMARY KEY (Id);
LOAD DATA LOCAL INFILE 'PostVersion.csv' INTO TABLE `PostVersion`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
(Id, PostId, PostHistoryId, PostTypeId, CreationDate, @PredPostHistoryId, @SuccPostHistoryId)
SET PredPostHistoryId = nullif(@PredPostHistoryId, ''),
	SuccPostHistoryId = nullif(@SuccPostHistoryId, '');
SET foreign_key_checks = 1;

SET foreign_key_checks = 0;
# remove auto-increment for import
ALTER TABLE `PostBlockVersion` MODIFY Id INT, DROP PRIMARY KEY, ADD PRIMARY KEY (Id);
LOAD DATA LOCAL INFILE 'PostBlockVersion.csv' INTO TABLE `PostBlockVersion`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
(Id, PostVersionId, PostId, PostHistoryId, PostBlockTypeId, LocalId, @Content, Length, LineCount, @RootPostBlockId, @PredPostBlockId, @PredEqual, @PredSimilarity, @PredCount, @SuccCount)
SET Content = REPLACE(@Content, '&#xD;&#xA;', '\n'),
    RootPostBlockId = nullif(@RootPostBlockId, ''),
    PredPostBlockId = nullif(@PredPostBlockId, ''),
    PredEqual = nullif(@PredEqual, ''),
    PredSimilarity = nullif(@PredSimilarity, ''),
    PredCount = nullif(@PredCount, ''),
    SuccCount = nullif(@SuccCount, '');
SET foreign_key_checks = 1;

SET foreign_key_checks = 0;
# remove auto-increment for import
ALTER TABLE `PostVersionUrl` MODIFY Id INT, DROP PRIMARY KEY, ADD PRIMARY KEY (Id);
LOAD DATA LOCAL INFILE 'PostVersionUrl.csv' INTO TABLE `PostVersionUrl`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
(Id, PostId, PostHistoryId, PostBlockVersionId, Url);
SET foreign_key_checks = 1;
