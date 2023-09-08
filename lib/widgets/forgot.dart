import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPage extends StatelessWidget {
  var _auth = FirebaseAuth.instance;
  var emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Page"),
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "email:",
              style: TextStyle(color: Colors.amberAccent),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "johndoe@gmail.com",
              ),
              keyboardType: TextInputType.emailAddress,
              controller: emailEditingController,
            ),
            ElevatedButton(
                onPressed: () {
                  _auth.sendPasswordResetEmail(email: emailEditingController.text).then((val){
                    print("Password successfully sent");
                  });
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context)=> LoginPage()),);
                },
                child: const Text("Reset Password")),

          ],
        ),
      ),
    );
  }
}
