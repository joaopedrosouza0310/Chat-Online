import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

  final Function({String text, File imgFile}) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool isComposing = false;
  final controller = TextEditingController();

  void reset() {
    controller.clear();
    setState(() {
      isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () async {
              final File imgFile = await ImagePicker.pickImage(
                  source: ImageSource.camera);
              if (imgFile == null) {
                return;
              } else {
                widget.sendMessage(imgFile: imgFile);
              }
            },
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: (text) {
                setState(() {
                  isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text: text);
                reset();
              },
              decoration:
              InputDecoration.collapsed(hintText: "Enviar Uma Mensagem"),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: isComposing
                ? () {
              widget.sendMessage(text: controller.text);
              reset();
            }
                : null,
          )
        ],
      ),
    );
  }
}
