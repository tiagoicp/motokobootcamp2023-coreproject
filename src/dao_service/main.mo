import Map "mo:hashmap/Map";
import Result "mo:base/Result";

import T "./types/Types";
rkp4c-7iaaa-aaaaa-aaaca-cai


// Service Purpose: to create and manage DAOs
actor DaoService {
    // Data
    // ==============
    stable let daos = Map.new<Text, T.Dao>();

    // CRUD
    // ==============
    public shared ({ caller }) func createDao(codename : Text, ledgerCanister : Text, description : Text) : async Result.Result<Text, Text> {
        let result = CreateDaoService.call(daos, codename, ledgerCanister, description, caller);

        return #ok("DAO created with success");
    };

    public query func getDao(codename : Text) : async Result.Result<T.DaoInfo, Text> {
        switch (Map.get(daos, Map.thash, codename)) {
            case (?d) return #ok(d);
            case (_) return #err("Not Found");
        };
    };

    public shared ({ caller }) func cleanDb() : async () {
        Map.clear(daos);
    };
};
