import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Гүйцэтгэх ажил',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.star_border, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildSection('Description',
              'Барилгын 13 давхарт материалыг өрөлт хийх. Материалыг аюулгүй, зөв дарааллаар байршуулж, орчныг цэвэр цэгцтэй байлгах.'),
          const SizedBox(height: 20),
          _buildSection('Instructions', 'Материалыг өргөх, зөөвөрлөх.'),
          const SizedBox(height: 20),
          _buildSequenceSection(),
          const Spacer(),
          _buildAcknowledgement(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Image.asset('assets/gg.png'),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Work In Progress',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            content,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildSequenceSection() {
    const sequences = [
      'Өргөх лифт ашиглах үедээ тусгай төхөөрөмжөөр аюулгүй байдлыг ханган зөөвөрлөх.',
      'Зөөвөрлөж байгаа материалыг хэт их ачаалахгүй, аюулгүй байдлыг шалгах.',
      'Эхлээд доод хэсгийн өрөлтийг хийж дуусгаад, дарааллаар дээш нь материалыг өрөх.'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sequence',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        ...sequences.map((text) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SequenceItem(text: text),
            )),
      ],
    );
  }

  Widget _buildAcknowledgement(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Уншиж танилцсан',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        StatefulCheckbox(),
      ],
    );
  }
}

class SequenceItem extends StatelessWidget {
  final String text;

  const SequenceItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.circle, size: 8),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class StatefulCheckbox extends StatefulWidget {
  @override
  _StatefulCheckboxState createState() => _StatefulCheckboxState();
}

class _StatefulCheckboxState extends State<StatefulCheckbox> {
  bool isChecked = false;
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });
        if (isChecked) {
          _showBottomSheet(context);
        }
      },
      activeColor: Colors.black,
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Draw Your Signature',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SfSignaturePad(
                  key: _signaturePadKey,
                  backgroundColor: Colors.white,
                  strokeColor: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _locationController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Байршил',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  String location = _locationController.text.trim();
                  if (location.isNotEmpty) {
                    // Add logic to send the location
                    print('Location: $location'); // For now, just print the location
                    Navigator.pop(context); // Close the dialog
                  } else {
                    // Handle empty input if necessary
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a location')),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: BorderSide(color: Colors.blueAccent, width: 2), //olor
                ),
                child: Text(
                  'Send',
                  style: const TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16, // Text size
                    fontWeight: FontWeight.w600, // Bold text
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showLocationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Location'),
          content: TextField(
            controller: _locationController,
            decoration: const InputDecoration(
              hintText: 'Enter location...',
            ),
            keyboardType: TextInputType.text,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String location = _locationController.text.trim();
                if (location.isNotEmpty) {
                  print('Location: $location');
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a location')),
                  );
                }
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: BorderSide(color: Colors.blueAccent, width: 2),
              ),
              child: Text(
                'Send',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16, // Text size
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
