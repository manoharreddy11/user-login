import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String profileImageUrl = ''; // Store the profile image URL

  // Function to handle image picking
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery); // Allow user to pick image from gallery

    if (pickedFile != null) {
      setState(() {
        profileImageUrl = pickedFile
            .path; // Update profile image URL with the selected image path
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Profile image
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  profileImageUrl), // Use profileImageUrl as the URL for NetworkImage
              child: IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  pickImage(); // Call the function to allow the user to pick an image
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: professionController,
              decoration: InputDecoration(labelText: 'Profession'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update profile logic
                // You can access updated data using nameController.text, professionController.text, etc.
              },
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
