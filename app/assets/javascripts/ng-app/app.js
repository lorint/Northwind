var myResource;

angular.module("NorthwindApp", ['ngResource'])
	// Let's chain on a factory
	.factory('categoryFactory', ['$resource', function($resource) {
		myResource = $resource;
		return $resource('/categories/:id.json');

		// Here's how we USED to be doing our factory -- with $http

		// return {
		// 	getCategories: function() {
		// 		
		// 		return $http.get("/categories.json");
		// 	},
		// 	deleteCategory: function(id) {
		// 		return $http.delete("/categories/" + id + ".json");
		// 	},
		// 	saveCategory: function(name, description){
		// 		return $http.post("/categories", {
		// 			category_name: name,
		// 			description: description
		// 		})
		// 	}
		// };
	}])
	// And chain on a controller
	.controller('CategoriesCtrl', ['$scope', 'categoryFactory', 
    function($scope, categoryFactory) {
    	// Go get all the categories, now using a $resource object
    	var listCategories = function(){
	    	categoryFactory.query(function(data) {
			    $scope.categories = data;
			});
	    };
    	// Delete one category by its ID, also now using $resource
    	$scope.deleteCategory = function(id){
    		categoryFactory.delete({id: id},
    			function(data){	// What to do on success
    				listCategories();
				}
			);
    	};
    	// This name -- createCategory -- MUST correspond to what's in the view!
    	$scope.createCategory = function(name, desc) {
    		var cat = new categoryFactory({category_name: name, description: desc});
    		cat.$save(
    			function(data){	// What to do on success
    				$scope.newCatName = "";
    				$scope.newCatDescrip = "";
	    			listCategories();
    			}
    		);
    	};

    	// Before we render the page, we show all the categories
    	listCategories();
    }]);

