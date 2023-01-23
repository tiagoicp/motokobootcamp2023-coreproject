module {
    public type Proposal = {
        id : Nat;
        principal : Principal;
        body : Text;
    };

    public let validProposal = {
        body = "This is a sample proposal for specs.";
    };

};
