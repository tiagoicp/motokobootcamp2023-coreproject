import Principal "mo:base/Principal";
import Debug "mo:base/Debug";
import Result "mo:base/Result";

import DaoService "canister:dao_service";
import ProposalService "canister:proposal_service";

// Factories
import DaoFactory "./factories/DaoFactory"

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
        // TODO

        // it adds votes

        // it reads proposals
        // let proposals : [Proposal] = Db.getProposals();
        // Debug.print(debug_show (proposals.size()));
        // assert false;

        // it reads votes

    };
};
