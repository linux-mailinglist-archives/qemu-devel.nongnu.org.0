Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E630F2E0B3A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 14:58:16 +0100 (CET)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriB5-0002lZ-W1
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 08:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBT-0001i9-PR; Tue, 22 Dec 2020 03:38:19 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBR-0002dx-3p; Tue, 22 Dec 2020 03:38:19 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D0V7q1rf2zM7G1;
 Tue, 22 Dec 2020 16:37:11 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:55 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
Subject: [PATCH 9/9] net: Fix the indent problems
Date: Tue, 22 Dec 2020 16:23:40 +0800
Message-ID: <20201222082340.67405-10-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20201222082340.67405-1-zhanghan64@huawei.com>
References: <20201222082340.67405-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhanghan64@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Dec 2020 08:55:39 -0500
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

Fix Suspect code indent for statements

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 net/tap-solaris.c | 18 +++++++++---------
 net/tap-win32.c   | 28 ++++++++++++++--------------
 net/vde.c         |  2 +-
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index 0b4f709abc..fc1e796f70 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -76,16 +76,16 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     memset(&ifr, 0x0, sizeof(ifr));
 
     if (*dev) {
-       ptr = dev;
-       while (*ptr && !qemu_isdigit((int)*ptr)) {
-           ptr++;
-       }
-       ppa = atoi(ptr);
+        ptr = dev;
+        while (*ptr && !qemu_isdigit((int)*ptr)) {
+            ptr++;
+        }
+        ppa = atoi(ptr);
     }
 
     /* Check if IP device was opened */
     if (ip_fd) {
-       close(ip_fd);
+        close(ip_fd);
     }
 
     TFR(ip_fd = open("/dev/udp", O_RDWR, 0));
@@ -182,9 +182,9 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     ifr.lifr_arp_muxid = arp_muxid;
 
     if (ioctl(ip_fd, SIOCSLIFMUXID, &ifr) < 0) {
-      ioctl(ip_fd, I_PUNLINK , arp_muxid);
-      ioctl(ip_fd, I_PUNLINK, ip_muxid);
-      error_report("Can't set multiplexor id");
+        ioctl(ip_fd, I_PUNLINK , arp_muxid);
+        ioctl(ip_fd, I_PUNLINK, ip_muxid);
+        error_report("Can't set multiplexor id");
     }
 
     snprintf(dev, dev_size, "tap%d", ppa);
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 107027aa24..b3af8fcba9 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -158,24 +158,24 @@ static tun_buffer_t *get_buffer_from_output_queue(tap_win32_overlapped_t *const
     result = WaitForSingleObject(overlapped->output_queue_semaphore, timeout);
 
     switch (result) {
-        /* The semaphore object was signaled. */
-        case WAIT_OBJECT_0:
-            EnterCriticalSection(&overlapped->output_queue_cs);
+    /* The semaphore object was signaled. */
+    case WAIT_OBJECT_0:
+        EnterCriticalSection(&overlapped->output_queue_cs);
 
-            buffer = overlapped->output_queue_front;
-            overlapped->output_queue_front = buffer->next;
+        buffer = overlapped->output_queue_front;
+        overlapped->output_queue_front = buffer->next;
 
-            if (overlapped->output_queue_front == NULL) {
-                overlapped->output_queue_back = NULL;
-            }
+        if (overlapped->output_queue_front == NULL) {
+            overlapped->output_queue_back = NULL;
+        }
 
-            LeaveCriticalSection(&overlapped->output_queue_cs);
-            break;
+        LeaveCriticalSection(&overlapped->output_queue_cs);
+        break;
 
-        /* Semaphore was nonsignaled, so a time-out occurred. */
-        case WAIT_TIMEOUT:
-            /* Cannot open another window. */
-            break;
+    /* Semaphore was nonsignaled, so a time-out occurred. */
+    case WAIT_TIMEOUT:
+        /* Cannot open another window. */
+        break;
     }
 
     return buffer;
diff --git a/net/vde.c b/net/vde.c
index 0b06464f4d..9ccedddc63 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -55,7 +55,7 @@ static ssize_t vde_receive(NetClientState *nc, const uint8_t *buf, size_t size)
     ssize_t ret;
 
     do {
-      ret = vde_send(s->vde, (const char *)buf, size, 0);
+        ret = vde_send(s->vde, (const char *)buf, size, 0);
     } while (ret < 0 && errno == EINTR);
 
     return ret;
-- 
2.29.1.59.gf9b6481aed


