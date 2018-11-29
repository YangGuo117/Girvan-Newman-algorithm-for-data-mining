# -*- coding: utf-8 -*-

import networkx as nx
import re,sys,os
##
if len(sys.argv) != 2:
	print("Error: Invalid input number")
	sys.exit("Usage: python txtTogml.py filename")
filename = sys.argv[1]
G = nx.Graph()
##This function is to add node and edge
def addToNx(node_1, node_2):
    G.add_node(node_1)
    G.add_node(node_2)
    G.add_edge(node_1, node_2)
        

if not os.path.exists(filename):
	sys.exit("Error: File " + sys.argv[1] + " not found")
else: ## Open file and use the function above to get the data we need
    record=[];
    with open(filename) as f:
        for line in f:
        	tempArr = line.split( )
        	addToNx(int(tempArr[0]), int(tempArr[1]))
            # if find_all(line)!=False:
            #     record.append(find_all(line))
    nx.write_gml(G, "../datasets/" + filename.split('.',1)[0] + '.gml')
