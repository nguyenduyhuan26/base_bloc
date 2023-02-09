import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/domain/enum/pick_image_status.dart';
import 'package:flutter_base_bloc/screens/pick_image/bloc/pick_image_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pick_image_state.dart';
import 'components/preview_image.dart';

class PickImageScreen extends StatelessWidget {
  const PickImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PickImageBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pick Image'),
        ),
        body: Center(
          child: BlocBuilder<PickImageBloc, PickImageState>(
            builder: ((context, state) {
              return PreviewImage(path: state.path);
            }),
          ),
        ),
        floatingActionButton: BlocBuilder<PickImageBloc, PickImageState>(
          builder: (context, state) {
            IconData icon = Icons.add_a_photo;
            if (state.status == PickImageStatus.picked) {
              icon = Icons.crop;
            } else if (state.status == PickImageStatus.cropped) {
              icon = Icons.delete;
            }
            return FloatingActionButton(
              onPressed: () {
                if (state.status == PickImageStatus.free) {
                  context
                      .read<PickImageBloc>()
                      .add(PickImage(context: context));
                } else if (state.status == PickImageStatus.picked) {
                  context.read<PickImageBloc>().add(CropImage());
                } else if (state.status == PickImageStatus.cropped) {
                  context.read<PickImageBloc>().add(DeleteImage());
                }
              },
              child: Icon(icon),
            );
          },
        ),
      ),
    );
  }
}
