import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future updateUserdata(
      String name, int phoneNumber, String email, String password) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password
    });
  }

  // List<UserInfo> _userListFromSnapshot(QuerySnapshot snapshot){
  //   return snapshot.docs.map((doc) => UserInfo(
  //     name: doc.data()['name']??'',
  //     phoneNumber: doc.data()['phoneNumber']??'',
  //     email: doc.data()['email']??'',
  //     password: doc.data()['password']??''
  //   )).toList();
  // }


  // Stream<List<UserInfo>> get account{
  //   return userCollection.snapshots().map(_userListFromSnapshot);
  // }
}
