import 'package:flutter/material.dart';
import 'package:flutter_application_1/user.dart';

class EditPage extends StatefulWidget {
  final DataUser dataUser;

  EditPage({required this.dataUser});

  @override
  _EditPageState createState() => new _EditPageState();
}

class _EditPageState extends State<EditPage>{
  
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    idController = TextEditingController(text: widget.dataUser.id.toString());
    nameController = TextEditingController(text: widget.dataUser.name.toString());
    userController = TextEditingController(text: widget.dataUser.user.toString());
    passwordController = TextEditingController(text: widget.dataUser.password.toString());
    isTitle();
    super.initState();
  }

  String isTitle(){
    if(idController.text != '0'){ return 'Edit USer'; }
    else {return 'Add User'; }
  }

  void IsSave(){
    if(nameController.text != '' && userController.text != '' && passwordController.text != ''){
       if(idController.text!='0'){
        showAlertDialog(context, 'Usuario agregado', Icons.check);      
       }else{
        showAlertDialog(context, 'Usuario actualizado', Icons.check);      
       }
    }else{
       showAlertDialog(context, 'Llene todos campos', Icons.warning_amber_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isTitle()),
      ),
      body: Container(
      padding: const EdgeInsets.all(15.0),
        child:Column(
          children: [
            const SizedBox(height: 15),
            //NAME
            TextField(
              controller: nameController,
              decoration: InputDecoration(
              prefixIcon: const Icon(Icons.co_present_rounded),
              hintText: 'Name',
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1)
              )),
            ),
            const SizedBox(height: 15),
            //USER
            TextField(
              controller: userController,
              decoration: InputDecoration(
              prefixIcon: const Icon(Icons.people),
              hintText: 'User',
              labelText: 'User',
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1)
              )),
            ),
            const SizedBox(height: 15),
            //PASSWORD
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              hintText: 'Password',
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1)
              )),
            ),
            const SizedBox(height: 15),
            MaterialButton(
              child: const Text('Save', 
              style: TextStyle(
              fontSize: 18,
              color: Colors.white)  
            ),
            minWidth: double.infinity,
            height: 40.0,
            color: Colors.orange,
            onPressed: (){
              IsSave();
            },
            )
          ],
        )
      ),
    );
  }
}


showAlertDialog(BuildContext context, String message, IconData iconData) {
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return AlertDialog(
        title: Icon(
          iconData,
          color: Color.fromRGBO(245, 127, 23, 1),
          size: 125.0,),
        content: Text(message),
        actions: [
          MaterialButton(
            padding: const EdgeInsets.all(7.0),
            color: Colors.orange,
            minWidth: double.infinity,
            onPressed: () {Navigator.of(context).pop();},  
            child: const Text('OK', style: TextStyle(color: Colors.white),)
          ),
        ],
      );  
    },  
  );
}  
