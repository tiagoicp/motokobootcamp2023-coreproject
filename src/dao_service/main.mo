import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Types "./src/Types";
import Map "./lib/Map";

// Service Purpose: to create and manage DAOs
actor DaoService {
    // Data
    // ==============
    stable var daoIndex : Nat = 0;
    stable let daos = Map.new<Text, Types.Dao>(Map.thash);

    // CRUD
    // ==============
    public shared ({ caller }) func createDao(codename : Text, ledgerCanister : Text, description : Text) : async Result.Result<Text, Text> {
        // create record
        let newDao : Types.Dao = {
            principal = caller;
            codename = codename;
            ledgerCanister = ledgerCanister;
            description = description;
        };

        // save in Map
        Map.set(daos, Map.thash, codename, newDao);

        return #ok("DAO created succesfully");
    };

    public query func getDao(codeName : Text) : async Result.Result<Types.DaoInfo, Text> {
        switch (Map.get(daos, Map.thash, codeName)) {
            case (?d) { return #ok(d) };
            case (null) { return #err("Not Found") };
        };
    };
};
