import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    required this.child,
    this.centerTitle,
    this.height = kToolbarHeight,
    this.color,
    this.actions,
  }) : super(key: key);

  final Widget child;
  final bool? centerTitle;
  final List<Widget>? actions;
  final double height;
  final Color? color;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      centerTitle: centerTitle ?? false,
      title: child,
      backgroundColor: color ?? Colors.black,
      actions: actions,

      // actions: [
      //   IconButton(
      //       icon: Icon(
      //         Icons.videocam_outlined,
      //         color: MyTheme.kAccentColor,
      //         size: 28,
      //       ),
      //       onPressed: () {}),
      //   IconButton(
      //       icon: Icon(
      //         Icons.call,
      //         color: MyTheme.kAccentColor,
      //         size: 28,
      //       ),
      //       onPressed: () {})
      // ],
    );
  }
}
