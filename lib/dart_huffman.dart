import 'priority_queue.dart';

class Node {
  Node(this.frequency, this.character, [this.left, this.right]);

  int frequency;
  String? character;
  Node? left;
  Node? right;
}

class HuffmanCoding {
  Map<String, String> encodeTable = <String, String>{};
  Map<String, String> decodeTable = <String, String>{};

  void buildEncodingTable(Node? root, String string) {
    if (root == null) {
      return;
    }

    if (root.character != null) {
      encodeTable[root.character!] = string;
      decodeTable[string] = root.character!;
    }

    buildEncodingTable(root.left, '${string}0');
    buildEncodingTable(root.right, '${string}1');
  }

  Node buildHuffmanTree(Map<String, int> frequencyMap) {
    final PriorityQueue<Node> priorityQueue = PriorityQueue<Node>(
      (Node a, Node b) => a.frequency - b.frequency,
    );

    frequencyMap.forEach((String character, int frequency) {
      priorityQueue.add(Node(frequency, character));
    });

    while (priorityQueue.length > 1) {
      final Node left = priorityQueue.removeFirst();
      final Node right = priorityQueue.removeFirst();

      final Node parent =
          Node(left.frequency + right.frequency, null, left, right);

      priorityQueue.add(parent);
    }

    return priorityQueue.first;
  }

  String encode(String input) {
    final Map<String, int> frequencyMap = <String, int>{};

    for (int i = 0; i < input.length; i++) {
      final String character = input[i];

      frequencyMap[character] =
          frequencyMap[character] == null ? 1 : frequencyMap[character]! + 1;
    }

    final Node root = buildHuffmanTree(frequencyMap);

    buildEncodingTable(root, '');

    final StringBuffer encodedString = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      encodedString.write(encodeTable[input[i]]!);
    }

    return encodedString.toString();
  }

  String decode(String encoded) {
    String decoded = '';
    StringBuffer current = StringBuffer();

    for (int i = 0; i < encoded.length; i++) {
      current.write(encoded[i]);

      final String currentString = current.toString();

      if (decodeTable.containsKey(currentString)) {
        decoded += decodeTable[currentString]!;

        current = StringBuffer();
      }
    }

    return decoded;
  }
}
