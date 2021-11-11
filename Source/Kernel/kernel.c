#include "stdstring.c"

void SetFirstCharacter(char character)
{
    char* videoMemory =(char*) 0xb8000;
    *videoMemory = character;
}

void main()
{
    SetFirstCharacter('O');
}
