import Result "mo:base/Result";
import Map "mo:hashmap/Map";

import Types "./src/Types";

// Service Purpose: to create and manage DAOs, Proposals
actor ProposalDao {
    // Data
    stable var proposalsIndex : Nat = 0;
    let proposals = Map.new<Nat, Types.Proposal>();

    // let votes : [Vote] = [];

    // CRUD
    // ==============

    public shared ({ caller }) func createProposal(body : Text) : async Result.Result<Text, Text> {
        // increment index
        let currentIndex = proposalsIndex;
        proposalsIndex += 1;

        // create record
        let p : Types.Proposal = {
            id = currentIndex;
            principal = caller;
            body = body;
        };

        // save in DB
        Map.set(proposals, Map.nhash, currentIndex, p);

        return #ok("Proposal created with success")
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
