import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_api/Model/user_accounts_model/user_model_freezed.dart';
import 'package:multiple_api/providers/dio_provider.dart';

final accountProvider = FutureProvider.autoDispose<List<Accounts>>(
  (ref) async {
    return AccountProvider(ref).taskList();
  },
);

class AccountProvider {
  late Ref ref;
  AccountProvider(this.ref);

  Future<List<Accounts>> taskList() async {
    try {
      final response = await ref
          .read(dioProvider)
          .get('http://10.13.170.32:7082/user/accounts');
      if (response.data != null && response.data.isNotEmpty) {
        print(response.data);
        UserModel responseList = UserModel.fromJson(response.data);
        if (responseList.success == true) {
          return responseList.accounts.toList();
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
