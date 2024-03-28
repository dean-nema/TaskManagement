

import 'package:tasker/pages/eDashboard.dart';
import 'package:tasker/pages/login.dart';
import 'package:tasker/pages/mDashboard.dart';

class AppRoutes {
  static final pages = {
    //lol this is a map
    login: (context) => Login(),
    mDash: (context) => MDashboard(),
    eDash: (context) => EDashBoard()
  };
  static const login = '/';
  static const mDash = '/mDash';
  static const eDash = '/eDash';

  // static const editPofile = '/edit_profile';
  // static const nearby = '/nearby_page';
}
