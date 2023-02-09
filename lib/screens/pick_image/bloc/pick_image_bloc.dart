import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/domain/enum/pick_image_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/dialog_util.dart';
import 'pick_image_state.dart';

part 'pick_image_event.dart';

class PickImageBloc extends Bloc<PickImageEvent, PickImageState> {
  PickImageBloc()
      : super(PickImageState(status: PickImageStatus.free, path: null)) {
    on<PickImage>(onPickImage);
    on<CropImage>(onCropImage);
    on<DeleteImage>(onDeleteImage);
  }

  Future<void> onPickImage(PickImage event, Emitter emit) async {
    final file = await getImageFile(event.context);
    if (file != null) {
      emit(state.copyWith(status: PickImageStatus.picked, path: file.path));
    }
  }

  Future<void> onCropImage(CropImage event, Emitter emit) async {
    final croppedFile = await ImageCropper().cropImage(sourcePath: state.path!);
    if (croppedFile != null) {
      emit(state.copyWith(
          status: PickImageStatus.cropped, path: croppedFile.path));
    }
  }

  void onDeleteImage(DeleteImage event, Emitter emit) {
    emit(state.copyWith(status: PickImageStatus.free, path: null));
  }

  Future<PickedFile?> getImageFile(BuildContext context) async {
    ImageSource? source = await DialogUtil.showDialogTakeImage(context);
    if (source != null) {
      switch (source) {
        // Check quyền truy cập camera
        case ImageSource.camera:
          final cameraPermission = await Permission.camera.request();
          if (cameraPermission.isGranted) {
            return await getImage(source);
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
              return await getImage(source);
            } else {
              // ignore: use_build_context_synchronously
              DialogUtil.showBottomSheetPermissionPhoto(context);
            }
          } else if (Platform.isAndroid) {
            return await getImage(source);
          }
          break;
        default:
          break;
      }
    }
    return null;
  }

  Future<PickedFile?> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    return await picker.getImage(source: source);
  }
}
