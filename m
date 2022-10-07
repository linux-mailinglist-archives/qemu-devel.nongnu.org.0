Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF75F791D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 15:38:33 +0200 (CEST)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ognYd-0004Kw-5Y
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 09:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuU-00065Y-FH
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuS-0003LW-6x
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tHqFxjjgYAMvT9vj/ekyEpvwe4umzhCJ5s9O8/QSjQ=;
 b=HbaUHpTLz26KnoAescte5v0MJ/Lyv0zIgKKjodOB2Lb0BDvrm3btMpv+wfThuptEmTcrOY
 pE1p6rGBWLGbZCmLMnArjKDnL/nKVuBEBMlQV3bG6c2dDRR0tvL1FzpinTjXsY4eT/VxqF
 Gkewm7PjnipTYxHPT6F7Hkp82S4Kj/I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-AwJyQ7esNj64Rn8A-gDmTg-1; Fri, 07 Oct 2022 06:48:48 -0400
X-MC-Unique: AwJyQ7esNj64Rn8A-gDmTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 253A11C0515C;
 Fri,  7 Oct 2022 10:48:48 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 643F2200C0DE;
 Fri,  7 Oct 2022 10:48:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 48/50] blockjob: remove unused functions
Date: Fri,  7 Oct 2022 12:47:50 +0200
Message-Id: <20221007104752.141361-49-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

These public functions are not used anywhere, thus can be dropped.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20220926093214.506243-21-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/blockjob.h | 31 ++++++++++++-------------------
 blockjob.c               | 16 ++--------------
 2 files changed, 14 insertions(+), 33 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 10c24e240a..03032b2eca 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -102,17 +102,15 @@ typedef struct BlockJob {
  */
 
 /**
- * block_job_next:
+ * block_job_next_locked:
  * @job: A block job, or %NULL.
  *
  * Get the next element from the list of block jobs after @job, or the
  * first one if @job is %NULL.
  *
  * Returns the requested job, or %NULL if there are no more jobs left.
+ * Called with job lock held.
  */
-BlockJob *block_job_next(BlockJob *job);
-
-/* Same as block_job_next(), but called with job lock held. */
 BlockJob *block_job_next_locked(BlockJob *job);
 
 /**
@@ -122,6 +120,7 @@ BlockJob *block_job_next_locked(BlockJob *job);
  * Get the block job identified by @id (which must not be %NULL).
  *
  * Returns the requested job, or %NULL if it doesn't exist.
+ * Called with job lock *not* held.
  */
 BlockJob *block_job_get(const char *id);
 
@@ -161,43 +160,37 @@ void block_job_remove_all_bdrv(BlockJob *job);
 bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs);
 
 /**
- * block_job_set_speed:
+ * block_job_set_speed_locked:
  * @job: The job to set the speed for.
  * @speed: The new value
  * @errp: Error object.
  *
  * Set a rate-limiting parameter for the job; the actual meaning may
  * vary depending on the job type.
- */
-bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
-
-/*
- * Same as block_job_set_speed(), but called with job lock held.
- * Might release the lock temporarily.
+ *
+ * Called with job lock held, but might release it temporarily.
  */
 bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp);
 
 /**
- * block_job_query:
+ * block_job_query_locked:
  * @job: The job to get information about.
  *
  * Return information about a job.
+ *
+ * Called with job lock held.
  */
-BlockJobInfo *block_job_query(BlockJob *job, Error **errp);
-
-/* Same as block_job_query(), but called with job lock held. */
 BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp);
 
 /**
- * block_job_iostatus_reset:
+ * block_job_iostatus_reset_locked:
  * @job: The job whose I/O status should be reset.
  *
  * Reset I/O status on @job and on BlockDriverState objects it uses,
  * other than job->blk.
+ *
+ * Called with job lock held.
  */
-void block_job_iostatus_reset(BlockJob *job);
-
-/* Same as block_job_iostatus_reset(), but called with job lock held. */
 void block_job_iostatus_reset_locked(BlockJob *job);
 
 /*
diff --git a/blockjob.c b/blockjob.c
index 120c1b7ead..bdf20a0e35 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -56,12 +56,6 @@ BlockJob *block_job_next_locked(BlockJob *bjob)
     return job ? container_of(job, BlockJob, job) : NULL;
 }
 
-BlockJob *block_job_next(BlockJob *bjob)
-{
-    JOB_LOCK_GUARD();
-    return block_job_next_locked(bjob);
-}
-
 BlockJob *block_job_get_locked(const char *id)
 {
     Job *job = job_get_locked(id);
@@ -308,7 +302,7 @@ bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp)
     return true;
 }
 
-bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
+static bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
     JOB_LOCK_GUARD();
     return block_job_set_speed_locked(job, speed, errp);
@@ -357,12 +351,6 @@ BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp)
     return info;
 }
 
-BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    return block_job_query_locked(job, errp);
-}
-
 /* Called with job lock held */
 static void block_job_iostatus_set_err_locked(BlockJob *job, int error)
 {
@@ -525,7 +513,7 @@ void block_job_iostatus_reset_locked(BlockJob *job)
     job->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
 }
 
-void block_job_iostatus_reset(BlockJob *job)
+static void block_job_iostatus_reset(BlockJob *job)
 {
     JOB_LOCK_GUARD();
     block_job_iostatus_reset_locked(job);
-- 
2.37.3


