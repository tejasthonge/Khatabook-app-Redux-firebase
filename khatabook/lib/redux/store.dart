





import 'package:khatabook/redux/app/reducer.dart';
import 'package:khatabook/redux/app/state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Store<AppState> store = Store<AppState>( 
  appReducer,
  initialState: AppState.initialState(),
  middleware: [thunkMiddleware]
);