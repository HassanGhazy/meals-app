import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;
  FilterScreen(
    this.currentFilter,
    this.saveFilters,
  );

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegeration = false;
  bool _vegan = false;
  bool _lactosFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _lactosFree = widget.currentFilter['lactoes'];
    _vegan = widget.currentFilter['vegan'];
    _vegeration = widget.currentFilter['vegeration'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool newValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: newValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactoes': _lactosFree,
                'vegan': _vegan,
                'vegeration': _vegeration,
              };
              widget.saveFilters(selectedFilter);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selected',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                'Gluten_free',
                'Only include gluten-free meals.',
                _glutenFree,
                (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Vegeration',
                'Only include Vegeration meals.',
                _vegeration,
                (newValue) {
                  setState(
                    () {
                      _vegeration = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Lactose_free',
                'Only include Lactose-free meals.',
                _lactosFree,
                (newValue) {
                  setState(
                    () {
                      _lactosFree = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Vegan_free',
                'Only include Vegan-free meals.',
                _vegan,
                (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
