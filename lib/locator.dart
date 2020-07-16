import 'package:pfe_appsfactor/services/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:pfe_appsfactor/services/navigation_service.dart';
import 'package:pfe_appsfactor/services/dialog_service.dart';
import 'package:pfe_appsfactor/services/firestore_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  
}