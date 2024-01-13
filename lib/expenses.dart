import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

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
		return const Scaffold(
			body: Column(
				children: [
					Text('Chart'),
					Text('Expenses')
				],
			),
		);
	}
}

