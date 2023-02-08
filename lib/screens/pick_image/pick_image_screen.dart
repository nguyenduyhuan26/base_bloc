import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_base_bloc/utils/dialog_util.dart';

class PickImageScreen extends StatelessWidget {
  const PickImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Image'),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: GestureDetector(
            onTap: (() => checkPermissionsImagePicker(
                  context,
                )),
            child: const Text('Take Image'),
          ),
        );
      }),
    );
  }

  Future<void> checkPermissionsImagePicker(BuildContext context) async {
    ImageSource? source = await DialogUtil.showDialogTakeImage(context);
    print(source);
    if (source != null) {
      switch (source) {
        // Check quyền truy cập camera
        case ImageSource.camera:
          final cameraPermission = await Permission.camera.request();
          if (cameraPermission.isGranted) {
            getImage(source);
          } else {
            // ignore: use_build_context_synchronously
            DialogUtil.showBottomSheetPermissionPhoto(context);
          }
          break;

        // Check quyền truy cập photo
        case ImageSource.gallery:
          // Android không yêu cầu quyền photo
          if (Platform.isIOS) {
            final photoPermission = await Permission.photos.request();
            if (photoPermission.isGranted) {
              getImage(source);
            } else {
              // ignore: use_build_context_synchronously
              DialogUtil.showBottomSheetPermissionPhoto(context);
            }
          } else if (Platform.isAndroid) {
            getImage(source);
          }
          break;

        default:
          break;
      }
    }
  }

  Future<void> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final PickedFile? image = await picker.getImage(source: source);
    if (image != null) {
      print(image.path);
    }
  }
}
