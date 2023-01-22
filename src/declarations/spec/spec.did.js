export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'run' : IDL.Func([], [], []),
    'specDao' : IDL.Func([], [], []),
    'specProposal' : IDL.Func([], [], []),
  });
};
export const init = ({ IDL }) => { return []; };
