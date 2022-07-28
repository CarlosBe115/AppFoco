import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void IsAuthentic(){
    //VALIDO
    if(userController.text != "" && passController.text != ""){
      if(userController.text == "Luis" && passController.text == "123"){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => HomePage()
        ));
      }else{
        showAlertDialog(context, 'Las credenciales no son validas');
      }
    }else{
       showAlertDialog(context, 'Llene todos campos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/login.png',
                height: 250.0,
                width: 250.0,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)
                  ),
                ),
                child: Column(
                  children: [
                    const Text('Log In', 
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Regular'
                      )),
                    const SizedBox(height: 15),
                    TextField(
                      controller: userController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.people),
                        hintText: 'User',
                        labelText: 'User',
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.red, width: 1)
                        )
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: passController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Password',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.red, width: 1)
                        )
                      ),
                    ),
                    const SizedBox(height: 15),
                    MaterialButton(
                      child: const Text('Log In', 
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white)  
                      ),
                      minWidth: double.infinity,
                      height: 40.0,
                      color: Colors.orange,
                      onPressed: (){
                        IsAuthentic();
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}



showAlertDialog(BuildContext context, String message) {
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return AlertDialog(
        title: const Icon(
          Icons.warning_amber_rounded,
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
