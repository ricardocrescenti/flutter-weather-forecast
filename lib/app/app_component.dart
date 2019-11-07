import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:state_persistence/state_persistence.dart';
import 'package:weather_forecast/app/pages/home/home_component.dart';
import 'package:weather_forecast/app/services/app_service.dart';

class AppComponent extends Component {
  @override
  Widget build(BuildContext context, Module module, Controller controller) {
    return PersistedStateBuilder(
      builder: (context, snapshot) => ServiceConsumer<AppService>(
        builder: (context, service) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: (service.darkMode ? Brightness.dark : Brightness.light),
            primarySwatch: Colors.blue,
          ),
          home: _buildBody(module, snapshot),
        )
      )
    );
  }

  _buildBody(module, snapshot) {
    if (snapshot.data != null) {
      return module.component<HomeComponent>();
    } else {
      return Container();
    }
  }
}