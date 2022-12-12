Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F09664A0E6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:32:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4igj-0006hP-MG; Mon, 12 Dec 2022 08:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4igJ-0006Up-29
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:17:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4igG-0004IL-CW
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670851035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5tPF49/UUjVqgitscASI3uSOIKkEYyONSpFX3RhRhfk=;
 b=V/rPpvgmjBR/HsGdrDIejTFpsQxrKRiXW9WQpa7mdzojkW+ytLrN5Hc2Xjj/XjdNQRSqnO
 wCrrLDx8EHqgoFp1mfKqt36h4ywT4uKusuqlLzK6X6C6HNkzaeKbtWIFR/E+LqNvJhpzK3
 kUkjCRQF8wAVkpDGa/jj57/KWOmIeRk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-461-_bz4HNIOMH2fJ7975Nb-CQ-1; Mon, 12 Dec 2022 08:17:14 -0500
X-MC-Unique: _bz4HNIOMH2fJ7975Nb-CQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 g14-20020adfa48e000000b00241f94bcd54so2246379wrb.23
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tPF49/UUjVqgitscASI3uSOIKkEYyONSpFX3RhRhfk=;
 b=aOtpVCne7SsVGJ/3o5SPCA6jxGc5d40uMEYgBa9tGNwUz9puKYN0zA6PnNgk4LzIr5
 ak5QUDtJF9pK7Jjse2NYcWe1e3NQB8aYd8cA0KiMmQgyr+MYQfpO6jZbXjzs7sj/nxpy
 O5nsgjGmuCVAGz0RYsXn/Zz2MLbZvUk3z28zt7Vb5TMvw5wRbyHqBDNseEhiLZmTzGqK
 Qc46PV2RAvLUBbJULx5X6rcnKiOu87cDrIdlTG2oBokf9IGwA3vQ/pF3/MuooDeqpb6U
 0zr+9GU4TeLDz2l0/YvOhk/YN9e3uQkdgxEa8LpKSF5ozdhP4BY2rR4KE4kVUI34CbhS
 xJoA==
X-Gm-Message-State: ANoB5pmgJHQYSpV2ei/SBLo+SIA3y09DaETFXXRVfUHP9m4T6vK87mXD
 fTQKKHS/txg1E5wJbjej2t2DvLr1x3oy3xf/97yOM2QrjysnyQH2qvFlcRb7h9jUhRTIFwlnJhN
 YOd+oDGAj8fo44wRmg+0JkS0G464QIjaxRa8AR790yRL59x9rL1EUMJjtjNiF2DNwkik=
X-Received: by 2002:adf:e811:0:b0:242:5083:abeb with SMTP id
 o17-20020adfe811000000b002425083abebmr10870081wrm.1.1670851032877; 
 Mon, 12 Dec 2022 05:17:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6QDlP+RrauD8EfPopxo+a9iNcwrlv3CezK15WT7tsKKhQfbTlInBz0+Brl6e9c2YHWUsBJiQ==
X-Received: by 2002:adf:e811:0:b0:242:5083:abeb with SMTP id
 o17-20020adfe811000000b002425083abebmr10870060wrm.1.1670851032533; 
 Mon, 12 Dec 2022 05:17:12 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adffe45000000b002302dc43d77sm8793436wrs.115.2022.12.12.05.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 05:17:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH 3/3] block: remove separate bdrv_file_open callback
Date: Mon, 12 Dec 2022 14:17:00 +0100
Message-Id: <20221212131700.250209-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212131700.250209-1-pbonzini@redhat.com>
References: <20221212131700.250209-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
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

bdrv_file_open and bdrv_open are completely equivalent, they are
never checked except to see which one to invoke.  So merge them
into a single callback.

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
index 7a66cc2ea23a..48efbf94106e 100644
--- a/block.c
+++ b/block.c
@@ -1618,8 +1618,6 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
 
     assert(!drv->bdrv_needs_filename || bs->filename[0]);
     if (drv->bdrv_open) {
-        ret = drv->bdrv_file_open(bs, options, open_flags, &local_err);
-    } else if (drv->bdrv_open) {
         ret = drv->bdrv_open(bs, options, open_flags, &local_err);
     } else {
         ret = 0;
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 4265ca125e25..a4445a352876 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -1071,7 +1071,7 @@ static BlockDriver bdrv_blkdebug = {
     .is_filter              = true,
 
     .bdrv_parse_filename    = blkdebug_parse_filename,
-    .bdrv_file_open         = blkdebug_open,
+    .bdrv_open              = blkdebug_open,
     .bdrv_close             = blkdebug_close,
     .bdrv_reopen_prepare    = blkdebug_reopen_prepare,
     .bdrv_child_perm        = blkdebug_child_perm,
diff --git a/block/blkio.c b/block/blkio.c
index 5eae3adfaf66..45ae5780152c 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -994,7 +994,7 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
         .format_name             = name, \
         .protocol_name           = name, \
         .instance_size           = sizeof(BDRVBlkioState), \
-        .bdrv_file_open          = blkio_file_open, \
+        .bdrv_open               = blkio_open, \
         .bdrv_close              = blkio_close, \
         .bdrv_getlength          = blkio_getlength, \
         .bdrv_co_truncate        = blkio_truncate, \
diff --git a/block/blkverify.c b/block/blkverify.c
index c60a2dc624dc..e5b5d5c4a426 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -310,7 +310,7 @@ static BlockDriver bdrv_blkverify = {
     .instance_size                    = sizeof(BDRVBlkverifyState),
 
     .bdrv_parse_filename              = blkverify_parse_filename,
-    .bdrv_file_open                   = blkverify_open,
+    .bdrv_open                        = blkverify_open,
     .bdrv_close                       = blkverify_close,
     .bdrv_child_perm                  = bdrv_default_perms,
     .bdrv_getlength                   = blkverify_getlength,
diff --git a/block/curl.c b/block/curl.c
index cba4c4cac768..398b28163e00 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -999,7 +999,7 @@ static BlockDriver bdrv_http = {
 
     .instance_size              = sizeof(BDRVCURLState),
     .bdrv_parse_filename        = curl_parse_filename,
-    .bdrv_file_open             = curl_open,
+    .bdrv_open                  = curl_open,
     .bdrv_close                 = curl_close,
     .bdrv_getlength             = curl_getlength,
 
@@ -1018,7 +1018,7 @@ static BlockDriver bdrv_https = {
 
     .instance_size              = sizeof(BDRVCURLState),
     .bdrv_parse_filename        = curl_parse_filename,
-    .bdrv_file_open             = curl_open,
+    .bdrv_open                  = curl_open,
     .bdrv_close                 = curl_close,
     .bdrv_getlength             = curl_getlength,
 
@@ -1037,7 +1037,7 @@ static BlockDriver bdrv_ftp = {
 
     .instance_size              = sizeof(BDRVCURLState),
     .bdrv_parse_filename        = curl_parse_filename,
-    .bdrv_file_open             = curl_open,
+    .bdrv_open                  = curl_open,
     .bdrv_close                 = curl_close,
     .bdrv_getlength             = curl_getlength,
 
@@ -1056,7 +1056,7 @@ static BlockDriver bdrv_ftps = {
 
     .instance_size              = sizeof(BDRVCURLState),
     .bdrv_parse_filename        = curl_parse_filename,
-    .bdrv_file_open             = curl_open,
+    .bdrv_open                  = curl_open,
     .bdrv_close                 = curl_close,
     .bdrv_getlength             = curl_getlength,
 
diff --git a/block/file-posix.c b/block/file-posix.c
index b9647c5ffc26..91c4a2d74687 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3301,7 +3301,7 @@ BlockDriver bdrv_file = {
     .bdrv_needs_filename = true,
     .bdrv_probe = NULL, /* no probe for protocols */
     .bdrv_parse_filename = raw_parse_filename,
-    .bdrv_file_open = raw_open,
+    .bdrv_open      = raw_open,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit = raw_reopen_commit,
     .bdrv_reopen_abort = raw_reopen_abort,
@@ -3675,7 +3675,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_needs_filename = true,
     .bdrv_probe_device  = hdev_probe_device,
     .bdrv_parse_filename = hdev_parse_filename,
-    .bdrv_file_open     = hdev_open,
+    .bdrv_open          = hdev_open,
     .bdrv_close         = raw_close,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit  = raw_reopen_commit,
@@ -3803,7 +3803,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_needs_filename = true,
     .bdrv_probe_device	= cdrom_probe_device,
     .bdrv_parse_filename = cdrom_parse_filename,
-    .bdrv_file_open     = cdrom_open,
+    .bdrv_open          = cdrom_open,
     .bdrv_close         = raw_close,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit  = raw_reopen_commit,
@@ -3934,7 +3934,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_needs_filename = true,
     .bdrv_probe_device	= cdrom_probe_device,
     .bdrv_parse_filename = cdrom_parse_filename,
-    .bdrv_file_open     = cdrom_open,
+    .bdrv_open          = cdrom_open,
     .bdrv_close         = raw_close,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit  = raw_reopen_commit,
diff --git a/block/file-win32.c b/block/file-win32.c
index ec9d64d0e4e2..4207e521f22a 100644
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
index 7c90f7ba4b80..0ab196b35229 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1554,7 +1554,7 @@ static BlockDriver bdrv_gluster = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_file_open               = qemu_gluster_open,
+    .bdrv_open                    = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
     .bdrv_reopen_abort            = qemu_gluster_reopen_abort,
@@ -1583,7 +1583,7 @@ static BlockDriver bdrv_gluster_tcp = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster+tcp",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_file_open               = qemu_gluster_open,
+    .bdrv_open                    = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
     .bdrv_reopen_abort            = qemu_gluster_reopen_abort,
@@ -1612,7 +1612,7 @@ static BlockDriver bdrv_gluster_unix = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster+unix",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_file_open               = qemu_gluster_open,
+    .bdrv_open                    = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
     .bdrv_reopen_abort            = qemu_gluster_reopen_abort,
@@ -1647,7 +1647,7 @@ static BlockDriver bdrv_gluster_rdma = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster+rdma",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_file_open               = qemu_gluster_open,
+    .bdrv_open                    = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
     .bdrv_reopen_abort            = qemu_gluster_reopen_abort,
diff --git a/block/iscsi.c b/block/iscsi.c
index a316d46d9625..dc6cbe0f74a5 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2425,7 +2425,7 @@ static BlockDriver bdrv_iscsi = {
 
     .instance_size          = sizeof(IscsiLun),
     .bdrv_parse_filename    = iscsi_parse_filename,
-    .bdrv_file_open         = iscsi_open,
+    .bdrv_open              = iscsi_open,
     .bdrv_close             = iscsi_close,
     .bdrv_co_create_opts    = bdrv_co_create_opts_simple,
     .create_opts            = &bdrv_create_opts_simple,
@@ -2464,7 +2464,7 @@ static BlockDriver bdrv_iser = {
 
     .instance_size          = sizeof(IscsiLun),
     .bdrv_parse_filename    = iscsi_parse_filename,
-    .bdrv_file_open         = iscsi_open,
+    .bdrv_open              = iscsi_open,
     .bdrv_close             = iscsi_close,
     .bdrv_co_create_opts    = bdrv_co_create_opts_simple,
     .create_opts            = &bdrv_create_opts_simple,
diff --git a/block/nbd.c b/block/nbd.c
index 7d485c86d285..a332372a5380 100644
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
index ece22353ac53..126e3898f966 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -888,7 +888,7 @@ static BlockDriver bdrv_nfs = {
 #endif
     .bdrv_co_truncate               = nfs_file_co_truncate,
 
-    .bdrv_file_open                 = nfs_file_open,
+    .bdrv_open                      = nfs_file_open,
     .bdrv_close                     = nfs_file_close,
     .bdrv_co_create                 = nfs_file_co_create,
     .bdrv_co_create_opts            = nfs_file_co_create_opts,
diff --git a/block/null.c b/block/null.c
index 75f7d0db40c4..f3a427b6c69a 100644
--- a/block/null.c
+++ b/block/null.c
@@ -281,7 +281,7 @@ static BlockDriver bdrv_null_co = {
     .protocol_name          = "null-co",
     .instance_size          = sizeof(BDRVNullState),
 
-    .bdrv_file_open         = null_file_open,
+    .bdrv_open              = null_file_open,
     .bdrv_parse_filename    = null_co_parse_filename,
     .bdrv_getlength         = null_getlength,
     .bdrv_get_allocated_file_size = null_allocated_file_size,
@@ -302,7 +302,7 @@ static BlockDriver bdrv_null_aio = {
     .protocol_name          = "null-aio",
     .instance_size          = sizeof(BDRVNullState),
 
-    .bdrv_file_open         = null_file_open,
+    .bdrv_open              = null_file_open,
     .bdrv_parse_filename    = null_aio_parse_filename,
     .bdrv_getlength         = null_getlength,
     .bdrv_get_allocated_file_size = null_allocated_file_size,
diff --git a/block/nvme.c b/block/nvme.c
index 656624c585a2..5083b36b89bc 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1640,7 +1640,7 @@ static BlockDriver bdrv_nvme = {
     .create_opts              = &bdrv_create_opts_simple,
 
     .bdrv_parse_filename      = nvme_parse_filename,
-    .bdrv_file_open           = nvme_file_open,
+    .bdrv_open                = nvme_file_open,
     .bdrv_close               = nvme_close,
     .bdrv_getlength           = nvme_getlength,
     .bdrv_probe_blocksizes    = nvme_probe_blocksizes,
diff --git a/block/rbd.c b/block/rbd.c
index f826410f40f9..4c759dd51167 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1648,8 +1648,9 @@ static const char *const qemu_rbd_strong_runtime_opts[] = {
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
index 04726d4ecb58..07a99d6b8ed6 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -1356,7 +1356,7 @@ static BlockDriver bdrv_ssh = {
     .protocol_name                = "ssh",
     .instance_size                = sizeof(BDRVSSHState),
     .bdrv_parse_filename          = ssh_parse_filename,
-    .bdrv_file_open               = ssh_file_open,
+    .bdrv_open                    = ssh_file_open,
     .bdrv_co_create               = ssh_co_create,
     .bdrv_co_create_opts          = ssh_co_create_opts,
     .bdrv_close                   = ssh_close,
diff --git a/block/vvfat.c b/block/vvfat.c
index 723c91216e0c..88943a99db9d 100644
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
index a6bc6b7fe9bd..c670f3c8da1c 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -245,9 +245,6 @@ struct BlockDriver {
     int (*bdrv_open)(BlockDriverState *bs, QDict *options, int flags,
                      Error **errp);
 
-    /* Protocol drivers should implement this instead of bdrv_open */
-    int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
-                          Error **errp);
     void (*bdrv_close)(BlockDriverState *bs);
 
     int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
-- 
2.38.1


