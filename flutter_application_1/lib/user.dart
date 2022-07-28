import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  //My Data
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final List<DataUser> staticData = MyDataUsers.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.builder(

        itemCount: staticData.length,
        itemBuilder: (builder, index) {

          final DataUser mini = staticData[index];

          return ListTile(
            title: Text("${mini.id} - ${mini.name}"),
            subtitle: Text("• ${mini.user} | ${mini.password}"),
            trailing: MaterialButton(
              child: const Icon(Icons.edit),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => EditPage(dataUser: mini),
                ));
              },
            ),
          );

        },

      ),
      //Add
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        child: Icon(Icons.add),
        tooltip: 'Agregar',
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => EditPage(dataUser: MyDataUser.one),
          ));
        },
      ),
    );
  }
}

class DataUser{
  final int id;
  final String name;
  final String user;
  final String password;
  DataUser(this.id, this.name, this.user, this.password);
}


class MyDataUsers {
  static List<DataUser> list = [
    DataUser(1,'name', 'user', 'password'),
    DataUser(2,'name', 'user', 'password'),
    DataUser(3,'name', 'user', 'password'),
  ];
}

class MyDataUser{
  static DataUser one = DataUser(0, '', '', '');
}
