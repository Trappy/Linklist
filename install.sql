DROP TABLE IF EXISTS wcf1_linkList_category;
CREATE TABLE wcf1_linkList_category (
	categoryID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	parentID INT(10) NOT NULL DEFAULT 0,
	title VARCHAR(255) NOT NULL DEFAULT '',
	description MEDIUMTEXT,
	allowDescriptionHtml TINYINT(1) NOT NULL DEFAULT 0,
	categoryType TINYINT(1) NOT NULL DEFAULT 0,
	image VARCHAR(255) NOT NULL DEFAULT '',
	time INT(10) NOT NULL DEFAULT 0,
	links INT(10) NOT NULL DEFAULT 0,
	visits INT(10) NOT NULL DEFAULT 0,
	comments INT(10) NOT NULL DEFAULT 0,
	allowComments TINYINT(1) NOT NULL DEFAULT -1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wcf1_linkList_category_structure;
CREATE TABLE wcf1_linkList_category_structure (
	parentID INT(10) NOT NULL DEFAULT 0,
	categoryID INT(10) NOT NULL DEFAULT 0,
	position SMALLINT(5) NOT NULL DEFAULT 0,
	PRIMARY KEY (parentID, categoryID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wcf1_linkList_category_to_group;
CREATE TABLE wcf1_linkList_category_to_group (
	categoryID INT(10) NOT NULL DEFAULT 0,
	groupID INT(10) NOT NULL DEFAULT 0,
	canViewCategory TINYINT(1) NOT NULL DEFAULT -1,
	canEnterCategory TINYINT(1) NOT NULL DEFAULT -1,
	canViewLink TINYINT(1) NOT NULL DEFAULT -1,
	canAddLink TINYINT(1) NOT NULL DEFAULT -1,
	canAddLinkWithoutModeration TINYINT(1) NOT NULL DEFAULT -1,
	canEditOwnLink TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteOwnLink TINYINT(1) NOT NULL DEFAULT -1,
	canVisitLink TINYINT(1) NOT NULL DEFAULT -1,
	canViewComment TINYINT(1) NOT NULL DEFAULT -1,
	canAddComment TINYINT(1) NOT NULL DEFAULT -1,
	canEditOwnComment TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteOwnComment TINYINT(1) NOT NULL DEFAULT -1,
	canUploadAttachment TINYINT(1) NOT NULL DEFAULT -1,
	canDownloadAttachment TINYINT(1) NOT NULL DEFAULT -1,
	canViewAttachmentPreview TINYINT(1) NOT NULL DEFAULT -1,
	PRIMARY KEY (groupID, categoryID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wcf1_linkList_link;
CREATE TABLE wcf1_linkList_link (
	linkID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	categoryID INT(10) NOT NULL DEFAULT 0,
	subject VARCHAR(255) NOT NULL DEFAULT '',
	message MEDIUMTEXT NOT NULL,
	shortDescription TEXT(1000) NOT NULL DEFAULT '',
	userID INT(10) NOT NULL DEFAULT 0,
	username VARCHAR(255) NOT NULL DEFAULT '',
	url VARCHAR(255) NOT NULL DEFAULT '',
	time INT(10) NOT NULL DEFAULT 0,
	lastChangeTime INT(10) NOT NULL DEFAULT 0,
	isSticky tinyint(1) NOT NULL default '0',
	isDeleted TINYINT(1) NOT NULL DEFAULT 0,
	everEnabled TINYINT(1) NOT NULL DEFAULT 1,
	isDisabled TINYINT(1) NOT NULL DEFAULT 0,
	isClosed TINYINT(1) NOT NULL DEFAULT 0,
	editor VARCHAR(255) NOT NULL DEFAULT '',
	editorID INT(10) NOT NULL DEFAULT 0,
	deleteTime INT(10) NOT NULL DEFAULT 0,
	deletedBy VARCHAR(255) NOT NULL DEFAULT '',
	deletedByID INT(10) NOT NULL DEFAULT 0,
	visits INT(10) NOT NULL DEFAULT 0,
	lastVisitorID INT(10) NOT NULL DEFAULT 0,
	lastVisitorName VARCHAR(255) NOT NULL DEFAULT '',
	lastVisitTime INT(10) NOT NULL DEFAULT 0,
	comments INT(10) NOT NULL DEFAULT 0,
	attachments SMALLINT(5) NOT NULL DEFAULT 0,
	enableSmilies TINYINT(1) NOT NULL DEFAULT 1,
	enableHtml TINYINT(1) NOT NULL DEFAULT 0,
	enableBBCodes TINYINT(1) NOT NULL DEFAULT 1,
	ipAddress VARCHAR(15) NOT NULL DEFAULT '',
	FULLTEXT KEY (subject, message),
	KEY (categoryID, userID),
	KEY (categoryID, isDeleted, isDisabled, time, lastChangeTime),
	KEY (userID),
	KEY (isDeleted),
	KEY (isDisabled),
	KEY (ipAddress)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wcf1_linkList_link_comment;
CREATE TABLE wcf1_linkList_link_comment (
	commentID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	linkID INT(10) NOT NULL,
	categoryID INT(10) NOT NULL,
	userID INT(10) NOT NULL DEFAULT 0,
	username VARCHAR(255) NOT NULL DEFAULT '',
	message MEDIUMTEXT NULL,
	time INT(10) NOT NULL DEFAULT 0,
	lastChangeTime INT(10) NOT NULL DEFAULT 0,
	enableSmilies TINYINT(1) NOT NULL DEFAULT 1,
	enableHtml TINYINT(1) NOT NULL DEFAULT 0,
	enableBBCodes TINYINT(1) NOT NULL DEFAULT 1,
	showSignature TINYINT(1) NOT NULL DEFAULT 1,
	ipAddress VARCHAR(15) NOT NULL DEFAULT '',
	KEY (linkID, categoryID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wcf1_linkList_link_last_visitor;
CREATE TABLE wcf1_linkList_link_last_visitor (
  linkID INT(10) NOT NULL,
  userID INT(10) NOT NULL DEFAULT 0,
  time INT(10) NOT NULL DEFAULT 0,
  UNIQUE KEY (linkID, userID),
  KEY (time)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;