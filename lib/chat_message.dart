import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            !mine
                ? Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data['senderPhotoUrl']),
                    ),
                  )
                : Container(),
            Expanded(
              child: Column(
                crossAxisAlignment: mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data['senderName'],
                    textAlign: mine ? TextAlign.end : TextAlign.start ,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  data['imgUrl'] != null
                      ? Image.network(
                          data['imgUrl'],
                          width: 250,
                        )
                      : Text(
                          data['text'],
                          style: TextStyle(fontSize: 14),
                        ),
                ],
              ),
            ),
            mine
                ? Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data['senderPhotoUrl']),
                    ),
                  )
                : Container()
          ],
        ));
  }
}
