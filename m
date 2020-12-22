Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C62E0B42
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 15:00:32 +0100 (CET)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriDH-00062s-23
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 09:00:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBT-0001i7-Lx; Tue, 22 Dec 2020 03:38:19 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBR-0002cW-4D; Tue, 22 Dec 2020 03:38:19 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0V7y5R6rz7JcV;
 Tue, 22 Dec 2020 16:37:18 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:53 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
Subject: [PATCH 4/9] net: Transfer "foo* " to "foo *"
Date: Tue, 22 Dec 2020 16:23:35 +0800
Message-ID: <20201222082340.67405-5-zhanghan64@huawei.com>
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
X-Mailman-Approved-At: Tue, 22 Dec 2020 08:55:38 -0500
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

Fix style problems about "foo*"
-"foo* bar" should be "foo *bar".
-"foo* const bar" should be "foo * const bar".
-"(foo*)" should be "(foo *)"

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 net/slirp.c     |  2 +-
 net/tap-win32.c | 34 +++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index 61a9e3071e..772b3c35f2 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -809,7 +809,7 @@ static void slirp_smb_cleanup(SlirpState *s)
     }
 }
 
-static int slirp_smb(SlirpState* s, const char *exported_dir,
+static int slirp_smb(SlirpState *s, const char *exported_dir,
                      struct in_addr vserver_addr, Error **errp)
 {
     char *smb_conf;
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 0f0d95cdbb..ac139e9ec9 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -101,7 +101,7 @@
 typedef struct tun_buffer_s {
     unsigned char buffer[TUN_BUFFER_SIZE];
     unsigned long read_size;
-    struct tun_buffer_s* next;
+    struct tun_buffer_s *next;
 } tun_buffer_t;
 
 typedef struct tap_win32_overlapped {
@@ -116,16 +116,16 @@ typedef struct tap_win32_overlapped {
     OVERLAPPED read_overlapped;
     OVERLAPPED write_overlapped;
     tun_buffer_t buffers[TUN_MAX_BUFFER_COUNT];
-    tun_buffer_t* free_list;
-    tun_buffer_t* output_queue_front;
-    tun_buffer_t* output_queue_back;
+    tun_buffer_t *free_list;
+    tun_buffer_t *output_queue_front;
+    tun_buffer_t *output_queue_back;
 } tap_win32_overlapped_t;
 
 static tap_win32_overlapped_t tap_overlapped;
 
-static tun_buffer_t* get_buffer_from_free_list(tap_win32_overlapped_t* const overlapped)
+static tun_buffer_t *get_buffer_from_free_list(tap_win32_overlapped_t *const overlapped)
 {
-    tun_buffer_t* buffer = NULL;
+    tun_buffer_t *buffer = NULL;
     WaitForSingleObject(overlapped->free_list_semaphore, INFINITE);
     EnterCriticalSection(&overlapped->free_list_cs);
     buffer = overlapped->free_list;
@@ -136,7 +136,7 @@ static tun_buffer_t* get_buffer_from_free_list(tap_win32_overlapped_t* const ove
     return buffer;
 }
 
-static void put_buffer_on_free_list(tap_win32_overlapped_t* const overlapped, tun_buffer_t* const buffer)
+static void put_buffer_on_free_list(tap_win32_overlapped_t *const overlapped, tun_buffer_t *const buffer)
 {
     EnterCriticalSection(&overlapped->free_list_cs);
     buffer->next = overlapped->free_list;
@@ -145,9 +145,9 @@ static void put_buffer_on_free_list(tap_win32_overlapped_t* const overlapped, tu
     ReleaseSemaphore(overlapped->free_list_semaphore, 1, NULL);
 }
 
-static tun_buffer_t* get_buffer_from_output_queue(tap_win32_overlapped_t* const overlapped, const int block)
+static tun_buffer_t *get_buffer_from_output_queue(tap_win32_overlapped_t *const overlapped, const int block)
 {
-    tun_buffer_t* buffer = NULL;
+    tun_buffer_t *buffer = NULL;
     DWORD result, timeout = block ? INFINITE : 0L;
 
     /* Non-blocking call */
@@ -177,12 +177,12 @@ static tun_buffer_t* get_buffer_from_output_queue(tap_win32_overlapped_t* const
     return buffer;
 }
 
-static tun_buffer_t* get_buffer_from_output_queue_immediate(tap_win32_overlapped_t* const overlapped)
+static tun_buffer_t *get_buffer_from_output_queue_immediate(tap_win32_overlapped_t *const overlapped)
 {
     return get_buffer_from_output_queue(overlapped, 0);
 }
 
-static void put_buffer_on_output_queue(tap_win32_overlapped_t* const overlapped, tun_buffer_t* const buffer)
+static void put_buffer_on_output_queue(tap_win32_overlapped_t *const overlapped, tun_buffer_t *const buffer)
 {
     EnterCriticalSection(&overlapped->output_queue_cs);
 
@@ -409,7 +409,7 @@ static int tap_win32_set_status(HANDLE handle, int status)
                 &status, sizeof(status), &len, NULL);
 }
 
-static void tap_win32_overlapped_init(tap_win32_overlapped_t* const overlapped, const HANDLE handle)
+static void tap_win32_overlapped_init(tap_win32_overlapped_t *const overlapped, const HANDLE handle)
 {
     overlapped->handle = handle;
 
@@ -452,7 +452,7 @@ static void tap_win32_overlapped_init(tap_win32_overlapped_t* const overlapped,
     {
         unsigned index;
         for (index = 0; index < TUN_MAX_BUFFER_COUNT; index++) {
-            tun_buffer_t* element = &overlapped->buffers[index];
+            tun_buffer_t *element = &overlapped->buffers[index];
             element->next = overlapped->free_list;
             overlapped->free_list = element;
         }
@@ -520,11 +520,11 @@ static int tap_win32_write(tap_win32_overlapped_t *overlapped,
 
 static DWORD WINAPI tap_win32_thread_entry(LPVOID param)
 {
-    tap_win32_overlapped_t *overlapped = (tap_win32_overlapped_t*)param;
+    tap_win32_overlapped_t *overlapped = (tap_win32_overlapped_t *)param;
     unsigned long read_size;
     BOOL result;
     DWORD dwError;
-    tun_buffer_t* buffer = get_buffer_from_free_list(overlapped);
+    tun_buffer_t *buffer = get_buffer_from_free_list(overlapped);
 
 
     for (;;) {
@@ -578,7 +578,7 @@ static int tap_win32_read(tap_win32_overlapped_t *overlapped,
 {
     int size = 0;
 
-    tun_buffer_t* buffer = get_buffer_from_output_queue_immediate(overlapped);
+    tun_buffer_t *buffer = get_buffer_from_output_queue_immediate(overlapped);
 
     if (buffer != NULL) {
         *pbuf = buffer->buffer;
@@ -594,7 +594,7 @@ static int tap_win32_read(tap_win32_overlapped_t *overlapped,
 static void tap_win32_free_buffer(tap_win32_overlapped_t *overlapped,
                                   uint8_t *pbuf)
 {
-    tun_buffer_t* buffer = (tun_buffer_t*)pbuf;
+    tun_buffer_t *buffer = (tun_buffer_t *)pbuf;
     put_buffer_on_free_list(overlapped, buffer);
 }
 
-- 
2.29.1.59.gf9b6481aed


