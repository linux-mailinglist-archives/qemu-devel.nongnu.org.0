Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2C852A2C1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:09:44 +0200 (CEST)
Received: from localhost ([::1]:60574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqwxL-0006Oe-Pb
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXr-0001bV-U8
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXp-000391-Gi
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MzNVCHZRdz0nkZ6awBt8eY9uV6vS0a5ZCRNKcrECJM=;
 b=SvDdgUf1Rx6wDwnZ5u38+V6YuLO0RQ5KLI+wMhBguQZOfwYChY/si912WM7syBLp/aDDQ5
 hiVGpnskBQfDkQV27ripuNUF757DLA1IJr7JFCSfwNQirdKt7vZnDQIO2PKXsGz5Zz8syS
 WInT7FEFuCMHe6UhTAj8ud7+YScTrjY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-weEo2SfcMuC-yRMmYzLqDw-1; Tue, 17 May 2022 07:39:15 -0400
X-MC-Unique: weEo2SfcMuC-yRMmYzLqDw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o24-20020a05600c379800b003943412e81dso834164wmr.6
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+MzNVCHZRdz0nkZ6awBt8eY9uV6vS0a5ZCRNKcrECJM=;
 b=ItQtpwFdFiEnHglICv1ZHKfhKttWwoNDgGrfCB4ZqGw96IEyLfMEa+FCiBJza7bKG7
 NTX4k2pjB8cH+C6mmXRWl4ds0sxGBykZBxGHXPTgVV9Me9vkHEEXqebPLn8e3UsOaX3H
 pheP6g4mG+W2VAOPNjSSJcigo3mNBSRzqSD9Yk+2YW3lCDqfMJJSLBHq3fUl8vvs7KR4
 UilKh6ljfHbOwDclXTBmkfjbnn6ZG3PG3m5InBSzGi2N3bEjcIcyWYEWPRseIhPCW9OQ
 9NpdfLfvX6drDAj/hUebKHP9ydrlUrE/sDowVHfGRigseGEle04kJNaSWyRufz4IdeiN
 yuEQ==
X-Gm-Message-State: AOAM5303RE7laosKGXoYYt3JlsAdt2Sht90wTh5EtIikbKSuIT5kTMzY
 00jdcNAZTFUDSJ9NcQmc/uk7lCaEcpCsC4trUEDrHKU4B+eTEpXcIJ9Lno77mc4qxraHvdhAwpm
 hjKLhdhpeoOoC6BpzbMWS8PpubB0SLQQa5TlNOPeYNUiIraGTPzvMknAudXS+8xQ0
X-Received: by 2002:a05:6000:2aa:b0:20c:5a12:20dc with SMTP id
 l10-20020a05600002aa00b0020c5a1220dcmr18761352wry.316.1652787553879; 
 Tue, 17 May 2022 04:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyijHEck4TzHalCT+J8FFxm0xKUX9KpR1NNln+3v8/SmA5S58218/xmmdTUhhzi7wF4Vw4diw==
X-Received: by 2002:a05:6000:2aa:b0:20c:5a12:20dc with SMTP id
 l10-20020a05600002aa00b0020c5a1220dcmr18761333wry.316.1652787553618; 
 Tue, 17 May 2022 04:39:13 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfae09000000b0020c5253d8edsm12093321wrc.57.2022.05.17.04.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:39:13 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 16/18] block: Add blk_co_truncate()
Date: Tue, 17 May 2022 12:39:05 +0100
Message-Id: <20220517113907.200001-5-afaria@redhat.com>
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

Also convert blk_truncate() into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             |  7 ++++---
 include/sysemu/block-backend-io.h |  8 ++++++--
 tests/unit/test-block-iothread.c  | 14 ++++++++++++++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 7bad42259e..52be1d9116 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2303,8 +2303,9 @@ int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                BDRV_REQ_WRITE_COMPRESSED);
 }
 
-int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
-                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp)
+int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
+                                 PreallocMode prealloc, BdrvRequestFlags flags,
+                                 Error **errp)
 {
     IO_OR_GS_CODE();
     if (!blk_is_available(blk)) {
@@ -2312,7 +2313,7 @@ int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
         return -ENOMEDIUM;
     }
 
-    return bdrv_truncate(blk->root, offset, exact, prealloc, flags, errp);
+    return bdrv_co_truncate(blk->root, offset, exact, prealloc, flags, errp);
 }
 
 int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index bb1ae25863..004493ec36 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -183,7 +183,11 @@ int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                            BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
-int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
-                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
+int generated_co_wrapper blk_truncate(BlockBackend *blk, int64_t offset,
+                                      bool exact, PreallocMode prealloc,
+                                      BdrvRequestFlags flags, Error **errp);
+int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
+                                 PreallocMode prealloc, BdrvRequestFlags flags,
+                                 Error **errp);
 
 #endif /* BLOCK_BACKEND_IO_H */
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index d701c5a056..9b7353ce89 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -298,6 +298,19 @@ static void test_sync_op_truncate(BdrvChild *c)
     c->bs->open_flags |= BDRV_O_RDWR;
 }
 
+static void test_sync_op_blk_truncate(BlockBackend *blk)
+{
+    int ret;
+
+    /* Normal success path */
+    ret = blk_truncate(blk, 65536, false, PREALLOC_MODE_OFF, 0, NULL);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_truncate(blk, -2, false, PREALLOC_MODE_OFF, 0, NULL);
+    g_assert_cmpint(ret, ==, -EINVAL);
+}
+
 static void test_sync_op_block_status(BdrvChild *c)
 {
     int ret;
@@ -425,6 +438,7 @@ const SyncOpTest sync_op_tests[] = {
     }, {
         .name   = "/sync-op/truncate",
         .fn     = test_sync_op_truncate,
+        .blkfn  = test_sync_op_blk_truncate,
     }, {
         .name   = "/sync-op/block_status",
         .fn     = test_sync_op_block_status,
-- 
2.35.3


