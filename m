Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC33752A307
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:17:24 +0200 (CEST)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqx4l-00078o-PI
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXK-0001QH-5l
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXH-00030g-Mc
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8mb+gRmFTLQXI0zNFsxMV+BAGi19v6JSSrvt+VUkCU=;
 b=EReyIUtwB/hxJs195shU09E22X0kvt7Ri9iMP7pfmePm2tVVj+gBvde16ZqyXn+1eTX9QG
 MUOwa3B0ypRmI0a+H6EwbpmA7srGPuUGGPsYb2/Z+V3v1gBJyr7Mp57NtiQnSxmKxlJdaj
 b6+hCFGRjvzge6DXdTvvzFCO4PhDo3M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-eMC4qDDzOxy10E2sU2Vflw-1; Tue, 17 May 2022 07:38:42 -0400
X-MC-Unique: eMC4qDDzOxy10E2sU2Vflw-1
Received: by mail-wm1-f70.google.com with SMTP id
 205-20020a1c02d6000000b003928cd3853aso1127139wmc.9
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z8mb+gRmFTLQXI0zNFsxMV+BAGi19v6JSSrvt+VUkCU=;
 b=i14zMRhJ3Da878Tfq3Lnrz/kNFM0n6wgqqAkHLuKvJCywNUk+aSLaMyKXb249dNXK7
 A7KF05j7XrQQ+gKrAoYwuqlWJAdDa/8CEg03+5qGYug7vtXOAhBPFoKg/bgO2BSmVKyh
 NxfLAvs5P7y49w0U7cZJZIucc7PCxwSRyTXnTOtvPaxsIg2nFkaoMRKxKJK/NR+2EI+l
 3IZnNVCHNdYdcEnkqo1dHik3vRgmnsptT+7dfghVsNW3Q8DT3bJbCAD4Aaj0y0FQSn6R
 dx8GY4iountlHwPK6DDNtLX1FMXxww5Sw3D5O0cjPsg65GFLfyrhdH/F6If/CBxRiO5e
 87gw==
X-Gm-Message-State: AOAM530KsLHUTZbuZ4V7gRLXYscUZYsIh+IRoYMPoTryYXRlImRAhlwB
 cRiqtD3ZmtW/KWDNnF1QMfFMFxB8Pm9yeunSHv24TzoH2MOKv0KYkKBj2yoBz0lGYgVUb5IUmev
 M8ZB8QfSLcLZwIbZCHQdmR7g1nVi+ymy+btRKVqHBOPk3N9qr6b6aRuumTDTXbS0P
X-Received: by 2002:a05:600c:29c7:b0:394:79dd:6cf2 with SMTP id
 s7-20020a05600c29c700b0039479dd6cf2mr31149303wmd.78.1652787520563; 
 Tue, 17 May 2022 04:38:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH6uOT/tPHX5neZhsdNebL6GxVd8gzp9p/+OUdnWGcz/YsF8o+hK9MBd8UOE0Mb+BEc58+9A==
X-Received: by 2002:a05:600c:29c7:b0:394:79dd:6cf2 with SMTP id
 s7-20020a05600c29c700b0039479dd6cf2mr31149280wmd.78.1652787520251; 
 Tue, 17 May 2022 04:38:40 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0020d02cbbb87sm8090317wrb.16.2022.05.17.04.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:38:39 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 06/18] block: Implement blk_{pread,
 pwrite}() using generated_co_wrapper
Date: Tue, 17 May 2022 12:38:25 +0100
Message-Id: <20220517113837.199696-2-afaria@redhat.com>
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

We need to add include/sysemu/block-backend-io.h to the inputs of the
block-gen.c target defined in block/meson.build.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             | 23 -----------------------
 block/coroutines.h                |  4 ----
 block/meson.build                 |  1 +
 include/sysemu/block-backend-io.h | 10 ++++++----
 4 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 5b9706c443..c2a4c44a99 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1567,29 +1567,6 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
-              BdrvRequestFlags flags)
-{
-    int ret;
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_preadv(blk, offset, bytes, &qiov, flags);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
-int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
-               const void *buf, BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
-
-    return blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);
-}
-
 int64_t blk_getlength(BlockBackend *blk)
 {
     IO_CODE();
diff --git a/block/coroutines.h b/block/coroutines.h
index 3f41238b33..443ef2f2e6 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -112,10 +112,6 @@ bdrv_common_block_status_above(BlockDriverState *bs,
 int generated_co_wrapper
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
-int generated_co_wrapper
-blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-              QEMUIOVector *qiov, BdrvRequestFlags flags);
-
 int generated_co_wrapper
 blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                     QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/block/meson.build b/block/meson.build
index 0b2a60c99b..60bc305597 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -136,6 +136,7 @@ block_gen_c = custom_target('block-gen.c',
                             input: files(
                                       '../include/block/block-io.h',
                                       '../include/block/block-global-state.h',
+                                      '../include/sysemu/block-backend-io.h',
                                       'coroutines.h'
                                       ),
                             command: [wrapper_py, '@OUTPUT@', '@INPUT@'])
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6440e92028..0804ce1c1d 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -102,10 +102,12 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
  * the "I/O or GS" API.
  */
 
-int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
-              BdrvRequestFlags flags);
-int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
-               const void *buf, BdrvRequestFlags flags);
+int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
+                                   int64_t bytes, void *buf,
+                                   BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, const void *buf,
+                                    BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
-- 
2.35.3


