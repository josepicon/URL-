# Bienvenidos al proyecto de NLP para el análisis de titulares de notícias que pueden contener!

## Descripción del proyecto:
Este proyecto trata de analizar los titulares de notícias recogidas online y que se recogen en el dataset clickbait_data.csv extraído de kaggle.com.
Las notícias de este dataset pueden pertenecer a una de dos categorías, o bien son clickbait o bien no lo son.
Con tal de ser capaces de predecir y diferenciar qué notícias son o no clickbait hemos implementado 4 modelos: SVM, Naive-Bayes, XGBoost y Spacy(modelo preentrenado).

## Requisitos de ejecución:
- Disponer del dataset de clickbait que se encuentra en el repositorio: https://raw.githubusercontent.com/josepicon/URL-/main/MD009%20-%20Advanced%20Data%20Analysis%20Tools/Project/clickbait_data.csv
- Las siguientes librerías, remarcar que la versión de Spacy es 2.X:
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import itertools
import random
import string as s
import re
import os

import spacy
from spacy.util import minibatch, compounding


import nltk
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer
from nltk.stem import WordNetLemmatizer

from nltk.corpus import stopwords
from nltk import SnowballStemmer, word_tokenize

from sklearn.naive_bayes import MultinomialNB
from sklearn import metrics
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix,accuracy_score,roc_auc_score,roc_curve,auc,f1_score
from mlxtend.plotting import plot_confusion_matrix
from sklearn.svm import SVC

import xgboost as xgb
from xgboost import XGBClassifier
from sklearn.cluster import KMeans
from lightgbm import LGBMClassifier

## Tecnologías usadas:
- SVM
- Naive-Bayes
- XGBoost
- Spacy

## Información sobre derechos de autor y licencias
El código para el algoritmo de Spacy se ha recavado de la siguiente página web
https://www.machinelearningplus.com/nlp/custom-text-classification-spacy/