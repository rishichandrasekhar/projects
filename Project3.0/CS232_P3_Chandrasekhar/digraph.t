
/////////////////////////////////// digraph.t /////////////////////////////////////////////////////////////////////////
//
// file name          : digraph.t
//
// This file contains contains the implementations of the templated graph functions
//
// Programmer         : B.J. STRELLER AND ?????
//
// Date created       : 
//
// Date last revised  :
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




#ifndef DIGRAPH_T
#define DIGRAPH_T

#include <iostream>
#include <algorithm>


#include<fstream>
#include<string>

#include<cctype>



#include<list>
#include<vector>

#include<queue>
#include<stack>
#include<conio.h>	//for getche()
#include<limits>

using namespace std;


/////////////////////////////////// Digraph ///////////////////////////////////////////////////////////////////////////
//
// function name      : Digraph
//
// purpose            : constructor
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
Digraph<V, W>::Digraph()
{
	num_of_verticies = 0;
	graph_array.clear();
}



/////////////////////////////////// ~Digraph //////////////////////////////////////////////////////////////////////////
//
// function name      : ~Digraph
//
// purpose            : destructor
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
Digraph<V, W>:: ~Digraph()
{

}



/////////////////////////////////// set_size //////////////////////////////////////////////////////////////////////////
//
// function name      : set_size
//
// purpose            : determines the  number of lines in the input file; ie the number of verticies in the graph
//
// input parameters   : none
//
// output parameters  : one called inFile
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::set_size(ifstream& inFile)
{
	string path;

	string line;
	while (!inFile.eof()) {
		getline(inFile, line);
		num_of_verticies++;
		inFile >> ws;
	}

	inFile.close();
	cout << "The number of vertices in the graph are: " << num_of_verticies << endl;
}



/////////////////////////////////// get_size //////////////////////////////////////////////////////////////////////////
//
// function name      : get_size
//
// purpose            : gets the size of the "array" which holds the verticies of the graph
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : num_of_verticies of type int
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int  Digraph<V, W>::get_size()
{
	cout << "The size of the graph: \n" << num_of_verticies << endl;
	//graph 
	return num_of_verticies;
	//cuz the stub needs something to return
}


/////////////////////////////////// getDigraph ////////////////////////////////////////////////////////////////////////
//
// function name      : getDigraph
//
// purpose            : retrives the input file info and stores it as a vector. The graph is stored implicitly in file
//
// input parameters   : none
//
// output parameters  : one called inFile
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::getDigraph(ifstream& inFile)
{
	string path;
	cout << "Please enter graph file: ";
	cin.ignore();
	std::getline(cin, path);
	vertex<V, W>  v;
	edge_representation<V, W> e;
	std::list< edge_representation<V, W> > edgeList;
	std::vector<vertex<V, W> > graph;
	inFile.open(path);
	if (!inFile)                                                                             //test if open
	{
		cerr << " cannot open file: " << path << endl << endl;
		exit(-1);
	}

	while (inFile >> v.name) {
		inFile >> e.name;

		while (e.name != "#") {
			inFile >> e.weight;

			v.edgeList.push_back(e);

			inFile >> e.name;
		}
		graph_array.push_back(v);
		v.edgeList.clear();

	}
}




/////////////////////////////////// isVertex //////////////////////////////////////////////////////////////////////////
//
// function name      : isVertex
//
// purpose            : determines whether input is a vertex in the graph. Returns the index/location if in;
//                      otherwise returns -666
//
// input parameters   : none
//
// output parameters  : one of type V, called v
//
// return value       : an int
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::isVertex(V& v)
{
	for (int j = 0; j < num_of_verticies; j++) {
		if (graph_array[j].name == v) {
			return j;
		}

	}
	return -1; //cuz the stub needs something to return

}





/////////////////////////////////// isUniEdge /////////////////////////////////////////////////////////////////////////
//
// function name      : isUniEdge 
//
// purpose            : determines if the edge from v1 to v2 is an edge in the graph. Returns the location or index
//                      of the first vertex v1 if the edge is present in the graph; otherwise returns -666
//
// input parameters   : none
//
// output parameters  : two of type V, called v1 and v2
//
// return value       : an int - the index/location of the start vertex if it's present in the graph; otherwise -666
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::isUniEdge(V& v1, V& v2)
{
	typename std::list< edge_representation<V, W> >::iterator  it;

	for (int i = 0; i < num_of_verticies; i++) {
		if (graph_array[i].name == v1) {
			for (it = graph_array[i].edgeList.begin(); it != graph_array[i].edgeList.end(); it++) {
				if (it->name == v2) {
					return 0;
				}

			}
		}
	}

	return -666;
}


/////////////////////////////////// isBiDirEdge ///////////////////////////////////////////////////////////////////////
//
// function name      : isBiDirEdge
//
// purpose            : determines if there is an edge from v1 to v2 and from v2 to v1 in the graph. Returns the location
//                      or index of the first vertex v1 if the edge is present in the graph; otherwise returns -666
//
// input parameters   : none
//
// output parameters  : two of type V, called v1 and v2
//
// return value       : an int - the index/location of the start vertex if it's present in the graph; otherwise -666
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




template< typename V, typename W >
int Digraph<V, W>::isBiDirEdge(V& v1, V& v2)
{
	if (isUniEdge(v1, v2) == 0 && isUniEdge(v2, v1) == 0)
		return 0;
	else return -666;


}





/////////////////////////////////// addVertex /////////////////////////////////////////////////////////////////////////
//
// function name      : addVertex
//
// purpose            : adds a vertex to the graph if it's not there
//
// input parameters   : none
//
// output parameters  : one of type V, called v
//
// return value       : an int; the location/index of the vertex if added; otherwise -666
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::addVertex(V& v)
{
	vertex<V, W> temp;
	temp.name = v;
	cout << "City entered: " << v << endl;

	if (isVertex(v) == 0) {
		return -666;
	}
	else {
		num_of_verticies++;
		graph_array.push_back(temp);
		return num_of_verticies;
	} //temp.size -1
	//cout << "calling addVertex() - you write the code\n";
	//cuz the stub needs something to return

	//check if city is in the graph


}





/////////////////////////////////// deleteVertex //////////////////////////////////////////////////////////////////////
//
// function name      : deleteVertex
//
// purpose            : if a vertex is present in the graph, deletes it
//
// input parameters   : none
//
// output parameters  : one of type V
//
// return value       : a bool; true if added, false if not
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
bool Digraph<V, W>::deleteVertex(V& v)
{

	cout << "enter city to be deleted:\n";

	int inVec = isVertex(v);

	if (inVec != -1) {
		graph_array.erase(graph_array.begin() + inVec);
		num_of_verticies--;
		return true;
	}

	/*for (int i = 0; num_of_verticies + 1 > i; i++) {
		if (graph_array[i].name == v) {
			graph_array.erase(graph_array.begin() + i);
			return true;

		}*/
	else
		return false;


}
//delete v;
//return 0; //cuz the stub needs something to return







/////////////////////////////////// addUniEdge ////////////////////////////////////////////////////////////////////////
//
// function name      : addUniEdge
//
// purpose            : adds a uni-directional edge to the graph. If both edges present,inquires if the weight 
//                      should be updated or not. Returns the location/index of the vertex at the end of the edge
//
// input parameters   : none
//
// output parameters  : two of type V 
//
// return value       : int; the location of the end of the edge
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::addUniEdge(V& v1, V& v2, W& w)
{
	bool found = false;
	edge_representation<V, W> new_edge{ v2, w };
	for (auto& i : graph_array)
	{
		if (i.name == v1)
		{
			i.edgeList.emplace_back(new_edge);
			found = true;
			return 0;
		}
	}
	if (!found)
	{
		vertex <V, W> new_vert{ v1 };
		new_vert.edgeList.emplace_back(new_edge);
		graph_array.emplace_back(new_vert);
		num_of_verticies++;
		return 0;

	}
	//for (int i = 0; i < num_of_verticies; i++) {
	//	if (graph_array[i].name == v1) {
	//		for (auto &i: graph_array: v2 )
	//		
	//		for (it = graph_array[i].edgeList.begin(); it != graph_array[i].edgeList.end(); it++) {
	//			it->name = v2;
	//			it->weight = w;

	//			//or

	//			it.insert(in, v2);
	//			it.insert(in, w);
	//		}

	//	}

	//	for (int i = 0; i < num_of_verticies; i++) {
	//		if (graph_array[i].name == v1) {
	//			graph_array[i].edgeList.name.insert(in, v2);
	//			graph_array[i].edgeList.weight.insert(in, w);
	//		}
	//	}
	//	else {
	//		graph_array[num_of_verticies + 1].edgelist.name.insert(in, v2)
	//			graph_array[num_of_verticies + 1].edgelist.weight.insert(in, w)


	//	}






	return -1; //cuz the stub needs something to return

}






/////////////////////////////////// addBiDirEdge //////////////////////////////////////////////////////////////////////
//
// function name      : addBiDirEdge
//
// purpose            : adds a bi-directional edge to the graph
//
// input parameters   : none
//
// output parameters  : three; two of type V called v1 and v2 with one of type W called w
//
// return value       : an int; the location/index of the "end" of the edge, namely v2.
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::addBiDirEdge(V& v1, V& v2, W& w)
{
	addUniEdge(v1, v2, w);
	addUniEdge(v2, v1, w);
	return 0; //cuz the stub needs something to return

}





/////////////////////////////////// deleteUniEdge /////////////////////////////////////////////////////////////////////
//
// function name      : deleteUniEdge
//
// purpose            : deletes a uni-directional edge from the graph
//
// input parameters   : none
//
// output parameters  : three; two of type V( for the edges ) and one of type W for the weight
//
// return value       : a bool; true if successful delete, otherwise false
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
bool Digraph<V, W>::deleteUniEdge(V& v1, V& v2, W& w)
{
	//graph_array[0].edgeList.name;

	for (int i = 0; i < num_of_verticies; i++) {
		if (graph_array[i].name == v1) {
			for (auto j = graph_array[i].edgeList.begin(); j != graph_array[i].edgeList.end(); j++) {
				if (j->name == v2) {
					j = graph_array[i].edgeList.erase(j);
					return true;
				}
			}
		}

	}
	return false;


}









/////////////////////////////////// deleteBiDirEdge ///////////////////////////////////////////////////////////////////
//
// function name      : deleteBiDirEdge
//
// purpose            : deletes a bi-directional edge grom the graph
//
// input parameters   : none
//
// output parameters  : three; two of type V( for the edges ) and one of type W for the weight
//
// return value       : a bool; true if successful delete, otherwise false
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
bool Digraph<V, W>::deleteBiDirEdge(V& v1, V& v2, W& w)
{
	for (int i = 0; i < num_of_verticies; i++) {
		if (graph_array[i].name == v1) {
			deleteUniEdge(v1, v2, w);
			deleteUniEdge(v2, v1, w);
			return true;
		}
	}

	return false;
}





/////////////////////////////////// printDigraph //////////////////////////////////////////////////////////////////////
//
// function name      : printDigraph
//
// purpose            : prints the graph
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::printDigraph()
{


	typename std::list< edge_representation<V, W> >::iterator  it;


	for (int j = 0; j < num_of_verticies; j++)
	{
		cout << " \nfor the vertex " << graph_array[j].name << " we have the following edges : \n";

		for (it = graph_array[j].edgeList.begin(); it != graph_array[j].edgeList.end(); it++)
		{
			cout << " < " << graph_array[j].name << ", " << (*it).name << ", " << (*it).weight << " > " << endl;
		}

		cout << endl << " press enter to continue viewing the graph " << endl;
		_getche();
	}


	cout << endl << endl;
}





/////////////////////////////////// breadth ///////////////////////////////////////////////////////////////////////////
//
// function name      : breadth
//
// purpose            : performs a breadth first traversal of the graph starting at any user entered vertex
//
// input parameters   : one of type V
//
// output parameters  : none
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::breadth(V& start_vertex)
{
	typename std::list< edge_representation<V, W> >::iterator  u;
	//bool found = true;
	queue<V> q;
	std::vector<int> vec1;
	for (int h = 0; h < num_of_verticies; h++) {
		vec1.push_back(-2);
	}
	vec1[isVertex(start_vertex)] = -1;
	// asssign array indices to -2, assign first to -1

	q.push(start_vertex);

	while (!q.empty()) {
		start_vertex = q.front();
		q.pop();
		int v = isVertex(start_vertex);// = get vertex index value based on name, store as v;
		for (u = graph_array[v].edgeList.begin(); u != graph_array[v].edgeList.end(); u++)
		{
			if (vec1[isVertex(u->name)] < -1)
			{
				q.push(u->name); //push u.name onto queue
				vec1[isVertex(u->name)] = v;
			}

		}/*
		for (int j = 0; j < num_of_verticies; j++) {
			cout << array1[j];*/
		cout << start_vertex << endl;
	}

}







/////////////////////////////////// depth /////////////////////////////////////////////////////////////////////////////
//
// function name      : depth
//
// purpose            : performs a depth first traversal of the graph starting at any user entered vertex
//
// input parameters   : one of type V
//
// output parameters  : none
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::depth(V& start_vertex)

{



	typename std::list< edge_representation<V, W> >::iterator  u;
	//bool found = true;
	stack<V> q;
	std::vector<int> vec1;
	for (int h = 0; h < num_of_verticies; h++) {
		vec1.push_back(-2);
	}
	vec1[isVertex(start_vertex)] = -1;
	// asssign array indices to -2, assign first to -1

	q.push(start_vertex);

	while (!q.empty()) {
		start_vertex = q.top();
		q.pop();
		int v = isVertex(start_vertex);// = get vertex index value based on name, store as v;
		if (vec1[v] > -1)
		{


		}
		else

		{
			cout << start_vertex << endl;
			vec1[v] = 0;
			for (auto u = graph_array[v].edgeList.rbegin(); u != graph_array[v].edgeList.rend(); u++)
			{
				if (vec1[isVertex(u->name)] < -1)
				{
					q.push(u->name); //push u.name onto queue
					//vec1[isVertex(u->name)] = v;
					
				}

			}/*
			for (int j = 0; j < num_of_verticies; j++) {
				cout << array1[j];*/




		}

	}
}

//template< typename V, typename W >
//void Digraph<V, W>::recurdepth(V& start_vertex) {
//
//	//recurdepth(depth(start_vertex));
//	visited[vertex] = true;
//	list<int> adjList = adjLists[vertex];
//	cout << vertex << " ";
//	list<int>::iterator i;
//	for (i = adjList.begin(); i != adjList.end(); ++i)
//		if (!visited[*i])
//			DFS(*i);
//
//}

template< typename V, typename W >
void Digraph<V, W>::mst() {

	int d = get_size();
	vector<bool> component;
	vector<W> distance;
	vector<V> neighbor;
	int cur = 0;
	int totalMST = 0;
	string smallestNeighbor = "";

	V source = graph_array[0].name;
	int min = 0;
	int temp = 0;
	int max = 1000000;

	for (int w = 0; w < d; w++)
	{
		component.push_back(cur);
		distance.push_back(max);// wieght at each spot
		neighbor.push_back(source);
	}

	component[cur] = true;		//source in mst
	distance[cur] = 0;

	for (int i = 0; i < d; i++)
	{
		{

			min = max;
			for (auto u = graph_array[cur].edgeList.begin(); u != graph_array[cur].edgeList.end(); u++) {
				if (!component[isVertex(u->name)]) {
					if (u->weight < distance[isVertex(u->name)]) {
						//only vertices not in mst
					//if actual distance is less than the distance so far in mst

						distance[isVertex(u->name)] = u->weight;
					}

					if (u->weight < min) {
						min = u->weight;
						temp = isVertex(u->name);
						smallestNeighbor = u->name;
					}

				}


				//		for (int i = 0; i < d; i++) {
				//			cout << distance[i] << endl;
				///*
				if (min < max)
				{
					component[temp] = 1;
					//neighbor[temp] = graph_array[temp].name;
					for (auto uu = graph_array[temp].edgeList.begin(); uu != graph_array[temp].edgeList.end(); uu++) {

						if (!component[isVertex(uu->name)]) {

							if (uu->weight < distance[isVertex(uu->name)]) {
								distance[isVertex(uu->name)] = uu->weight;
								neighbor[isVertex(uu->name)] = smallestNeighbor;
							}
						}
					}//only vertices not in mst
						//if actual distance is less than the distance so far in mst


				}


			}//end if and for w
		}

		//end if (min< inf)
	}
	for (int i = 0; i < d; i++) {
		cout << "\n\n source: " << neighbor[i] << "  neighbor: " << graph_array[i].name << "  distance: " << distance[i] << "  component: " << component[i];
		totalMST = totalMST + distance[i];
	}

	cout << "\n\nthe mst wieght is  " << totalMST;
}
	

template< typename V, typename W >
void Digraph<V, W>::recurDepthHelp(V& vert)

{
	
	for (int u = 0; u < num_of_verticies;u++) {
		graph_array[u].visited = false;
		
	}
		
	recurDepth(vert);
	
}



template< typename V, typename W >
void Digraph<V, W>::recurDepth(V& start_vertex) {


	int xxx = isVertex(start_vertex);
	graph_array[xxx].visited = true;
	cout << graph_array[xxx].name << endl;
	typename std::list< edge_representation<V, W> >::iterator  i;
	
	
	for (i = graph_array[xxx].edgeList.begin(); i != graph_array[xxx].edgeList.end(); ++i) {
		
		if (!graph_array[isVertex(i->name)].visited) {
			recurDepth(i->name);
		}
			
	}


}


template< typename V, typename W >
void Digraph<V, W>::fords(V& start_vertex) {
	typename std::list< edge_representation<V, W> >::iterator  it;

	int size = graph_array.size();
	int* distance = new int[size];
	int  source = isVertex(start_vertex);
	string bongo;
	for (int i = 0; i < size; i++)
	{
		distance[i] = INT_MAX;
	}
	distance[source] = 0;
	bongo = start_vertex;
	std::stack<V> s;
	s.push(bongo);
	while (!s.empty())
	{

		bongo = s.top();
		s.pop();
		
		for (it = graph_array[isVertex(bongo)].edgeList.begin(); it != graph_array[isVertex(bongo)].edgeList.end(); it++)
		{
			if (distance[isVertex(it->name)] > distance[isVertex(bongo)] + it->weight) {

				distance[isVertex(it->name)] = distance[isVertex(bongo)] + it->weight;
				
				s.push(it->name);


			}
		}
	}

	for (int i = 0; i < graph_array.size(); i++) {
		cout << "distance: " << start_vertex << " to " << graph_array[i].name << " is ";
		if (distance[i] == INT_MAX)
			cout << "too damn high" << endl;
		else
			cout << distance[i] << endl;
	}
}



















/////////////////////////////////// getOneVertex //////////////////////////////////////////////////////////////////////
//
// function name      : getOneVertex
//
// purpose            : queries user for an input vertex
//
// input parameters   : none
//
// output parameters  : one of type V, called v1
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::getOneVertex(V& v1)
{
	cout << " Please enter a city name  : ";
	cin >> v1;
}



/////////////////////////////////// getTwoVerticies ///////////////////////////////////////////////////////////////////
//
// function name      : getTwoVerticies
//
// purpose            : queries user for two input verticies
//
// input parameters   : none
//
// output parameters  : two of type V, called v1 and v2
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::getTwoVerticies(V& v1, V& v2)
{
	cout << "Please enter two citiess:  ";
	cin >> v1;
	cout << " ";
	cin >> v2;
	//cout << "calling getTwoVerticies - you write the code\n";
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


#endif



