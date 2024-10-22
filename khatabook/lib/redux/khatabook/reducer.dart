import 'package:khatabook/redux/app/state.dart';
import 'package:khatabook/redux/khatabook/action.dart';
import 'package:khatabook/redux/khatabook/state.dart';
import 'package:redux/redux.dart';

Reducer<KhatabookState> khatabookReducer = combineReducers<KhatabookState>(
    [TypedReducer<KhatabookState, CreateKhataAction>(_create_khata).call]);

KhatabookState _create_khata(KhatabookState state, CreateKhataAction action) {
  return state.copyWith(khataModel: action.khatabookModel);
}
