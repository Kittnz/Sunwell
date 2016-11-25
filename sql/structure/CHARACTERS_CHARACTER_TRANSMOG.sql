CREATE TABLE IF NOT EXISTS `character_transmog` (
  `guid` int(10) unsigned NOT NULL,
  `item` int(10) unsigned NOT NULL,
  `fakeEntry` mediumint(8) unsigned NOT NULL,
  `transmogTime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `character_transmog_limit` (
  `guid` int(10) unsigned NOT NULL,
  `tmoglimit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
