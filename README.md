testing specs for recipes
name: string
summarize: text 
description: text 

-name must be present
-name must be between 5 and less than 100 characters
-summarize must be present
-summarize must be between 10 and less than 150 characters
-description must be present
-description must be between 20 and less than 500 characters
-chef_id must be present


testing specs for chefs
chefname: string
chefemail: string

-chefname must be present
-chefname must be between 3 and less than 40 characters
-email must be present
-email must be unique
-email must be valid