Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F26EACE4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:29:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprkp-0005LN-F7; Fri, 21 Apr 2023 10:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprkk-0005Kc-Vd
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:28:47 -0400
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprki-0008A3-KG
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:28:46 -0400
X-IronPort-RemoteIP: 209.85.214.198
X-IronPort-MID: 273917773
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Joa18qPS9g6nb8XvrR0blcFynXyQoLVcMsEvi/4bfWQNrUp20DJUz
 mcaDGyHOv+ONDOne48lPonjoRgPu8KGnd9mTwZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjim8c3l48sfrZ80sz5q2q4Vv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE+ck3CEoxGYwh4u9cBF9+/
 qMUbzwXV0XW7w626OrTpuhEg80iKIzzONpatCgxnXfWCvEpRZ2FSKLPjTNa9G1o14YeQLCEP
 pZfMGs/BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvDOClVMuj+OF3Nz9VYGrHP5lo3mhu
 jzK4Gn1Owwlc+XD1m/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4i536KZrpRztQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjVsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:/S+QIKlUECJgHyMXphOUYm099+DpDfIh3DAbv31ZSRFFG/Fws/
 rDoB1973DJYVcqNk3I/OrrBEDuewK+yXcY2/hyAV7AZmjbURWTQb2KhLGKq1bd8gLFh4lgPM
 xbAsxD4bPLfD1HZL7BgDWFLw==
X-Talos-CUID: 9a23:5mcvxmG7vjQMR1bLqmJdyBcQEccBc0TFxVzVHX+zVmouRKesHAo=
X-Talos-MUID: 9a23:jRkgkAbV+o5nJ+BTmGLN3QpSCfhR//qiF00BqIg5/PDYKnkl
Received: from mail-pl1-f198.google.com ([209.85.214.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 10:28:40 -0400
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1a66c1e1e08so23799595ad.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682087320; x=1684679320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCg2YgC7p6UttR2KMhsCLsqvNMdLomrhaSae1r0C5ro=;
 b=VqOJOpTGlv7WxFWffWF0aiapT5KyfLrP6xEttMSsRtF5qy89r39uhca/lfjt0AiZ7B
 NW8EhXsNLVRC9d+NUVwF49l15BAD/XY8UnfDWenJZDAPffbcHpEJhznx3h20DKfobIiQ
 sTiQXv/maLOeLg5dFPnQs8xGv1yDuB6+ZtpJ1eXgwmDPMgs8PbnWUhfkAe1bOXKDFdpG
 AOwvqxNSFGnFbD5Czx0Yeuo8yLvk/R9l3QQm3mXXo2+794WU5g4UyHC8LMdCRG1jwFRw
 IQHBS1Kcnr8YBIKCcluWJfP29wom3BD+VcR7P4Kg+r+U8p0OIRQoCPgLtcluw7sGmnaZ
 aQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682087320; x=1684679320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jCg2YgC7p6UttR2KMhsCLsqvNMdLomrhaSae1r0C5ro=;
 b=fqIdC70aTNWXrIKUOM39K/Rba0BIOIIJNqpymBl2DZa+DiIRM+70NyJtS+GqZOPWFD
 ZndCBjRuNdYRjPjmyZFlxeDZ7I/FBB7Phj07LsRUQqszovf6k4zg1Jojh1HDlSnUL34X
 LWgwDds9hs5yVHODtvWYNrJHk/dIecc5+bdD8hmdgjBDaSdQswoeyb80bcmFcggchHyx
 rZwIfck7W/0fydNzJOE5fZSr0Z05goLj45bN8ZAd8bFPAZ4b28BCxOq2Q8Q6/dwGPugr
 Yx1HPwmG6wrpEAVBAKGEJN3ftP8ae3IiQRM77e5kZVfnmPMieeZxVTFBDK8sth7GPEY0
 2CSg==
X-Gm-Message-State: AAQBX9e9XUVIN3kb3f9eOuUSeWHALy+TXiVKfrC3wB9j1eMz0N9kEq4/
 s1aFxRQfvnImO5gpe8thpWwkbYa/DtJTCIuIN8HibwAxhwTbxmVp175G5ZCB4nTcZl975L+2iw9
 J9t8owqQhnbUlpRgzXcPtZeiryzUHeTbiX+i1bw88b6I=
X-Received: by 2002:a05:6214:c62:b0:5ef:4441:2a16 with SMTP id
 t2-20020a0562140c6200b005ef44412a16mr8536154qvj.43.1682087300034; 
 Fri, 21 Apr 2023 07:28:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350bGO15id/VS70QQHeVDr1cDKowoJ68L8+sijJKLfSGfMIr4YXFrHmYbtR0WG3tsqcqdlbsVuA==
X-Received: by 2002:a05:6214:c62:b0:5ef:4441:2a16 with SMTP id
 t2-20020a0562140c6200b005ef44412a16mr8536100qvj.43.1682087299714; 
 Fri, 21 Apr 2023 07:28:19 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a0cf5cf000000b00603551afd50sm660737qvm.39.2023.04.21.07.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 07:28:19 -0700 (PDT)
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
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block I/O path)
Subject: [PATCH v8 2/8] async: Add an optional reentrancy guard to the BH API
Date: Fri, 21 Apr 2023 10:27:30 -0400
Message-Id: <20230421142736.2817601-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421142736.2817601-1-alxndr@bu.edu>
References: <20230421142736.2817601-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 543717f294..db6f23c619 100644
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
index b3e54e00bc..68e70e61aa 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -387,9 +387,12 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms);
 
 /* internal interfaces */
 
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
index e180c85145..4d76261010 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -605,9 +605,10 @@ void main_loop_wait(int nonblocking)
 
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


