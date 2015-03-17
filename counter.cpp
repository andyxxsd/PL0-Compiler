#include "counter.h"
#include <iostream>
#include <map>
#include <string>

using namespace std;

map<string, int>::iterator itm;
map<string, map<string, int> > lexicon;
map<string, map<string, int> >::iterator itmm;

int inc_lexicon(const char* type, const char* word) {
	return ++lexicon[type][word];
}
int get_lexicon(const char* type, const char* word) {
	return lexicon[type][word];
}

void print_word(const char* type, const char* word) {
	cout << word << ": " << lexicon[type][word] << endl;
}

void print_type(const char* type) {
	cout << type << ":\n";
	for (itm=lexicon[type].begin();itm!=lexicon[type].end();itm++) 
		print_word(type, itm->first.c_str());
}

void print_lexicon() {
	for (itmm=lexicon.begin();itmm!=lexicon.end();itmm++) {
		print_type(itmm->first.c_str());
		putchar('\n');
	}
}