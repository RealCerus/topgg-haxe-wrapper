package topggwrapper.impl;

import haxe.Json;
import restclient.RestClient;
import topggwrapper.Structs.StatsBasic;
import topggwrapper.Structs.User;
import topggwrapper.Structs.UserVoteResponse;
import topggwrapper.Structs.VoteMultiplierResponse;

class TopGgWrapperImpl implements TopGgWrapper {

    static final baseUrl:String = "https://top.gg/api";

    private final token:String;
    private final botId:String;

    public function new(_token:String, _botId:String) {
        token = _token;
        botId = _botId;
    }

    public function setStatsBasic(serverCount:Int):Void {
        post(baseUrl + '/bots/$botId/stats', null, null, Json.stringify({
            server_count: serverCount
        }));
    }

    public function setStatsShardSingle(shardId:Int, shardTotal:Int, serverCount:Int):Void {
        post(baseUrl + '/bots/$botId/stats', null, null, Json.stringify({
            shard_id: shardId,
            shard_count: shardTotal,
            server_count: serverCount
        }));
    }

    public function setStatsShardMulti(shardServerCounts:Array<Int>):Void {
        post(baseUrl + '/bots/$botId/stats', null, null, Json.stringify({
            shards: shardServerCounts
        }));
    }

    public function getStats(botId:String):StatsBasic {
        return Json.parse(get(baseUrl + '/bots/$botId/stats'));
    }

    public function getVoters(botId:String):Array<User> {
        return (Json.parse(get(baseUrl + '/bots/$botId/votes')):Array<User>);
    }

    public function getUser(userId:String):User {
        return Json.parse(get(baseUrl + '/users/$userId'));
    }

    public function hasVoted(userId:String):Bool {
        return (Json.parse(get(baseUrl + '/bots/$botId/check', ["userId" => userId])):UserVoteResponse).voted != 0;
    }

    public function isMultiplier():Bool {
        return (Json.parse(get(baseUrl + "/weekend")):VoteMultiplierResponse).is_weekend;
    }

    private function get(url:String, params:Map<String, String> = null, onError:String -> Void = null):String {
        if (onError == null) onError = function(error:String) {
            trace('Error while performing request to $url: $error');
        }
        return RestClient.get(url, params, ["Authorization" => token], onError);
    }

    private function post(url:String, params:Map<String, String> = null, onError:String -> Void = null, body:String = null):String {
        if (onError == null) onError = function(error:String) {
            trace('Error while performing request to $url: $error');
        }
        return RestClient.post(url, params, ["Authorization" => token, "Content-Type" => "application/json"], body, onError);
    }

    public function getBotId():String {
        return botId;
    }

}
