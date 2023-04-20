import 'dart:async';
import 'dart:developer';
import 'package:chat_app/core/Firebase/api.dart';
import 'package:get/get.dart';
import '../../../core/routes.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds:3), (){
      Get.offAllNamed(Routes.login);
      if(APIs.auth.currentUser!= null){
        log('\nUser: ${APIs.auth.currentUser}');
        Get.toNamed(Routes.home);
      }else{
        Get.toNamed(Routes.login);
      }
    });
  }
}