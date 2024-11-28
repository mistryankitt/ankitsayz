
import 'package:ankitsayz/screen/home/provider.dart';
import 'package:ankitsayz/screen/splash/provider.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<SplashProvider>(() => SplashProvider());
  locator.registerLazySingleton<HomeProvider>(() => HomeProvider());
}
