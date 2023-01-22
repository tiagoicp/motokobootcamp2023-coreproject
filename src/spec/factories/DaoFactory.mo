import Principal "mo:base/Principal";

module {
    public type DaoInfo = {
        codename : Text;
        ledgerCanister : Text;
        description : Text;
    };

    public let validDao : DaoInfo = {
        codename = "motoko-bootcamp";
        ledgerCanister = "123-123-123-123-123-123.cai";
        description = "This is a DAO for the best bootcampers in the world, the Motoko ones!!";
    };
};
