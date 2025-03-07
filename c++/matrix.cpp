using namespace std;

#include <iostream>

int main() {
    int rows, cols;
    cin >> rows >> cols;
    
    int matrix[rows][cols], transposed[cols][rows];
    
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            cin >> matrix[i][j];
    
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            transposed[j][i] = matrix[i][j];
    
    for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++)
            cout << transposed[i][j] << " ";
        cout << endl;
    }
    
    return 0;
}
