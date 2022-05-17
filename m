Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953D52A2F6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:14:26 +0200 (CEST)
Received: from localhost ([::1]:40830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqx1s-0003xd-PH
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvY2-0001gq-As
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXv-0003CW-QD
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbMHvTWarh5Fplmojo7XHSGTjFpUSUXGkquTW4UAX70=;
 b=VPfvDFHA/KfCth6+DvmMuvOQ1MNNLDFfCby5MlprKJIfl4xC0+05OEpVkTF0NazrGI4e/h
 JmhdSZXSKWDk+LrBod4gdTsd07W+2fKs12o5nKRCQ3d3j6jVTpdQZgPees44VAkElRphnB
 TVIDpd18X4f8tjlTIAexrycC+LB2j5E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-gBGlzdWQPA6oLfK3ljZXpQ-1; Tue, 17 May 2022 07:39:16 -0400
X-MC-Unique: gBGlzdWQPA6oLfK3ljZXpQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so8064649wmb.3
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zbMHvTWarh5Fplmojo7XHSGTjFpUSUXGkquTW4UAX70=;
 b=r4JsQNbfoH/+alSvsMc9cTaqu55hH+D9S/MoqXoVU9Aua0kIkr7X6iKci97IREmSn7
 IS2ZZdIEoXcTUsck74bXy+Dg3Sk+KwiVeWDPOABTpRE5iniP1DmLJt2Q3z74Rfo5xEfZ
 kPFqViCCT9wXF+BEIiod+UYHwAxT100psYlzuybo3M3vwnnWEl7UnJh8nxci3rPu6Yxb
 aNdfZn9BuuUJeECEn3H59qobPXetR5mKikbs0k8AjPKxs1VuYSMbqOrIlpXS8PBwnVmq
 oILLL/jbbxQDWPpayIDsySNhOKyDQGzTTyFiT1tTVCmqZ1F2jOyfbm9P/UfcNNnFpvvc
 ZA5Q==
X-Gm-Message-State: AOAM533JzRa4z5S6Ky87qc6r50mn0S58tsLMh6+d1tRkTQecrPr4cODB
 0JEagjFyZTfmzp0Ulmup465TRdslgtzzwvQEVLGa9enzEChIMLPEpAHCA0DI7jJW55xDwv/eZD/
 YVzPGYqKZIf8GSZUzis33bh9rcntEd/Zw1Y0p/pt49pDrLiMt6pC6fxdUEDx8bzZ1
X-Received: by 2002:a05:600c:48b:b0:394:2ee9:5847 with SMTP id
 d11-20020a05600c048b00b003942ee95847mr32777794wme.117.1652787555066; 
 Tue, 17 May 2022 04:39:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTzGLhxMeCaQb7GgKc8kSz8zBQxzCMFYjrWzQzEYx5/MRpg0yzOAuaIwT6J2WSlwdfp6gVSA==
X-Received: by 2002:a05:600c:48b:b0:394:2ee9:5847 with SMTP id
 d11-20020a05600c048b00b003942ee95847mr32777761wme.117.1652787554739; 
 Tue, 17 May 2022 04:39:14 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfae09000000b0020c5253d8edsm12093321wrc.57.2022.05.17.04.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:39:14 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 17/18] block: Reorganize some declarations in
 block-backend-io.h
Date: Tue, 17 May 2022 12:39:06 +0100
Message-Id: <20220517113907.200001-6-afaria@redhat.com>
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

Keep generated_co_wrapper and coroutine_fn pairs together. This should
make it clear that each I/O function has these two versions.

Also move blk_co_{pread,pwrite}()'s implementations out of the header
file for consistency.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             | 22 ++++++++
 include/sysemu/block-backend-io.h | 87 +++++++++++++------------------
 2 files changed, 59 insertions(+), 50 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 52be1d9116..920ba0dd1f 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1318,6 +1318,17 @@ blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
     return ret;
 }
 
+int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset, int64_t bytes,
+                              void *buf, BdrvRequestFlags flags)
+{
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_OR_GS_CODE();
+
+    assert(bytes <= SIZE_MAX);
+
+    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
+}
+
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags)
@@ -1399,6 +1410,17 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
     return ret;
 }
 
+int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
+                               const void *buf, BdrvRequestFlags flags)
+{
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_OR_GS_CODE();
+
+    assert(bytes <= SIZE_MAX);
+
+    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
+}
+
 int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
                                 int64_t bytes, QEMUIOVector *qiov,
                                 BdrvRequestFlags flags)
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 004493ec36..30ed979fb1 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -88,11 +88,6 @@ uint32_t blk_get_request_alignment(BlockBackend *blk);
 uint32_t blk_get_max_transfer(BlockBackend *blk);
 uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
 
-int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
-                                   BlockBackend *blk_out, int64_t off_out,
-                                   int64_t bytes, BdrvRequestFlags read_flags,
-                                   BdrvRequestFlags write_flags);
-
 
 /*
  * "I/O or GS" API functions. These functions can run without
@@ -105,9 +100,16 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
 int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
                                    int64_t bytes, void *buf,
                                    BdrvRequestFlags flags);
-int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
-                                    int64_t bytes, const void *buf,
+int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset, int64_t bytes,
+                              void *buf, BdrvRequestFlags flags);
+
+int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
                                     BdrvRequestFlags flags);
+int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
+                               int64_t bytes, QEMUIOVector *qiov,
+                               BdrvRequestFlags flags);
+
 int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
                                          int64_t bytes, QEMUIOVector *qiov,
                                          size_t qiov_offset,
@@ -115,12 +117,20 @@ int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
 int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, QEMUIOVector *qiov,
                                     size_t qiov_offset, BdrvRequestFlags flags);
-int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
-                                    int64_t bytes, QEMUIOVector *qiov,
+
+int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, const void *buf,
                                     BdrvRequestFlags flags);
-int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
-                               int64_t bytes, QEMUIOVector *qiov,
-                               BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
+                               const void *buf, BdrvRequestFlags flags);
+
+int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
+                                     int64_t bytes, QEMUIOVector *qiov,
+                                     BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
+                                int64_t bytes, QEMUIOVector *qiov,
+                                BdrvRequestFlags flags);
+
 int generated_co_wrapper blk_pwritev_part(BlockBackend *blk, int64_t offset,
                                           int64_t bytes, QEMUIOVector *qiov,
                                           size_t qiov_offset,
@@ -129,36 +139,18 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
                                      BdrvRequestFlags flags);
-int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
-                                     int64_t bytes, QEMUIOVector *qiov,
-                                     BdrvRequestFlags flags);
-int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
-                                int64_t bytes, QEMUIOVector *qiov,
-                                BdrvRequestFlags flags);
-
-static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
-                                            int64_t bytes, void *buf,
-                                            BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
 
-    assert(bytes <= SIZE_MAX);
-
-    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
-}
-
-static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
-                                             int64_t bytes, const void *buf,
-                                             BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
-
-    assert(bytes <= SIZE_MAX);
+int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
+                                               int64_t offset, int64_t bytes,
+                                               const void *buf);
+int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, const void *buf);
 
-    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
-}
+int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                           int64_t bytes,
+                                           BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                      int64_t bytes, BdrvRequestFlags flags);
 
 int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
                                       int64_t bytes);
@@ -173,16 +165,6 @@ int generated_co_wrapper blk_ioctl(BlockBackend *blk, unsigned long int req,
 int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
                               void *buf);
 
-int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
-                                               int64_t offset, int64_t bytes,
-                                               const void *buf);
-int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
-                                          int64_t bytes, const void *buf);
-int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                           int64_t bytes,
-                                           BdrvRequestFlags flags);
-int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                      int64_t bytes, BdrvRequestFlags flags);
 int generated_co_wrapper blk_truncate(BlockBackend *blk, int64_t offset,
                                       bool exact, PreallocMode prealloc,
                                       BdrvRequestFlags flags, Error **errp);
@@ -190,4 +172,9 @@ int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
                                  PreallocMode prealloc, BdrvRequestFlags flags,
                                  Error **errp);
 
+int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
+                                   BlockBackend *blk_out, int64_t off_out,
+                                   int64_t bytes, BdrvRequestFlags read_flags,
+                                   BdrvRequestFlags write_flags);
+
 #endif /* BLOCK_BACKEND_IO_H */
-- 
2.35.3


