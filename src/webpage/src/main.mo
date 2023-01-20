import Principal "mo:base/Principal";
import Http "./helpers/Http";
import Text "mo:base/Text";

actor SnsHarborWebpage {
    public type HttpRequest = Http.HttpRequest;
    public type HttpResponse = Http.HttpResponse;

    // TODO: implement certificate variables and assets
    public query func http_request(req : HttpRequest) : async HttpResponse {
        return ({
            body = Text.encodeUtf8("This is a cool page");
            headers = [];
            status_code = 200;
            streaming_strategy = null;
        });
    };
};
