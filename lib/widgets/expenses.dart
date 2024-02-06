import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
	const Expenses({super.key});

	@override
	State<Expenses> createState() {
		return _ExpensesState();
	}
}

class _ExpensesState extends State<Expenses> {
	final List<Expense> _registeredExpenses = [
		// Expense(
		// 	title: 'Learn Flutter',
		// 	amount: 9.99,
		// 	date: DateTime.now(),
		// 	category: Category.leisure
		// ),
		// Expense(
		// 	title: 'JavaScript Course',
		// 	amount: 12.99,
		// 	date: DateTime.now(),
		// 	category: Category.work
		// )
	];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 10),
        content: const Text('Item deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }
        ),
      )
    );
  }

	@override
	Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expenses found.'),
    );

    if(_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

		return Scaffold(
			appBar: AppBar(
				title: const Text(
					'Expense Tracker',
					style: TextStyle(
						color: Color.fromARGB(255, 255, 255, 255)
						),
					),
				actions: [
					IconButton(
						onPressed: _openAddExpenseOverlay,
						icon: const Icon(
							Icons.add,
							color: Color.fromARGB(255, 255, 255, 255),
						)
					)
				],
			),
			body: deviceWidth < 600 ? Column(
				children: [
					Chart(expenses: _registeredExpenses),
					Expanded(
						child: mainContent,
					)
				],
			) : Row(
				children: [
					Expanded(
            child: Chart(expenses: _registeredExpenses),
          ),
					Expanded(
						child: mainContent,
					)
				],
			),
		);
	}
}

