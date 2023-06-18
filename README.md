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

![Screen Shot 2023-06-17 at 12 07 58 PM](https://github.com/burke-md/Noir_MerkleTree/assets/22263098/4fad201b-634d-4bb7-807b-a1541e3449aa)

The ROOT of this tree is `0x289975d2db0b11a41e68d044249299ef957d2742cac18aa788ffcf54e8a5dbca`

The value in Node 2 is `0x091694ea829fdeffbd3d2fd7c5bc449f8f8ddf8024a74dbb28cd144438f68ee6`

As the owner of, or user with knowledge of the second address(shown as data2 in the above graphic), 
we will require a hash path with leaf 2 and intermediary node 2 to prove our inclusion.

The following steps will be followed for validation:

- Hash our address (data 2) to create leaf 2
- Hash leaf 2 w/ leaf 1 to produce node 1
- Hash node 1 w/ node 2

If the outcome of our final hash matches the provided root, our membership has been proven. 

Note:

At no time are we made aware of the other three data points. Only their hashed values, which are 
typically obscured via the use of a one way hash function.
