import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController moneyController = TextEditingController();

    double? _numberdata;

    double essentialsRatio = 50;
    double personalRatio = 30;
    double savingsRatio = 20;

    double _part1;
    double _part2;
    double _part3;

    @override
    void initState() {
      moneyController;
      super.initState();
    }

    @override
    void dispose() {
      moneyController.dispose();
      super.dispose();
    }

    void getMyBudget() {
      _numberdata = double.parse(moneyController.text);
      setState(() {
        _part1 = ((essentialsRatio /
                (essentialsRatio + personalRatio + savingsRatio)) *
            _numberdata!);
        _part2 = ((personalRatio /
                (essentialsRatio + personalRatio + savingsRatio)) *
            _numberdata!);
        _part3 =
            ((savingsRatio / (essentialsRatio + personalRatio + savingsRatio)) *
                _numberdata!);
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Budget Management",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                cursorColor: Theme.of(context).colorScheme.secondary,
                keyboardType: TextInputType.number,
                controller: moneyController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a value";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  labelText: "Your Salary",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 46, 115),
                ),
                onPressed: () {
                  getMyBudget();
                },
                child: Text("Get My Budget"),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Essentials",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Essential: $_part1",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Personal",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Personals: $_part2",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Savings",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Savings: $_part3",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
