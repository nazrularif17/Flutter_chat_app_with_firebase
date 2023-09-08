import 'package:flutter/material.dart';
import 'chat.dart';

class HomePage extends StatelessWidget {
  var staffs = [
    {'name':'hakim','department':'IT'},
    {'name':'naz','department':'Sales'},
    {'name':'zayyad','department':'Operation'},
    {'name':'zack','department':'IT'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"), actions: [IconButton(onPressed: () {},
            icon: Icon(Icons.account_circle))
        ],
          backgroundColor: Colors.pink[200],
        ),
        body: ListView.builder(
          itemCount: staffs.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(staffs[index]["name"]!),
                subtitle: Text(staffs[index]["department"]!),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage())
                  );
                },
              ),
            );
          },
        )
    );
  }}