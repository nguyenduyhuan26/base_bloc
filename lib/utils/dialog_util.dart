import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/common_components/button_dialog.dart';
import 'package:flutter_base_bloc/common_components/dialog_bottom.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class DialogUtil {
  static Future<ImageSource?> showDialogTakeImage(BuildContext context) async {
    return await showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return DialogButtom(
          actions: [
            ButtonDialog(
              onPressed: () {
                Navigator.of(context).pop(ImageSource.camera);
              },
              title: 'Camera',
            ),
            ButtonDialog(
              onPressed: () {
                Navigator.of(context).pop(ImageSource.gallery);
              },
              title: 'Gallery',
            ),
          ],
        );
      },
    );
  }

  static void showBottomSheetPermissionPhoto(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return DialogButtom(
            actions: [
              ButtonDialog(
                onPressed: () {
                  openAppSettings();
                },
                title: 'Open App Setting',
              ),
            ],
          );
        });
  }
}
