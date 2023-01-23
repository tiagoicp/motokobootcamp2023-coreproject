import Result "mo:base/Result";
import Map "mo:hashmap/Map";
import Types "./src/Types";

// Service Purpose: to create and manage DAOs
actor DaoService {
    // Data
    // ==============
    stable let daos = Map.new<Text, Types.Dao>();

    // CRUD
    // ==============
    public shared ({ caller }) func createDao(codename : Text, ledgerCanister : Text, description : Text) : async Result.Result<Text, Text> {
        // check if it does not exist already
        switch (Map.get(daos, Map.thash, codename)) {
            case (?d) return #err("Codename already exists");
            case (_) {};
        };

        // create record
        let newDao : Types.Dao = {
            principal = caller;
            codename = codename;
            ledgerCanister = ledgerCanister;
            description = description;
        };

        // save in Map
        Map.set(daos, Map.thash, codename, newDao);

        return #ok("DAO created with success");
    };

    public query func getDao(codename : Text) : async Result.Result<Types.DaoInfo, Text> {
        switch (Map.get(daos, Map.thash, codename)) {
            case (?d) return #ok(d);
            case (_) return #err("Not Found");
        };
    };

    public shared ({ caller }) func cleanDb() : async () {
        Map.clear(daos);
    };
};
