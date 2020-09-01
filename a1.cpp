#include <iostream>
#include <string>
#include <vector>
#include <unordered_set>

using namespace std;

const int MAX_NUM = 100000;

struct Value {
	int leng;
	int index;

    Value(int leng, int index) : leng(leng), index(index) {}

    Value() : leng(0), index(0) {}
};

vector<int> input() {
    string text;
	getline(cin, text);
	
	vector<int> arr;
    string temp = "";
    for (auto c: text) {
        if (c == ' ') {
            if (temp != "") arr.push_back(stoi(temp));
            temp = "";
        } else {
            temp += c;
        }
    }
    arr.push_back(stoi(temp));

	return arr;
}

void update(vector<vector<Value>>& fenwick_tree, int index, Value val) {
    for (int i = index; i <= MAX_NUM; i += i & -i) {
        int current_leng;
        if (fenwick_tree[i].size() > 0)
            current_leng = fenwick_tree[i][0].leng;
        else
            current_leng = 0;

        if (current_leng < val.leng) {
            fenwick_tree[i].clear();
            fenwick_tree[i].push_back(val);
        } else if (current_leng == val.leng)
            fenwick_tree[i].push_back(val);
    }
}

vector<Value> get(vector<vector<Value>>& fenwick_tree, int index) {
    vector<Value> res;
    int bestLeng = 0;
    for (int i = index; i > 0; i -= i & -i) 
        if (fenwick_tree[i].size() > 0) 
            if (bestLeng < fenwick_tree[i][0].leng)
                res = fenwick_tree[i], bestLeng = fenwick_tree[i][0].leng;
            else if (bestLeng == fenwick_tree[i][0].leng)
                res.insert(res.end(), fenwick_tree[i].begin(), fenwick_tree[i].end());
    return res;
}

void printAns(vector<int>& arr, vector<vector<Value>>& trace, int index, vector<int>& pocket, unordered_set<string>& list_output) {
    pocket.push_back(arr[index]);
    if (trace[index].size() != 0) {
        for (auto t: trace[index])
            printAns(arr, trace, t.index, pocket, list_output);
    } else {
        string temp = "";
        for (int i = pocket.size()-1; i >= 0; i--)
            temp += to_string(pocket[i]) + " ";
        list_output.insert(temp);
    }
    pocket.pop_back();
}

int main() {
    vector<Value> ans;
    int bestLeng = 0;
    vector<int> arr = input();

    vector<vector<Value>> fenwick_tree(MAX_NUM);
    vector<vector<Value>> trace(arr.size());
    for (int index = 0; index < arr.size(); index++) {
        auto val = get(fenwick_tree, arr[index]-1);
        trace[index] = val;
        
        int leng = 0;
        if (val.size() > 0) leng = val[0].leng;
        Value new_val(leng+1, index);

        update(fenwick_tree, arr[index], new_val);

        if (bestLeng < new_val.leng) {
            ans.clear();
            ans.push_back(new_val);
            bestLeng = new_val.leng;
        } else if (bestLeng == new_val.leng) 
            ans.push_back(new_val);
    }

    vector<int> pocket;
    unordered_set<string> list_output;
    for (auto x: ans)
        printAns(arr, trace, x.index, pocket, list_output);
    for (string s: list_output)
        cout << s << endl;
}