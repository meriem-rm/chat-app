import 'package:chat_application/app/components/custom-appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_theme.dart';
import '../components/chat_composer.dart';
import '../components/conversation.dart';
import '../utils/message_api.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  String messageText = '';
  final _formKey = GlobalKey<FormState>();
  final fieldMessage = TextEditingController();

  void clearText() {
    fieldMessage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chat App",
                  style: MyTheme.chatSenderName,
                ),
                Text(
                  'online',
                  style: MyTheme.bodyText1.copyWith(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        height: 90,
        color: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  context.read<MessagesProvider>().getmessages();
                });
              },
              icon: Icon(
                Icons.refresh,
                color: MyTheme.kAccentColor,
              ))
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Conversation(),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: buildChatComposer(
                  messageController: fieldMessage,
                  onChange: (value) {
                    messageText = value;
                  },
                  onSaveMessage: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    } else {
                      _formKey.currentState!.save();
                      await Provider.of<MessagesProvider>(context,
                              listen: false)
                          .addMessage(messageText);
                      clearText();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
