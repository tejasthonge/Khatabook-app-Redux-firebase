




import 'package:khatabook/models/user_model.dart';
import 'package:khatabook/redux/session/action.dart';
import 'package:khatabook/redux/session/state.dart';
import 'package:khatabook/view/ui/auth/register.dart';
import 'package:redux/redux.dart';

Reducer<SessionState> sesionReducer = combineReducers<SessionState>(
  [
    TypedReducer<SessionState,RegisterUser>(_create_user).call,
    TypedReducer<SessionState,UserCreatedSuccessfully>(_user_created_successfully).call,
    TypedReducer<SessionState,UpdateUserStatus>(_update_user_status).call,

  ]
);



SessionState _create_user(SessionState state, RegisterUser action){

  return state.copyWith( 
    user: UserModel(email: action.email, name: action.name, password: action.password)
  );
}



SessionState _user_created_successfully(SessionState state ,UserCreatedSuccessfully action ){

  return state.copyWith( 
    authToken: action.authToken
  );
}


SessionState _update_user_status(SessionState state ,UpdateUserStatus action){

  return state.copyWith( 
    status:  action.status
  );
}