
import 'package:get_it/get_it.dart';

import 'auth.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton(AuthService());
  }