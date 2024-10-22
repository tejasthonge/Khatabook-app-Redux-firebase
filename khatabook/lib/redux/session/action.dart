

import 'dart:developer';

import 'package:khatabook/redux/app/state.dart';
import 'package:khatabook/redux/session/state.dart';
import 'package:khatabook/repository/firebase_service_provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

abstract class SessionAction{}


class RegisterUser extends SessionAction{
  String name;
  String email;
  String password;
  RegisterUser({
    required this.name, required this.email, required this. password
  });
}


class UserCreatedSuccessfully extends SessionAction{

  String authToken;
  UserCreatedSuccessfully( 
    {
      required this.authToken
    }
  );


}

class UpdateUserStatus extends SessionAction{
  String status;
  UpdateUserStatus({
    required this.status
  });
}




ThunkAction<AppState> registerUser(SessionState sessionState , RegisterUser action){

  return (Store<AppState> store) async{
  
  String? status =await BossFirebase().createEmailAccout(email: action.email , password: action.password , name: action.name);
  log(status.toString());
  if(status != null){
    store.dispatch(UpdateUserStatus(status: status));
  }
  log(store.state.sessionState.status);
  };


}