import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import '../model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(title: "Flutter course", amount: 19.99, date: DateTime.now(), category: Category.work),
    Expense(title: "Flutter course", amount: 19.99, date: DateTime.now(), category: Category.work)
  ];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold( appBar: AppBar(actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],),
        body: Column(
          children: [const Text( "Chart"), Expanded(child: ExpensesList(expenses: _registeredExpenses))],
        ),
      ),
    );
  }
}
