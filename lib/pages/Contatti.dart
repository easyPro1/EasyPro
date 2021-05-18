import 'package:easyapp/pages/homepage.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:easyapp/menu_button.dart';

class ContattiPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor:  Color(0xFF151026),
        title: Text('EasyPro'),
        /*title: Image.asset('../web/prova.png', fit: BoxFit.fitHeight),*/
      ),
  drawer: Drawer(
     child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
         MenuButton(
              primary: Colors.blue,
              onPressed: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()),);
              },
              text: "Accedi",
            ),
             MenuButton(
              primary: Colors.green,
              onPressed: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()),);
              },
              text: "HomePage",
            ),
      ],
    ),
  ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
      return Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                "Contatti",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            
            SizedBox(height: 90,),
              Container(
                                child: Row(
                                   children: <Widget>[
            Text("Contattaci e tieniti aggiornato sui nostri social:",
            
            style:TextStyle(
               
              fontSize: 17,
              color: Colors.black,
            )),
               ],
                                ),
                              ), 
SizedBox(height: 10,),
                Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.mail,
                                      size: 30,
                                      color: Colors.orange,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      "easy.prof.app@gmail.com",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),    

 SizedBox(height: 10,),

                      Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                     Icons.face_outlined,
                                      size: 30,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      "Easy Pro - Facebook",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),  
SizedBox(height: 10,),

                      Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                     Icons.phone,
                                      size: 30,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      "Send a message to 0823826212",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),                  
                                          
              ],),
            ),
      );


  }
}
