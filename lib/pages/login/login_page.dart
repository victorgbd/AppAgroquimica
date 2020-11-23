import 'package:agroquimica/cubit/adminstates_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usertextController = TextEditingController();
  final _passwordtextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AdminstatesCubit, AdminstatesState>(
      listener: (context, state) {
        if (state is AdminstatesError) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return buildbody(context, state);
      },
    ));
  }

  Widget buildbody(BuildContext context, AdminstatesState state) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 320.0),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.grey),
                  width: size.width * 0.8,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
                    controller: _usertextController,
                    decoration: InputDecoration(
                        labelText: "Email", icon: Icon(Icons.email)),
                    validator: (value) {
                      if (value.length > 0) {
                        return null;
                      } else {
                        return "Debe introducir un username";
                      }
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.grey),
                  width: size.width * 0.8,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
                    controller: _passwordtextController,
                    decoration: InputDecoration(
                        labelText: "Password", icon: Icon(Icons.lock)),
                    validator: (value) {
                      if (value.length > 0) {
                        return null;
                      } else {
                        return "Debe introducir una contraseña";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text('SIGN IN'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      final user = _usertextController.text;
                      final password = _passwordtextController.text;
                      // try {
                      //   //await Firebase.initializeApp();
                      //   User fuser = (await FirebaseAuth.instance
                      //           .signInWithEmailAndPassword(
                      //               email: user, password: password))
                      //       .user;
                      //   if (fuser != null) {
                      //     Navigator.pushNamedAndRemoveUntil(
                      //         context, '/menu', (_) => false);
                      //   }
                      // } on FirebaseAuthException catch (e) {
                      //   print(e);
                      // }
                      bool flag = true;
                      flag = await context
                          .read<AdminstatesCubit>()
                          .validateUser(user, password);
                      if (flag) {
                        context
                            .read<AdminstatesCubit>()
                            .setUser(user, password);
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/menu', (_) => false);
                      } else {
                        print("vacio");
                      }
                      _usertextController.clear();
                      _passwordtextController.clear();
                    }
                  },
                  padding:
                      EdgeInsets.symmetric(horizontal: 54.0, vertical: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
