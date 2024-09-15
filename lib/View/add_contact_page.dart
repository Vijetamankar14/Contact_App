import 'package:contact_form_app/controller/user_services.dart';
import 'package:contact_form_app/models/user_modal.dart';
import 'package:contact_form_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../utils/custom_text_form.dart';

// Define your custom Bottom Sheet widget
class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  static const addContactPage = "/AddContactPage";

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _AddContactPageState extends State<AddContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final UserServices userServices = UserServices();

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final user = UserModal(
        name: nameController.text,
        email: emailController.text,
        contactNumber: contactNoController.text,
        address: addressController.text,
      );

      try {
        await userServices.addContact(user);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Contact added')),
        );

        nameController.clear();
        emailController.clear();
        contactNoController.clear();
        addressController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add contact: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    nameController.dispose();
    emailController.dispose();
    contactNoController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Contact",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  ' New Contact',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const CircleAvatar(
              // minRadius: 60,
              backgroundColor: kAppColor,
              foregroundImage: AssetImage(
                "assets/image.jpg",
              ),
              radius: 80,
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextForm(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter valid Name";
                          }
                          return null;
                        },
                        hintText: "Enter Name",
                        label: "Name",
                        icon: Icons.account_circle,
                      ),
                      CustomTextForm(
                          hintText: "Enter Email",
                          label: "Email",
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your Gmail address";
                            }

                            if (!value.endsWith('@gmail.com')) {
                              return "Enter a valid Gmail address";
                            }

                            return null;
                          },
                          icon: Icons.email_outlined),
                      CustomTextForm(
                          hintText: "Enter Phone Number",
                          label: "Phone Number",
                          controller: contactNoController,
                          validator: (value) {
                            if (value == null || value.length != 10) {
                              return "Enter a valid 10-digit phone number";
                            }
                            return null;
                          },
                          icon: Icons.call),
                      CustomTextForm(
                          hintText: "Enter Address",
                          label: "Address",
                          controller: addressController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Address";
                            }
                            return null;
                          },
                          icon: Icons.home_filled)
                    ],
                  ),
                )),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(kAppColor)),
              onPressed: _submitForm,
              child: const Text('Submit',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
