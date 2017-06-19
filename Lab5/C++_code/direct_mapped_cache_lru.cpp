#include <iostream>
#include <stdio.h>
#include <math.h>
#include <vector>
#include <string>
#include <fstream>
#include <iomanip>
using namespace std;

struct cache_content
{
	bool v;
	unsigned int  tag;
    int last_access_time;
};

const int K=1024;

double log2( double n )
{
    // log(n)/log(2) is log2.
    return log( n ) / log(double(2));
}


void simulate(int associativity,int cache_size, int block_size, string& fileName)
{
	unsigned int tag,index,x;

	int offset_bit = (int) log2(block_size);
	int index_bit = (int) log2(cache_size/block_size);
	int line= cache_size>>(offset_bit);

	cache_content **cache =new cache_content*[line]; //new 2d array as a set associativie version cache
	cout<<"cache line:"<<line<<endl;

	for(int i=0;i<line;i++)
    {
        cache[i]=new cache_content[associativity]; //give it a pack of data
    }
    for(int i=0;i<line;i++)
        for(int j=0;j<associativity;j++)
            cache[i][j].v=false;

  	FILE * fp=fopen(fileName.c_str(),"r");					//read file

	int totalAccess=0,missCnt=0,hitCnt=0;
	while(fscanf(fp,"%x",&x)!=EOF)
	{

		index=(x>>offset_bit)&(line-1);
		tag=x>>(index_bit+offset_bit);
        bool hit=0;
        for(int asso_index=0;asso_index<associativity;asso_index++) //search the whole set
        {
            if(cache[index][asso_index].v && cache[index][asso_index].tag==tag)
    		{
    			cache[index][asso_index].v=true; 			//hit
    			hitCnt++;
                hit=1;
                cache[index][asso_index].last_access_time=totalAccess;
                break; //find , leave
    		}
        }
        if(!hit)//miss
        {
            //search for empty block and put in
            bool empty=0;
            missCnt++;
            for(int asso_index=0;asso_index<associativity;asso_index++)
            {
                if(!cache[index][asso_index].v)
                {
                    cache[index][asso_index].v=1;
                    cache[index][asso_index].tag=tag;
                    cache[index][asso_index].last_access_time=totalAccess;
                    empty=1;
                    break;
                }
            }

            if(!empty) //if no more empty block to load new data LRU implement
            {
                int max_time=66666666; //find the least recently used data.
                int to_be_replaced_index=0;
                for(int asso_index;asso_index<associativity;asso_index++)
                {
                    if(cache[index][asso_index].last_access_time<max_time)  //trace down the time to seek the minimum value of accessing , that is the place forLRU
                    {
                        max_time=cache[index][asso_index].last_access_time;
                        to_be_replaced_index=asso_index;
                    }
                }
                cache[index][to_be_replaced_index].v=1;
                cache[index][to_be_replaced_index].tag=tag;
                cache[index][to_be_replaced_index].last_access_time=totalAccess;
            }
        }
        totalAccess++;
	}

	fclose(fp);

	ofstream advancedFile;
	advancedFile.open("advancedAns.txt",std::ios_base::app);
	cout<<"fileName:  "<<fileName<<endl;
	cout<<"cacheSize:  "<<cache_size/K<<"K "<<endl;
	cout<<"blockSize:  "<<block_size<<endl;
	cout<<"associativity:  "<<associativity<<endl;
	cout<<"totalAccess:  "<<totalAccess<<endl;
	cout<<"miss rate:    "<<(double)missCnt/(double)totalAccess<<endl;
	advancedFile<<"fileName:  "<<setw(11)<<fileName<<"  cahceSize:  "<<setw(4)<<cache_size/K<<"K "<<"  blockSize:  "<<block_size<<"  associativity:  "<<associativity<<"  miss rate:    "<<(double)missCnt/(double)totalAccess<<endl;
	cout<<endl;
	for(int i=0;i<line;++i){
        delete [] cache[i];
    }
	delete [] cache;
}

int main()
{
	// Let us simulate 4KB cache with 16B blocks
	vector<string>cachedata={"LU.txt","RADIX.txt"};
	for(unsigned int read_index=0;read_index<2;read_index++)
		for(unsigned int cacheSize=1*K;cacheSize<=32*K;cacheSize*=2)
			for(unsigned int associativity=1;associativity<=8;associativity*=2)
				simulate(associativity,cacheSize,64,cachedata[read_index]);

	return 0;
}
