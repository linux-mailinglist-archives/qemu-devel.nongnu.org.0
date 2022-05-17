Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2228D52A369
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:31:09 +0200 (CEST)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxI3-000075-At
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXq-0001b0-VH
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXn-00038O-KV
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=blUimc3XmEF7g3rqPtaCfbTdUc25QM11axvZia9Qqd4=;
 b=efuwLTStF4a2QxMyP9ovaeUZ2RhZcVmGgijaSt9kn0a7GC92Jpjj3Xnw0lVJOoj4D20U+L
 fsaxG+ksi8wCIYdj7ZAtHNmhDyrHq4FPk5G44UlkPmIZB8lPzLWbSFc2DL0bwidXS0VOws
 74+x2YtNjx8e4bqQHRoxajty0STPbeM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-COvPteuKMgCxz7o-9EvtVQ-1; Tue, 17 May 2022 07:39:14 -0400
X-MC-Unique: COvPteuKMgCxz7o-9EvtVQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u26-20020adfb21a000000b0020ac48a9aa4so4599590wra.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=blUimc3XmEF7g3rqPtaCfbTdUc25QM11axvZia9Qqd4=;
 b=gI3F+TlYRY+lsMHLy9NsuSToh9LpnQti2bgLGFeC1UINVi3FqDLXA/V03K+TsqItAx
 +uUWRDXJNMr/+zLux33y3LgDzQb7/PQ3GoJwbXfNKNQsisXs8nxiS82MzK06IgJi/PG2
 JgPnYIwKoxkScnbRhUZimyDOH+klQZhi/aGXPcxzyHPEukVM0Sdq3v0upURJt+QNJeeo
 uWe7HzdT1x/DP8KsF0umYvl7BnFfyPr+p5FGDLKkjxekqQKvY6JR+DSZ0AeriT5oG7OT
 BKkRh+7/2GB2EILB04diOVwv8t2Cbw1hD+IPxETjs9B5/1kkIqPgeWfPD74uaBbdBgyg
 +1sg==
X-Gm-Message-State: AOAM533qeAummzXdO53eP+FOksHiaTXY8hdmUUQHTu0oiSMFC4Lr/fQ+
 QuWEFo9uHCVKJIQ7/Kzkq/qZn7+dsx3+9tR8kwAIGgar8jV7t14PGX6dvwxuHexV3gzYsc98Fnl
 asDOnJocNnYn4az6HaMX28ZlTLO2qBTnKKFAJjHq22z4iaWHSJkQ+bKPG0QAywkET
X-Received: by 2002:a05:6000:11cc:b0:20c:fecc:3a44 with SMTP id
 i12-20020a05600011cc00b0020cfecc3a44mr2376447wrx.366.1652787552676; 
 Tue, 17 May 2022 04:39:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH/mBti0B4ufVhaqm74YCfmugx1oR4KkxFJvEGxuP0tKxxZtZlnAYjScg3+ztroYGI0tkvoQ==
X-Received: by 2002:a05:6000:11cc:b0:20c:fecc:3a44 with SMTP id
 i12-20020a05600011cc00b0020cfecc3a44mr2376432wrx.366.1652787552482; 
 Tue, 17 May 2022 04:39:12 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfae09000000b0020c5253d8edsm12093321wrc.57.2022.05.17.04.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:39:12 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 15/18] block: Add blk_co_ioctl()
Date: Tue, 17 May 2022 12:39:04 +0100
Message-Id: <20220517113907.200001-4-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517113524.197910-1-afaria@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also convert blk_ioctl() into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             | 7 ++++---
 block/coroutines.h                | 6 ------
 include/sysemu/block-backend-io.h | 5 ++++-
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 0718441b37..7bad42259e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1624,7 +1624,7 @@ void blk_aio_cancel_async(BlockAIOCB *acb)
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
+static int coroutine_fn
 blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
     IO_CODE();
@@ -1638,13 +1638,14 @@ blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
     return bdrv_co_ioctl(blk_bs(blk), req, buf);
 }
 
-int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
+int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
+                              void *buf)
 {
     int ret;
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    ret = blk_do_ioctl(blk, req, buf);
+    ret = blk_co_do_ioctl(blk, req, buf);
     blk_dec_in_flight(blk);
 
     return ret;
diff --git a/block/coroutines.h b/block/coroutines.h
index 7e94b9fa83..d66551a277 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -68,9 +68,6 @@ blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
                        BdrvRequestFlags flags);
 
-int coroutine_fn
-blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
-
 int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 
@@ -107,7 +104,4 @@ bdrv_common_block_status_above(BlockDriverState *bs,
 int generated_co_wrapper
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
-int generated_co_wrapper
-blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
-
 #endif /* BLOCK_COROUTINES_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index e6af0d0ed0..bb1ae25863 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -168,7 +168,10 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
 int generated_co_wrapper blk_flush(BlockBackend *blk);
 int coroutine_fn blk_co_flush(BlockBackend *blk);
 
-int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
+int generated_co_wrapper blk_ioctl(BlockBackend *blk, unsigned long int req,
+                                   void *buf);
+int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
+                              void *buf);
 
 int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
                                                int64_t offset, int64_t bytes,
-- 
2.35.3


