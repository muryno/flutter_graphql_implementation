
import 'package:flutter/material.dart';
import 'package:flutter_graphql_implementation/server/GraphQLConfig.dart';
import 'package:flutter_graphql_implementation/uiScreens/home_screen.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  // launch app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp();

  @override
  Widget build(BuildContext context) {
    //GraphQLConfig init
    ValueNotifier<GraphQLClient> client = GraphQLConfig.graphInit();
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
          title: 'Flutter Graphql Demo',


        home: HomeScreen(),

      ),
    );
  }
}

