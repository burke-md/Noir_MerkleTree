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

We can now run:
```
nargo verify p
``` 

This will verify the proof. Notice the argument `p` here is the same as the name 
given when generating the proof in the previous step. We are able to generate 
multiple proofs (stored in the proofs dirrectory) by updating the values in 
`Prover.toml` and calling the `nargo prove <new proof name>`. However, the output of
the most recent proof will overwrite the preivous in `Verifier.toml`.

If the proof is verified, there will be no notice, while an error is produced if 
it fails. 


## Example

We will use four addresses as data while creating a new merkle root.
- 0xdAC17F958D2ee523a2206206994597C13D831ec7
- 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48
- 0x6B175474E89094C44Da98b954EedeAC495271d0F
- 0xB8c77482e45F1F44dE1745F52C74426C631bDD52

As we walk through the tree(bottom up), these addresses will be hashed into leaves, and then 
two leaves will be hashed into an intermediary node. The two nodes will then be hashed into
the root value. While some merkle tree implementations hash the concatination of two values,
we will use an available hash method that accepts two inputs and not worry about under the 
hood details.
