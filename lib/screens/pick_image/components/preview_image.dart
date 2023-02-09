import 'dart:io';

import 'package:flutter/material.dart';

class PreviewImage extends StatelessWidget {
  const PreviewImage({
    super.key,
    required this.path,
  });
  final String? path;
  @override
  Widget build(BuildContext context) {
    return path == null ? const SizedBox() : Image.file(File(path!));
  }
}
