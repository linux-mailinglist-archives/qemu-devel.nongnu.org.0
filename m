Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF139EFBA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 09:36:53 +0200 (CEST)
Received: from localhost ([::1]:44690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqWI8-00017a-IS
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 03:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWFJ-00031p-VZ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWFH-00059C-VJ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623137635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO3E0kVVljCJWgtb0Y3sT341JalvuhmXACZvnO6bPOU=;
 b=aM1idbmLjGSKjK5RM2m9eD5wD5vOPmn1Y23omNTYab1Moa0BfiVIv8FewAlnwRlEgBzNLU
 35/JOSbPMMucGxaounOHwrqhQ4RbWyLc/3sYWEPKLrgRNjV8ne0OJpxSGGU5Wa2Des5enL
 rgaIVzTkNw0Zr4WfbZIkEeli8Gsxud4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-cNZYhFmKP1GMuBxvcZDKzA-1; Tue, 08 Jun 2021 03:33:54 -0400
X-MC-Unique: cNZYhFmKP1GMuBxvcZDKzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24EFE108C24A;
 Tue,  8 Jun 2021 07:33:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-225.ams2.redhat.com
 [10.36.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0870608BA;
 Tue,  8 Jun 2021 07:33:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/5] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
Date: Tue,  8 Jun 2021 09:33:41 +0200
Message-Id: <20210608073344.53637-3-eesposit@redhat.com>
In-Reply-To: <20210608073344.53637-1-eesposit@redhat.com>
References: <20210608073344.53637-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As done in BlockCopyCallState, categorize BlockCopyTask
and BlockCopyState in IN, State and OUT fields.
This is just to understand which field has to be protected with a lock.

.sleep_state is handled in the series "coroutine: new sleep/wake API"
and thus here left as TODO.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 47 ++++++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index d58051288b..b3533a3003 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -56,25 +56,33 @@ typedef struct BlockCopyCallState {
     QLIST_ENTRY(BlockCopyCallState) list;
 
     /* State */
-    int ret;
     bool finished;
-    QemuCoSleep sleep;
-    bool cancelled;
+    QemuCoSleep sleep; /* TODO: protect API with a lock */
 
     /* OUT parameters */
+    bool cancelled;
     bool error_is_read;
+    int ret;
 } BlockCopyCallState;
 
 typedef struct BlockCopyTask {
     AioTask task;
 
+    /*
+     * IN parameters. Initialized in block_copy_task_create()
+     * and never changed.
+     */
     BlockCopyState *s;
     BlockCopyCallState *call_state;
     int64_t offset;
-    int64_t bytes;
-    BlockCopyMethod method;
-    QLIST_ENTRY(BlockCopyTask) list;
+    int64_t bytes; /* only re-set in task_shrink, before running the task */
+    BlockCopyMethod method; /* initialized in block_copy_dirty_clusters() */
+
+    /* State */
     CoQueue wait_queue; /* coroutines blocked on this task */
+
+    /* To reference all call states from BlockCopyState */
+    QLIST_ENTRY(BlockCopyTask) list;
 } BlockCopyTask;
 
 static int64_t task_end(BlockCopyTask *task)
@@ -90,15 +98,25 @@ typedef struct BlockCopyState {
      */
     BdrvChild *source;
     BdrvChild *target;
-    BdrvDirtyBitmap *copy_bitmap;
+
+    /* State */
     int64_t in_flight_bytes;
-    int64_t cluster_size;
     BlockCopyMethod method;
-    int64_t max_transfer;
-    uint64_t len;
     QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
     QLIST_HEAD(, BlockCopyCallState) calls;
+    /* State fields that use a thread-safe API */
+    BdrvDirtyBitmap *copy_bitmap;
+    ProgressMeter *progress;
+    SharedResource *mem;
+    RateLimit rate_limit;
 
+    /*
+     * IN parameters. Initialized in block_copy_state_new()
+     * and never changed.
+     */
+    int64_t cluster_size;
+    int64_t max_transfer;
+    uint64_t len;
     BdrvRequestFlags write_flags;
 
     /*
@@ -114,14 +132,11 @@ typedef struct BlockCopyState {
      * In this case, block_copy() will query the source’s allocation status,
      * skip unallocated regions, clear them in the copy_bitmap, and invoke
      * block_copy_reset_unallocated() every time it does.
+     *
+     * This field is set in backup_run() before coroutines are run,
+     * therefore is an IN.
      */
     bool skip_unallocated;
-
-    ProgressMeter *progress;
-
-    SharedResource *mem;
-
-    RateLimit rate_limit;
 } BlockCopyState;
 
 static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
-- 
2.30.2


