

#include <iostream>
#include <fstream>
#include <array>		// std::array
#include <algorithm>	// sort
#include<list>
#include <unordered_map>
//#include "Huffy.t"
//#include "HuffyWorship.h"
using namespace std;

#define MAX_TREE_HT 50


struct finesse
{
	char lett = '^';
	int occurance = 0;
	finesse* left, * right;
	string huffy = "";

};

void quickPrint(finesse* root, unordered_map<char, string>& g);
void quickPrint2(finesse* current, string n, ofstream& f, unordered_map<char, string>& gg);

int main()
{

	int TotalNumChars = 0;

	array<finesse, 26> let;

	for (int i = 0; i < 26; i++)
	{
		let[i].lett = i + 'A';
		let[i].left = let[i].right = NULL;
	}

	ifstream filet;
	ofstream fout;
	string filetname;
	string filetname2;

	cout << "please enter file name: ";
	cin >> filetname2;
	char readin;

	filet.open(filetname2);
	if (!filet)
	{
		cout << "cant open file bro";
	}
	while (filet >> readin) {			// 65-90
		if (readin != '*')
		{

			//for (int i = 0; i < 26; i++)
			//{
			if (isalpha(readin))
			{
				readin = toupper(readin);
				let[readin - 'A'].occurance++;
				TotalNumChars++;
				/*if (readin == (i + 64)) {
					let[i + 64]->occurrence++;

				}*/
				//let[i + 64]->total = let[i + 64]->total + let[i + 64]->occurrence;
			}


			//}
			//for (int i = 0; i < 26; i++) {
			//	TotalNumChars = TotalNumChars + let[i]->total;
			//}
		}


		/*cout << "the total number of characters is: " + TotalNumChars;
		for (int i = 0; i < 26; i++) {
			let[i]->frequency[i] = let[i]->occurrence;

			sort(let[i]->frequency, 26, greater<int>());
		}*/

		//read in file and organize how many occurances happen for each character and the total numb of characters
		//make tree using list of ordered characters frequencies in increaxing order
		//from the order you compare the two character frequecies put less on left higher on right and make a tree from the two 
		//keep doing this until full tree is created
		//go throuhg tree and put 0s on left edges and 1s on the right edges read down to a character to find the encode of the character
		//make table using characters noum of occurances and the encoded number
		//make the message encoded and print it to a file
		//display the decode the file 
		//print tree w breath first
	}

	// Using sorting algorithm
	sort(
		let.begin(),		// Sort begins at front of array
		let.end(),			// Sort through end of array
		[&](finesse rhs, finesse lhs) // Lambda to pass sort function to std::sort
		{
			return rhs.occurance < lhs.occurance;
		}
	);

	list<finesse*> ooo;
	list<finesse*> oooo;
	finesse* temp;
	for (int i = 0; i < 26; i++)
	{
		temp = new finesse();
		temp->left = temp->right = NULL;
		temp->lett = let[i].lett;
		temp->occurance = let[i].occurance;
		ooo.emplace_back(temp);
	}

	while (ooo.size() > 1)
	{
		temp = new finesse();
		temp->left = ooo.front();
		ooo.pop_front();
		temp->right = ooo.front();
		ooo.pop_front();
		temp->occurance = temp->left->occurance + temp->right->occurance;
		ooo.emplace_back(temp);
		ooo.sort(
			[](finesse* rhs, finesse* lhs) // Lambda to pass sort function to std::sort
			{
				return rhs->occurance < lhs->occurance;
			}
		);

		//sort(
		//	ooo.begin(),		// Sort begins at front of array
		//	ooo.end(),			// Sort through end of array
		//	[&](finesse rhs, finesse lhs) // Lambda to pass sort function to std::sort
		//	{
		//		return rhs.occurance < lhs.occurance;
		//	}
		//);

	}
	filet.close();
	filet.open(filetname2);
	unordered_map<char, string> toolie;
	quickPrint(ooo.front(), toolie);


	fout.open("encodehuffy.txt");
	while (filet >> readin) {			// 65-90
		if (readin != '*')
		{

			//for (int i = 0; i < 26; i++)
			//{
			if (isalpha(readin))
			{
				readin = toupper(readin);
				fout << toolie[readin];
			}
		}
	}
	//list<finesse*> oooo;
	//filet.open(filetname2);
	//if (!filet)
	//{
	//	cout << "cant open file bro";
	//}
	//while (filet >> readin) {			// 65-90
	//	if (readin != '*')
	//	{

	//		list<finesse*>::iterator it;

	//		it = find(ooo.begin(), ooo.end(), readin);
	//		// Check if iterator points to end or not
	//		if (it == ooo.end())
	//		{

	//			for (int i = 0; i < 26; i++) {

	//				oooo.assign(let[i].)
	//			}
	//			// It does not point to end, it means element exists in list
	//			cout << it.operator* << endl;
	//			ooo.;
	//		}



	//		if (let[i].lett == ooo.) {
	//			//change the letter to the huff code and print it out 
	//		}
	//	}
	//}
	/*for (auto& i : let)
		cout << i.lett << ' ' << i.occurance << endl;*/
	cout << "\n\nthe total number of characters is: " << TotalNumChars << "\n\n";
	cin.get();
	cin.get();
}



void quickPrint(finesse* root, unordered_map<char, string> &g)
{
	ofstream f("huffy1.txt");
	string encode = "";
	quickPrint2(root, encode, f,g);
}

void quickPrint2(finesse* current, string n, ofstream& f, unordered_map<char, string>& gg)
{

	if (current->left) {
		quickPrint2(current->left, n + '0', f, gg);
	}

	if (current->lett != '^') {
		cout << current->lett << ' ' << n << ' ' << current->occurance << endl;
		current->huffy = current->lett;
		gg[current->lett] = n;
		f << current->lett << ' ' << n << ' ' << endl;
	}

	if (current->right) {
		quickPrint2(current->right, n + '1', f, gg);
	}




}