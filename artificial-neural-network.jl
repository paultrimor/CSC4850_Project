
# Description: This file will read from the output folder generated by 
#	preprocessing.py and feed it though an Artifical Neutral Netowkr. 
# 	Please use read the following link, it will be helpful 
#
#	https://mochajl.readthedocs.io/en/latest/tutorial/mnist.html#preparing-the-data

## Configuration and Package Loading

using Mocha 


## Building the Network 

data_layer = HDF5DataLayer(name="train-data", source="", 
	batch_size=64, shuffle=true) 

convolution_layer = ConvolutionLayer(name="conv-1", n_filter=20, 
	kernal=(5,5), bottoms=[:data], tops=[:conv1])

pooling_layer = PoolingLayer(name="pool-1", kernal=(2,2), stride=(2,2),
	bottoms=[:conv-1], tops=[:pool-1]) 

inner_product_layer_1 = InnerProductLayer(name="ip1", output=500, 
	neuron=Neurons.ReLU(), bottoms=[:pool2], tops=[:ip1])

inner_product_layer_2 = InnerProductLayer(name="ip2", output=100, 
	bottoms=[:pool1], tops=[:ip2])

loss_layer = SoftmaxLossLayer(name="loss", bottoms=[:ip2, :label])
	# It will compute an averaged loss over each mini-batch, 
	# which allows us to initiate back propagation

## Solve the Network  
