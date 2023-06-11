fn main(x : Field, y : Field) -> pub Field {
    x + y
}

#[test]
fn test_main() {
    assert(main(1, 2) == 3);
}
