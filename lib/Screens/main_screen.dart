import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Utils/widgets.dart';
import '../Utils/constants.dart';
import '../models/user.dart';


Future<List<User>> _fetchUsersList() async {
  final response = await http.get(Uri.parse(Url));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();

  } else {

    throw Exception('Failed to load users from API');
  }
}


ListView _usersListView(data) {
  return ListView.builder(
      // padding: EdgeInsets.only(left: 5) ,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _userListTile(data[index].name, data[index].email, Icons.account_circle_rounded);
      });
}


ListTile _userListTile(String title, String subtitle, IconData icon) => ListTile(
  title: Text(title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      )),
  subtitle: Text(subtitle),
  leading: Icon(
    icon,
    color: Colors.green[500],
  ),
);


// Future<Address> fetchAddress() async {
//   final response = await http
//       .get(Uri.parse(Url));
//   // https://jsonplaceholder.typicode.com/users
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Address.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }



// class SimpleListBuilder extends StatelessWidget{
//   SimpleListBuilder({Key? key}) : super (key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(8),
//       itemCount: 8,
//       itemBuilder: (BuildContext context, int index) {
//       return MyListItem (numberX: index, numberY: index);
//       }
//     );
//   }
// }

// class MyListItem extends StatelessWidget{
//   var numberX;
//   int numberY;
//
//
//     Future<Users> futureUsers = fetchUsers();
//
//   MyListItem ({Key? key, required this.numberX, required this.numberY,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//    return Container(
//      padding: const EdgeInsets.all(20),
//      margin: const EdgeInsets.all(5),
//      decoration: BoxDecoration(
//        color: Colors.blueAccent,
//        border: Border.all()
//      ),
//      child:  FutureBuilder<Users>(
//        future: futureUsers,
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            return Text('${snapshot.data!.id}');
//          } else if (snapshot.hasError) {
//            return Text('${snapshot.error}');
//          }
//          return const CircularProgressIndicator();
//        },
//      ),
//      // Text('Элемент X$numberX, Y${numberY=numberX+1}', style: Theme.of(context).textTheme.headline6),
//    );
//   }
//
// }

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  late Future<List<User>> futureUsersList;
  late List<User> usersListData;



  @override
  void initState() {
    super.initState();
    futureUsersList = _fetchUsersList();
    // FutureBuilder<Users>(
    //   future: futureUsers,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return Text('${snapshot.data!.id}');
    //     } else if (snapshot.hasError) {
    //       return Text('${snapshot.error}');
    //     }
    //     return const CircularProgressIndicator();
    //   },
    // );
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: appBar(context),
        drawer: navDrawer(context),
        body:FutureBuilder<List<User>>(
          future: futureUsersList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              usersListData = snapshot.data!;
              return _usersListView(usersListData);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      //   FutureBuilder<Users>(
      //     future: futureUsers,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return Text('${snapshot.data!.id}');
      //       } else if (snapshot.hasError) {
      //         return Text('${snapshot.error}');
      //       }
      //       return const CircularProgressIndicator();
      //     },
      // ),
    );
  }
}
