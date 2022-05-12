Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159552548F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:18:21 +0200 (CEST)
Received: from localhost ([::1]:41024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDOE-0008C4-GE
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZb-00057Y-Ia
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZZ-0005FW-PZ
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NDMo9uXwsCQtkGvDU2vq4T8K4qOFpxa8w9kRkA2hjCw=;
 b=K5IAoe2BPhytkrqZqhiGi3knemIyfPrGbMtgo7SXwJk056TUdETUpDl5ESmgWatHbjRE58
 kcUglYdhZ5MHHUEhJTZCByHtfsfBVTPk9+Fm1ZoU0DVLM8l1XZKDdAQlh560scpoImh5mO
 n2GSXAynA4P0ffRzqSnTVzdCffUFRRU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-EMQHqAYYM5iPyoTuoCMn-w-1; Thu, 12 May 2022 13:25:55 -0400
X-MC-Unique: EMQHqAYYM5iPyoTuoCMn-w-1
Received: by mail-ed1-f69.google.com with SMTP id
 f1-20020a50fe01000000b004282af18d8bso3475960edt.23
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NDMo9uXwsCQtkGvDU2vq4T8K4qOFpxa8w9kRkA2hjCw=;
 b=J9PaB2Wxu1dkpiEuzRiGV/ik9dGsHdeii08H3aCMXeMn7X/s6+lFs2xZ+PnXRgx9Ep
 szUNcB85nUMgz9vTm13T+0+EdjSTm9HAkJbvfIQeskvsl1us1paH6bqtYOSO0rIuo3cr
 YZyMbAMJ3/gC8DieAwGini39I7rqjOI0qWyStiTpsGp/yyiilPTEWqf+VDHhbx+U3TxT
 mJfJQM+RVUYDMbo4cFMWzwnD8mdtn9M7DgLcsbHrtMbD1DDAnqgv1K8Om/t2pFB3Nzig
 tw/25TBNkYcJN45hweS1piRHDa9JXVYgB8YrNaIyJ5HIMOarawJ7+1WCvbAQtM/uxvjI
 tv8A==
X-Gm-Message-State: AOAM533cUtP2XifiNplOjKiif1hDJOT+Yvi2zBU2Xn62t9Q2NTrtxg7L
 nQgHgSrt098J3OB7N/a0oSIL5xDQVx99l3nI+5dRqxVo1cl+UM4mbFQ9nm9iqgPca2W9Qx9bP4m
 IRUYFzezf8goMVbYRR4aLnJK1SEKQ5ds3TCthu99GaCZIu+nUnRIVTYAwjhwWZC2gpeM=
X-Received: by 2002:a17:906:c149:b0:6f9:2a43:ef37 with SMTP id
 dp9-20020a170906c14900b006f92a43ef37mr860222ejc.17.1652376354151; 
 Thu, 12 May 2022 10:25:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrbmY40vKBdFN0xqeq46aoJ0FuMgTBsGaWG6LH8a6RLOXvpwEagohnfmBFZZfUVR4+3NU7rw==
X-Received: by 2002:a17:906:c149:b0:6f9:2a43:ef37 with SMTP id
 dp9-20020a170906c14900b006f92a43ef37mr860205ejc.17.1652376353868; 
 Thu, 12 May 2022 10:25:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a170906431500b006f3ef214e3asm2293349ejm.160.2022.05.12.10.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>
Subject: [PULL 23/27] coroutine-lock: qemu_co_queue_restart_all is a
 coroutine-only qemu_co_enter_all
Date: Thu, 12 May 2022 19:25:01 +0200
Message-Id: <20220512172505.1065394-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_co_queue_restart_all is basically the same as qemu_co_enter_all
but without a QemuLockable argument.  That's perfectly fine, but only as
long as the function is marked coroutine_fn.  If used outside coroutine
context, qemu_co_queue_wait will attempt to take the lock and that
is just broken: if you are calling qemu_co_queue_restart_all outside
coroutine context, the lock is going to be a QemuMutex which cannot be
taken twice by the same thread.

The patch adds the marker to qemu_co_queue_restart_all and to its sole
non-coroutine_fn caller; it then reimplements the function in terms of
qemu_co_enter_all_impl, to remove duplicated code and to clarify that the
latter also works in coroutine context.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20220427130830.150180-4-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c                 |  2 +-
 include/qemu/coroutine.h   |  7 ++++---
 util/qemu-coroutine-lock.c | 21 ++++++---------------
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/block/io.c b/block/io.c
index 9769ec53b0..789e6373d5 100644
--- a/block/io.c
+++ b/block/io.c
@@ -751,7 +751,7 @@ void bdrv_drain_all(void)
  *
  * This function should be called when a tracked request is completing.
  */
-static void tracked_request_end(BdrvTrackedRequest *req)
+static void coroutine_fn tracked_request_end(BdrvTrackedRequest *req)
 {
     if (req->serialising) {
         qatomic_dec(&req->bs->serialising_in_flight);
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index e5954635f6..43df7a7e66 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -216,10 +216,11 @@ void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock);
 bool coroutine_fn qemu_co_queue_next(CoQueue *queue);
 
 /**
- * Empties the CoQueue; all coroutines are woken up.
- * OK to run from coroutine and non-coroutine context.
+ * Empties the CoQueue and queues the coroutine to run after
+ * the currently-running coroutine yields.
+ * Used from coroutine context, use qemu_co_enter_all outside.
  */
-void qemu_co_queue_restart_all(CoQueue *queue);
+void coroutine_fn qemu_co_queue_restart_all(CoQueue *queue);
 
 /**
  * Removes the next coroutine from the CoQueue, and wake it up.  Unlike
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 5b0342faed..9ad24ab1af 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -67,21 +67,6 @@ void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock)
     }
 }
 
-void qemu_co_queue_restart_all(CoQueue *queue)
-{
-    Coroutine *next;
-
-    if (QSIMPLEQ_EMPTY(&queue->entries)) {
-        return false;
-    }
-
-    while ((next = QSIMPLEQ_FIRST(&queue->entries)) != NULL) {
-        QSIMPLEQ_REMOVE_HEAD(&queue->entries, co_queue_next);
-        aio_co_wake(next);
-    }
-    return true;
-}
-
 bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock)
 {
     Coroutine *next;
@@ -115,6 +100,12 @@ void qemu_co_enter_all_impl(CoQueue *queue, QemuLockable *lock)
     }
 }
 
+void coroutine_fn qemu_co_queue_restart_all(CoQueue *queue)
+{
+    /* No unlock/lock needed in coroutine context.  */
+    qemu_co_enter_all_impl(queue, NULL);
+}
+
 bool qemu_co_queue_empty(CoQueue *queue)
 {
     return QSIMPLEQ_FIRST(&queue->entries) == NULL;
-- 
2.36.0


