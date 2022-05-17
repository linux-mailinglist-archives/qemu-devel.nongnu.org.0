Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0052A1FB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 14:51:36 +0200 (CEST)
Received: from localhost ([::1]:57170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqwfn-0000Kt-D1
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 08:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXQ-0001Sd-BR
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXO-00032F-2I
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3lcwBoLTLuaNOQ8RGcxe/VH4ulA8BV9VeQWgrV5tek=;
 b=bzPurilIQ4I2ssv7YqtkCQeaVwngjRvS8WHWona8wEwVUCzO7S9cTY8Qw5EYjxycDGyj/h
 PlgRcufBL/atEju11f7CO/eCJqssbnZJtV4y8PvmyoDnwpPr7wgiMRQ0DFV46CkumDMIQo
 iSh4Dr+UCMBqzsWPTIyLp0gZ3XQdFEQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-9353SQepPMWdNesBrNg2PQ-1; Tue, 17 May 2022 07:38:47 -0400
X-MC-Unique: 9353SQepPMWdNesBrNg2PQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so833629wmc.7
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c3lcwBoLTLuaNOQ8RGcxe/VH4ulA8BV9VeQWgrV5tek=;
 b=1CdFbtcG48vgsVS0OjR21n3Vf7EoF28Xd1NNFn0J+1a3+TGMpOm5cn+MhFuFbIm3JR
 9tPjc/QhhQAMOTsxhsPsbUISRk7esWl9wNQsuGfJ0Tjz4wsrMchmkOgSm/LZkr+sr4aw
 Y1KRUDF9NF8+mUNbeddwoKcO9/HqtF3QussAA+oQ034KEBjKPpvNaay/zkbQvqWIVGN8
 4taK0k38EcoITsE0+khKQ6FMuI7yPWKTOfBGfUFqWOcYSFDM5LVrY7DmQuV0Whmgq+b4
 4jLIBKuoVW9AoYGGZ9Ffd+IdHxKzZVp0lGxgR0KJRyjPBz/rdd8YkZtcXJNZWhv8XXNy
 MZBg==
X-Gm-Message-State: AOAM532kVUMViRPzVr9kKVCOki/P3+vj/BS+Z1psunPywpXifaUNqcB5
 yRr+kIu4UFRDkePrTtlA+XsLHVo1cFPwS3RTo9E3/ARyz4ux8k5+0NpvspjgwUdbcUOC+MDlL2f
 n8uNsnJ3exfygY/glAZixo21V7jsPgXH9Qa873pQwKHC53ckNj4JVtpyNQwhFW+lz
X-Received: by 2002:a5d:4d07:0:b0:20e:5aa1:3acd with SMTP id
 z7-20020a5d4d07000000b0020e5aa13acdmr1609793wrt.186.1652787526266; 
 Tue, 17 May 2022 04:38:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRHGN2CAmkbEUEqmhOv8kJeq5GNOcj7kv97YKhkvAMcfdQLIvxjfAptJhtzy+3R1vdRByZSw==
X-Received: by 2002:a5d:4d07:0:b0:20e:5aa1:3acd with SMTP id
 z7-20020a5d4d07000000b0020e5aa13acdmr1609771wrt.186.1652787526022; 
 Tue, 17 May 2022 04:38:46 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0020d02cbbb87sm8090317wrb.16.2022.05.17.04.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:38:45 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 11/18] block: Add blk_co_pwrite_compressed()
Date: Tue, 17 May 2022 12:38:30 +0100
Message-Id: <20220517113837.199696-7-afaria@redhat.com>
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

Also convert blk_pwrite_compressed() into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             |  8 ++++----
 include/sysemu/block-backend-io.h |  7 +++++--
 tests/unit/test-block-iothread.c  | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index ddb1d4e179..cc85558813 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2324,13 +2324,13 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                           flags | BDRV_REQ_ZERO_WRITE);
 }
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
-                          const void *buf)
+int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, const void *buf)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
-    return blk_pwritev_part(blk, offset, bytes, &qiov, 0,
-                            BDRV_REQ_WRITE_COMPRESSED);
+    return blk_co_pwritev_part(blk, offset, bytes, &qiov, 0,
+                               BDRV_REQ_WRITE_COMPRESSED);
 }
 
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index c64207cdcb..d129e2bed3 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -168,8 +168,11 @@ int blk_flush(BlockBackend *blk);
 
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
-                          const void *buf);
+int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
+                                               int64_t offset, int64_t bytes,
+                                               const void *buf);
+int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, const void *buf);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int64_t bytes, BdrvRequestFlags flags);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 6061762c97..b3e79d7698 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -198,6 +198,20 @@ static void test_sync_op_blk_pwritev_part(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_pwrite_compressed(BlockBackend *blk)
+{
+    uint8_t buf[512] = { 0 };
+    int ret;
+
+    /* Late error: Not supported */
+    ret = blk_pwrite_compressed(blk, 0, sizeof(buf), buf);
+    g_assert_cmpint(ret, ==, -ENOTSUP);
+
+    /* Early error: Negative offset */
+    ret = blk_pwrite_compressed(blk, -2, sizeof(buf), buf);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -377,6 +391,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwritev_part",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_pwritev_part,
+    }, {
+        .name   = "/sync-op/pwrite_compressed",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwrite_compressed,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.35.3


