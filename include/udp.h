/* $Id: udp.h,v 1.2 2005/03/27 01:31:50 stpohle Exp $
 * UDP Network */

#ifndef _UDP_H
#define _UDP_H

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <time.h>
#include <sys/time.h>
#ifdef _WIN32
	#include <winsock.h>
	#include <io.h>
#else
	#include <sys/socket.h>
	#include <netinet/in.h>
	#include <netdb.h>
	#include <arpa/inet.h>
	#include <unistd.h>
	#include <sys/time.h>
#endif

#ifdef _WIN32
	#define _sockaddr sockaddr
#else
	#define _sockaddr sockaddr_in6
#endif

extern char *dns_net_getip (char *host);
extern int dns_filladdr (char *host, int hostlen, char *port, int portlen, int ai_family, struct _sockaddr *sAddr);
extern int udp_get (int sock, char *text, int len, struct _sockaddr *sAddr, int ai_family);
extern int udp_server (char *port, int ai_family);
extern void udp_send (int sock, char *text, int len, struct _sockaddr *sAddr, int ai_family);
extern void udp_sendbroadcast (int sock, char *text, int len, struct _sockaddr *sAddr, int ai_family);
extern void udp_close (int sock);

#endif
