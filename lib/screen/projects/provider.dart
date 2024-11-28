import 'package:flutter/material.dart';

class ProjectsProvider extends ChangeNotifier {

  List myProjectsList = [
    {
      "project_name": "Breastfeeding",
      "project_year": "intermediate",
      "project_description":
      "This app designed to support breastfeeding moms in monitoring and recording their breastfeeding journey seamlessly. I've built a mobile app from scratch, featuring a pixel-perfect and responsive UI for both Android and iOS. The app includes background timer tracking, utilizes the MVC architecture, integrates Stripe for Ad Mob Ads removal through subscription plans, and offers language support in Romanian and English. Social authentication via Facebook, Google, and Apple, State management is handled by Provider.",
      "project_logo":
      "https://play-lh.googleusercontent.com/T85BEpP1UF03zl7R5iOaPjx1vAS0zAZ0gpcgsfwZKji8btAggxw7CXosdwmgN2REQB4=w240-h480-rw"
    },
    {
      "project_name": "Express Conference",
      "project_year": "intermediate",
      "project_description":
      "The Express Conferences are a series of intimate, high-quality conferences that bring together the industry's most active meeting planners and event rights holders. They are a great way to maximize your conference productivity and build relationships that will last a lifetime. I've built a mobile app from scratch, firebase FCM push notification, State management is handled by Provider.",
      "project_logo":
      "https://play-lh.googleusercontent.com/Wnv3ACKY33ZiaJD46r-84a-T1dRqKUrm2aBjGUTRImp7GZkrekzccPJOvgivm9XfTBAq=w240-h480-rw"
    },
    {
      "project_name": "Fitnow",
      "project_year": "intermediate",
      "project_description":
      "Get connected to people with fitness mindset near you. Get training from your personal fitness trainers online. Stay fit because your fitness matters. I've worked this app in API integration and all logical code, chat integration using 3rd party Stream Chat, firebase FCM Push Notification, State management is handled by GetX.",
      "project_logo":
      "https://play-lh.googleusercontent.com/1NyEqKD6CiNDGkyD59eTY3ApeKybLpphDrIx06xjYKOctXaaG-crl8btOS5bjUECKMI=w240-h480-rw"
    },
    {
      "project_name": "Gift4all",
      "project_year": "intermediate",
      "project_description":
      "This application manages cultural events and other types of events, tracking the number of gifts received and the total amount spent on each event. I developed a mobile app from scratch and integrated several key features, including user event creation with reminder functionality, Firebase Cloud Messaging (FCM) push notifications, event history filtering, and social authentication via Facebook, Google, and Apple. State management handled by Provider.",
      "project_logo":
      "https://i.pinimg.com/564x/f4/31/67/f431675216bfbc3ecf96c900437f0b63.jpg"
    },
    {
      "project_name": "Erafri",
      "project_year": "intermediate",
      "project_description":
      "This application is based on a single online shopping store where users can purchase all products. I built a mobile app from scratch and integrated features such as product browsing, shopping cart, user authentication, and secure payment processing. State management is handled by GetX. I implemented all the necessary features for an e-commerce app, such as product listing, shopping cart, checkout, and payment processing using API integration.",
      "project_logo":
      "https://i.pinimg.com/564x/9b/a8/50/9ba8507ab971aa1e51bd85d51ba1a3b4.jpg"
    },
    {
      "project_name": "Articles of faith",
      "project_year": "intermediate",
      "project_description":
      "This application is a powerful tool for memorizing and evaluating articles. It offers three key components: 'Read Article' helps users memorize by filling in missing words,'Jumbled Words' tests word order recognition, and 'Write Article' assesses comprehensive article recall. Perfect for improving memory and accuracy in content retention. I built a mobile app from scratch, State management handled by Provider.",
      "project_logo":
      "data:image/png;base64,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"
    },
    {
      "project_name": "Digilog",
      "project_year": "intermediate",
      "project_description":
      "This application is designed for a private courier company to manage all courier deliveries on a day-by-day basis. It records delivery data, including signatures, and saves the data locally. I built a mobile app from scratch and integrated features such as user can add list of delivery names and add data using Hive database, State management is handled by Provider.",
      "project_logo":
      "https://i.pinimg.com/564x/2f/b9/8a/2fb98a275b1e29c92478506796891a4b.jpg"
    },
    {
      "project_name": "Take Away",
      "project_year": "intermediate",
      "project_description":
      "This application is based on a single online shopping store where users can purchase all products. I built a mobile app from scratch and integrated features such as product browsing, shopping cart, user authentication, and secure payment processing. State management is handled by Bloc. I implemented all the necessary features for an e-commerce app, such as product listing, shopping cart, checkout, and payment processing using API integration.",
      "project_logo":
      "https://i.pinimg.com/736x/f6/6a/bd/f66abd7f6ef609bb4d90ee163263de75.jpg"
    },
    {
      "project_name": "Dynasty Driver",
      "project_year": "intermediate",
      "project_description":
      "our app offers seamless connections with passengers, efficient navigation, and real-time tracking, along with secure payments and a reliable driver rating system for safety. •	I actively contributed to the development of a rental and taxi booking application, specializing in API integration, Firebase push notifications, Socket.IO chat integration, and real-time Google Maps tracking. My responsibilities spanned both user and driver modules, enhancing overall functionality and user experience. Additionally, I implemented state management using GetX to ensure efficient data flow and user interface updates.",
      "project_logo":
      "https://i.pinimg.com/236x/bf/75/4e/bf754efe81dd530c1943418b4efe2f95.jpg"
    },
    {
      "project_name": "Dynasty User",
      "project_year": "intermediate",
      "project_description":
      "our app provides a user-friendly experience for on-demand transportation. You can request rides, track vehicles in real-time, and enjoy cashless transactions. Rate and review drivers for service quality, plus enjoy advanced features like route optimization and trip history. I actively contributed to the development of a rental and taxi booking application, specializing in API integration, Firebase push notifications, Socket.IO chat integration, and real-time Google Maps tracking. My responsibilities spanned both user and driver modules, enhancing overall functionality and user experience. Additionally, I implemented state management using GetX to ensure efficient data flow and user interface updates.",
      "project_logo":
      "https://i.pinimg.com/236x/e1/db/11/e1db11e6e73f47da9ed3f08f751e8d66.jpg"
    }
  ];
}
