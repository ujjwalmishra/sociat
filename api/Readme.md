## DB Entities
1. User
2. Location
3. Post
4. Media
5. Comment
6. Reaction
7. Area
8. TimeInLocation

### Tables
#### User:
+ user_id : generated
+ user_email: user provided
+ user_location: system provided , foreign key to Location
+ user_name: user provided
+ user_addrss : user provided
+ user_area : system or user provided

#### Location:
+ loc_id : generated
+ loc_coords: system generated
+ loc_area: system provided, foreign key to Area

#### Post
+ post_id: generated
+ post_text: user provided
+ post_area: system generated, foreign key to Area

#### Media
+ media_id: generated
+ media_type: system provided
+ media_storage_link: system provided
+ post_id: system generated, foreign key to Post

#### Comment
+ comment_id: generated
+ comment_text: user provided
+ comment_user: foreign key to User
+ comment_post: foreign key to Post

#### Reaction
+ reaction_id: generated
+ reaction_type: 
+ reaction_post: foreign key to post

#### Area
+ area_id: generated
+ area_name: user_provided
+ area_coords: system_generated
+ area_parent: foreign key to Area

#### TimeInLocation
+ til_id: generated
+ til_loc: foreign key to location
+ time_min: time spent in location

***

## Rough api requirements

### User
+ POST /api/user Register a user
+ GET /api/user current user
+ POST /api/user/id Modify a user
+ POST /api/user/login Login
+ POST /api/user/location Send user location
+ GET /api/user/post Get all post by a user
+ GET /api/user/area Get all area for a user

### Post
+ POST /api/post Create a post
+ POST /api/post/postid Update a post
+ DELETE /api/post Delete a post
+ GET /api/post/areaid Get all post in a area

### Media


### Comment
+ POST /api/comment/postid create a comment
+ GET /api/comment/postid get all comments

### Reaction
+ POST /api/reaction/postid
+ GET /api/reaction/postid

### Area


### TimeInLocation
