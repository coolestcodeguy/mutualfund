import 'package:flutter/material.dart';
import 'package:mutualfund/barcode_scanner_window.dart';
import 'mutualfund.dart';
import 'mutualfundlist.dart';
import 'barcode_scanner_window.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _buildItem(BuildContext context, String label, Widget page) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => page,
              ),
            );
          },
          child: Text(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner Example')),
      body: Center(
        child: ListView(
          children: [
            _buildItem(
              context,
              'Mutual Fund List',
              const MutualFundsScreen(),
            ),
            _buildItem(
              context,
              'Mutual Fund Details',
              MutualFundDetailsPage(),
            ),
            _buildItem(
              context,
              'Scanner like Paytm',
              const BarcodeScannerWithScanWindow(),
            ),
          ],
        ),
      ),
    );
  }
}
