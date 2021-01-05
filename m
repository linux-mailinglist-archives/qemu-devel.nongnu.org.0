Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DAC2EA349
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 03:23:36 +0100 (CET)
Received: from localhost ([::1]:32960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwc0W-0002SR-0C
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 21:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwbyA-0000ms-IW; Mon, 04 Jan 2021 21:21:10 -0500
Received: from mail-pl1-f170.google.com ([209.85.214.170]:42737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwby5-0001xE-7T; Mon, 04 Jan 2021 21:21:10 -0500
Received: by mail-pl1-f170.google.com with SMTP id s15so15553034plr.9;
 Mon, 04 Jan 2021 18:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/1FD2pLv5EtovTqe0eqpd1vRpl3eMJUhyhI+mD8p7/s=;
 b=SH2tkkrur/ue4gey37QjbVOoGaR6KWzp0aF+M3e2Qy2RBKzHdFgzw6/qUJVup36awF
 QBz+BBv0M+DbShYnnl0iO3l5RQp1zLRDoDnM0AGi+EccTKUJ/GR0qzTJNZpOZkwS8bOG
 8RTA+LXqQ8F5zLuHb+oiLkIcyfMG1UL/WT6MfaODheB2JgJzmImdIp/H7rrV9moveXxQ
 Y2nekbfmvdjArRZ81xeGNUxEEbq7wV+vT/QF+wKeqQYY3j0LflU4lnAdyAgWcd6NL1/x
 rURq/ieziin58/nMZK6/k6PbB1d6/NZ4cM3JYKLLQZT1tUUllBOPeZapwxukQ57dIoYa
 feBQ==
X-Gm-Message-State: AOAM5322v3/N0e1sqO/ABDw9qourRqSuTY6R/XOaGlTbVyiJ2+g4j7+c
 Op6a+9yWvH9jwxpk95Nl4glGZSWPR88=
X-Google-Smtp-Source: ABdhPJygdr43FmrqZ9LuhDD9JWfAuKVt9mcYaklRUfNkfo8vgP4yCT3agLLNJAv9Yh2/gAbjF8noRA==
X-Received: by 2002:a17:90b:24c:: with SMTP id
 fz12mr1824242pjb.138.1609813259341; 
 Mon, 04 Jan 2021 18:20:59 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.186])
 by smtp.gmail.com with ESMTPSA id y27sm57674386pfr.78.2021.01.04.18.20.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jan 2021 18:20:59 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/7] configure: option to disable host block devices
Date: Mon,  4 Jan 2021 18:20:49 -0800
Message-Id: <20210105022055.12113-2-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210105022055.12113-1-j@getutm.app>
References: <20210105022055.12113-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.170;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f170.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:raw" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some hosts (iOS) have a sandboxed filesystem and do not provide low-level
APIs for interfacing with host block devices.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure            |  4 ++++
 meson.build          |  1 +
 qapi/block-core.json | 10 +++++++---
 block/file-posix.c   | 10 +++++++++-
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 3f823ed163..7cd2ee0b9c 100755
--- a/configure
+++ b/configure
@@ -451,6 +451,7 @@ skip_meson=no
 gettext=""
 fuse="auto"
 fuse_lseek="auto"
+host_block_device_support="yes"
 
 bogus_os="no"
 malloc_trim="auto"
@@ -5937,6 +5938,9 @@ if test "$default_devices" = "yes" ; then
 else
   echo "CONFIG_MINIKCONF_MODE=--allnoconfig" >> $config_host_mak
 fi
+if test "$host_block_device_support" = "yes" ; then
+  echo "CONFIG_HOST_BLOCK_DEVICE=y" >> $config_host_mak
+fi
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index f344b25955..9a640d3407 100644
--- a/meson.build
+++ b/meson.build
@@ -2219,6 +2219,7 @@ summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
 summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
 summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
 summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
+summary_info += {'host block dev support': config_host.has_key('CONFIG_HOST_BLOCK_DEVICE')}
 summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 04c5196e59..516b823461 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -959,7 +959,8 @@
   'discriminator': 'driver',
   'data': {
       'file': 'BlockStatsSpecificFile',
-      'host_device': 'BlockStatsSpecificFile',
+      'host_device': { 'type': 'BlockStatsSpecificFile',
+                       'if': 'defined(CONFIG_HOST_BLOCK_DEVICE)' },
       'nvme': 'BlockStatsSpecificNvme' } }
 
 ##
@@ -2827,7 +2828,9 @@
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
             'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
-            'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
+            'gluster', 'host_cdrom',
+            {'name': 'host_device', 'if': 'defined(CONFIG_HOST_BLOCK_DEVICE)' },
+            'http', 'https', 'iscsi',
             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
             'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
@@ -3995,7 +3998,8 @@
       'ftps':       'BlockdevOptionsCurlFtps',
       'gluster':    'BlockdevOptionsGluster',
       'host_cdrom': 'BlockdevOptionsFile',
-      'host_device':'BlockdevOptionsFile',
+      'host_device': { 'type': 'BlockdevOptionsFile',
+                       'if': 'defined(CONFIG_HOST_BLOCK_DEVICE)' },
       'http':       'BlockdevOptionsCurlHttp',
       'https':      'BlockdevOptionsCurlHttps',
       'iscsi':      'BlockdevOptionsIscsi',
diff --git a/block/file-posix.c b/block/file-posix.c
index 83e2cc5530..c34bb9fac1 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -41,7 +41,7 @@
 #include "scsi/pr-manager.h"
 #include "scsi/constants.h"
 
-#if defined(__APPLE__) && (__MACH__)
+#if defined(CONFIG_HOST_BLOCK_DEVICE) && defined(__APPLE__) && (__MACH__)
 #include <paths.h>
 #include <sys/param.h>
 #include <IOKit/IOKitLib.h>
@@ -3014,6 +3014,7 @@ static BlockStatsSpecific *raw_get_specific_stats(BlockDriverState *bs)
     return stats;
 }
 
+#if defined(CONFIG_HOST_BLOCK_DEVICE)
 static BlockStatsSpecific *hdev_get_specific_stats(BlockDriverState *bs)
 {
     BlockStatsSpecific *stats = g_new(BlockStatsSpecific, 1);
@@ -3023,6 +3024,7 @@ static BlockStatsSpecific *hdev_get_specific_stats(BlockDriverState *bs)
 
     return stats;
 }
+#endif /* CONFIG_HOST_BLOCK_DEVICE */
 
 static QemuOptsList raw_create_opts = {
     .name = "raw-create-opts",
@@ -3247,6 +3249,8 @@ BlockDriver bdrv_file = {
 /***********************************************/
 /* host device */
 
+#if defined(CONFIG_HOST_BLOCK_DEVICE)
+
 #if defined(__APPLE__) && defined(__MACH__)
 static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
                                 CFIndex maxPathSize, int flags);
@@ -3872,6 +3876,8 @@ static BlockDriver bdrv_host_cdrom = {
 };
 #endif /* __FreeBSD__ */
 
+#endif /* CONFIG_HOST_BLOCK_DEVICE */
+
 static void bdrv_file_init(void)
 {
     /*
@@ -3879,6 +3885,7 @@ static void bdrv_file_init(void)
      * registered last will get probed first.
      */
     bdrv_register(&bdrv_file);
+#if defined(CONFIG_HOST_BLOCK_DEVICE)
     bdrv_register(&bdrv_host_device);
 #ifdef __linux__
     bdrv_register(&bdrv_host_cdrom);
@@ -3886,6 +3893,7 @@ static void bdrv_file_init(void)
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
     bdrv_register(&bdrv_host_cdrom);
 #endif
+#endif /* CONFIG_HOST_BLOCK_DEVICE */
 }
 
 block_init(bdrv_file_init);
-- 
2.28.0


