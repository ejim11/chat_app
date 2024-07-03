import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    // the firestore snapshots results in a stream in which any change to the collection leads to a change in the stream
    // chatSnapshots is an obj that gives us the data loaded from the firebase be
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            return const Center(
              child: Text('No messages found'),
            );
          }

          if (chatSnapshots.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          final loadedMessages = chatSnapshots.data!.docs;

          return ListView.builder(
              padding: const EdgeInsets.only(bottom: 40, left: 10, right: 10),
              reverse: true,
              itemCount: loadedMessages.length,
              itemBuilder: (ctx, index) {
                final chatMesage = loadedMessages[index].data();
                final nextMessage = index + 1 < loadedMessages.length
                    ? loadedMessages[index + 1]
                    : null;

                final currentMessageId = chatMesage['userId'];
                final nextMessageId =
                    nextMessage != null ? nextMessage['userId'] : null;

                final nextUserIsSame = nextMessageId == currentMessageId;

                if (nextUserIsSame) {
                  return MessageBubble.next(
                      message: chatMesage['text'],
                      isMe: authenticatedUser.uid == currentMessageId);
                } else {
                  return MessageBubble.first(
                      userImage: chatMesage['userImage'],
                      username: chatMesage['username'],
                      message: chatMesage['text'],
                      isMe: authenticatedUser.uid == currentMessageId);
                }

                // return Text(loadedMessages[index].data()['text']);
              });
        });
  }
}
