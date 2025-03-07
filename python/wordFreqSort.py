def count_word_frequencies(text):
    text = text.lower()
    words = [''.join(c for c in word if c.isalnum()) for word in text.split()]
    frequencies = {}
    
    for word in words:
        if word:
            frequencies[word] = frequencies.get(word, 0) + 1
    
    sorted_words = sorted(frequencies.items(), key=lambda x: x[1], reverse=True)
    
    print("Word Frequencies:")
    for word, freq in sorted_words:
        print(f"{word}: {freq}")
    
text = "Hello world! This is a test. Hello, this test is only a test."
count_word_frequencies(text)
