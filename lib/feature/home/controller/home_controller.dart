import 'package:chat_app/core/model/chat_user.dart';
import 'package:chat_app/core/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/Global/CustomSnackbar.dart';

class HomeController extends GetxController{


  List<Chatuser> list = [];











  Signout() async {
    Dialogs.showProgressBar(Get.context);
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Get.toNamed(Routes.login);
  }

}