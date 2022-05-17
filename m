Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679EA52A33F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:22:39 +0200 (CEST)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqx9q-0004eZ-9V
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXK-0001QK-Hb
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXI-00030r-K6
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M27/cDTXrZ53KC3THWHhHW0gI2qs/rOhIIFhyPNKSHA=;
 b=T6OVyNdvgkMUyPbtqzC+i5Hz93uLnE/BoJrw0Sig9077ks6MA5hnAyvq6WC1kDUOjFHpm3
 84XRWuF8PBNUqV/2u/KMWw9K6XjJ36/lI35LXKBfcjvkSo2nUT2uH/ufbDLDoxseuvIgMf
 FYUm8KyhdrfDAghEtU0/TvRiOGimi3A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-KENQ6gRZMsi3LqL0oDGJZg-1; Tue, 17 May 2022 07:38:42 -0400
X-MC-Unique: KENQ6gRZMsi3LqL0oDGJZg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r6-20020a1c4406000000b00393f52ed5ceso856667wma.7
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M27/cDTXrZ53KC3THWHhHW0gI2qs/rOhIIFhyPNKSHA=;
 b=oKQ+lAVZ4J/utmukxPDlSptYiu4Mkl8aS6jtsI0AYwIgI3mMyGiTUF804jgcgAH06V
 WgdrqYOms0bSUGkXpWAik1Oif3ZdOT6jBP14x6w5IFw9xkeo7dFM/RO+8jFmAsQjAqSs
 3X2AxtNPqk1xJqBUg3f2oKvvn0Ro9B1rk8luoxoGgikYIlBpOhQNzTHE8WB/FOxl2uyg
 HiSI7LF5sXCF1ryb/SDcTmqETZvvYgDHdi7hGj+GfSEdz+ijhbqLlUvD0deE4rPT09Ti
 qu954Q1vrKpxfHD98547D2PUYxr767914G+bOjMZkYprr71ZKzGmvTStuVdJi8dwUMdH
 VXfA==
X-Gm-Message-State: AOAM531Z/NkQWMCgJP90NJDJpe3FQ30Ii1YOrTKGqkResKVcrr6UElrl
 mbkin6Q0yhS8LV0R7LBkshhF426I0yYU/58U+bApfx+vIOQ/ObWs5oOW7j9r1kd+sT+Qg+DxBff
 ESLHnfQI84q2uwcacwQC/LW4Guj4hR5IUZ6yl/CrkWSZV/QGh9BuZ75qNFbjh/v8E
X-Received: by 2002:a1c:7919:0:b0:392:a630:286c with SMTP id
 l25-20020a1c7919000000b00392a630286cmr20997658wme.72.1652787521513; 
 Tue, 17 May 2022 04:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL0gDrWuwsZyQTrtVEnh7efTRonSqcbweh893hH7Ym2BsxGnSImw4By9jhmKcJ+TT4Geg9kg==
X-Received: by 2002:a1c:7919:0:b0:392:a630:286c with SMTP id
 l25-20020a1c7919000000b00392a630286cmr20997636wme.72.1652787521252; 
 Tue, 17 May 2022 04:38:41 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0020d02cbbb87sm8090317wrb.16.2022.05.17.04.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:38:40 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 07/18] block: Add blk_{preadv,pwritev}()
Date: Tue, 17 May 2022 12:38:26 +0100
Message-Id: <20220517113837.199696-3-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517113524.197910-1-afaria@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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

Implement them using generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 include/sysemu/block-backend-io.h |  6 +++++
 tests/unit/test-block-iothread.c  | 42 ++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 0804ce1c1d..3b548a8ae1 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -108,6 +108,9 @@ int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
 int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, const void *buf,
                                     BdrvRequestFlags flags);
+int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
+                                    BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
@@ -115,6 +118,9 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
                                      BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
+                                     int64_t bytes, QEMUIOVector *qiov,
+                                     BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
                                 int64_t bytes, QEMUIOVector *qiov,
                                 BdrvRequestFlags flags);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 0ced5333ff..b9c5da3a87 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -138,6 +138,36 @@ static void test_sync_op_blk_pwrite(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_preadv(BlockBackend *blk)
+{
+    uint8_t buf[512];
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
+    int ret;
+
+    /* Success */
+    ret = blk_preadv(blk, 0, sizeof(buf), &qiov, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_preadv(blk, -2, sizeof(buf), &qiov, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
+static void test_sync_op_blk_pwritev(BlockBackend *blk)
+{
+    uint8_t buf[512] = { 0 };
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
+    int ret;
+
+    /* Success */
+    ret = blk_pwritev(blk, 0, sizeof(buf), &qiov, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_pwritev(blk, -2, sizeof(buf), &qiov, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -301,6 +331,14 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwrite",
         .fn     = test_sync_op_pwrite,
         .blkfn  = test_sync_op_blk_pwrite,
+    }, {
+        .name   = "/sync-op/preadv",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_preadv,
+    }, {
+        .name   = "/sync-op/pwritev",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwritev,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
@@ -349,7 +387,9 @@ static void test_sync_op(const void *opaque)
 
     blk_set_aio_context(blk, ctx, &error_abort);
     aio_context_acquire(ctx);
-    t->fn(c);
+    if (t->fn) {
+        t->fn(c);
+    }
     if (t->blkfn) {
         t->blkfn(blk);
     }
-- 
2.35.3


