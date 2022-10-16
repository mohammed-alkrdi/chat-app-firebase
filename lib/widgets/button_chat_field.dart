import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constances/colors.dart';
import '../controller/chat_controller.dart';

class ButtonChatField extends ConsumerStatefulWidget {
  final String receiverUserId;
  const ButtonChatField({Key? key, required this.receiverUserId}) : super(key: key);

  @override
  ConsumerState<ButtonChatField> createState() => _ButtonChatFieldState();
}

class _ButtonChatFieldState extends ConsumerState<ButtonChatField> {
  bool isShowButton = false;
  final TextEditingController _messageController = TextEditingController();


  void sendTextMessage() async{
    if(isShowButton) {
      ref.read(chatControllerProvider).sendTextMessage(
          context,
        _messageController.text.trim(),
          widget.receiverUserId,
      );
      setState(() {
        _messageController.text = "";
      });
    }
  }
  @override
  void dispose(){
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _messageController,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: LogoImageColor.logoColor4,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  width: 48,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      /*IconButton(
                        icon: Icon(
                          Icons.gif,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),*/
                    ],
                  ),
                ),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    IconButton(
                      icon: const Icon(
                        Icons.attach_file,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              hintText: 'Message',
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
            onChanged: (val) {
              if(val.isNotEmpty) {
                setState(() {
                  isShowButton = true;
                });
              } else {
                setState(() {
                  isShowButton = false;
                });
              }
            },
            //validator: (value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
            left: 2,
            right: 2,
          ),
          child: CircleAvatar(
            backgroundColor: LogoImageColor.logoColor4,
            radius: 25,
            child: GestureDetector(
              onTap: sendTextMessage,
              child: Icon(
               isShowButton ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
            )
          ),
        ),
      ],
    );
  }
}
