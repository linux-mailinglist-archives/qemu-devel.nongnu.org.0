Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6AC2E0B4E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 15:03:36 +0100 (CET)
Received: from localhost ([::1]:48292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriGF-00019k-Fm
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 09:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBX-0001kM-Jb; Tue, 22 Dec 2020 03:38:23 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBS-0002cY-1z; Tue, 22 Dec 2020 03:38:23 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0V7y50Lmz7JYl;
 Tue, 22 Dec 2020 16:37:18 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:52 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
Subject: [PATCH 3/9] net: Transfer // comments to /**/
Date: Tue, 22 Dec 2020 16:23:34 +0800
Message-ID: <20201222082340.67405-4-zhanghan64@huawei.com>
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

Do not use C99 // comments, thransfer // to /**/

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 net/checksum.c    |  6 ++---
 net/tap-solaris.c |  2 +-
 net/tap-win32.c   | 60 +++++++++++++++++++++++++++--------------------
 3 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/net/checksum.c b/net/checksum.c
index b78bf15098..eb2eff5fa4 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -52,9 +52,9 @@ uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
 {
     uint32_t sum = 0;
 
-    sum += net_checksum_add(length, buf);         // payload
-    sum += net_checksum_add(8, addrs);            // src + dst address
-    sum += proto + length;                        // protocol & length
+    sum += net_checksum_add(length, buf);         /* payload */
+    sum += net_checksum_add(8, addrs);            /* src + dst address */
+    sum += proto + length;                        /* protocol & length */
     return net_checksum_finish(sum);
 }
 
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index 1c8d5f7982..a0a5456ab6 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -35,7 +35,7 @@
 #include <netinet/in.h>
 #include <netinet/in_systm.h>
 #include <netinet/ip.h>
-#include <netinet/ip_icmp.h> // must come after ip.h
+#include <netinet/ip_icmp.h> /* must come after ip.h */
 #include <netinet/udp.h>
 #include <netinet/tcp.h>
 #include <net/if.h>
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 0a5252ab55..0f0d95cdbb 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -38,9 +38,11 @@
 #include <windows.h>
 #include <winioctl.h>
 
-//=============
-// TAP IOCTLs
-//=============
+/*
+ * =============
+ * TAP IOCTLs
+ * =============
+ */
 
 #define TAP_CONTROL_CODE(request, method) \
   CTL_CODE(FILE_DEVICE_UNKNOWN, request, method, FILE_ANY_ACCESS)
@@ -55,26 +57,32 @@
 #define TAP_IOCTL_GET_LOG_LINE          TAP_CONTROL_CODE(8, METHOD_BUFFERED)
 #define TAP_IOCTL_CONFIG_DHCP_SET_OPT   TAP_CONTROL_CODE(9, METHOD_BUFFERED)
 
-//=================
-// Registry keys
-//=================
+/*
+ * =================
+ * Registry keys
+ * =================
+ */
 
 #define ADAPTER_KEY "SYSTEM\\CurrentControlSet\\Control\\Class\\{4D36E972-E325-11CE-BFC1-08002BE10318}"
 
 #define NETWORK_CONNECTIONS_KEY "SYSTEM\\CurrentControlSet\\Control\\Network\\{4D36E972-E325-11CE-BFC1-08002BE10318}"
 
-//======================
-// Filesystem prefixes
-//======================
+/*
+ * ======================
+ * Filesystem prefixes
+ * ======================
+ */
 
 #define USERMODEDEVICEDIR "\\\\.\\Global\\"
 #define TAPSUFFIX         ".tap"
 
-//======================
-// Compile time configuration
-//======================
+/*
+ * ======================
+ * Compile time configuration
+ * ======================
+ */
 
-//#define DEBUG_TAP_WIN32
+/* #define DEBUG_TAP_WIN32 */
 
 /* FIXME: The asynch write path appears to be broken at
  * present. WriteFile() ignores the lpNumberOfBytesWritten parameter
@@ -121,7 +129,7 @@ static tun_buffer_t* get_buffer_from_free_list(tap_win32_overlapped_t* const ove
     WaitForSingleObject(overlapped->free_list_semaphore, INFINITE);
     EnterCriticalSection(&overlapped->free_list_cs);
     buffer = overlapped->free_list;
-//    assert(buffer != NULL);
+    /* assert(buffer != NULL); */
     overlapped->free_list = buffer->next;
     LeaveCriticalSection(&overlapped->free_list_cs);
     buffer->next = NULL;
@@ -142,11 +150,11 @@ static tun_buffer_t* get_buffer_from_output_queue(tap_win32_overlapped_t* const
     tun_buffer_t* buffer = NULL;
     DWORD result, timeout = block ? INFINITE : 0L;
 
-    // Non-blocking call
+    /* Non-blocking call */
     result = WaitForSingleObject(overlapped->output_queue_semaphore, timeout);
 
     switch (result) {
-        // The semaphore object was signaled.
+        /* The semaphore object was signaled. */
         case WAIT_OBJECT_0:
             EnterCriticalSection(&overlapped->output_queue_cs);
 
@@ -160,9 +168,9 @@ static tun_buffer_t* get_buffer_from_output_queue(tap_win32_overlapped_t* const
             LeaveCriticalSection(&overlapped->output_queue_cs);
             break;
 
-        // Semaphore was nonsignaled, so a time-out occurred.
+        /* Semaphore was nonsignaled, so a time-out occurred. */
         case WAIT_TIMEOUT:
-            // Cannot open another window.
+            /* Cannot open another window. */
             break;
     }
 
@@ -420,20 +428,20 @@ static void tap_win32_overlapped_init(tap_win32_overlapped_t* const overlapped,
     InitializeCriticalSection(&overlapped->free_list_cs);
 
     overlapped->output_queue_semaphore = CreateSemaphore(
-        NULL,   // default security attributes
-        0,   // initial count
-        TUN_MAX_BUFFER_COUNT,   // maximum count
-        NULL);  // unnamed semaphore
+        NULL,   /* default security attributes */
+        0,   /* initial count */
+        TUN_MAX_BUFFER_COUNT,   /* maximum count */
+        NULL);  /* unnamed semaphore */
 
     if (!overlapped->output_queue_semaphore) {
         fprintf(stderr, "error creating output queue semaphore!\n");
     }
 
     overlapped->free_list_semaphore = CreateSemaphore(
-        NULL,   // default security attributes
-        TUN_MAX_BUFFER_COUNT,   // initial count
-        TUN_MAX_BUFFER_COUNT,   // maximum count
-        NULL);  // unnamed semaphore
+        NULL,   /* default security attributes */
+        TUN_MAX_BUFFER_COUNT,   /* initial count */
+        TUN_MAX_BUFFER_COUNT,   /* maximum count */
+        NULL);  /* unnamed semaphore */
 
     if (!overlapped->free_list_semaphore) {
         fprintf(stderr, "error creating free list semaphore!\n");
-- 
2.29.1.59.gf9b6481aed


