DELETE FROM characters WHERE (account OR deleteDate IS NULL OR deleteDate='') AND account NOT IN(SELECT id FROM _account_ids);
DELETE FROM item_instance WHERE guid NOT IN(SELECT item FROM character_inventory) AND guid NOT IN(SELECT itemguid FROM auctionhouse) AND guid NOT IN(SELECT item_guid FROM guild_bank_item) AND guid NOT IN(SELECT item_guid FROM mail_items);

-- _achievement_points
TRUNCATE TABLE _arena_stats;
-- _armory_mounts_and_pets
-- account
DELETE FROM account_access WHERE id NOT IN(SELECT id FROM _account_ids);
DELETE FROM account_banned WHERE id NOT IN(SELECT id FROM _account_ids);
DELETE FROM account_data WHERE accountId NOT IN(SELECT id FROM _account_ids);
-- DELETE FROM account_history WHERE id NOT IN(SELECT id FROM _account_ids); -- our custom
DELETE FROM account_instance_times WHERE accountId NOT IN(SELECT id FROM _account_ids) OR releaseTime <= UNIX_TIMESTAMP();
DELETE FROM account_premium WHERE acct NOT IN(SELECT id FROM _account_ids) OR expire_date <= (UNIX_TIMESTAMP()-(24*60*60));
DELETE FROM account_tutorial WHERE accountId NOT IN(SELECT id FROM _account_ids);
-- addons
-- arena_match_log
DELETE FROM arena_team WHERE captainGuid NOT IN(SELECT guid FROM characters);
DELETE FROM arena_team_member WHERE arenaTeamId NOT IN(SELECT arenaTeamId FROM arena_team) OR guid NOT IN(SELECT guid FROM characters);
DELETE FROM arena_team WHERE arenaTeamId NOT IN(SELECT DISTINCT(arenaTeamId) FROM arena_team_member);
DELETE FROM auctionhouse WHERE itemguid NOT IN(SELECT guid FROM item_instance) OR itemowner NOT IN(SELECT guid FROM characters);
TRUNCATE TABLE bugreport;
-- calendar_events
-- calendar_invites
DELETE FROM channels WHERE lastUsed < (UNIX_TIMESTAMP()-(30*24*60*60));
DELETE FROM character_account_data WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_achievement WHERE guid NOT IN(SELECT guid FROM characters) AND achievement NOT BETWEEN '456' AND '467' AND achievement NOT BETWEEN '1400' AND '1427' AND achievement NOT IN(1463, 3117, 3259);
DELETE FROM character_achievement_progress WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_action WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_arena_stats WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_aura WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_banned WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_battleground_data WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_battleground_random WHERE guid NOT IN(SELECT guid FROM characters);
TRUNCATE TABLE character_declinedname;
DELETE FROM character_equipmentsets WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_gifts WHERE guid NOT IN(SELECT guid FROM characters) OR item_guid NOT IN(SELECT guid FROM item_instance);
DELETE FROM character_glyphs WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_homebind WHERE guid NOT IN(SELECT guid FROM characters);
-- character_instance
DELETE FROM character_inventory WHERE guid NOT IN(SELECT guid FROM characters) OR item NOT IN (SELECT guid FROM item_instance);
DELETE FROM character_pet WHERE owner NOT IN(SELECT guid FROM characters);
TRUNCATE TABLE character_pet_declinedname;
DELETE FROM character_queststatus WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_queststatus_daily WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_queststatus_monthly WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_queststatus_rewarded WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_queststatus_seasonal WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_queststatus_weekly WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_reputation WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_skills WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM character_social WHERE guid NOT IN(SELECT guid FROM characters) OR friend NOT IN(SELECT guid FROM characters);
DELETE FROM character_spell WHERE guid NOT IN(SELECT guid FROM characters);
TRUNCATE TABLE character_spell_cooldown;
TRUNCATE TABLE character_stats;
DELETE FROM character_talent WHERE guid NOT IN(SELECT guid FROM characters);
-- characters
-- cheaters
DELETE FROM corpse WHERE guid NOT IN(SELECT guid FROM characters);
-- creature_respawn
-- gameobject_respawn
TRUNCATE TABLE gm_subsurveys;
TRUNCATE TABLE gm_surveys;
DELETE FROM gm_tickets WHERE closedBy<>0 OR lastModifiedTime < (UNIX_TIMESTAMP()-(3*30*24*60*60));
-- group_instance
-- group_member
-- groups
DELETE FROM guild WHERE leaderguid NOT IN(SELECT guid FROM characters);
DELETE FROM guild_member WHERE guildid NOT IN(SELECT guildid FROM guild) OR guid NOT IN(SELECT guid FROM characters);
DELETE FROM guild WHERE guildid NOT IN(SELECT DISTINCT(guildid) FROM guild_member);
DELETE FROM guild_bank_eventlog WHERE guildid NOT IN(SELECT guildid FROM guild);
DELETE FROM guild_bank_item WHERE guildid NOT IN(SELECT guildid FROM guild) OR item_guid NOT IN (SELECT guid FROM item_instance);
DELETE FROM guild_bank_right WHERE guildid NOT IN(SELECT guildid FROM guild);
DELETE FROM guild_bank_tab WHERE guildid NOT IN(SELECT guildid FROM guild);
DELETE FROM guild_eventlog WHERE guildid NOT IN(SELECT guildid FROM guild);
DELETE FROM guild_member_withdraw WHERE guid NOT IN(SELECT guid FROM characters);
DELETE FROM guild_rank WHERE guildid NOT IN(SELECT guildid FROM guild);
-- instance
-- instance_reset
DELETE FROM ip_banned WHERE unbandate < (UNIX_TIMESTAMP()-(365*24*60*60));
-- item_instance
DELETE FROM item_loot_storage WHERE containerGUID NOT IN(SELECT guid FROM item_instance);
DELETE FROM item_refund_instance WHERE item_guid NOT IN(SELECT guid FROM item_instance) OR player_guid NOT IN(SELECT guid FROM characters);
TRUNCATE TABLE item_soulbound_trade_data;
TRUNCATE TABLE lag_reports;
-- lfg_data
-- log_* (our tables)
TRUNCATE TABLE logs;
DELETE FROM mail WHERE receiver NOT IN(SELECT guid FROM characters);
DELETE FROM mail_items WHERE mail_id NOT IN(SELECT id FROM mail) OR item_guid NOT IN(SELECT guid FROM item_instance);
UPDATE mail SET has_items=0 WHERE id NOT IN (SELECT DISTINCT mail_id FROM mail_items);
-- money_log_new
TRUNCATE TABLE pet_aura;
DELETE FROM pet_spell WHERE guid NOT IN(SELECT guid from character_pet);
TRUNCATE TABLE pet_spell_cooldown;
DELETE FROM petition WHERE ownerguid NOT IN(SELECT guid FROM characters) OR petitionguid NOT IN(SELECT guid FROM item_instance);
DELETE FROM petition_sign WHERE ownerguid NOT IN(SELECT guid FROM characters) OR playerguid NOT IN(SELECT guid FROM characters) OR petitionguid NOT IN(SELECT guid FROM item_instance);
DELETE FROM premium_item WHERE player NOT IN(SELECT guid FROM characters);
DELETE FROM premium_titles WHERE player NOT IN(SELECT guid FROM characters);
-- premium_www2core
-- rbac_*
DELETE FROM realmcharacters WHERE acctid NOT IN(SELECT id FROM _account_ids);
-- realmlist
-- reserved_name
-- uptime
-- warden_action
-- worldstates

-- run this again, above queries can delete some references
DELETE FROM item_instance WHERE guid NOT IN(SELECT item FROM character_inventory) AND guid NOT IN(SELECT itemguid FROM auctionhouse) AND guid NOT IN(SELECT item_guid FROM guild_bank_item) AND guid NOT IN(SELECT item_guid FROM mail_items);
