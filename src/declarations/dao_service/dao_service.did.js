export const idlFactory = ({ IDL }) => {
  const Result_1 = IDL.Variant({ 'ok' : IDL.Text, 'err' : IDL.Text });
  const DaoInfo = IDL.Record({
    'description' : IDL.Text,
    'ledgerCanister' : IDL.Text,
    'codename' : IDL.Text,
  });
  const Result = IDL.Variant({ 'ok' : DaoInfo, 'err' : IDL.Text });
  return IDL.Service({
    'cleanDb' : IDL.Func([], [], []),
    'createDao' : IDL.Func([IDL.Text, IDL.Text, IDL.Text], [Result_1], []),
    'getDao' : IDL.Func([IDL.Text], [Result], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
