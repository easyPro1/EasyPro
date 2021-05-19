import 'package:easyapp/pages/homepage.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:easyapp/menu_button.dart';

class ProblemPage extends StatelessWidget {
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
          children: <Widget>[
            Center(
              child: Text(
                "Segnalaci in problema",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            
            SizedBox(height: 90,),
              Container(
    child:  TextField(
  decoration: InputDecoration(
     prefixIcon: Icon(Icons.textsms),
    border: OutlineInputBorder(),
    hintText: 'Lascia un messaggio'
  ),
),


                              ), 
SizedBox(height: 10,),
                Container(




                              ),    

 SizedBox(height: 10,),

                      Container(
                              
                              ),  
SizedBox(height: 10,),

                      Container(
    
                              ),                  
                                          
              ],),
            ),
      );


  }
}
