Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A583E534441
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:36:27 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwnx-0004vu-Vc
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgz-0004qX-0N
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgx-0003pv-3Z
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCyKr7KYl7rrTx7mVdiORRVc39Z0IumNqgPEAKTb3Uo=;
 b=SD3RQ6FxmJp1FZ0eW7Zz021DBLpNn1n/Ty1yHK9o0PA10sp0Kv2zYockKFMR1itjsb9fNJ
 o5RIfoVGnNzq6D5BIBbBQAeIvddC/Sv9IyXwx18Lsk1D9uEidBrjBbh2Rluu/uO5z/+VCt
 jVDiLEUnIgnwMp7vBFF6jw4+tKa7SLI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-JAfAnKWjNvacFglRqc6o-w-1; Wed, 25 May 2022 15:29:09 -0400
X-MC-Unique: JAfAnKWjNvacFglRqc6o-w-1
Received: by mail-ej1-f70.google.com with SMTP id
 qn6-20020a170907870600b006ff0d367555so1966471ejc.8
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PCyKr7KYl7rrTx7mVdiORRVc39Z0IumNqgPEAKTb3Uo=;
 b=hXGVfCoRE/nIuCLx2oSnyQwJWEvyfs0BzM6JvqS2bgRE0IvYyfgqfCWOGW2GhAgniC
 OMFANmT82XzKjCF6PysrgB5FuZtr82lvYHoyRGpxOXFHecvdD3F/+YcqxLnIPjLjwYWV
 I5ZqCZu+EIJCoiUD6ZaHZtW1h3bti4hrPsjXh3T9f6/8VFTWLEd54crxl8M09UqDVoWn
 cEVqMDdpSC1OSxPafCEmw49Lae1vSe9fYSyYNBBiEEAplDb0kjGMhOM6RuFJAH+EgAsb
 /el1Rqr1E/VL0lxvIW9jfZdm0//tlwqjCIhae9oQV6PMLJZNg2dgLQTmNMcTzQNYRjso
 n+hg==
X-Gm-Message-State: AOAM5331qHHNHU5J8eW21RVtuJEjFsSj+AVsP9KnDetweRYfWXJ2TESO
 OL3fK1U+nsLkfO1VZrQTKJQyXw0rLqZFr5geSqqZ0tK9t9R6ho+jKEiIJDhnsFtpLeQjxMyqc0J
 jRcOTijuoKEqapIYUGgdrJ8GwMXDZ5QHvFgTMCG1OEB3a15Vk/LFLL2NIyFgdB8xBsec=
X-Received: by 2002:a05:6402:896:b0:42b:a9e1:a60b with SMTP id
 e22-20020a056402089600b0042ba9e1a60bmr7776838edy.394.1653506946294; 
 Wed, 25 May 2022 12:29:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGEfjznm4OMOs1ScgNEBHkR6Lzy8B4PKewO9ZJ5XjcT5/0d3JMDLfFqB1grGpX7MX6SY0htg==
X-Received: by 2002:a05:6402:896:b0:42b:a9e1:a60b with SMTP id
 e22-20020a056402089600b0042ba9e1a60bmr7776813edy.394.1653506945929; 
 Wed, 25 May 2022 12:29:05 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a056402015700b0042ab1735552sm11005752edu.66.2022.05.25.12.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Luk=C3=A1=C5=A1=20Doktor?= <ldoktor@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: [PULL 04/17] thread-pool: replace semaphore with condition variable
Date: Wed, 25 May 2022 21:28:39 +0200
Message-Id: <20220525192852.301633-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit f9fc8932b1 ("thread-posix: remove the posix semaphore
support", 2022-04-06) QemuSemaphore has its own mutex and condition
variable; this adds unnecessary overhead on I/O with small block sizes.

Check the QTAILQ directly instead of adding the indirection of a
semaphore's count.  Using a semaphore has not been necessary since
qemu_cond_timedwait was introduced; the new code has to be careful about
spurious wakeups but it is simpler, for example thread_pool_cancel does
not have to worry about synchronizing the semaphore count with the number
of elements of pool->request_list.

Note that the return value of qemu_cond_timedwait (0 for timeout, 1 for
signal or spurious wakeup) is different from that of qemu_sem_timedwait
(-1 for timeout, 0 for success).

Reported-by: Lukáš Doktor <ldoktor@redhat.com>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Message-Id: <20220514065012.1149539-3-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 68 +++++++++++++++++++---------------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 4979f30ca3..6e3d4e4a2f 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -57,7 +57,7 @@ struct ThreadPool {
     QEMUBH *completion_bh;
     QemuMutex lock;
     QemuCond worker_stopped;
-    QemuSemaphore sem;
+    QemuCond request_cond;
     QEMUBH *new_thread_bh;
 
     /* The following variables are only accessed from one AioContext. */
@@ -74,23 +74,6 @@ struct ThreadPool {
     int max_threads;
 };
 
-static inline bool back_to_sleep(ThreadPool *pool, int ret)
-{
-    /*
-     * The semaphore timed out, we should exit the loop except when:
-     *  - There is work to do, we raced with the signal.
-     *  - The max threads threshold just changed, we raced with the signal.
-     *  - The thread pool forces a minimum number of readily available threads.
-     */
-    if (ret == -1 && (!QTAILQ_EMPTY(&pool->request_list) ||
-            pool->cur_threads > pool->max_threads ||
-            pool->cur_threads <= pool->min_threads)) {
-            return true;
-    }
-
-    return false;
-}
-
 static void *worker_thread(void *opaque)
 {
     ThreadPool *pool = opaque;
@@ -99,20 +82,25 @@ static void *worker_thread(void *opaque)
     pool->pending_threads--;
     do_spawn_thread(pool);
 
-    while (!pool->stopping) {
+    while (!pool->stopping && pool->cur_threads <= pool->max_threads) {
         ThreadPoolElement *req;
         int ret;
 
-        do {
+        if (QTAILQ_EMPTY(&pool->request_list)) {
             pool->idle_threads++;
-            qemu_mutex_unlock(&pool->lock);
-            ret = qemu_sem_timedwait(&pool->sem, 10000);
-            qemu_mutex_lock(&pool->lock);
+            ret = qemu_cond_timedwait(&pool->request_cond, &pool->lock, 10000);
             pool->idle_threads--;
-        } while (back_to_sleep(pool, ret));
-        if (ret == -1 || pool->stopping ||
-            pool->cur_threads > pool->max_threads) {
-            break;
+            if (ret == 0 &&
+                QTAILQ_EMPTY(&pool->request_list) &&
+                pool->cur_threads > pool->min_threads) {
+                /* Timed out + no work to do + no need for warm threads = exit.  */
+                break;
+            }
+            /*
+             * Even if there was some work to do, check if there aren't
+             * too many worker threads before picking it up.
+             */
+            continue;
         }
 
         req = QTAILQ_FIRST(&pool->request_list);
@@ -134,6 +122,12 @@ static void *worker_thread(void *opaque)
     pool->cur_threads--;
     qemu_cond_signal(&pool->worker_stopped);
     qemu_mutex_unlock(&pool->lock);
+
+    /*
+     * Wake up another thread, in case we got a wakeup but decided
+     * to exit due to pool->cur_threads > pool->max_threads.
+     */
+    qemu_cond_signal(&pool->request_cond);
     return NULL;
 }
 
@@ -229,13 +223,7 @@ static void thread_pool_cancel(BlockAIOCB *acb)
     trace_thread_pool_cancel(elem, elem->common.opaque);
 
     QEMU_LOCK_GUARD(&pool->lock);
-    if (elem->state == THREAD_QUEUED &&
-        /* No thread has yet started working on elem. we can try to "steal"
-         * the item from the worker if we can get a signal from the
-         * semaphore.  Because this is non-blocking, we can do it with
-         * the lock taken and ensure that elem will remain THREAD_QUEUED.
-         */
-        qemu_sem_timedwait(&pool->sem, 0) == 0) {
+    if (elem->state == THREAD_QUEUED) {
         QTAILQ_REMOVE(&pool->request_list, elem, reqs);
         qemu_bh_schedule(pool->completion_bh);
 
@@ -280,7 +268,7 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
     }
     QTAILQ_INSERT_TAIL(&pool->request_list, req, reqs);
     qemu_mutex_unlock(&pool->lock);
-    qemu_sem_post(&pool->sem);
+    qemu_cond_signal(&pool->request_cond);
     return &req->common;
 }
 
@@ -323,7 +311,7 @@ void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
      * We either have to:
      *  - Increase the number available of threads until over the min_threads
      *    threshold.
-     *  - Decrease the number of available threads until under the max_threads
+     *  - Bump the worker threads so that they exit, until under the max_threads
      *    threshold.
      *  - Do nothing. The current number of threads fall in between the min and
      *    max thresholds. We'll let the pool manage itself.
@@ -333,7 +321,7 @@ void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
     }
 
     for (int i = pool->cur_threads; i > pool->max_threads; i--) {
-        qemu_sem_post(&pool->sem);
+        qemu_cond_signal(&pool->request_cond);
     }
 
     qemu_mutex_unlock(&pool->lock);
@@ -350,7 +338,7 @@ static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
     pool->completion_bh = aio_bh_new(ctx, thread_pool_completion_bh, pool);
     qemu_mutex_init(&pool->lock);
     qemu_cond_init(&pool->worker_stopped);
-    qemu_sem_init(&pool->sem, 0);
+    qemu_cond_init(&pool->request_cond);
     pool->new_thread_bh = aio_bh_new(ctx, spawn_thread_bh_fn, pool);
 
     QLIST_INIT(&pool->head);
@@ -383,15 +371,15 @@ void thread_pool_free(ThreadPool *pool)
 
     /* Wait for worker threads to terminate */
     pool->stopping = true;
+    qemu_cond_broadcast(&pool->request_cond);
     while (pool->cur_threads > 0) {
-        qemu_sem_post(&pool->sem);
         qemu_cond_wait(&pool->worker_stopped, &pool->lock);
     }
 
     qemu_mutex_unlock(&pool->lock);
 
     qemu_bh_delete(pool->completion_bh);
-    qemu_sem_destroy(&pool->sem);
+    qemu_cond_destroy(&pool->request_cond);
     qemu_cond_destroy(&pool->worker_stopped);
     qemu_mutex_destroy(&pool->lock);
     g_free(pool);
-- 
2.36.1



