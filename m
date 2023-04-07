Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349E6DAFB8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:33:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pko5Y-0007eA-3X; Fri, 07 Apr 2023 11:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5W-0007do-Nj
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5V-0003dl-13
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680881596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJsQA3yW7BGWd2sJxofAOzKxJ7KMYBFg1MeiT8rtfl8=;
 b=Z+Di64sDiGT4IVN9jd3vtEm33IT8aZDvtVuH4CcNG1lSegjDa4gj3VwJI9DfLL9OMxIHYK
 UEEMXLiQnbRFTXpr9J5vq/qo9kE+HCvezyZv1gUGRcgJnmVRp4tE6gPe2HAnhmZ7Ye5/f+
 MYg4E0ZEzX2eeSQgDdvbx4QRVFatmS8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-a0QN3LP3OJOGVK0wImfx5g-1; Fri, 07 Apr 2023 11:33:15 -0400
X-MC-Unique: a0QN3LP3OJOGVK0wImfx5g-1
Received: by mail-wm1-f69.google.com with SMTP id
 r11-20020a05600c458b00b003eea8d25f06so19868798wmo.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 08:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680881593; x=1683473593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJsQA3yW7BGWd2sJxofAOzKxJ7KMYBFg1MeiT8rtfl8=;
 b=ZsorFbMxToVqRLd2DEkzFHAMAvD2RNx0Y0Yn7R/G2H2wQcz8646au9U5JrYiNPKxV0
 BM+4UNySBhS+faqvpKY3k+PlRxnjTCXNrSL/fSUaEBu5YIoifyW50JTj4n13OOxsDXwc
 PkDm6fdlcebPvTNu0UCAJoDft5qpmJhMGUaOqpCscizdkxGtHudp3tytcw5OOPdueBg7
 kbQHVpnJGD/vb4GrO+iyIPTZQG3XQ+l298TQvjozng8tF4GRzEfqSyKbG4iYvldmyXD9
 GqSnKBYsgGhw9AA3//+2ZYllRHJ0KRsirX0ngMQOsJhQr3nKPI56p+YtxSHe9tRJLkVD
 E0XA==
X-Gm-Message-State: AAQBX9dyM43BLBPai3MKO0cYx0kK5nuONDVbr8o25HlDqNLSOcHo7iZf
 /6hWSIsB+oyGq6iGLxbu+/UMTaQvaiECDE7g7XtqTmjNAZOGtqxdgDFLvrny7zGCZqbEjy9hPGS
 se1VwIubQsvhdrfjSD6IjRZqPXfCKhaXPYAxSAXKyhBauG36jlShtAZUUPpqSzcsWdfn9e9ruep
 8=
X-Received: by 2002:a1c:4c17:0:b0:3ed:ce50:435a with SMTP id
 z23-20020a1c4c17000000b003edce50435amr1543874wmf.10.1680881593576; 
 Fri, 07 Apr 2023 08:33:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z+RTpH5MGjN89hcRuuUggyfAqQClgQ/1lkgSiUUNpMGMW+YHb2domIAqoWSrdDBONR7rXTTQ==
X-Received: by 2002:a1c:4c17:0:b0:3ed:ce50:435a with SMTP id
 z23-20020a1c4c17000000b003edce50435amr1543858wmf.10.1680881593277; 
 Fri, 07 Apr 2023 08:33:13 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003ee1acdaf95sm8752473wms.36.2023.04.07.08.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:33:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 hreitz@redhat.com
Subject: [PATCH 4/8] block: remove has_variable_length from BlockDriver
Date: Fri,  7 Apr 2023 17:32:59 +0200
Message-Id: <20230407153303.391121-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407153303.391121-1-pbonzini@redhat.com>
References: <20230407153303.391121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Fill in the field in BlockLimits directly for host devices, and
copy it from there for the raw format.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c               | 12 ++++++++----
 block/file-win32.c               |  2 +-
 block/io.c                       |  2 --
 block/raw-format.c               |  3 ++-
 include/block/block_int-common.h |  2 --
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 5b0f2e6d261b..c7b723368e53 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3732,6 +3732,12 @@ static void cdrom_parse_filename(const char *filename, QDict *options,
 {
     bdrv_parse_filename_strip_prefix(filename, "host_cdrom:", options);
 }
+
+static void cdrom_refresh_limits(BlockDriverState *bs, Error **errp)
+{
+    bs->bl.has_variable_length = true;
+    raw_refresh_limits(bs, errp);
+}
 #endif
 
 #ifdef __linux__
@@ -3827,14 +3833,13 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_preadv         = raw_co_preadv,
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
-    .bdrv_refresh_limits = raw_refresh_limits,
+    .bdrv_refresh_limits    = cdrom_refresh_limits,
     .bdrv_co_io_plug        = raw_co_io_plug,
     .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
-    .has_variable_length                = true,
     .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
 
     /* removable device support */
@@ -3956,14 +3961,13 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_preadv         = raw_co_preadv,
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
-    .bdrv_refresh_limits = raw_refresh_limits,
+    .bdrv_refresh_limits    = cdrom_refresh_limits,
     .bdrv_co_io_plug        = raw_co_io_plug,
     .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
-    .has_variable_length                = true,
     .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
 
     /* removable device support */
diff --git a/block/file-win32.c b/block/file-win32.c
index 1a5f9e6a9b13..48b790d91739 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -836,6 +836,7 @@ static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     /* XXX Does Windows support AIO on less than 512-byte alignment? */
     bs->bl.request_alignment = 512;
+    bs->bl.has_variable_length = true;
 }
 
 static int hdev_open(BlockDriverState *bs, QDict *options, int flags,
@@ -931,7 +932,6 @@ static BlockDriver bdrv_host_device = {
     .bdrv_attach_aio_context = raw_attach_aio_context,
 
     .bdrv_co_getlength                = raw_co_getlength,
-    .has_variable_length              = true,
     .bdrv_co_get_allocated_file_size  = raw_co_get_allocated_file_size,
 };
 
diff --git a/block/io.c b/block/io.c
index c49917c74677..6fa199337472 100644
--- a/block/io.c
+++ b/block/io.c
@@ -182,8 +182,6 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
                                 drv->bdrv_aio_preadv ||
                                 drv->bdrv_co_preadv_part) ? 1 : 512;
 
-    bs->bl.has_variable_length = drv->has_variable_length;
-
     /* Take some limits from the children as a default */
     have_limits = false;
     QLIST_FOREACH(c, &bs->children, next) {
diff --git a/block/raw-format.c b/block/raw-format.c
index 66783ed8e77b..06b8030d9d40 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -377,6 +377,8 @@ raw_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
+    bs->bl.has_variable_length = bs->file->bs->bl.has_variable_length;
+
     if (bs->probed) {
         /* To make it easier to protect the first sector, any probed
          * image is restricted to read-modify-write on sub-sector
@@ -623,7 +625,6 @@ BlockDriver bdrv_raw = {
     .bdrv_co_truncate     = &raw_co_truncate,
     .bdrv_co_getlength    = &raw_co_getlength,
     .is_format            = true,
-    .has_variable_length  = true,
     .bdrv_measure         = &raw_measure,
     .bdrv_co_get_info     = &raw_co_get_info,
     .bdrv_refresh_limits  = &raw_refresh_limits,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 95c934589571..013d419444d9 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -158,8 +158,6 @@ struct BlockDriver {
      */
     bool supports_backing;
 
-    bool has_variable_length;
-
     /*
      * Drivers setting this field must be able to work with just a plain
      * filename with '<protocol_name>:' as a prefix, and no other options.
-- 
2.39.2


