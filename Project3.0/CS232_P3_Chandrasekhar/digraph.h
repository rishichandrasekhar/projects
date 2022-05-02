
/////////////////////////////////// digraph.h /////////////////////////////////////////////////////////////////////////
//
// file name          : digraph.h
//
// This file contains "defintion" of a templated version of a graph/network adt.
//
// Programmer         : B.J. STRELLER
//
// Date created       : 
//
// Date last revised  :
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




#ifndef DIGRAPH_H
#define DIGRAPH_H

#include<fstream>
using std::ifstream;

#include<list>
#include<vector>
#include<queue>
#include<stack>



template< typename V, typename W >
struct edge_representation
{
	V name;													//edge's vertex name
	W weight;												//edge's vertex weight
};


template< typename V, typename W >
struct vertex
{
	V name;			
	bool visited; //vertex name in graph
	std::list< edge_representation<V, W> > edgeList;		//list of adjacents
};




template< typename V, typename W >
class Digraph
{

protected:
	int num_of_verticies;									//verticies in graph
	std::vector< vertex<V, W> >  graph_array;				//graph is a vector

public:
	Digraph();
	~Digraph();

	void set_size(ifstream& inFile);
	void getDigraph(ifstream& inFile);
	int  get_size();
	int  isVertex(V& v);
	int  isUniEdge(V& v1, V& v2);
	int  isBiDirEdge(V& v1, V& v2);
	int  addVertex(V& v);
	bool deleteVertex(V& v);
	int  addUniEdge(V& v1, V& v2, W& w);
	int  addBiDirEdge(V& v1, V& v2, W& w);
	bool deleteUniEdge(V& v1, V& v2, W& w);
	bool deleteBiDirEdge(V& v1, V& v2, W& w);
	void printDigraph();
	void breadth(V& start_vertex);
	void depth(V& start_vertex);
	void getOneVertex(V& v1);								//function for input queries
	void getTwoVerticies(V& v1, V& v2);
	void recurDepth(V& start_vertex);	
	void recurDepthHelp(V& start_vertex); //function for input queries
	void mst();
	void fords(V& start_vertex);

};


#include "digraph.t"
#endif


