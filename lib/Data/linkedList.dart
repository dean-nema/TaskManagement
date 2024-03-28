class Node {
  dynamic data;
  Node? next;

  Node(dynamic data) {
    this.data = data;
  }
}

class LinkedListD {
  Node? start;
  Node? tail;

  LinkedListD(Node nd) {
    this.start = nd;
    this.tail = nd;
  }

  void addAtStart(Node nd) {
    if (start == null) {
      start = nd;
      tail = nd;
    }else{
    nd.next = start;
    start = nd;
    }
   
  }

  void deleteNode(Node nd) {
    Node node = start!;
    bool state = true;
    if (node == nd) {
      start = node.next!;
      state = false;
    } else {
      while (state) {
        node = node.next!;
        if (node.next == nd) {
          state = false;
        }
      }
      Node after = node.next!;
      node.next = after.next!;
    }
    print("deleted node which has ${nd.data}");
  }

  void deleteNodeS(dynamic dat) {
    Node node = start!;
    bool state = true;
    if (node.data == dat) {
      start = node.next!;
      state = false;
      print("Deleted $dat");
    }
    while (state) {
      Node node1 = node.next!;
      if (node1.data == dat) {
        node.next = node1.next;
        state = false;
      }
      node = node.next!;
    }
    print("Deleted $dat");
  }

  List getNodesData() {
    Node nd = start!;
    late Node nd1; //temporary stores a node
    List<dynamic> array = [nd.data];
    while (nd.next != null) {
      nd1 = nd.next!;
      array.add(nd1.data!);
      nd = nd1;
    }

    return array;
  }
}
