import 'package:flutter/material.dart';
import 'api_helper/api_helper.dart';

import 'model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle titleStyle = const TextStyle(
    color: Color(0xff395B64),
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );
  TextStyle ansStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    letterSpacing: 2,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff395B64),
        title: const Text("People Data"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchSingleData(),
        builder: (BuildContext context, AsyncSnapshot<PeopleData?> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR:${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            PeopleData? data = snapshot.data as PeopleData;
            return Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(data.large),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xffA5C9CA),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "FirstName : ",
                                style: titleStyle,
                              ),
                              TextSpan(
                                text: data.first,
                                style: ansStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "LastName : ",
                                style: titleStyle,
                              ),
                              TextSpan(
                                text: data.last,
                                style: ansStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Age : ",
                                style: titleStyle,
                              ),
                              TextSpan(
                                text: data.age.toString(),
                                style: ansStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "City : ",
                                style: titleStyle,
                              ),
                              TextSpan(
                                text: data.city,
                                style: ansStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "State : ",
                                style: titleStyle,
                              ),
                              TextSpan(
                                text: data.state,
                                style: ansStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Email : ",
                                style: titleStyle,
                              ),
                              TextSpan(
                                text: data.email,
                                style: ansStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Phone : ",
                                style: titleStyle,
                              ),
                              TextSpan(
                                text: data.phone,
                                style: ansStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
