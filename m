Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497CA4CC0EE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:14:40 +0100 (CET)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnA7-0001Vr-Cq
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:14:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nPn8t-0008E4-3j
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nPn8p-0003eT-FP
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92nPpUbLYvBcpjs+qGpjfVm8uXmauTYUyeVE6Wcoowo=;
 b=dKx1boPaNDHX/gqdgYRW8SQ4Jxz/bHBFJE28VGbEvRnlb4Qo5Mq0Y6i5JE6E7wJIEj9cyB
 DvqcYROCnzwUwxsaZxweEb+D0SGftjc8lqqT/lkBIbPwhBYccif3l5BaayRgWE4+zbn28b
 ++j5Un+5AK5/tZIQqCzfpHfCXhONREs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-W52Ud4vgN1Syh3QcxaFsew-1; Thu, 03 Mar 2022 10:13:16 -0500
X-MC-Unique: W52Ud4vgN1Syh3QcxaFsew-1
Received: by mail-wm1-f69.google.com with SMTP id
 j42-20020a05600c1c2a00b00381febe402eso2832045wms.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=92nPpUbLYvBcpjs+qGpjfVm8uXmauTYUyeVE6Wcoowo=;
 b=FComBtMyXQAKcCbWXCUKs/xqGyDrLeXkFZS5Pj9Nfw1ONefNcHFdXxPQJJSrMf9oaQ
 5xKZv4IHCXRFUdIDK/zpmZHPvINHmoBR9NRtNoOxuDOvnGb8Of45+0ebBRjo7cxTZVbi
 lrkaJsDLU/ifbuWTkGmM8aD/xSlGxcouwSFqH3ogrCImFY1WC++Ve2d1UoDCcHRdbKyU
 Iqhj+vio5uU5609vgwmDPyO6721ShO8+qoi/cl/qk9ZAS3X7yV4dRt+i4RX1/K1qEXB1
 ymVHvb0ZocPcAcnqKOqg4YJcgED6qDlCl7ajhVNn30TkN4eePJdNuQFFkfcRF6W0/J0o
 4S3g==
X-Gm-Message-State: AOAM533sg/lU2XgmSUtm35O+g3Cak6/OdytytXX0l7FLDX7QkaTBjeAM
 7fTwXnhMJmTtIjzML+KiZ+wgsDwoNjHvb8c0+8x6eD7zbghYPhxk2BXqHlpGCImgpIGdsaNAjSa
 q8zuDPo/qJMuOt5U=
X-Received: by 2002:a05:6000:1ac9:b0:1ef:f32c:18ec with SMTP id
 i9-20020a0560001ac900b001eff32c18ecmr12556036wry.364.1646320395268; 
 Thu, 03 Mar 2022 07:13:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCfNTJ6Aijh8D66CUGuHToyhe4B9pXFq+Q/lanJGQ9OqmEhk/HFKSCsu/WMw1qTOIGeUQNQA==
X-Received: by 2002:a05:6000:1ac9:b0:1ef:f32c:18ec with SMTP id
 i9-20020a0560001ac900b001eff32c18ecmr12556006wry.364.1646320394947; 
 Thu, 03 Mar 2022 07:13:14 -0800 (PST)
Received: from vian.redhat.com ([2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8])
 by smtp.gmail.com with ESMTPSA id
 v25-20020a05600c215900b0038117f41728sm9129782wml.43.2022.03.03.07.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:13:14 -0800 (PST)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 4/4] util/event-loop-base: Introduce options to set the
 thread pool size
Date: Thu,  3 Mar 2022 16:13:07 +0100
Message-Id: <20220303151307.558607-1-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303145822.518887-1-nsaenzju@redhat.com>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, eduardo@habkost.net, qemu-block@nongnu.org,
 michael.roth@amd.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The thread pool regulates itself: when idle, it kills threads until
empty, when in demand, it creates new threads until full. This behaviour
doesn't play well with latency sensitive workloads where the price of
creating a new thread is too high. For example, when paired with qemu's
'-mlock', or using safety features like SafeStack, creating a new thread
has been measured take multiple milliseconds.

In order to mitigate this let's introduce a new 'EventLoopBaase'
property to set the thread pool size. The threads will be created during
the pool's initialization or upon updating the property's value, remain
available during its lifetime regardless of demand, and destroyed upon
freeing it. A properly characterized workload will then be able to
configure the pool to avoid any latency spikes.

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
---

Changes since v1:
 - Add INT_MAX check
 - Have copy of thread pool sizes in AioContext to properly decouple
   both instances
 - More coherent variable naming
 - Handle case where max_threads decreases
 - Code comments

 event-loop-base.c                | 23 +++++++++++++
 include/block/aio.h              | 10 ++++++
 include/block/thread-pool.h      |  3 ++
 include/sysemu/event-loop-base.h |  4 +++
 iothread.c                       |  3 ++
 qapi/qom.json                    | 22 ++++++++++--
 util/aio-posix.c                 |  1 +
 util/async.c                     | 20 +++++++++++
 util/main-loop.c                 |  9 +++++
 util/thread-pool.c               | 59 +++++++++++++++++++++++++++++---
 10 files changed, 148 insertions(+), 6 deletions(-)

diff --git a/event-loop-base.c b/event-loop-base.c
index e7f99a6ec8..d5be4dc6fc 100644
--- a/event-loop-base.c
+++ b/event-loop-base.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include "qom/object_interfaces.h"
 #include "qapi/error.h"
+#include "block/thread-pool.h"
 #include "sysemu/event-loop-base.h"
 
 typedef struct {
@@ -21,9 +22,22 @@ typedef struct {
     ptrdiff_t offset; /* field's byte offset in EventLoopBase struct */
 } EventLoopBaseParamInfo;
 
+static void event_loop_base_instance_init(Object *obj)
+{
+    EventLoopBase *base = EVENT_LOOP_BASE(obj);
+
+    base->thread_pool_max = THREAD_POOL_MAX_THREADS_DEFAULT;
+}
+
 static EventLoopBaseParamInfo aio_max_batch_info = {
     "aio-max-batch", offsetof(EventLoopBase, aio_max_batch),
 };
+static EventLoopBaseParamInfo thread_pool_min_info = {
+    "thread-pool-min", offsetof(EventLoopBase, thread_pool_min),
+};
+static EventLoopBaseParamInfo thread_pool_max_info = {
+    "thread-pool-max", offsetof(EventLoopBase, thread_pool_max),
+};
 
 static void event_loop_base_get_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
@@ -95,12 +109,21 @@ static void event_loop_base_class_init(ObjectClass *klass, void *class_data)
                               event_loop_base_get_param,
                               event_loop_base_set_param,
                               NULL, &aio_max_batch_info);
+    object_class_property_add(klass, "thread-pool-min", "int",
+                              event_loop_base_get_param,
+                              event_loop_base_set_param,
+                              NULL, &thread_pool_min_info);
+    object_class_property_add(klass, "thread-pool-max", "int",
+                              event_loop_base_get_param,
+                              event_loop_base_set_param,
+                              NULL, &thread_pool_max_info);
 }
 
 static const TypeInfo event_loop_base_info = {
     .name = TYPE_EVENT_LOOP_BASE,
     .parent = TYPE_OBJECT,
     .instance_size = sizeof(EventLoopBase),
+    .instance_init = event_loop_base_instance_init,
     .class_size = sizeof(EventLoopBaseClass),
     .class_init = event_loop_base_class_init,
     .abstract = true,
diff --git a/include/block/aio.h b/include/block/aio.h
index 5634173b12..d128558f1d 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -192,6 +192,8 @@ struct AioContext {
     QSLIST_HEAD(, Coroutine) scheduled_coroutines;
     QEMUBH *co_schedule_bh;
 
+    int thread_pool_min;
+    int thread_pool_max;
     /* Thread pool for performing work and receiving completion callbacks.
      * Has its own locking.
      */
@@ -769,4 +771,12 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
 void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
                                 Error **errp);
 
+/**
+ * aio_context_set_thread_pool_params:
+ * @ctx: the aio context
+ * @min: min number of threads to have readily available in the thread pool
+ * @min: max number of threads the thread pool can contain
+ */
+void aio_context_set_thread_pool_params(AioContext *ctx, int64_t min,
+                                        int64_t max, Error **errp);
 #endif
diff --git a/include/block/thread-pool.h b/include/block/thread-pool.h
index 7dd7d730a0..2020bcc92d 100644
--- a/include/block/thread-pool.h
+++ b/include/block/thread-pool.h
@@ -20,6 +20,8 @@
 
 #include "block/block.h"
 
+#define THREAD_POOL_MAX_THREADS_DEFAULT         64
+
 typedef int ThreadPoolFunc(void *opaque);
 
 typedef struct ThreadPool ThreadPool;
@@ -33,5 +35,6 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
 int coroutine_fn thread_pool_submit_co(ThreadPool *pool,
         ThreadPoolFunc *func, void *arg);
 void thread_pool_submit(ThreadPool *pool, ThreadPoolFunc *func, void *arg);
+void thread_pool_update_params(ThreadPool *pool, struct AioContext *ctx);
 
 #endif
diff --git a/include/sysemu/event-loop-base.h b/include/sysemu/event-loop-base.h
index fced4c9fea..2748bf6ae1 100644
--- a/include/sysemu/event-loop-base.h
+++ b/include/sysemu/event-loop-base.h
@@ -33,5 +33,9 @@ struct EventLoopBase {
 
     /* AioContext AIO engine parameters */
     int64_t aio_max_batch;
+
+    /* AioContext thread pool parameters */
+    int64_t thread_pool_min;
+    int64_t thread_pool_max;
 };
 #endif
diff --git a/iothread.c b/iothread.c
index 8fa2f3bfb8..529194a566 100644
--- a/iothread.c
+++ b/iothread.c
@@ -174,6 +174,9 @@ static void iothread_set_aio_context_params(EventLoopBase *base, Error **errp)
     aio_context_set_aio_params(iothread->ctx,
                                iothread->parent_obj.aio_max_batch,
                                errp);
+
+    aio_context_set_thread_pool_params(iothread->ctx, base->thread_pool_min,
+                                       base->thread_pool_max, errp);
 }
 
 
diff --git a/qapi/qom.json b/qapi/qom.json
index c8eb192772..54ef28b4a9 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -520,13 +520,22 @@
 #                 0 means that the engine will use its default
 #                 (default:0, since 6.1)
 #
+# @thread-pool-min: minimum number of threads readily available in the thread
+#                   pool
+#                   (default:0, since 6.2)
+#
+# @thread-pool-max: maximum number of threads the thread pool can contain
+#                   (default:64, since 6.2)
+#
 # Since: 2.0
 ##
 { 'struct': 'IothreadProperties',
   'data': { '*poll-max-ns': 'int',
             '*poll-grow': 'int',
             '*poll-shrink': 'int',
-            '*aio-max-batch': 'int' } }
+            '*aio-max-batch': 'int',
+            '*thread-pool-min': 'int',
+            '*thread-pool-max': 'int' } }
 
 ##
 # @MainLoopProperties:
@@ -537,10 +546,19 @@
 #                 0 means that the engine will use its default
 #                 (default:0, since 6.1)
 #
+# @thread-pool-min: minimum number of threads readily available in the thread
+#                   pool
+#                   (default:0, since 6.2)
+#
+# @thread-pool-max: maximum number of threads the thread pool can contain
+#                   (default:64, since 6.2)
+#
 # Since: 2.0
 ##
 { 'struct': 'MainLoopProperties',
-  'data': { '*aio-max-batch': 'int' } }
+  'data': { '*aio-max-batch': 'int',
+            '*thread-pool-min': 'int',
+            '*thread-pool-max': 'int' } }
 
 ##
 # @MemoryBackendProperties:
diff --git a/util/aio-posix.c b/util/aio-posix.c
index 7b9f629218..926e6dafba 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "block/block.h"
+#include "block/thread-pool.h"
 #include "qemu/main-loop.h"
 #include "qemu/rcu.h"
 #include "qemu/rcu_queue.h"
diff --git a/util/async.c b/util/async.c
index 08d25feef5..93469a4668 100644
--- a/util/async.c
+++ b/util/async.c
@@ -562,6 +562,9 @@ AioContext *aio_context_new(Error **errp)
 
     ctx->aio_max_batch = 0;
 
+    ctx->thread_pool_min = 0;
+    ctx->thread_pool_max = THREAD_POOL_MAX_THREADS_DEFAULT;
+
     return ctx;
 fail:
     g_source_destroy(&ctx->source);
@@ -694,3 +697,20 @@ void qemu_set_current_aio_context(AioContext *ctx)
     assert(!my_aiocontext);
     my_aiocontext = ctx;
 }
+
+void aio_context_set_thread_pool_params(AioContext *ctx, int64_t min,
+                                        int64_t max, Error **errp)
+{
+
+    if (min > max || !max || min > INT_MAX || max > INT_MAX) {
+        error_setg(errp, "bad thread-pool-min/thread-pool-max values");
+        return;
+    }
+
+    ctx->thread_pool_min = min;
+    ctx->thread_pool_max = max;
+
+    if (ctx->thread_pool) {
+        thread_pool_update_params(ctx->thread_pool, ctx);
+    }
+}
diff --git a/util/main-loop.c b/util/main-loop.c
index 3bf5709374..ae02afb0f8 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -30,6 +30,7 @@
 #include "sysemu/replay.h"
 #include "qemu/main-loop.h"
 #include "block/aio.h"
+#include "block/thread-pool.h"
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "qemu/compiler.h"
@@ -187,12 +188,20 @@ int qemu_init_main_loop(Error **errp)
 
 static void main_loop_update_params(EventLoopBase *base, Error **errp)
 {
+    ERRP_GUARD();
+
     if (!qemu_aio_context) {
         error_setg(errp, "qemu aio context not ready");
         return;
     }
 
     aio_context_set_aio_params(qemu_aio_context, base->aio_max_batch, errp);
+    if (*errp) {
+        return;
+    }
+
+    aio_context_set_thread_pool_params(qemu_aio_context, base->thread_pool_min,
+                                       base->thread_pool_max, errp);
 }
 
 MainLoop *mloop;
diff --git a/util/thread-pool.c b/util/thread-pool.c
index fdb43c2d3b..749bcdcfad 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -21,6 +21,7 @@
 #include "trace.h"
 #include "block/thread-pool.h"
 #include "qemu/main-loop.h"
+#include "qapi/error.h"
 
 static void do_spawn_thread(ThreadPool *pool);
 
@@ -58,7 +59,6 @@ struct ThreadPool {
     QemuMutex lock;
     QemuCond worker_stopped;
     QemuSemaphore sem;
-    int max_threads;
     QEMUBH *new_thread_bh;
 
     /* The following variables are only accessed from one AioContext. */
@@ -71,8 +71,27 @@ struct ThreadPool {
     int new_threads;     /* backlog of threads we need to create */
     int pending_threads; /* threads created but not running yet */
     bool stopping;
+    int min_threads;
+    int max_threads;
 };
 
+static inline bool back_to_sleep(ThreadPool *pool, int ret)
+{
+    /*
+     * The semaphore timed out, we should exit the loop except when:
+     *  - There is work to do, we raced with the signal.
+     *  - The max threads threshold just changed, we raced with the signal.
+     *  - The thread pool forces a minimum number of readily available threads.
+     */
+    if (ret == -1 && (!QTAILQ_EMPTY(&pool->request_list) ||
+            pool->cur_threads > pool->max_threads ||
+            pool->cur_threads <= pool->min_threads)) {
+            return true;
+    }
+
+    return false;
+}
+
 static void *worker_thread(void *opaque)
 {
     ThreadPool *pool = opaque;
@@ -91,8 +110,9 @@ static void *worker_thread(void *opaque)
             ret = qemu_sem_timedwait(&pool->sem, 10000);
             qemu_mutex_lock(&pool->lock);
             pool->idle_threads--;
-        } while (ret == -1 && !QTAILQ_EMPTY(&pool->request_list));
-        if (ret == -1 || pool->stopping) {
+        } while (back_to_sleep(pool, ret));
+        if (ret == -1 || pool->stopping ||
+            pool->cur_threads > pool->max_threads) {
             break;
         }
 
@@ -294,6 +314,36 @@ void thread_pool_submit(ThreadPool *pool, ThreadPoolFunc *func, void *arg)
     thread_pool_submit_aio(pool, func, arg, NULL, NULL);
 }
 
+void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
+{
+    qemu_mutex_lock(&pool->lock);
+
+    pool->min_threads = ctx->thread_pool_min;
+    pool->max_threads = ctx->thread_pool_max;
+
+    /*
+     * We either have to:
+     *  - Increase the number available of threads until over the min_threads
+     *    threshold.
+     *  - Decrease the number of available threads until under the max_threads
+     *    threshold.
+     *  - Do nothing. the current number of threads fall in between the min and
+     *    max thresholds. We'll let the pool manage itself.
+     */
+    for (int i = pool->cur_threads; i < pool->min_threads; i++) {
+        spawn_thread(pool);
+    }
+
+    while (pool->cur_threads > pool->max_threads) {
+        qemu_sem_post(&pool->sem);
+        qemu_mutex_unlock(&pool->lock);
+        qemu_cond_wait(&pool->worker_stopped, &pool->lock);
+        qemu_mutex_lock(&pool->lock);
+    }
+
+    qemu_mutex_unlock(&pool->lock);
+}
+
 static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
 {
     if (!ctx) {
@@ -306,11 +356,12 @@ static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
     qemu_mutex_init(&pool->lock);
     qemu_cond_init(&pool->worker_stopped);
     qemu_sem_init(&pool->sem, 0);
-    pool->max_threads = 64;
     pool->new_thread_bh = aio_bh_new(ctx, spawn_thread_bh_fn, pool);
 
     QLIST_INIT(&pool->head);
     QTAILQ_INIT(&pool->request_list);
+
+    thread_pool_update_params(pool, ctx);
 }
 
 ThreadPool *thread_pool_new(AioContext *ctx)
-- 
2.35.1


