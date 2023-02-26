import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try_second_one/models/api_response.dart';

import '../helpers/alert.dart';
import '../models/user_login.dart';
import '../models/user_model.dart';
import '../services/user.service.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child:
              (_futureUserLogin == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
          onPressed: () {
            UserLogin user =
                UserLogin(emailAddress: _email.text, password: _password.text);
            setState(() {
              _futureUserLogin = UserService().loginUser(user);
            });
          },
        ),
        TextButton(
            child: const Text("Are you new? Create an Account"),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/register", (route) => false);
            }),
      ],
    );
  }

To display the data on screen, use the FutureBuilder widget. The FutureBuilder widget comes with Flutter and makes it easy to work with asynchronous data sources.

You must provide two parameters:

* The Future you want to work with. In this case, the future returned from the fetchAlbum() function.
* A builder function that tells Flutter what to render, depending on the state of the Future: loading, success, or error.
Note that snapshot.hasData only returns true when the snapshot contains a non-null data value.

Because fetchAlbum can only return non-null values, the function should throw an exception even in the case of a “404 Not Found” server response. Throwing an exception sets the snapshot.hasError to true which can be used to display an error message.

Otherwise, the spinner will be displayed.

  FutureBuilder<ApiResponse> buildFutureBuilder() {
    return FutureBuilder<ApiResponse>(
      future: _futureUserLogin,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // AlertController().showAlertDialog( context, "Login Message", snapshot.data!.message.toString());
          //Navigator.of(context) .pushNamedAndRemoveUntil("/patients", (route) => false);
          return Text(snapshot.data!.message.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
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
              try {
                UserLogin user = UserLogin(
                    emailAddress: _email.text, password: _password.text);
                var res = UserService().loginUser(user);
                res.then((value) {
                  AlertController().showAlertDialog(
                      context, "Login Message", value.message.toString());
                  if (value.status == true) {
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
