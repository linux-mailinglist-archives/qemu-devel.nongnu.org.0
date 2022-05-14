Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7473B526E62
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 09:14:05 +0200 (CEST)
Received: from localhost ([::1]:33538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nplyV-0005vm-WD
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 03:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nplbc-0008De-7u
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nplba-0007gJ-Bl
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652511021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Goert/XybtEtVkrF/ANLn1NzOTmfBrnUeEE5CL4GFx0=;
 b=jVYF5wKc9ELTvK3FprzFkLI4rrhS1JjAStANB5Uz3xcUEX7PXfG5CMBWDVB6l4tXu455uG
 GD0S68Oi3UgR1pTutwII8jDz20GDHAKIHFo7QvGhgkRcB6jCJ43K3v8F+E4GtlA52zDJwW
 u8ZMr+VKkhg8spDtCN+AN4hJHBClTxw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-qQ3I1U0aP4mBqkZZHkFpHQ-1; Sat, 14 May 2022 02:50:20 -0400
X-MC-Unique: qQ3I1U0aP4mBqkZZHkFpHQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 205-20020a1c02d6000000b003928cd3853aso7053713wmc.9
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 23:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Goert/XybtEtVkrF/ANLn1NzOTmfBrnUeEE5CL4GFx0=;
 b=6McQ91oUh3LuLWLGnMzsNYUyf6c9ncN8mqh+jFCUlHntrqb7iAs2oxKY/6KvUq0hBQ
 RTaIeFP5MlXowqQp1WvkoGU/hyXj719cS63Qf264N8V577ydtQJTfDpulubkm+q+keki
 lvcqj4TQz+vidforw5HEOfYl6o5kiiUfwohLEs1+0+SzQJlNXc07e0ctzkYwEL4Ol9uu
 f0L6qCxg87n/XS2MBs3jZ87YdpViY7qWmI3kP6cYcbfXEa3uVg+mwkZwkcaIdOW7l5Hv
 i7x1ctm1OWWhGO5XMJ9F+sgn17HiYFrqNMCdBfegsf3nKJ3FypMkQyqyq3IuFmHkdh+j
 qJIA==
X-Gm-Message-State: AOAM532gL2vIZ73+dznCUmZTXAGxuvXOCgmjgOTaxE74XrjsubLHoHw5
 4CEBZaj+4vGGqVWDFDMntHYYFlYQQJ/oW5lpd9cg/hwhZ9DWO38armOFc5YWDRlLQea+9K3Onk9
 TEE7Zx7BNNeQ0giOUDN6DtiOgyjSyXJOz4n6V8G+/0g+tx49WJFPC+Ajw1PAsyuRh5Nc=
X-Received: by 2002:a05:600c:19ca:b0:394:8dc0:b5c2 with SMTP id
 u10-20020a05600c19ca00b003948dc0b5c2mr7718428wmq.167.1652511018508; 
 Fri, 13 May 2022 23:50:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHlfxk0oEY3E4mo/7i1NOHNYsQ+BMxFZ4qZ8LR5Yxo1lUW5E94WY4uZ07KiDiNhxqE9chCZg==
X-Received: by 2002:a05:600c:19ca:b0:394:8dc0:b5c2 with SMTP id
 u10-20020a05600c19ca00b003948dc0b5c2mr7718408wmq.167.1652511018207; 
 Fri, 13 May 2022 23:50:18 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 e9-20020adfc849000000b0020c5253d926sm4032689wrh.114.2022.05.13.23.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 23:50:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, nsaenzju@redhat.com,
 =?UTF-8?q?Luk=C3=A1=C5=A1=20Doktor?= <ldoktor@redhat.com>
Subject: [PATCH v3 2/3] thread-pool: replace semaphore with condition variable
Date: Sat, 14 May 2022 08:50:11 +0200
Message-Id: <20220514065012.1149539-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220514065012.1149539-1-pbonzini@redhat.com>
References: <20220514065012.1149539-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 68 +++++++++++++++++++---------------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 4979f30ca3..6bbf24754a 100644
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
+    qemu_cond_signal(&pool->worker_stopped);
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
2.36.0


