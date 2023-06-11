# Noir Merkle Trees
Explore Merkle root proofs with the Noir lang

From within `MerkleTree` run the following: 

```
nargo check
```

This will generate `Prover.toml` and `Verifier.toml`, The input/output files.

Add the appropriate values to `Prover.toml` for the inputs and run:

```
nargo prove p
```

This will have generated `proofs/p.proof` and updated `Verifier.toml`

We can now run `nargo verify p` to verify the proof. Notice the argument `p` here
is the same as the name given when generating the proof in the previous step. 

If the proof is verified, there will be no notice, while an error is produced if 
it fails. 
