import 'package:flutter/material.dart';
import '../Home/Components/date_time.dart';
import '../Home/Components/image_upload.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text('Form Submitted Successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add News"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            const Text(
              "Title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              key: _formKey,
              minLines: 1,
              maxLines: 100,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
                hintText: 'Enter Headline',
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Headline';
                } else if (value.length < 5) {
                  return 'Please enter least 5 characters';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),

            // Todo: Description
            const Text("Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            TextFormField(
              minLines: 2,
              maxLines: 100,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter description';
                } else if (value.length < 15) {
                  return 'Please enter least 15 characters';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Enter description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

            // Todo: Date and Time
            const DateTimeScreen(),
            const SizedBox(
              height: 20.0,
            ),

            // Todo: Author
            const Text("Author",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            TextFormField(
              minLines: 1,
              maxLines: 1000,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: "Author Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Author name';
                } else if (value.length < 5) {
                  return 'Please enter least 5 characters';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),

            // Todo: Upload Image field
            const ImageUpload(),
            const SizedBox(
              height: 20.0,
            ),

            // Todo: Save Button
            ElevatedButton(
              onPressed: () {
                _submitForm();
              },
              child: const Text("Post"),
            ),
          ],
        ),
      ),
    );
  }
}
