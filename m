Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709CA5E9E6C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 11:55:36 +0200 (CEST)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ockpr-0005EF-Gf
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 05:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ockTk-0004uH-2Z
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ockTW-0000Jj-8E
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664184749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e12HXf0l7FvMV3dXOHsue2QhdDwboDnriKFG68MiHdM=;
 b=WWt9BQOMUvy5vLsDta5rum8MjNhczUcgEuh9yzEyJRxr/qcMHM/TiHbufLqXneZAI6EAnn
 s4IPka9B0x6eaEL73PEDXDIWXx/afTNxOWJYsIQsC5zxRntLFxyW6/tMjamN5BBtnLOVtg
 Wmv0baPXXoc2R5qDPcUyMlMyHVvaalc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-xg8meUQ3NLua1kgVV0kuMg-1; Mon, 26 Sep 2022 05:32:26 -0400
X-MC-Unique: xg8meUQ3NLua1kgVV0kuMg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC1C3857D10;
 Mon, 26 Sep 2022 09:32:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 866F0492CA2;
 Mon, 26 Sep 2022 09:32:25 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v12 21/21] job: remove unused functions
Date: Mon, 26 Sep 2022 05:32:14 -0400
Message-Id: <20220926093214.506243-22-eesposit@redhat.com>
In-Reply-To: <20220926093214.506243-1-eesposit@redhat.com>
References: <20220926093214.506243-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These public functions are not used anywhere, thus can be dropped.
Also, since this is the final job API that doesn't use AioContext
lock and replaces it with job_lock, adjust all remaining function
documentation to clearly specify if the job lock is taken or not.

Also document the locking requirements for a few functions
where the second version is not removed.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/job.h         | 110 +++++++++++++------------------------
 job.c                      | 107 ++----------------------------------
 tests/unit/test-blockjob.c |   4 +-
 3 files changed, 46 insertions(+), 175 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 8c8c58dada..32ad5622e1 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -384,6 +384,8 @@ JobTxn *job_txn_new(void);
 /**
  * Release a reference that was previously acquired with job_txn_add_job or
  * job_txn_new. If it's the last reference to the object, it will be freed.
+ *
+ * Called with job lock *not* held.
  */
 void job_txn_unref(JobTxn *txn);
 
@@ -413,21 +415,18 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
 /**
  * Add a reference to Job refcnt, it will be decreased with job_unref, and then
  * be freed if it comes to be the last reference.
+ *
+ * Called with job lock held.
  */
-void job_ref(Job *job);
-
-/* Same as job_ref(), but called with job lock held. */
 void job_ref_locked(Job *job);
 
 /**
- * Release a reference that was previously acquired with job_ref() or
+ * Release a reference that was previously acquired with job_ref_locked() or
  * job_create(). If it's the last reference to the object, it will be freed.
  *
  * Takes AioContext lock internally to invoke a job->driver callback.
+ * Called with job lock held.
  */
-void job_unref(Job *job);
-
-/* Same as job_unref(), but called with job lock held. */
 void job_unref_locked(Job *job);
 
 /**
@@ -473,12 +472,8 @@ void job_progress_increase_remaining(Job *job, uint64_t delta);
  * Conditionally enter the job coroutine if the job is ready to run, not
  * already busy and fn() returns true. fn() is called while under the job_lock
  * critical section.
- */
-void job_enter_cond(Job *job, bool(*fn)(Job *job));
-
-/*
- * Same as job_enter_cond(), but called with job lock held.
- * Might release the lock temporarily.
+ *
+ * Called with job lock held, but might release it temporarily.
  */
 void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
 
@@ -557,11 +552,8 @@ bool job_cancel_requested(Job *job);
 
 /**
  * Returns whether the job is in a completed state.
- * Called with job_mutex *not* held.
+ * Called with job lock held.
  */
-bool job_is_completed(Job *job);
-
-/* Same as job_is_completed(), but called with job lock held. */
 bool job_is_completed_locked(Job *job);
 
 /**
@@ -576,14 +568,16 @@ bool job_is_ready_locked(Job *job);
 /**
  * Request @job to pause at the next pause point. Must be paired with
  * job_resume(). If the job is supposed to be resumed by user action, call
- * job_user_pause() instead.
+ * job_user_pause_locked() instead.
+ *
+ * Called with job lock *not* held.
  */
 void job_pause(Job *job);
 
 /* Same as job_pause(), but called with job lock held. */
 void job_pause_locked(Job *job);
 
-/** Resumes a @job paused with job_pause. */
+/** Resumes a @job paused with job_pause. Called with job lock *not* held. */
 void job_resume(Job *job);
 
 /*
@@ -595,27 +589,20 @@ void job_resume_locked(Job *job);
 /**
  * Asynchronously pause the specified @job.
  * Do not allow a resume until a matching call to job_user_resume.
+ * Called with job lock held.
  */
-void job_user_pause(Job *job, Error **errp);
-
-/* Same as job_user_pause(), but called with job lock held. */
 void job_user_pause_locked(Job *job, Error **errp);
 
-/** Returns true if the job is user-paused. */
-bool job_user_paused(Job *job);
-
-/* Same as job_user_paused(), but called with job lock held. */
+/**
+ * Returns true if the job is user-paused.
+ * Called with job lock held.
+ */
 bool job_user_paused_locked(Job *job);
 
 /**
  * Resume the specified @job.
- * Must be paired with a preceding job_user_pause.
- */
-void job_user_resume(Job *job, Error **errp);
-
-/*
- * Same as job_user_resume(), but called with job lock held.
- * Might release the lock temporarily.
+ * Must be paired with a preceding job_user_pause_locked.
+ * Called with job lock held, but might release it temporarily.
  */
 void job_user_resume_locked(Job *job, Error **errp);
 
@@ -624,6 +611,7 @@ void job_user_resume_locked(Job *job, Error **errp);
  * first one if @job is %NULL.
  *
  * Returns the requested job, or %NULL if there are no more jobs left.
+ * Called with job lock *not* held.
  */
 Job *job_next(Job *job);
 
@@ -634,20 +622,17 @@ Job *job_next_locked(Job *job);
  * Get the job identified by @id (which must not be %NULL).
  *
  * Returns the requested job, or %NULL if it doesn't exist.
+ * Called with job lock held.
  */
-Job *job_get(const char *id);
-
-/* Same as job_get(), but called with job lock held. */
 Job *job_get_locked(const char *id);
 
 /**
  * Check whether the verb @verb can be applied to @job in its current state.
  * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
  * returned.
+ *
+ * Called with job lock held.
  */
-int job_apply_verb(Job *job, JobVerb verb, Error **errp);
-
-/* Same as job_apply_verb, but called with job lock held. */
 int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp);
 
 /**
@@ -662,31 +647,24 @@ void job_early_fail(Job *job);
  */
 void job_transition_to_ready(Job *job);
 
-/** Asynchronously complete the specified @job. */
-void job_complete(Job *job, Error **errp);
-
-/*
- * Same as job_complete(), but called with job lock held.
- * Might release the lock temporarily.
+/**
+ * Asynchronously complete the specified @job.
+ * Called with job lock held, but might release it temporarily.
  */
 void job_complete_locked(Job *job, Error **errp);
 
 /**
  * Asynchronously cancel the specified @job. If @force is true, the job should
  * be cancelled immediately without waiting for a consistent state.
+ * Called with job lock held.
  */
-void job_cancel(Job *job, bool force);
-
-/* Same as job_cancel(), but called with job lock held. */
 void job_cancel_locked(Job *job, bool force);
 
 /**
- * Cancels the specified job like job_cancel(), but may refuse to do so if the
- * operation isn't meaningful in the current state of the job.
+ * Cancels the specified job like job_cancel_locked(), but may refuse
+ * to do so if the operation isn't meaningful in the current state of the job.
+ * Called with job lock held.
  */
-void job_user_cancel(Job *job, bool force, Error **errp);
-
-/* Same as job_user_cancel(), but called with job lock held. */
 void job_user_cancel_locked(Job *job, bool force, Error **errp);
 
 /**
@@ -714,7 +692,7 @@ void job_cancel_sync_all(void);
 
 /**
  * @job: The job to be completed.
- * @errp: Error object which may be set by job_complete(); this is not
+ * @errp: Error object which may be set by job_complete_locked(); this is not
  *        necessarily set on every error, the job return value has to be
  *        checked as well.
  *
@@ -723,11 +701,8 @@ void job_cancel_sync_all(void);
  * function).
  *
  * Returns the return value from the job.
- * Called with job_lock *not* held.
+ * Called with job_lock held.
  */
-int job_complete_sync(Job *job, Error **errp);
-
-/* Same as job_complete_sync, but called with job lock held. */
 int job_complete_sync_locked(Job *job, Error **errp);
 
 /**
@@ -737,19 +712,17 @@ int job_complete_sync_locked(Job *job, Error **errp);
  * FIXME: Make the below statement universally true:
  * For jobs that support the manual workflow mode, all graph changes that occur
  * as a result will occur after this command and before a successful reply.
+ *
+ * Called with job lock held.
  */
-void job_finalize(Job *job, Error **errp);
-
-/* Same as job_finalize(), but called with job lock held. */
 void job_finalize_locked(Job *job, Error **errp);
 
 /**
  * Remove the concluded @job from the query list and resets the passed pointer
  * to %NULL. Returns an error if the job is not actually concluded.
+ *
+ * Called with job lock held.
  */
-void job_dismiss(Job **job, Error **errp);
-
-/* Same as job_dismiss(), but called with job lock held. */
 void job_dismiss_locked(Job **job, Error **errp);
 
 /**
@@ -759,14 +732,7 @@ void job_dismiss_locked(Job **job, Error **errp);
  * Returns 0 if the job is successfully completed, -ECANCELED if the job was
  * cancelled before completing, and -errno in other error cases.
  *
- * Called with job_lock *not* held.
- */
-int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
-                    Error **errp);
-
-/*
- * Same as job_finish_sync(), but called with job lock held.
- * Might release the lock temporarily.
+ * Called with job_lock held, but might release it temporarily.
  */
 int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
                            Error **errp);
diff --git a/job.c b/job.c
index 59c7bf5aa9..15b25f421f 100644
--- a/job.c
+++ b/job.c
@@ -233,12 +233,6 @@ int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp)
     return -EPERM;
 }
 
-int job_apply_verb(Job *job, JobVerb verb, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    return job_apply_verb_locked(job, verb, errp);
-}
-
 JobType job_type(const Job *job)
 {
     return job->driver->job_type;
@@ -324,7 +318,7 @@ bool job_is_completed_locked(Job *job)
     return false;
 }
 
-bool job_is_completed(Job *job)
+static bool job_is_completed(Job *job)
 {
     JOB_LOCK_GUARD();
     return job_is_completed_locked(job);
@@ -368,12 +362,6 @@ Job *job_get_locked(const char *id)
     return NULL;
 }
 
-Job *job_get(const char *id)
-{
-    JOB_LOCK_GUARD();
-    return job_get_locked(id);
-}
-
 void job_set_aio_context(Job *job, AioContext *ctx)
 {
     /* protect against read in job_finish_sync_locked and job_start */
@@ -465,12 +453,6 @@ void job_ref_locked(Job *job)
     ++job->refcnt;
 }
 
-void job_ref(Job *job)
-{
-    JOB_LOCK_GUARD();
-    job_ref_locked(job);
-}
-
 void job_unref_locked(Job *job)
 {
     GLOBAL_STATE_CODE();
@@ -499,12 +481,6 @@ void job_unref_locked(Job *job)
     }
 }
 
-void job_unref(Job *job)
-{
-    JOB_LOCK_GUARD();
-    job_unref_locked(job);
-}
-
 void job_progress_update(Job *job, uint64_t done)
 {
     progress_work_done(&job->progress, done);
@@ -581,12 +557,6 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
     job_lock();
 }
 
-void job_enter_cond(Job *job, bool(*fn)(Job *job))
-{
-    JOB_LOCK_GUARD();
-    job_enter_cond_locked(job, fn);
-}
-
 void job_enter(Job *job)
 {
     JOB_LOCK_GUARD();
@@ -674,8 +644,9 @@ void coroutine_fn job_pause_point(Job *job)
     job_pause_point_locked(job);
 }
 
-static void job_yield_locked(Job *job)
+void job_yield(Job *job)
 {
+    JOB_LOCK_GUARD();
     assert(job->busy);
 
     /* Check cancellation *before* setting busy = false, too!  */
@@ -690,12 +661,6 @@ static void job_yield_locked(Job *job)
     job_pause_point_locked(job);
 }
 
-void job_yield(Job *job)
-{
-    JOB_LOCK_GUARD();
-    job_yield_locked(job);
-}
-
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
 {
     JOB_LOCK_GUARD();
@@ -764,23 +729,11 @@ void job_user_pause_locked(Job *job, Error **errp)
     job_pause_locked(job);
 }
 
-void job_user_pause(Job *job, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    job_user_pause_locked(job, errp);
-}
-
 bool job_user_paused_locked(Job *job)
 {
     return job->user_paused;
 }
 
-bool job_user_paused(Job *job)
-{
-    JOB_LOCK_GUARD();
-    return job_user_paused_locked(job);
-}
-
 void job_user_resume_locked(Job *job, Error **errp)
 {
     assert(job);
@@ -801,12 +754,6 @@ void job_user_resume_locked(Job *job, Error **errp)
     job_resume_locked(job);
 }
 
-void job_user_resume(Job *job, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    job_user_resume_locked(job, errp);
-}
-
 /* Called with job_mutex held, but releases it temporarily. */
 static void job_do_dismiss_locked(Job *job)
 {
@@ -834,12 +781,6 @@ void job_dismiss_locked(Job **jobptr, Error **errp)
     *jobptr = NULL;
 }
 
-void job_dismiss(Job **jobptr, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    job_dismiss_locked(jobptr, errp);
-}
-
 void job_early_fail(Job *job)
 {
     JOB_LOCK_GUARD();
@@ -1084,12 +1025,6 @@ void job_finalize_locked(Job *job, Error **errp)
     job_do_finalize_locked(job);
 }
 
-void job_finalize(Job *job, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    job_finalize_locked(job, errp);
-}
-
 /* Called with job_mutex held. */
 static int job_transition_to_pending_locked(Job *job)
 {
@@ -1236,12 +1171,6 @@ void job_cancel_locked(Job *job, bool force)
     }
 }
 
-void job_cancel(Job *job, bool force)
-{
-    JOB_LOCK_GUARD();
-    job_cancel_locked(job, force);
-}
-
 void job_user_cancel_locked(Job *job, bool force, Error **errp)
 {
     if (job_apply_verb_locked(job, JOB_VERB_CANCEL, errp)) {
@@ -1250,15 +1179,9 @@ void job_user_cancel_locked(Job *job, bool force, Error **errp)
     job_cancel_locked(job, force);
 }
 
-void job_user_cancel(Job *job, bool force, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    job_user_cancel_locked(job, force, errp);
-}
-
-/* A wrapper around job_cancel() taking an Error ** parameter so it may be
- * used with job_finish_sync() without the need for (rather nasty) function
- * pointer casts there.
+/* A wrapper around job_cancel_locked() taking an Error ** parameter so it may
+ * be used with job_finish_sync_locked() without the need for (rather nasty)
+ * function pointer casts there.
  *
  * Called with job_mutex held.
  */
@@ -1306,12 +1229,6 @@ int job_complete_sync_locked(Job *job, Error **errp)
     return job_finish_sync_locked(job, job_complete_locked, errp);
 }
 
-int job_complete_sync(Job *job, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    return job_complete_sync_locked(job, errp);
-}
-
 void job_complete_locked(Job *job, Error **errp)
 {
     /* Should not be reachable via external interface for internal jobs */
@@ -1331,12 +1248,6 @@ void job_complete_locked(Job *job, Error **errp)
     job_lock();
 }
 
-void job_complete(Job *job, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    job_complete_locked(job, errp);
-}
-
 int job_finish_sync_locked(Job *job,
                            void (*finish)(Job *, Error **errp),
                            Error **errp)
@@ -1366,9 +1277,3 @@ int job_finish_sync_locked(Job *job,
     job_unref_locked(job);
     return ret;
 }
-
-int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
-{
-    JOB_LOCK_GUARD();
-    return job_finish_sync_locked(job, finish, errp);
-}
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index f88e10e356..c0426bd10c 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -432,7 +432,7 @@ static const BlockJobDriver test_yielding_driver = {
 };
 
 /*
- * Test that job_complete() works even on jobs that are in a paused
+ * Test that job_complete_locked() works even on jobs that are in a paused
  * state (i.e., STANDBY).
  *
  * To do this, run YieldingJob in an IO thread, get it into the READY
@@ -440,7 +440,7 @@ static const BlockJobDriver test_yielding_driver = {
  * acquire the context so the job will not be entered and will thus
  * remain on STANDBY.
  *
- * job_complete() should still work without error.
+ * job_complete_locked() should still work without error.
  *
  * Note that on the QMP interface, it is impossible to lock an IO
  * thread before a drained section ends.  In practice, the
-- 
2.31.1


