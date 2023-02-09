class PriorityQueue<T> {
  PriorityQueue(this.compare) : _heap = <T>[];

  final int Function(T a, T b) compare;
  final List<T> _heap;

  int get length => _heap.length;

  T get first => _heap.first;

  void add(T value) {
    _heap.add(value);
    _heapifyUp(_heap.length - 1);
  }

  T removeFirst() {
    final T first = _heap.first;

    _swap(0, _heap.length - 1);
    _heap.removeLast();
    _heapifyDown(0);

    return first;
  }

  void _heapifyUp(int index) {
    int currentIndex = index;

    while (currentIndex > 0) {
      final int parentIndex = (currentIndex - 1) ~/ 2;

      if (compare(_heap[currentIndex], _heap[parentIndex]) >= 0) {
        break;
      }

      _swap(currentIndex, parentIndex);

      currentIndex = parentIndex;
    }
  }

  void _heapifyDown(int index) {
    int currentIndex = index;

    while (true) {
      final int leftChildIndex = currentIndex * 2 + 1;
      final int rightChildIndex = currentIndex * 2 + 2;

      int smallestIndex = currentIndex;

      if (leftChildIndex < _heap.length &&
          compare(_heap[leftChildIndex], _heap[smallestIndex]) < 0) {
        smallestIndex = leftChildIndex;
      }

      if (rightChildIndex < _heap.length &&
          compare(_heap[rightChildIndex], _heap[smallestIndex]) < 0) {
        smallestIndex = rightChildIndex;
      }

      if (smallestIndex == currentIndex) {
        break;
      }

      _swap(currentIndex, smallestIndex);

      currentIndex = smallestIndex;
    }
  }

  void _swap(int a, int b) {
    final T temp = _heap[a];

    _heap[a] = _heap[b];
    _heap[b] = temp;
  }
}
