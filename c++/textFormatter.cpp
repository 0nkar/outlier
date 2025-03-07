using namespace std;

vector<string> fullJustify(vector<string>& words, int maxWidth) {
    vector<string> result, line;
    int lineLen = 0;
    
    for (const string& word : words) {
        if (lineLen + line.size() + word.length() > maxWidth) {
            string justified = line[0];
            for (int i = 1; i < line.size(); i++)
                justified += " " + line[i];
            result.push_back(justified);
            line.clear();
            lineLen = 0;
        }
        line.push_back(word);
        lineLen += word.length();
    }
    
    if (!line.empty()) {
        string lastLine = line[0];
        for (int i = 1; i < line.size(); i++)
            lastLine += " " + line[i];
        result.push_back(lastLine);
    }
    
    return result;
}
