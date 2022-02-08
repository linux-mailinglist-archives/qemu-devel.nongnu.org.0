Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0AD4ADEED
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:08:41 +0100 (CET)
Received: from localhost ([::1]:49936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTyq-0007rB-Bn
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:08:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRfc-0007Hz-0s
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:40:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRfS-0000uz-Kx
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644331220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8wOYuV3ozxuRFG6VY8rxEm8MMm3OZH2fJZekhTkgtc=;
 b=X/NBop008ncaNLgv+i3nTC5LGOcVssDRo8G23NTJ+ARfoGo7PPBFLGWNfWaEWfHzpRHIj7
 BMaFoYqpUV3Wrq8pOj5cUPIh+18MVHGk9SbQ8TbRdvfZSkuiWQOU8ttyHcERyPlBXe0wGj
 x7dJ9qN/+mV9od6elPOhLh5fB1uCphY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-7Uw_fPsEMf-a8jv2v-By3A-1; Tue, 08 Feb 2022 09:40:17 -0500
X-MC-Unique: 7Uw_fPsEMf-a8jv2v-By3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC458145E0;
 Tue,  8 Feb 2022 14:40:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21EF9798BF;
 Tue,  8 Feb 2022 14:40:13 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/3] jobs: add job-driver.h
Date: Tue,  8 Feb 2022 09:39:55 -0500
Message-Id: <20220208143955.1078618-4-eesposit@redhat.com>
In-Reply-To: <20220208143955.1078618-1-eesposit@redhat.com>
References: <20220208143955.1078618-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

job-driver.h contains all functions of job.h that are used by
the drivers (JobDriver, BlockJobDriver).

These functions are unaware of the job_mutex,
so they all take and release the lock internally.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job-driver.h | 211 ++++++++++++++++++++++++++++++++++++++
 include/qemu/job.h        | 167 +-----------------------------
 job.c                     |   3 +-
 3 files changed, 215 insertions(+), 166 deletions(-)
 create mode 100644 include/qemu/job-driver.h

diff --git a/include/qemu/job-driver.h b/include/qemu/job-driver.h
new file mode 100644
index 0000000000..a78c8fa305
--- /dev/null
+++ b/include/qemu/job-driver.h
@@ -0,0 +1,211 @@
+/*
+ * Declarations for background jobs
+ *
+ * Copyright (c) 2011 IBM Corp.
+ * Copyright (c) 2012, 2018 Red Hat, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef JOB_DRIVER_H
+#define JOB_DRIVER_H
+
+#include "job-common.h"
+
+/*
+ * Job driver API.
+ *
+ * These functions use are used by job drivers like mirror,
+ * stream, commit etc. The driver is not aware of the job_mutex
+ * presence, so these functions use it internally to protect
+ * job fields (see job-common.h).
+ *
+ * Therefore, each function in this API that requires protection
+ * must have the comment
+ * "Called with job_mutext *not* held"
+ */
+
+
+/**
+ * Create a new long-running job and return it.
+ * Called with job_mutex *not* held.
+ *
+ * @job_id: The id of the newly-created job, or %NULL for internal jobs
+ * @driver: The class object for the newly-created job.
+ * @txn: The transaction this job belongs to, if any. %NULL otherwise.
+ * @ctx: The AioContext to run the job coroutine in.
+ * @flags: Creation flags for the job. See @JobCreateFlags.
+ * @cb: Completion function for the job.
+ * @opaque: Opaque pointer value passed to @cb.
+ * @errp: Error object.
+ */
+void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
+                 AioContext *ctx, int flags, BlockCompletionFunc *cb,
+                 void *opaque, Error **errp);
+
+/**
+ * @job: The job that has made progress
+ * @done: How much progress the job made since the last call
+ *
+ * Updates the progress counter of the job.
+ *
+ * Progress API is thread safe.
+ */
+void job_progress_update(Job *job, uint64_t done);
+
+/**
+ * @job: The job whose expected progress end value is set
+ * @remaining: Missing progress (on top of the current progress counter value)
+ *             until the new expected end value is reached
+ *
+ * Sets the expected end value of the progress counter of a job so that a
+ * completion percentage can be calculated when the progress is updated.
+ *
+ * Progress API is thread safe.
+ */
+void job_progress_set_remaining(Job *job, uint64_t remaining);
+
+/**
+ * @job: The job whose expected progress end value is updated
+ * @delta: Value which is to be added to the current expected end
+ *         value
+ *
+ * Increases the expected end value of the progress counter of a job.
+ * This is useful for parenthesis operations: If a job has to
+ * conditionally perform a high-priority operation as part of its
+ * progress, it calls this function with the expected operation's
+ * length before, and job_progress_update() afterwards.
+ * (So the operation acts as a parenthesis in regards to the main job
+ * operation running in background.)
+ *
+ * Progress API is thread safe.
+ */
+void job_progress_increase_remaining(Job *job, uint64_t delta);
+
+/**
+ * @job: A job that has not yet been started.
+ *
+ * Begins execution of a job.
+ * Takes ownership of one reference to the job object.
+ *
+ * Called with job_mutex *not* held.
+ */
+void job_start(Job *job);
+
+/**
+ * @job: The job to enter.
+ * Called with job_mutex *not* held.
+ *
+ * Continue the specified job by entering the coroutine.
+ * Called with job_mutex lock *not* held.
+ */
+void job_enter(Job *job);
+
+/**
+ * @job: The job that is ready to pause.
+ *
+ * Pause now if job_pause_locked() has been called. Jobs that perform lots of
+ * I/O must call this between requests so that the job can be paused.
+ *
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
+ */
+void coroutine_fn job_pause_point(Job *job);
+
+/**
+ * @job: The job that calls the function.
+ *
+ * Yield the job coroutine.
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
+ */
+void job_yield(Job *job);
+
+/**
+ * @job: The job that calls the function.
+ * @ns: How many nanoseconds to stop for.
+ *
+ * Put the job to sleep (assuming that it wasn't canceled) for @ns
+ * %QEMU_CLOCK_REALTIME nanoseconds.  Canceling the job will immediately
+ * interrupt the wait.
+ *
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
+ */
+void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
+
+/**
+ * Returns whether the job is being cancelled.
+ * Called with job_mutex *not* held.
+ */
+bool job_is_cancelled(Job *job);
+
+/**
+ * Returns whether the job is scheduled for cancellation (at an
+ * indefinite point).
+ * Called with job_mutex *not* held.
+ */
+bool job_cancel_requested(Job *job);
+
+/**
+ * Returns whether the job is in a completed state.
+ * Called with job_mutex *not* held.
+ */
+bool job_is_completed(Job *job);
+
+/**
+ * Returns whether the job is ready to be completed.
+ * Called with job_mutex *not* held.
+ */
+bool job_is_ready(Job *job);
+
+/**
+ * The @job could not be started, free it.
+ * Called with job_mutex *not* held.
+ */
+void job_early_fail(Job *job);
+
+/**
+ * Moves the @job from RUNNING to READY.
+ * Called with job_mutex *not* held.
+ */
+void job_transition_to_ready(Job *job);
+
+/**
+ * Synchronously force-cancels all jobs using job_cancel_sync_locked().
+ *
+ * Called with job_lock *not* held, unlike most other APIs consumed
+ * by the monitor! This is primarly to avoid adding unnecessary lock-unlock
+ * patterns in the caller.
+ */
+void job_cancel_sync_all(void);
+
+/**
+ * Sets the @job->aio_context.
+ * Called with job_mutex *not* held.
+ *
+ * This function must run in the main thread to protect against
+ * concurrent read in job_finish_sync_locked(),
+ * takes the job_mutex lock to protect against the read in
+ * job_do_yield_locked(), and must be called when the coroutine
+ * is quiescent.
+ */
+void job_set_aio_context(Job *job, AioContext *ctx);
+
+#endif
diff --git a/include/qemu/job.h b/include/qemu/job.h
index c2bbdef8e8..4a0b01dd1d 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -27,171 +27,8 @@
 #define JOB_H
 
 #include "job-monitor.h"
+#include "job-driver.h"
 
-/**
- * Create a new long-running job and return it.
- * Called with job_mutex *not* held.
- *
- * @job_id: The id of the newly-created job, or %NULL for internal jobs
- * @driver: The class object for the newly-created job.
- * @txn: The transaction this job belongs to, if any. %NULL otherwise.
- * @ctx: The AioContext to run the job coroutine in.
- * @flags: Creation flags for the job. See @JobCreateFlags.
- * @cb: Completion function for the job.
- * @opaque: Opaque pointer value passed to @cb.
- * @errp: Error object.
- */
-void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
-                 AioContext *ctx, int flags, BlockCompletionFunc *cb,
-                 void *opaque, Error **errp);
-
-/**
- * @job: The job that has made progress
- * @done: How much progress the job made since the last call
- *
- * Updates the progress counter of the job.
- *
- * Progress API is thread safe.
- */
-void job_progress_update(Job *job, uint64_t done);
-
-/**
- * @job: The job whose expected progress end value is set
- * @remaining: Missing progress (on top of the current progress counter value)
- *             until the new expected end value is reached
- *
- * Sets the expected end value of the progress counter of a job so that a
- * completion percentage can be calculated when the progress is updated.
- *
- * Progress API is thread safe.
- */
-void job_progress_set_remaining(Job *job, uint64_t remaining);
-
-/**
- * @job: The job whose expected progress end value is updated
- * @delta: Value which is to be added to the current expected end
- *         value
- *
- * Increases the expected end value of the progress counter of a job.
- * This is useful for parenthesis operations: If a job has to
- * conditionally perform a high-priority operation as part of its
- * progress, it calls this function with the expected operation's
- * length before, and job_progress_update() afterwards.
- * (So the operation acts as a parenthesis in regards to the main job
- * operation running in background.)
- *
- * Progress API is thread safe.
- */
-void job_progress_increase_remaining(Job *job, uint64_t delta);
-
-/**
- * @job: A job that has not yet been started.
- *
- * Begins execution of a job.
- * Takes ownership of one reference to the job object.
- *
- * Called with job_mutex *not* held.
- */
-void job_start(Job *job);
-
-/**
- * @job: The job to enter.
- * Called with job_mutex *not* held.
- *
- * Continue the specified job by entering the coroutine.
- * Called with job_mutex lock *not* held.
- */
-void job_enter(Job *job);
-
-/**
- * @job: The job that is ready to pause.
- *
- * Pause now if job_pause_locked() has been called. Jobs that perform lots of
- * I/O must call this between requests so that the job can be paused.
- *
- * Called with job_mutex *not* held (we don't want the coroutine
- * to yield with the lock held!).
- */
-void coroutine_fn job_pause_point(Job *job);
-
-/**
- * @job: The job that calls the function.
- *
- * Yield the job coroutine.
- * Called with job_mutex *not* held (we don't want the coroutine
- * to yield with the lock held!).
- */
-void job_yield(Job *job);
-
-/**
- * @job: The job that calls the function.
- * @ns: How many nanoseconds to stop for.
- *
- * Put the job to sleep (assuming that it wasn't canceled) for @ns
- * %QEMU_CLOCK_REALTIME nanoseconds.  Canceling the job will immediately
- * interrupt the wait.
- *
- * Called with job_mutex *not* held (we don't want the coroutine
- * to yield with the lock held!).
- */
-void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
-
-/**
- * Returns whether the job is being cancelled.
- * Called with job_mutex *not* held.
- */
-bool job_is_cancelled(Job *job);
-
-/**
- * Returns whether the job is scheduled for cancellation (at an
- * indefinite point).
- * Called with job_mutex *not* held.
- */
-bool job_cancel_requested(Job *job);
-
-/**
- * Returns whether the job is in a completed state.
- * Called with job_mutex *not* held.
- */
-bool job_is_completed(Job *job);
-
-/**
- * Returns whether the job is ready to be completed.
- * Called with job_mutex *not* held.
- */
-bool job_is_ready(Job *job);
-
-/**
- * The @job could not be started, free it.
- * Called with job_mutex *not* held.
- */
-void job_early_fail(Job *job);
-
-/**
- * Moves the @job from RUNNING to READY.
- * Called with job_mutex *not* held.
- */
-void job_transition_to_ready(Job *job);
-
-/**
- * Synchronously force-cancels all jobs using job_cancel_sync_locked().
- *
- * Called with job_lock *not* held, unlike most other APIs consumed
- * by the monitor! This is primarly to avoid adding unnecessary lock-unlock
- * patterns in the caller.
- */
-void job_cancel_sync_all(void);
-
-/**
- * Sets the @job->aio_context.
- * Called with job_mutex *not* held.
- *
- * This function must run in the main thread to protect against
- * concurrent read in job_finish_sync_locked(),
- * takes the job_mutex lock to protect against the read in
- * job_do_yield_locked(), and must be called when the coroutine
- * is quiescent.
- */
-void job_set_aio_context(Job *job, AioContext *ctx);
+/* DO NOT ADD ANYTHING IN HERE. USE ONE OF THE HEADERS INCLUDED ABOVE */
 
 #endif
diff --git a/job.c b/job.c
index 844102befb..b72f7ea724 100644
--- a/job.c
+++ b/job.c
@@ -44,7 +44,8 @@
  *
  *
  * The second includes functions used by the block job drivers and sometimes
- * by the core block layer. These delegate the locking to the callee instead.
+ * by the core block layer. These delegate the locking to the callee instead,
+ * and are declared in job-driver.h.
  */
 
 /*
-- 
2.31.1


