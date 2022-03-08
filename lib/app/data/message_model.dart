class Message {
  final int id;
  // final String userName;
  final String message;

  Message(
      {required this.id,
      //required this.userName,
      required this.message});

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    return Message(
        id: json["id"],
        //userName: json["userName"],
        message: json["message"]);
  }
}

// final List<Message> allMessages = [
//   Message(id: 1, message: "hello  .."),
//   Message(id: 2, message: "hey, how are you ??"),
//   Message(id: 3, message: "i am good what about you"),
//   Message(id: 5, message: "i am great :)"),
//   Message(id: 1, message: "hello  .."),
//   Message(id: 4, message: "hey, how are you ??"),
//   Message(id: 1, message: "i am good what about you"),
//   Message(id: 6, message: "i am great :)"),
//   Message(id: 1, message: "hello  .."),
//   Message(id: 2, message: "hey, how are you ??"),
// ];
