README
===
Heroku: https://evening-oasis-68460.herokuapp.com/
### Superadmin
* Email:superadmin@123.com
* password:password
### admin
* Emain:test@1.com
* password:1

### Log in
* Click "Sign in!" button on the homepage.
### new user
* Click "Sign up now!" button on the homepage.

## Superadmin

  Superadmins are able to manage admins and capable of performing all operations performed by an admin.

* Create new superadmins

1. Login in as superadmin.
2. users(on the right corner of homepage)->create user
3. users->edit->authertiy level:superadmin->save changes

* View the list of superadmins and their profile

  homepage->users
  
## Admin

* Edit profile
  
  homepage->edit profile(on the right corner of homepage)
  
* Create new admins

1. Login in as admin.
2. users->create user
3. users->edit->autherity level:admin->save changes

* View the list of all admins and their profile

  homepage->users
  
* Delete admins
  
  homepage->users->destroy
  
* Add a car

  homepage->Car Rental(on the left corner)->New Car
  
* View the list of all cars

  homepage->Car Rental
  
* Edit/Destroy a car
  
  homepage->Car Rental->Edit/Destroy
  
* View the checkout history of a car

  homepage->Car Rental->View rental history
  
* Reserve or check out a car on behalf of a customer

  homepage->users->Reserve car for this user/Check car for this user
  
* View all customer and edit/destroy

  homepage->users->edit/destroy
  
## Customers

* Search cars
  
  homepage->Search Cars
  
* View cars

  homepage->Car Rental->show
  
* Reserve/check out a car

  homepage->Car Rental->Reserve it!/Check it out!
  
* Return a checked-out car

  homepage->Return now!(under user's information)
  
* View checkout history

  homepage->Rental History
  
## Edge Cases
  
* Delete a car
  
1. Admins cannot delete a car which has been checked out but not returned yet. If a car is checked out, there won't be "destroy" option.
    
2. If an admin delete a car which has been checked out before, users' chechout history of the car will not be deleted.
  
* Delete a user

1. Admins cannot delete a user who has reservation or checked out a car but not returned it yet. If a user check out a car, there won't be "destroy" option in users list.
    
2. If an admin delete a user who has rental records,  the checkout history of cars will not be changed.

## NOTICE

Please return the cars after you have tested all the functionality. Thanks!
