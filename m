Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0ED2E0B51
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 15:03:43 +0100 (CET)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriGM-0001Si-IP
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 09:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBb-0001oO-T9; Tue, 22 Dec 2020 03:38:27 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBY-0002kF-79; Tue, 22 Dec 2020 03:38:27 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0V7y6XQdz7Jcl;
 Tue, 22 Dec 2020 16:37:18 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:52 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
Subject: [PATCH 2/9] net: Add braces for statements/fix braces' position
Date: Tue, 22 Dec 2020 16:23:33 +0800
Message-ID: <20201222082340.67405-3-zhanghan64@huawei.com>
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

Fix problems about braces:
-braces are necessary for all arms of if/for/while statements
-open brace { should follow if/for/while statements on the same line
-else should follow close brace '}'

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 net/checksum.c    |  3 ++-
 net/net.c         | 24 ++++++++++++++++--------
 net/queue.c       |  3 ++-
 net/slirp.c       |  6 ++++--
 net/socket.c      |  9 ++++++---
 net/tap-bsd.c     |  3 +--
 net/tap-linux.c   | 20 +++++++++++++-------
 net/tap-solaris.c | 37 ++++++++++++++++++++++++-------------
 net/tap-win32.c   | 33 ++++++++++++++++-----------------
 9 files changed, 84 insertions(+), 54 deletions(-)

diff --git a/net/checksum.c b/net/checksum.c
index f65ac3ea9f..b78bf15098 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -41,8 +41,9 @@ uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq)
 
 uint16_t net_checksum_finish(uint32_t sum)
 {
-    while (sum >> 16)
+    while (sum >> 16) {
         sum = (sum & 0xFFFF) + (sum >> 16);
+    }
     return ~sum;
 }
 
diff --git a/net/net.c b/net/net.c
index a835759266..626f1fe99a 100644
--- a/net/net.c
+++ b/net/net.c
@@ -794,8 +794,9 @@ NetClientState *qemu_find_netdev(const char *id)
     NetClientState *nc;
 
     QTAILQ_FOREACH(nc, &net_clients, next) {
-        if (nc->info->type == NET_CLIENT_DRIVER_NIC)
+        if (nc->info->type == NET_CLIENT_DRIVER_NIC) {
             continue;
+        }
         if (!strcmp(nc->name, id)) {
             return nc;
         }
@@ -829,9 +830,11 @@ static int nic_get_free_idx(void)
 {
     int index;
 
-    for (index = 0; index < MAX_NICS; index++)
-        if (!nd_table[index].used)
+    for (index = 0; index < MAX_NICS; index++) {
+        if (!nd_table[index].used) {
             return index;
+        }
+    }
     return -1;
 }
 
@@ -857,10 +860,12 @@ void qemu_check_nic_model(NICInfo *nd, const char *model)
     models[0] = model;
     models[1] = NULL;
 
-    if (qemu_show_nic_models(nd->model, models))
+    if (qemu_show_nic_models(nd->model, models)) {
         exit(0);
-    if (qemu_find_nic_model(nd, models, model) < 0)
+    }
+    if (qemu_find_nic_model(nd, models, model) < 0) {
         exit(1);
+    }
 }
 
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
@@ -868,12 +873,14 @@ int qemu_find_nic_model(NICInfo *nd, const char * const *models,
 {
     int i;
 
-    if (!nd->model)
+    if (!nd->model) {
         nd->model = g_strdup(default_model);
+    }
 
     for (i = 0 ; models[i]; i++) {
-        if (strcmp(nd->model, models[i]) == 0)
+        if (strcmp(nd->model, models[i]) == 0) {
             return i;
+        }
     }
 
     error_report("Unsupported NIC model: %s", nd->model);
@@ -1219,8 +1226,9 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
         /* only query information on queue 0 since the info is per nic,
          * not per queue
          */
-        if (nc->queue_index != 0)
+        if (nc->queue_index != 0) {
             continue;
+        }
 
         if (nc->info->query_rx_filter) {
             info = nc->info->query_rx_filter(nc);
diff --git a/net/queue.c b/net/queue.c
index fd0e4e66e1..6b19271e2d 100644
--- a/net/queue.c
+++ b/net/queue.c
@@ -250,8 +250,9 @@ void qemu_net_queue_purge(NetQueue *queue, NetClientState *from)
 
 bool qemu_net_queue_flush(NetQueue *queue)
 {
-    if (queue->delivering)
+    if (queue->delivering) {
         return false;
+    }
 
     while (!QTAILQ_EMPTY(&queue->packets)) {
         NetPacket *packet;
diff --git a/net/slirp.c b/net/slirp.c
index 77042e6df7..61a9e3071e 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -53,13 +53,15 @@ static int get_str_sep(char *buf, int buf_size, const char **pp, int sep)
     int len;
     p = *pp;
     p1 = strchr(p, sep);
-    if (!p1)
+    if (!p1) {
         return -1;
+    }
     len = p1 - p;
     p1++;
     if (buf_size > 0) {
-        if (len > buf_size - 1)
+        if (len > buf_size - 1) {
             len = buf_size - 1;
+        }
         memcpy(buf, p, len);
         buf[len] = '\0';
     }
diff --git a/net/socket.c b/net/socket.c
index 282264bbcb..61671e41e3 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -165,8 +165,9 @@ static void net_socket_send(void *opaque)
 
     size = qemu_recv(s->fd, buf1, sizeof(buf1), 0);
     if (size < 0) {
-        if (errno != EWOULDBLOCK)
+        if (errno != EWOULDBLOCK) {
             goto eoc;
+        }
     } else if (size == 0) {
         /* end of connection */
     eoc:
@@ -199,8 +200,9 @@ static void net_socket_send_dgram(void *opaque)
     int size;
 
     size = qemu_recv(s->fd, s->rs.buf, sizeof(s->rs.buf), 0);
-    if (size < 0)
+    if (size < 0) {
         return;
+    }
     if (size == 0) {
         /* end of connection */
         net_socket_read_poll(s, false);
@@ -301,8 +303,9 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
     qemu_set_nonblock(fd);
     return fd;
 fail:
-    if (fd >= 0)
+    if (fd >= 0) {
         closesocket(fd);
+    }
     return -1;
 }
 
diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 77aaf674b1..dc8f9c8658 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -68,8 +68,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
         TFR(fd = open(dname, O_RDWR));
         if (fd >= 0) {
             break;
-        }
-        else if (errno == ENXIO || errno == ENOENT) {
+        } else if (errno == ENXIO || errno == ENOENT) {
             break;
         }
         if (*ifname) {
diff --git a/net/tap-linux.c b/net/tap-linux.c
index b0635e9e32..6aff7023a6 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -97,10 +97,11 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
         }
     }
 
-    if (ifname[0] != '\0')
+    if (ifname[0] != '\0') {
         pstrcpy(ifr.ifr_name, IFNAMSIZ, ifname);
-    else
+    } else {
         pstrcpy(ifr.ifr_name, IFNAMSIZ, "tap%d");
+    }
     ret = ioctl(fd, TUNSETIFF, (void *) &ifr);
     if (ret != 0) {
         if (ifname[0] != '\0') {
@@ -167,8 +168,9 @@ int tap_probe_has_ufo(int fd)
 
     offload = TUN_F_CSUM | TUN_F_UFO;
 
-    if (ioctl(fd, TUNSETOFFLOAD, offload) < 0)
+    if (ioctl(fd, TUNSETOFFLOAD, offload) < 0) {
         return 0;
+    }
 
     return 1;
 }
@@ -248,14 +250,18 @@ void tap_fd_set_offload(int fd, int csum, int tso4,
 
     if (csum) {
         offload |= TUN_F_CSUM;
-        if (tso4)
+        if (tso4) {
             offload |= TUN_F_TSO4;
-        if (tso6)
+        }
+        if (tso6) {
             offload |= TUN_F_TSO6;
-        if ((tso4 || tso6) && ecn)
+        }
+        if ((tso4 || tso6) && ecn) {
             offload |= TUN_F_TSO_ECN;
-        if (ufo)
+        }
+        if (ufo) {
             offload |= TUN_F_UFO;
+        }
     }
 
     if (ioctl(fd, TUNSETOFFLOAD, offload) != 0) {
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index dcfe92bf17..1c8d5f7982 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -77,13 +77,16 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
 
     if (*dev) {
        ptr = dev;
-       while (*ptr && !qemu_isdigit((int)*ptr)) ptr++;
+       while (*ptr && !qemu_isdigit((int)*ptr)) {
+           ptr++;
+       }
        ppa = atoi(ptr);
     }
 
     /* Check if IP device was opened */
-    if (ip_fd)
+    if (ip_fd) {
        close(ip_fd);
+    }
 
     TFR(ip_fd = open("/dev/udp", O_RDWR, 0));
     if (ip_fd < 0) {
@@ -102,8 +105,9 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     strioc_ppa.ic_timout = 0;
     strioc_ppa.ic_len = sizeof(ppa);
     strioc_ppa.ic_dp = (char *)&ppa;
-    if ((ppa = ioctl(tap_fd, I_STR, &strioc_ppa)) < 0)
+    if ((ppa = ioctl(tap_fd, I_STR, &strioc_ppa)) < 0) {
         error_report("Can't assign new interface");
+    }
 
     TFR(if_fd = open("/dev/tap", O_RDWR, 0));
     if (if_fd < 0) {
@@ -115,8 +119,9 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
         return -1;
     }
 
-    if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) < 0)
+    if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) < 0) {
         error_report("Can't get flags");
+    }
 
     snprintf(actual_name, 32, "tap%d", ppa);
     pstrcpy(ifr.lifr_name, sizeof(ifr.lifr_name), actual_name);
@@ -124,23 +129,29 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     ifr.lifr_ppa = ppa;
     /* Assign ppa according to the unit number returned by tun device */
 
-    if (ioctl(if_fd, SIOCSLIFNAME, &ifr) < 0)
+    if (ioctl(if_fd, SIOCSLIFNAME, &ifr) < 0) {
         error_report("Can't set PPA %d", ppa);
-    if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) < 0)
+    }
+    if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) < 0) {
         error_report("Can't get flags");
+    }
     /* Push arp module to if_fd */
-    if (ioctl(if_fd, I_PUSH, "arp") < 0)
+    if (ioctl(if_fd, I_PUSH, "arp") < 0) {
         error_report("Can't push ARP module (2)");
+    }
 
     /* Push arp module to ip_fd */
-    if (ioctl(ip_fd, I_POP, NULL) < 0)
+    if (ioctl(ip_fd, I_POP, NULL) < 0) {
         error_report("I_POP failed");
-    if (ioctl(ip_fd, I_PUSH, "arp") < 0)
+    }
+    if (ioctl(ip_fd, I_PUSH, "arp") < 0) {
         error_report("Can't push ARP module (3)");
+    }
     /* Open arp_fd */
     TFR(arp_fd = open("/dev/tap", O_RDWR, 0));
-    if (arp_fd < 0)
+    if (arp_fd < 0) {
         error_report("Can't open %s", "/dev/tap");
+    }
 
     /* Set ifname to arp */
     strioc_if.ic_cmd = SIOCSLIFNAME;
@@ -156,8 +167,9 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
         return -1;
     }
 
-    if ((arp_muxid = ioctl(ip_fd, link_type, arp_fd)) < 0)
+    if ((arp_muxid = ioctl(ip_fd, link_type, arp_fd)) < 0) {
         error_report("Can't link TAP device to ARP");
+    }
 
     close(if_fd);
 
@@ -166,8 +178,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     ifr.lifr_ip_muxid  = ip_muxid;
     ifr.lifr_arp_muxid = arp_muxid;
 
-    if (ioctl(ip_fd, SIOCSLIFMUXID, &ifr) < 0)
-    {
+    if (ioctl(ip_fd, SIOCSLIFMUXID, &ifr) < 0) {
       ioctl(ip_fd, I_PUNLINK , arp_muxid);
       ioctl(ip_fd, I_PUNLINK, ip_muxid);
       error_report("Can't set multiplexor id");
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 2c8fc9c36b..0a5252ab55 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -70,7 +70,6 @@
 #define USERMODEDEVICEDIR "\\\\.\\Global\\"
 #define TAPSUFFIX         ".tap"
 
-
 //======================
 // Compile time configuration
 //======================
@@ -146,8 +145,7 @@ static tun_buffer_t* get_buffer_from_output_queue(tap_win32_overlapped_t* const
     // Non-blocking call
     result = WaitForSingleObject(overlapped->output_queue_semaphore, timeout);
 
-    switch (result)
-    {
+    switch (result) {
         // The semaphore object was signaled.
         case WAIT_OBJECT_0:
             EnterCriticalSection(&overlapped->output_queue_cs);
@@ -233,9 +231,9 @@ static int is_tap_win32_dev(const char *guid)
             NULL,
             NULL);
 
-        if (status == ERROR_NO_MORE_ITEMS)
+        if (status == ERROR_NO_MORE_ITEMS) {
             break;
-        else if (status != ERROR_SUCCESS) {
+        } else if (status != ERROR_SUCCESS) {
             return FALSE;
         }
 
@@ -312,8 +310,7 @@ static int get_device_guid(
         return -1;
     }
 
-    while (!stop)
-    {
+    while (!stop) {
         char enum_name[256];
         char connection_string[256];
         HKEY connection_key;
@@ -332,9 +329,9 @@ static int get_device_guid(
             NULL,
             NULL);
 
-        if (status == ERROR_NO_MORE_ITEMS)
+        if (status == ERROR_NO_MORE_ITEMS) {
             break;
-        else if (status != ERROR_SUCCESS) {
+        } else if (status != ERROR_SUCCESS) {
             return -1;
         }
 
@@ -363,8 +360,7 @@ static int get_device_guid(
             if (status != ERROR_SUCCESS || name_type != REG_SZ) {
                 ++i;
                 continue;
-            }
-            else {
+            } else {
                 if (is_tap_win32_dev(enum_name)) {
                     snprintf(name, name_size, "%s", enum_name);
                     if (actual_name) {
@@ -374,8 +370,7 @@ static int get_device_guid(
                                 ++i;
                                 continue;
                             }
-                        }
-                        else {
+                        } else {
                             snprintf(actual_name, actual_name_size, "%s", name_data);
                         }
                     }
@@ -390,8 +385,9 @@ static int get_device_guid(
 
     RegCloseKey (control_net_key);
 
-    if (stop == 0)
+    if (stop == 0) {
         return -1;
+    }
 
     return 0;
 }
@@ -455,8 +451,9 @@ static void tap_win32_overlapped_init(tap_win32_overlapped_t* const overlapped,
     }
     /* To count buffers, initially no-signal. */
     overlapped->tap_semaphore = CreateSemaphore(NULL, 0, TUN_MAX_BUFFER_COUNT, NULL);
-    if (!overlapped->tap_semaphore)
+    if (!overlapped->tap_semaphore) {
         fprintf(stderr, "error creating tap_semaphore.\n");
+    }
 }
 
 static int tap_win32_write(tap_win32_overlapped_t *overlapped,
@@ -470,8 +467,9 @@ static int tap_win32_write(tap_win32_overlapped_t *overlapped,
     result = GetOverlappedResult(overlapped->handle, &overlapped->write_overlapped,
                                   &write_size, FALSE);
 
-    if (!result && GetLastError() == ERROR_IO_INCOMPLETE)
+    if (!result && GetLastError() == ERROR_IO_INCOMPLETE) {
         WaitForSingleObject(overlapped->write_event, INFINITE);
+    }
 #endif
 
     result = WriteFile(overlapped->handle, buffer, size,
@@ -614,8 +612,9 @@ static int tap_win32_open(tap_win32_overlapped_t **phandle,
     }
 
     rc = get_device_guid(device_guid, sizeof(device_guid), name_buffer, sizeof(name_buffer));
-    if (rc)
+    if (rc) {
         return -1;
+    }
 
     snprintf(device_path, sizeof(device_path), "%s%s%s",
               USERMODEDEVICEDIR,
-- 
2.29.1.59.gf9b6481aed


