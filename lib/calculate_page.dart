import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class calculator extends StatelessWidget {
  String product, price, installment;

  double wh = 0, total = 0, last = 0;
  calculator(
    {Key? key,
    required this.product,
    required this.price,
    required this.installment,})
    :super(key: key);

  @override
  Widget build(BuildContext context) {

    var numfor = NumberFormat("#,###.0#", "en_US");
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    title: Text('สินค้า : '),
                    subtitle: Text(' $product'),
                  )),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    title: Text('ราคา : '),
                    subtitle: Text(' $price'),
                  )),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    title: Text('จำนวนงวด : '),
                    subtitle: Text(' $installment'),
                  )),
                Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text('ดอกเบี้ย : '),
                      subtitle: Text(' ' + number2(double.parse(installment)).toString() + '%'),
                    )),
                Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text('ดอกเบี้ยทั้งหมด : '),
                      subtitle: Text(' ' +numfor.format(number1(double.parse(installment), double.parse(price))).toString()),
                    )),
                Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text('จำนวนผ่อนต่องวด : '),
                      subtitle: Text(' ' +numfor.format(number3(double.parse(installment), double.parse(price))).toString()),
                    )),
                Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text('จำนวนเงินทั้งหมด : '),
                      subtitle: Text(' ' +numfor.format(number4(double.parse(installment), double.parse(price))).toString()),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
  double number1(double w, double h) {
    if (w == 6) {
      total = h * 0;
      total = 0;
    } else if (w == 10) {
      total = h * (1 / 100);
      total = 1;
    } else if (w == 24) {
      total = h * (2 / 100);
      total = 2;
    } else {
      total = h * (5 / 100);
      total = 5;
    }
    return last = total * w;
  }

  double number2(double w) {
    if (w == 6) {
      total = 0;
    } else if (w == 10) {
      total = 1;
    } else if (w == 24) {
      total = 2;
    } else {
      total = 5;
    }
    return total;
  }

  double number3(double w, double h) {
    if (w == 6) {
      total = ((h * (0 / 100)) * w) + h;
    } else if (w == 10) {
      total = ((h * (1 / 100)) * w) + h;
    } else if (w == 24) {
      total = ((h * (2 / 100)) * w) + h;
    } else {
      total = ((h * (5 / 100)) * w) + h;
    }
    return last = total / w;
  }

  double number4(double w, double h) {
    if (w == 6) {
      total = ((h * (0 / 100)) * w) + h;
    } else if (w == 10) {
      total = ((h * (1 / 100)) * w) + h;
    } else if (w == 24) {
      total = ((h * (2 / 100)) * w) + h;
    } else {
      total = ((h * (5 / 100)) * w) + h;
    }
    return total;
  }
}