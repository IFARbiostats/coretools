# Your Awesome Project
Put your project description here. 

You should also provide some documentations to help other people understand this project and your code.

## File structure
### manipulation
Codes in this folder define the global library used in this project. It also takes the responsibility to read in data and perform all necessary steps to manipulate and get the data ready to all the other analyses. 

One thing to be noted it that, if there is a web access token used anywhere in your code to fetch data from a webserver, you should never hard code that token into your code. Instead, you should save it in a separated file and **git ignore it**. 

### report
Through out a study project, you will be asked to perform many analyses. You should organize your analytical codes in this folder. 

### data
Everything in this folder should be git ignored unless the project is a demonstration project. Thus the data will only sit on your local drive. Using version control system upon data is a terrible idea. 
