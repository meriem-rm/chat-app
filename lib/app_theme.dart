import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color kPrimaryColor = Color(0xff47494d);
  static Color kAccentColor = Color(0xff00ba46);
  static Color kUnreadChatBG = Color(0xff00ba46);
  static Color kChatmessageBG = Color(0xFF9BF7BE);
  static Color kMessageTextColor = Color(0xFF85888a);
  static Color kWhiteColor = Color(0xFFffffff);

  static final TextStyle kAppTitle = GoogleFonts.grandHotel(fontSize: 36);

  static final TextStyle heading2 = TextStyle(
    color: Color(0xff47494d),
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
  );

  static final TextStyle chatSenderName = TextStyle(
    color: Color(0xff47494d),
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
  );

  static final TextStyle bodyText1 = TextStyle(
      color: Color(0xFF85888a),
      fontSize: 14,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w500);

  static final TextStyle bodyTextMessage =
      TextStyle(fontSize: 13, letterSpacing: 1.5, fontWeight: FontWeight.w600);

  static final TextStyle bodyTextTime = TextStyle(
    color: Color(0xff959497),
    fontSize: 11,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
}
