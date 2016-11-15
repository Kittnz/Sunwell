REPLACE INTO `creature_template` VALUES (70102, 0, 0, 0, 0, 0, 19646, 0, 0, 0, 'Warpweaver', 'Transmogrifier', NULL, 0, 80, 80, 2, 35, 1, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 774, 2048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_transmogrifier', 1);

-- orgrimmar
DELETE FROM creature WHERE guid=247290 AND id=70102;
INSERT INTO creature VALUES(247290, 70102, 1, 1, 1, 0, 0, 1663.04, -4449.08, 19.50, 0.20, 300, 0, 0, 1, 0, 0, 0, 0, 0);

-- stormwind
DELETE FROM creature WHERE guid=247291 AND id=70102;
INSERT INTO creature VALUES(247291, 70102, 0, 1, 1, 0, 0, -8819.19, 670.49, 95.45, 5.40, 300, 0, 0, 1, 0, 0, 0, 0, 0);
