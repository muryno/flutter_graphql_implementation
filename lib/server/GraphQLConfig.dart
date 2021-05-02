
import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfig  {


  static String token = "your can get it from a secured storage";
  static HttpLink httpLink = HttpLink(
   'https://countries.trevorblades.com/',
  );

  ///if you want to pass token
 static  ValueNotifier<GraphQLClient> graphInit()  {
    // We're using HiveStore for persistence,
    // so we need to initialize Hive.


    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );

    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      ),
    );

    return client;
  }






 GraphQLClient clientToQuery() {
    AuthLink authLink = AuthLink(
     getToken: () async => 'Bearer $token',
   );

   final Link link = authLink.concat(httpLink);
   return GraphQLClient(
     cache: GraphQLCache(
       store: HiveStore(),
     ),
     link: link,
   );
 }
}