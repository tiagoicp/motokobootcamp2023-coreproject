module Types {
    public type Proposal = {
        id : Nat;
        principal : Principal;
        body : Text;
    };

    type voteChoice = { #yes; #no };
    public type Vote = {
        proposalId : Nat;
        principal : Text;
        vote : voteChoice;
    };
};
