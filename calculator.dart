import 'package:flutter/material.dart';

void main() {
  runApp(const TipSliderDemo());
}

class TipSliderDemo extends StatelessWidget {
  const TipSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TipCalculatorPage(),
    );
  }
}

class TipCalculatorPage extends StatefulWidget {
  const TipCalculatorPage({super.key});

  @override
  State<TipCalculatorPage> createState() => _TipCalculatorPageState();
}

class _TipCalculatorPageState extends State<TipCalculatorPage> {
  final _billController = TextEditingController(text: '24.50');
  double _tipPercent = 15;

  double get _bill => double.tryParse(_billController.text) ?? 0;
  double get _tipAmount => _bill * _tipPercent / 100;

  @override
  void dispose() {
    _billController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurant Tip Calculator')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Icon(
              Icons.receipt_long_outlined,
              size: 64,
              color: Colors.teal,
            ),
            const SizedBox(height: 16),
            Text(
              'Split the bill fairly',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 28),
            TextField(
              controller: _billController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                labelText: 'Bill total',
                prefixText: '\$',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Tip percentage: ${_tipPercent.round()}%',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Slider(
              value: _tipPercent,
              min: 0,
              max: 30,
              divisions: 30,
              onChanged: (newValue) => setState(() => _tipPercent = newValue),
            ),
            const SizedBox(height: 20),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text('Tip amount'),
                    const SizedBox(height: 8),
                    Text(
                      '\$${_tipAmount.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Divider(height: 32),
                    const Text('Total to pay'),
                    const SizedBox(height: 8),
                    Text(
                      '\$${(_bill + _tipAmount).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
