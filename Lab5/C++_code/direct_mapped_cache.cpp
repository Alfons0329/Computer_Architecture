#include <iostream>
#include <stdio.h>
#include <math.h>
#include <vector>
#include <string>
using namespace std;

struct cache_content
{
	bool v;
	unsigned int  tag;
//	unsigned int	data[16];
};

const int K=1024;

double log2( double n )
{
    // log(n)/log(2) is log2.
    return log( n ) / log(double(2));
}


void simulate(int cache_size, int block_size, string& fileName)
{
	unsigned int tag,index,x;

	int offset_bit = (int) log2(block_size);
	int index_bit = (int) log2(cache_size/block_size);
	int line= cache_size>>(offset_bit);

	cache_content *cache =new cache_content[line];
	cout<<"cache line:"<<line<<endl;

	for(int j=0;j<line;j++)
		cache[j].v=false;

  	FILE * fp=fopen(fileName.c_str(),"r");					//read file

	int totalAccess=0,missCnt=0,hitCnt=0;
	while(fscanf(fp,"%x",&x)!=EOF)
	{
		//cout<<hex<<x<<" ";
		index=(x>>offset_bit)&(line-1);
		tag=x>>(index_bit+offset_bit);
		if(cache[index].v && cache[index].tag==tag)
		{
			cache[index].v=true; 			//hit
			hitCnt++;
		}
		else{
			cache[index].v=true;			//miss
			cache[index].tag=tag;
			missCnt++;
		}
	}
	totalAccess=missCnt+hitCnt;
	fclose(fp);
	cout<<"fileName:  "<<fileName<<endl;
	cout<<"cahceSize:  "<<cache_size/K<<"K "<<endl;
	cout<<"blockSize:  "<<block_size<<endl;
	cout<<"totalAccess:  "<<totalAccess<<endl;
	cout<<"miss rate:    "<<(double)missCnt/(double)totalAccess<<endl;
	cout<<endl;
	delete [] cache;
}

int main()
{
	// Let us simulate 4KB cache with 16B blocks
	vector<string>cachedata={"ICACHE.txt","DCACHE.txt"};
	for(unsigned int read_index=0;read_index<2;read_index++)
		for(unsigned int cacheSize=4*K;cacheSize<=256*K;cacheSize*=4)
			for(unsigned int blockSize=16;blockSize<=256;blockSize*=2)
				simulate(cacheSize,blockSize,cachedata[read_index]);

	return 0;
}
