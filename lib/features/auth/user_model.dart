enum UserRole { admin, rider, driver, unknown }

abstract class UserDetails {
  bool newUser;
  String userRole;

  UserDetails({required this.newUser, required this.userRole});

  Map<String, dynamic> toMap() {
    return {
      'newUser': newUser,
      'userRole': userRole,
    };
  }

  factory UserDetails.fromSnapshot(Map<String, dynamic> snapshot) {
    bool newUser = snapshot['newUser'];
    String userRole = snapshot['userRole'];

    return UserDeets(newUser: newUser, userRole: userRole);
  }
}

class UserDeets extends UserDetails {
  UserDeets({required newUser, required userRole})
      : super(newUser: newUser, userRole: userRole);
}

class NewUserDetails extends UserDetails {
  NewUserDetails() : super(newUser: true, userRole: UserRole.unknown.name);
}
