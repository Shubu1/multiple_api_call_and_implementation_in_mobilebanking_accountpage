import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_api/Model/branches_model/branches_model_freezed.dart';
import 'package:multiple_api/providers/dio_provider.dart';

final branchProvider = FutureProvider.autoDispose<List<Branches>>(
  (ref) async {
    return BranchProvider(ref).taskList();
  },
);

class BranchProvider {
  late Ref ref;
  BranchProvider(this.ref);

  Future<List<Branches>> taskList() async {
    try {
      final response =
          await ref.read(dioProvider).get('http://10.13.170.32:7082/branches');
      if (response.data != null && response.data.isNotEmpty) {
        print(response.data);
        BranchesModel responseList = BranchesModel.fromJson(response.data);
        if (responseList.success == true) {
          return responseList.branches.toList();
        }
        return [];
      } else {
        return [];
      }
    } on Error catch (error) {
      debugPrint("Error $error");
      rethrow;
    }
  }
}
