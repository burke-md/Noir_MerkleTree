use dep::std::hash::poseidon::bn254::hash_1;
use dep::std::hash::poseidon::bn254::hash_2;

fn main(_values : [Field; 4]) -> pub Field {
    let tup: (Field, Field, Field, Field) = (
        hash_1([_values[0]]),
        hash_1([_values[1]]),
        hash_1([_values[2]]),
        hash_1([_values[3]])
    );

    let (leaf_1, leaf_2, leaf_3, leaf_4) = tup;
    
    let interNode_1: Field = hash_2([leaf_1, leaf_2]);
    let interNode_2: Field = hash_2([leaf_3, leaf_4]);
    let root: Field = hash_2([interNode_1, interNode_2]);
    
    root

}

#[test]
fn test_main() {
    //assert(main(1, 2) == 3);
}
