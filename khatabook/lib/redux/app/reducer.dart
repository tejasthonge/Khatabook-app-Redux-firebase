


import 'package:khatabook/redux/app/state.dart';
import 'package:khatabook/redux/khatabook/reducer.dart';
import 'package:khatabook/redux/loader/reducer.dart';
import 'package:khatabook/redux/session/reducer.dart';

AppState appReducer(AppState appState ,dynamic action){

  return appState.copyWith( 
      khatabookState: khatabookReducer(appState.khatabookState, action),
      loaderState: loaderReducer(appState.loaderState,action),
      sessionState: sesionReducer( appState.sessionState,action),
  );

}
