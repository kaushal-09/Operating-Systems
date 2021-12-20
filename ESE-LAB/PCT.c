#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <time.h>
#include <math.h>

#define Iterations 100
#define Size 3 //BUFFER SIZE = 3 

int in = 0;
int out = 0;
int buffer[Size] = {0};
pthread_mutex_t mutex;

void show()
{
    for (int i = 0; i < Size; i++)
        printf("%d ", buffer[i]);
    printf("\n");
}

void *prod(void *_args)    //PRODUCER FUNCTION
{
    int item;
    for (int i = 0; i < Iterations; i++)
    {
        printf("\nConsumer was blocked.\n");
        sleep(rand() % 3);
        item = 1 + rand() % 10;
        pthread_mutex_lock(&mutex);
        buffer[in] = item;
        printf("\nProduced : %d", buffer[in]);
        printf("\nStatus of the buffer : ");
        show();
        in = (in + 1) % Size;
        pthread_mutex_unlock(&mutex);
    }
}

void *cons(void *_args)    //CONSUMER FUNCTION
{
    for (int i = 0; i < Iterations; i++)
    {
        sleep(rand() % 3);
        printf("\nProducer was blocked.\n");
        int item = buffer[out];
        pthread_mutex_lock(&mutex); 
        buffer[out] = 0;
        printf("\nConsumed : %d", item);
        printf("\nStatus of the buffer : ");
        show();
        out = (out + 1) % Size;
        pthread_mutex_unlock(&mutex);  
    }
}

int main()
{

    pthread_t pro, con, pro1, con1, pro2, con2;
    
    /* INITIALISED THE MUTEX */
    pthread_mutex_init(&mutex, NULL);  
    
    /* FIRST SET OF PRODUCER AND CONSUMER */
    pthread_create(&pro, NULL, prod, NULL);
    pthread_create(&con, NULL, cons, NULL);
    
    sleep(200);  //DELAY TIME
    
    /* SECOND SET OF PRODUCER AND CONSUMER */
    pthread_create(&pro1, NULL, prod, NULL);
    pthread_create(&con1, NULL, cons, NULL);
    
    /* THIRD SET OF PRODUCER AND CONSUMER */
    pthread_create(&pro2, NULL, prod, NULL);
    pthread_create(&con2, NULL, cons, NULL);
    
    
    sleep(200);  //DELAY TIME
    
    /* MULTITHREADING USED HERE */
    pthread_join(pro, NULL);
    pthread_join(con, NULL);
    pthread_join(pro1, NULL);
    pthread_join(con1, NULL);
    pthread_join(pro2, NULL);
    pthread_join(con2, NULL);
    
    /* DESTROYED THE MUTEX */
    pthread_mutex_destroy(&mutex);
    return 0;
}
