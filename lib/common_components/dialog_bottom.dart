import 'package:flutter/cupertino.dart';
import 'package:flutter_base_bloc/common_components/button_dialog.dart';

class DialogButtom extends StatelessWidget {
  const DialogButtom({
    Key? key,
    this.actions,
  }) : super(key: key);

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: actions,
      cancelButton: ButtonDialog(
        onPressed: () {
          Navigator.of(context).pop(null);
        },
        title: 'Cancel',
      ),
    );
  }
}
