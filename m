Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F66A440089
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:46:40 +0200 (CEST)
Received: from localhost ([::1]:54254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgV1b-00073C-KN
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUut-0006dn-FZ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUur-0003HW-Or
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YT++q4Do5uMkpBMGxtNmwY/JFoVDm+ahkXWWN5J2KyM=;
 b=KOXuJqqfVOQBROWRblY/E6KnCBV45gXiRZ7+uMlCG7ppjxA7/hz3v5oWdHE6cwTA+wNlPO
 gb2Ca7AGpypvoRKH37tFOkHGf4pFbCxF64sAC62pP5wMRSNKI50JbfM00g2xb+hj3XqnXw
 g58xytuB5cSyomy3ap+zg7x0V/opeu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-_PwnyEE4NIOJAZrbV1PDug-1; Fri, 29 Oct 2021 12:39:40 -0400
X-MC-Unique: _PwnyEE4NIOJAZrbV1PDug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAAC1362FB;
 Fri, 29 Oct 2021 16:39:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF2BC69117;
 Fri, 29 Oct 2021 16:39:32 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 03/15] job-common.h: categorize fields in struct Job
Date: Fri, 29 Oct 2021 12:39:02 -0400
Message-Id: <20211029163914.4044794-4-eesposit@redhat.com>
In-Reply-To: <20211029163914.4044794-1-eesposit@redhat.com>
References: <20211029163914.4044794-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Categorize the fields in struct Job to understand which need
to be protected by the job muutex and which not.

Also move job_type() and job_type_str() there, as they are
common helper functions.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job-common.h | 62 +++++++++++++++++++++++++--------------
 include/qemu/job.h        |  6 ----
 2 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/include/qemu/job-common.h b/include/qemu/job-common.h
index dcc24fba48..d2968a848e 100644
--- a/include/qemu/job-common.h
+++ b/include/qemu/job-common.h
@@ -40,27 +40,52 @@ typedef struct JobTxn JobTxn;
  * Long-running operation.
  */
 typedef struct Job {
+
+    /* Fields set at initialization (job_create), and never modified */
+
     /** The ID of the job. May be NULL for internal jobs. */
     char *id;
 
-    /** The type of this job. */
+    /**
+     * The type of this job.
+     * All callbacks are called with job_mutex *not* held.
+     */
     const JobDriver *driver;
 
-    /** Reference count of the block job */
-    int refcnt;
-
-    /** Current state; See @JobStatus for details. */
-    JobStatus status;
-
     /** AioContext to run the job coroutine in */
     AioContext *aio_context;
 
     /**
      * The coroutine that executes the job.  If not NULL, it is reentered when
      * busy is false and the job is cancelled.
+     * Initialized in job_start()
      */
     Coroutine *co;
 
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
+    /** Reference count of the block job */
+    int refcnt;
+
+    /** Current state; See @JobStatus for details. */
+    JobStatus status;
+
     /**
      * Timer that is used by @job_sleep_ns. Accessed under job_mutex (in
      * job.c).
@@ -76,7 +101,7 @@ typedef struct Job {
     /**
      * Set to false by the job while the coroutine has yielded and may be
      * re-entered by job_enter(). There may still be I/O or event loop activity
-     * pending. Accessed under block_job_mutex (in blockjob.c).
+     * pending. Accessed under job_mutex.
      *
      * When the job is deferred to the main loop, busy is true as long as the
      * bottom half is still pending.
@@ -112,14 +137,6 @@ typedef struct Job {
     /** Set to true when the job has deferred work to the main loop. */
     bool deferred_to_main_loop;
 
-    /** True if this job should automatically finalize itself */
-    bool auto_finalize;
-
-    /** True if this job should automatically dismiss itself */
-    bool auto_dismiss;
-
-    ProgressMeter progress;
-
     /**
      * Return code from @run and/or @prepare callback(s).
      * Not final until the job has reached the CONCLUDED status.
@@ -134,12 +151,6 @@ typedef struct Job {
      */
     Error *err;
 
-    /** The completion function that will be called when the job completes.  */
-    BlockCompletionFunc *cb;
-
-    /** The opaque value that is passed to the completion function.  */
-    void *opaque;
-
     /** Notifiers called when a cancelled job is finalised */
     NotifierList on_finalize_cancelled;
 
@@ -167,6 +178,7 @@ typedef struct Job {
 
 /**
  * Callbacks and other information about a Job driver.
+ * All callbacks are invoked with job_mutex *not* held.
  */
 struct JobDriver {
 
@@ -315,4 +327,10 @@ void job_lock(void);
  */
 void job_unlock(void);
 
+/** Returns the JobType of a given Job. */
+JobType job_type(const Job *job);
+
+/** Returns the enum string for the JobType of a given Job. */
+const char *job_type_str(const Job *job);
+
 #endif
diff --git a/include/qemu/job.h b/include/qemu/job.h
index 3cfd79088c..e4e0c26672 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -174,12 +174,6 @@ void job_yield(Job *job);
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
 
 
-/** Returns the JobType of a given Job. */
-JobType job_type(const Job *job);
-
-/** Returns the enum string for the JobType of a given Job. */
-const char *job_type_str(const Job *job);
-
 /** Returns true if the job should not be visible to the management layer. */
 bool job_is_internal(Job *job);
 
-- 
2.27.0


