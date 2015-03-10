var myHttp;

angular.module("NorthwindApp", [])
	// Let's chain on a factory
	.factory('categoryFactory', ['$http', function($http) {
		return {
			getCategories: function() {
				myHttp = $http;
				return $http.get("/categories.json");
			},
			deleteCategory: function(id) {
				return $http.delete("/categories/" + id + ".json");
			},
			saveCategory: function(name, description){
				return $http.post("/categories", {
					category_name: name,
					description: description
				})
			}
		};
	}])
	// And chain on a controller
	.controller('CategoriesCtrl', ['$scope', 'categoryFactory', 
    function($scope, categoryFactory) {
    	// Go get all the categories
    	categoryFactory.getCategories()
    		.success(function(data, status) {
			    $scope.categories = data;
			});
    	// Delete one category by its ID
    	$scope.deleteCategory = function(id){
    		categoryFactory.deleteCategory(id)
    			.success(function(data){
    				alert("OK -- it's deleted :)");
    			})
    	};

    	// This name -- createCategory -- MUST correspond to what's in the view!
    	$scope.createCategory = function(name, desc) {
    		// This name (obvi) MUST correspond to the name in the factory
    		categoryFactory.saveCategory(name, desc)
    			.success(function(data){
    				alert("OK -- you made a new one");
    			})
    	};
    }]);

