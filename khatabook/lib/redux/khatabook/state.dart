import 'package:khatabook/models/khatabook_model.dart';

class KhatabookState {
  KhatabookModel? khataModel;

  KhatabookState({required this.khataModel});

  factory KhatabookState.initialeState() =>
      KhatabookState(khataModel: KhatabookModel());

  KhatabookState copyWith({
    KhatabookModel? khataModel,
  }) =>
      KhatabookState(
        khataModel: khataModel ?? this.khataModel,
      );
}
