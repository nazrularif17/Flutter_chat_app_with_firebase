import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
  var _auth = FirebaseAuth.instance;
  var emailEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "email:",
              style: TextStyle(color: Colors.purpleAccent),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "johndoe@gmail.com",
              ),
              controller: emailEditingController,
              keyboardType: TextInputType.name,
            ),
            const Text(
              "password:",
              style: TextStyle(color: Colors.purpleAccent),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "********",
              ),
              controller: passwordEditingController,
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: () {
                  _auth.createUserWithEmailAndPassword(email: emailEditingController.text, password: passwordEditingController.text).then((val){
                    var user = val.user;
                    if (user != null){
                      print("Successfully registered");
                      Navigator.pop(context);
                    } else {
                      print("Something is wrong");
                    }
                  });
                },
                child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}
