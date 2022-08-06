class UserModel {
  String? name;
  String? email;
  String? nic;
  String? address;
  String? phoneNumber;

  UserModel({
    this.name,
    this.email,
    this.address,
    this.phoneNumber,
    this.nic,
  });

  //Receving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      nic: map['nic'],
      address: map['address'],
      phoneNumber: map['phoneNumber'],
    );
  }

  //sending data to server
  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'email': email,
      'nic': nic,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }
}
