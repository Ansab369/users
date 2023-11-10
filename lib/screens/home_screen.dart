// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users/provider/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    userProvider.getUserData();

    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: userProvider.users.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];
                return UserWidget(
                  name: user.name,
                  userName: user.username,
                  email: user.email,
                  phone: user.phone,
                  webSite: user.website,
                  street: user.address.street,
                  suite: user.address.suite,
                  city: user.address.city,
                  zipcode: user.address.zipcode,
                  lat: user.address.geo.lat,
                  lng: user.address.geo.lng,
                  companyName: user.company.name,
                  catchPhrase: user.company.catchPhrase,
                  bs: user.company.bs,
                );
              },
            ),
    );
  }
}

class UserWidget extends StatelessWidget {
  final String name;
  final String userName;
  final String email;
  final String phone;
  final String webSite;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String lat;
  final String lng;
  final String companyName;
  final String catchPhrase;
  final String bs;

  const UserWidget({
    super.key,
    required this.name,
    required this.userName,
    required this.email,
    required this.phone,
    required this.webSite,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
    required this.companyName,
    required this.catchPhrase,
    required this.bs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.3),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // name

            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 12),
            Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              userName,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              email,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              phone,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              webSite,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            )
            // address

            ,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.3),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "address",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(street),
                  Text(suite),
                  Text(city),
                  Text(zipcode),
                  // todo : add google map widget
                  // lat
                  // lng
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(
              "company",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(companyName),
            Text(catchPhrase),
            Text(bs),
            //!
            //           ElevatedButton(
            //   onPressed: fetchData,
            //   child: Text('Fetch Data'),
            // ),
          ],
        ));
  }
}
