Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4136B711A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:26:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdUN-0000wV-CY; Mon, 13 Mar 2023 04:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdUL-0000wI-Cz
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:25:01 -0400
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdUJ-0000GE-94
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:25:01 -0400
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 262677461
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OQzsX6km2pASmfQkxlfUgnHo5gw8JERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOUG7UbqvcYjfxc993PIWy9EwA7MfVydQ1SwFqrS42Ei4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wdmP5ingXeF/5UrJMNHTU2OByagKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0xK6aYD76vRxjnVaPpIACRYpQRw/ZwNlPjxG4
 I4lWZSYEW/FN0BX8QgXe0Aw/ypWZMWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eZ6cG8eFcJF913
 uUKBSssfgnElsXv6efuIgVsrpxLwMjDOYoevjR502icA6h3B5/ERKrO6JlT2zJYasJmR66PI
 ZpEL2A2PVKeMnWjOX9OYH46tO6sln/zaRVStRSYqbdfD237llIrjueybISMEjCMbdlfrEGKn
 G7Fw2WnHwtKFtm1mAijsUv504cjmgu+Aur+DoaQ7/NvnRify3IeDDUQUl20p+T/jVSxM++zM
 GQR8ysq6LEsrQmlEIi7UBq/r3qJ+BUbXrK8DtEH1e1E8YKMiy7xO4TOZmcphAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:02mQWqOi9HOJTMBcThujsMiBIKoaSvp037Dk7TEUdfUzSL3jqy
 nKpp4mPHDP+VAssR0b6LK90cq7MAjhHOBOkPAs1N6ZNWGMyQiVxelZjbcKqAeQfBEWmNQtsJ
 tIQuxVJOe1I2JHrfvX1iGFLvdI+qj7zElqv4vjJrVWID2Cp5sP0+4AMHfiLqS+fmYmOaYE
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 04:24:55 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 s18-20020a0cf792000000b00572c04240f1so6629566qvn.8
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678695894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5FgUZnYp99aO58Xxxn+b8iUcBxTfOQHbXapV5BLa8M=;
 b=QPuTZAAY56IsB64q5hx4yUa2zIEdQfZqQWTKHg9HEG7GGnuaGr3nXsW89C3NF34UUJ
 spgExhAiqyL7Cu0qIdODRAL+J9QMruGd/ZQiSlFum1kWqVVrmLifxL3KaYvc967OFdqm
 Qq1W6ytWEbj22petitDsFxvSyCnQMVSlBvJy8xAKgcnep6vc+fr6+q+wKuGhDC3TWKLG
 D5VKF8uhhU8b8B9rHF592ns9L9WAripnZYUFuYugvnDTLSh9ssHvkMCHdKX1YRxotXn+
 UXaz0bDpBCGr6ChBCnQzaB26gXLQqTNvzYrpmU3Au7dn71dqCl5Z8vK91rEAk9SdZYzy
 FnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678695894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O5FgUZnYp99aO58Xxxn+b8iUcBxTfOQHbXapV5BLa8M=;
 b=xz4dv9AHUcU0BIsER7K+Kpy2E5X9kYUrs0MuxFOGAJKYYvaMyy3yCDbnLlNGJwbUsY
 oUhBdcGNQ5gk/5ZJsAjNIIycxROi6aC4vl1W9aenvTivKlIiusNoSkAbuOxGmI14Aq8Y
 21OksaRzYtsFCQkxpgN9ZhSbzI1AxWCFBclkw/zo0R+Sk0biv4RCEsTzrWFYoqG8Cytu
 4sYHhdh3R8b+GEZ7OpwPe2ZDsyprKPcT+GOq/Hae1dmzgy3qfHDjCUaNBD2NJUqNOuzI
 gzvio6Iu0og4gvVv9A7p4YjZiHaHq/A/gDpCQHvGTrbjNUclmgJtSBHGuf2/3EeWX7mC
 2UsA==
X-Gm-Message-State: AO0yUKVYVDx/WhJhpWGrVX+BgcdI13v3pGhVaA0cyd0VnorQ4hq6R9bO
 MNm+cuN+69lqzyNz7THrNiyQqcPDDoZ64vMeNXm8sweIlPxDYg6CnfX5K4cQ/mq+UzgRIm/jdx+
 UtUly8PAlao5f2HlcAyDbayOnmV4UffUV9ftzxk1Zb5Q=
X-Received: by 2002:a05:622a:1744:b0:3b6:8bc3:a09c with SMTP id
 l4-20020a05622a174400b003b68bc3a09cmr18548294qtk.25.1678695894396; 
 Mon, 13 Mar 2023 01:24:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set8UxSRW7S802L6te6tW+vKa6u4Ix9xtdKH4xZWNavSKjGr7x1SuTvvopdFCrhKlL+4mawptKQ==
X-Received: by 2002:a05:622a:1744:b0:3b6:8bc3:a09c with SMTP id
 l4-20020a05622a174400b003b68bc3a09cmr18548267qtk.25.1678695894055; 
 Mon, 13 Mar 2023 01:24:54 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac8488d000000b003b8484fdfccsm5108739qtq.42.2023.03.13.01.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 01:24:53 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block I/O path)
Subject: [PATCH v7 2/6] async: Add an optional reentrancy guard to the BH API
Date: Mon, 13 Mar 2023 04:24:13 -0400
Message-Id: <20230313082417.827484-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230313082417.827484-1-alxndr@bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Devices can pass their MemoryReentrancyGuard (from their DeviceState),
when creating new BHes. Then, the async API will toggle the guard
before/after calling the BH call-back. This prevents bh->mmio reentrancy
issues.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 docs/devel/multiple-iothreads.txt |  7 +++++++
 include/block/aio.h               | 18 ++++++++++++++++--
 include/qemu/main-loop.h          |  7 +++++--
 tests/unit/ptimer-test-stubs.c    |  3 ++-
 util/async.c                      | 18 +++++++++++++++++-
 util/main-loop.c                  |  5 +++--
 util/trace-events                 |  1 +
 7 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/docs/devel/multiple-iothreads.txt b/docs/devel/multiple-iothreads.txt
index 343120f2ef..a3e949f6b3 100644
--- a/docs/devel/multiple-iothreads.txt
+++ b/docs/devel/multiple-iothreads.txt
@@ -61,6 +61,7 @@ There are several old APIs that use the main loop AioContext:
  * LEGACY qemu_aio_set_event_notifier() - monitor an event notifier
  * LEGACY timer_new_ms() - create a timer
  * LEGACY qemu_bh_new() - create a BH
+ * LEGACY qemu_bh_new_guarded() - create a BH with a device re-entrancy guard
  * LEGACY qemu_aio_wait() - run an event loop iteration
 
 Since they implicitly work on the main loop they cannot be used in code that
@@ -72,8 +73,14 @@ Instead, use the AioContext functions directly (see include/block/aio.h):
  * aio_set_event_notifier() - monitor an event notifier
  * aio_timer_new() - create a timer
  * aio_bh_new() - create a BH
+ * aio_bh_new_guarded() - create a BH with a device re-entrancy guard
  * aio_poll() - run an event loop iteration
 
+The qemu_bh_new_guarded/aio_bh_new_guarded APIs accept a "MemReentrancyGuard"
+argument, which is used to check for and prevent re-entrancy problems. For
+BHs associated with devices, the reentrancy-guard is contained in the
+corresponding DeviceState and named "mem_reentrancy_guard".
+
 The AioContext can be obtained from the IOThread using
 iothread_get_aio_context() or for the main loop using qemu_get_aio_context().
 Code that takes an AioContext argument works both in IOThreads or the main
diff --git a/include/block/aio.h b/include/block/aio.h
index 8fba6a3584..3e3bdb9352 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -23,6 +23,8 @@
 #include "qemu/thread.h"
 #include "qemu/timer.h"
 #include "block/graph-lock.h"
+#include "hw/qdev-core.h"
+
 
 typedef struct BlockAIOCB BlockAIOCB;
 typedef void BlockCompletionFunc(void *opaque, int ret);
@@ -331,9 +333,11 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
  * is opaque and must be allocated prior to its use.
  *
  * @name: A human-readable identifier for debugging purposes.
+ * @reentrancy_guard: A guard set when entering a cb to prevent
+ * device-reentrancy issues
  */
 QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
-                        const char *name);
+                        const char *name, MemReentrancyGuard *reentrancy_guard);
 
 /**
  * aio_bh_new: Allocate a new bottom half structure
@@ -342,7 +346,17 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
  * string.
  */
 #define aio_bh_new(ctx, cb, opaque) \
-    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)))
+    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)), NULL)
+
+/**
+ * aio_bh_new_guarded: Allocate a new bottom half structure with a
+ * reentrancy_guard
+ *
+ * A convenience wrapper for aio_bh_new_full() that uses the cb as the name
+ * string.
+ */
+#define aio_bh_new_guarded(ctx, cb, opaque, guard) \
+    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)), guard)
 
 /**
  * aio_notify: Force processing of pending events.
diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index c25f390696..84d1ce57f0 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -389,9 +389,12 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms);
 
 void qemu_fd_register(int fd);
 
+#define qemu_bh_new_guarded(cb, opaque, guard) \
+    qemu_bh_new_full((cb), (opaque), (stringify(cb)), guard)
 #define qemu_bh_new(cb, opaque) \
-    qemu_bh_new_full((cb), (opaque), (stringify(cb)))
-QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name);
+    qemu_bh_new_full((cb), (opaque), (stringify(cb)), NULL)
+QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name,
+                         MemReentrancyGuard *reentrancy_guard);
 void qemu_bh_schedule_idle(QEMUBH *bh);
 
 enum {
diff --git a/tests/unit/ptimer-test-stubs.c b/tests/unit/ptimer-test-stubs.c
index f2bfcede93..8c9407c560 100644
--- a/tests/unit/ptimer-test-stubs.c
+++ b/tests/unit/ptimer-test-stubs.c
@@ -107,7 +107,8 @@ int64_t qemu_clock_deadline_ns_all(QEMUClockType type, int attr_mask)
     return deadline;
 }
 
-QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name)
+QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name,
+                         MemReentrancyGuard *reentrancy_guard)
 {
     QEMUBH *bh = g_new(QEMUBH, 1);
 
diff --git a/util/async.c b/util/async.c
index 21016a1ac7..a9b528c370 100644
--- a/util/async.c
+++ b/util/async.c
@@ -65,6 +65,7 @@ struct QEMUBH {
     void *opaque;
     QSLIST_ENTRY(QEMUBH) next;
     unsigned flags;
+    MemReentrancyGuard *reentrancy_guard;
 };
 
 /* Called concurrently from any thread */
@@ -137,7 +138,7 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, QEMUBHFunc *cb,
 }
 
 QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
-                        const char *name)
+                        const char *name, MemReentrancyGuard *reentrancy_guard)
 {
     QEMUBH *bh;
     bh = g_new(QEMUBH, 1);
@@ -146,13 +147,28 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
         .cb = cb,
         .opaque = opaque,
         .name = name,
+        .reentrancy_guard = reentrancy_guard,
     };
     return bh;
 }
 
 void aio_bh_call(QEMUBH *bh)
 {
+    bool last_engaged_in_io = false;
+
+    if (bh->reentrancy_guard) {
+        last_engaged_in_io = bh->reentrancy_guard->engaged_in_io;
+        if (bh->reentrancy_guard->engaged_in_io) {
+            trace_reentrant_aio(bh->ctx, bh->name);
+        }
+        bh->reentrancy_guard->engaged_in_io = true;
+    }
+
     bh->cb(bh->opaque);
+
+    if (bh->reentrancy_guard) {
+        bh->reentrancy_guard->engaged_in_io = last_engaged_in_io;
+    }
 }
 
 /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
diff --git a/util/main-loop.c b/util/main-loop.c
index 3c0f525192..c4df36c6a5 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -616,9 +616,10 @@ void main_loop_wait(int nonblocking)
 
 /* Functions to operate on the main QEMU AioContext.  */
 
-QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name)
+QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name, MemReentrancyGuard *reentrancy_guard)
 {
-    return aio_bh_new_full(qemu_aio_context, cb, opaque, name);
+    return aio_bh_new_full(qemu_aio_context, cb, opaque, name,
+                           reentrancy_guard);
 }
 
 /*
diff --git a/util/trace-events b/util/trace-events
index 16f78d8fe5..3f7e766683 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -11,6 +11,7 @@ poll_remove(void *ctx, void *node, int fd) "ctx %p node %p fd %d"
 # async.c
 aio_co_schedule(void *ctx, void *co) "ctx %p co %p"
 aio_co_schedule_bh_cb(void *ctx, void *co) "ctx %p co %p"
+reentrant_aio(void *ctx, const char *name) "ctx %p name %s"
 
 # thread-pool.c
 thread_pool_submit(void *pool, void *req, void *opaque) "pool %p req %p opaque %p"
-- 
2.39.0


