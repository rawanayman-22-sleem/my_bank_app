import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../components/customAppbar.dart';
import '../constants/color.dart';
import 'details_screen.dart';

class MyAccounts extends StatelessWidget {

  const MyAccounts({super.key, required void Function(int index) changeTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: rbackgroundcolor,
      appBar: const CustomAppBar(title: "My Accounts" ),
      body: Column(
        children: [
          Expanded(
            child: ConditionalBuilder(
              condition: true,
              builder: (context) => ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => CustomBankCard(),
                itemCount: 3,
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBankCard extends StatelessWidget {
  const CustomBankCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountDetailsScreen()),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Banque Misr",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
