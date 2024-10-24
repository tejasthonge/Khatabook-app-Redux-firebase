

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:khatabook/common/themes/app_assets.dart';
// import 'package:khatabook/common/themes/app_style.dart';
// import 'package:khatabook/models/user_model.dart';
// import 'package:khatabook/redux/app/state.dart';
// import 'package:khatabook/redux/khatabook/state.dart';
// import 'package:khatabook/redux/loader/state.dart';
// import 'package:khatabook/redux/session/state.dart';
// import 'package:khatabook/view/widgets/tost.dart';
// import 'package:redux/redux.dart';


// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     final TextEditingController _emailControler = TextEditingController();
//   final TextEditingController _passwordControler = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector(
//       converter: (Store<AppState> store)=>_ViewModel.fromStore(store),
//       builder: (context,vm) {
//         return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                 child: Form(
//                   key: _formKey,
//                   child: ListView(
//                     children: [
                      
//                       Image.asset(BossImage.logo),
//                       const SizedBox(height: 10),
//                       TextFormField(
//                         controller: _emailControler,
//                         decoration: const InputDecoration(hintText: "Email"),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Please enter the Email";
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       TextFormField(
//                         controller: _passwordControler,
//                         decoration: const InputDecoration(hintText: "Password"),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Password note empty";
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 30),
//                       ElevatedButton(
//                         style: BossAppStyle.btnStyle,
//                         onPressed: () {
//                           if( !vm.loaderState.isLoading ||vm.loaderState.isSaving  ){
//                              if (_formKey.currentState!.validate()) {
                           
//                             vm.login(); 
//                           } else {
//                             BossTost.getTost(
//                               context: context,
//                               title: "Please fill all information",
//                               bgColor: Colors.red,
//                             );
//                           }
//                           }
//                         },
//                         child:
                        
//                         vm.loaderState.isLoading ==false?
//                          const Text(
//                           "Register",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ):
//                         const Padding(
//                           padding: EdgeInsets.all(2.0),
//                           child:  CircularProgressIndicator(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       RichText(
//                         textAlign: TextAlign.center,
//                         text: TextSpan(
//                           text: "Already have an account? ",
//                           style: TextStyle(color: Colors.grey.shade900),
//                           children: [
//                             TextSpan(
//                               text: "ragistore",
//                               style: TextStyle(
//                                 color: Colors.red.shade900,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
                                  
//                                 },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//       }
//     );


//   }
// }


// class _ViewModel {
//   LoaderState loaderState ;
//   SessionState sessionState;
//   KhatabookState khatabookState;
//   Function(String email ,String password) login;

//   _ViewModel({
//     required this.loaderState,
//     required this.sessionState,
//     required this.khatabookState,
//     required this.login
//   });


//   static _ViewModel fromStore(Store<AppState> store){

//     _login({required String email ,required String password}){
//       store.dispatch( );
//     }

//     return _ViewModel( 
//       loaderState: store.state.loaderState,
//       sessionState: store.state.sessionState,
//       khatabookState: store.state.khatabookState,
//       login: (email, password) => _login(email: email, password: password)
//       );
  
//   }

// }