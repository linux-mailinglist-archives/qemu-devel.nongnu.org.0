Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58B6649F44
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:00:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iPD-0000hJ-2K; Mon, 12 Dec 2022 07:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPB-0000g1-FK
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iP9-0000Yg-Ob
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7AHE4B+LCR9BTgpv+4FWDIQZFuMe4/pVoEPr5P/DUCA=;
 b=i+fYLJahZv2Qv1wWYrhM0P968GAdCxWaUGlvP/V+NWS5VjIBqDT66VDcof6HbSHTe6XjHW
 SxHRNrQuagtUXZ0lqU4RsNJorZHCT88k0YH/KtRq6jivOA5unY/7J/wUOKdpJ4TE6sgkEh
 66DpaavWE/lYXnOfzHODCArhNaKLRDI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-guFTiXTiNHK3Sw3qPaqO8Q-1; Mon, 12 Dec 2022 07:59:33 -0500
X-MC-Unique: guFTiXTiNHK3Sw3qPaqO8Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 h81-20020a1c2154000000b003d1c8e519fbso4139170wmh.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7AHE4B+LCR9BTgpv+4FWDIQZFuMe4/pVoEPr5P/DUCA=;
 b=zVdhpXeRbuDDtLpcyFlkHltfRjC+cjUuN4lSKw5gwUjUhxSPvsnX4tirhWOUn2Ehrl
 fU0GDNoDw78JZL8QLNO1HLuRShDSz3kYPfNuiJsWUdUQce14YAGeW9XMZYZQX6gn2UEO
 yklisdIrxhyYrYoXz5SnYv1ytfTLox8tHISokFAvgvTpLgORvjnKUqGvIqpXJhZLPjKh
 h2/ESTtPQEIHMGWRI0bav24jvHN+TuMGXNTwfxTzBk1jIDjEsacMm5a+8Flh7NurtjZj
 gnK3G/tMQEppLBtKXbmW+UOF1W31nB3E39QH4wshUNzSNuciP8O9FygGm//I+YvJQgtD
 hwEA==
X-Gm-Message-State: ANoB5pkCeWH2uviiWefm83wNQpDTtqQp5JF3F7M9syZMCbHRIL/mBYUB
 2icHE1+akjmU2Pb4IkpyKKJt3rz0cKn7Dyzlc7P8kT9BRSyUZH3cTrXN/SNsu8lz/yaF9eHmpp5
 kYI3FqfQ74r9KxExMnufohz+9P3pUi4p3ujNok+2X/dAgtWNEEZnCpX37SghNlntikwg=
X-Received: by 2002:a5d:574f:0:b0:242:5b60:e23c with SMTP id
 q15-20020a5d574f000000b002425b60e23cmr8965785wrw.19.1670849972208; 
 Mon, 12 Dec 2022 04:59:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ioof3TY8/eu2ajKYSR8Fe7Vq6qYhIncjragpAKhaeOmbYFTkwkGlD1inzuBdd2Fgp88EGtA==
X-Received: by 2002:a5d:574f:0:b0:242:5b60:e23c with SMTP id
 q15-20020a5d574f000000b002425b60e23cmr8965766wrw.19.1670849971875; 
 Mon, 12 Dec 2022 04:59:31 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a5d6685000000b0024194bba380sm8860338wru.22.2022.12.12.04.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 03/15] block: Pull polling out of
 bdrv_parent_drained_begin_single()
Date: Mon, 12 Dec 2022 13:59:08 +0100
Message-Id: <20221212125920.248567-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Only one caller of bdrv_parent_drained_begin_single() passes poll=true;
move the polling to that one caller.

While this requires exposing bdrv_parent_drained_poll_single to outside
block/io.c, this is not a big deal because the bdrv_parent_drained_*_single
functions are really internal between block.c and block/io.c.  So make
that clear while we're at it, by moving them to block_int-io.h.

Based on a patch by Kevin Wolf <kwolf@redhat.com>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c                      |  4 +++-
 block/io.c                   | 10 +++-------
 include/block/block-io.h     | 15 ---------------
 include/block/block_int-io.h | 21 +++++++++++++++++++++
 4 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/block.c b/block.c
index 2f2123f4a4e5..c542a0a33358 100644
--- a/block.c
+++ b/block.c
@@ -2830,7 +2830,9 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
      */
     new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
     if (new_bs_quiesce_counter && !child->quiesced_parent) {
-        bdrv_parent_drained_begin_single(child, true);
+        bdrv_parent_drained_begin_single(child);
+        AIO_WAIT_WHILE(bdrv_child_get_parent_aio_context(child),
+                       bdrv_parent_drained_poll_single(child));
     }
 
     if (old_bs) {
diff --git a/block/io.c b/block/io.c
index 571ff8c6493a..f4444b7777d9 100644
--- a/block/io.c
+++ b/block/io.c
@@ -53,7 +53,7 @@ static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ignore)
         if (c == ignore) {
             continue;
         }
-        bdrv_parent_drained_begin_single(c, false);
+        bdrv_parent_drained_begin_single(c);
     }
 }
 
@@ -81,7 +81,7 @@ static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore)
     }
 }
 
-static bool bdrv_parent_drained_poll_single(BdrvChild *c)
+bool bdrv_parent_drained_poll_single(BdrvChild *c)
 {
     if (c->klass->drained_poll) {
         return c->klass->drained_poll(c);
@@ -105,9 +105,8 @@ static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
     return busy;
 }
 
-void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
+void bdrv_parent_drained_begin_single(BdrvChild *c)
 {
-    AioContext *ctx = bdrv_child_get_parent_aio_context(c);
     IO_OR_GS_CODE();
 
     assert(!c->quiesced_parent);
@@ -116,9 +115,6 @@ void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
     if (c->klass->drained_begin) {
         c->klass->drained_begin(c);
     }
-    if (poll) {
-        AIO_WAIT_WHILE(ctx, bdrv_parent_drained_poll_single(c));
-    }
 }
 
 static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 0e0cd1249705..10659a3f246c 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -305,21 +305,6 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 int co_wrapper_mixed
 bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
-/**
- * bdrv_parent_drained_begin_single:
- *
- * Begin a quiesced section for the parent of @c. If @poll is true, wait for
- * any pending activity to cease.
- */
-void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll);
-
-/**
- * bdrv_parent_drained_end_single:
- *
- * End a quiesced section for the parent of @c.
- */
-void bdrv_parent_drained_end_single(BdrvChild *c);
-
 /**
  * bdrv_drain_poll:
  *
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 8bc061ebb895..0ced9c025acb 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -179,4 +179,25 @@ void bdrv_bsc_invalidate_range(BlockDriverState *bs,
  */
 void bdrv_bsc_fill(BlockDriverState *bs, int64_t offset, int64_t bytes);
 
+/**
+ * bdrv_parent_drained_begin_single:
+ *
+ * Begin a quiesced section for the parent of @c.
+ */
+void bdrv_parent_drained_begin_single(BdrvChild *c);
+
+/**
+ * bdrv_parent_drained_begin_single:
+ *
+ * Check whether the parent of @c has quiesced.
+ */
+bool bdrv_parent_drained_poll_single(BdrvChild *c);
+
+/**
+ * bdrv_parent_drained_end_single:
+ *
+ * End a quiesced section for the parent of @c.
+ */
+void bdrv_parent_drained_end_single(BdrvChild *c);
+
 #endif /* BLOCK_INT_IO_H */
-- 
2.38.1


