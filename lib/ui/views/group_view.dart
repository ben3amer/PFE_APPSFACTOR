import 'package:flutter/material.dart';


class GroupView extends StatefulWidget {
  
  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Group Members",
        style: TextStyle(color: Colors.white),
      ),
      ),drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          child: Text(
            'Map',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_circle ,color: Colors.amber,),
          title: Text('Profile',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),),
          
      
        ),
        ListTile(
          leading: Icon(Icons.info , color: Colors.amber,),
          title: Text('About',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),),
             
        
            
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.amber,),
          title: Text('Logout',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),),
            
         
        ),
      ],
    ),
  ),
      backgroundColor: Colors.grey.shade300,
      body: new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[

          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'MohamedAmine BenAmeur',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                       ),
                                  ),
                                ],
                              ),
                             
                            ],
                          ),
                         
                          ),SizedBox(height: 10.0),_divider(),
          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'test2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                       ),
                                  ),
                                ],
                              ),
                             
                            ],
                          ),
                         
                          ),SizedBox(height: 10.0),_divider(),
                           Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomRight ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget> [
                    SizedBox(height:215.0),
      FloatingActionButton(
 materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blue,
                      tooltip: 'Add Member',
                      child: const Icon(Icons.add, size: 36.0),
                      onPressed: () {
                        showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                 new SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Member Code",
                        border: InputBorder.none,
                      ),
                      controller: null,
                      maxLines: 8,
                    ),
                  ),
                  InkWell(
                    
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap:() {  },
                  ),
                  ],
                ),
                
              ), 
          );
      },
                     
                    );
                      },
      ),

       SizedBox(height: 20.0),
        FloatingActionButton(
         materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blue,
                      tooltip: 'Delete Member',
                      child: const Icon(Icons.delete, size: 36.0),
        onPressed: () {
          
       }
       ),
                  ],
    )
                  
          
              ),
                            ), ],
          ),
         ], ),
          ));
  }
   Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness:1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}