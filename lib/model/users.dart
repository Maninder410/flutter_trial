class Users{
  String? name;
  String? email;
  String? uid;
  String? password;
  bool? isOnline;
  String? profilePhoto;
Users(
    this.name,
    this.email,
    this.uid,
    this.password,
    this.isOnline,
    this.profilePhoto
  );

factory Users.fromJson(Map<String,dynamic> json){//converts to json
  return Users(json['name'],json['email'],json['uid'],json['password'],json['isOnline'],json['profilePhoto']);
}

Map<String,dynamic> toJson(){//converts to json
  return {
    "name":name,
    "email":email,
    "uid":uid,
    "password":password,
    "isOnline":isOnline,
    "profilePhoto":profilePhoto
  };
}
}