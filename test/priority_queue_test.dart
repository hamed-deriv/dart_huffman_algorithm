import 'package:test/test.dart';

import 'package:dart_huffman_algorithm/priority_queue.dart';

void main() {
  test('Priority Queue Test.', () {
    final PriorityQueue<int> queue =
        PriorityQueue<int>((int a, int b) => a - b);

    expect(queue.length, 0);

    queue
      ..add(3)
      ..add(1)
      ..add(2);

    expect(queue.length, 3);
    expect(queue.first, 1);

    expect(queue.removeFirst(), 1);
    expect(queue.removeFirst(), 2);
    expect(queue.removeFirst(), 3);

    expect(queue.length, 0);
  });
}
