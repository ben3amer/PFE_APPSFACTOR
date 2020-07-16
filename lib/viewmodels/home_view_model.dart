import 'package:flutter/material.dart';
import 'package:pfe_appsfactor/constants/route_names.dart';
import 'package:pfe_appsfactor/locator.dart';
import 'package:pfe_appsfactor/services/auth.dart';
//import 'package:pfe_appsfactor/services/dialog_service.dart';
import 'package:pfe_appsfactor/services/navigation_service.dart';
import 'base_model.dart';
import 'package:pfe_appsfactor/services/firestore_service.dart';


class HomeViewModel extends BaseModel {
  
  //final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authenticationService =    locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
 
  
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
        return Column(
       
          children: <Widget>[
           
            Text(fullname.data,
            style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,)
             ) ,
           ],     
         );
      }
    );
     
  }
   Widget showUserDescription() {
     return FutureBuilder(
      future: _firestoreService.getDescription(),
      builder: (BuildContext context, AsyncSnapshot<String> description){
        return Column(
       
          children: <Widget>[
           
            Text(description.data != null ?description.data :'ADD DESCRIPTION',
            style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,)
             ) ,
           ],     
         );
      }
    );
     
  }
  Widget showUserGender() {
     return FutureBuilder(
      future: _firestoreService.getGender(),
      builder: (BuildContext context, AsyncSnapshot<String> gender){
        return Column(
       
          children: <Widget>[
           
            Text(gender.data != null ?gender.data :'UNDEFINED',
            style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,)
             ) ,
           ],     
         );
      }
    );
     
  }
  Widget showUserEmail() {
     return FutureBuilder(
      future: _firestoreService.getEmail(),
      builder: (BuildContext context, AsyncSnapshot<String> email){
        return Column(
       
          children: <Widget>[
           
            Text(email.data,
            style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[800],)
             ) ,
           ],     
         );
      }
    );
     
  }
  Widget showUserCode() {
    
     return FutureBuilder(
      future: _firestoreService.getCode(),
      builder: (BuildContext context, AsyncSnapshot<String> code){
        return Column(
       
          children: <Widget>[
           
            Text(code.data,
            style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[800],)
             ) ,
           ],     
         );
      }
    );
     
  }
  Widget showUserPhoneNumber() {
     return FutureBuilder(
      future: _firestoreService.getphoneNumber(),
      builder: (BuildContext context, AsyncSnapshot<String> phone){
        return Column(
       
          children: <Widget>[
         //  Container(),
           //Icon(Icons.phone),
            Text(phone.data != null ? '+216 ' + phone.data :'ADD PHONE NUMBER',
            style: TextStyle(
                      fontSize: 16.0,
                        color: Colors.grey[800],)
             ),
           ],     
         );
      }
    );
  }
  Widget showUserCountry() {
     return FutureBuilder(
      future: _firestoreService.getCountry(),
      builder: (BuildContext context, AsyncSnapshot<String> country){
        return Column(
       
          children: <Widget>[
         //  Container(),
           //Icon(Icons.phone),
            Text(country.data != null ?country.data :'ADD COUNTRY',
            style: TextStyle(
                      fontSize: 16.0,
                        color: Colors.grey[800],)
             ),
           ],     
         );
      }
    );
  }
  
  Future <String> showUserPhotoUrl(){
    return _firestoreService.getphotoUrl();
  }
 //icons
  Widget getEmailIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.amber,
        radius: 14.0,
        child: new Icon(
          Icons.email,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
      },
    );
  }
  Widget getCodeIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.amber,
        radius: 14.0,
        child: new Icon(
          Icons.security,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
      },
    );
  }
  Widget getAddressIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.amber,
        radius: 14.0,
        child: new Icon(
          Icons.location_on,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
      },
    );
  }
  Widget getPhoneIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.amber,
        radius: 14.0,
        child: new Icon(
          Icons.phone,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
      },
    );
  }/*
  Widget getGenderIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.amber,
        radius: 14.0,
        child: new Icon(
          Icons.,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
      },
    );
  }*/
}