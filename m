Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE46AD1A7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:34:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJOn-0004Sn-QL; Mon, 06 Mar 2023 17:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOl-0004Rj-7U
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOj-0003Z6-VC
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678142017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ixVZqDajBkShvIN1j/NIMX+jAPV2NELs9/rKb8HzyQ=;
 b=dfrn71K4GKl0AuMu/2Bm84Qn+B58y1AHhsGWd0bU66SMpcTrJZoa3nLBQtPC8ClDuFKIBI
 gjnXRBGqsoCXRyrYhTMJXMkCNCBmpoB8/x5MuaxFU45nQQvdlXhtEqVe7j8GqkpHeg+jYH
 X3EZkA1/OBKha7GJBWGvSDv1ER6uoyU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-FF27v-JTMsGeY-D7JrvL3Q-1; Mon, 06 Mar 2023 17:33:36 -0500
X-MC-Unique: FF27v-JTMsGeY-D7JrvL3Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 v11-20020a056402348b00b004ce34232666so12631891edc.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678142014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ixVZqDajBkShvIN1j/NIMX+jAPV2NELs9/rKb8HzyQ=;
 b=BVCHGpJNBfYcoSfK4Z/US79jgQkDfvlpwOWRkYui8dxhmKoyZa9dlD598uLH2/S3NK
 z4e/whX8ghQGDMHfJ236OT+MkZt3gox8SqY51UGZBIJoj4kQ5PQcKrepLg2VdgOzm09e
 qN3TymZh2QAmQ0+NyccPJvnPR/fx4U+ONn4dkCV3zUVlLBrW/ZrWr70OAccOg3tt0Bpd
 sspqXBiBJ2IkIuIazC+2A7DG7m6G/ZA9Fd7lT6sgMxJlYLH+WBtcjNG7jjlDk6TTsooz
 cVaa0VeramURmmApBQ3WCHuPgAk1vI2IZBoB8cfwwiHwmfDaukwfKsp5dJ/KsAKLXLHj
 eY4g==
X-Gm-Message-State: AO0yUKV2zd++77Gn5Q5ezCmMucr844OFlem+MjpWDLr2Jdk5z8AkR2iB
 oDqr0ekmR3/btiRhfAKptgBsc5/yRyszjQSPHhfwR9CcKC+cDH8PDB4Bi2QFjIi7BqIQROqgFc8
 UgHIH173RPn8ZperhmNArCOw4+Uc0b19XsW+iaU3tUpPgcfvnq+l1b+unWnBUM2Eyc5OaN1M559
 4=
X-Received: by 2002:a17:906:b0d9:b0:8af:3519:ea1 with SMTP id
 bk25-20020a170906b0d900b008af35190ea1mr14512046ejb.57.1678142014596; 
 Mon, 06 Mar 2023 14:33:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+iAo9pdfeksIl1HCAZz621RuJP/0dsH5ASzToMoBnC6Q1/jq+e3NEDm1LuwTf+YY7YWJie/A==
X-Received: by 2002:a17:906:b0d9:b0:8af:3519:ea1 with SMTP id
 bk25-20020a170906b0d900b008af35190ea1mr14512020ejb.57.1678142014235; 
 Mon, 06 Mar 2023 14:33:34 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a1709066dd600b008e6bd130b14sm5166606ejt.64.2023.03.06.14.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:33:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com,
 richard.henderson@linaro.org
Subject: [PATCH v2 8/9] async: update documentation of the memory barriers
Date: Mon,  6 Mar 2023 23:33:05 +0100
Message-Id: <20230306223306.84383-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306223306.84383-1-pbonzini@redhat.com>
References: <20230306223306.84383-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ever since commit 8c6b0356b539 ("util/async: make bh_aio_poll() O(1)",
2020-02-22), synchronization between qemu_bh_schedule() and aio_bh_poll()
is happening when the bottom half is enqueued in the bh_list; not
when the flags are set.  Update the documentation to match.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/async.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/util/async.c b/util/async.c
index 0657b7539777..e4b494150e7d 100644
--- a/util/async.c
+++ b/util/async.c
@@ -74,14 +74,21 @@ static void aio_bh_enqueue(QEMUBH *bh, unsigned new_flags)
     unsigned old_flags;
 
     /*
-     * The memory barrier implicit in qatomic_fetch_or makes sure that:
-     * 1. idle & any writes needed by the callback are done before the
-     *    locations are read in the aio_bh_poll.
-     * 2. ctx is loaded before the callback has a chance to execute and bh
-     *    could be freed.
+     * Synchronizes with atomic_fetch_and() in aio_bh_dequeue(), ensuring that
+     * insertion starts after BH_PENDING is set.
      */
     old_flags = qatomic_fetch_or(&bh->flags, BH_PENDING | new_flags);
+
     if (!(old_flags & BH_PENDING)) {
+        /*
+         * At this point the bottom half becomes visible to aio_bh_poll().
+         * This insertion thus synchronizes with QSLIST_MOVE_ATOMIC in
+         * aio_bh_poll(), ensuring that:
+         * 1. any writes needed by the callback are visible from the callback
+         *    after aio_bh_dequeue() returns bh.
+         * 2. ctx is loaded before the callback has a chance to execute and bh
+         *    could be freed.
+         */
         QSLIST_INSERT_HEAD_ATOMIC(&ctx->bh_list, bh, next);
     }
 
@@ -107,11 +114,8 @@ static QEMUBH *aio_bh_dequeue(BHList *head, unsigned *flags)
     QSLIST_REMOVE_HEAD(head, next);
 
     /*
-     * The qatomic_and is paired with aio_bh_enqueue().  The implicit memory
-     * barrier ensures that the callback sees all writes done by the scheduling
-     * thread.  It also ensures that the scheduling thread sees the cleared
-     * flag before bh->cb has run, and thus will call aio_notify again if
-     * necessary.
+     * Synchronizes with qatomic_fetch_or() in aio_bh_enqueue(), ensuring that
+     * the removal finishes before BH_PENDING is reset.
      */
     *flags = qatomic_fetch_and(&bh->flags,
                               ~(BH_PENDING | BH_SCHEDULED | BH_IDLE));
@@ -158,6 +162,7 @@ int aio_bh_poll(AioContext *ctx)
     BHListSlice *s;
     int ret = 0;
 
+    /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
     QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
 
@@ -448,15 +453,15 @@ LuringState *aio_get_linux_io_uring(AioContext *ctx)
 void aio_notify(AioContext *ctx)
 {
     /*
-     * Write e.g. bh->flags before writing ctx->notified.  Pairs with smp_mb in
-     * aio_notify_accept.
+     * Write e.g. ctx->bh_list before writing ctx->notified.  Pairs with
+     * smp_mb() in aio_notify_accept().
      */
     smp_wmb();
     qatomic_set(&ctx->notified, true);
 
     /*
-     * Write ctx->notified before reading ctx->notify_me.  Pairs
-     * with smp_mb in aio_ctx_prepare or aio_poll.
+     * Write ctx->notified (and also ctx->bh_list) before reading ctx->notify_me.
+     * Pairs with smp_mb() in aio_ctx_prepare or aio_poll.
      */
     smp_mb();
     if (qatomic_read(&ctx->notify_me)) {
-- 
2.39.1


