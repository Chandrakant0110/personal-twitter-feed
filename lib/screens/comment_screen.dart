import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController commentTextController = TextEditingController();

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   commentTextController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add a new Comment',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: commentTextController,
              maxLength: 256,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Add a comment",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Comment Added Successfully');
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.send,
                  ),
                ),
                suffixIconColor: Colors.blueAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
