# Prediction
## Background
The data I used for the project was collected by **Carnegie Learning, Inc.** between October 12, 2006, and December 20, 2006, and uploaded to DataShop on May 5, 2008. The data is the result of an investigation into student performance solving algebraic equations when presented with worked examples of similar equations, compared to the performance of students not provided with such examples. 
        
In this study, students were randomly assigned to two groups. Different from the traditional definition of control and treatment group, the students in the **control group** were presented with worked examples to copy on the first opportunity to practice a problem type. The **treatment group** is identical respective to all other items that the researchers are examining (e.g., Teacher, Units, Pre/Post Test, A/B Form, Item) with the exception that it does not receive the experimental manipulation that the control group received. There are two test forms (A, B) for both Unit 7 and Unit 9 which are equation-solving units in 2006 Cognitive Tutor Algebra. Questions on each test form are different, but the level of difficulty and the question types are the same. 
   * Variable Teacher: name of the teacher)
   * ID: demonstrates the same information as Teacher
   * Condition: control group or treatment group
   * Units: Unit 7 or Unit 9
   * A/B Form: two version of the unit test
   * Item: question number in the exam
   * Problem: the specific equation-solving problem
   * Score: 1 represents earning one point, 0 represents earning no point
   * Answer: the student's answer to the question
   * Explanation: explanations student wrote near the answer
   * Comment: teacher's comment

# Goals of the Analysis       
   * Point out which questions students struggle with the most in both Unit 7 and Unit 9 by using simple statistical and graphical methods
   * Test whether or not the students with the benefit of the worked examples will experience benefits to their learning or improved performance over students without examples (pure problem-solving)
   * Build a regression model to investigate the relationship between the dependent variable, the Score, and the independent variables (e.g., Teacher, Condition, Units, Pre/Post Test, A/B Form, Item)
       
## Packages Required
```
install.packages("xlsx")
install.packages("mice") 
install.packages("caTools")
```

## Procedures
1. Load the data set
2. Visualize the missing data using **mice package** and delete rows with missing values
<img src="https://user-images.githubusercontent.com/46146748/63471175-74e8b380-c43c-11e9-9dca-14036793373b.png" width="600">
3. Calculate the accuracy rate of each question on the two test forms (A, B) for both units
Accuracy Rate of Each Question in the Unit 7 |  Accuracy Rate of Each Question in the Unit 9
:-------------------------:|:-------------------------:
![](https://user-images.githubusercontent.com/46146748/63472747-16720400-c441-11e9-922e-e751937d6fd2.jpg)  |  ![](https://user-images.githubusercontent.com/46146748/63472746-16720400-c441-11e9-9759-f4b64e6d4319.jpg)


4. Use **Spineplots function** to plot the relationship between "Condition" and "Score" 
<img src="https://user-images.githubusercontent.com/46146748/63471522-5f27be00-c43d-11e9-9880-f447398a5327.png" width="450">
5. Run a chi-squared test to determine if there is a significant relationship between "Score" and "Condition"
6. Conduct chi-square test for variable "Pre/Post Test" and "Condition", variable "A/B Form" and "Condition" and variable "Units" and "Condition" 
<img src="https://user-images.githubusercontent.com/46146748/63471981-b5e1c780-c43e-11e9-9df9-2cc35bfbea36.png" width="700">
7. A logistic regression was fit to model the outcome variable (Score) conditional on the predictors (Teacher, Condition, Units, Pre/ Post Test, A/B Form)


## Author
[Katherine Tan](www.linkedin.com/in/katherine-tan-2019), M.S student in Learning Analytics at Teachers College, Columbia University
