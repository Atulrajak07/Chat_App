import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../controller/profile_controller.dart';

class ProfileView extends GetView<ProfileController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text('Profile'),
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: (){

          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),

       body:Column(
         children: [
            ClipRRect(
             borderRadius: BorderRadius.circular(mq.height * .3),
             child: CachedNetworkImage(
               width: mq.height * .055,
               height: mq.height * .055,
                imageUrl: controller.user!.image,
               // placeholder: (context, url) => CircularProgressIndicator(),
               errorWidget: (context, url, error) => CircleAvatar(child: Icon(CupertinoIcons.person),
               ),),
           ),
         ],
       ),
    );
  }
}