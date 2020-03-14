package topggwrapper;

/**
* An example class for this project.
**/
class Main {

    /**
    * Runs the example.
    **/
    public static function main() {
        var args = Sys.args();

        var token = null;
        var botId = null;

        for (str in args) {
            if (str.indexOf("token=") == 0) {
                token = str.substr(6);
            } else if (str.indexOf("bot=") == 0) {
                botId = str.substr(4);
            }
        }

        if (token == null) {
            trace("Token is not set");
            return;
        }
        if (botId == null) {
            trace("Bot ID is not set");
            return;
        }

        var wrapper = WrapperBuilder.builder()
        .setToken(token)
        .setBotId(botId)
        .create();

        trace(wrapper.getStats(wrapper.getBotId()));
    }
}
