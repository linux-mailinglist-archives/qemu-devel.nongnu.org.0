Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5BA6B1EB0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:51:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBzT-0007m4-HR; Thu, 09 Mar 2023 03:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBzP-0007lP-56
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBzM-00022w-T5
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1P2q82UUFuLyMLcsMZJiNAk9mNchF1IyDULsuxJ2WKo=;
 b=PNKku/HeVlXa0Ktyo0vbqnBcGt7iCO2XPDY7Ova5l+pChESy9UBy265JIZtQ7LPDn5SBbI
 B9IneUTfcy/4NDnWZLuj2yaC8bGsZF65CA0hEQ06szzBL+VVkFYTM8YfkmV7LHm7rqGBAu
 8nptcArkw5YyB4LGSdh2X7y74U7rDgQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-qAb1j_zbOs6nSAYjAmzfNg-1; Thu, 09 Mar 2023 03:50:59 -0500
X-MC-Unique: qAb1j_zbOs6nSAYjAmzfNg-1
Received: by mail-ed1-f72.google.com with SMTP id
 da22-20020a056402177600b004c60694083eso1925065edb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1P2q82UUFuLyMLcsMZJiNAk9mNchF1IyDULsuxJ2WKo=;
 b=7WsiPAbcEkiMuWUDJk856JGcXG/D36eqcS3HI3UOkPsmHsONnQmOHI28XiZTMbP0cB
 seSdfUWJh8QENfJMA1I7VktSQcHqQ4V9mc9YYlSkBHhxleQy5tHvBH382c/vaSzT9BZO
 Ub6/9D4xoZEbL5Wi525fKM0CeRjcQ6SpoP6SA7V8kdb/Rj4Nex/jxWeklZZAxTZiWJMg
 JdM1LV4vMHino0GBsd6onsixmY0ycXpWWuydfpBiakHZd2MQgpeY2UP0XHU94N0v9/KU
 Fmlx/6iQrC4TlZKDC4N0Qdd6w+fSyeD1JQG6qB1Lav4ujOu2tKKCt3dAvcpAPenfWIHi
 oBvA==
X-Gm-Message-State: AO0yUKXdpi61pN8U7hp6KXyXen+NY+y7vKl/lJX61U3wH5+goI85uHMJ
 18N32VSIS7S8RvYu+8O/M3t4doQr+H7RCDE2/GEW7QToPQcw1V5142y9cjaNOzqUeWnyHdKe7JE
 mNdxkx5zhVr2qcf0jIELJ0zJbroOywUEbngZjHycYNPzLuXIIv2eEDIOVXlvEd3Sxhc9lvmxJ5f
 A=
X-Received: by 2002:a17:907:8686:b0:8f7:5038:9896 with SMTP id
 qa6-20020a170907868600b008f750389896mr26130817ejc.70.1678351857183; 
 Thu, 09 Mar 2023 00:50:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/bYfen0PilbO21AfZS7lkMCWZb3Nf1goKpCfkpsxkbm0qsAZtj1PQ6h4VRe9B+8MLBQIVgMw==
X-Received: by 2002:a17:907:8686:b0:8f7:5038:9896 with SMTP id
 qa6-20020a170907868600b008f750389896mr26130795ejc.70.1678351856824; 
 Thu, 09 Mar 2023 00:50:56 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 bt5-20020a170906b14500b008cca31606a8sm8613135ejb.51.2023.03.09.00.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:50:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 3/3] block: remove separate bdrv_file_open callback
Date: Thu,  9 Mar 2023 09:50:51 +0100
Message-Id: <20230309085051.308664-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309085051.308664-1-pbonzini@redhat.com>
References: <20230309085051.308664-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

bdrv_file_open and bdrv_open are completely equivalent, they are
never checked except to see which one to invoke.  So merge them
into a single one.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c                          | 2 --
 block/blkdebug.c                 | 2 +-
 block/blkio.c                    | 2 +-
 block/blkverify.c                | 2 +-
 block/curl.c                     | 8 ++++----
 block/file-posix.c               | 8 ++++----
 block/file-win32.c               | 4 ++--
 block/gluster.c                  | 8 ++++----
 block/iscsi.c                    | 4 ++--
 block/nbd.c                      | 6 +++---
 block/nfs.c                      | 2 +-
 block/null.c                     | 4 ++--
 block/nvme.c                     | 2 +-
 block/rbd.c                      | 3 ++-
 block/ssh.c                      | 2 +-
 block/vvfat.c                    | 2 +-
 include/block/block_int-common.h | 3 ---
 17 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/block.c b/block.c
index 71f0ea24870e..e6d20f89ba82 100644
--- a/block.c
+++ b/block.c
@@ -1628,8 +1628,6 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
 
     assert(!drv->bdrv_needs_filename || bs->filename[0]);
     if (drv->bdrv_open) {
-        ret = drv->bdrv_file_open(bs, options, open_flags, &local_err);
-    } else if (drv->bdrv_open) {
         ret = drv->bdrv_open(bs, options, open_flags, &local_err);
     } else {
         ret = 0;
diff --git a/block/blkdebug.c b/block/blkdebug.c
index addad914b3f7..c9ae3cb6ae3d 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -1072,7 +1072,7 @@ static BlockDriver bdrv_blkdebug = {
     .is_filter              = true,
 
     .bdrv_parse_filename    = blkdebug_parse_filename,
-    .bdrv_file_open         = blkdebug_open,
+    .bdrv_open              = blkdebug_open,
     .bdrv_close             = blkdebug_close,
     .bdrv_reopen_prepare    = blkdebug_reopen_prepare,
     .bdrv_child_perm        = blkdebug_child_perm,
diff --git a/block/blkio.c b/block/blkio.c
index 0cdc99a72960..c2efe1a8feec 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -997,7 +997,7 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
         .format_name             = name, \
         .protocol_name           = name, \
         .instance_size           = sizeof(BDRVBlkioState), \
-        .bdrv_file_open          = blkio_file_open, \
+        .bdrv_open               = blkio_open, \
         .bdrv_close              = blkio_close, \
         .bdrv_co_getlength       = blkio_co_getlength, \
         .bdrv_co_truncate        = blkio_truncate, \
diff --git a/block/blkverify.c b/block/blkverify.c
index 1c16f86b2e70..9b59b34c02ba 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -312,7 +312,7 @@ static BlockDriver bdrv_blkverify = {
     .instance_size                    = sizeof(BDRVBlkverifyState),
 
     .bdrv_parse_filename              = blkverify_parse_filename,
-    .bdrv_file_open                   = blkverify_open,
+    .bdrv_open                        = blkverify_open,
     .bdrv_close                       = blkverify_close,
     .bdrv_child_perm                  = bdrv_default_perms,
     .bdrv_co_getlength                = blkverify_co_getlength,
diff --git a/block/curl.c b/block/curl.c
index 8bb39a134e4b..809858692652 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -1032,7 +1032,7 @@ static BlockDriver bdrv_http = {
 
     .instance_size              = sizeof(BDRVCURLState),
     .bdrv_parse_filename        = curl_parse_filename,
-    .bdrv_file_open             = curl_open,
+    .bdrv_open                  = curl_open,
     .bdrv_close                 = curl_close,
     .bdrv_co_getlength          = curl_co_getlength,
 
@@ -1051,7 +1051,7 @@ static BlockDriver bdrv_https = {
 
     .instance_size              = sizeof(BDRVCURLState),
     .bdrv_parse_filename        = curl_parse_filename,
-    .bdrv_file_open             = curl_open,
+    .bdrv_open                  = curl_open,
     .bdrv_close                 = curl_close,
     .bdrv_co_getlength          = curl_co_getlength,
 
@@ -1070,7 +1070,7 @@ static BlockDriver bdrv_ftp = {
 
     .instance_size              = sizeof(BDRVCURLState),
     .bdrv_parse_filename        = curl_parse_filename,
-    .bdrv_file_open             = curl_open,
+    .bdrv_open                  = curl_open,
     .bdrv_close                 = curl_close,
     .bdrv_co_getlength          = curl_co_getlength,
 
@@ -1089,7 +1089,7 @@ static BlockDriver bdrv_ftps = {
 
     .instance_size              = sizeof(BDRVCURLState),
     .bdrv_parse_filename        = curl_parse_filename,
-    .bdrv_file_open             = curl_open,
+    .bdrv_open                  = curl_open,
     .bdrv_close                 = curl_close,
     .bdrv_co_getlength          = curl_co_getlength,
 
diff --git a/block/file-posix.c b/block/file-posix.c
index 5760cf22d17d..578b512ed515 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3323,7 +3323,7 @@ BlockDriver bdrv_file = {
     .bdrv_needs_filename = true,
     .bdrv_probe = NULL, /* no probe for protocols */
     .bdrv_parse_filename = raw_parse_filename,
-    .bdrv_file_open = raw_open,
+    .bdrv_open      = raw_open,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit = raw_reopen_commit,
     .bdrv_reopen_abort = raw_reopen_abort,
@@ -3697,7 +3697,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_needs_filename = true,
     .bdrv_probe_device  = hdev_probe_device,
     .bdrv_parse_filename = hdev_parse_filename,
-    .bdrv_file_open     = hdev_open,
+    .bdrv_open          = hdev_open,
     .bdrv_close         = raw_close,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit  = raw_reopen_commit,
@@ -3825,7 +3825,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_needs_filename = true,
     .bdrv_probe_device	= cdrom_probe_device,
     .bdrv_parse_filename = cdrom_parse_filename,
-    .bdrv_file_open     = cdrom_open,
+    .bdrv_open          = cdrom_open,
     .bdrv_close         = raw_close,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit  = raw_reopen_commit,
@@ -3955,7 +3955,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_needs_filename = true,
     .bdrv_probe_device	= cdrom_probe_device,
     .bdrv_parse_filename = cdrom_parse_filename,
-    .bdrv_file_open     = cdrom_open,
+    .bdrv_open          = cdrom_open,
     .bdrv_close         = raw_close,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit  = raw_reopen_commit,
diff --git a/block/file-win32.c b/block/file-win32.c
index c7d0b8530637..53f4955e2999 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -748,7 +748,7 @@ BlockDriver bdrv_file = {
     .instance_size	= sizeof(BDRVRawState),
     .bdrv_needs_filename = true,
     .bdrv_parse_filename = raw_parse_filename,
-    .bdrv_file_open     = raw_open,
+    .bdrv_open          = raw_open,
     .bdrv_refresh_limits = raw_probe_alignment,
     .bdrv_close         = raw_close,
     .bdrv_co_create_opts = raw_co_create_opts,
@@ -921,7 +921,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_needs_filename = true,
     .bdrv_parse_filename = hdev_parse_filename,
     .bdrv_probe_device	= hdev_probe_device,
-    .bdrv_file_open	= hdev_open,
+    .bdrv_open     	= hdev_open,
     .bdrv_close		= raw_close,
     .bdrv_refresh_limits = hdev_refresh_limits,
 
diff --git a/block/gluster.c b/block/gluster.c
index 185a83e5e533..6b25aa2516ab 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1553,7 +1553,7 @@ static BlockDriver bdrv_gluster = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_file_open               = qemu_gluster_open,
+    .bdrv_open                    = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
     .bdrv_reopen_abort            = qemu_gluster_reopen_abort,
@@ -1582,7 +1582,7 @@ static BlockDriver bdrv_gluster_tcp = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster+tcp",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_file_open               = qemu_gluster_open,
+    .bdrv_open                    = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
     .bdrv_reopen_abort            = qemu_gluster_reopen_abort,
@@ -1611,7 +1611,7 @@ static BlockDriver bdrv_gluster_unix = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster+unix",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_file_open               = qemu_gluster_open,
+    .bdrv_open                    = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
     .bdrv_reopen_abort            = qemu_gluster_reopen_abort,
@@ -1646,7 +1646,7 @@ static BlockDriver bdrv_gluster_rdma = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster+rdma",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_file_open               = qemu_gluster_open,
+    .bdrv_open                    = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
     .bdrv_reopen_abort            = qemu_gluster_reopen_abort,
diff --git a/block/iscsi.c b/block/iscsi.c
index 9fc0bed90b81..08c1d2cb0d57 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2427,7 +2427,7 @@ static BlockDriver bdrv_iscsi = {
 
     .instance_size          = sizeof(IscsiLun),
     .bdrv_parse_filename    = iscsi_parse_filename,
-    .bdrv_file_open         = iscsi_open,
+    .bdrv_open              = iscsi_open,
     .bdrv_close             = iscsi_close,
     .bdrv_co_create_opts    = bdrv_co_create_opts_simple,
     .create_opts            = &bdrv_create_opts_simple,
@@ -2466,7 +2466,7 @@ static BlockDriver bdrv_iser = {
 
     .instance_size          = sizeof(IscsiLun),
     .bdrv_parse_filename    = iscsi_parse_filename,
-    .bdrv_file_open         = iscsi_open,
+    .bdrv_open              = iscsi_open,
     .bdrv_close             = iscsi_close,
     .bdrv_co_create_opts    = bdrv_co_create_opts_simple,
     .create_opts            = &bdrv_create_opts_simple,
diff --git a/block/nbd.c b/block/nbd.c
index bf2894ad5c9b..4ff1da684e64 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2114,7 +2114,7 @@ static BlockDriver bdrv_nbd = {
     .bdrv_parse_filename        = nbd_parse_filename,
     .bdrv_co_create_opts        = bdrv_co_create_opts_simple,
     .create_opts                = &bdrv_create_opts_simple,
-    .bdrv_file_open             = nbd_open,
+    .bdrv_open                  = nbd_open,
     .bdrv_reopen_prepare        = nbd_client_reopen_prepare,
     .bdrv_co_preadv             = nbd_client_co_preadv,
     .bdrv_co_pwritev            = nbd_client_co_pwritev,
@@ -2142,7 +2142,7 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_parse_filename        = nbd_parse_filename,
     .bdrv_co_create_opts        = bdrv_co_create_opts_simple,
     .create_opts                = &bdrv_create_opts_simple,
-    .bdrv_file_open             = nbd_open,
+    .bdrv_open                  = nbd_open,
     .bdrv_reopen_prepare        = nbd_client_reopen_prepare,
     .bdrv_co_preadv             = nbd_client_co_preadv,
     .bdrv_co_pwritev            = nbd_client_co_pwritev,
@@ -2170,7 +2170,7 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_parse_filename        = nbd_parse_filename,
     .bdrv_co_create_opts        = bdrv_co_create_opts_simple,
     .create_opts                = &bdrv_create_opts_simple,
-    .bdrv_file_open             = nbd_open,
+    .bdrv_open                  = nbd_open,
     .bdrv_reopen_prepare        = nbd_client_reopen_prepare,
     .bdrv_co_preadv             = nbd_client_co_preadv,
     .bdrv_co_pwritev            = nbd_client_co_pwritev,
diff --git a/block/nfs.c b/block/nfs.c
index 351dc6ec8d14..4bd43404e53f 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -889,7 +889,7 @@ static BlockDriver bdrv_nfs = {
 #endif
     .bdrv_co_truncate               = nfs_file_co_truncate,
 
-    .bdrv_file_open                 = nfs_file_open,
+    .bdrv_open                      = nfs_file_open,
     .bdrv_close                     = nfs_file_close,
     .bdrv_co_create                 = nfs_file_co_create,
     .bdrv_co_create_opts            = nfs_file_co_create_opts,
diff --git a/block/null.c b/block/null.c
index 4808704ffd3a..6fa64d20d865 100644
--- a/block/null.c
+++ b/block/null.c
@@ -283,7 +283,7 @@ static BlockDriver bdrv_null_co = {
     .protocol_name          = "null-co",
     .instance_size          = sizeof(BDRVNullState),
 
-    .bdrv_file_open         = null_file_open,
+    .bdrv_open              = null_file_open,
     .bdrv_parse_filename    = null_co_parse_filename,
     .bdrv_co_getlength      = null_co_getlength,
     .bdrv_co_get_allocated_file_size = null_co_get_allocated_file_size,
@@ -304,7 +304,7 @@ static BlockDriver bdrv_null_aio = {
     .protocol_name          = "null-aio",
     .instance_size          = sizeof(BDRVNullState),
 
-    .bdrv_file_open         = null_file_open,
+    .bdrv_open              = null_file_open,
     .bdrv_parse_filename    = null_aio_parse_filename,
     .bdrv_co_getlength      = null_co_getlength,
     .bdrv_co_get_allocated_file_size = null_co_get_allocated_file_size,
diff --git a/block/nvme.c b/block/nvme.c
index 5b744c2bdad4..015a1a3cec9e 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1641,7 +1641,7 @@ static BlockDriver bdrv_nvme = {
     .create_opts              = &bdrv_create_opts_simple,
 
     .bdrv_parse_filename      = nvme_parse_filename,
-    .bdrv_file_open           = nvme_file_open,
+    .bdrv_open                = nvme_file_open,
     .bdrv_close               = nvme_close,
     .bdrv_co_getlength        = nvme_co_getlength,
     .bdrv_probe_blocksizes    = nvme_probe_blocksizes,
diff --git a/block/rbd.c b/block/rbd.c
index 978671411ec7..9ea00d82930d 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1811,8 +1811,9 @@ static const char *const qemu_rbd_strong_runtime_opts[] = {
 static BlockDriver bdrv_rbd = {
     .format_name            = "rbd",
     .instance_size          = sizeof(BDRVRBDState),
+
     .bdrv_parse_filename    = qemu_rbd_parse_filename,
-    .bdrv_file_open         = qemu_rbd_open,
+    .bdrv_open              = qemu_rbd_open,
     .bdrv_close             = qemu_rbd_close,
     .bdrv_reopen_prepare    = qemu_rbd_reopen_prepare,
     .bdrv_co_create         = qemu_rbd_co_create,
diff --git a/block/ssh.c b/block/ssh.c
index b3b3352075ff..a7820ba7fde0 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -1357,7 +1357,7 @@ static BlockDriver bdrv_ssh = {
     .protocol_name                = "ssh",
     .instance_size                = sizeof(BDRVSSHState),
     .bdrv_parse_filename          = ssh_parse_filename,
-    .bdrv_file_open               = ssh_file_open,
+    .bdrv_open                    = ssh_file_open,
     .bdrv_co_create               = ssh_co_create,
     .bdrv_co_create_opts          = ssh_co_create_opts,
     .bdrv_close                   = ssh_close,
diff --git a/block/vvfat.c b/block/vvfat.c
index 0ddc91fc096a..e0e28713c433 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3257,7 +3257,7 @@ static BlockDriver bdrv_vvfat = {
     .instance_size          = sizeof(BDRVVVFATState),
 
     .bdrv_parse_filename    = vvfat_parse_filename,
-    .bdrv_file_open         = vvfat_open,
+    .bdrv_open              = vvfat_open,
     .bdrv_refresh_limits    = vvfat_refresh_limits,
     .bdrv_close             = vvfat_close,
     .bdrv_child_perm        = vvfat_child_perm,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d4190173284f..a72d7d2c93a7 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -241,9 +241,6 @@ struct BlockDriver {
     int (*bdrv_open)(BlockDriverState *bs, QDict *options, int flags,
                      Error **errp);
 
-    /* Protocol drivers should implement this instead of bdrv_open */
-    int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
-                          Error **errp);
     void (*bdrv_close)(BlockDriverState *bs);
 
     int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_create)(
-- 
2.39.2


