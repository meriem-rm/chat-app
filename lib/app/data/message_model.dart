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
