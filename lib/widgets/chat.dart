import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  var messages = [
    {'sender':'naz','message':'zack','dt':'7 Sept 9.00am'},
    {'sender':'naz','message':'zack','dt':'7 Sept 9.00am'},
    {'sender':'naz','message':'zack','dt':'7 Sept 9.00am'},
    {'sender':'naz','message':'zack','dt':'7 Sept 9.00am'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat page"),
        backgroundColor: Colors.pink[200],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(messages[index]["message"]!),
                  subtitle: Text("${messages[index]["sender"]} ${messages[index]["dt"]}"),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(decoration: InputDecoration(hintText: "Enter Message"),)),
                IconButton(onPressed: (){}, icon: Icon(Icons.send))
              ],
            ),
          ),
        ]
      ),
    );
  }
}
