Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0948B4ADCD6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:37:41 +0100 (CET)
Received: from localhost ([::1]:51504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSYl-0006rZ-OP
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:37:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRfT-0007E0-Vd
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:40:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRfI-0000rB-PG
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644331216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BL+gM8fPbrsp2h3pAJWRNUe5xtdo52JEIEMy1rhLJGM=;
 b=O66C8XjnjTrbjq/o3cPhK+31QlRPRPoayW0zwRKMNvslw5sdsfzJ6P6PD7J4la1mNrR3yr
 4IUzzBxJGKQqBg59vrny3Vj9w2pdvJ6FwvnqayscckdRfH5LG1CbFesnRw6GgJI/ZsQO1B
 icZFAfUlM3gYHH8lsh8c3pn4aJQd1z4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-hI0NUTPnMPWNJ_X_5s75Bg-1; Tue, 08 Feb 2022 09:40:13 -0500
X-MC-Unique: hI0NUTPnMPWNJ_X_5s75Bg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 585E43E746;
 Tue,  8 Feb 2022 14:40:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA8D3798B6;
 Tue,  8 Feb 2022 14:40:11 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/3] jobs: add job-common.h
Date: Tue,  8 Feb 2022 09:39:53 -0500
Message-Id: <20220208143955.1078618-2-eesposit@redhat.com>
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

job-common.h contains all struct and common function that currently
are in job.h and will be shared by job-monitor and job-driver in
the next commits.

Also move job_type(), job_type_str() and job_is_internal there,
as they are common helper functions.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job-common.h | 357 ++++++++++++++++++++++++++++++++++++++
 include/qemu/job.h        | 328 +---------------------------------
 2 files changed, 358 insertions(+), 327 deletions(-)
 create mode 100644 include/qemu/job-common.h

diff --git a/include/qemu/job-common.h b/include/qemu/job-common.h
new file mode 100644
index 0000000000..e9505c864a
--- /dev/null
+++ b/include/qemu/job-common.h
@@ -0,0 +1,357 @@
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
+#ifndef JOB_COMMON_H
+#define JOB_COMMON_H
+
+#include "qapi/qapi-types-job.h"
+#include "qemu/queue.h"
+#include "qemu/progress_meter.h"
+#include "qemu/coroutine.h"
+#include "block/aio.h"
+
+typedef struct JobDriver JobDriver;
+typedef struct JobTxn JobTxn;
+
+
+/**
+ * Long-running operation.
+ */
+typedef struct Job {
+
+    /* Fields set at initialization (job_create), and never modified */
+
+    /** The ID of the job. May be NULL for internal jobs. */
+    char *id;
+
+    /**
+     * The type of this job.
+     * All callbacks are called with job_mutex *not* held.
+     */
+    const JobDriver *driver;
+
+    /**
+     * The coroutine that executes the job.  If not NULL, it is reentered when
+     * busy is false and the job is cancelled.
+     * Initialized in job_start()
+     */
+    Coroutine *co;
+
+    /** True if this job should automatically finalize itself */
+    bool auto_finalize;
+
+    /** True if this job should automatically dismiss itself */
+    bool auto_dismiss;
+
+    /** The completion function that will be called when the job completes.  */
+    BlockCompletionFunc *cb;
+
+    /** The opaque value that is passed to the completion function.  */
+    void *opaque;
+
+    /* ProgressMeter API is thread-safe */
+    ProgressMeter progress;
+
+
+    /** Protected by job_mutex */
+
+    /**
+     * AioContext to run the job coroutine in.
+     * The job Aiocontext can be read when holding *either*
+     * the BQL (so we are in the main loop) or the job_mutex.
+     * Instead, it can only be written when we hold *both* BQL
+     * and the job_mutex.
+     */
+    AioContext *aio_context;
+
+    /** Reference count of the block job */
+    int refcnt;
+
+    /** Current state; See @JobStatus for details. */
+    JobStatus status;
+
+    /**
+     * Timer that is used by @job_sleep_ns. Accessed under job_mutex (in
+     * job.c).
+     */
+    QEMUTimer sleep_timer;
+
+    /**
+     * Counter for pause request. If non-zero, the block job is either paused,
+     * or if busy == true will pause itself as soon as possible.
+     */
+    int pause_count;
+
+    /**
+     * Set to false by the job while the coroutine has yielded and may be
+     * re-entered by job_enter(). There may still be I/O or event loop activity
+     * pending. Accessed under job_mutex.
+     *
+     * When the job is deferred to the main loop, busy is true as long as the
+     * bottom half is still pending.
+     */
+    bool busy;
+
+    /**
+     * Set to true by the job while it is in a quiescent state, where
+     * no I/O or event loop activity is pending.
+     */
+    bool paused;
+
+    /**
+     * Set to true if the job is paused by user.  Can be unpaused with the
+     * block-job-resume QMP command.
+     */
+    bool user_paused;
+
+    /**
+     * Set to true if the job should cancel itself.  The flag must
+     * always be tested just before toggling the busy flag from false
+     * to true.  After a job has been cancelled, it should only yield
+     * if #aio_poll will ("sooner or later") reenter the coroutine.
+     */
+    bool cancelled;
+
+    /**
+     * Set to true if the job should abort immediately without waiting
+     * for data to be in sync.
+     */
+    bool force_cancel;
+
+    /** Set to true when the job has deferred work to the main loop. */
+    bool deferred_to_main_loop;
+
+    /**
+     * Return code from @run and/or @prepare callback(s).
+     * Not final until the job has reached the CONCLUDED status.
+     * 0 on success, -errno on failure.
+     */
+    int ret;
+
+    /**
+     * Error object for a failed job.
+     * If job->ret is nonzero and an error object was not set, it will be set
+     * to strerror(-job->ret) during job_completed.
+     */
+    Error *err;
+
+    /** Notifiers called when a cancelled job is finalised */
+    NotifierList on_finalize_cancelled;
+
+    /** Notifiers called when a successfully completed job is finalised */
+    NotifierList on_finalize_completed;
+
+    /** Notifiers called when the job transitions to PENDING */
+    NotifierList on_pending;
+
+    /** Notifiers called when the job transitions to READY */
+    NotifierList on_ready;
+
+    /** Notifiers called when the job coroutine yields or terminates */
+    NotifierList on_idle;
+
+    /** Element of the list of jobs */
+    QLIST_ENTRY(Job) job_list;
+
+    /** Transaction this job is part of */
+    JobTxn *txn;
+
+    /** Element of the list of jobs in a job transaction */
+    QLIST_ENTRY(Job) txn_list;
+} Job;
+
+/**
+ * Callbacks and other information about a Job driver.
+ * All callbacks are invoked with job_mutex *not* held.
+ */
+struct JobDriver {
+
+    /*
+     * These fields are initialized when this object is created,
+     * and are never changed afterwards
+     */
+
+    /** Derived Job struct size */
+    size_t instance_size;
+
+    /** Enum describing the operation */
+    JobType job_type;
+
+    /**
+     * Mandatory: Entrypoint for the Coroutine.
+     *
+     * This callback will be invoked when moving from CREATED to RUNNING.
+     *
+     * If this callback returns nonzero, the job transaction it is part of is
+     * aborted. If it returns zero, the job moves into the WAITING state. If it
+     * is the last job to complete in its transaction, all jobs in the
+     * transaction move from WAITING to PENDING.
+     *
+     * This callback must be run in the job's context.
+     */
+    int coroutine_fn (*run)(Job *job, Error **errp);
+
+    /*
+     * Functions run without regard to the BQL that may run in any
+     * arbitrary thread. These functions do not need to be thread-safe
+     * because the caller ensures that they are invoked from one
+     * thread at time.
+     */
+
+    /**
+     * If the callback is not NULL, it will be invoked when the job transitions
+     * into the paused state.  Paused jobs must not perform any asynchronous
+     * I/O or event loop activity.  This callback is used to quiesce jobs.
+     */
+    void coroutine_fn (*pause)(Job *job);
+
+    /**
+     * If the callback is not NULL, it will be invoked when the job transitions
+     * out of the paused state.  Any asynchronous I/O or event loop activity
+     * should be restarted from this callback.
+     */
+    void coroutine_fn (*resume)(Job *job);
+
+    /*
+     * Global state (GS) API. These functions run under the BQL.
+     *
+     * See include/block/block-global-state.h for more information about
+     * the GS API.
+     */
+
+    /**
+     * Called when the job is resumed by the user (i.e. user_paused becomes
+     * false). .user_resume is called before .resume.
+     */
+    void (*user_resume)(Job *job);
+
+    /**
+     * Optional callback for job types whose completion must be triggered
+     * manually.
+     */
+    void (*complete)(Job *job, Error **errp);
+
+    /**
+     * If the callback is not NULL, prepare will be invoked when all the jobs
+     * belonging to the same transaction complete; or upon this job's completion
+     * if it is not in a transaction.
+     *
+     * This callback will not be invoked if the job has already failed.
+     * If it fails, abort and then clean will be called.
+     */
+    int (*prepare)(Job *job);
+
+    /**
+     * If the callback is not NULL, it will be invoked when all the jobs
+     * belonging to the same transaction complete; or upon this job's
+     * completion if it is not in a transaction. Skipped if NULL.
+     *
+     * All jobs will complete with a call to either .commit() or .abort() but
+     * never both.
+     */
+    void (*commit)(Job *job);
+
+    /**
+     * If the callback is not NULL, it will be invoked when any job in the
+     * same transaction fails; or upon this job's failure (due to error or
+     * cancellation) if it is not in a transaction. Skipped if NULL.
+     *
+     * All jobs will complete with a call to either .commit() or .abort() but
+     * never both.
+     */
+    void (*abort)(Job *job);
+
+    /**
+     * If the callback is not NULL, it will be invoked after a call to either
+     * .commit() or .abort(). Regardless of which callback is invoked after
+     * completion, .clean() will always be called, even if the job does not
+     * belong to a transaction group.
+     */
+    void (*clean)(Job *job);
+
+    /**
+     * If the callback is not NULL, it will be invoked in job_cancel_async
+     *
+     * This function must return true if the job will be cancelled
+     * immediately without any further I/O (mandatory if @force is
+     * true), and false otherwise.  This lets the generic job layer
+     * know whether a job has been truly (force-)cancelled, or whether
+     * it is just in a special completion mode (like mirror after
+     * READY).
+     * (If the callback is NULL, the job is assumed to terminate
+     * without I/O.)
+     */
+    bool (*cancel)(Job *job, bool force);
+
+
+    /** Called when the job is freed */
+    void (*free)(Job *job);
+};
+
+typedef enum JobCreateFlags {
+    /* Default behavior */
+    JOB_DEFAULT = 0x00,
+    /* Job is not QMP-created and should not send QMP events */
+    JOB_INTERNAL = 0x01,
+    /* Job requires manual finalize step */
+    JOB_MANUAL_FINALIZE = 0x02,
+    /* Job requires manual dismiss step */
+    JOB_MANUAL_DISMISS = 0x04,
+} JobCreateFlags;
+
+extern QemuMutex job_mutex;
+
+#define JOB_LOCK_GUARD() QEMU_LOCK_GUARD(&job_mutex)
+
+#define WITH_JOB_LOCK_GUARD() WITH_QEMU_LOCK_GUARD(&job_mutex)
+
+/**
+ * job_lock:
+ *
+ * Take the mutex protecting the list of jobs and their status.
+ * Most functions called by the monitor need to call job_lock
+ * and job_unlock manually.  On the other hand, function called
+ * by the block jobs themselves and by the block layer will take the
+ * lock for you.
+ */
+void job_lock(void);
+
+/**
+ * job_unlock:
+ *
+ * Release the mutex protecting the list of jobs and their status.
+ */
+void job_unlock(void);
+
+/** Returns the JobType of a given Job. */
+JobType job_type(const Job *job);
+
+/** Returns the enum string for the JobType of a given Job. */
+const char *job_type_str(const Job *job);
+
+/** Returns true if the job should not be visible to the management layer. */
+bool job_is_internal(Job *job);
+
+#endif
diff --git a/include/qemu/job.h b/include/qemu/job.h
index 574110a1f2..cdfc603706 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -26,324 +26,7 @@
 #ifndef JOB_H
 #define JOB_H
 
-#include "qapi/qapi-types-job.h"
-#include "qemu/queue.h"
-#include "qemu/progress_meter.h"
-#include "qemu/coroutine.h"
-#include "block/aio.h"
-
-typedef struct JobDriver JobDriver;
-typedef struct JobTxn JobTxn;
-
-
-/**
- * Long-running operation.
- */
-typedef struct Job {
-
-    /* Fields set at initialization (job_create), and never modified */
-
-    /** The ID of the job. May be NULL for internal jobs. */
-    char *id;
-
-    /**
-     * The type of this job.
-     * All callbacks are called with job_mutex *not* held.
-     */
-    const JobDriver *driver;
-
-    /**
-     * The coroutine that executes the job.  If not NULL, it is reentered when
-     * busy is false and the job is cancelled.
-     * Initialized in job_start()
-     */
-    Coroutine *co;
-
-    /** True if this job should automatically finalize itself */
-    bool auto_finalize;
-
-    /** True if this job should automatically dismiss itself */
-    bool auto_dismiss;
-
-    /** The completion function that will be called when the job completes.  */
-    BlockCompletionFunc *cb;
-
-    /** The opaque value that is passed to the completion function.  */
-    void *opaque;
-
-    /* ProgressMeter API is thread-safe */
-    ProgressMeter progress;
-
-
-    /** Protected by job_mutex */
-
-    /**
-     * AioContext to run the job coroutine in.
-     * The job Aiocontext can be read when holding *either*
-     * the BQL (so we are in the main loop) or the job_mutex.
-     * Instead, it can only be written when we hold *both* BQL
-     * and the job_mutex.
-     */
-    AioContext *aio_context;
-
-    /** Reference count of the block job */
-    int refcnt;
-
-    /** Current state; See @JobStatus for details. */
-    JobStatus status;
-
-    /**
-     * Timer that is used by @job_sleep_ns. Accessed under job_mutex (in
-     * job.c).
-     */
-    QEMUTimer sleep_timer;
-
-    /**
-     * Counter for pause request. If non-zero, the block job is either paused,
-     * or if busy == true will pause itself as soon as possible.
-     */
-    int pause_count;
-
-    /**
-     * Set to false by the job while the coroutine has yielded and may be
-     * re-entered by job_enter(). There may still be I/O or event loop activity
-     * pending. Accessed under job_mutex.
-     *
-     * When the job is deferred to the main loop, busy is true as long as the
-     * bottom half is still pending.
-     */
-    bool busy;
-
-    /**
-     * Set to true by the job while it is in a quiescent state, where
-     * no I/O or event loop activity is pending.
-     */
-    bool paused;
-
-    /**
-     * Set to true if the job is paused by user.  Can be unpaused with the
-     * block-job-resume QMP command.
-     */
-    bool user_paused;
-
-    /**
-     * Set to true if the job should cancel itself.  The flag must
-     * always be tested just before toggling the busy flag from false
-     * to true.  After a job has been cancelled, it should only yield
-     * if #aio_poll will ("sooner or later") reenter the coroutine.
-     */
-    bool cancelled;
-
-    /**
-     * Set to true if the job should abort immediately without waiting
-     * for data to be in sync.
-     */
-    bool force_cancel;
-
-    /** Set to true when the job has deferred work to the main loop. */
-    bool deferred_to_main_loop;
-
-    /**
-     * Return code from @run and/or @prepare callback(s).
-     * Not final until the job has reached the CONCLUDED status.
-     * 0 on success, -errno on failure.
-     */
-    int ret;
-
-    /**
-     * Error object for a failed job.
-     * If job->ret is nonzero and an error object was not set, it will be set
-     * to strerror(-job->ret) during job_completed.
-     */
-    Error *err;
-
-    /** Notifiers called when a cancelled job is finalised */
-    NotifierList on_finalize_cancelled;
-
-    /** Notifiers called when a successfully completed job is finalised */
-    NotifierList on_finalize_completed;
-
-    /** Notifiers called when the job transitions to PENDING */
-    NotifierList on_pending;
-
-    /** Notifiers called when the job transitions to READY */
-    NotifierList on_ready;
-
-    /** Notifiers called when the job coroutine yields or terminates */
-    NotifierList on_idle;
-
-    /** Element of the list of jobs */
-    QLIST_ENTRY(Job) job_list;
-
-    /** Transaction this job is part of */
-    JobTxn *txn;
-
-    /** Element of the list of jobs in a job transaction */
-    QLIST_ENTRY(Job) txn_list;
-} Job;
-
-/**
- * Callbacks and other information about a Job driver.
- * All callbacks are invoked with job_mutex *not* held.
- */
-struct JobDriver {
-
-    /*
-     * These fields are initialized when this object is created,
-     * and are never changed afterwards
-     */
-
-    /** Derived Job struct size */
-    size_t instance_size;
-
-    /** Enum describing the operation */
-    JobType job_type;
-
-    /**
-     * Mandatory: Entrypoint for the Coroutine.
-     *
-     * This callback will be invoked when moving from CREATED to RUNNING.
-     *
-     * If this callback returns nonzero, the job transaction it is part of is
-     * aborted. If it returns zero, the job moves into the WAITING state. If it
-     * is the last job to complete in its transaction, all jobs in the
-     * transaction move from WAITING to PENDING.
-     *
-     * This callback must be run in the job's context.
-     */
-    int coroutine_fn (*run)(Job *job, Error **errp);
-
-    /*
-     * Functions run without regard to the BQL that may run in any
-     * arbitrary thread. These functions do not need to be thread-safe
-     * because the caller ensures that they are invoked from one
-     * thread at time.
-     */
-
-    /**
-     * If the callback is not NULL, it will be invoked when the job transitions
-     * into the paused state.  Paused jobs must not perform any asynchronous
-     * I/O or event loop activity.  This callback is used to quiesce jobs.
-     */
-    void coroutine_fn (*pause)(Job *job);
-
-    /**
-     * If the callback is not NULL, it will be invoked when the job transitions
-     * out of the paused state.  Any asynchronous I/O or event loop activity
-     * should be restarted from this callback.
-     */
-    void coroutine_fn (*resume)(Job *job);
-
-    /*
-     * Global state (GS) API. These functions run under the BQL.
-     *
-     * See include/block/block-global-state.h for more information about
-     * the GS API.
-     */
-
-    /**
-     * Called when the job is resumed by the user (i.e. user_paused becomes
-     * false). .user_resume is called before .resume.
-     */
-    void (*user_resume)(Job *job);
-
-    /**
-     * Optional callback for job types whose completion must be triggered
-     * manually.
-     */
-    void (*complete)(Job *job, Error **errp);
-
-    /**
-     * If the callback is not NULL, prepare will be invoked when all the jobs
-     * belonging to the same transaction complete; or upon this job's completion
-     * if it is not in a transaction.
-     *
-     * This callback will not be invoked if the job has already failed.
-     * If it fails, abort and then clean will be called.
-     */
-    int (*prepare)(Job *job);
-
-    /**
-     * If the callback is not NULL, it will be invoked when all the jobs
-     * belonging to the same transaction complete; or upon this job's
-     * completion if it is not in a transaction. Skipped if NULL.
-     *
-     * All jobs will complete with a call to either .commit() or .abort() but
-     * never both.
-     */
-    void (*commit)(Job *job);
-
-    /**
-     * If the callback is not NULL, it will be invoked when any job in the
-     * same transaction fails; or upon this job's failure (due to error or
-     * cancellation) if it is not in a transaction. Skipped if NULL.
-     *
-     * All jobs will complete with a call to either .commit() or .abort() but
-     * never both.
-     */
-    void (*abort)(Job *job);
-
-    /**
-     * If the callback is not NULL, it will be invoked after a call to either
-     * .commit() or .abort(). Regardless of which callback is invoked after
-     * completion, .clean() will always be called, even if the job does not
-     * belong to a transaction group.
-     */
-    void (*clean)(Job *job);
-
-    /**
-     * If the callback is not NULL, it will be invoked in job_cancel_async
-     *
-     * This function must return true if the job will be cancelled
-     * immediately without any further I/O (mandatory if @force is
-     * true), and false otherwise.  This lets the generic job layer
-     * know whether a job has been truly (force-)cancelled, or whether
-     * it is just in a special completion mode (like mirror after
-     * READY).
-     * (If the callback is NULL, the job is assumed to terminate
-     * without I/O.)
-     */
-    bool (*cancel)(Job *job, bool force);
-
-
-    /** Called when the job is freed */
-    void (*free)(Job *job);
-};
-
-typedef enum JobCreateFlags {
-    /* Default behavior */
-    JOB_DEFAULT = 0x00,
-    /* Job is not QMP-created and should not send QMP events */
-    JOB_INTERNAL = 0x01,
-    /* Job requires manual finalize step */
-    JOB_MANUAL_FINALIZE = 0x02,
-    /* Job requires manual dismiss step */
-    JOB_MANUAL_DISMISS = 0x04,
-} JobCreateFlags;
-
-extern QemuMutex job_mutex;
-
-#define JOB_LOCK_GUARD() QEMU_LOCK_GUARD(&job_mutex)
-
-#define WITH_JOB_LOCK_GUARD() WITH_QEMU_LOCK_GUARD(&job_mutex)
-
-/**
- * job_lock:
- *
- * Take the mutex protecting the list of jobs and their status.
- * Most functions called by the monitor need to call job_lock
- * and job_unlock manually.  On the other hand, function called
- * by the block jobs themselves and by the block layer will take the
- * lock for you.
- */
-void job_lock(void);
-
-/**
- * job_unlock:
- *
- * Release the mutex protecting the list of jobs and their status.
- */
-void job_unlock(void);
+#include "job-common.h"
 
 /**
  * Allocate and return a new job transaction. Jobs can be added to the
@@ -499,15 +182,6 @@ void job_yield(Job *job);
  */
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
 
-/** Returns the JobType of a given Job. */
-JobType job_type(const Job *job);
-
-/** Returns the enum string for the JobType of a given Job. */
-const char *job_type_str(const Job *job);
-
-/** Returns true if the job should not be visible to the management layer. */
-bool job_is_internal(Job *job);
-
 /**
  * Returns whether the job is being cancelled.
  * Called with job_mutex *not* held.
-- 
2.31.1


