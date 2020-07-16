import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pfe_appsfactor/viewmodels/home_view_model.dart';
import 'package:stacked/stacked.dart';

//import 'package:pfe_appsfactor/customClipper.dart';

class HomeView extends StatelessWidget {
 const  HomeView({Key key}) : super(key: key);
 
  @override
  
  Widget build(BuildContext context) {
    
   return ViewModelBuilder<HomeViewModel>.reactive(
    viewModelBuilder: () => HomeViewModel(),
   builder: (context, model, child) => FutureBuilder(
      future: model.showUserPhotoUrl(),
      builder: (BuildContext context, AsyncSnapshot<String> photoUrl)
      {
      return Scaffold(
        //backgroundColor: Colors.grey.shade100,
         
      drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Profile Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.info ,color: Colors.amber,),
          title: Text('Edit Profile',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),),
            onTap: () =>
         model.navigateToInfo(),
        ),
        /* ListTile(
          leading: Icon(Icons.group ,color: Colors.amber,),
          title: Text('Group',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),),
            onTap: () =>
         model.navigateToInfo(),
        ),*/
        ListTile(
          leading: Icon(Icons.map , color: Colors.amber,),
          title: Text('Map',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),),
            onTap: () =>
         model.navigateToMap(),
            
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.amber,),
          title: Text('Logout',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),),
             onTap: () =>
         model.logout(),
        ),
      ],
    ),
  ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlueAccent, Colors.blueAccent]
              )
            ),
            child: Container(
              width: double.infinity,
              height: 220.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        photoUrl.data,
                      ),
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    model.showUserFullName(),

                  ],
                ),
              ),
            )
          ),
         
          Container(
                child:  
                Padding (  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ 
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'User Information',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber
                                        ),
                                  ),
                                ],
                              ),
                             
                              
                            ],
                          )
                          ),
                      /*
                       Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 15.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                               new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  //model.getEmailIcon() ,
                                ],
                              ),
                               SizedBox(width : 10),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  model.showUserGender(),
                                ],
                              ),
                             
                             
                            ],
                          )),
                     _divider(),*/
                      SizedBox(height : 15),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 15.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                               new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  model.getEmailIcon() ,
                                ],
                              ),
                               SizedBox(width : 10),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  model.showUserEmail(),
                                ],
                              ),
                             
                             
                            ],
                          )),
                     _divider(),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 15.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  
                                   model.getPhoneIcon(),
                                ],
                              ),
                              SizedBox(width : 10),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                 model.showUserPhoneNumber(),
                                ],
                              ),
                              
                              
                            ],
                          )),
                    
                      _divider(),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 15.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                               new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  
                                   model.getAddressIcon() ,
                                ],
                              ),
                               SizedBox(width : 10),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  model.showUserCountry(),
                                ],
                              ),
                             
                             
                            ],
                          )),
                          
                    _divider(),
                     Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 15.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[ new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  model.getCodeIcon(),
                                ],
                              ), SizedBox(width : 10),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                   model.showUserCode(),
                     ],
                    ),
                    ],
                 ),
                 ),
                 _divider(),
                 /*
                 Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 15.0, top: 15.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                            // SizedBox(width : 20),
                                Text('Your Description : ',
                                style: TextStyle( fontSize: 16.0,
                        color: Colors.grey[800],
                                )
                                ),
                              
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  model.showUserDescription(),
                                ],
                              ),
                             
                             
                            ],
                          )),*/
               ],
             ),
            ),
           ),
          ],
        ),
       );
      }         
    ),
  );
 }
}

   Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
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