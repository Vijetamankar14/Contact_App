// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModal {
  final String name;
  final String email;
  final String contactNumber;
  final String address;
  UserModal({
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.address,
  });

  UserModal copyWith({
    String? name,
    String? email,
    String? contactNumber,
    String? address,
  }) {
    return UserModal(
      name: name ?? this.name,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'contactNumber': contactNumber,
      'address': address,
    };
  }

  factory UserModal.fromMap(Map<String, dynamic> map) {
    return UserModal(
      name: map['name'] as String,
      email: map['email'] as String,
      contactNumber: map['contactNumber'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModal.fromJson(String source) =>
      UserModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModal(name: $name, email: $email, contactNumber: $contactNumber, address: $address)';
  }

  @override
  bool operator ==(covariant UserModal other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.contactNumber == contactNumber &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        contactNumber.hashCode ^
        address.hashCode;
  }
}
