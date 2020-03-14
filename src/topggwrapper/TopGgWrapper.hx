package topggwrapper;

import topggwrapper.Structs.StatsBasic;
import topggwrapper.Structs.User;

/**
* Interface of the top.gg wrapper.
**/
interface TopGgWrapper {

    /**
    * Sets the amount of servers the bot is on
    **/
    function setStatsBasic(serverCount:Int):Void;

    /**
    * Sets the amount of servers of the shard
    **/
    function setStatsShardSingle(shardId:Int, shardTotal:Int, serverCount:Int):Void;

    /**
    * Sets the amount of servers of the shards
    **/
    function setStatsShardMulti(shardServerCounts:Array<Int>):Void;

    /**
    * Returns basic stats of the provided bot
    **/
    function getStats(botId:String):StatsBasic;

    /**
    * Returns an array of users who have voted for the bot
    **/
    function getVoters(botId:String):Array<User>;

    /**
    * Returns a top.gg user with the given id
    **/
    function getUser(userId:String):User;

    /**
    * Returns whether a user with the given id has voted or not
    **/
    function hasVoted(userId:String):Bool;

    /**
    * Returns if there's a vote multiplier
    **/
    function isMultiplier():Bool;

    /**
    * Getter for the botId field
    **/
    function getBotId():String;

}
