# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
  - location has_many trails, trail has_many reviews, user has_many reviews
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  - trail belongs_to location, review belongs_to trail, review belongs_to user
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
  - trail has_many users, through reviews; user has_many trails, through reviews
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  - trail has_many users, through reviews; user has_many trails, through reviews
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  - users can submit reviews attributes: title (review.title), stars(review.stars), and content (review.content)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - location, review, trail, and user models all have validations
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  - trail model has alphabetical (order) scope and search (where) scope
- [x] Include signup (how e.g. Devise)
  - Devise
- [x] Include login (how e.g. Devise)
  - Devise
- [x] Include logout (how e.g. Devise)
  - Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  - Devise/OmniAuth through Google
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - trail has nested reviews index (trails/3/reviews)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  - trail has nested new review (trails/6/reviews/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  - all forms include validation errors, including (/reviews/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
  - layouts, reviews, and trails views use partials
