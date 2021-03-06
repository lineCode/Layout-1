/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ({

/***/ 0:
/***/ function(module, exports, __webpack_require__) {

	"use strict";

	importApi("ui");

	importClass("android.widget.BaseAdapter");

	var listXml = __webpack_require__(17);
	var listItemXml = __webpack_require__(18);

	var page = {
	    onLoad: function onLoad() {

	        var listView = ui.find("listView");

	        listView.setAdapter(new BaseAdapter({
	            getCount: function getCount() {
	                return 80;
	            },
	            getView: function getView(position, convertView, parent) {
	                if (convertView == null) {
	                    convertView = ui.fromXml(listItemXml, null);
	                }
	                return convertView;
	            },
	            getViewTypeCount: function getViewTypeCount() {
	                return 1;
	            }
	        }));
	    }
	};
	hybridView.onLoad = function (result) {
	    page.onLoad();
	};

	hybridView.loadXml(listXml);

/***/ },

/***/ 17:
/***/ function(module, exports) {

	module.exports = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<View\n    width=\"750\"\n    height=\"100%\"\n    screenUnit=\"750\"\n    background=\"#889922\">\n   <ImageView\n     width=\"750\"\n     height=\"200\"\n     imageUrl=\"https://img.alicdn.com/simba/img/TB1E3XzkJfJ8KJjy0FeSutKEXXa.jpg\"/>\n  <ListView\n    width=\"750\"\n    y=\"200\"\n    height=\"calc(100%-200)\"\n    tag=\"listView\"/>\n</View>\n"

/***/ },

/***/ 18:
/***/ function(module, exports) {

	module.exports = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<View\n  background=\"#FFFFFF\">\n  <View\n    width=\"180\"\n    height=\"180\">\n    <ImageView\n      y=\"40\"\n      x=\"40\"\n      width=\"100\"\n      height=\"100\"\n      imageUrl=\"https://img.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png\"/>\n  </View>\n  <TextView\n    x=\"160\"\n    y=\"40\"\n    width=\"300\"\n    textSize=\"32\"\n    text=\"手机淘宝\"/>\n  <TextView\n      x=\"160\"\n      y=\"80\"\n      width=\"300\"\n      textSize=\"32\"\n      textColor=\"#888888\"\n      text=\"手机淘宝，想淘就淘\"/>\n</View>\n"

/***/ }

/******/ });