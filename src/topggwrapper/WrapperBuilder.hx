package topggwrapper;

import topggwrapper.impl.TopGgWrapperImpl;

class WrapperBuilder {

    private var token:String;
    private var botId:String;

    private function new() {}

    static public function builder():WrapperBuilder {
        return new WrapperBuilder();
    }

    public function setToken(_token:String):WrapperBuilder {
        token = _token;
        return this;
    }

    public function setBotId(_botId:String):WrapperBuilder {
        botId = _botId;
        return this;
    }

    public function create():TopGgWrapper {
        return new TopGgWrapperImpl(token, botId);
    }

}
