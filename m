Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85506F0DA6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:12:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8tH-0005vU-FY; Thu, 27 Apr 2023 17:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tE-0005v1-Pm
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:10:56 -0400
Received: from esa13.hc2706-39.iphmx.com ([216.71.137.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tC-0005O0-Oo
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:10:56 -0400
X-IronPort-RemoteIP: 209.85.167.200
X-IronPort-MID: 275213208
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QZJlTKkfDfSSZXf88vFrUAjo5gw/JERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLXT+EO/3eZDamedglOYXioR8HsZbcmNE2TQVorClhRS4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tE5ANmPpingXeF/5UrJMNHTU2OByagKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0xK6aYD76vRxjnVaPpIACRYpQRw/ZwNlPjxG4
 I4lWZSYEW/FN0BX8QgXe0Aw/ypWZMWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eYpIcxsBHE1p3s
 v1ECRpRaCHZ2uWZ3+fuIgVsrpxLwMjDOYoevjRnzGicA6x+GdbMRKLF4dIe1zA17ixMNayGN
 oxJNHw2MkuGOUUXUrsUIMtWcOOAj33vdTFCgFiI46c7/gA/ySQrj+W3aYGPIoziqcN9t2+0+
 lnX0DvDGwAVMtO/6D66wi60ibqa9c/8cMdIfFGizdZzjViOg2AeFhASfV28p/a/lwi5Qd03F
 qAP0i8nrKx3803yC9enB0X+r3mDsRoRHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIdOWBMeLdDy6
 mK0og==
IronPort-HdrOrdr: A9a23:2fzk6q6BEtdGHyIilwPXwBXXdLJyesId70hD6qkRc20yTiX8ra
 qTdZsgpHvJYVoqKRMdcLO7Scq9qBHnm6KdiLN5VduftWHd01eAFoFt6ovkzXnMHSn39uk178
 ZdWpJ/BtrxClY/t8r+7AOkFc1I+rm6GcuT9IDjJhlWPGRXQpAlxAd/BwadHAlXaWB9aqbRRK
 Dw2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3A92UwyGjYnLG96EGblPy/5MjewTJuLWLZ8FHgMXS?=
 =?us-ascii?q?BTmc1aZfJT27KpaRLjJ87?=
X-Talos-MUID: 9a23:5JPmtAmbCS9h6yXSo00vdnpLHes02LWBV3oUgJoAtOmlMRNAZy+S2WE=
Received: from mail-oi1-f200.google.com ([209.85.167.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 17:10:53 -0400
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-38c5845e8e5so6153812b6e.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 14:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682629852; x=1685221852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lp25phZ45HRqtDee0Q+1ws/xkoM4Gpnqec2ldOouCHM=;
 b=D1BAdHcOKXPCxaoq2nLAWDtGiXB9XlEGYzXFrNK3lBgS4yDo9cRkgXmV6/yjKyVdMj
 e0diDehi2nMCc6m3JQ+3HF/KgnsIhyX8tCSY8AyVRKcS7vHCXzaPP5xdeYT8ISWZLuay
 iMjYM+CBEo/l5YwiXTqEu+Lg9Pb8GCbuePE9BiBIC/jQO9/w+cl8TDPtQC87UbIMTyTW
 JOBAJCFBjVx++tHzrq287RrZk0S0zTRoQQM45YU4znx4P9C6D8WXNnkgmE3y/Hky3XLf
 S8P6gCJbp+El7HyCEEM0rKVibggHaq4jMBQ4rz62lGaT9d7SJfVj6Xhj9/pM981kBQR+
 XDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629852; x=1685221852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lp25phZ45HRqtDee0Q+1ws/xkoM4Gpnqec2ldOouCHM=;
 b=Zy+EjaB32HmMNaLLV5cvoZNwc+JLSfPt6UyQR+6h2PgLMzkF08qlbqV05ji/iu7Nx6
 f9p2mrbtI8H7LIR88vJ/L3dplkx5qAfIuwHozC/G/7BBGAhjgOKRLEAfze0M0tvcL/8W
 w4EkfQK6Xgenu0wQQmNhIGcQmihsCUtGmMqkrublxVxezvoU0Jy7P3jtTtn8EpsyBgSi
 1dQmEVtzvzGtBinc2ulYEuHf/zP7OPVqysYyGKazTVeOQJwU9hozf+w4DT3Dtn1QWjO6
 Y5tvbtTK8R0/irgN813K1hvWF8FDcoRsqSUEhz7cy9ruDpVmeuSGdf9MYvvC/DXVYctW
 VSWw==
X-Gm-Message-State: AC+VfDyNakKsjwqI8JYtHPzvolEpWxCe14y/PfnEfdZaEsYot5z44aMA
 wbTUkYIToVDGNYWJOHE261aLbQfu1lRnOs8NQi0vqFgmVut5+tDZ9fRr7KphoUz/SpYajg9+FDz
 w570faZ2yOe2NDVDf9v94Dnvh0wzden2w3lJsobX+IO8=
X-Received: by 2002:a05:6214:c88:b0:5f4:4e3d:2bde with SMTP id
 r8-20020a0562140c8800b005f44e3d2bdemr3329536qvr.48.1682629831789; 
 Thu, 27 Apr 2023 14:10:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4jb2+k0W+QOxztuMbRyAZjbakFzGUw4xXgSPdtKhPEIPchovU1lxd5ffeCdz8rSaOEXnDiHg==
X-Received: by 2002:a05:6214:c88:b0:5f4:4e3d:2bde with SMTP id
 r8-20020a0562140c8800b005f44e3d2bdemr3329482qvr.48.1682629831455; 
 Thu, 27 Apr 2023 14:10:31 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 j14-20020ac84c8e000000b003ef3df76ec7sm6483969qtv.93.2023.04.27.14.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:10:31 -0700 (PDT)
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
Subject: [PATCH v10 2/8] async: Add an optional reentrancy guard to the BH API
Date: Thu, 27 Apr 2023 17:10:07 -0400
Message-Id: <20230427211013.2994127-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230427211013.2994127-1-alxndr@bu.edu>
References: <20230427211013.2994127-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.83; envelope-from=alxndr@bu.edu;
 helo=esa13.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index e267d918fd..89bbc536f9 100644
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
@@ -323,9 +325,11 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
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
@@ -334,7 +338,17 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
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


