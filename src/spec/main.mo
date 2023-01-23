import Result "mo:base/Result";
import Debug "mo:base/Debug";

import DaoService "canister:dao_service";
import ProposalService "canister:proposal_service";

import DaoFactory "./factories/DaoFactory";
import ProposalFactory "./factories/ProposalFactory";

// Purpose: Specs, doing backend e2e testing on repo canisters
// Simply call " dfx canister call spec run"
// For specific canisters, call any of the other public methods
// TODO: integrate Kype Peacock's package for more expressive specing
actor Spec {
    public func run() : async () {
        await specDao();
        await specProposal();
    };

    public func specDao() : async () {
        // setup
        await DaoService.cleanDb();
        let aDao = DaoFactory.validDao;

        // it creats a DAO
        assert (Result.isOk(await DaoService.createDao(aDao.codename, aDao.ledgerCanister, aDao.description)));

        // it gets info from DAO
        let response : Result.Result<DaoFactory.DaoInfo, Text> = await DaoService.getDao(aDao.codename);
        assert (Result.isOk(response));
        switch (response) {
            case (#ok(daoRecord)) {
                assert (daoRecord.codename == aDao.codename);
                assert (daoRecord.ledgerCanister == aDao.ledgerCanister);
                assert (daoRecord.description == aDao.description);
            };
            case (#err(msg)) { assert false };
        };
    };

    public func specProposal() : async () {
        // setup
        let aProposal = ProposalFactory.validProposal;

        // it creates proposals
        assert (Result.isOk(await ProposalService.createProposal(aProposal.body)));

        // it lists proposals
        // it reads a proposal and counts votes // todo cache or re-count system
        //
        // it creates votes

        // it adds votes

        // it reads proposals
        // let proposals : [Proposal] = Db.getProposals();
        // Debug.print(debug_show (proposals.size()));
        // assert false;

        // it reads votes

    };
};
