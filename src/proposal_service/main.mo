import Principal "mo:base/Principal";
import Map "mo:hashmap/Map";

import Types "./src/Types";

// Service Purpose: to create and manage DAOs, Proposals
actor ProposalDao {
    // Data
    stable var proposalsIndex : Nat = 0;
    let proposals = Map.new<Nat, Types.Proposal>();

    // let votes : [Vote] = [];

    // Methods
    public shared query (msg) func whoami() : async Principal {
        return msg.caller;
    };

    public query func test() : async () {
        // DbTest.runTests();
    };

    // CRUD
    // ==============

    public func createProposal(principal : Text, body : Text) : () {
        // increment index
        let currentIndex = proposalsIndex;
        proposalsIndex += 1;

        // create record
        let p : Types.Proposal = {
            id = currentIndex;
            principal = principal;
            body = body;
        };

        // save in DB
        Map.set(proposals, Map.nhash, currentIndex, p);
    };

    // public func getProposal(id : Nat) : async Proposal {
    //    return proposals.get(id).value();
    //};

    // public func getVotes() : async [Vote] {
    //     return votes;
    // };

    private func cleanDb() : () {

    };
};
