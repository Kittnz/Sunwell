# Sunwell Core

# No support, this is served as is.


Tips for building with VS2015:
* In Cmake don't use "USE_MYSQL_SOURCES"
* Release build has linking errors, debug builds fine


# What this core brings:
extras/sunwell.pl/index.html

# Reason for publication:
https://web.archive.org/web/20160110115725/http://sunwell.pl/


# Used to build this:
VS2015
mysql-installer-community-5.7.11.0
https://trinitycore.atlassian.net/wiki/display/tc/Requirements



---- 

# 2016-02-16

INFORMATIONS FOR INTERESTED DEVELOPERS:

1) SunwellCore is a TrinityCore fork created in 2009. It was developed by xinef & pussywizard until the beginning of 2016. More details about the core can be found on sunwell.pl webpage. Feel free to run your own server on it or use parts of it, however leaving "SunwellCore" in server Motd and/or in ".server info" would be nice of you.

2) We stopped mass-merging TrinityCore changes in 2012 and started being picky. Since then we merged only useful changes and skipped some unnecessary and faulty ones. You will not find some TrinityCore's huge structural changes on SunwellCore (eg. we are still using ACE). Latest merged changes from TC are from around 01 November 2015.

3) There might be a few hackfixes in the code, some good coding practices might have been violated, some things were coded over 4-5 years ago and would have been done differently if coded now, etc. At the moment we don't really care if you find a thing or two you consider not neat. You can fix ten bugs for your players, or spend a day creating pretty solution for just one of them. Nevertheless, we avoided hackfixes and shitty fixes as much as possible.

4) To use this core for your existing TrinityCore server, some changes need to be made to TrinityCore database. Sql files for that are in /core/sql/structure/ directory. Clean databases provided by us have the correct structure for SunwellCore, and the world database provided has all our fixes applied. Clean logon database has 10 accounts created: test1 to test10, with password "a".

5) We provided our worldserver.conf and authserver.conf, because there are some custom config settings for our functionality / fixes. You can find them at the end of worldserver.conf.

6) Proper CPU and MySQL settings are essential to achieve optimal server performance.
- For CPU: Be sure to read about C-states. Configure the CPU governor in your OS to keep the CPU in high-energy states (C0, C1) all the time. Then test real CPU frequency per core to confirm correct settings.
- For MySQL: Give InnoDB buffer enough RAM to fit whole db and also tweak other parameters. We provided our config file for your insight. We used Percona as MySQL server.

7) Karazhan is in the middle of being rewritten and is disabled, because changes were not tested. Please test it yourself before enabling and maybe finish fixing it.

8) If 6-7k players online (without faking) is too little for you, consider doing the following changes to the core:
- Split global storages for objects (eg. HashMapHolder<Creature>) to be per-map, to avoid maps accessing them concurrently and locking.
- Change GridRefManager data structure to one that utilizes contiguous memory (eg. vector). That will give a significant performance boost because of CPU cache. Deleting from the middle of that vector could be simply swapping deleted element with the last one and then deleting the last one (the order of elements is irrelevant) to avoid moving memory blocks on delete.
- Merge conditions optimizations from TC (31586056034fe730a7a89ddc7200e9087a9440aa, 6ab90cc57ddfcda78055c04c72732425834b60a3, 57c4b3d42cbd5052313ef30ecc803d276985810a, cba122ad94af5081fa748c5d77842dd5205e7b67, 14d382f185ada74f3b60b3d323b0eb1f98ea9181).
- Merge spell category/cooldown changes from TC (7dcddd90be6e49281ca04239de5839e757ef3f7a, with later bug fixes).
- Move who list handling to a separate thread (who list data cache is already implemented). There is absolutely no reason to limit who list usage so much, other than pop faking.

This should be enough to support real 9k players online with average update time diff below 100ms. If that's still not enough, implement asynchronous map updates ;d

9) There's a very small chance something got broken when we cleaned up some of our custom changes in the core.

10) There is absolutely no reason for servers to be so bugged in 2016. More fixing, less promotional videos guys.
