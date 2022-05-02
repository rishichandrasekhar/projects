#pragma once

#include <iostream>
#include "table.h"

template < class Key, typename T >
Table<Key, T>::Table(int n, int (*map)(Key k)) {
	Mapping = map;
	
	the_table = new Pair<Key, T>[n];
	tableSize = n;
	for (int i = 0; i < tableSize; i++) {
		the_table[i].first = Key();
		the_table[i].second = T();
	}
	



	//Pair<  string, string >  values;
	//values = makePair(k);
	//string inputFromUser; // from pair first value
	//string state; // from pair second value
	//inputFromUser = values.first;
	//state = values.second;
	/*k has the value of index holding whether ok failed or nke 
	n carries the ascii value of A B C D E*/
}



template < class Key, typename T >
bool Table<Key, T>::insert(Pair<  Key, T >  kvpair)
{
	int hi = Mapping(kvpair.first);
   
	if (hi > tableSize || hi < 0) {
		return false;
	}
	else
	{
		the_table[hi] = kvpair;
		return true;
	}
	return true;
}

template < class Key, typename T >
bool Table<Key, T>::remove(const Key  aKey)
{
	int hi = Mapping(aKey);
	if (isIn(aKey)) {
		the_table[hi] = new Pair<Key, T>[hi];
		return true;
	}
	else
		return false;
		
}


template < class Key, typename T >
T  Table<Key, T>::lookUp(const Key aKey) {
	T temp = T();
	if (isIn(aKey))
		return the_table[Mapping(aKey)].second;
	else
		return temp;
}

template<class Key, typename T>
Table<Key, T>::~Table()
{
	return;
}

//template < class Key, typename T >
//void   Table<Key, T>::print() {
//	for (int i = 0; i < tableSize; i++) {
//		std::cout << the_table[i].first << " " << the_table[i].second << std::endl;
//	}
//	
//
//}


template < class Key, typename T >
bool Table<Key, T>::empty() const {
	if (Mapping(Key.first) == " ")
		return true;
	else
		return false;
}

template < class Key, typename T >
bool Table<Key, T>::full() const {
	if (!empty())
		return true;
	else
		return false;
}

template < class Key, typename T >
int Table<Key, T>::size() const {
	return tableSize;
}

template < class Key, typename T >
bool Table<Key, T>::isIn(const Key& key) const {

	int tokyo = Mapping(key);
	//Key tokyoyo = the_table[tokyo].first;  // fa1, nke inside the table
	//T tokyoyoyo = the_table[tokyo].second;
	if (tokyo < 0 || tokyo > tableSize)
		return false;
	else if (the_table[tokyo].first == Key() || the_table[tokyo].second == T())
		return false;
	else
		return true;

}