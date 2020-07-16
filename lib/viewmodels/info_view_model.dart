import 'package:flutter/material.dart';
//import 'package:http/http.dart';
import 'package:pfe_appsfactor/constants/route_names.dart';
import 'package:pfe_appsfactor/locator.dart';
import 'package:pfe_appsfactor/services/auth.dart';
import 'package:pfe_appsfactor/services/dialog_service.dart';
import 'package:pfe_appsfactor/services/navigation_service.dart';
import 'base_model.dart';
import 'package:pfe_appsfactor/services/firestore_service.dart';
//import 'package:pfe_appsfactor/services/dialog_service.dart';

class InfoViewModel extends BaseModel {
  
  final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authenticationService =    locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
 
  String _selectedGender = 'Sexe';
  String get selectedGender => _selectedGender;


  void setSelectedGender(dynamic gender){
    _selectedGender = gender;
    notifyListeners();
  }
  
  //navigation to another screens
  void navigateToHome(){
    _navigationService.navigateTo(HomeViewRoute);
  }
  void navigateToInfo(){
    _navigationService.navigateTo(InfoViewRoute);
  }
  void navigateToMap(){
    _navigationService.navigateTo(MapViewRoute);
  }
  //log out
  void logout(){
    _authenticationService.signOut();
    _navigationService.navigateTo(LoginViewRoute);
  }
// show user data
  Widget showUserFullName() {
     return FutureBuilder(
      future: _firestoreService.getfullName(),
      builder: (BuildContext context, AsyncSnapshot<String> fullname){
        
        return  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(fullname.data,
                                style : TextStyle(
                                  fontSize: 14.0 ,
                                  color: Colors.grey[800],
                                ))

                              ),
                            ],
                          ));
      }
    );
     
  }
  Widget showUserCode() {
    
     return FutureBuilder(
      future: _firestoreService.getCode(),
      builder: (BuildContext context, AsyncSnapshot<String> code){
        
        return  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(code.data,
                                style : TextStyle(
                                  fontSize: 14.0 ,
                                  color: Colors.grey[800],
                                ))

                              ),
                            ],
                          ));
      }
    );
     
  }
  Widget showUserPhoneNumber() {
     return FutureBuilder(
      future: _firestoreService.getphoneNumber(),
      builder: (BuildContext context, AsyncSnapshot<String> phone){
         
        return  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(phone.data != null ? phone.data :'ADD A PHONE NUMBER',
                                style : TextStyle(
                                  fontSize: 14.0 ,
                                  color: Colors.grey[800],
                                ))

                              ),
                            ],
                          ));
      }
    );
  }
  Widget showUserGender() {
    
     return FutureBuilder(
      future: _firestoreService.getGender(),
      builder: (BuildContext context, AsyncSnapshot<String> gender){
        return  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(gender.data != null ? gender.data : "UNDEFINED",
                                style : TextStyle(
                                  fontSize: 14.0 ,
                                  color: Colors.grey[800],
                                ))

                              ),
                            ],
                          ));
      }
    );
     
  }
  Widget showUserCountry() {
    
     return FutureBuilder(
      future: _firestoreService.getCountry(),
      builder: (BuildContext context, AsyncSnapshot<String> country){
        return  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(country.data != null ? country.data : 'ADD COUNTRY',
                                style : TextStyle(
                                  fontSize: 14.0 ,
                                  color: Colors.grey[800],
                                ))

                              ),
                            ],
                          ));
      }
    );
     
  }
  Widget showUserPostalCode() {
     return FutureBuilder(
      future: _firestoreService.getpostalCode(),
      builder: (BuildContext context, AsyncSnapshot<String> postal){
        return  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(postal.data != null ? postal.data : "ADD POSTAL CODE",
                                style : TextStyle(
                                  fontSize: 14.0 ,
                                  color: Colors.grey[800],
                                ))

                              ),
                            ],
                          ));
      }
    );
  }
  Widget showUserCity() {
    
     return FutureBuilder(
      future: _firestoreService.getCity(),
      builder: (BuildContext context, AsyncSnapshot<String> city){
        return  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(city.data != null ? city.data : 'ADD CITY',
                                style : TextStyle(
                                  fontSize: 14.0 ,
                                  color: Colors.grey[800],
                                ))

                              ),
                            ],
                          ));
      }
    );
     
  }
  Widget showUserDescription() {
     return FutureBuilder(
      future: _firestoreService.getDescription(),
      builder: (BuildContext context, AsyncSnapshot<String> description){
        return  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(description.data != null ? description.data : 'ADD DESCRIPTION',
                                style : TextStyle(
                                  fontSize: 14.0 ,
                                  color: Colors.grey[800],
                                ))

                              ),
                            ],
                          ));
      }
    );
  }
  Widget showUserAddress() {
    
     return FutureBuilder(
      future: _firestoreService.getAddress(),
      builder: (BuildContext context, AsyncSnapshot<String> adresse){
        return  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(adresse.data != null ? adresse.data : 'ADD AN ADDRESS' , 
                                style : TextStyle(
                                  fontSize: 14.0 ,
                                  color: Colors.grey[800],
                                ))

                              ),
                            ],
                          ));
      }
    );
     
  }
  Widget showUserEmail() {
     return FutureBuilder(
      future: _firestoreService.getEmail(),
      builder: (BuildContext context, AsyncSnapshot<String> email){
        return  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(email.data,
                                style : TextStyle(
                                  fontSize: 14.0 ,
                                  color: Colors.grey[800],
                                ))

                              ),
                            ],
                          ));
      }
    );
  }
  Future <String> showUserPhotoUrl(){
    return _firestoreService.getphotoUrl();
  }
 
 Future updateFullName ({
   @required String name,
 }) async {
   var result = await _firestoreService.updatefullName(name);
  if (result is bool) {
      if (result) {
        await _dialogService.showDialog(
          title: 'Successful Update',
          description: 'Your FullName Update has been submited successfully',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Update Failure',
          description: 'Update failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Update Failure',
        description: result.toString(),
      );
    }
 }/*
Future updateEmail ({
   @required String email,
 }) async {
   var result = await _firestoreService.updateEmail(email);
  if (result is bool) {
      if (result) {
        await _dialogService.showDialog(
          title: 'Successful Update',
          description: 'Your Email has been updated successfully',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Update Failure',
          description: 'Update failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Update Failure',
        description: result.toString(),
      );
    }
 }*/
Future updatePhoneNumber ({
   @required String phone,
 }) async {
   var result = await _firestoreService.updatephoneNumber(phone);
  if (result is bool) {
      if (result) {
        await _dialogService.showDialog(
          title: 'Successful Update',
          description: 'Your PhoneNumber has been updated successfully',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Update Failure',
          description: 'Update failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Update Failure',
        description: result.toString(),
      );
    }
 }
Future updateCountry ({
   @required String country,
 }) async {
   var result = await _firestoreService.updateCountry(country);
  if (result is bool) {
      if (result) {
        await _dialogService.showDialog(
          title: 'Successful Update',
          description: 'Your Country has been updated successfully',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Update Failure',
          description: 'Update failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Update Failure',
        description: result.toString(),
      );
    }
 }
Future updateCity ({
   @required String city,
 }) async {
   var result = await _firestoreService.updateCity(city);
  if (result is bool) {
      if (result) {
        await _dialogService.showDialog(
          title: 'Successful Update',
          description: 'Your City has been updated successfully',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Update Failure',
          description: 'Update failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Update Failure',
        description: result.toString(),
      );
    }
 }
Future updateAddress ({
   @required String address,
 }) async {
   var result = await _firestoreService.updateAddress(address);
  if (result is bool) {
      if (result) {
        await _dialogService.showDialog(
          title: 'Successful Update',
          description: 'Your Address has been updated successfully',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Update Failure',
          description: 'Update failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Update Failure',
        description: result.toString(),
      );
    }
 }
Future updatePostalCode ({
   @required String postal,
 }) async {
   var result = await _firestoreService.updatepostalCode(postal);
  if (result is bool) {
      if (result) {
        await _dialogService.showDialog(
          title: 'Successful Update',
          description: 'Your PostalCode has been updated successfully',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Update Failure',
          description: 'Update failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Update Failure',
        description: result.toString(),
      );
    }
 }
Future updateDescription ({
   @required String description,
 }) async {
   var result = await _firestoreService.updateDescription(description);
  if (result is bool) {
      if (result) {
        await _dialogService.showDialog(
          title: 'Successful Update',
          description: 'Your Description has been updated successfully',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Update Failure',
          description: 'Update failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Update Failure',
        description: result,
      );
    }
 }
 Future updateGender () async {
   String gender = _selectedGender;
   var result = await _firestoreService.updateGender(gender);
  if (result is bool) {
      if (result) {
        await _dialogService.showDialog(
          title: 'Successful Update',
          description: 'Your Sexe has been updated successfully',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Update Failure',
          description: 'Update failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Update Failure',
        description: result.toString(),
      );
    }
 }



}