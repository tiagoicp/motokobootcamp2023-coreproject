import Principal "mo:base/Principal";

actor SnsHarborDao {
    public shared query (msg) func whoami() : async Principal {
        return msg.caller;
    };
};