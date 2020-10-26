# Cookbook
This is a Cookbook application that manages recipes. It’ll keep a list of your recipes, allowing you to list them, add new recipes even from websites, delete others. This app will use the MVC pattern.
Model. Here we will define a Recipe class with 4 arguments: name, description, rating, time for preparation.

Repository. The place where we will store our user’s structured recipes. In our case it will be a cookbook We’ll use a CSV file for that.

Controller. The controller will gather data from the repository(cookbook) to hand them over to the view. It will also ask the view for information to create new recipes. 

View. The view is responsible for all the puts and gets of MVC.

Service Object. The class will contain all methods to extract the parsing logic out of the controller to keep it simple and explicit.  
