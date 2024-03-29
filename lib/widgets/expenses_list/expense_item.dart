import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
	const ExpenseItem(this.expense, {super.key});
	
	final Expense expense;

	@override
	Widget build(BuildContext context) {
		return Card(
			child: Padding(
				padding: const EdgeInsets.symmetric(
					vertical: 10,
					horizontal: 15
				),
				child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Text(
              expense.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
						const SizedBox(height: 10,),
						Row(
							children: [
								Text('\$${expense.amount.toStringAsFixed(2)}'),
								const Spacer(),
								Row(
									children: [
										Icon(categoryIcons[expense.category]),
										const SizedBox(width: 10,),
										Text(expense.formattedDate)
									],
								)
							],
						)
					],
				),
			),
		);
	}
}