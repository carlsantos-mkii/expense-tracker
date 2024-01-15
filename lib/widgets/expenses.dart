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
		Expense(
			title: 'Learn Flutter',
			amount: 9.99,
			date: DateTime.now(),
			category: Category.leisure
		),
		Expense(
			title: 'JavaScript Course',
			amount: 12.99,
			date: DateTime.now(),
			category: Category.work
		)
	];

	@override
	Widget build(BuildContext context) {
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
						onPressed: () {},
						icon: const Icon(
							Icons.add,
							color: Color.fromARGB(255, 255, 255, 255),
						)
					)
				],
				backgroundColor: const Color.fromARGB(255, 39, 39, 39),
			),
			body: Column(
				children: [
					const Text('Chart'),
					Expanded(
						child: ExpensesList(expenses: _registeredExpenses),
					)
				],
			),
		);
	}
}

