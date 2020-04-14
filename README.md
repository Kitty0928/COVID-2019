README

COVID-19 prediction tools

These are two models for COVID-10 prediciton£ºLogistic growth model and SEIR model. The logistic growth model is designed to fit the development of the curves, and the SEIR model is designed for infectious disease estimation. The logistic model may fit the existing data better when compared with the SEIR model, but it cannot be accurately judged and incorporates infectious characteristics, so the logistic model is better for near-term predictions. On the other hand, the SEIR model introduces more variables and factors by considering the interaction and association among multiple groups of people, and it is more reasonable than the logistic model as it follows the rules of infectious disease development, but the prediction results vary greatly with respect to different interventions and settings.Therefore, we provdied two models to observe different model results. 

The coding of Logistic model and SEIR model were created in the Python and Matlab mathematical computing environment. 

The data privided are 8 countries, but the models could be used for any other locations and infectious diseases. 

Data Sources: Novel Coronavirus (COVID-19) Cases, provided by JHU CSSE:https://github.com/CSSEGISandData/COVID-19

Articles: 
Evaluation of the secondary transmission pattern and epidemic prediction of COVID-19 in the four metropolitan areas of China.https://doi.org/10.1101/2020.03.06.20032177