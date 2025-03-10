import 'package:flutter/material.dart';
import '../components/customAppbar.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';
import '../constants/color.dart';
import '../components/custom_date_picker_field.dart';

class AddAccount extends StatefulWidget {

  final Function(int) changeTab;

  const AddAccount({super.key, required this.changeTab});
  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  final List<String> banks = [
    "Select Bank",
    "Banque Misr",
    "National Bank of Egypt",
    "Egyptian Arab Land Bank",
    "Agricultural Bank of Egypt",
    "Industrial Development Bank",
    "Banque Du Caire",
    "The United Bank",
    "Bank of Alexandria",
    "MIDBank S.A. E",
    "Qatar National Bank Alahli S.A.E",
    "Commercial International Bank (CIB)",
    "Attijariwafa bank Egypt S.A.E",
    "Societe Arabe Internationale de Banque",
    "Credit Agricole Egypt S.A.E",
    "Emirates National Bank of Dubai S.A.E.",
    "Suez Canal Bank",
    "Arab Investment Bank",
    "AL Ahli Bank of Kuwait",
    "First Abu Dhabi Bank - Misr",
    "Ahli United Bank ",
    "Faisal Islamic Bank of Egypt",
    "Housing and Development Bank",
    "Al Baraka Bank of Egypt S.A.E",
    "National Bank ofKuwait (NBK)",
    "Abu Dhabi Islamic Bank",
    "ABU DHABI COMMERCIAL BANK",
    "Egyptian Gulf Bank",
    "Arab African International Bank",
    "HSBC Bank Egypt S.A.E",
    "Arab Banking Corporation",
    "Export Development Bank of Egypt",
    "Arab International Bank",
    "Citi Bank N A / Egypt" ,
    "Arab Bank PLC",
    "Mashreq Bank",
    "National Bank of Greece",
    "Standard Chartered Bank",

  ];
   String? selectedBank;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController percentageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: rbackgroundcolor,
        appBar: const CustomAppBar(title: "Add Account"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Select Bank",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                    value: selectedBank,
                    items: banks.map((String bank) {
                      return DropdownMenuItem<String>(
                        value: bank,
                        child: Text(bank),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedBank = newValue!;
                      });
                    },
                    validator: (value) => value == null ? "You must choose the bank." : null,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomTextFormField(
                          labelText: "Enter the amount",
                          hintText: "0.00",
                          prefixIconColor: rmaincolor,
                          keyboardType: TextInputType.number,
                          prefixIcon: Icons.attach_money,
                          controller: amountController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the amount";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                          labelText: "Percentage",
                          hintText: "0",
                          prefixIconColor: rmaincolor,
                          keyboardType: TextInputType.number,
                          prefixIcon: Icons.percent,
                          controller: percentageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the percentage.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            children: [
                              DatePickerField(
                                labelText: 'Start Date',),

                              const SizedBox(height: 30),

                              DatePickerField(labelText: 'End Date')
                            ],
                          ),
                       
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: CustomButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {

                          widget.changeTab(0);
                        }
                      },
                      text: 'Add Account',
                    ),
                  ),
                  Center(
                      child: Image.asset('assets/images/Na_Nov_15.jpg' ,
                        height: 250,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }
}