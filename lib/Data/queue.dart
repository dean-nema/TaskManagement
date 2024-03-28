import 'package:tasker/Data/linkedList.dart';

class QueueD {
  //variables
  LinkedListD? list = null;

  void enqueue(dynamic data) {
    if (list == null) {
      list = LinkedListD(Node(data));
    } else {
      list!.addAtStart(Node(data));
    }
  }

  dynamic? dequeue() {
    if (list == null || list!.start == null) {
      return null;
    }

    Node? node = list!.start!.next;
    Node finalNode = list!.start!;
    list!.start = node;
    return finalNode.data;
  }

  dynamic peek() {
    if (list != null && list!.start != null) {
      return list!.start!.data!;
    } else {
      List<int> otherData = [0, 0];
      return otherData;
    }
  }

  //get queue data
  List<dynamic>? getData() {
    List<dynamic>? data = List.empty(growable: true);
    if (list != null && list!.start != null) {
      data.add(list!.start!.data!);
      Node? n = list!.start;
      n = n!.next;
      while (n != null) {
        data.add(n.data);
        n = n!.next;
      }
    } else {
      data = null;
    }
    return data;
  }

  //get queue length
  int getLength() {
    int count = 0;
    if (list == null || list!.start == null) {
      return 1;
    } else {
      count = 1;
      Node? n = list!.start;
      while (n != null) {
        n = n.next;
        count++;
      }
      return count;
    }
  }

  //empty
  bool isEmpty() {
    if (list == null || list!.start == null) {
      return true;
    } else {
      return false;
    }
  }
}
