Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C53652A29E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:05:21 +0200 (CEST)
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqwt6-00074E-8o
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXn-0001ZO-QD
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXl-00036w-8z
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1K9YX/bnY0vNj6WfRpg/0XfaygNH4IeMrvODSQz9mjM=;
 b=VmoBVng2G14u8Fq+adS+oxPKoIu4/o/7N1rK7O1pnD2e/79348quvvcaccwEJwqEBHgIFz
 faLs4i8GOk/MmnETgL6KlftUuWCWstn1LOXxQlF+jdc2qfHHpyf9jpscqQUTTbHus9UioM
 vSh8yAuama01aSU+MoxGHvmMeI1bp2E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-ng2TuzkMNuu4nJs59KmKww-1; Tue, 17 May 2022 07:39:10 -0400
X-MC-Unique: ng2TuzkMNuu4nJs59KmKww-1
Received: by mail-wm1-f69.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso1135151wma.6
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1K9YX/bnY0vNj6WfRpg/0XfaygNH4IeMrvODSQz9mjM=;
 b=0ec5FRF0kW0IcdQvAW6uJKv5iIIJoy0GzkUZ3isnyTGU/UNr+4ryUR4IyHXSpjaHbB
 0KV8+UMJ7AQxIuejJ4lwMzms5lfJoqtkDn9gak+n7J/gfgL3vg9T1HnugL4sv6rX/lJU
 ZAqKynKZ3SAsgMYvMklMXeF2C0fAlIadgHaYd7s940XbhCFLyBWu6p7mEBVbBho8CyyQ
 X5QQDk5z6AJTRavY7ScEAsT/Gb+NkqK0ChO1fJIitqW6cxlSORfCptLqfmBANIVhKM5u
 vG7g1cgggfFX4A36JCBvM8bctM8KMWCBnr+ZKCk9zMMN8sUVwqHEFWAMmtR54iWjNh6h
 uT8w==
X-Gm-Message-State: AOAM531w1rhq40RzVegcTFclqXu6am6uRH/4KBrPd+VyPLBecYtTz9Yj
 pe+hXBVQXxwbur0EiNa9qMHdjSf6pOjsS6gVi1W5vVjwpQ0Jy98151UsFZrMRa7OIFaiL/8a786
 OF9ywOmEyEBBggXW5Mae363uJhh1r5tGi6U//llODynSdIof0m8eOBeBpkf4Lcw+l
X-Received: by 2002:a7b:c5ca:0:b0:394:7a03:48b6 with SMTP id
 n10-20020a7bc5ca000000b003947a0348b6mr21045635wmk.104.1652787549297; 
 Tue, 17 May 2022 04:39:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6j72fWijXeDTbPhMK04DqrWH54Bow7bhVwVlrHs7tx7go6ivZMy/bswHmdY7YIzFRZYElKA==
X-Received: by 2002:a7b:c5ca:0:b0:394:7a03:48b6 with SMTP id
 n10-20020a7bc5ca000000b003947a0348b6mr21045616wmk.104.1652787549051; 
 Tue, 17 May 2022 04:39:09 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfae09000000b0020c5253d8edsm12093321wrc.57.2022.05.17.04.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:39:08 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 12/18] block: Implement blk_pwrite_zeroes() using
 generated_co_wrapper
Date: Tue, 17 May 2022 12:39:01 +0100
Message-Id: <20220517113907.200001-1-afaria@redhat.com>
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

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             |  8 --------
 include/sysemu/block-backend-io.h |  5 +++--
 tests/unit/test-block-iothread.c  | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index cc85558813..8129259e50 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1415,14 +1415,6 @@ typedef struct BlkRwCo {
     BdrvRequestFlags flags;
 } BlkRwCo;
 
-int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int64_t bytes, BdrvRequestFlags flags)
-{
-    IO_OR_GS_CODE();
-    return blk_pwritev_part(blk, offset, bytes, NULL, 0,
-                            flags | BDRV_REQ_ZERO_WRITE);
-}
-
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
 {
     GLOBAL_STATE_CODE();
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index d129e2bed3..5ce9b80023 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -174,8 +174,9 @@ int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
 int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                           int64_t bytes, const void *buf);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int64_t bytes, BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                           int64_t bytes,
+                                           BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index b3e79d7698..d701c5a056 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -212,6 +212,19 @@ static void test_sync_op_blk_pwrite_compressed(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_pwrite_zeroes(BlockBackend *blk)
+{
+    int ret;
+
+    /* Success */
+    ret = blk_pwrite_zeroes(blk, 0, 512, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_pwrite_zeroes(blk, -2, 512, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -395,6 +408,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwrite_compressed",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_pwrite_compressed,
+    }, {
+        .name   = "/sync-op/pwrite_zeroes",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwrite_zeroes,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.35.3


