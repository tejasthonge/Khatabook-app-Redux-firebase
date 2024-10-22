import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khatabook/common/themes/app_assets.dart';
import 'package:khatabook/common/themes/app_style.dart';
import 'package:khatabook/redux/app/state.dart';
import 'package:khatabook/redux/khatabook/state.dart';
import 'package:khatabook/redux/loader/state.dart';
import 'package:khatabook/redux/session/action.dart';
import 'package:khatabook/redux/session/state.dart';
import 'package:khatabook/redux/store.dart';
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
  // TextEditingController _emailControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, ViewModel>(
          converter: (store) => ViewModel.fromStore(store),
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
                      decoration: InputDecoration(hintText: "Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name must not be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailControler,
                      decoration: InputDecoration(hintText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email must not be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordControler,
                      decoration: InputDecoration(hintText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password must not be empty";
                        } else if (value.length <= 5) {
                          return "Password must be at least 6 characters long";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: BossAppStyle.btnStyle,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                     

                                    vm.login(store);
                                     BossTost.getTost(
                                context: context,
                                title: store.state.sessionState.status,
                                bgColor: Colors.green);
                          } else {
                            BossTost.getTost(
                                context: context,
                                title: "Please fiil All Information",
                                bgColor: Colors.red);
                          }
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Already have Account    ",
                            style: TextStyle(color: Colors.grey.shade900),
                            children: [
                              TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    color: Colors.red.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                            ]))
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class ViewModel {
  LoaderState loaderState;
  SessionState sessionState;
  KhatabookState khatabookState;
  Function login;

  ViewModel({
    required this.loaderState,
    required this.sessionState,
    required this.khatabookState,
    required this.login
  });


  static ViewModel fromStore(Store<AppState> store) {

    void _login(Store<AppState> store) {

        store.dispatch(
          registerUser(store.state.sessionState, RegisterUser(name: store.state.sessionState.user!.name, email: store.state.sessionState.user!.email, password: store.state.sessionState.user!.password, ))
        );
    }
    return ViewModel(
      loaderState: store.state.loaderState,
      sessionState: store.state.sessionState,
      khatabookState: store.state.khatabookState,
      login: (store)=>_login( store)
    );
  }
}
