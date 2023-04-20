import 'package:chat_app/core/Global/CustomSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController>{

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
   appBar: AppBar(
  automaticallyImplyLeading: false,
  title: const Text('Welcome to ChatApp'),
),
      
      body: Stack(
        children: [
           AnimatedPositioned(
             top: mq.height * .18,
             width:  mq.width * .9,
             duration: Duration(seconds: 2),
             child: Image.asset("images/chatapp.png"),

             ),


          Positioned(
              left: mq.width * .05,
              bottom: mq.height * .12,
              width: mq.width * .9,
              height: mq.height * .06,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder()
              ),
                onPressed: (){
                 Dialogs.showProgressBar(context);
                 controller.next();
                },
                icon: Image.asset("images/google.png",width: mq.width * .1),
                label: RichText(text: TextSpan(children: [
                  TextSpan(text: 'Sign With Google',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      )),
                ]),)),



              )
        ],
        
      ),
    );
  }

}