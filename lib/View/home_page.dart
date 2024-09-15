import 'package:contact_form_app/View/add_contact_page.dart';
import 'package:contact_form_app/controller/user_services.dart';
import 'package:contact_form_app/models/user_modal.dart';
import 'package:contact_form_app/utils/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const homePage = "/HomePage";

  @override
  Widget build(BuildContext context) {
    UserServices userServices = UserServices();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Contact App",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: StreamBuilder<List<UserModal>>(
            stream: userServices.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No contacts found.'));
              }

              final users = snapshot.data!;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundColor: kAppColor, // Your custom color
                        child: Icon(
                          Icons.person, // Icon inside CircleAvatar
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      title: Text(user.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: ${user.email}'),
                          Text('Phone: ${user.contactNumber}'),
                          Text('Address: ${user.address}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kAppColor,
          shape: const StadiumBorder(),
          onPressed: () {
            Navigator.pushNamed(context, AddContactPage.addContactPage);
          },
          child: const Icon(
            Icons.person_add,
            color: Colors.white,
          ),
        ));
  }
}
