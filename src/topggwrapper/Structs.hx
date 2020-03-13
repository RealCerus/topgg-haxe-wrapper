package topggwrapper;

typedef StructBase = {}

typedef StatsBasic = {
    > StructBase,
    var server_count:Int;
}

typedef StatsShardSingle = {
    > StatsBasic,
    var shard_id:Int;
    var shard_count:Int;
}

typedef StatsShardMulti = {
    > StructBase,
    var shards:Array<Int>;
}

typedef User = {
    > StructBase,
    var id:String;
    var username:String;
    var discriminator:String;
    var avatar:String;
}

// Responses

typedef VoteMultiplierResponse = {
    > StructBase,
    var is_weekend:Bool;
}

typedef UserVoteResponse = {
    > StructBase,
    var voted:Int;
}

// Value

typedef Error = {
    var message:String;
}

typedef Value = {
    var error:Error;
    var val:StructBase;
}