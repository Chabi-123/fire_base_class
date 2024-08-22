import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_class/firebase_services/firenase_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ViewData extends StatelessWidget {
  ViewData({super.key});

  TextEditingController _taskName = TextEditingController();
  TextEditingController _taskTime = TextEditingController();

  StoreData store = StoreData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks for today"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: store.fetchData(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }


          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }


          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data()! as Map<String, dynamic>;
              return data.isNotEmpty
                  ? ListTile(
                title: Text(data['task']),
                subtitle: Text(data['time']),
              )
                  : Text("No data is found");
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: "Add your task",
            content: Column(
              children: [
                TextFormField(
                  controller: _taskName,
                  decoration: InputDecoration(hintText: "Task Name"),
                ),
                TextFormField(
                  controller: _taskTime,
                  decoration: InputDecoration(hintText: "Task Time"),
                ),
              ],
            ),
            confirm: TextButton(
              onPressed: () {
                store.addTask(_taskName.text, _taskTime.text);
                _taskTime.clear();
                _taskName.clear();
                Get.back();
              },
              child: Text("Add"),
            ),
            cancel: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel")),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

}

