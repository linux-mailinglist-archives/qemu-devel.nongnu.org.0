Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4EB68AE32
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWKL-0000N2-Lc; Sat, 04 Feb 2023 23:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWKJ-0000Ma-DA
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:08:27 -0500
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWKG-0002k3-EM
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:08:27 -0500
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 256220934
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VWYCRqshZMAe63mF3s1Mr9yyMefnVOhcMUV32f8akzHdYApBsoF/q
 tZmKW6COfjYM2Kke9h3OY7i8B5X6MKEndRhHAVrqC4yEioQ9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZmOagQ1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqUV8NRqPFxi1
 MApB2sCTEjem+Gx5JG0H7wEasQLdKEHPasas3BkiCjaVLMoGMGTBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk6aOVsWawd/5JEWxY9EglH2dy1epEi9r7dx7mTOpOB0+OKwboCPIo3RGa25mG62l
 FzH2kf4BygQH/3E+x6nqmudi8v2yHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQpFjEGqKEz8AmyTYC4UUTp8DiLuRkTX9cWGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO7afamRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:StTHU68GKdqaUYwE1wRuk+BHI+orL9Y04lQ7vn2ZKCYlCPBw8v
 rFoB1173/JYUkqKRMdcLy7SdG9qBDnm6Kdg7NhW4uKZwXvsmqvMJxe9oPpwTH6cheOk9K1vJ
 0IG8ND4bbLfCFHZKjBkXKFOudl6NOM9ryumKP4yWpsQgFhY7xh6QA8NxaDHiRNNWp77FkCeK
 Z0JPArm9NtQxsqR/X+IX8ZX+fCrdXXlJTge3c9dnoawTjLqjW06LH7GRCE3hEYSXdlx6sk+2
 SAswv34MyYwpaGI9bntlPu0w==
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:08:22 -0500
Received: by mail-qk1-f198.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so5926812qkn.0
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ZIvTLvldoHILUtKZt0L98ElAkvpg/WKYDgA0YNYX6o=;
 b=N0r07ZAqT8SMLUEdHwI695G3TGUFQ7qDDu2WbrDvUxKoQ7dqqbjZQlZxKD12ueIxGd
 PfywUmKkrarGG7mm0liN70kZVQQw9OyuuDT/j7Rhof8cls382udCrELDz3IcY6enuUrO
 dGtRvZHYBcIW1fA5h6zMCRMMjLb4t8CpJorZOlawQT3ra265T4RTs5CQrtT13chwN7es
 8+C2IVRKk/XTDM2G6aSWcq2/DQt/ZsPz8rF/UTLDQUPD6DVg53rzrQOQ43gixZN1BCAx
 A2HS4XlFhWDMIfGZSiwWHaI60L6JYKPWi9/nTOVS8hiLPMaVEElPmNdmaLN4s9MlRlgM
 yKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ZIvTLvldoHILUtKZt0L98ElAkvpg/WKYDgA0YNYX6o=;
 b=IkP++/15VPHTQa2ottFD9FDJpYcauHBtNp1tZIbsaBwwzMVdiYklTeeJ8ThXZ45L+o
 TYmnV1NVVDcUyJtbNLidu070G7+QjXLXcdzvs2+6ZGz+8D0J13TjFzSRv9UCMp8SlzB3
 5C6ktsb4QgwKAyYlCUQTbRblJybotf/WyxzZhQg65PDSo6ODuFbRVrCsp5suD5TbpgZQ
 nGZPtnej0KdHcJiDFNBLvH2HEQGk3mVbjEP1DuFXcPNvnUf6e9XQd8PudNTQdL/XQX0y
 Xu6AsxZdYNlBXdrlB0EJ1RIbBd3mVH/4sqOLm3L4PAkkJuaYXi2b0ZlC0QWZhPZ1p1Br
 0hGg==
X-Gm-Message-State: AO0yUKWJB8pMDRhe/JufZR1L3s6fJYbojkTjyb7D4jCfrAQ2hDbMFLTh
 q/M6l73FE3ainAMmvKmW5jHrBrTcgH/SIaGS+qHRYAqHdLcqtzJmgBDA0pgbCJ0BKrT/Z74Mpz0
 Jf/FUqi5QQ3EopG4eFN7HjRlC9V6JKQ==
X-Received: by 2002:ac8:5cd3:0:b0:3b9:bb27:e116 with SMTP id
 s19-20020ac85cd3000000b003b9bb27e116mr27904908qta.1.1675570101552; 
 Sat, 04 Feb 2023 20:08:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9HGK5v2UAMD8CBhIRvxHrG14cuB/74A7YNt2hJeu3xk29rYGeudYhoSx2MJ/iKOg7DDlpcXA==
X-Received: by 2002:ac8:5cd3:0:b0:3b9:bb27:e116 with SMTP id
 s19-20020ac85cd3000000b003b9bb27e116mr27904870qta.1.1675570101244; 
 Sat, 04 Feb 2023 20:08:21 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a05620a40c700b007208a81e11esm4278052qko.41.2023.02.04.20.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:08:20 -0800 (PST)
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
Subject: [PATCH v6 2/4] async: Add an optional reentrancy guard to the BH API
Date: Sat,  4 Feb 2023 23:07:35 -0500
Message-Id: <20230205040737.3567731-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205040737.3567731-1-alxndr@bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index f5e75a96b6..24d5413f9d 100644
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
index 0657b75397..fbebfd7897 100644
--- a/util/async.c
+++ b/util/async.c
@@ -65,6 +65,7 @@ struct QEMUBH {
     void *opaque;
     QSLIST_ENTRY(QEMUBH) next;
     unsigned flags;
+    MemReentrancyGuard *reentrancy_guard;
 };
 
 /* Called concurrently from any thread */
@@ -133,7 +134,7 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, QEMUBHFunc *cb,
 }
 
 QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
-                        const char *name)
+                        const char *name, MemReentrancyGuard *reentrancy_guard)
 {
     QEMUBH *bh;
     bh = g_new(QEMUBH, 1);
@@ -142,13 +143,28 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
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
index 58f776a8c9..07d2e2040a 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -617,9 +617,10 @@ void main_loop_wait(int nonblocking)
 
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
index c8f53d7d9f..dc3b1eb3bf 100644
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


