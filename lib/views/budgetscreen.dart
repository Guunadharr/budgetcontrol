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

    double? numberdata;

    double essentials = 0.0;
    double personal = 0.0;
    double savings = 0.0;

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
      numberdata = double.parse(moneyController.text);
      setState(() {
        essentials = (numberdata! / 100) * 50;
        personal = (numberdata! / 100) * 30;
        savings = (numberdata! / 100) * 20;
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
              TextField(
                cursorColor: Theme.of(context).colorScheme.secondary,
                keyboardType: TextInputType.number,
                controller: moneyController,
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
                "${essentials}",
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
                "${personal}",
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
                "${savings}",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
