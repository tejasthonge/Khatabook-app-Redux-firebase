import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khatabook/common/themes/app_assets.dart';
import 'package:khatabook/common/themes/app_style.dart';
import 'package:khatabook/models/user_model.dart';
import 'package:khatabook/redux/app/state.dart';
import 'package:khatabook/redux/khatabook/state.dart';
import 'package:khatabook/redux/loader/state.dart';
import 'package:khatabook/redux/session/action.dart';
import 'package:khatabook/redux/session/state.dart';
import 'package:khatabook/redux/store.dart';
import 'package:khatabook/view/ui/app/home.dart';
import 'package:khatabook/view/widgets/tost.dart';
import 'package:redux/redux.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameControler = TextEditingController();
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.fromStore(store),
        onDidChange: (vmm, vm) {
          if (vm.sessionState.status.isNotEmpty) {
            BossTost.getTost(
              context: context,
              title: vm.sessionState.status,
              bgColor: vm.sessionState.status == "User created successfully"
                  ? Colors.green
                  : Colors.red,
            );
            if(  vm.sessionState.status == "User created successfully"){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_)=>HomePage())
              );
            }
            store.dispatch(UpdateUserStatus(status: ''));
          }

          
        },
        builder: (context, vm) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Image.asset(BossImage.logo),
                  TextFormField(
                    controller: _nameControler,
                    decoration: const InputDecoration(hintText: "Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name must not be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailControler,
                    decoration: const InputDecoration(hintText: "Email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email must not be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordControler,
                    decoration: const InputDecoration(hintText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password must not be empty";
                      } else if (value.length <= 5) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: BossAppStyle.btnStyle,
                    onPressed: () {
                      if( !vm.loaderState.isLoading ||vm.loaderState.isSaving  ){
                         if (_formKey.currentState!.validate()) {
                        final user = UserModel(
                          name: _nameControler.text,
                          email: _emailControler.text,
                          password: _passwordControler.text,
                        );
                        vm.ragistore(user); 
                      } else {
                        BossTost.getTost(
                          context: context,
                          title: "Please fill all information",
                          bgColor: Colors.red,
                        );
                      }
                      }
                    },
                    child:
                    
                    vm.loaderState.isLoading ==false?
                     const Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ):
                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child:  CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Already have an account?    ",
                      style: TextStyle(color: Colors.grey.shade900),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.of(context).push(

                              //   MaterialPageRoute(builder: (_)=>LoginPage())
                              // )
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ViewModel {
  final LoaderState loaderState;
  final SessionState sessionState;
  final KhatabookState khatabookState;
  final Function(UserModel userModel) ragistore;

  _ViewModel({
    required this.loaderState,
    required this.sessionState,
    required this.khatabookState,
    required this.ragistore,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    _ragistor(UserModel userData) {
      store.dispatch(registerUser(
          store.state.sessionState,
          RegisterUser(
              name: userData.name,
              email: userData.email,
              password: userData.password)));
    }

    return _ViewModel(
      loaderState: store.state.loaderState,
      sessionState: store.state.sessionState,
      khatabookState: store.state.khatabookState,
      ragistore: (UserModel user) {
        // Dispatching the register action
        _ragistor(user);
      },
    );
  }
}
