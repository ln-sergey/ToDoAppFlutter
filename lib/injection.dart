import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

// ignore: constant_identifier_names
const DI_ENV = bool.fromEnvironment('dart.vm.product') ? Environment.prod : Environment.dev;
  
final getIt = GetIt.instance;

@injectableInit  
void configureDependencies({String env = DI_ENV}) => $initGetIt(getIt, environment: env);