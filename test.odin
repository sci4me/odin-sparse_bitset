package sparse_bitset

import "core:fmt"

main :: proc() {
    bs: SparseBitSet(16, int);

    insert(&bs, 4);
    insert(&bs, 2);
    insert(&bs, 7);
    insert(&bs, 12);

    fmt.println(bs, "\n");

    assert(contains(&bs, 4));
    assert(contains(&bs, 2));
    assert(contains(&bs, 7));
    assert(contains(&bs, 12));

    assert(!contains(&bs, 0));
    assert(!contains(&bs, 15));
    assert(!contains(&bs, 6));

    insert(&bs, 1);
    insert(&bs, 5);

    fmt.println(bs, "\n");

    for_each(&bs, proc(x: int) {
        fmt.println(x);
    });
    fmt.println();

    ordered_remove(&bs, 2);

    fmt.println(bs, "\n");

    unordered_remove(&bs, 12);

    fmt.println(bs, "\n");

    assert(!contains(&bs, 2));
    assert(!contains(&bs, 12));

    clear(&bs);

    for i in 0..<16 do assert(!contains(&bs, i));
}