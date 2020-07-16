import 'package:pfe_appsfactor/viewmodels/base_model.dart';
import 'package:pfe_appsfactor/locator.dart';
import 'package:pfe_appsfactor/services/auth.dart';
import 'package:pfe_appsfactor/services/navigation_service.dart';
import 'package:pfe_appsfactor/constants/route_names.dart';

class StartUpViewModel extends BaseModel {
  
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    bool hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    if(hasLoggedInUser){
      _navigationService.navigateTo(HomeViewRoute);
    }
    else{
      _navigationService.navigateTo(LoginViewRoute);  
    }
  }

}