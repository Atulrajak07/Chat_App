import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.deepOrangeAccent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text('Welcome To ChatApp',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing:3.0 ,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),),
              Positioned(
                  bottom: 35,
                  child: Text(
                    'MADE BY ATUL',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 4,
                        fontSize: 16,
                  ))
              )
            ],
          )
    )
    );
  }

}



