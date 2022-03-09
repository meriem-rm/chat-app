import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_theme.dart';
import '../data/message_model.dart';
import '../utils/message_api.dart';

class Conversation extends StatefulWidget {
  const Conversation({
    Key? key,
  }) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<MessagesProvider>(context).getmessages(),
      builder: ((context, snapshot) {
        if (snapshot.data == null) {
          return Container(child: Center(child: CircularProgressIndicator()));
        }
        List<Message> data = snapshot.data as List<Message>;
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: ((context, index) {
            return MessageBuble(
              message: data[index],
              index: index,
            );
          }),
        );
      }),
    );
  }
}

class MessageBuble extends StatelessWidget {
  const MessageBuble({Key? key, required this.message, required this.index})
      : super(key: key);
  final Message message;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        Provider.of<MessagesProvider>(context, listen: false)
            .deleteMessage(message.id);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: index.isEven
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6),
                  decoration: BoxDecoration(
                      color: index.isEven
                          ? MyTheme.kAccentColor
                          : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(index.isEven ? 12 : 0),
                        bottomRight: Radius.circular(index.isEven ? 0 : 12),
                      )),
                  child: Text(
                    message.message,
                    style: MyTheme.bodyTextMessage.copyWith(
                        color: index.isEven ? Colors.white : Colors.grey[800]),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: index.isEven
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  if (!index.isEven)
                    SizedBox(
                      width: 40,
                    ),
                  Icon(
                    Icons.done_all,
                    size: 20,
                    color: MyTheme.bodyTextTime.color,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  // Text(
                  //   message.userName,
                  //   style: MyTheme.bodyTextTime,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
