# JAR

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description

This app is for parents and kids. 

This a family app created to give parents the ability to monetize home chores through
virtual currency, in order to make helping around the home more interactive and fun.

### App Evaluation

- **Category:** Lifestyle
- **Mobile:** This app would be primarily developed for mobile users. Functionality wouldn’t be limited to mobile devices, however mobile version could potentially have more features.
- **Story:** Allows parents and children to create a healthy way of communicating chores and rewards. Hoping to create healthier families
- **Market:** Any parent or child could utilize this app
- **Habit:** Parents are using this constantly throughout the day. Kids are using the app daily to check their performance and cash in on rewards.
- **Scope:** first we would start allowing pairs to create a login and invite as many people as they would like. Parents would set the tasks and how much each task is worth. The children would then take pictures showing they have completed the task. Finally the parents would approve of task and send out the reward.


## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can register an account
* User can log in
* User can post tasks
* User can picks what tasks they want to complete

**Optional Nice-to-have Stories**

* Chores
* Family conversation
*  ...

### 2. Screen Archetypes


* Login
    * User can login
* Register - User signs up or logs into their account
    * User can register as a new parent or child
* Stream - User can scroll through important resources in a list
    * User can view posts posted by parents
* Detail - User can view the specifics of a particular resource
    * User can view detailed description of chore
* Creation - User can create a new resource
    * Parent user can create new chore post
* Profile - User can view their identity and stats
    * User can see progress such as badges and trophies
* Settings - User can configure app options
    * User can turn of notifications, adjust brightnes, etc ...


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Stream
* Profile
* Create

**Flow Navigation** (Screen to Screen)

* Login
    * Stream 
    * Register
* Register
    * Stream
* Stream
    * Detail
    * Creation
    * Profile
    * Settings
* Detail
    * Stream
* Creation
    * Stream
* Profile
    * Stream
* Settings
    * Stream

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>
![](https://i.imgur.com/6AdoHF4.jpg)
![](https://i.imgur.com/2s9n2LA.jpg)
![](https://i.imgur.com/VVsIxUE.jpg)




### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

### Models 
##### Post 
| Property | Type | Description |
| -------- | -------- | -------- |
| choreId| Text     | text of chore     |
|image | File	| image of chore|
|descriptionId|	String| chore description by author|	
| author | User pointer     | author name    |
### Networking
* Chores Screen
    * (Create/POST) Create a new chore post 
         ```swift
         let chore = PFObject(className:"Chore")
        chore["choreName"] = Clean the Dishes
        chore["choreImage"] = imageFile
        chore["choreDescription"] = choreDEscription
        chore.saveInBackground { (succeeded,
        error)  in
            if (succeeded) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
         }
         ```
    * (Delete) Delete chore posts after they are  completed
    ```swift
         PFObject.deleteAll(inBackground: objectArray) { (succeeded, error) in
    if (succeeded) {
        // The array of objects was successfully deleted.
    } else {
        // There was an error. Check the errors localizedDescription.
    }
}
* Profile
    * (Read/GET) Query of family members
    ```swift
        let query = PFQuery(className:"familyMembers")
        query.whereKey("familyMember", equalTo:"Abdi Abdi")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                for object in objects {
                    print(object.objectId as Any)
                }
            }
    ```
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
