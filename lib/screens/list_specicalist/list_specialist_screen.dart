import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_util.dart';

import '../../domain/models/request/specialist_request.dart';
import '../../domain/models/response/base_rest_model.dart';
import '../../domain/repository/rest_repository.dart';

class ListSpecialistScreen extends StatelessWidget {
  const ListSpecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Specialist'),
      ),
      body: Center(
        child: FloatingActionButton(
          onPressed: () async {
            final restRepository = RestRepository();

            BaseRestModel? response = await restRepository
                .getListSpecialist(SpecialistRequest(pageNum: 1, pageSize: 20));
            AppUtil.showLog(response!.data);
          },
        ),
      ),
    );
  }
}
