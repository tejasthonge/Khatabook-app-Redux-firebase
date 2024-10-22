import 'package:khatabook/redux/app/state.dart';
import 'package:khatabook/redux/loader/action.dart';
import 'package:khatabook/redux/loader/state.dart';
import 'package:redux/redux.dart';

Reducer<LoaderState> loaderReducer = combineReducers<LoaderState>([
  TypedReducer<LoaderState, LoaderSavingStart>(_saving_start).call,
  TypedReducer<LoaderState, LoaderSavingEnd>(_saving_end).call,
  TypedReducer<LoaderState, LoaderLoadingStart>(_loading_start).call,
  TypedReducer<LoaderState, LoaderLoadingEnd>(_loading_end).call,
]);

LoaderState _saving_start(LoaderState state, LoaderSavingStart action) {
  return state.copyWith(isSaving: true);
}

LoaderState _saving_end(LoaderState state, LoaderSavingEnd action) {
  return state.copyWith(isSaving: false);
}

LoaderState _loading_start(LoaderState state, LoaderLoadingStart action) {
  return state.copyWith(isLoading: true);
}

LoaderState _loading_end(LoaderState state, LoaderLoadingEnd action) {
  return state.copyWith(isLoading: false);
}
