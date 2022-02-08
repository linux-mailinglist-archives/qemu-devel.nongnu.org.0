Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A6F4ADF0F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:14:27 +0100 (CET)
Received: from localhost ([::1]:33174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHU4Q-0007hK-Tw
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:14:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRfc-0007Hx-0H
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:40:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRfS-0000qw-Kj
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644331215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EeeoGlUMv397nHOTt+k8eb/Vb2eODiLIKSUmdlCBt+8=;
 b=D4ciBmnHRrtkLrw/l5Ttsf0+i9T2WtlIGJ4fWPJ3WB/RQLTixfEFcZOtxvMF2BfwYOBlWW
 24EhLsysVY1h5ZE8XXBGy8UYpAOgm+aVqIRrVzL3G31RSMi10NE5IF9k/+kK/fsQqII+k+
 FN4f9zKCAvh9q3vtPQKX/lm7eNG7M4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-SY7oOGkuPyiOIsbrlw0jog-1; Tue, 08 Feb 2022 09:40:14 -0500
X-MC-Unique: SY7oOGkuPyiOIsbrlw0jog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06E5818B613A;
 Tue,  8 Feb 2022 14:40:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6ED38798B0;
 Tue,  8 Feb 2022 14:40:12 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/3] jobs: add job-monitor.h
Date: Tue,  8 Feb 2022 09:39:54 -0500
Message-Id: <20220208143955.1078618-3-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

job-monitor.h contains all functions of job.h that are used by the
monitor and essentially all functions that do not define a
JobDriver/Blockdriver.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job-monitor.h | 249 +++++++++++++++++++++++++++++++++++++
 include/qemu/job.h         | 204 +-----------------------------
 job.c                      |   1 +
 3 files changed, 251 insertions(+), 203 deletions(-)
 create mode 100644 include/qemu/job-monitor.h

diff --git a/include/qemu/job-monitor.h b/include/qemu/job-monitor.h
new file mode 100644
index 0000000000..58e99a9a47
--- /dev/null
+++ b/include/qemu/job-monitor.h
@@ -0,0 +1,249 @@
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
+#ifndef JOB_MONITOR_H
+#define JOB_MONITOR_H
+
+#include "job-common.h"
+
+/*
+ * Job monitor API.
+ *
+ * These functions use are used by the QEMU monitor, for example
+ * to execute QMP commands. The monitor is aware of the job_mutex
+ * presence, so these functions assume it is held by the caller
+ * to protect job fields (see job-common.h).
+ * This prevents TOC/TOU bugs, allowing the caller to hold the
+ * lock between a check in the job state and the actual action.
+ *
+ * Therefore, each function in this API that needs protection
+ * must have the suffix "_locked" and the comment
+ * "Called between job_lock and job_unlock."
+ */
+
+
+/**
+ * Allocate and return a new job transaction. Jobs can be added to the
+ * transaction using job_txn_add_job_locked().
+ *
+ * The transaction is automatically freed when the last job completes or is
+ * cancelled.
+ *
+ * All jobs in the transaction either complete successfully or fail/cancel as a
+ * group.  Jobs wait for each other before completing.  Cancelling one job
+ * cancels all jobs in the transaction.
+ */
+JobTxn *job_txn_new(void);
+
+/**
+ * Release a reference that was previously acquired with job_txn_add_job_locked
+ * or job_txn_new. If it's the last reference to the object, it will be freed.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_txn_unref_locked(JobTxn *txn);
+
+/**
+ * Add a reference to Job refcnt, it will be decreased with job_unref_locked,
+ * and then be freed if it comes to be the last reference.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_ref_locked(Job *job);
+
+/**
+ * Release a reference that was previously acquired with job_ref_locked() or
+ * job_create(). If it's the last reference to the object, it will be freed.
+ *
+ * Called between job_lock and job_unlock, but might release it temporarly.
+ */
+void job_unref_locked(Job *job);
+
+/**
+ * Conditionally enter the job coroutine if the job is ready to run, not
+ * already busy and fn() returns true. fn() is called while under the job_lock
+ * critical section.
+ *
+ * Called between job_lock and job_unlock, but might release it temporarly.
+ */
+void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
+
+/** Just like job_is_cancelled, but called between job_lock and job_unlock */
+bool job_is_cancelled_locked(Job *job);
+
+/** Same as job_is_completed(), but assumes job_lock is held. */
+bool job_is_completed_locked(Job *job);
+
+/** Same as job_is_ready(), but assumes job_lock is held. */
+bool job_is_ready_locked(Job *job);
+
+/**
+ * Request @job to pause at the next pause point. Must be paired with
+ * job_resume_locked(). If the job is supposed to be resumed by user action,
+ * call job_user_pause_locked() instead.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_pause_locked(Job *job);
+
+/**
+ * Resumes a @job paused with job_pause_locked.
+ * Called between job_lock and job_unlock.
+ */
+void job_resume_locked(Job *job);
+
+/**
+ * Asynchronously pause the specified @job.
+ * Do not allow a resume until a matching call to job_user_resume_locked.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_user_pause_locked(Job *job, Error **errp);
+
+/**
+ * Returns true if the job is user-paused.
+ * Called between job_lock and job_unlock.
+ */
+bool job_user_paused_locked(Job *job);
+
+/**
+ * Resume the specified @job.
+ * Must be paired with a preceding job_user_pause_locked.
+ *
+ * Called between job_lock and job_unlock, but might release it temporarly.
+ */
+void job_user_resume_locked(Job *job, Error **errp);
+
+/**
+ * Get the next element from the list of block jobs after @job, or the
+ * first one if @job is %NULL.
+ *
+ * Returns the requested job, or %NULL if there are no more jobs left.
+ *
+ * Called between job_lock and job_unlock.
+ */
+Job *job_next_locked(Job *job);
+
+/**
+ * Get the job identified by @id (which must not be %NULL).
+ *
+ * Returns the requested job, or %NULL if it doesn't exist.
+ *
+ * Called between job_lock and job_unlock.
+ */
+Job *job_get_locked(const char *id);
+
+/**
+ * Check whether the verb @verb can be applied to @job in its current state.
+ * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
+ * returned.
+ *
+ * Called between job_lock and job_unlock.
+ */
+int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp);
+
+/**
+ * Asynchronously complete the specified @job.
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
+ */
+void job_complete_locked(Job *job, Error **errp);
+
+/**
+ * Asynchronously cancel the specified @job. If @force is true, the job should
+ * be cancelled immediately without waiting for a consistent state.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_cancel_locked(Job *job, bool force);
+
+/**
+ * Cancels the specified job like job_cancel_locked(), but may refuse to do so
+ * if the operation isn't meaningful in the current state of the job.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_user_cancel_locked(Job *job, bool force, Error **errp);
+
+/**
+ * Synchronously cancel the @job.  The completion callback is called
+ * before the function returns.  If @force is false, the job may
+ * actually complete instead of canceling itself; the circumstances
+ * under which this happens depend on the kind of job that is active.
+ *
+ * Returns the return value from the job if the job actually completed
+ * during the call, or -ECANCELED if it was canceled.
+ *
+ * Called between job_lock and job_unlock.
+ */
+int job_cancel_sync_locked(Job *job, bool force);
+
+/**
+ * @job: The job to be completed.
+ * @errp: Error object which may be set by job_complete_locked(); this is not
+ *        necessarily set on every error, the job return value has to be
+ *        checked as well.
+ *
+ * Synchronously complete the job.  The completion callback is called before the
+ * function returns, unless it is NULL (which is permissible when using this
+ * function).
+ *
+ * Returns the return value from the job.
+ * Called between job_lock and job_unlock.
+ */
+int job_complete_sync_locked(Job *job, Error **errp);
+
+/**
+ * For a @job that has finished its work and is pending awaiting explicit
+ * acknowledgement to commit its work, this will commit that work.
+ *
+ * FIXME: Make the below statement universally true:
+ * For jobs that support the manual workflow mode, all graph changes that occur
+ * as a result will occur after this command and before a successful reply.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_finalize_locked(Job *job, Error **errp);
+
+/**
+ * Remove the concluded @job from the query list and resets the passed pointer
+ * to %NULL. Returns an error if the job is not actually concluded.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_dismiss_locked(Job **job, Error **errp);
+
+/**
+ * Synchronously finishes the given @job. If @finish is given, it is called to
+ * trigger completion or cancellation of the job.
+ *
+ * Returns 0 if the job is successfully completed, -ECANCELED if the job was
+ * cancelled before completing, and -errno in other error cases.
+ *
+ * Called between job_lock and job_unlock.
+ */
+int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
+                           Error **errp);
+
+#endif
diff --git a/include/qemu/job.h b/include/qemu/job.h
index cdfc603706..c2bbdef8e8 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -26,28 +26,7 @@
 #ifndef JOB_H
 #define JOB_H
 
-#include "job-common.h"
-
-/**
- * Allocate and return a new job transaction. Jobs can be added to the
- * transaction using job_txn_add_job_locked().
- *
- * The transaction is automatically freed when the last job completes or is
- * cancelled.
- *
- * All jobs in the transaction either complete successfully or fail/cancel as a
- * group.  Jobs wait for each other before completing.  Cancelling one job
- * cancels all jobs in the transaction.
- */
-JobTxn *job_txn_new(void);
-
-/**
- * Release a reference that was previously acquired with job_txn_add_job_locked
- * or job_txn_new. If it's the last reference to the object, it will be freed.
- *
- * Called between job_lock and job_unlock.
- */
-void job_txn_unref_locked(JobTxn *txn);
+#include "job-monitor.h"
 
 /**
  * Create a new long-running job and return it.
@@ -66,22 +45,6 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
                  AioContext *ctx, int flags, BlockCompletionFunc *cb,
                  void *opaque, Error **errp);
 
-/**
- * Add a reference to Job refcnt, it will be decreased with job_unref_locked,
- * and then be freed if it comes to be the last reference.
- *
- * Called between job_lock and job_unlock.
- */
-void job_ref_locked(Job *job);
-
-/**
- * Release a reference that was previously acquired with job_ref_locked() or
- * job_create(). If it's the last reference to the object, it will be freed.
- *
- * Called between job_lock and job_unlock, but might release it temporarly.
- */
-void job_unref_locked(Job *job);
-
 /**
  * @job: The job that has made progress
  * @done: How much progress the job made since the last call
@@ -121,15 +84,6 @@ void job_progress_set_remaining(Job *job, uint64_t remaining);
  */
 void job_progress_increase_remaining(Job *job, uint64_t delta);
 
-/**
- * Conditionally enter the job coroutine if the job is ready to run, not
- * already busy and fn() returns true. fn() is called while under the job_lock
- * critical section.
- *
- * Called between job_lock and job_unlock, but might release it temporarly.
- */
-void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
-
 /**
  * @job: A job that has not yet been started.
  *
@@ -188,9 +142,6 @@ void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
  */
 bool job_is_cancelled(Job *job);
 
-/** Just like job_is_cancelled, but called between job_lock and job_unlock */
-bool job_is_cancelled_locked(Job *job);
-
 /**
  * Returns whether the job is scheduled for cancellation (at an
  * indefinite point).
@@ -204,83 +155,12 @@ bool job_cancel_requested(Job *job);
  */
 bool job_is_completed(Job *job);
 
-/** Same as job_is_completed(), but assumes job_lock is held. */
-bool job_is_completed_locked(Job *job);
-
 /**
  * Returns whether the job is ready to be completed.
  * Called with job_mutex *not* held.
  */
 bool job_is_ready(Job *job);
 
-/** Same as job_is_ready(), but assumes job_lock is held. */
-bool job_is_ready_locked(Job *job);
-
-/**
- * Request @job to pause at the next pause point. Must be paired with
- * job_resume_locked(). If the job is supposed to be resumed by user action,
- * call job_user_pause_locked() instead.
- *
- * Called between job_lock and job_unlock.
- */
-void job_pause_locked(Job *job);
-
-/**
- * Resumes a @job paused with job_pause_locked.
- * Called between job_lock and job_unlock.
- */
-void job_resume_locked(Job *job);
-
-/**
- * Asynchronously pause the specified @job.
- * Do not allow a resume until a matching call to job_user_resume_locked.
- *
- * Called between job_lock and job_unlock.
- */
-void job_user_pause_locked(Job *job, Error **errp);
-
-/**
- * Returns true if the job is user-paused.
- * Called between job_lock and job_unlock.
- */
-bool job_user_paused_locked(Job *job);
-
-/**
- * Resume the specified @job.
- * Must be paired with a preceding job_user_pause_locked.
- *
- * Called between job_lock and job_unlock, but might release it temporarly.
- */
-void job_user_resume_locked(Job *job, Error **errp);
-
-/**
- * Get the next element from the list of block jobs after @job, or the
- * first one if @job is %NULL.
- *
- * Returns the requested job, or %NULL if there are no more jobs left.
- *
- * Called between job_lock and job_unlock.
- */
-Job *job_next_locked(Job *job);
-
-/**
- * Get the job identified by @id (which must not be %NULL).
- *
- * Returns the requested job, or %NULL if it doesn't exist.
- *
- * Called between job_lock and job_unlock.
- */
-Job *job_get_locked(const char *id);
-
-/**
- * Check whether the verb @verb can be applied to @job in its current state.
- * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
- * returned.
- *
- * Called between job_lock and job_unlock.
- */
-int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp);
-
 /**
  * The @job could not be started, free it.
  * Called with job_mutex *not* held.
@@ -293,41 +173,6 @@ void job_early_fail(Job *job);
  */
 void job_transition_to_ready(Job *job);
 
-/**
- * Asynchronously complete the specified @job.
- * Called between job_lock and job_unlock, but it releases the lock temporarly.
- */
-void job_complete_locked(Job *job, Error **errp);
-
-/**
- * Asynchronously cancel the specified @job. If @force is true, the job should
- * be cancelled immediately without waiting for a consistent state.
- *
- * Called between job_lock and job_unlock.
- */
-void job_cancel_locked(Job *job, bool force);
-
-/**
- * Cancels the specified job like job_cancel_locked(), but may refuse to do so
- * if the operation isn't meaningful in the current state of the job.
- *
- * Called between job_lock and job_unlock.
- */
-void job_user_cancel_locked(Job *job, bool force, Error **errp);
-
-/**
- * Synchronously cancel the @job.  The completion callback is called
- * before the function returns.  If @force is false, the job may
- * actually complete instead of canceling itself; the circumstances
- * under which this happens depend on the kind of job that is active.
- *
- * Returns the return value from the job if the job actually completed
- * during the call, or -ECANCELED if it was canceled.
- *
- * Called between job_lock and job_unlock.
- */
-int job_cancel_sync_locked(Job *job, bool force);
-
 /**
  * Synchronously force-cancels all jobs using job_cancel_sync_locked().
  *
@@ -337,53 +182,6 @@ int job_cancel_sync_locked(Job *job, bool force);
  */
 void job_cancel_sync_all(void);
 
-/**
- * @job: The job to be completed.
- * @errp: Error object which may be set by job_complete_locked(); this is not
- *        necessarily set on every error, the job return value has to be
- *        checked as well.
- *
- * Synchronously complete the job.  The completion callback is called before the
- * function returns, unless it is NULL (which is permissible when using this
- * function).
- *
- * Returns the return value from the job.
- * Called between job_lock and job_unlock.
- */
-int job_complete_sync_locked(Job *job, Error **errp);
-
-/**
- * For a @job that has finished its work and is pending awaiting explicit
- * acknowledgement to commit its work, this will commit that work.
- *
- * FIXME: Make the below statement universally true:
- * For jobs that support the manual workflow mode, all graph changes that occur
- * as a result will occur after this command and before a successful reply.
- *
- * Called between job_lock and job_unlock.
- */
-void job_finalize_locked(Job *job, Error **errp);
-
-/**
- * Remove the concluded @job from the query list and resets the passed pointer
- * to %NULL. Returns an error if the job is not actually concluded.
- *
- * Called between job_lock and job_unlock.
- */
-void job_dismiss_locked(Job **job, Error **errp);
-
-/**
- * Synchronously finishes the given @job. If @finish is given, it is called to
- * trigger completion or cancellation of the job.
- *
- * Returns 0 if the job is successfully completed, -ECANCELED if the job was
- * cancelled before completing, and -errno in other error cases.
- *
- * Called between job_lock and job_unlock.
- */
-int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
-                           Error **errp);
-
 /**
  * Sets the @job->aio_context.
  * Called with job_mutex *not* held.
diff --git a/job.c b/job.c
index c7a41d88d6..844102befb 100644
--- a/job.c
+++ b/job.c
@@ -40,6 +40,7 @@
  * therefore needs consistency across job_get and the actual operation
  * (e.g. job_user_cancel). To achieve this consistency, the caller
  * calls job_lock/job_unlock itself around the whole operation.
+ * These functions are declared in job-monitor.h.
  *
  *
  * The second includes functions used by the block job drivers and sometimes
-- 
2.31.1


