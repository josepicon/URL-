# Welcome to the NLP project for the clickbait analysis of news headlines!

## Project description:
This project tries to analyze the news headlines collected online and that are collected in the dataset clickbait_data.csv extracted from kaggle.com.
The news in this dataset can fall into one of two categories, either they are clickbait or they are not.
In order to be able to predict and differentiate what news is or is not clickbait, we have implemented 4 models: SVM, Naive-Bayes, XGBoost and Spacy (pre-trained model).

## Execution requirements:
- Have the clickbait dataset found in the repository: https://raw.githubusercontent.com/josepicon/URL-/main/MD009%20-%20Advanced%20Data%20Analysis%20Tools/Project/clickbait_data.csv
- The following libraries, note that the Spacy version is 2.X:
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

## Technologies used:
- SVM
- Naive-Bayes
- XGBoost
- Spacy

## Copyright and license information
The code for the Spacy algorithm has been retrieved from the following web page
https://www.machinelearningplus.com/nlp/custom-text-classification-spacy/