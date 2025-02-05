int main(){
    char* buffer[100] = "Let's learn binary search";
    int s = 0;
    int e = 100;
    // Greetings
    /*
        Binary search
        is easy
    */
    while(s <= e){
        int mid = (s + e)/2;
        if(mid == 10){
            break;
        }
        else if(mid > 10){
            e = mid - 1;
        }
        else{
            s = mid + 1;
        }
    }
    return 0;
}