class UserModel {
  late String user_id;
  late String user_user;
  late String user_name;
  late String user_aname;
  late String user_curp;
  late String email;
  late String phone;
  late String corp;
  late String password;

  UserModel(
      this.user_id,
      this.user_user,
      this.user_name,
      this.user_aname,
      this.user_curp,
      this.email,
      this.phone,
      this.corp,
      this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'user_user': user_user,
      'user_name': user_name,
      'user_aname': user_aname,
      'user_curp': user_curp,
      'email': email,
      'phone': phone,
      'corp': corp,
      'password': password
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    user_user = map['user_user'];
    user_name = map['user_name'];
    user_aname = map['user_aname'];
    user_curp = map['user_curp'];
    email = map['email'];
    phone = map['phone'];
    corp = map['corp'];
    password = map['password'];
  }
}
