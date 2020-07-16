import 'package:pfe_appsfactor/constants/route_names.dart';
import 'package:pfe_appsfactor/locator.dart';
import 'package:pfe_appsfactor/services/auth.dart';
import 'package:pfe_appsfactor/services/dialog_service.dart';
import 'package:pfe_appsfactor/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }
  void navigateToSignUp(){
    _navigationService.navigateTo(SignUpViewRoute);
  }


  Future signInGoogle () async{
       setBusy(true);

    var res = await _authenticationService.signInWithGoogle();
      var result = (res != null);
      if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Signin with Google Failure',
          description: 'Google Signin failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result.toString(),
      );
    }
  }
  // sign in with facebook
      Future signInFacebook () async{
       setBusy(true);

    var res = await _authenticationService.signInFacebook();
      var result = (res != null);
      if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Signin with Facebook Failure',
          description: 'Facebook Sign in failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result.toString(),
      );
    }
  }
}