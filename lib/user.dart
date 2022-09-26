// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:api_course/models/user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = userModelFromJson(response.body);
    if (response.statusCode == 200) {
      userList = [...data];
      return userList;
    } else {
      return userList;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User API Model'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     const Text('name'),
                                //     Text(snapshot.data![index].name.toString()),
                                //   ],
                                // ),
                                MultipleDataRow(
                                    title: "Name",
                                    value:
                                        snapshot.data![index].name.toString()),
                                MultipleDataRow(
                                    title: "User Name",
                                    value: snapshot.data![index].username
                                        .toString()),
                                MultipleDataRow(
                                    title: "Email",
                                    value:
                                        snapshot.data![index].email.toString()),
                                MultipleDataRow(
                                    title: "Address",
                                    value: snapshot.data![index].address.city
                                        .toString()),
                              ],
                            ),
                          ),
                        );
                      }));
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MultipleDataRow extends StatelessWidget {
  String title, value;
  MultipleDataRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
