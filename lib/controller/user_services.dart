import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_form_app/models/user_modal.dart';

class UserServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Adding a new contact to Firestore under the 'contacts' collection
  Future addContact(UserModal user) async {
    try {
      await firestore.collection('contacts').add(user.toMap());
      print('Contact added successfully');
    } catch (e) {
      print('Failed to add contact: $e');
      throw e;
    }
  }

  // Fetching real-time data from Firestore
  Stream<List<UserModal>> getData() {
    return firestore.collection('contacts').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserModal.fromMap(doc.data())).toList();
    });
  }
}
