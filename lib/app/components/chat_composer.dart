import 'package:flutter/material.dart';

import '../../app_theme.dart';

class buildChatComposer extends StatefulWidget {
  buildChatComposer(
      {Key? key,
      this.messageController,
      required this.onChange,
      required this.onSaveMessage})
      : super(key: key);
  final ValueChanged<String> onChange;
  final VoidCallback onSaveMessage;
  final TextEditingController? messageController;

  @override
  State<buildChatComposer> createState() => _buildChatComposerState();
}

class _buildChatComposerState extends State<buildChatComposer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey[500],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: widget.messageController,
                      onChanged: widget.onChange,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 0.0,
                        ),
                        border: InputBorder.none,
                        hintText: 'Type your message ...',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.attach_file,
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              iconSize: 25,
              color: MyTheme.kAccentColor,
              onPressed: widget.onSaveMessage),
        ],
      ),
    );
  }
}
