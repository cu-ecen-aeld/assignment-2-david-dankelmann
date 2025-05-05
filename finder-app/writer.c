#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <errno.h>
#include <syslog.h>

int main(int argc, char **argv)
{
    // connect to syslog
    openlog( "writer", LOG_PID | LOG_PERROR , LOG_USER );

    // read args
    if (argc != 3)
    {
        syslog(LOG_ERR, "Usage: %s <writefile> <writestr>\n", argv[0]);
        return 1;
    }
    char *writefile = argv[1];
    char *writestr = argv[2];

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    int fd;
    fd = open(writefile, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd == -1)
    {
        syslog(LOG_ERR, "Error opening file");
        exit(1);
    }
    else{
        ssize_t ret, nr, len;
        len = strlen(writestr);
        while ( len != 0 && (ret = write ( fd, writestr, len ))){
            if ( ret == -1) {
                if ( errno == EINTR)
                    continue;
                syslog(LOG_ERR, "Error writing to file");
                break;
            }
            len -= ret;
            writestr += ret;
        }
    }
}