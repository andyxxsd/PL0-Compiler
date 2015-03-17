#ifndef COUNTER_H
#define COUNTER_H
#ifdef __cplusplus
extern "C" {
#endif
	int inc_lexicon(const char*, const char*);
	int get_lexicon(const char*, const char*);
	void print_lexicon();
	void print_type(const char*);
	void print_word(const char*, const char*);
#ifdef __cplusplus
}
#endif
#endif