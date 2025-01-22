#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void help(const char *name)
{
	printf("Usage %s NAME\n", name);
	printf("Options:\n");
	printf("	-h, --help		Show this help message and exit.\n");
}

int main(int argc, char *argv[])
{
	for (int i = 1; i < argc; i++)
	{
		if ((strcmp(argv[i], "-h") == 0 || strcmp(argv[i], "--help") == 0) && argc == 2)
		{
			help(argv[0]);
		}
		else if (argc != 2)
		{
			fprintf(stderr, "Argument error.\n");
			help(argv[0]);
			return 1;
		}
		else
		{
			printf("Hello, %s!\n", argv[i]);
		}
	}
	return 0;
}
