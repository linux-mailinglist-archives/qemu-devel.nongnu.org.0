Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE0151C056
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 15:15:10 +0200 (CEST)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmbK2-00038X-0o
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 09:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmbIp-0001T5-9y
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:13:55 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:24218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmbIn-0007h2-EP
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651756432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rM5w4dOGEFRt6nxPv1eFZIsMEVDi+xSDgrxnzoxtcWU=;
 b=OpAzHvnN5iErHP8QC0mfxCek8rjRG03Gt3899+Aw9bdRYr+H4B6u56aHc9ImOr2bW79kh9
 +QebzcLcVxJOv+mbO5m2WR/RdAGXfdjWZ7iPLn246QKYbg7XofJib3NdqLjROgYr/MR7rU
 +3UKN2h2AXBogKy6T56PzNFHdQwtHUw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-pMZRCeFWM0W97LyxryndRA-1; Thu, 05 May 2022 09:13:51 -0400
X-MC-Unique: pMZRCeFWM0W97LyxryndRA-1
Received: by mail-ed1-f71.google.com with SMTP id
 c23-20020a50d657000000b00425d5162a0dso2296334edj.16
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 06:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rM5w4dOGEFRt6nxPv1eFZIsMEVDi+xSDgrxnzoxtcWU=;
 b=tGBCbYKOumvW+gFYzTEVC4vbkqB7Ki+A0ZzwBTnM+N6M1J0JzpuDc22WMz8sS2kbQ/
 64UV72eW6jDP3uLsUZrjTnukGX/5D6ZNCCMycTLnnf9yBGAVnC6KtApklzxBGcV+rQza
 zkXTwmxHRf0IpMZA0a0kG4x2ESgE7Jq4mbqMP0nX3cG6jb3035/mWoOTePcOyFZUBbkR
 9gnZEZM1l2uy7Q2nu3qn3h2woCdic0KZnN5xIn9VNRQ3tfGKf7tJydGKmum6pSIdihSz
 GV3BBa/qJfcd2xqM9UVLEZKRQCmITZGyQy/cgoAavRxhXjnfFFjPBPjVgG3mPZTBkIFZ
 ciHw==
X-Gm-Message-State: AOAM531PyRMcXoOSsnUYzTjQxogJPeJ7smsP6Fnwi9hNMFRKLCe1yvgk
 T7g8/mTnDVIOiPBGkHaICaUqjCIJ4BrIlXW/2NGBaBdfDkdu3/hddQRg7lypDKyXag6qIjC3zcI
 lmDNbJ1w1KL2NzSY3+96SrI1UqLrvV1Ty9JFjDtUO8MAXSJbSsLjTba+6CXj+ZqivI0s=
X-Received: by 2002:a05:6402:1913:b0:427:ba16:179d with SMTP id
 e19-20020a056402191300b00427ba16179dmr24129381edz.174.1651756429707; 
 Thu, 05 May 2022 06:13:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoRJ4QLcGZCV4GMqtKyOmlhb1ztMASvc6vNLQCDc8ooOYXFqaf9YciLnK0TNk3610ZeVeRBQ==
X-Received: by 2002:a05:6402:1913:b0:427:ba16:179d with SMTP id
 e19-20020a056402191300b00427ba16179dmr24129330edz.174.1651756429328; 
 Thu, 05 May 2022 06:13:49 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 hy21-20020a1709068a7500b006f3ef214dddsm750779ejc.67.2022.05.05.06.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 06:13:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: longpeng2@huawei.com,
 =?UTF-8?q?Luk=C3=A1=C5=A1=20Doktor?= <ldoktor@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] thread-pool: replace semaphore with condition variable
Date: Thu,  5 May 2022 15:13:46 +0200
Message-Id: <20220505131346.823941-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index d763cea505..ccdfc82d71 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -57,7 +57,7 @@ struct ThreadPool {
     QEMUBH *completion_bh;
     QemuMutex lock;
     QemuCond worker_stopped;
-    QemuSemaphore sem;
+    QemuCond request_cond;
     int max_threads;
     QEMUBH *new_thread_bh;
 
@@ -85,15 +85,14 @@ static void *worker_thread(void *opaque)
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
-        } while (ret == -1 && !QTAILQ_EMPTY(&pool->request_list));
-        if (ret == -1 || pool->stopping) {
-            break;
+            if (!ret && QTAILQ_EMPTY(&pool->request_list)) {
+                break;
+            }
+            continue;
         }
 
         req = QTAILQ_FIRST(&pool->request_list);
@@ -211,13 +210,7 @@ static void thread_pool_cancel(BlockAIOCB *acb)
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
 
@@ -261,8 +254,8 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
         spawn_thread(pool);
     }
     QTAILQ_INSERT_TAIL(&pool->request_list, req, reqs);
+    qemu_cond_signal(&pool->request_cond);
     qemu_mutex_unlock(&pool->lock);
-    qemu_sem_post(&pool->sem);
     return &req->common;
 }
 
@@ -305,7 +298,7 @@ static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
     pool->completion_bh = aio_bh_new(ctx, thread_pool_completion_bh, pool);
     qemu_mutex_init(&pool->lock);
     qemu_cond_init(&pool->worker_stopped);
-    qemu_sem_init(&pool->sem, 0);
+    qemu_cond_init(&pool->request_cond);
     pool->max_threads = 64;
     pool->new_thread_bh = aio_bh_new(ctx, spawn_thread_bh_fn, pool);
 
@@ -337,15 +330,14 @@ void thread_pool_free(ThreadPool *pool)
 
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
     qemu_cond_destroy(&pool->worker_stopped);
     qemu_mutex_destroy(&pool->lock);
     g_free(pool);
-- 
2.35.1


