//CS232 Project 2 Streller
//Rishi Chandrasekhar

#include <iostream>
#include <fstream>
#include <string>
#include "table.h"




using namespace std;

int Mapping(Pair<char, string>);

int main() {

	//string u = " ";

	//Table<string ,string> cereal(u, pass in a function);

	ifstream file, file2;
	Table <Pair<char, string>, string> tab(35, Mapping), tab2(35, Mapping);

	Pair <Pair<char, string>, string> twj, paris;

	bool keepPlaying = true;

	do {
		twj.first.first = 'A';

		cout << "Input your transtion table: ";

		string text;
		cin >> text;

		file.open(text);
		string d;
		for (int i = 0; i < 5; i++)
			file >> d;

		while (file >> twj.first.second) {

			for (int i = 0; i < 5; i++) {
				file >> twj.second;
				tab.insert(twj);
				twj.first.first++;
			}
			twj.first.first = 'A';
		}

		//tab.print();

		cout << "Input your action table: ";

		string text2;
		cin >> text2;

		file2.open(text2);
		string d2;
		paris.first.first = 'A';

		for (int i = 0; i < 5; i++)
			file2 >> d2;

		while (file2 >> paris.first.second) {

			file2 >> ws;
			if (file2.peek() == 'o' || file2.peek() == 'f') {
				for (int i = 0; i < 5; i++) {
					paris.second = " ";
					tab2.insert(paris);
					paris.first.first++;

				}
			}

			else {
				for (int i = 0; i < 5; i++) {
					file2 >> paris.second;
					file2 >> ws;
					tab2.insert(paris);
					paris.first.first++;

				}
			}

			paris.first.first = 'A';
		}
		//tab2.print();

		{
		Pair<char, string> rome;
		rome.second = "nke";

		for (int h = 0; h < 3; h++) {

			cout << "enter a character from A, B, C, D, E: ";

			cin >> rome.first;
			rome.first = toupper(rome.first);
			while (!cin || cin.peek() != '\n' || rome.first < 'A' || rome.first > 'E') {
				cout << "invalid input try again\n";
				cin.clear();
				cin.ignore(200, '\n');
				cin >> rome.first;
			}

			rome.second = tab.lookUp(rome);


		}
		cout << "enter a character from A, B, C, D, E: ";

		cin >> rome.first;
		rome.first = toupper(rome.first);
		while (!cin || cin.peek() != '\n' || rome.first < 'A' || rome.first > 'E') {
			cout << "invalid input try again\n";
			cin.clear();
			cin.ignore(200, '\n');
			cin >> rome.first;
		}

		rome.second = tab2.lookUp(rome);
		if (rome.second == "alarm")
			cout << "alarm";
		else
			cout << "unlock";

	}
		 
		string keep = " ";

		cout << "\nDo you want to keep playing? (yes/no) : ";
		cin >> keep;
		if (keep == "yes")
			keepPlaying = true;
		else
			keepPlaying = false;


	} while (keepPlaying == true);

	return 0;
}


		int Mapping(Pair<char, string> p) {

		int math = 0;
		string cuba[] = { "nke", "ok1", "ok2", "ok3", "fa1", "fa2", "fa3" };
		for (int j = 0; j < 7; j++) {
			if (p.second == cuba[j]) {
				p.first = toupper(p.first);
				math = 5 * j + ((int(p.first) - 65));
				j = 8;
			}
		}
		return math;

		}



