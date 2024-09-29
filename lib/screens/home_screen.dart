import 'package:flutter/material.dart';
import 'package:tutorial/components/buttons/elevate_button.dart';
import 'package:tutorial/libraries/local_storage.dart';
import 'package:tutorial/libraries/toasts_popups.dart';
import 'package:tutorial/themes/colors.dart';
import 'package:tutorial/themes/text_styles.dart';
import 'package:tutorial/widgets/core/input_field.dart';

const _DB_KEY = 'db-key';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _label = TextEditingController();
  var _data = 'No Name Found';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences')),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Your Name', style: TextStyles.text15_500.copyWith(color: dark)),
            const SizedBox(height: 06),
            InputField(hintText: 'Write your name here', controller: _label),
            const SizedBox(height: 24),
            ElevateButton(onTap: _storeData, label: 'Store'),
            const SizedBox(height: 10),
            ElevateButton(onTap: _fetchData, label: 'Retrieve'),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: primary.withOpacity(0.1),
                border: Border.all(color: primary.withOpacity(0.6)),
                borderRadius: BorderRadius.circular(04),
              ),
              child: Text(_data, textAlign: TextAlign.center, style: TextStyles.text22_600.copyWith(color: primary)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _storeData() async {
    if (_label.text.trim().isEmpty) return;
    await LocalStorage.setString(key: _DB_KEY, value: _label.text);
    ToastPopup.onSuccess(message: 'Data Saved Successfully', isTop: true);
    _label.clear();
  }

  Future<void> _fetchData() async {
    var data = await LocalStorage.fetchString(key: _DB_KEY);
    if (data != null) setState(() => _data = data);
  }
}
