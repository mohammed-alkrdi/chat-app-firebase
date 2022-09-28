class UserModel {
  final String name;
  final String email;
  final String uid;
  final String profilPic;
  final String phoneNumber;
  final bool isOnline;
  final List<String> groupId;

  UserModel(
      {required this.name,
      required this.email,
      required this.uid,
      required this.profilPic,
      required this.phoneNumber,
      required this.isOnline,
      required this.groupId});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'profilePic': profilPic,
      'phoneNumber': phoneNumber,
      'isOnline': isOnline,
      'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        uid: map['uid'] ?? '',
        profilPic: map['profilPic'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        isOnline: map['isOnline'] ?? false,
        groupId: List<String>.from(map['groupId']));
  }
}
