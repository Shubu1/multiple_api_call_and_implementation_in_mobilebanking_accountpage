import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPinProvider =
    StateNotifierProvider<SelectedBranch, Map<dynamic, dynamic>>((ref) {
  return SelectedBranch();
});

class SelectedBranch extends StateNotifier<Map<dynamic, dynamic>> {
  SelectedBranch()
      : super({
          "name": "Green Pin",
          "info":
              "To generate a green PIN, please visit your nearest ATM with your new ATM card and follow the instruction provided through the ATM machine."
        });
  void getSelectedPin(Map<dynamic, dynamic> selectedPin) {
    state = selectedPin;
  }
}
