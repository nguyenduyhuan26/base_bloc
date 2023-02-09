// part of 'pick_image_bloc.dart';

// @immutable
// abstract class PickImageState {}

// class PickImageInitial extends PickImageState {}

import 'package:flutter_base_bloc/domain/enum/pick_image_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pick_image_state.freezed.dart';

@freezed
class PickImageState with _$PickImageState {
  factory PickImageState({
    required PickImageStatus status,
    required String? path,
  }) = _PickImageState;
}
