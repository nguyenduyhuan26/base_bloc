part of 'pick_image_bloc.dart';

abstract class PickImageEvent {}

class PickImage extends PickImageEvent {
  final BuildContext context;

  PickImage({required this.context});
}

class CropImage extends PickImageEvent {}

class DeleteImage extends PickImageEvent {}
