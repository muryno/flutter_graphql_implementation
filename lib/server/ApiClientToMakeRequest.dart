
import 'package:flutter_graphql_implementation/model/Country.dart';
import 'package:flutter_graphql_implementation/server/GraphQLConfig.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class ApiClients{



  String countryQuery =  '''
           query getCountry(\$input: ID!) {
                country(code: \$input) {
                    code 
                    name
                    phone
                    capital
                    currency
                    emoji
                    emojiU
                }
            }
    ''';

  ///Example on how to implement query to get country
  Future<Country>  getCountry(String code) async {

    Country country =  Country();
    try {

      ///initializing GraphQLConfig
      GraphQLConfig  graphQLConfiguration  = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(

        QueryOptions(
            document: gql(countryQuery),
            variables: {
              "input": "$code"
            }
        ),
      );


      if(result.hasException){
        print(result.exception?.graphqlErrors[0]?.message);

      }else if(result.data!= null){
         country = Country.fromJson(result.data["country"]);

        return country;
      }


    }catch(e){
      print(e);
      return country;

    }




  }





///THIS IS A SAMPLE FOR MAKING MUTABLE REQUEST
  ///login
  static String login(String email,
      String password) {
    return '''
            mutation{
              login(data: {
                input:"$email",
                password: "$password"
              }){
                token
                user{
                  _id
                  email
                  phonenumber
                  referralCode
                  username
                  emailVerified
                }
              }
            }
        ''';
  }



  ///Example on how to implement mutation
  Future<String>  Login(String email, password) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig  graphQLConfiguration  = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          document: gql(login(email,password)), // this
        ),
      );
      if(result.hasException){
        print(result.exception?.graphqlErrors[0]?.message);

      }else if(result.data!= null){
      //  parse your response here and return
       // var data = User.fromJson(result.data["register"]);
      }

      return "";
    }catch(e){
      print(e);
      return "";

    }
  }

}