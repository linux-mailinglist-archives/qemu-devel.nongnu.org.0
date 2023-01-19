Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17870673213
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOy9-0005qx-Io; Thu, 19 Jan 2023 02:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOxp-0005be-6V
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:04:01 -0500
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOxl-0000Lf-Ju
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:03:55 -0500
X-IronPort-RemoteIP: 209.85.219.70
X-IronPort-MID: 252287273
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WmxUza/eiFls5zkqAUAmDrUDPXyTJUtcMsCJ2f8bNWPcYEJGY0x3n
 WseWDzXPf+IZzGned52bI3lpk8GvZaHz9BhSwdv/nwxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jeTQHOGU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNLg06/gEk35q+q4WpJ5gVWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJGsGNI8a+eEpPWZD8
 NYCDjoJVCquoMvjldpXSsE07igiBMziPYdao285iD+GVbApRpfMR6iM7thdtNsyrpoWTLCOO
 oxDMGspM0yojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKOllYhj+Kya7I5fPS6WOILvh2Dh
 FvjxE6mCE5HEt2+lzW8pyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83s/F3+hPzCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:5iSF+6xGTC+PvWSUDLiZKrPxb+skLtp133Aq2lEZdPWaSL39qy
 nIpoVm6fYuskdtZJhEo7y90ca7MBXhHKBOkMYs1NuZLWvbUS6TXflfBWWL+UyqJ8XRntQtmJ
 uIWZIOQeEZNDBB/IzHCOPRKadt/DD/ytHhuQ689QYWcegVUdAY0+4jMHfsLqQefmAvbvBVe/
 v9l6l6SiKbCAoqh4aAdwI4tsf41pP2ffndEHk77nAcmWyzZfLB0s+PL/A0tS1xb9vBqY1Shl
 Qs/2HCl9qemsD+8AbV01na5YlXntyJ8Ko3OOW8zvINIjHbgQ6yDb4RKIGqjXQOuemq3k0nid
 /Wvn4bTrZOwkKURHi8pS320Q/63F8Vmg/f4G7du2LqpfriTjQgB/xAgp8xSGqp13Yd
Received: from mail-qv1-f70.google.com ([209.85.219.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 02:03:51 -0500
Received: by mail-qv1-f70.google.com with SMTP id
 k15-20020a0cd68f000000b00535261af1b1so573439qvi.13
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2giDB2PPJNn2gXornDaWomerDVImbh9Af956/AyFUYE=;
 b=APuGsyxtHA7oY+fPZnv5nzmtFWybHLpa540ExIAanZGh5JaQ5bCmWpTy0eHcttX2rt
 n1PJC/h90Z7KSqtMdpU8w+u9xYoiWJw5riWNY8sRUzQ5I6FBpAO0P0ysLySo75JITT6g
 X8eIPnbggoBM38kN9Dgi6tpuYaQ2B/sEkifGi2cDh8sX3g7RQKTN9gPYAcStw9h9SR4N
 T8/QJqXRZfiivCni+0Uxt6ejcKYn8aE8Jt0+sqPx0CmEt21Z0d3NU/k53AhafqMVKa37
 OKNBT9Wfr8ZjjEJwV3zNVa9zhp7U/MFBuh1R//MDiRJHMn1zhnvcorrsrYbc0bW5wfSd
 i2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2giDB2PPJNn2gXornDaWomerDVImbh9Af956/AyFUYE=;
 b=xFOH168KONQQhWAWwYSz2dVTGZRHiIp/fQb+D+eW2zu7QgbZMJslIU9o3Ah8ygTPbN
 UzHyNM/WcKN6PW32ilF5jOAIOoGt3VhXeOV/fgI/Y1qFqGD/LY8eNE1inNonmnIouMBB
 Zvzj96tK6SfOjk5FvcfABLuP5CCvWrrJojbTgcAsbwngvMr83xztS4HWHO/J6kWmTqyb
 9pjDNQtRzWxVtHfTlGi0nNoYCydSwrf/tNVxl16fx0Yh2v2HvwD9bIJJnrJhoMurLRo8
 mRzxk19HLuZCJ2yMIa6JAUvZRzzeCznZ5DjmsMf65NSHMDpY9qFjEaF7WJdcnf7QEKH5
 KA0w==
X-Gm-Message-State: AFqh2kqBAysEVMDbcp9Jumu4QIXYkxIkySUe8aoZTsxeGjzL+QlMGe8A
 AJz2o7s/hMf4i2Aum0lxhg2uTsHLtsD2u+2XUbiG3OhNmtu97JJmMFQAOMZ4UDkqlZ5ycgg0If4
 G5uQq7GqCwNhtkGiv/YOBTKliajjTSw==
X-Received: by 2002:ac8:51ce:0:b0:3b6:3b81:9a99 with SMTP id
 d14-20020ac851ce000000b003b63b819a99mr12937942qtn.14.1674111830334; 
 Wed, 18 Jan 2023 23:03:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuE8xw+H+Nr746fUNgpsfmQoyKHRhlW6E97veC/t1q0G9dt8dEQG+KjgBeJbfRq3B9szOEEjw==
X-Received: by 2002:ac8:51ce:0:b0:3b6:3b81:9a99 with SMTP id
 d14-20020ac851ce000000b003b63b819a99mr12937899qtn.14.1674111829996; 
 Wed, 18 Jan 2023 23:03:49 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a37f917000000b006fc2b672950sm23575695qkj.37.2023.01.18.23.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:03:49 -0800 (PST)
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
Subject: [PATCH v4 2/3] async: Add an optional reentrancy guard to the BH API
Date: Thu, 19 Jan 2023 02:03:07 -0500
Message-Id: <20230119070308.321653-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119070308.321653-1-alxndr@bu.edu>
References: <20230119070308.321653-1-alxndr@bu.edu>
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

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 docs/devel/multiple-iothreads.txt |  2 ++
 include/block/aio.h               | 18 ++++++++++++++++--
 include/qemu/main-loop.h          |  7 +++++--
 tests/unit/ptimer-test-stubs.c    |  3 ++-
 util/async.c                      | 12 +++++++++++-
 util/main-loop.c                  |  5 +++--
 6 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/docs/devel/multiple-iothreads.txt b/docs/devel/multiple-iothreads.txt
index 343120f2ef..e4fafed9d9 100644
--- a/docs/devel/multiple-iothreads.txt
+++ b/docs/devel/multiple-iothreads.txt
@@ -61,6 +61,7 @@ There are several old APIs that use the main loop AioContext:
  * LEGACY qemu_aio_set_event_notifier() - monitor an event notifier
  * LEGACY timer_new_ms() - create a timer
  * LEGACY qemu_bh_new() - create a BH
+ * LEGACY qemu_bh_new_guarded() - create a BH with a device re-entrancy guard
  * LEGACY qemu_aio_wait() - run an event loop iteration
 
 Since they implicitly work on the main loop they cannot be used in code that
@@ -72,6 +73,7 @@ Instead, use the AioContext functions directly (see include/block/aio.h):
  * aio_set_event_notifier() - monitor an event notifier
  * aio_timer_new() - create a timer
  * aio_bh_new() - create a BH
+ * aio_bh_new_guarded() - create a BH with a device re-entrancy guard
  * aio_poll() - run an event loop iteration
 
 The AioContext can be obtained from the IOThread using
diff --git a/include/block/aio.h b/include/block/aio.h
index 0f65a3cc9e..94d661ff7e 100644
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
@@ -332,9 +334,11 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
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
@@ -343,7 +347,17 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
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
index 14d63b3091..08924c3212 100644
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
@@ -142,13 +143,22 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
         .cb = cb,
         .opaque = opaque,
         .name = name,
+        .reentrancy_guard = reentrancy_guard,
     };
     return bh;
 }
 
 void aio_bh_call(QEMUBH *bh)
 {
+    if (bh->reentrancy_guard) {
+        bh->reentrancy_guard->engaged_in_io = true;
+    }
+
     bh->cb(bh->opaque);
+
+    if (bh->reentrancy_guard) {
+        bh->reentrancy_guard->engaged_in_io = false;
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
-- 
2.39.0


