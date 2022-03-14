from flask import Blueprint
from glob import glob
import os
import pandas as pd
import tensorflow as tf
from tensorflow import keras


path = os.getcwd()
csv_list = sorted(glob(os.path.join(path,"ml_flask_api_server","data","DB","*.csv")))
data = pd.read_csv(csv_list[0])

#params
input_shape = 4
output_shape = 1

act_function = 'relu'

num_perceptron_layer1 = 2
num_perceptron_layer2 = 4
num_perceptron_layer3 = 8
num_perceptron_layer4 = 4
num_perceptron_layer5 = 2
num_perceptron_out = output_shape

num_perceptron_list = [
    num_perceptron_layer1,
    num_perceptron_layer2,
    num_perceptron_layer3,
    num_perceptron_layer4,
    num_perceptron_layer5,
    num_perceptron_out,
    ]

# layer_list = []
inputs = tf.keras.Input(shape=input_shape)
for i in range(len(num_perceptron_list)):
    n_percep = num_perceptron_list[i]
    if i == 0:
        x = keras.layers.Dense(n_percep, activation= act_function)(inputs)

    elif  i != 0 and n_percep != 0:
        x = keras.layers.Dense(n_percep)(x)

    else: pass

dense_model = tf.keras.Model(name="model_1",inputs=inputs, outputs=x)
temp_input = tf.constant([[1,2,3,4],[1,2,3,4],[1,2,3,4],])
pred = dense_model(temp_input)
dense_model.summary()


bp = Blueprint('main', __name__, url_prefix='/')
@bp.route('/')
def index():
    return 'hi'

@bp.route('/data')
def getdata():
    
    return str(pred)




