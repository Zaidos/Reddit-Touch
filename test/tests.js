$(function() {

	// load up log
	// Qunit.log = function(result, message) {
	//	root = exports ? this
	//	if(root.console && root.console.log)
	//		console.log(result + ' :: ' + message);
	// });
	
	/**
	 *	Module.
	 */
	module('User');

	// Test that file has been loaded.
	test('Loaded', function() {
		expect(1);
		equals(typeof User, 
				'function', 
				'User has been loaded.');
	});
	
	// Test if constructor works.
	test('Constructor', function() {
		expect(2);
		var user = new User('zaidos', 'pwd');
		equals(typeof User.constructor, 
				'function', 
				'User.constructor works.');
		equals(typeof user, 'object', 'User is object');
	});
/*
	// Test accessors
	test('Accessors', function() {
		expect(2);
		var p = new Point(5, 10);
		equals(p.x, 5, 'X is 5');
		equals(p.y, 10, 'Y is 10');
	});

	// Test adding.
	test('Add', function() {
		expect(2);
		var p = new Point(1,1);
		var p2 = new Point(5,5);
		var result = p.add(p2);
		equals(result.x, 6, 'X added correctly.');
		equals(result.y, 6, 'Y added correctly');
	});

	// Test cloning
	test('Clone', function() {
		expect(1);
		var p = new Point(5,10);
		var result = p.clone();
		deepEqual(result, p, 'Point 1 and Point 2 are clones!!!');
	});
	
	// Test distance
	test('Distance', function() {
		expect(2);
		var p = new Point(5, 10);
		var p2 = new Point(5, 20);
		var distance = p2.distance(p);
		var zerodistance = p.distance(p);
		equals(zerodistance, 0, 'Distance is 0 on same.');
		equals(distance, 10, 'Distance is 10.');
	});

	// Test equals
	test('Equals', function() {
		expect(1);
		var p = new Point(5, 10);
		var p2 = new Point(5, 10);
		var result = p.equals(p2);
		ok(result, 'Equals equals equals');
	});

	// Test length
	test('Length', function() {
		expect(1);
		var p = new Point(5, 10);
		var result = p.length();
		var expected = Math.sqrt(5 * 5 + 10 * 10);
		equals(result, expected, 'Length is ' + expected );
	});

	// Test offset
	test('Offset', function() {
		expect(5);
		var p = new Point(10, 10);
		var result = p.offset(-5, 5);
		equals(typeof result, 'object', 'Result is returned as object array');
		equals(p.x, 5, 'X is offset.');
		equals(p.y, 15, 'Y is offset.');
		equals(result[0], 5, 'Result of X is correct.');
		equals(result[1], 15, 'Result of Y is correct.');
	});

	test('Subtract', function() {
		expect(3);
		var p = new Point(10, 10);
		var p2 = new Point(5, 3);
		var result = p.subtract(p2);
		equals(typeof result, 'object', 'Result is object');
		equals(result.x, 5, 'Result X is correct.');
		equals(result.y, 7, 'Result Y is correct.');		
	});

	test('ToString', function() {
		expect(2);
		var p = new Point(5, 10);
		var expected = 'X: 5, Y: 10';
		equals(typeof p, 'object', 'Result is object');
		equals(p, expected, 'Correct string.');
	}); 
	*/
});
