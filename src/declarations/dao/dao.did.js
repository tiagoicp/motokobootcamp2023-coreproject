export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'test' : IDL.Func([], [], ['query']),
    'whoami' : IDL.Func([], [IDL.Principal], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
