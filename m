Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9EB242A8D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 15:44:43 +0200 (CEST)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5r3a-0002EE-Rp
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 09:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1k5nod-00089N-Rf; Wed, 12 Aug 2020 06:17:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4176 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1k5noY-00032I-0m; Wed, 12 Aug 2020 06:17:03 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 213C81F85F9C9859FCBC;
 Wed, 12 Aug 2020 18:16:54 +0800 (CST)
Received: from localhost (10.174.187.253) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 12 Aug 2020
 18:16:46 +0800
From: zhaolichang <zhaolichang@huawei.com>
To: <qemu-trivial@nongnu.org>
Subject: [PATCH RFC 05/10] util/: fix some comment spelling errors
Date: Wed, 12 Aug 2020 18:14:55 +0800
Message-ID: <20200812101500.2066-6-zhaolichang@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200812101500.2066-1-zhaolichang@huawei.com>
References: <20200812101500.2066-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.253]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 06:16:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Aug 2020 09:40:49 -0400
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
Cc: zhaolichang <zhaolichang@huawei.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found that there are many spelling errors in the comments of qemu,
so I used the spellcheck tool to check the spelling errors
and finally found some spelling errors in the util folder.

Signed-off-by: zhaolichang <zhaolichang@huawei.com>
---
 util/osdep.c             | 2 +-
 util/qemu-progress.c     | 2 +-
 util/qemu-sockets.c      | 2 +-
 util/qemu-thread-win32.c | 2 +-
 util/qht.c               | 2 +-
 util/trace-events        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/util/osdep.c b/util/osdep.c
index 4829c07..e50dc22 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -392,7 +392,7 @@ int qemu_unlink(const char *name)
  * Set errno if fewer than `count' bytes are written.
  *
  * This function don't work with non-blocking fd's.
- * Any of the possibilities with non-bloking fd's is bad:
+ * Any of the possibilities with non-blocking fd's is bad:
  *   - return a short write (then name is wrong)
  *   - busy wait adding (errno == EAGAIN) to the loop
  */
diff --git a/util/qemu-progress.c b/util/qemu-progress.c
index 3c2223c..20d51f8 100644
--- a/util/qemu-progress.c
+++ b/util/qemu-progress.c
@@ -131,7 +131,7 @@ void qemu_progress_end(void)
 /*
  * Report progress.
  * @delta is how much progress we made.
- * If @max is zero, @delta is an absolut value of the total job done.
+ * If @max is zero, @delta is an absolute value of the total job done.
  * Else, @delta is a progress delta since the last call, as a fraction
  * of @max.  I.e. the delta is @delta * @max / 100. This allows
  * relative accounting of functions which may be a different fraction of
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index b37d288..99ce2fd 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -416,7 +416,7 @@ static struct addrinfo *inet_parse_connect_saddr(InetSocketAddress *saddr,
 
     /* At least FreeBSD and OS-X 10.6 declare AI_V4MAPPED but
      * then don't implement it in their getaddrinfo(). Detect
-     * this and retry without the flag since that's preferrable
+     * this and retry without the flag since that's preferable
      * to a fatal error
      */
     if (rc == EAI_BADFLAGS &&
diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index 56a8333..d207b0c 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -289,7 +289,7 @@ void qemu_event_wait(QemuEvent *ev)
             ResetEvent(ev->event);
 
             /* Tell qemu_event_set that there are waiters.  No need to retry
-             * because there cannot be a concurent busy->free transition.
+             * because there cannot be a concurrent busy->free transition.
              * After the CAS, the event will be either set or busy.
              */
             if (atomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
diff --git a/util/qht.c b/util/qht.c
index 67e5d5b..b2e020c 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -49,7 +49,7 @@
  * it anymore.
  *
  * Writers check for concurrent resizes by comparing ht->map before and after
- * acquiring their bucket lock. If they don't match, a resize has occured
+ * acquiring their bucket lock. If they don't match, a resize has occurred
  * while the bucket spinlock was being acquired.
  *
  * Related Work:
diff --git a/util/trace-events b/util/trace-events
index 0ce4282..4bc0180 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -28,7 +28,7 @@ qemu_file_monitor_add_watch(void *mon, const char *dirpath, const char *filename
 qemu_file_monitor_remove_watch(void *mon, const char *dirpath, int64_t id) "File monitor %p remove watch dir='%s' id=%" PRId64
 qemu_file_monitor_new(void *mon, int fd) "File monitor %p created fd=%d"
 qemu_file_monitor_enable_watch(void *mon, const char *dirpath, int id) "File monitor %p enable watch dir='%s' id=%u"
-qemu_file_monitor_disable_watch(void *mon, const char *dirpath, int id) "Fle monitor %p disable watch dir='%s' id=%u"
+qemu_file_monitor_disable_watch(void *mon, const char *dirpath, int id) "File monitor %p disable watch dir='%s' id=%u"
 qemu_file_monitor_event(void *mon, const char *dirpath, const char *filename, int mask, unsigned int id) "File monitor %p event dir='%s' file='%s' mask=0x%x id=%u"
 qemu_file_monitor_dispatch(void *mon, const char *dirpath, const char *filename, int ev, void *cb, void *opaque, int64_t id) "File monitor %p dispatch dir='%s' file='%s' ev=%d cb=%p opaque=%p id=%" PRId64
 
-- 
2.26.2.windows.1



