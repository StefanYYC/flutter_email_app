import 'package:email_app/message.dart';
import 'package:flutter/material.dart';

import 'message_compose.dart';

class ComposeButton extends StatelessWidget {
  final Future future;
  ComposeButton(this.future);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        Message message = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MessageCompose()
            )
        );

        if (message != null) {
          List<Message> messages = await future;
          messages.add(message);

          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Your message has been sent"),
            backgroundColor: Colors.green,
          ));
        }
      },
    );
  }
}
