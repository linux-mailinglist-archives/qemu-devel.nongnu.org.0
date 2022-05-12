Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6D524B14
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 13:11:40 +0200 (CEST)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6jL-0004ZZ-Pq
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 07:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1np6IZ-0004G5-Gs
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1np6IX-0003Jb-LI
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652352237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quFxEO95jnlD94ibyjfWuzrFAbqey91/3t0dPTHAVwA=;
 b=J4347WT11ly8FBK99GpEC4CvU7teQYORfwgVYtm+U15QJZB0TIxJFMGwYxbXXGohnuXhlu
 42UMrUhYJK/neQXHZlfogVtoOHe+xstWugM0kQOqys2w+y7gJ7fCosF/s3Yna2QIa9HhAi
 mvzYoAuzFIHzcvQPeyzIprMh4nCx4N4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-uo_lZZuwM3OLByjIlJAY8A-1; Thu, 12 May 2022 06:43:56 -0400
X-MC-Unique: uo_lZZuwM3OLByjIlJAY8A-1
Received: by mail-ed1-f72.google.com with SMTP id
 k15-20020a508acf000000b0042a448a43cdso19864edk.13
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 03:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=quFxEO95jnlD94ibyjfWuzrFAbqey91/3t0dPTHAVwA=;
 b=1HbLbPzZ7ktwDRXfh9+ju6+RlMFau9xFPwKuViy2R4iVGi6Hwu9qbsVM1ntuylxleS
 /rL6wzs4CCXkYyFH7olO5omUutyDFFavqMqcgNRZyNbQ6kTxZN6qtLrf+jxfp7FUsyfS
 ydB21OzVfSSTyYNf2fTlrJl8WURPhHyR5SIB/9nTxuLkA7JeUxzm4EQh0B3Wzaf3JyY1
 /b4q/FLGajG0V6GYirKMjLS3nthImRX/+PWoHnpKolBMPsQ6uYjzlmDh8jH1ViA0TgyP
 92luBdiSzNazKSsHo1l+W5GodVQFpfK5BXK0CYJNNkze04+Cmu0+YIApYFXNp6g9Yus2
 xD6w==
X-Gm-Message-State: AOAM5336q9EmnWMnICf2XaoUijN0gvH1tLdgWQtIyb51r6ikjvaybu/X
 FmA6+Klj+N/mssR42LHkEmqqZvofJiFkcoM3HNTAoyiuKodbktqbzy8Lfo/mz8aokuoHEmegJwa
 QfyGwmliLXBDrdUuxhXhGY6iwcU51/tGUqDZIT7F8h+UrJg8BTZtuofAF5j5qyyl8wCA=
X-Received: by 2002:a17:907:c02:b0:6df:fb64:2770 with SMTP id
 ga2-20020a1709070c0200b006dffb642770mr30062054ejc.221.1652352234335; 
 Thu, 12 May 2022 03:43:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4X2CqxBYTT9bqG3JAurN6kuNHKSFw+crInL4ZKXDuj5grLyTDzW3ZfyEiIAQUwI3jVpsp/w==
X-Received: by 2002:a17:907:c02:b0:6df:fb64:2770 with SMTP id
 ga2-20020a1709070c0200b006dffb642770mr30062018ejc.221.1652352233934; 
 Thu, 12 May 2022 03:43:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a0564021f0700b0042617ba63d0sm2222036edb.90.2022.05.12.03.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 03:43:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: nsaenzju@redhat.com, stefanha@redhat.com,
 =?UTF-8?q?Luk=C3=A1=C5=A1=20Doktor?= <ldoktor@redhat.com>
Subject: [PATCH v2 2/3] thread-pool: replace semaphore with condition variable
Date: Thu, 12 May 2022 12:43:45 +0200
Message-Id: <20220512104346.865536-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512104346.865536-1-pbonzini@redhat.com>
References: <20220512104346.865536-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
 util/thread-pool.c | 64 +++++++++++++++++-----------------------------
 1 file changed, 24 insertions(+), 40 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 4979f30ca3..da189d9338 100644
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
@@ -99,20 +82,27 @@ static void *worker_thread(void *opaque)
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
+            if (ret == 0) {
+                if (QTAILQ_EMPTY(&pool->request_list) &&
+                    pool->cur_threads > pool->min_threads) {
+                    /* Timed out + no work to do + no need for warm threads = exit.  */
+                    break;
+                } else {
+                    /*
+                     * Even if there is some work to do, check if there aren't
+                     * too many worker threads before picking it up.
+                     */
+                    continue;
+                }
+            }
         }
 
         req = QTAILQ_FIRST(&pool->request_list);
@@ -229,13 +219,7 @@ static void thread_pool_cancel(BlockAIOCB *acb)
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
 
@@ -280,7 +264,7 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
     }
     QTAILQ_INSERT_TAIL(&pool->request_list, req, reqs);
     qemu_mutex_unlock(&pool->lock);
-    qemu_sem_post(&pool->sem);
+    qemu_cond_signal(&pool->request_cond);
     return &req->common;
 }
 
@@ -323,7 +307,7 @@ void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
      * We either have to:
      *  - Increase the number available of threads until over the min_threads
      *    threshold.
-     *  - Decrease the number of available threads until under the max_threads
+     *  - Bump the worker threads so that they exit, until under the max_threads
      *    threshold.
      *  - Do nothing. The current number of threads fall in between the min and
      *    max thresholds. We'll let the pool manage itself.
@@ -333,7 +317,7 @@ void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
     }
 
     for (int i = pool->cur_threads; i > pool->max_threads; i--) {
-        qemu_sem_post(&pool->sem);
+        qemu_cond_signal(&pool->request_cond);
     }
 
     qemu_mutex_unlock(&pool->lock);
@@ -350,7 +334,7 @@ static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
     pool->completion_bh = aio_bh_new(ctx, thread_pool_completion_bh, pool);
     qemu_mutex_init(&pool->lock);
     qemu_cond_init(&pool->worker_stopped);
-    qemu_sem_init(&pool->sem, 0);
+    qemu_cond_init(&pool->request_cond);
     pool->new_thread_bh = aio_bh_new(ctx, spawn_thread_bh_fn, pool);
 
     QLIST_INIT(&pool->head);
@@ -383,15 +367,15 @@ void thread_pool_free(ThreadPool *pool)
 
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


