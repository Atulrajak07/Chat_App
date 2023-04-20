import 'dart:developer';
import 'dart:io';
import 'package:chat_app/core/Firebase/api.dart';
import 'package:chat_app/core/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/Global/CustomSnackbar.dart';


class LoginController extends GetxController{

  next(){
    signInWithGoogle().then((user) async {
  if(user != null ){
    log('\nUser: ${user.user}');
    log('\nAdditionalInfo: ${user.additionalUserInfo}');

    if(await APIs.userExits()){
      Get.toNamed(Routes.home);
    }else{
      APIs.createuser().then((value){
        Get.toNamed(Routes.home);
      });
    }
  }
    });

  }


    Future<UserCredential?> signInWithGoogle () async {

    try{
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    }
    catch (e) {
      log('\nsignInWithGoogle: $e');
      Dialogs.showSnackbar(Get.context,'Something Went Wrong(Check your internet)');
      return null;
    }
    
  }


}