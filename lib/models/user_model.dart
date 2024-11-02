class UserModel {
  String uid;
  String name;
  String email;
  String contact;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.contact,
  });

  // Convert UserModel instance to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'contact': contact,
    };
  }

  // Create a UserModel instance from Firestore map
  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      uid: documentId,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      contact: map['contact'] ?? '',
    );
  }
}
