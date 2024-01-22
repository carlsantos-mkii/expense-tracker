import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {
	const NewExpense({super.key});
	
	@override
	State<NewExpense> createState() {
		return _NewExpenseState();
	}
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _datePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.all(15),
			child: Column(
				children: [
					TextField(
            controller: _titleController,
						maxLength: 50,
						decoration: const InputDecoration(
							label: Text('Title'),
						),
					),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  inputFormatters: [ FilteringTextInputFormatter.digitsOnly ],
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Row(
                  children: [
                    const Text('Selected Date'),
                    IconButton(
                      onPressed: _datePicker,
                      icon: const Icon(
                        Icons.calendar_month,
                      )
                    )
                  ],
                ),
              )
            ],
          ),
          Row(children: [
            ElevatedButton(
              onPressed: () {
                print(_titleController.text);
                print(_amountController.text);
              },
              child: const Text('Save Expense'),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
                )
            ],
          )
				],
			)
		
		);
	}
}