class UserModel{
  late String userId;
  late String userUser;
  late String userName;
  late String userAName;
  late String userCurp;
  late String userEmail;
  late String userPhone;
  late String userCorp;
  late String userPassword;

  UserModel(this.userId, this.userUser, this.userName, this.userAName, this.userCurp, this.userEmail, this.userPhone, this.userCorp, this.userPassword);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': userId,
      'user_user': userUser,
      'user_name': userName,
      'user_aname': userAName,
      'user_curp': userCurp,
      'email': userEmail,
      'phone': userPhone,
      'corp': userCorp,
      'password': userPassword
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    userId = map['user_id'];
    userUser = map['user_user'];
    userName = map['user_name'];
    userAName = map['user_aname'];
    userCurp = map['user_curp'];
    userEmail = map['email'];
    userPhone = map['phone'];
    userCorp = map['corp'];
    userPassword = map['password'];
  }
}