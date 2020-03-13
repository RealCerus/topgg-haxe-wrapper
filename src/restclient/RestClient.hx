package restclient;

#if sys
    import haxe.io.BytesOutput;
#end
import haxe.Http;

/**
 * ...
 * @author TABIV, modified by Cerus
 */
class RestClient {
    #if flash
    public static var preferHttpMethodOverride:Bool = true;
    #else
    public static var preferHttpMethodOverride:Bool = false;
    #end

    public static function postAsync(url:String, onData:String -> Void = null, parameters:Map<String, String> = null, headers:Map<String, String> = null, onError:String -> Void = null):Void {
        RestClient.requestAsync("POST", url, onData, parameters, headers, onError);
    }

    public static function getAsync(url:String, onData:String -> Void = null, parameters:Map<String, String> = null, headers:Map<String, String> = null, onError:String -> Void = null):Void {
        RestClient.requestAsync("GET", url, onData, parameters, headers, onError);
    }

    public static function putAsync(url:String, onData:String -> Void = null, parameters:Map<String, String> = null, headers:Map<String, String> = null, onError:String -> Void = null):Void {
        RestClient.requestAsync("PUT", url, onData, parameters, headers, onError);
    }

    public static function deleteAsync(url:String, onData:String -> Void = null, parameters:Map<String, String> = null, headers:Map<String, String> = null, onError:String -> Void = null):Void {
        RestClient.requestAsync("DELETE", url, onData, parameters, headers, onError);
    }

    // No synchronous requests/sockets on Flash
    #if !flash

    public static function post(url:String, parameters:Map<String, String> = null, headers:Map<String, String> = null, body:String = null, onError:String -> Void = null):String {
        return RestClient.request("POST", url, parameters, headers, false, null, onError, body);
    }

    public static function get(url:String, parameters:Map<String, String> = null, headers:Map<String, String> = null, onError:String -> Void = null):String {
        return RestClient.request("GET", url, parameters, headers, onError);
    }

    public static function put(url:String, parameters:Map<String, String> = null, headers:Map<String, String> = null, onError:String -> Void = null):String {
        return RestClient.request("PUT", url, parameters, headers, onError);
    }

    public static function delete(url:String, parameters:Map<String, String> = null, headers:Map<String, String> = null, onError:String -> Void = null):String {
        return RestClient.request("DELETE", url, parameters, headers, onError);
    }
    #end

    public static function requestAsync(verb:String, url:String, onData:String -> Void = null, parameters:Map<String, String> = null, headers:Map<String, String> = null, onError:String -> Void = null):Void {
        var post:Bool = (verb != "GET");
        var httpRequest:Http = RestClient.buildHttpRequest(
            verb,
            true,
            url,
            parameters,
            headers,
            true,
            onData,
            onError);
        httpRequest.request(post);
    }

    private static function request(verb:String, url:String, parameters:Map<String, String> = null, headers:Map<String, String> = null, async:Bool = false, onData:String -> Void = null, onError:String -> Void = null, body:String = null):String {
        var result:String;

        #if sys
        var useOverride = RestClient.preferHttpMethodOverride;
        #else
        var useOverride = true;
        #end
        var post:Bool = (verb != "GET");
        var httpRequest:Http = RestClient.buildHttpRequest(
            verb,
            useOverride,
            url,
            parameters,
            headers,
            false,
            function(data:String) {
                result = data;
            },
            onError,
            body);

        // Use the existing http.request only if sys isn't present
        #if sys
            // TODO: SSL for HTTPS URLs
            var output = new BytesOutput();
            if (useOverride)
                verb = (post ? "POST" : "GET");
            httpRequest.customRequest(false, output, null, verb);
            return output.getBytes().toString();
        #else
        httpRequest.request(post);
        return result;
        #end
    }

    private static function buildHttpRequest(verb:String, useOverride:Bool, url:String, parameters:Map<String, String> = null, headers:Map<String, String> = null, async:Bool = false, onData:String -> Void = null, onError:String -> Void = null, body:String = null):Http {
        var httpRequest = new Http(url);

        #if js
        httpRequest.async = async;
        #end

        if (onError != null) {
            httpRequest.onError = onError;
        }

        if (onData != null) {
            httpRequest.onData = onData;
        }

        if (parameters != null) {
            for (x in parameters.keys()) {
                httpRequest.setParameter(x, parameters.get(x));
            }
        }

        // Add header for non-standard HTTP verbs
        if (useOverride && (verb != "GET") && (verb != "POST")) {
            httpRequest.setHeader("X-HTTP-Method-Override", verb);
        }

        // Set headers
        if (headers != null) {
            for (kv in headers.keyValueIterator()) {
                httpRequest.setHeader(kv.key, kv.value);
            }
        }

        // Set body
        if (body != null && verb == "POST") {
            httpRequest.setPostData(body);
        }

        return httpRequest;
    }
}
