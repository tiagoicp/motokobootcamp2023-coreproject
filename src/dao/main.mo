import Principal "mo:base/Principal";
import Map "./lib/Map/lib";

actor SnsHarborDao {

    // type proposals Map ;
    // type votesPerProposal;

    public shared query (msg) func whoami() : async Principal {
        return msg.caller;
    };
};
