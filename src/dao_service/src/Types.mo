import Principal "mo:base/Principal";
module Types {
    // TODO: Add timestamps (created and updated at)
    public type DaoProtected = { principal : Principal };
    public type DaoInfo = {
        codename : Text;
        ledgerCanister : Text;
        description : Text;
    };

    public type Dao = DaoInfo and DaoProtected;
};
