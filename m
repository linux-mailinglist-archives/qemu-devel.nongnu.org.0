Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D56A52A1EA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 14:48:14 +0200 (CEST)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqwcX-0002g4-9e
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 08:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXM-0001RS-W5
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXL-00031Z-AG
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekMzNy+MhsgyK2ckfwNyB5/S23fthhn9rEIdCX/jnVI=;
 b=LcM6ssfvfvqQUoPGOlDF7k9Wg5hUEi2NGmNBUfszXYdPzAre4WrEqg34FmHQkJvxvkTw2Z
 FmwCozlUCHxnp/8ZRlMsllKFH+s15B8socrltMejgV6Kep2ViWq4XNsfV9bYZt4lpm/KJR
 4vIXDjtibi2ETyUiw5JQ0nG9VeeG0M8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-Aswc45RYMW-vfj1aNJFWZg-1; Tue, 17 May 2022 07:38:45 -0400
X-MC-Unique: Aswc45RYMW-vfj1aNJFWZg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p24-20020a1c5458000000b003945d2ffc6eso8065213wmi.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ekMzNy+MhsgyK2ckfwNyB5/S23fthhn9rEIdCX/jnVI=;
 b=t4RiF7ID4jbm04tdca+Sm9vikTJD+2q6/LYZRGIVjxR+M1A7DywirkfH59Kp7FlOVm
 PUxIVttjBW7HqLaWJitwVz2BBsXI3FhKYsQyMHPSz3Dab7hs0Q7j17QdHIy10vw58fd+
 vM7qMunbi7HIrgYO5Kn8t/1p/FZdSLgNQqZgjGub1AgNjT1k2Ja/M0hJ8rVkeaoOIi4m
 Hs+ah9XrQFIkZFaOSUxVb+yQH5/grEaogw5beqT032dYg2/DGF84Vj/4S98tbVW6Jtf0
 94HBIyW3bTf6X6pT6hfMBQjQmhF04sT+yQEtchAtcJTMlLKvNdLSXUkHEN6aS3tT9PJW
 DWjw==
X-Gm-Message-State: AOAM531y5Q02sgZ5qSlJoL9rdsDKkPI2w6YtZLb0Rzki1vg2OcWAYtxN
 4S4Za21YuNzMsemvXSllON9cHmzpNYpGeG6VaeF+X7ul2WVxY5tgr/un2/gr5cZkAF389tRWA2/
 JqbiDstPn20+WrZNN5WqmmDph96aiw1Gu39g5xpM+BKXxw4DmVGuEbWzwYaMzs8en
X-Received: by 2002:a5d:620c:0:b0:20c:f50a:dafa with SMTP id
 y12-20020a5d620c000000b0020cf50adafamr15300755wru.460.1652787524097; 
 Tue, 17 May 2022 04:38:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/gvfn+7xTwWMxlBTDCq5ikev7B22GlAnmrhj+6hy0iSpUNkvLwdPXsva9b4Y6Xa7mR48Wqg==
X-Received: by 2002:a5d:620c:0:b0:20c:f50a:dafa with SMTP id
 y12-20020a5d620c000000b0020cf50adafamr15300738wru.460.1652787523888; 
 Tue, 17 May 2022 04:38:43 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0020d02cbbb87sm8090317wrb.16.2022.05.17.04.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:38:43 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 09/18] block: Export blk_pwritev_part() in block-backend-io.h
Date: Tue, 17 May 2022 12:38:28 +0100
Message-Id: <20220517113837.199696-5-afaria@redhat.com>
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

Also convert it into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             | 14 --------------
 block/coroutines.h                |  5 -----
 include/sysemu/block-backend-io.h |  4 ++++
 tests/unit/test-block-iothread.c  | 19 +++++++++++++++++++
 4 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 3920e1f45e..35bf35aadd 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1407,20 +1407,6 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
     return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
 }
 
-static int coroutine_fn blk_pwritev_part(BlockBackend *blk, int64_t offset,
-                                         int64_t bytes,
-                                         QEMUIOVector *qiov, size_t qiov_offset,
-                                         BdrvRequestFlags flags)
-{
-    int ret;
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
 typedef struct BlkRwCo {
     BlockBackend *blk;
     int64_t offset;
diff --git a/block/coroutines.h b/block/coroutines.h
index 85423f8db6..94fd283f62 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -107,11 +107,6 @@ bdrv_common_block_status_above(BlockDriverState *bs,
 int generated_co_wrapper
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
-int generated_co_wrapper
-blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
-                    QEMUIOVector *qiov, size_t qiov_offset,
-                    BdrvRequestFlags flags);
-
 int generated_co_wrapper
 blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 29954a466c..31ebd8b6cf 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -121,6 +121,10 @@ int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwritev_part(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, QEMUIOVector *qiov,
+                                          size_t qiov_offset,
+                                          BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 2fa1248445..6061762c97 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -183,6 +183,21 @@ static void test_sync_op_blk_preadv_part(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_pwritev_part(BlockBackend *blk)
+{
+    uint8_t buf[512];
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
+    int ret;
+
+    /* Success */
+    ret = blk_pwritev_part(blk, 0, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_pwritev_part(blk, -2, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -358,6 +373,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/preadv_part",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_preadv_part,
+    }, {
+        .name   = "/sync-op/pwritev_part",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwritev_part,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.35.3


