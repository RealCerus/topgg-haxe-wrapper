package topggwrapper;

typedef StatsBasic = {
    var server_count:Int;
}

typedef StatsShardSingle = {
    var shard_id:Int;
    var shard_count:Int;
}

typedef StatsShardMulti = {
    var shards:Array<Int>;
}

typedef User = {
    var id:String;
    var username:String;
    var discriminator:String;
    var avatar:String;
}

typedef VoteMultiplierResponse = {
    var is_weekend:Bool;
}

typedef UserVoteResponse = {
    var voted:Int;
}