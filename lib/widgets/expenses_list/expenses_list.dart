import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
	const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

	final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

	@override
	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: expenses.length,
			itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: kColorScheme.error,
          child: const Icon(
            Icons.delete,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index])
      ),
		);
	}
}
