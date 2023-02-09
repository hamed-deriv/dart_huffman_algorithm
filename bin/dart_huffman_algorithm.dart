import 'package:dart_huffman_algorithm/dart_huffman.dart';

void main(List<String> arguments) {
  final HuffmanCoding huffmanCoding = HuffmanCoding();

  final String encodeResult = huffmanCoding.encode('hamed');
  print(encodeResult);

  final String decodeResult = huffmanCoding.decode(encodeResult);
  print(decodeResult);
}
