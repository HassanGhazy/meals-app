import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> favoruiteMeals;
  FavouritesScreen(this.favoruiteMeals);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoruiteMeals.isEmpty) {
      return Center(
        child: Text('you have no favouries yet - start adding some!'),
      );
    } else
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoruiteMeals[index].id,
            title: widget.favoruiteMeals[index].title,
            imageUrl: widget.favoruiteMeals[index].imageUrl,
            duration: widget.favoruiteMeals[index].duration,
            affordability: widget.favoruiteMeals[index].affordability,
            complexity: widget.favoruiteMeals[index].complexity,
          );
        },
        itemCount: widget.favoruiteMeals.length,
      );
  }
}
