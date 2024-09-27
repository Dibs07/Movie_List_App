import 'package:get_it/get_it.dart';
import 'package:my_movie_list/services/alert_service.dart';
import 'package:my_movie_list/services/loader_service.dart';
import 'package:my_movie_list/services/navigation_service.dart';

Future<void> registerService() async {
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<NavigationService>(
    NavigationService(),
  );
   getIt.registerSingleton<AlertService>(
    AlertService(),
  );
   getIt.registerSingleton<LoaderService>(
    LoaderService(),
  );
}