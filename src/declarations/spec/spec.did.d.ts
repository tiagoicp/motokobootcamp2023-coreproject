import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'run' : ActorMethod<[], undefined>,
  'specDao' : ActorMethod<[], undefined>,
  'specProposal' : ActorMethod<[], undefined>,
}
