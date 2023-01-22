import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface DaoInfo {
  'description' : string,
  'ledgerCanister' : string,
  'codename' : string,
}
export type Result = { 'ok' : DaoInfo } |
  { 'err' : string };
export type Result_1 = { 'ok' : string } |
  { 'err' : string };
export interface _SERVICE {
  'createDao' : ActorMethod<[string, string, string], Result_1>,
  'getDao' : ActorMethod<[string], Result>,
}
