Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD9352A34E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:26:30 +0200 (CEST)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxDa-0002Fa-08
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXQ-0001SN-87
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXK-00031E-9m
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIdk1TsYa8maC4Z/9m45vZrNJTsagxHINtxx3CxqRcI=;
 b=JshwQF+haZ8Yhe+wdveLzQUpYyzKtEW4bG0KulxiOOQXAs05QwVCl1Zw7RU6x49Lxfybbp
 rwjO5X2g7R4sdI9JUQOpoHkFwKku5tPl434QDBi3jB8AmfQM7HJ1tzbOdPzBFNE70xDPAK
 aLmzkAkV8CMoOZ+zNUV8FQY/Qf83rZc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-u_IbI-h6Muu41sjjctbhUA-1; Tue, 17 May 2022 07:38:44 -0400
X-MC-Unique: u_IbI-h6Muu41sjjctbhUA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so8064090wmb.3
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EIdk1TsYa8maC4Z/9m45vZrNJTsagxHINtxx3CxqRcI=;
 b=4laTLAuXzpYAg1Ck7824aK0ECXnCVEKrrL+GGTQ7kGy3nWKA3N8IgP3xuNQfaN2SsK
 kHQMMxDeIGP7lBdPuBMYmvNS+SUaIZfEEobk+EXZR5rKQcq6FuBHP913PpUayde0AURk
 Ci1id1xh/6s4JQyCbCR7UjUhjTXfVGtCs4uXY7RwaJ2342P71v7e8YhG/vC5oqAaGvQx
 T5QGRr5UXfmy0x+I/d0otCV5/oYW87SHUneOnLt1a6d/Wx/UGV1CLXNELPCOm2Yx7EVt
 SjnIIjodV8ODUqhc22eM/YL1njZ4UZzV+3UcgE2Iz+q9iQ7FH6EP1oD1iTX37XMuzI49
 hPow==
X-Gm-Message-State: AOAM532Oxwo79OvzGrRSzzZ5HCePUQ/qZnlf//E9TEKDxT5ppPumoLD+
 YNV36M/CcZ/SmRwN0Gm/8O3HlHPGD3pSLiTT3IsKwLjUXwhm0WDW/DDcqPlsSfksEc9LngCPtVk
 N3BCHzENw2P8sJiKoYL9hxIYjzn94pGUhipwjqYr+QyRdemaD0gsAOhEroXRR0zlb
X-Received: by 2002:adf:dd8a:0:b0:20d:ff7:ce01 with SMTP id
 x10-20020adfdd8a000000b0020d0ff7ce01mr5624445wrl.242.1652787523078; 
 Tue, 17 May 2022 04:38:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU3lohNCIpp6kqoS7jQiiownu9p/diiEQqi8+Oc7nQOc6t4Suz9ojd2y79xnySNkdCqS5qWQ==
X-Received: by 2002:adf:dd8a:0:b0:20d:ff7:ce01 with SMTP id
 x10-20020adfdd8a000000b0020d0ff7ce01mr5624420wrl.242.1652787522779; 
 Tue, 17 May 2022 04:38:42 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0020d02cbbb87sm8090317wrb.16.2022.05.17.04.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:38:42 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 08/18] block: Add blk_[co_]preadv_part()
Date: Tue, 17 May 2022 12:38:27 +0100
Message-Id: <20220517113837.199696-4-afaria@redhat.com>
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

Implement blk_preadv_part() using generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             | 30 +++++++++++++++++++++++-------
 block/coroutines.h                |  5 -----
 include/sysemu/block-backend-io.h |  7 +++++++
 tests/unit/test-block-iothread.c  | 19 +++++++++++++++++++
 4 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index c2a4c44a99..3920e1f45e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1284,9 +1284,10 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
-blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-                 QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn
+blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
+                      QEMUIOVector *qiov, size_t qiov_offset,
+                      BdrvRequestFlags flags)
 {
     int ret;
     BlockDriverState *bs;
@@ -1311,7 +1312,8 @@ blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
                 bytes, false);
     }
 
-    ret = bdrv_co_preadv(blk->root, offset, bytes, qiov, flags);
+    ret = bdrv_co_preadv_part(blk->root, offset, bytes, qiov, qiov_offset,
+                              flags);
     bdrv_dec_in_flight(bs);
     return ret;
 }
@@ -1324,7 +1326,21 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    ret = blk_co_do_preadv(blk, offset, bytes, qiov, flags);
+    ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, 0, flags);
+    blk_dec_in_flight(blk);
+
+    return ret;
+}
+
+int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
+                                    size_t qiov_offset, BdrvRequestFlags flags)
+{
+    int ret;
+    IO_OR_GS_CODE();
+
+    blk_inc_in_flight(blk);
+    ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, qiov_offset, flags);
     blk_dec_in_flight(blk);
 
     return ret;
@@ -1541,8 +1557,8 @@ static void blk_aio_read_entry(void *opaque)
     QEMUIOVector *qiov = rwco->iobuf;
 
     assert(qiov->size == acb->bytes);
-    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, acb->bytes,
-                                 qiov, rwco->flags);
+    rwco->ret = blk_co_do_preadv_part(rwco->blk, rwco->offset, acb->bytes, qiov,
+                                      0, rwco->flags);
     blk_aio_complete(acb);
 }
 
diff --git a/block/coroutines.h b/block/coroutines.h
index 443ef2f2e6..85423f8db6 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -63,11 +63,6 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
                                Error **errp);
 
 
-int coroutine_fn
-blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-                 QEMUIOVector *qiov, BdrvRequestFlags flags);
-
-
 int coroutine_fn
 blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 3b548a8ae1..29954a466c 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -108,6 +108,13 @@ int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
 int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, const void *buf,
                                     BdrvRequestFlags flags);
+int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
+                                         int64_t bytes, QEMUIOVector *qiov,
+                                         size_t qiov_offset,
+                                         BdrvRequestFlags flags);
+int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
+                                    size_t qiov_offset, BdrvRequestFlags flags);
 int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, QEMUIOVector *qiov,
                                     BdrvRequestFlags flags);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index b9c5da3a87..2fa1248445 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -168,6 +168,21 @@ static void test_sync_op_blk_pwritev(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_preadv_part(BlockBackend *blk)
+{
+    uint8_t buf[512];
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
+    int ret;
+
+    /* Success */
+    ret = blk_preadv_part(blk, 0, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_preadv_part(blk, -2, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -339,6 +354,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwritev",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_pwritev,
+    }, {
+        .name   = "/sync-op/preadv_part",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_preadv_part,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.35.3


