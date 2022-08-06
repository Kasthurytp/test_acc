
class User {
  final String address;
  final String email;
  final String name;
  final String nic;
  final String phoneNumber;

  User({
    required this.address,
    required this.email,
    required this.name,
    required this.nic,
    required this.phoneNumber,
  });

  static User fromJson(Map<String, dynamic> json) => User(
      address: json['address'],
      email: json['email'],
      name: json['name'],
      nic: json['nic'],
      phoneNumber: json['phoneNumber']);
}
