import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedBranchProvider =
    StateNotifierProvider<SelectedBranch, Map<dynamic, dynamic>>((ref) {
  return SelectedBranch();
});

class SelectedBranch extends StateNotifier<Map<dynamic, dynamic>> {
  SelectedBranch() : super({"name": "Pulchwok"});
  void getSelectedBranch(Map<dynamic, dynamic> selectedBranch) {
    state = selectedBranch;
  }
}
