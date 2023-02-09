import 'package:test/test.dart';

import 'package:dart_huffman_algorithm/dart_huffman.dart';

void main() {
  test('Huffman Coding Test', () {
    final HuffmanCoding coding = HuffmanCoding();

    const String input = 'aaaabbbbcccdde';
    final String encoded = coding.encode(input);
    final String decoded = coding.decode(encoded);

    expect(input, decoded);

    final int encodedLength = encoded.length;

    expect(encodedLength, lessThan(input.length * 8));
  });
}
