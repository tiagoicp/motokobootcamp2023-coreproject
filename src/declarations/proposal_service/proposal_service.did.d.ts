import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'createProposal' : ActorMethod<[string, string], undefined>,
  'test' : ActorMethod<[], undefined>,
  'whoami' : ActorMethod<[], Principal>,
}
