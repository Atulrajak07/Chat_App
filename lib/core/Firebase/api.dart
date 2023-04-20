import 'package:chat_app/core/model/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs{

  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User get user => auth.currentUser! ;

  static Future<bool> userExits() async{
    return (await firestore.collection('User').doc(user.uid).get()).exists;
  }


  static Future<void> createuser() async{
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatuser = Chatuser(
        id: user.uid,
        name: user.displayName.toString(),
        email: user.email.toString(),
        about: "Hey I'm using ChatApp",
        image: user.photoURL.toString(),
        createdAt: time,
        isOnline: false,
        lastActive: time,
        pushToken: '');


    return await firestore.collection('User').doc(user.uid).set(chatuser.toJson ());
  }
}