import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedAccountProvider =
    StateNotifierProvider<SelectedAccount, Map<dynamic, dynamic>>((ref) {
  return SelectedAccount();
});

class SelectedAccount extends StateNotifier<Map<dynamic, dynamic>> {
  SelectedAccount()
      : super({
          "type": "Saving",
          "number": "128823782901029",
          "primary": "Primary"
        });
  void getSelectedAccount(Map<dynamic, dynamic> selectedAccount) {
    state = selectedAccount;
  }
}
