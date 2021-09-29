Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B597941CFA8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 01:01:41 +0200 (CEST)
Received: from localhost ([::1]:45910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVia3-0004N4-CM
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 19:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1mViXr-0003UG-Tb; Wed, 29 Sep 2021 18:59:23 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:38682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1mViXq-0001TF-0W; Wed, 29 Sep 2021 18:59:23 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id EF24111EEC5;
 Wed, 29 Sep 2021 22:59:19 +0000 (UTC)
From: ~farzon <farzon@git.sr.ht>
Date: Wed, 29 Sep 2021 01:30:50 -0400
Subject: [PATCH qemu v2] QEMU coding style mandates spaces for indentation.
 This change replaces TABs in block files.
Message-ID: <163295635969.12353.14555479457179645848-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~farzon <farzon@farzon.org>
Cc: thuth@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Farzon Lotfi <hi@farzon.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/371

Signed-off-by: Farzon Lotfi <hi@farzon.org>
---
 block/bochs.c       | 10 +++++-----
 block/file-posix.c  |  8 ++++----
 block/file-win32.c  | 20 ++++++++++----------
 block/parallels.c   | 10 +++++-----
 block/qcow.c        | 10 +++++-----
 include/block/nbd.h |  2 +-
 6 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/block/bochs.c b/block/bochs.c
index 2f010ab40a..01b84625c0 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -293,14 +293,14 @@ static void bochs_close(BlockDriverState *bs)
 }
=20
 static BlockDriver bdrv_bochs =3D {
-    .format_name	=3D "bochs",
-    .instance_size	=3D sizeof(BDRVBochsState),
-    .bdrv_probe		=3D bochs_probe,
-    .bdrv_open		=3D bochs_open,
+    .format_name    =3D "bochs",
+    .instance_size  =3D sizeof(BDRVBochsState),
+    .bdrv_probe     =3D bochs_probe,
+    .bdrv_open      =3D bochs_open,
     .bdrv_child_perm     =3D bdrv_default_perms,
     .bdrv_refresh_limits =3D bochs_refresh_limits,
     .bdrv_co_preadv =3D bochs_co_preadv,
-    .bdrv_close		=3D bochs_close,
+    .bdrv_close     =3D bochs_close,
     .is_format          =3D true,
 };
=20
diff --git a/block/file-posix.c b/block/file-posix.c
index d81e15efa4..9fc065506d 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -127,7 +127,7 @@
 #define FTYPE_FILE   0
 #define FTYPE_CD     1
=20
-#define MAX_BLOCKSIZE	4096
+#define MAX_BLOCKSIZE   4096
=20
 /* Posix file locking bytes. Libvirt takes byte 0, we start from higher byte=
s,
  * leaving a few more bytes for its future use. */
@@ -3647,7 +3647,7 @@ static BlockDriver bdrv_host_device =3D {
     .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
=20
     .bdrv_co_truncate       =3D raw_co_truncate,
-    .bdrv_getlength	=3D raw_getlength,
+    .bdrv_getlength =3D raw_getlength,
     .bdrv_get_info =3D raw_get_info,
     .bdrv_get_allocated_file_size
                         =3D raw_get_allocated_file_size,
@@ -3750,7 +3750,7 @@ static BlockDriver bdrv_host_cdrom =3D {
     .protocol_name      =3D "host_cdrom",
     .instance_size      =3D sizeof(BDRVRawState),
     .bdrv_needs_filename =3D true,
-    .bdrv_probe_device	=3D cdrom_probe_device,
+    .bdrv_probe_device  =3D cdrom_probe_device,
     .bdrv_parse_filename =3D cdrom_parse_filename,
     .bdrv_file_open     =3D cdrom_open,
     .bdrv_close         =3D raw_close,
@@ -3881,7 +3881,7 @@ static BlockDriver bdrv_host_cdrom =3D {
     .protocol_name      =3D "host_cdrom",
     .instance_size      =3D sizeof(BDRVRawState),
     .bdrv_needs_filename =3D true,
-    .bdrv_probe_device	=3D cdrom_probe_device,
+    .bdrv_probe_device  =3D cdrom_probe_device,
     .bdrv_parse_filename =3D cdrom_parse_filename,
     .bdrv_file_open     =3D cdrom_open,
     .bdrv_close         =3D raw_close,
diff --git a/block/file-win32.c b/block/file-win32.c
index b97c58d642..f80e62faf1 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -743,9 +743,9 @@ static QemuOptsList raw_create_opts =3D {
 };
=20
 BlockDriver bdrv_file =3D {
-    .format_name	=3D "file",
-    .protocol_name	=3D "file",
-    .instance_size	=3D sizeof(BDRVRawState),
+    .format_name    =3D "file",
+    .protocol_name  =3D "file",
+    .instance_size  =3D sizeof(BDRVRawState),
     .bdrv_needs_filename =3D true,
     .bdrv_parse_filename =3D raw_parse_filename,
     .bdrv_file_open     =3D raw_open,
@@ -763,7 +763,7 @@ BlockDriver bdrv_file =3D {
     .bdrv_aio_flush     =3D raw_aio_flush,
=20
     .bdrv_co_truncate   =3D raw_co_truncate,
-    .bdrv_getlength	=3D raw_getlength,
+    .bdrv_getlength =3D raw_getlength,
     .bdrv_get_allocated_file_size
                         =3D raw_get_allocated_file_size,
=20
@@ -915,14 +915,14 @@ done:
 }
=20
 static BlockDriver bdrv_host_device =3D {
-    .format_name	=3D "host_device",
-    .protocol_name	=3D "host_device",
-    .instance_size	=3D sizeof(BDRVRawState),
+    .format_name    =3D "host_device",
+    .protocol_name  =3D "host_device",
+    .instance_size  =3D sizeof(BDRVRawState),
     .bdrv_needs_filename =3D true,
     .bdrv_parse_filename =3D hdev_parse_filename,
-    .bdrv_probe_device	=3D hdev_probe_device,
-    .bdrv_file_open	=3D hdev_open,
-    .bdrv_close		=3D raw_close,
+    .bdrv_probe_device  =3D hdev_probe_device,
+    .bdrv_file_open =3D hdev_open,
+    .bdrv_close     =3D raw_close,
     .bdrv_refresh_limits =3D hdev_refresh_limits,
=20
     .bdrv_aio_preadv    =3D raw_aio_preadv,
diff --git a/block/parallels.c b/block/parallels.c
index 6ebad2a2bb..629d8aae2b 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -916,11 +916,11 @@ static void parallels_close(BlockDriverState *bs)
 }
=20
 static BlockDriver bdrv_parallels =3D {
-    .format_name	=3D "parallels",
-    .instance_size	=3D sizeof(BDRVParallelsState),
-    .bdrv_probe		=3D parallels_probe,
-    .bdrv_open		=3D parallels_open,
-    .bdrv_close		=3D parallels_close,
+    .format_name    =3D "parallels",
+    .instance_size  =3D sizeof(BDRVParallelsState),
+    .bdrv_probe     =3D parallels_probe,
+    .bdrv_open      =3D parallels_open,
+    .bdrv_close     =3D parallels_close,
     .bdrv_child_perm          =3D bdrv_default_perms,
     .bdrv_co_block_status     =3D parallels_co_block_status,
     .bdrv_has_zero_init       =3D bdrv_has_zero_init_1,
diff --git a/block/qcow.c b/block/qcow.c
index f8919a44d1..f3327dbcae 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -1178,11 +1178,11 @@ static const char *const qcow_strong_runtime_opts[] =
=3D {
 };
=20
 static BlockDriver bdrv_qcow =3D {
-    .format_name	=3D "qcow",
-    .instance_size	=3D sizeof(BDRVQcowState),
-    .bdrv_probe		=3D qcow_probe,
-    .bdrv_open		=3D qcow_open,
-    .bdrv_close		=3D qcow_close,
+    .format_name    =3D "qcow",
+    .instance_size  =3D sizeof(BDRVQcowState),
+    .bdrv_probe     =3D qcow_probe,
+    .bdrv_open      =3D qcow_open,
+    .bdrv_close     =3D qcow_close,
     .bdrv_child_perm        =3D bdrv_default_perms,
     .bdrv_reopen_prepare    =3D qcow_reopen_prepare,
     .bdrv_co_create         =3D qcow_co_create,
diff --git a/include/block/nbd.h b/include/block/nbd.h
index 78d101b774..4a39955ee3 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -223,7 +223,7 @@ enum {
     NBD_CMD_BLOCK_STATUS =3D 7,
 };
=20
-#define NBD_DEFAULT_PORT	10809
+#define NBD_DEFAULT_PORT    10809
=20
 /* Maximum size of a single READ/WRITE data buffer */
 #define NBD_MAX_BUFFER_SIZE (32 * 1024 * 1024)
--=20
2.32.0

