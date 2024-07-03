import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // set up for push notifications
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();

    // creating a channel for multiple devices to register on for notifications
    fcm.subscribeToTopic('chat');

// getting the address or token of the user
    // final token = await fcm.getToken();
    // print(token); // you could send to database via https or Firestore SDK
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter chat',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.exit_to_app),
              color: Colors.white,
            )
          ],
        ),
        body: const Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
            NewMessage()
          ],
        ));
  }
}
