


## Les étapes de déployement sur heroku


étape1

 git init : . Init a Git repository and commit your project

étape2

 heroku create: Create a Heroku project
 
 étape3

 heroku login : allow you to connect to heroku plateform
 
 étape4
  run in terminal : heroku git:remote -a your-heroku-app-name 
  
 étape5 
   git push heroku master : pousser vers heroku
   
 étape6 
   
  heroku run rake db:migrate : migration de la base vers heroku


