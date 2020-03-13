package topggwrapper;

import topggwrapper.impl.TopGgWrapperImpl;
import topggwrapper.Structs.StatsBasic;
import topggwrapper.Structs.User;

interface TopGgWrapper {

    public function setStatsBasic(serverCount:Int):Void;

    public function setStatsShardSingle(shardId:Int, shardTotal:Int, serverCount:Int):Void;

    public function setStatsShardMulti(shardServerCounts:Array<Int>):Void;

    public function getStats(botId:String):StatsBasic;

    public function getVoters(botId:String):Array<User>;

    public function getUser(userId:String):User;

    public function hasVoted(userId:String):Bool;

    public function isMultiplier():Bool;

    public function getBotId():String;

}
