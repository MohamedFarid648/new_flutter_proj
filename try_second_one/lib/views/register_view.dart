import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try_second_one/helpers/alert.dart';
import 'package:try_second_one/services/user.service.dart';

import '../models/user_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  //2. final TextEditingController _email;//error , final value should be initilized
  late final TextEditingController
      _email; //lat means I will initialize it later
  late final TextEditingController _password;
  late final TextEditingController _username;
  late final TextEditingController _phoneNumber;

  //3.Override initState Function that automatically called by flutter when home page Created
  @override
  void initState() {
    _email = TextEditingController();
    _username = TextEditingController();
    _phoneNumber = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  //4.Don't forget to dispose them

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _username.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

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
            "Register"), //Text is stateless widget , so it doesn't manage variables
      ),
      body: Column(
        children: [
          TextField(
            controller: _username,
            enableSuggestions: true,
            autocorrect: true,
            keyboardType: TextInputType.name,
            //5.Add place holder
            decoration: const InputDecoration(hintText: "Enter your Name"),
          ),
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
            controller: _phoneNumber,
            enableSuggestions: true,
            autocorrect: true,
            keyboardType: TextInputType.phone,
            //5.Add place holder
            decoration:
                const InputDecoration(hintText: "Enter your Phone Number"),
          ),
          TextField(
            obscureText: true, //make it dotted not text
            enableSuggestions: false,
            autocorrect: false,
            controller: _password,
            decoration: const InputDecoration(hintText: "Enter your Password"),
          ),
          TextButton(
            child: const Text("Register"),
            onPressed: () async {
              try {
                User user = User(
                    emailAddress: _email.text,
                    password: _password.text,
                    fullName: _username.text,
                    phoneNumber: _phoneNumber.text,
                    title: 0);
                var res = UserService().createUser(user);
                res.then((value) {
                  print(value);
                  AlertController().showAlertDialog(
                      context, "Registeration Message", value.toString());
                });
              } catch (e) {
                print(e.toString());
              }
            },
          ),
          TextButton(
            child: const Text("Already Have an Account?"),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login", (route) => false);
            },
          )
        ],
      ),
    );
  }
}
