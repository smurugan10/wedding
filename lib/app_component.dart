// Copyright (c) 2017, emmashockley. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';

import 'src/todo_list/todo_list_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, TodoListComponent],
  providers: const [materialProviders],
)
class AppComponent {
  final selectionModel = new SelectionModel<Page>.withList(selectedValues: [Page.home]);
  final selectionOptions = new SelectionOptions<Page>.fromList(Page.values);
  final itemRenderer = (Page page) => _pageToName[page];

  Page get selectedPage => selectionModel.isNotEmpty ? selectionModel.selectedValues.first : Page.home;
}

enum Page {
  home,
  photos,
  venue,
  hotels,
  registry,
  rsvp
}

const _pageToName = const {
  Page.home: 'Home',
  Page.photos: 'Photos',
  Page.venue: 'Venue',
  Page.hotels: 'Hotels',
  Page.registry: 'Registry',
  Page.rsvp: 'RSVP',
};