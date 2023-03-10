import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_second_one/models/api_response.dart';

import '../helpers/alert.dart';
import '../models/user_login.dart';
import '../models/user_model.dart';
import '../services/user.service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//https://pub.dev/packages/flutter_secure_storage

//1.Write (stl) to create Stateless Widget
//class LoginView extends StatelessWidget { Make it statefull becuase of textfield controller
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //2. final TextEditingController _email;//error , final value should be initilized
  late final TextEditingController
      _email; //lat means I will initialize it later
  late final TextEditingController _password;
  Future<ApiResponse>? _futureUserLogin;

  //3.Override initState Function that automatically called by flutter when home page Created
  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  //4.Don't forget to dispose them

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  /*
  //Good Example: https://docs.flutter.dev/cookbook/networking/fetch-data
  Use Future Builder
*/

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.red);
    /*5.Enabled email,password binding
    WidgetsFlutterBinding.ensureInitialized();*/

/*
6.Use Future Builder /


/* body: FutureBuilder(
       // future: //Call async function, /Do this async first before any thing
       builder: (context, snapshot) => {
        switch(snapshot.connectionState){
          case ConnectionState.done:
             return  Column();
         default:
            return const Text('Loading....');
        }
       }*/
 */
    return Scaffold(
      //Scaffold is a Statefull Widget
      appBar: AppBar(
        title: const Text(
            "Login"), //Text is stateless widget , so it doesn't manage variables
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // verticalDirection: VerticalDirection.up,
        children: [
          TextField(
            controller: _email,
            enableSuggestions: true,
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            //5.Add place holder
            decoration:
                const InputDecoration(hintText: "Enter your email address"),
          ),
          TextField(
            obscureText: true, //make it dotted not text
            enableSuggestions: false,
            autocorrect: false,
            controller: _password,
            decoration: const InputDecoration(hintText: "Enter your Password"),
          ),
          TextButton(
            child: const Text("Login"),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              try {
                UserLogin user = UserLogin(
                    emailAddress: _email.text, password: _password.text);
                var res = UserService().loginUser(user);
                res.then((value) {
                  AlertController().showAlertDialog(
                      context, "Login Message", value.message.toString());
                  if (value.status == true) {
                    // Create storage
                    /* const storage = FlutterSecureStorage();
                    storage.write(key: 'user_token', value: value.token);
                    storage.write(key: 'userId', value: value.userId);*/
                    // obtain shared preferences

                    // set value
                    prefs.setString('user_token', value.token.toString());
                    prefs.setString('userId', value.userId.toString());

                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/patients", (route) => false);
                  }
                });
              } catch (e) {
                print(e.toString());
              }
            },
          ),
          TextButton(
              child: const Text("Are you new? Create an Account"),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/register", (route) => false);
              }),
        ],
      ),
    );
  }
}
