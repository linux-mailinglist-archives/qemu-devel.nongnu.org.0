Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E64ADC55
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:19:41 +0100 (CET)
Received: from localhost ([::1]:51426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSHM-0002Yt-UC
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:19:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRap-0003H9-UA
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:35:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRaf-0008Bk-0C
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644330927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tAq30FFFaweTXhYxHQGo25EM+f1P6cguAhMCCoAQ3M=;
 b=CCJO98fDy0h4ZvOfM3EYoktDjri3sqvm2i7V/tMcY82xQ1NTbusy0O+fHBYtcJM/8V49Wo
 b7fh+024TehcSRNL/O/pMyOWZIz+sna5lmZSyxCo6biW5I56WvbzZkurwI2f/aJCzOiTkB
 4nlh55FIGEIC62ztLK1lTBck13cOWzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-SyFasaWXOeiQfelkaxxAnw-1; Tue, 08 Feb 2022 09:35:24 -0500
X-MC-Unique: SyFasaWXOeiQfelkaxxAnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26B35344B0;
 Tue,  8 Feb 2022 14:35:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 353B6747B5;
 Tue,  8 Feb 2022 14:35:22 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 03/20] job.c: API functions not used outside should be
 static
Date: Tue,  8 Feb 2022 09:34:56 -0500
Message-Id: <20220208143513.1077229-4-eesposit@redhat.com>
In-Reply-To: <20220208143513.1077229-1-eesposit@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

job_event_* functions can all be static, as they are not used
outside job.c.

Same applies for job_txn_add_job().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h | 18 ------------------
 job.c              | 12 +++++++++---
 2 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 86ec46c09e..6000463126 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -356,18 +356,6 @@ JobTxn *job_txn_new(void);
  */
 void job_txn_unref(JobTxn *txn);
 
-/**
- * @txn: The transaction (may be NULL)
- * @job: Job to add to the transaction
- *
- * Add @job to the transaction.  The @job must not already be in a transaction.
- * The caller must call either job_txn_unref() or job_completed() to release
- * the reference that is automatically grabbed here.
- *
- * If @txn is NULL, the function does nothing.
- */
-void job_txn_add_job(JobTxn *txn, Job *job);
-
 /**
  * Create a new long-running job and return it.
  *
@@ -429,12 +417,6 @@ void job_progress_set_remaining(Job *job, uint64_t remaining);
  */
 void job_progress_increase_remaining(Job *job, uint64_t delta);
 
-/** To be called when a cancelled job is finalised. */
-void job_event_cancelled(Job *job);
-
-/** To be called when a successfully completed job is finalised. */
-void job_event_completed(Job *job);
-
 /**
  * Conditionally enter the job coroutine if the job is ready to run, not
  * already busy and fn() returns true. fn() is called while under the job_lock
diff --git a/job.c b/job.c
index d603f9ad1e..f13939d3c6 100644
--- a/job.c
+++ b/job.c
@@ -125,7 +125,7 @@ void job_txn_unref(JobTxn *txn)
     }
 }
 
-void job_txn_add_job(JobTxn *txn, Job *job)
+static void job_txn_add_job(JobTxn *txn, Job *job)
 {
     if (!txn) {
         return;
@@ -427,12 +427,18 @@ void job_progress_increase_remaining(Job *job, uint64_t delta)
     progress_increase_remaining(&job->progress, delta);
 }
 
-void job_event_cancelled(Job *job)
+/**
+ * To be called when a cancelled job is finalised.
+ */
+static void job_event_cancelled(Job *job)
 {
     notifier_list_notify(&job->on_finalize_cancelled, job);
 }
 
-void job_event_completed(Job *job)
+/**
+ * To be called when a successfully completed job is finalised.
+ */
+static void job_event_completed(Job *job)
 {
     notifier_list_notify(&job->on_finalize_completed, job);
 }
-- 
2.31.1


