import 'package:bills_padi_client/services/payment.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  final formKey = GlobalKey<FormState>();
  PaymentService service = PaymentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Details',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: showBackView,
                onCreditCardWidgetChange: (CreditCardBrand cardBrand) {},
                cardBgColor: const Color(0xFFF022A5),
                cardType: CardType.mastercard,
              ),
              CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (CreditCardModel? model) {
                  setState(() {
                    cardNumber = model!.cardNumber;
                    expiryDate = model.expiryDate;
                    cvvCode = model.cvvCode;
                    cardHolderName = model.cardHolderName;
                  });
                },
                themeColor: const Color(0xFFF069A5),
                formKey: formKey,
                obscureCvv: true,
                cardNumberDecoration: const InputDecoration(
                  label: Text(
                    'Card Number',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  hintText: 'XXXX XXXX XXXX XXXX',
                ),
                expiryDateDecoration: const InputDecoration(
                  label: Text(
                    'Expiry Date',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: const InputDecoration(
                  label: Text(
                    'cvv',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  hintText: 'XXX',
                ),
                cardHolderDecoration: const InputDecoration(
                  label: Text(
                    'Card Holder',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            bool success = await service.addCard(cardNumber,
                                expiryDate, cvvCode, cardHolderName);
                            if (success) {
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                              Navigator.pushNamed(context, '/home');
                            }
                          } else {
                            print('InValid');
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.add),
                            Text('Connect my Card',
                                style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 218, 89, 147),
                          padding: const EdgeInsets.all(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
