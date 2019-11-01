# odin-sparse_bitset

This is an efficient sparse bitset implementation (based on "An Efficient Representation for Sparse Sets"; http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.30.7319&rep=rep1&type=pdf)

For an alternate explanation: https://research.swtch.com/sparse

A `SparseBitSet` structure is provided, representing a sparse set that can store `[0..N]` elements whose values must be `<N`.

## Example Code:

```odin
package main

import "core:fmt"
using import "shared:odin-sparse_bitset"

print :: proc(using s: ^SparseBitSet($N, $T)) {
	fmt.println("---------- SparseBitSet ----------");
	fmt.println("dense: ", dense);
	fmt.println("sparse: ", sparse);
	fmt.println("n: ", n);
	fmt.println("----------------------------------\n");
}

main :: proc() {
	N :: 32;
	T :: int;

	bs : SparseBitSet(N, T);
	s := &bs;

	assert(insert(s, 1));
	assert(insert(s, 4));
	assert(insert(s, 9));

	assert(!insert(s, 4));
	assert(s.n == 3);

	print(s);

	fmt.println(contains(s, 4));

	assert(unordered_remove(s, 4));

	print(s);

	assert(contains(s, 1));
	assert(!contains(s, 4));
	assert(contains(s, 9));

	insert(s, 4);

	print(s);

	assert(contains(s, 1));
	assert(contains(s, 4));
	assert(contains(s, 9));

	assert(ordered_remove(s, 1));

	print(s);

	assert(!contains(s, 1));
	assert(contains(s, 4));
	assert(contains(s, 9));

	assert(insert(s, 2));
	assert(insert(s, 6));
	assert(insert(s, 11));

	print(s);

	for i in 0..<N {
		v := i == 4 || i == 9 || i == 2 || i == 6 || i == 11;
		assert(contains(s, T(i)) == v);
	}

	assert(ordered_remove(s, 2));

	print(s);

	clear(s);

	print(s);

	assert(insert(s, 1));
	assert(insert(s, 4));
	assert(insert(s, 9));
	assert(insert(s, 2));
	assert(insert(s, 6));
	assert(insert(s, 5));
	assert(insert(s, 12));

	for_each(s, proc(x: T) {
		fmt.println(x);	
	});
}
```