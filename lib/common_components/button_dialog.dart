import 'package:flutter/cupertino.dart';

class ButtonDialog extends StatelessWidget {
  const ButtonDialog({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final void Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
