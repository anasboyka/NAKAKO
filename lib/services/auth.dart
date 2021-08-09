import 'package:firebase_auth/firebase_auth.dart';
import 'package:nakako/models/user.dart';
import 'package:nakako/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserFirebase _userFromFirebaseUser(User user) {
    return user != null ? UserFirebase(uid: user.uid) : null;
  }

  Stream<UserFirebase> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      //print(user.uid);

      await DatabaseService(uid: user.uid)
          .updateUserdata('ali', 0123445678, user.email, password);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
}
