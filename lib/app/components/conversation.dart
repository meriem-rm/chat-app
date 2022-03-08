import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../data/message_model.dart';
import '../utils/chat_api.dart';

class Conversation extends StatefulWidget {
  const Conversation({
    Key? key,
  }) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  List<Message> _messages = <Message>[];
  List<Message> _displayMessages = <Message>[];
  @override
  void initState() {
    super.initState();

    fetchMessages().then((value) {
      setState(() {
        _messages.addAll(value);
        print(_messages.length);

        _displayMessages = _messages;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchMessages(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(child: Center(child: Icon(Icons.error)));
          }
          return ListView.builder(
              //reverse: true,
              itemCount: _displayMessages.length,
              itemBuilder: (context, int index) {
                final message = _displayMessages[index];
                return GestureDetector(
                  onLongPress: () async {
                    deleteMessage(message.id);
                    setState(() {
                      _displayMessages.indexOf(_displayMessages[index]);
                      _displayMessages.removeAt(index);
                    });
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
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.6),
                              decoration: BoxDecoration(
                                  color: index.isEven
                                      ? MyTheme.kAccentColor
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomLeft:
                                        Radius.circular(index.isEven ? 12 : 0),
                                    bottomRight:
                                        Radius.circular(index.isEven ? 0 : 12),
                                  )),
                              child: Text(
                                _displayMessages[index].message,
                                style: MyTheme.bodyTextMessage.copyWith(
                                    color: index.isEven
                                        ? Colors.white
                                        : Colors.grey[800]),
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
              });
        });
  }
}
