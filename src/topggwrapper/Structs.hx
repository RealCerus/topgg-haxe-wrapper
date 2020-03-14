package topggwrapper;

/**
* Represents basic stats of the bot.
**/
typedef StatsBasic = {
    /**
    * Holds the amount of servers the bot is on
    **/
    var server_count:Int;
}

/**
* Represents stats of a single shard of the bot.
**/
typedef StatsShardSingle = {
    /**
    * The id of the shard
    **/
    var shard_id:Int;
    /**
    * The amount of servers of this shard
    **/
    var shard_count:Int;
}

/**
* Represents stats of the bot's shards.
**/
typedef StatsShardMulti = {
    /**
    * Array of all of the shard id's
    **/
    var shards:Array<Int>;
}

/**
* Represents a top.gg user.
**/
typedef User = {
    /**
    * The users Discord id
    **/
    var id:String;
    /**
    * The users Discord username
    **/
    var username:String;
    /**
    * The users Discord discriminator
    **/
    var discriminator:String;
    /**
    * The users Discord avatar (url)
    **/
    var avatar:String;
}

/**
* Represents a response of the /weekend endpoint.
**/
typedef VoteMultiplierResponse = {
    /**
    * Whether today is a weekend or not
    **/
    var is_weekend:Bool;
}

/**
* Represents a response of the /user/check endpoint.
**/
typedef UserVoteResponse = {
    /**
    * 1 if user has voted, otherwise 0
    **/
    var voted:Int;
}