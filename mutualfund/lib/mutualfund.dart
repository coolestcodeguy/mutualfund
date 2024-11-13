import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

enum PeriodOptions { m3, m6, y1, y3, max, sip }

const List<(PeriodOptions, String)> periodOptions = <(PeriodOptions, String)>[
  (PeriodOptions.m3, '3M'),
  (PeriodOptions.m6, '6M'),
  (PeriodOptions.y1, '1Y'),
  (PeriodOptions.y3, '3Y'),
  (PeriodOptions.max, 'MAX'),
  (PeriodOptions.sip, 'SIP'),
];

class MutualFundDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Mutual Fund', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'IP',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ICICI Pru Value Discovery Fund',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'By ICICI group',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text('Growth')),
                  Chip(label: Text('Equity')),
                  Chip(label: Text('Value Fund')),
                ],
              ),
              SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('CAGR (Annualized return)',
                                  style: TextStyle(color: Colors.grey)),
                              Text(
                                '+23.98 %',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                          DropdownButton<String>(
                            value: '3 years',
                            items: ['1 year', '3 years', '5 years']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text('Current NAV (As per 26th September 2024)',
                          style: TextStyle(color: Colors.grey)),
                      Row(
                        children: [
                          Text('493.80',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Text('+2.34%', style: TextStyle(color: Colors.green)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 200,
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(show: false),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 3),
                                  FlSpot(1, 1),
                                  FlSpot(2, 4),
                                  FlSpot(3, 2),
                                  FlSpot(4, 5),
                                ],
                                isCurved: true,
                                color: Colors.black,
                                barWidth: 2,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(show: false),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      LayoutBuilder(builder: (context, constraints) {
                        return ToggleButtons(
                          children: ['3M', '6M', '1Y', '3Y', 'MAX', 'SIP']
                              .map((String label) {
                            return Text(label);
                          }).toList(),
                          onPressed: (int index) {
                            // setState(() {
                            //   _selectedPeriodIndex = index;
                            // });
                          },
                          isSelected:
                              List.generate(6, (int index) => index == 1),
                          color: Colors.blue,
                          selectedColor: Colors.white,
                          fillColor: Colors.grey[300],
                          // borderRadius: BorderRadius.circular(8),
                          // constraints: BoxConstraints(minWidth: 64, maxWidth: 128),
                          constraints: BoxConstraints(minHeight: 32, minWidth: 0.16 * constraints.maxWidth),
                        );
                      })
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text('Key metrics',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildKeyMetric('Expense Ratio', '1.03 %'),
                  _buildKeyMetric('Exit Load', '1.00 %'),
                  _buildKeyMetric('Sharpe Ratio', '3.20'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeyMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey)),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
