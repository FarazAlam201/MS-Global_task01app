import 'package:flutter/material.dart';
import 'package:task1_app/main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 10,
        ),
        _showProfile("Name :", user.name),
        _showProfile("Username :", user.username),
        _showProfile("Adrress :",
            "${user.address.street},${user.address.suite},\n${user.address.city}"),
        _showProfile("Zipcode :", user.address.zipcode)
      ],
    );
  }

  Widget _showProfile(String keyText, String valueText) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(keyText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600)),
              Text(valueText, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
