export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'createProposal' : IDL.Func([IDL.Text, IDL.Text], [], ['oneway']),
    'test' : IDL.Func([], [], ['query']),
    'whoami' : IDL.Func([], [IDL.Principal], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
