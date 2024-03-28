class Users {
  //variables
  String _userName = "";
  String _password = "";
  String _role = "";

  //constructor
  Users(String name, String pass, String role) {
    this._userName = name;
    this._password = pass;
    this._role = role;
  }

  //getter
  String getRole() {
    return _role;
  }

  String getName() {
    return _userName;
  }

  //methods
  bool isEmployee() {
    return (_role == "emp");
  }

  bool passMatch(String pass) {
    return (pass == _password);
  }
}
