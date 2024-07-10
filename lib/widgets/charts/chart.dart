import 'package:flutter/material.dart';
import '../../model/expense.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    // Проверка на null и пустой список
    if (expenses == null || expenses.isEmpty) {
      return [
        ExpenseBucket.forCategory([], Category.food),
        ExpenseBucket.forCategory([], Category.leisure),
        ExpenseBucket.forCategory([], Category.travel),
        ExpenseBucket.forCategory([], Category.work),
      ];
    }
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      // Проверка на null и значение totalExpenses
      if (bucket.totalExpenses != null && bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Отладочные сообщения для проверки списка расходов и их категорий
    print('Expenses: $expenses');
    for (final bucket in buckets) {
      print('Category: ${bucket.category}, Total Expenses: ${bucket.totalExpenses}');
    }
    print('Max Total Expense: $maxTotalExpense');

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: maxTotalExpense == 0 ? 0 : (bucket.totalExpenses ?? 0) / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    categoryIcons[bucket.category],
                    color: isDarkMode
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.7),
                  ),
                ),
              ),
            )
                .toList(),
          )
        ],
      ),
    );
  }
}
