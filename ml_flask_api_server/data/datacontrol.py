from flask import Blueprint
from glob import glob
import os
import pandas as pd
import tensorflow as tf
from tensorflow import keras


path = os.getcwd()
csv_list = sorted(glob(os.path.join(path,"ml_flask_api_server","data","DB","*.csv")))
data = pd.read_csv(csv_list[1])

#params
input_shape = 4
output_shape = 1
lr = 1e-3
act_function = 'relu'
category = "classification"

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

# model definition
inputs = tf.keras.Input(shape=input_shape)
for i in range(len(num_perceptron_list)):
    n_percep = num_perceptron_list[i]
    if i == 0:
        x = keras.layers.Dense(n_percep, activation= act_function)(inputs)

    elif  i != 0 and n_percep != 0:
        x = keras.layers.Dense(n_percep)(x)

    else: pass

dense_model = tf.keras.Model(name="model_1",inputs=inputs, outputs=x)
dense_model.summary()

#optimizer
optimizer = keras.optimizers.SGD(learning_rate=lr)

# #loss function
loss=tf.keras.losses.BinaryCrossentropy(from_logits=False)
# def loss(target_y, predicted_y):
#   return tf.reduce_mean(tf.square(target_y - predicted_y))

# Given a callable model, inputs, outputs, and a learning rate...
def train(model, x, y, learning_rate):
  with tf.GradientTape() as t:
    # Trainable variables are automatically tracked by GradientTape
    current_loss = loss(y, model(x))

  # Use GradientTape to calculate the gradients with respect to W and b
  grads= t.gradient(current_loss, model.weights)

  # Subtract the gradient scaled by the learning rate
  optimizer.apply_gradients(zip(grads, model.weights))


# Define a training loop
epochs = range(10)
def training_loop(model, x, y):

  for epoch in epochs:
    # Update the model with the single giant batch
    train(model, x, y, learning_rate=0.1)

    # Track this before I update
    current_loss = loss(y, model(x))

    print("Epoch %2d: loss=%2.5f" %
          (epoch, current_loss))
    

# Do the training
x = data.to_numpy()[:,:-1]
y = data.to_numpy()[:,-1]
training_loop(dense_model, x, y)




bp = Blueprint('main', __name__, url_prefix='/')
@bp.route('/')
def index():
    return 'hi'

@bp.route('/data')
def getdata():
    return str("pred")




