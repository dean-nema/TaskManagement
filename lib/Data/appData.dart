import 'dart:collection';

import 'package:tasker/Data/queue.dart';
import 'package:tasker/Users/users.dart';

class Data {
  //initiate users
  static Users manager = Users("Manager", "password", "mng");
  static Users emp001 = Users("Emp001", "password", "emp");
  static Users emp002 = Users("Emp002", "password", "emp");

  static Map<String, Users> users = {
    "Manager": manager,
    "Emp001": emp001,
    "Emp002": emp002
  };
  static List<Users> employees = [emp001, emp002];

  static QueueD toEmployee = QueueD();
  static QueueD toManager = QueueD();
}
