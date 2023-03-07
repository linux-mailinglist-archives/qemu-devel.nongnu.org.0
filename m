Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E6E6ADDCE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:44:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVjm-0007gq-2Q; Tue, 07 Mar 2023 06:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVja-00073v-2S
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjY-0008HG-7P
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39bWtFgENIeu3JJ6L9W2wxYs6vYdhpkQcON8b38w6ew=;
 b=Xuy2Yg3we7EJ6C5JRwVumSVnrT2m1WvNFJqcWX97R/n0bFzWzxQKFYTJXZwqyuLE28KOLt
 Jw9gNYQ+vLECxachWtgAHAMa8MxOo2sqyKownOwesoqSwX28zmpUIhzZ5tzc6C7IJqSuWH
 yZWlWoOi3Qwe7rfLYtECh+nzkLfzIZk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-kA8BXibsOduf28o8s07nKA-1; Tue, 07 Mar 2023 06:43:54 -0500
X-MC-Unique: kA8BXibsOduf28o8s07nKA-1
Received: by mail-ed1-f69.google.com with SMTP id
 v11-20020a056402348b00b004ce34232666so15226805edc.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39bWtFgENIeu3JJ6L9W2wxYs6vYdhpkQcON8b38w6ew=;
 b=uPxyAD11p+TOVdLBHB2eptpm1yQUfPyOARkS2OcpB8OQrEbvj+FCfjmvlR5PqZrN31
 60aTrHuqe53mInK6EuVWIKvY4eIpaSG5qUtlQe6Aap24vW/RBFOuULROoSawqkmRYEFU
 fGQ3RCFOZByXhvy3ZsGXjiSRMaOtj9q+YntOttLDpOPI4DWEAA8uhXhrgNIG18dmBmcs
 vX45pD2Q8PZMpJvcs9v0WQOW5c6+etggYD8FlJqkRnIthlDqG2wguUpRZbu9Wx5pI8Pb
 8AnJAPbTdrk6i4/I3TwZJorVzsn6zJdRoqGoPjL1bn9Ds4n9xSFhj9Fp0rXiRV4F3fQC
 FHrA==
X-Gm-Message-State: AO0yUKWNim/30PB+dBIaGf2ehlA9YJLsGylnga3ZBxLo4e+iJtSDU8tn
 1Y8/0KY69vU/cFInAfj630riAH9LcCna7GQqdZAmxR2Gwv/JcU3S+1oKthguyKj6g8d0WpmG+0R
 UBWrf5eDfCLy73J4hAW8z5UMeQ/zmMluzb93VWC3FRzskG/QnRDXt5K8QOo22/VqLxyqedKhJvq
 8=
X-Received: by 2002:a17:906:68c5:b0:8b1:353a:2636 with SMTP id
 y5-20020a17090668c500b008b1353a2636mr12288240ejr.14.1678189432875; 
 Tue, 07 Mar 2023 03:43:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9G/oLSjFAGRFBOCRHc062OoLAnxAwZOgh4mCXP6Z5q0M75x2ASShxENwx/iU0BX8dlO547Yg==
X-Received: by 2002:a17:906:68c5:b0:8b1:353a:2636 with SMTP id
 y5-20020a17090668c500b008b1353a2636mr12288222ejr.14.1678189432519; 
 Tue, 07 Mar 2023 03:43:52 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a1709062bd800b008b17aa6afc8sm5970228ejg.30.2023.03.07.03.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:43:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 8/9] async: update documentation of the memory barriers
Date: Tue,  7 Mar 2023 12:43:28 +0100
Message-Id: <20230307114329.158094-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307114329.158094-1-pbonzini@redhat.com>
References: <20230307114329.158094-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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


