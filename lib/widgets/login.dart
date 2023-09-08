import 'package:chat_app/widgets/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'forgot.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  var _auth = FirebaseAuth.instance; //instance (singleton)
  var emailEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
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
              keyboardType: TextInputType.emailAddress,
              controller: emailEditingController,
            ),
            const Text(
              "password:",
              style: TextStyle(color: Colors.purpleAccent),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "********",
              ),
              obscureText: true,
              controller: passwordEditingController,
            ),
            ElevatedButton(onPressed: () {
              _auth.signInWithEmailAndPassword(email: emailEditingController.text, password: passwordEditingController.text).then((val){
                var user = val.user;
                if (user != null){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                } else {
                  print("Enter correct email and password");
                }
              });
            }, child: const Text("Login")),
            TextButton(onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=> RegisterPage()),);
            }, child: const Text("Not register yet? Register now!")),
            TextButton(onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=> ForgotPage()),);
            }, child: const Text("Forgot password? Reset now!"))
          ],
        ),
      ),
    );
  }
}