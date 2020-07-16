//import 'package:flutter/material.dart';

import 'package:pfe_appsfactor/constants/route_names.dart';
import 'package:pfe_appsfactor/locator.dart';
import 'package:pfe_appsfactor/services/auth.dart';
import 'package:pfe_appsfactor/services/navigation_service.dart';
import 'base_model.dart';
//import 'package:pfe_appsfactor/services/firestore_service.dart';


class MapViewModel extends BaseModel {
  
 // final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authenticationService =    locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  //final FirestoreService _firestoreService = locator<FirestoreService>();
 
  

  //navigation to another screens
    void navigateToHome(){
    _navigationService.navigateTo(HomeViewRoute);
  }
  void navigateToInfo(){
    _navigationService.navigateTo(InfoViewRoute);
  }

  //log out
  void logout(){
    _authenticationService.signOut();
    _navigationService.navigateTo(LoginViewRoute);
  }
  
}