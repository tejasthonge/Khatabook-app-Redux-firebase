





import 'package:khatabook/redux/khatabook/state.dart';
import 'package:khatabook/redux/loader/state.dart';
import 'package:khatabook/redux/session/state.dart';

class AppState{
    LoaderState loaderState;
    SessionState sessionState;
    KhatabookState khatabookState;


    AppState({required  this.loaderState,required this.sessionState,required this.khatabookState});

    factory AppState.initialState()=>AppState(loaderState: LoaderState.initialState(), sessionState: SessionState.initialState() , khatabookState: KhatabookState.initialeState());

    AppState copyWith( 
      {
        LoaderState? loaderState,
        SessionState? sessionState,
        KhatabookState? khatabookState,
      }
    )=> AppState( 

      khatabookState: khatabookState?? this.khatabookState,
      loaderState: loaderState?? this.loaderState,
      sessionState: sessionState?? this.sessionState,
    );
    


}
