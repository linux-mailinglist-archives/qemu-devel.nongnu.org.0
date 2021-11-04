Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE2445667
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:35:32 +0100 (CET)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miem4-00081U-0Q
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mieiI-00017S-GK
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mieiB-0001Z4-Th
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636039888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+e0bhI6YL1oRnFnXFBpkoprPfxvoWJGAcaFgecp9JoQ=;
 b=akhaVvTlDBztYHHhnWYar/lJJB/tt9z06iurqMwz3jJUJ230MH51zJfFHmVaI8VGqSfnSI
 ZawAh2Gb31lzjQcPrt0VCqWJIo7jq0e60qwz6aSshK7/ynWzQ/U1JHSNHBmytKlEaRTw6P
 bGrWjaQ4RLEIbRX/IVvH/gAt3Fxc8cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-H1wuQcu8OBWvEOTP-frnEg-1; Thu, 04 Nov 2021 11:31:27 -0400
X-MC-Unique: H1wuQcu8OBWvEOTP-frnEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB48311B4C16;
 Thu,  4 Nov 2021 15:31:26 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EA1A652AC;
 Thu,  4 Nov 2021 15:31:26 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 3/3] jobs: add job-driver.h
Date: Thu,  4 Nov 2021 11:31:21 -0400
Message-Id: <20211104153121.1362449-4-eesposit@redhat.com>
In-Reply-To: <20211104153121.1362449-1-eesposit@redhat.com>
References: <20211104153121.1362449-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 include/qemu/job-driver.h  | 173 +++++++++++++++++++++++++++++++++++++
 include/qemu/job-monitor.h |   4 +-
 include/qemu/job.h         | 129 +--------------------------
 job.c                      |   3 +-
 4 files changed, 179 insertions(+), 130 deletions(-)
 create mode 100644 include/qemu/job-driver.h

diff --git a/include/qemu/job-driver.h b/include/qemu/job-driver.h
new file mode 100644
index 0000000000..19ae5ce8f0
--- /dev/null
+++ b/include/qemu/job-driver.h
@@ -0,0 +1,173 @@
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
+ * in job.c
+ */
+
+/**
+ * Create a new long-running job and return it.
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
+ */
+void job_progress_increase_remaining(Job *job, uint64_t delta);
+
+/**
+ * @job: A job that has not yet been started.
+ *
+ * Begins execution of a job.
+ * Takes ownership of one reference to the job object.
+ */
+void job_start(Job *job);
+
+/**
+ * @job: The job to enter.
+ *
+ * Continue the specified job by entering the coroutine.
+ */
+void job_enter(Job *job);
+
+/**
+ * @job: The job that is ready to pause.
+ *
+ * Pause now if job_pause() has been called. Jobs that perform lots of I/O
+ * must call this between requests so that the job can be paused.
+ */
+void coroutine_fn job_pause_point(Job *job);
+
+/**
+ * @job: The job that calls the function.
+ *
+ * Yield the job coroutine.
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
+ */
+void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
+
+/**
+ * Returns whether the job is scheduled for cancellation (at an
+ * indefinite point).
+ */
+bool job_cancel_requested(Job *job);
+
+/** Returns whether the job is scheduled for cancellation. */
+bool job_is_cancelled(Job *job);
+
+/** Returns whether the job is ready to be completed. */
+bool job_is_ready(Job *job);
+
+/** The @job could not be started, free it. */
+void job_early_fail(Job *job);
+
+/** Moves the @job from RUNNING to READY */
+void job_transition_to_ready(Job *job);
+
+/** Enters the @job if it is not paused */
+void job_enter_not_paused(Job *job);
+
+/** returns @job->ret */
+bool job_has_failed(Job *job);
+
+/** Returns the @job->status */
+JobStatus job_get_status(Job *job);
+
+/** Returns the @job->pause_count */
+int job_get_pause_count(Job *job);
+
+/** Returns @job->paused */
+bool job_get_paused(Job *job);
+
+/** Returns @job->busy */
+bool job_get_busy(Job *job);
+
+/** Return true if @job not paused and not cancelled */
+bool job_not_paused_nor_cancelled(Job *job);
+
+#endif /* JOB_DRIVER_H */
diff --git a/include/qemu/job-monitor.h b/include/qemu/job-monitor.h
index 7189cdafef..edcdb1575f 100644
--- a/include/qemu/job-monitor.h
+++ b/include/qemu/job-monitor.h
@@ -273,10 +273,10 @@ void job_dismiss(Job **job, Error **errp);
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
                     Error **errp);
 
-/** Same as job_is_ready(), but assumes job_lock is held. */
+/** Same as job_is_ready() in job-driver.h, but assumes job_lock is held. */
 bool job_is_ready_locked(Job *job);
 
-/** Same as job_early_fail(), but assumes job_lock is held. */
+/** Same as job_early_fail() in job-driver.h, but assumes job_lock is held. */
 void job_early_fail_locked(Job *job);
 
 #endif
diff --git a/include/qemu/job.h b/include/qemu/job.h
index 79f5367f3d..4a0b01dd1d 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -27,133 +27,8 @@
 #define JOB_H
 
 #include "job-monitor.h"
+#include "job-driver.h"
 
-/**
- * Create a new long-running job and return it.
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
- */
-void job_progress_increase_remaining(Job *job, uint64_t delta);
-
-/**
- * @job: A job that has not yet been started.
- *
- * Begins execution of a job.
- * Takes ownership of one reference to the job object.
- */
-void job_start(Job *job);
-
-/**
- * @job: The job to enter.
- *
- * Continue the specified job by entering the coroutine.
- */
-void job_enter(Job *job);
-
-/**
- * @job: The job that is ready to pause.
- *
- * Pause now if job_pause() has been called. Jobs that perform lots of I/O
- * must call this between requests so that the job can be paused.
- */
-void coroutine_fn job_pause_point(Job *job);
-
-/**
- * @job: The job that calls the function.
- *
- * Yield the job coroutine.
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
- */
-void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
-
-/** Returns whether the job is being cancelled. */
-bool job_is_cancelled(Job *job);
-
-/**
- * Returns whether the job is scheduled for cancellation (at an
- * indefinite point).
- */
-bool job_cancel_requested(Job *job);
-
-/** Returns whether the job is ready to be completed. */
-bool job_is_ready(Job *job);
-
-/** The @job could not be started, free it. */
-void job_early_fail(Job *job);
-
-/** Moves the @job from RUNNING to READY */
-void job_transition_to_ready(Job *job);
-
-/** Enters the @job if it is not paused */
-void job_enter_not_paused(Job *job);
-
-/** returns @job->ret */
-bool job_has_failed(Job *job);
-
-/** Returns the @job->status */
-JobStatus job_get_status(Job *job);
-
-/** Returns the @job->pause_count */
-int job_get_pause_count(Job *job);
-
-/** Returns @job->paused */
-bool job_get_paused(Job *job);
-
-/** Returns @job->busy */
-bool job_get_busy(Job *job);
-
-/** Return true if @job not paused and not cancelled */
-bool job_not_paused_nor_cancelled(Job *job);
+/* DO NOT ADD ANYTHING IN HERE. USE ONE OF THE HEADERS INCLUDED ABOVE */
 
 #endif
diff --git a/job.c b/job.c
index aa8c4fe1b6..f225e770f5 100644
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
 
 
-- 
2.27.0


