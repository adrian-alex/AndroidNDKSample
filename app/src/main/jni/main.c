#include "main.h" 
#include <errno.h> 
#include <string.h> 
#include <fcntl.h> 
#include <malloc.h> 
#include <unistd.h> 

jstring Java_com_antocistudios_ndktest_androidndk_MainActivity_callWithArguments(JNIEnv* env, jstring param)
{
    char *buf = (char*)malloc(20);
    strcpy(buf, "ciao from NDK");
    jstring jstrBuf = (*env)->NewStringUTF(env, buf);
    return jstrBuf;
}
jint JNI_OnLoad(JavaVM* vm, void* reserved)
{
    return JNI_VERSION_1_6;
}