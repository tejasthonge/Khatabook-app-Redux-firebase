


import 'package:flutter/foundation.dart';
import 'package:khatabook/models/user_model.dart';

class SessionState{
  String status;
  String authToken;
  UserModel? user;


  SessionState({required this.authToken, required this.user ,required this.status});

  factory SessionState.initialState()=>SessionState( 
    authToken: '',
    user: null,
    status: "",
  );
  SessionState copyWith({String? authToken, UserModel? user ,String? status }) => SessionState( 
    authToken: authToken?? this.authToken,
    user: user?? this.user,
    status:  status ??this.status
  );

}



