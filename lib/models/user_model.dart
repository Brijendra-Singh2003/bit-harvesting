class UserModel {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String uid;

  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.password,
      required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}
