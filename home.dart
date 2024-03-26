import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_app/justApi.dart';
import 'package:quizz_app/nextApi.dart';
import 'package:quizz_app/timeClock.dart';

class TheApi extends StatelessWidget {
  TheApi({super.key});

  TextEditingController passctr = TextEditingController();
  TextEditingController userctr = TextEditingController();

  postDtat(context) async {
    var Url = "https://crm-beta-api.vozlead.in/api/v2/account/login/";
    var body = {
      "username": userctr.text.trim(),
      "password": passctr.text.trim(),
    };

    final response = await http.post(Uri.parse(Url), body: body);
    print('>>>>>>>>>>>>>${response.body}');

    if (response.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Clock(),
      ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Wrong")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "welcome back ! please enter yoyur credentials to login",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15, bottom: 10, top: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer)
                    ]),
                width: 390,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: userctr,
                    decoration: const InputDecoration(
                        hintText: "user name",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer)
                    ]),
                width: 390,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: passctr,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Forget your ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Password?",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                postDtat(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer)
                        ]),
                    width: 390,
                    height: 60,
                    child: const Center(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Don't have any account? ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Sign Up?",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//first importh the http
// craete textediting controller
// craete text from filed and pass the controller
//create  a function inside the function 
// create  a variable and paste the url
//create a a variable map and give the exact key according to the api and the texteditingcontoller    "password" : passctr.text.trim(),
// and create an avaraibale final response= await http.post(Uri.parse(Url),body: body);
//if you want you can check the response print 
//and give condition like if the statuse code is 200 next page else error warning