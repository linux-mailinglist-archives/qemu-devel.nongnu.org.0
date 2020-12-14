Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01142D9C20
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:14:35 +0100 (CET)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqUc-0003el-57
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEi-00082x-1D; Mon, 14 Dec 2020 10:58:08 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:50349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEW-0001Rn-V4; Mon, 14 Dec 2020 10:58:07 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M593i-1knkIu0Pm0-001Cx9; Mon, 14 Dec 2020 16:57:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/19] configure / meson: Move check for linux/btrfs.h to
 meson.build
Date: Mon, 14 Dec 2020 16:57:33 +0100
Message-Id: <20201214155733.207430-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iEQmCI2+fISc9GXEd0HEBd89pHFZqS7MeKajSfTqu9fnjfJpm8k
 oaE1SaXUSrFNLa8RHOPGEchUEPATFtCU0ioytqo8dFtIvMjmK+eYN1sEt5i6vkuaXPb4Syl
 JuSAsaNfihrbqohGdsY7U2J6Gp63AN5YJzj33URHurfp9j6YoyAGiNFaOjMOAFgOFXWaqv/
 Z8pjy6qXr3qLos219z3Og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JpqlyPvt3z0=:azeyHQ+Lk5DqgyKh8UOlja
 IV0jOepBjj5efbMm3TxlP2G5hqr1hHdLhfnOviqLjxZnT/fJ6hmCvMXg3XaeHZn0iCG711HYq
 oVvFUVqJS8ftgDYH3Y3CQIx4RbvBLpiO55cmRxWtreIkrMcPYDFnL2PRFFnWgSbirpE0JvNcO
 c38FEUMQWyJAkWuRoieZh2Dx58oezb84IdUsqs2yyS/pF2GXlz1SzCz0uuMCdHZ6Aj1B6tvL3
 74IcO/8lqPj9KfGfCbE9jyPfyTZqd6E4rM3ZEO2BxmWhlAkJkYvcy71pQo2LzLo9zY5wF1W8G
 0MgUxlnrwviJ9Y6Lgzr7W/8A7+VgUz5T50Z0c38F2FhUegyn2jT6IotEfNlRReSiAimGz0eRV
 0KmchArxSABbqCT5cHg/JY9fl1f2FOv6iA3LCwSDrY4+uci4yrsEDV1kta+7ECz8UzvfL9Bad
 hwm9ULpbwg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

This check can be done in a much shorter way in meson.build. And while
we're at it, rename the #define to HAVE_BTRFS_H to match the other
HAVE_someheader_H symbols that we already have.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201118171052.308191-7-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure                 | 9 ---------
 linux-user/syscall.c      | 2 +-
 linux-user/syscall_defs.h | 2 +-
 meson.build               | 1 +
 4 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 6c13964b247a..cb21108d34c3 100755
--- a/configure
+++ b/configure
@@ -4402,12 +4402,6 @@ if compile_prog "" "" ; then
   syncfs=yes
 fi
 
-# check for btrfs filesystem support (kernel must be 3.9+)
-btrfs=no
-if check_include linux/btrfs.h ; then
-    btrfs=yes
-fi
-
 # Search for bswap_32 function
 byteswap_h=no
 cat > $TMPC << EOF
@@ -6106,9 +6100,6 @@ fi
 if test "$syncfs" = "yes" ; then
   echo "CONFIG_SYNCFS=y" >> $config_host_mak
 fi
-if test "$btrfs" = "yes" ; then
-  echo "CONFIG_BTRFS=y" >> $config_host_mak
-fi
 if test "$inotify" = "yes" ; then
   echo "CONFIG_INOTIFY=y" >> $config_host_mak
 fi
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 063130be048c..7bf99beb1814 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -112,7 +112,7 @@
 #include <linux/if_alg.h>
 #include <linux/rtc.h>
 #include <sound/asound.h>
-#ifdef CONFIG_BTRFS
+#ifdef HAVE_BTRFS_H
 #include <linux/btrfs.h>
 #endif
 #ifdef HAVE_DRM_H
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index cabbfb762dd9..b934d0b60676 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1006,7 +1006,7 @@ struct target_rtc_pll_info {
 #define TARGET_FS_IOC32_SETVERSION TARGET_IOW('v', 2, int)
 
 /* btrfs ioctls */
-#ifdef CONFIG_BTRFS
+#ifdef HAVE_BTRFS_H
 #define TARGET_BTRFS_IOC_SNAP_CREATE            TARGET_IOWU(BTRFS_IOCTL_MAGIC, 1)
 #define TARGET_BTRFS_IOC_SCAN_DEV               TARGET_IOWU(BTRFS_IOCTL_MAGIC, 4)
 #define TARGET_BTRFS_IOC_FORGET_DEV             TARGET_IOWU(BTRFS_IOCTL_MAGIC, 5)
diff --git a/meson.build b/meson.build
index 04cdea75dd50..fba6413056a3 100644
--- a/meson.build
+++ b/meson.build
@@ -836,6 +836,7 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
+config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
-- 
2.29.2


