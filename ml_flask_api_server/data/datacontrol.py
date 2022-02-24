from flask import Blueprint
import numpy as np
import pandas as pd
import pickle
import copy
from sklearn.preprocessing import MinMaxScaler
import requests
import pandas_datareader.data as web




bp = Blueprint('main', __name__, url_prefix='/')


@bp.route('/hello')
def hello_pybo():
    return 'Hello,!'

@bp.route('/')
def index():
    return 'hi'

