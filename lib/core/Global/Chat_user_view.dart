import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../model/chat_user.dart';

class ChatUserview extends StatefulWidget {
  final Chatuser user;

  const ChatUserview({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatUserview> createState() => _ChatUserviewState();
}

class _ChatUserviewState extends State<ChatUserview> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width* .04, vertical: 4),
      color: Colors.orange.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: (){},
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(mq.height * .3),
            child: CachedNetworkImage(
              width: mq.height * .055,
              height: mq.height * .055,
              imageUrl: widget.user.image,
              // placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => CircleAvatar(child: Icon(CupertinoIcons.person),
            ),),
          ),

          title: Text(widget.user.name),
          subtitle: Text(widget.user.about, maxLines: 1,),
          trailing: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.greenAccent.shade400,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          // trailing: Text('12:00 AM'),
        ),
      ),
    );
  }
}
