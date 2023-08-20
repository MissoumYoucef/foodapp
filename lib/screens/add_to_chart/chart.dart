import 'package:credit_card_form/credit_card_form.dart' as credit_card_form;
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:foodapp/screens/shared_txt_widget.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {

  credit_card_form.CreditCardController creditCardController = credit_card_form.CreditCardController();
  GlobalKey<FormState> k = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SharedText(color: Colors.black, size: 25, text: 'Add Your Card Information',fontWeight: FontWeight.bold,),
            const SizedBox(height: 20,),
            credit_card_form.CreditCardForm(
              controller: creditCardController,
              onChanged: (p0) {
              
            },),
            CreditCardWidget(
              cardNumber: '10',
              expiryDate: '20',
              cardHolderName: 'cardHolderName',
              cvvCode: 'cvvCode',
              showBackView: true,
              onCreditCardWidgetChange:
                  (_) {}, //true when you want to show cvv(back) view
            ),
            TextButton(onPressed: (){}, child: const Text('Confirm'))
          ],
        ),
      ),
    );
  }
}
