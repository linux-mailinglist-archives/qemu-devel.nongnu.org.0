Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF3A2E0B35
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 14:57:58 +0100 (CET)
Received: from localhost ([::1]:59550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriAn-0002aS-Fw
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 08:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBZ-0001mC-F9; Tue, 22 Dec 2020 03:38:25 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBW-0002j7-Dq; Tue, 22 Dec 2020 03:38:25 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0V7y5gtwz7JcZ;
 Tue, 22 Dec 2020 16:37:18 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:51 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
Subject: [PATCH 1/9] net: Add spaces around operator/delete redundant spaces
Date: Tue, 22 Dec 2020 16:23:32 +0800
Message-ID: <20201222082340.67405-2-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20201222082340.67405-1-zhanghan64@huawei.com>
References: <20201222082340.67405-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhanghan64@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Dec 2020 08:55:42 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 hang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix problems about spaces:
-operator needs spaces around it, add them. 
-somespaces are redundant, remove them.

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 net/checksum.c    |  4 +--
 net/eth.c         |  2 +-
 net/net.c         |  2 +-
 net/queue.c       |  2 +-
 net/socket.c      | 12 +++----
 net/tap-solaris.c | 42 +++++++++++-----------
 net/tap-win32.c   | 90 +++++++++++++++++++++++------------------------
 net/vde.c         |  2 +-
 net/vhost-user.c  |  2 +-
 9 files changed, 79 insertions(+), 79 deletions(-)

diff --git a/net/checksum.c b/net/checksum.c
index aaa4000238..f65ac3ea9f 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -41,8 +41,8 @@ uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq)
 
 uint16_t net_checksum_finish(uint32_t sum)
 {
-    while (sum>>16)
-        sum = (sum & 0xFFFF)+(sum >> 16);
+    while (sum >> 16)
+        sum = (sum & 0xFFFF) + (sum >> 16);
     return ~sum;
 }
 
diff --git a/net/eth.c b/net/eth.c
index 1e0821c5f8..725de18272 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -334,7 +334,7 @@ eth_setup_ip4_fragmentation(const void *l2hdr, size_t l2hdr_len,
         assert(frag_offset % IP_FRAG_UNIT_SIZE == 0);
         assert((frag_off_units & ~IP_OFFMASK) == 0);
 
-        orig_flags = be16_to_cpu(iphdr->ip_off) & ~(IP_OFFMASK|IP_MF);
+        orig_flags = be16_to_cpu(iphdr->ip_off) & ~(IP_OFFMASK | IP_MF);
         new_ip_off = frag_off_units | orig_flags  | (more_frags ? IP_MF : 0);
         iphdr->ip_off = cpu_to_be16(new_ip_off);
         iphdr->ip_len = cpu_to_be16(l3payload_len + l3hdr_len);
diff --git a/net/net.c b/net/net.c
index e1035f21d1..a835759266 100644
--- a/net/net.c
+++ b/net/net.c
@@ -179,7 +179,7 @@ static int qemu_macaddr_get_free(void)
 
 void qemu_macaddr_default_if_unset(MACAddr *macaddr)
 {
-    static const MACAddr zero = { .a = { 0,0,0,0,0,0 } };
+    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
     static const MACAddr base = { .a = { 0x52, 0x54, 0x00, 0x12, 0x34, 0 } };
 
     if (memcmp(macaddr, &zero, sizeof(zero)) != 0) {
diff --git a/net/queue.c b/net/queue.c
index 19e32c80fd..fd0e4e66e1 100644
--- a/net/queue.c
+++ b/net/queue.c
@@ -57,7 +57,7 @@ struct NetQueue {
 
     QTAILQ_HEAD(, NetPacket) packets;
 
-    unsigned delivering : 1;
+    unsigned delivering:1;
 };
 
 NetQueue *qemu_new_net_queue(NetQueueDeliverFunc *deliver, void *opaque)
diff --git a/net/socket.c b/net/socket.c
index 15b410e8d8..282264bbcb 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -455,15 +455,15 @@ static NetSocketState *net_socket_fd_init(NetClientState *peer,
                                           int fd, int is_connected,
                                           const char *mc, Error **errp)
 {
-    int so_type = -1, optlen=sizeof(so_type);
+    int so_type = -1, optlen = sizeof(so_type);
 
-    if(getsockopt(fd, SOL_SOCKET, SO_TYPE, (char *)&so_type,
-        (socklen_t *)&optlen)< 0) {
+    if (getsockopt(fd, SOL_SOCKET, SO_TYPE, (char *)&so_type,
+        (socklen_t *)&optlen) < 0) {
         error_setg(errp, "can't get socket option SO_TYPE");
         closesocket(fd);
         return NULL;
     }
-    switch(so_type) {
+    switch (so_type) {
     case SOCK_DGRAM:
         return net_socket_fd_init_dgram(peer, model, name, fd, is_connected,
                                         mc, errp);
@@ -484,7 +484,7 @@ static void net_socket_accept(void *opaque)
     socklen_t len;
     int fd;
 
-    for(;;) {
+    for (;;) {
         len = sizeof(saddr);
         fd = qemu_accept(s->listen_fd, (struct sockaddr *)&saddr, &len);
         if (fd < 0 && errno != EINTR) {
@@ -574,7 +574,7 @@ static int net_socket_connect_init(NetClientState *peer,
     qemu_set_nonblock(fd);
 
     connected = 0;
-    for(;;) {
+    for (;;) {
         ret = connect(fd, (struct sockaddr *)&saddr, sizeof(saddr));
         if (ret < 0) {
             if (errno == EINTR || errno == EWOULDBLOCK) {
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index 0475a58207..dcfe92bf17 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -53,7 +53,7 @@ ssize_t tap_read_packet(int tapfd, uint8_t *buf, int maxlen)
     return getmsg(tapfd, NULL, &sbuf, &f) >= 0 ? sbuf.len : -1;
 }
 
-#define TUNNEWPPA       (('T'<<16) | 0x0001)
+#define TUNNEWPPA       (('T' << 16) | 0x0001)
 /*
  * Allocate TAP device, returns opened fd.
  * Stores dev name in the first arg(must be large enough).
@@ -75,14 +75,14 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
 
     memset(&ifr, 0x0, sizeof(ifr));
 
-    if( *dev ){
+    if (*dev) {
        ptr = dev;
-       while( *ptr && !qemu_isdigit((int)*ptr) ) ptr++;
+       while (*ptr && !qemu_isdigit((int)*ptr)) ptr++;
        ppa = atoi(ptr);
     }
 
     /* Check if IP device was opened */
-    if( ip_fd )
+    if (ip_fd)
        close(ip_fd);
 
     TFR(ip_fd = open("/dev/udp", O_RDWR, 0));
@@ -102,7 +102,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     strioc_ppa.ic_timout = 0;
     strioc_ppa.ic_len = sizeof(ppa);
     strioc_ppa.ic_dp = (char *)&ppa;
-    if ((ppa = ioctl (tap_fd, I_STR, &strioc_ppa)) < 0)
+    if ((ppa = ioctl(tap_fd, I_STR, &strioc_ppa)) < 0)
         error_report("Can't assign new interface");
 
     TFR(if_fd = open("/dev/tap", O_RDWR, 0));
@@ -110,7 +110,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
         error_setg(errp, "Can't open /dev/tap (2)");
         return -1;
     }
-    if(ioctl(if_fd, I_PUSH, "ip") < 0){
+    if (ioctl(if_fd, I_PUSH, "ip") < 0) {
         error_setg(errp, "Can't push IP module");
         return -1;
     }
@@ -118,27 +118,27 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) < 0)
         error_report("Can't get flags");
 
-    snprintf (actual_name, 32, "tap%d", ppa);
+    snprintf(actual_name, 32, "tap%d", ppa);
     pstrcpy(ifr.lifr_name, sizeof(ifr.lifr_name), actual_name);
 
     ifr.lifr_ppa = ppa;
     /* Assign ppa according to the unit number returned by tun device */
 
-    if (ioctl (if_fd, SIOCSLIFNAME, &ifr) < 0)
+    if (ioctl(if_fd, SIOCSLIFNAME, &ifr) < 0)
         error_report("Can't set PPA %d", ppa);
-    if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) <0)
+    if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) < 0)
         error_report("Can't get flags");
     /* Push arp module to if_fd */
-    if (ioctl (if_fd, I_PUSH, "arp") < 0)
+    if (ioctl(if_fd, I_PUSH, "arp") < 0)
         error_report("Can't push ARP module (2)");
 
     /* Push arp module to ip_fd */
-    if (ioctl (ip_fd, I_POP, NULL) < 0)
+    if (ioctl(ip_fd, I_POP, NULL) < 0)
         error_report("I_POP failed");
-    if (ioctl (ip_fd, I_PUSH, "arp") < 0)
+    if (ioctl(ip_fd, I_PUSH, "arp") < 0)
         error_report("Can't push ARP module (3)");
     /* Open arp_fd */
-    TFR(arp_fd = open ("/dev/tap", O_RDWR, 0));
+    TFR(arp_fd = open("/dev/tap", O_RDWR, 0));
     if (arp_fd < 0)
         error_report("Can't open %s", "/dev/tap");
 
@@ -147,29 +147,29 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     strioc_if.ic_timout = 0;
     strioc_if.ic_len = sizeof(ifr);
     strioc_if.ic_dp = (char *)&ifr;
-    if (ioctl(arp_fd, I_STR, &strioc_if) < 0){
+    if (ioctl(arp_fd, I_STR, &strioc_if) < 0) {
         error_report("Can't set ifname to arp");
     }
 
-    if((ip_muxid = ioctl(ip_fd, I_LINK, if_fd)) < 0){
+    if ((ip_muxid = ioctl(ip_fd, I_LINK, if_fd)) < 0) {
         error_setg(errp, "Can't link TAP device to IP");
         return -1;
     }
 
-    if ((arp_muxid = ioctl (ip_fd, link_type, arp_fd)) < 0)
+    if ((arp_muxid = ioctl(ip_fd, link_type, arp_fd)) < 0)
         error_report("Can't link TAP device to ARP");
 
-    close (if_fd);
+    close(if_fd);
 
     memset(&ifr, 0x0, sizeof(ifr));
     pstrcpy(ifr.lifr_name, sizeof(ifr.lifr_name), actual_name);
     ifr.lifr_ip_muxid  = ip_muxid;
     ifr.lifr_arp_muxid = arp_muxid;
 
-    if (ioctl (ip_fd, SIOCSLIFMUXID, &ifr) < 0)
+    if (ioctl(ip_fd, SIOCSLIFMUXID, &ifr) < 0)
     {
-      ioctl (ip_fd, I_PUNLINK , arp_muxid);
-      ioctl (ip_fd, I_PUNLINK, ip_muxid);
+      ioctl(ip_fd, I_PUNLINK , arp_muxid);
+      ioctl(ip_fd, I_PUNLINK, ip_muxid);
       error_report("Can't set multiplexor id");
     }
 
@@ -180,7 +180,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
 int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
              int vnet_hdr_required, int mq_required, Error **errp)
 {
-    char  dev[10]="";
+    char  dev[10] = "";
     int fd;
 
     fd = tap_alloc(dev, sizeof(dev), errp);
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 2b5dcda36e..2c8fc9c36b 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -42,18 +42,18 @@
 // TAP IOCTLs
 //=============
 
-#define TAP_CONTROL_CODE(request,method) \
-  CTL_CODE (FILE_DEVICE_UNKNOWN, request, method, FILE_ANY_ACCESS)
-
-#define TAP_IOCTL_GET_MAC               TAP_CONTROL_CODE (1, METHOD_BUFFERED)
-#define TAP_IOCTL_GET_VERSION           TAP_CONTROL_CODE (2, METHOD_BUFFERED)
-#define TAP_IOCTL_GET_MTU               TAP_CONTROL_CODE (3, METHOD_BUFFERED)
-#define TAP_IOCTL_GET_INFO              TAP_CONTROL_CODE (4, METHOD_BUFFERED)
-#define TAP_IOCTL_CONFIG_POINT_TO_POINT TAP_CONTROL_CODE (5, METHOD_BUFFERED)
-#define TAP_IOCTL_SET_MEDIA_STATUS      TAP_CONTROL_CODE (6, METHOD_BUFFERED)
-#define TAP_IOCTL_CONFIG_DHCP_MASQ      TAP_CONTROL_CODE (7, METHOD_BUFFERED)
-#define TAP_IOCTL_GET_LOG_LINE          TAP_CONTROL_CODE (8, METHOD_BUFFERED)
-#define TAP_IOCTL_CONFIG_DHCP_SET_OPT   TAP_CONTROL_CODE (9, METHOD_BUFFERED)
+#define TAP_CONTROL_CODE(request, method) \
+  CTL_CODE(FILE_DEVICE_UNKNOWN, request, method, FILE_ANY_ACCESS)
+
+#define TAP_IOCTL_GET_MAC               TAP_CONTROL_CODE(1, METHOD_BUFFERED)
+#define TAP_IOCTL_GET_VERSION           TAP_CONTROL_CODE(2, METHOD_BUFFERED)
+#define TAP_IOCTL_GET_MTU               TAP_CONTROL_CODE(3, METHOD_BUFFERED)
+#define TAP_IOCTL_GET_INFO              TAP_CONTROL_CODE(4, METHOD_BUFFERED)
+#define TAP_IOCTL_CONFIG_POINT_TO_POINT TAP_CONTROL_CODE(5, METHOD_BUFFERED)
+#define TAP_IOCTL_SET_MEDIA_STATUS      TAP_CONTROL_CODE(6, METHOD_BUFFERED)
+#define TAP_IOCTL_CONFIG_DHCP_MASQ      TAP_CONTROL_CODE(7, METHOD_BUFFERED)
+#define TAP_IOCTL_GET_LOG_LINE          TAP_CONTROL_CODE(8, METHOD_BUFFERED)
+#define TAP_IOCTL_CONFIG_DHCP_SET_OPT   TAP_CONTROL_CODE(9, METHOD_BUFFERED)
 
 //=================
 // Registry keys
@@ -92,7 +92,7 @@
  * structure. See the function, tap_win32_free_buffer.
  */
 typedef struct tun_buffer_s {
-    unsigned char buffer [TUN_BUFFER_SIZE];
+    unsigned char buffer[TUN_BUFFER_SIZE];
     unsigned long read_size;
     struct tun_buffer_s* next;
 } tun_buffer_t;
@@ -155,7 +155,7 @@ static tun_buffer_t* get_buffer_from_output_queue(tap_win32_overlapped_t* const
             buffer = overlapped->output_queue_front;
             overlapped->output_queue_front = buffer->next;
 
-            if(overlapped->output_queue_front == NULL) {
+            if (overlapped->output_queue_front == NULL) {
                 overlapped->output_queue_back = NULL;
             }
 
@@ -171,7 +171,7 @@ static tun_buffer_t* get_buffer_from_output_queue(tap_win32_overlapped_t* const
     return buffer;
 }
 
-static tun_buffer_t* get_buffer_from_output_queue_immediate (tap_win32_overlapped_t* const overlapped)
+static tun_buffer_t* get_buffer_from_output_queue_immediate(tap_win32_overlapped_t* const overlapped)
 {
     return get_buffer_from_output_queue(overlapped, 0);
 }
@@ -180,7 +180,7 @@ static void put_buffer_on_output_queue(tap_win32_overlapped_t* const overlapped,
 {
     EnterCriticalSection(&overlapped->output_queue_cs);
 
-    if(overlapped->output_queue_front == NULL && overlapped->output_queue_back == NULL) {
+    if (overlapped->output_queue_front == NULL && overlapped->output_queue_back == NULL) {
         overlapped->output_queue_front = overlapped->output_queue_back = buffer;
     } else {
         buffer->next = NULL;
@@ -222,7 +222,7 @@ static int is_tap_win32_dev(const char *guid)
         char net_cfg_instance_id[256];
         DWORD data_type;
 
-        len = sizeof (enum_name);
+        len = sizeof(enum_name);
         status = RegEnumKeyEx(
             netcard_key,
             i,
@@ -239,7 +239,7 @@ static int is_tap_win32_dev(const char *guid)
             return FALSE;
         }
 
-        snprintf (unit_string, sizeof(unit_string), "%s\\%s",
+        snprintf(unit_string, sizeof(unit_string), "%s\\%s",
                   ADAPTER_KEY, enum_name);
 
         status = RegOpenKeyEx(
@@ -252,7 +252,7 @@ static int is_tap_win32_dev(const char *guid)
         if (status != ERROR_SUCCESS) {
             return FALSE;
         } else {
-            len = sizeof (component_id);
+            len = sizeof(component_id);
             status = RegQueryValueEx(
                 unit_key,
                 component_id_string,
@@ -262,7 +262,7 @@ static int is_tap_win32_dev(const char *guid)
                 &len);
 
             if (!(status != ERROR_SUCCESS || data_type != REG_SZ)) {
-                len = sizeof (net_cfg_instance_id);
+                len = sizeof(net_cfg_instance_id);
                 status = RegQueryValueEx(
                     unit_key,
                     net_cfg_instance_id_string,
@@ -273,7 +273,7 @@ static int is_tap_win32_dev(const char *guid)
 
                 if (status == ERROR_SUCCESS && data_type == REG_SZ) {
                     if (/* !strcmp (component_id, TAP_COMPONENT_ID) &&*/
-                        !strcmp (net_cfg_instance_id, guid)) {
+                        !strcmp(net_cfg_instance_id, guid)) {
                         RegCloseKey (unit_key);
                         RegCloseKey (netcard_key);
                         return TRUE;
@@ -321,7 +321,7 @@ static int get_device_guid(
         DWORD name_type;
         const char name_string[] = "Name";
 
-        len = sizeof (enum_name);
+        len = sizeof(enum_name);
         status = RegEnumKeyEx(
             control_net_key,
             i,
@@ -351,7 +351,7 @@ static int get_device_guid(
             &connection_key);
 
         if (status == ERROR_SUCCESS) {
-            len = sizeof (name_data);
+            len = sizeof(name_data);
             status = RegQueryValueEx(
                 connection_key,
                 name_string,
@@ -401,8 +401,8 @@ static int tap_win32_set_status(HANDLE handle, int status)
     unsigned long len = 0;
 
     return DeviceIoControl(handle, TAP_IOCTL_SET_MEDIA_STATUS,
-                &status, sizeof (status),
-                &status, sizeof (status), &len, NULL);
+                &status, sizeof(status),
+                &status, sizeof(status), &len, NULL);
 }
 
 static void tap_win32_overlapped_init(tap_win32_overlapped_t* const overlapped, const HANDLE handle)
@@ -429,7 +429,7 @@ static void tap_win32_overlapped_init(tap_win32_overlapped_t* const overlapped,
         TUN_MAX_BUFFER_COUNT,   // maximum count
         NULL);  // unnamed semaphore
 
-    if(!overlapped->output_queue_semaphore)  {
+    if (!overlapped->output_queue_semaphore) {
         fprintf(stderr, "error creating output queue semaphore!\n");
     }
 
@@ -439,7 +439,7 @@ static void tap_win32_overlapped_init(tap_win32_overlapped_t* const overlapped,
         TUN_MAX_BUFFER_COUNT,   // maximum count
         NULL);  // unnamed semaphore
 
-    if(!overlapped->free_list_semaphore)  {
+    if (!overlapped->free_list_semaphore) {
         fprintf(stderr, "error creating free list semaphore!\n");
     }
 
@@ -447,7 +447,7 @@ static void tap_win32_overlapped_init(tap_win32_overlapped_t* const overlapped,
 
     {
         unsigned index;
-        for(index = 0; index < TUN_MAX_BUFFER_COUNT; index++) {
+        for (index = 0; index < TUN_MAX_BUFFER_COUNT; index++) {
             tun_buffer_t* element = &overlapped->buffers[index];
             element->next = overlapped->free_list;
             overlapped->free_list = element;
@@ -455,7 +455,7 @@ static void tap_win32_overlapped_init(tap_win32_overlapped_t* const overlapped,
     }
     /* To count buffers, initially no-signal. */
     overlapped->tap_semaphore = CreateSemaphore(NULL, 0, TUN_MAX_BUFFER_COUNT, NULL);
-    if(!overlapped->tap_semaphore)
+    if (!overlapped->tap_semaphore)
         fprintf(stderr, "error creating tap_semaphore.\n");
 }
 
@@ -467,7 +467,7 @@ static int tap_win32_write(tap_win32_overlapped_t *overlapped,
     DWORD error;
 
 #ifdef TUN_ASYNCHRONOUS_WRITES
-    result = GetOverlappedResult( overlapped->handle, &overlapped->write_overlapped,
+    result = GetOverlappedResult(overlapped->handle, &overlapped->write_overlapped,
                                   &write_size, FALSE);
 
     if (!result && GetLastError() == ERROR_IO_INCOMPLETE)
@@ -500,7 +500,7 @@ static int tap_win32_write(tap_win32_overlapped_t *overlapped,
 #ifdef DEBUG_TAP_WIN32
         LPTSTR msgbuf;
         error = GetLastError();
-        FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER|FORMAT_MESSAGE_FROM_SYSTEM,
+        FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
                       NULL, error, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                       &msgbuf, 0, NULL);
         fprintf(stderr, "Tap-Win32: Error WriteFile %d - %s\n", error, msgbuf);
@@ -531,32 +531,32 @@ static DWORD WINAPI tap_win32_thread_entry(LPVOID param)
             dwError = GetLastError();
             if (dwError == ERROR_IO_PENDING) {
                 WaitForSingleObject(overlapped->read_event, INFINITE);
-                result = GetOverlappedResult( overlapped->handle, &overlapped->read_overlapped,
+                result = GetOverlappedResult(overlapped->handle, &overlapped->read_overlapped,
                                               &read_size, FALSE);
                 if (!result) {
 #ifdef DEBUG_TAP_WIN32
                     LPVOID lpBuffer;
                     dwError = GetLastError();
-                    FormatMessage( FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
+                    FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
                                    NULL, dwError, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
-                                   (LPTSTR) & lpBuffer, 0, NULL );
+                                   (LPTSTR) &lpBuffer, 0, NULL);
                     fprintf(stderr, "Tap-Win32: Error GetOverlappedResult %d - %s\n", dwError, lpBuffer);
-                    LocalFree( lpBuffer );
+                    LocalFree(lpBuffer);
 #endif
                 }
             } else {
 #ifdef DEBUG_TAP_WIN32
                 LPVOID lpBuffer;
-                FormatMessage( FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
+                FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
                                NULL, dwError, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
-                               (LPTSTR) & lpBuffer, 0, NULL );
+                               (LPTSTR) &lpBuffer, 0, NULL);
                 fprintf(stderr, "Tap-Win32: Error ReadFile %d - %s\n", dwError, lpBuffer);
-                LocalFree( lpBuffer );
+                LocalFree(lpBuffer);
 #endif
             }
         }
 
-        if(read_size > 0) {
+        if (read_size > 0) {
             buffer->read_size = read_size;
             put_buffer_on_output_queue(overlapped, buffer);
             ReleaseSemaphore(overlapped->tap_semaphore, 1, NULL);
@@ -574,10 +574,10 @@ static int tap_win32_read(tap_win32_overlapped_t *overlapped,
 
     tun_buffer_t* buffer = get_buffer_from_output_queue_immediate(overlapped);
 
-    if(buffer != NULL) {
+    if (buffer != NULL) {
         *pbuf = buffer->buffer;
         size = (int)buffer->read_size;
-        if(size > max_size) {
+        if (size > max_size) {
             size = max_size;
         }
     }
@@ -617,7 +617,7 @@ static int tap_win32_open(tap_win32_overlapped_t **phandle,
     if (rc)
         return -1;
 
-    snprintf (device_path, sizeof(device_path), "%s%s%s",
+    snprintf(device_path, sizeof(device_path), "%s%s%s",
               USERMODEDEVICEDIR,
               device_guid,
               TAPSUFFIX);
@@ -629,15 +629,15 @@ static int tap_win32_open(tap_win32_overlapped_t **phandle,
         0,
         OPEN_EXISTING,
         FILE_ATTRIBUTE_SYSTEM | FILE_FLAG_OVERLAPPED,
-        0 );
+        0);
 
     if (handle == INVALID_HANDLE_VALUE) {
         return -1;
     }
 
     bret = DeviceIoControl(handle, TAP_IOCTL_GET_VERSION,
-                           &version, sizeof (version),
-                           &version, sizeof (version), &version_len, NULL);
+                           &version, sizeof(version),
+                           &version, sizeof(version), &version_len, NULL);
 
     if (bret == FALSE) {
         CloseHandle(handle);
diff --git a/net/vde.c b/net/vde.c
index 99189cccb6..0b06464f4d 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -92,7 +92,7 @@ static int net_vde_init(NetClientState *peer, const char *model,
     };
 
     vde = vde_open(init_sock, (char *)"QEMU", &args);
-    if (!vde){
+    if (!vde) {
         error_setg_errno(errp, errno, "Could not open vde");
         return -1;
     }
diff --git a/net/vhost-user.c b/net/vhost-user.c
index ffbd94d944..1cf1af1ab9 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -235,7 +235,7 @@ static void chr_closed_bh(void *opaque)
 
     s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
 
-    for (i = queues -1; i >= 0; i--) {
+    for (i = queues - 1; i >= 0; i--) {
         s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
 
         if (s->vhost_net) {
-- 
2.29.1.59.gf9b6481aed


