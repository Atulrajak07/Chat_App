import 'package:chat_app/core/Firebase/api.dart';
import 'package:chat_app/core/Global/Chat_user_view.dart';
import 'package:chat_app/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/model/chat_user.dart';
import '../../../main.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        leading: Icon(Icons.home_outlined),
        title: const Text('ChatApp'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: (){
            Get.toNamed(Routes.profile);
          }, icon: Icon(Icons.more_vert)),
        ],
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: (){
         controller.Signout();
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),

      body: StreamBuilder(
        stream: APIs.firestore.collection('User').snapshots(),
        builder: (context, snapshot){

          switch(snapshot.connectionState){
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.active:
            case ConnectionState.done:


                final data = snapshot.data?.docs;
                 controller.list = data?.map((e) => Chatuser.fromJson(e.data())).toList() ?? [] ;

               if(controller.list.isNotEmpty){
                 return ListView.builder(
                     itemCount: controller.list.length,
                     padding: EdgeInsets.only(top: mq.height* .01),
                     physics: BouncingScrollPhysics(),
                     itemBuilder: (context , index){
                       return ChatUserview(user: controller.list[index]);
                     });
               }else{
                 return Center(
                   child: Text("No Connections Found!",
                   style: TextStyle(fontSize: 25),
                   ),
                 );
               }


          }
         },
      ),
    );
  }

}