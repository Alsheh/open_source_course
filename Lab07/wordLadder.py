import networkx as nx
import matplotlib.pyplot as plt

n = 5
fileName = ["words.dat","words4.dat"]
file = open (fileName[0])
words = []

# parse the file
for w in file:
    w = w[:n]#(w.strip('*\n'))
    words.append(w)

# create the graph
G=nx.Graph()
for w1 in words:
    for w2 in words:
        diff = 0
        if (len(w1) != len(w2)):
            print (w1, w2)
            print("len(w1) != len(w2)")
            break
              
        for i in range(len(w1)):
            if w1[i] != w2[i]:
                diff +=1

        if diff < 2:
            G.add_edge(w1,w2)

#find the shortest paths
print (nx.shortest_path(G, 'cold' ,'warm'))
#print (nx.shortest_path(G, 'chaos','order'))
#print (nx.shortest_path(G, 'moron','smart'))
#print (nx.shortest_path(G, 'pound','marks'))

#G.add_edges_from([('a',2),(2,3),(3,4),(4,5),('a',4) ])
#G.add_node(1)

#G.add_node("spam")       # adds node "spam"
#G.add_nodes_from("spam") # adds 4 nodes: 's', 'p', 'a', 'm'

#nx.draw(G)
#nx.draw_circular(G)
#plt.show()


