Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19D52D9C0D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:12:36 +0100 (CET)
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqSh-000118-RE
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEh-00081e-Mk; Mon, 14 Dec 2020 10:58:07 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:55563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEW-0001Rb-PM; Mon, 14 Dec 2020 10:58:06 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mf0FY-1kClNt242U-00gcJ3; Mon, 14 Dec 2020 16:57:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 18/19] configure / meson: Move check for sys/kcov.h to
 meson.build
Date: Mon, 14 Dec 2020 16:57:32 +0100
Message-Id: <20201214155733.207430-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rbZW9XEaQF337JySb+YlzD5UFIau91D1uHkkIDObCdul3PdZt6t
 zyJaJ1gzo/TqRtCxrfsz9BvoZx770kD938mNsoW0dpXaUIVul84Q93qRekbu+9fee94iJNP
 zL3mSykFOhrOlHicvdsRD3zVM7aKmTkZ1c+SpAXZyyh+C4/1QNT2E/RA8Zn5lIlXySdSADA
 Q13itQEQAMUBM1wuL8V5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2OvbeYpJ04Y=:E3g03z0xBf3bEd6zaVaZkb
 hcWcjenxCOKK7y2gOqrwLkUz90bGcBRyRl9iHhKJE3yuoyEDbqkZ2L01M/ZZEJCg5yx3jNdLQ
 nX2xtx0VWkPvbG2BKaNsXJz3XdNBSKdosJWOmH3bmDTB30fu62cFj5wOmssSHlCtCgTC6Ojq8
 O53mqD3IeFDm4Gm2OONxd1ga5rVhgG8PFfJwnEhZungGu1fLQhOZwU8cmhkp5vmgkfNw+zPgF
 AJIkVoJ2PFiX4yWNnxNHDQV3/FJjxTXfltvT5DFokq0nZPdV+I6vLe3RURb99jCBM1UoNxOtK
 AHtGCIWcBfT+L05VN/BWYdAF5JbuDOW0kX8xB3AWlkCC7VZgEv07rVCPTNJmBs11jQtsVY8gh
 1EqxyoudbHu9W8Klo/tuxQkyjMEjWgj+rG//WIpedf9Yu1T9CQJOmTWQxEwKgCjnauFKowTLj
 lv566iCrow==
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
we're at it, rename the #define to HAVE_SYS_KCOV_H to match the other
HAVE_someheader_H symbols that we already have.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201118171052.308191-6-thuth@redhat.com>
[lv: s/signal/kcov/]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure            | 9 ---------
 linux-user/ioctls.h  | 2 +-
 linux-user/syscall.c | 2 +-
 meson.build          | 1 +
 4 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 4f0f9c99d3d2..6c13964b247a 100755
--- a/configure
+++ b/configure
@@ -4402,12 +4402,6 @@ if compile_prog "" "" ; then
   syncfs=yes
 fi
 
-# check for kcov support (kernel must be 4.4+, compiled with certain options)
-kcov=no
-if check_include sys/kcov.h ; then
-    kcov=yes
-fi
-
 # check for btrfs filesystem support (kernel must be 3.9+)
 btrfs=no
 if check_include linux/btrfs.h ; then
@@ -6112,9 +6106,6 @@ fi
 if test "$syncfs" = "yes" ; then
   echo "CONFIG_SYNCFS=y" >> $config_host_mak
 fi
-if test "$kcov" = "yes" ; then
-  echo "CONFIG_KCOV=y" >> $config_host_mak
-fi
 if test "$btrfs" = "yes" ; then
   echo "CONFIG_BTRFS=y" >> $config_host_mak
 fi
diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 585874f090ff..8efb4d38c014 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -715,7 +715,7 @@
   IOCTL_IGNORE(TIOCSTOP)
 #endif
 
-#ifdef CONFIG_KCOV
+#ifdef HAVE_SYS_KCOV_H
   IOCTL(KCOV_ENABLE, 0, TYPE_NULL)
   IOCTL(KCOV_DISABLE, 0, TYPE_NULL)
   IOCTL(KCOV_INIT_TRACE, IOC_R, TYPE_ULONG)
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 27adee908ebc..063130be048c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -73,7 +73,7 @@
 #ifdef CONFIG_SENDFILE
 #include <sys/sendfile.h>
 #endif
-#ifdef CONFIG_KCOV
+#ifdef HAVE_SYS_KCOV_H
 #include <sys/kcov.h>
 #endif
 
diff --git a/meson.build b/meson.build
index a790cc527cf9..04cdea75dd50 100644
--- a/meson.build
+++ b/meson.build
@@ -839,6 +839,7 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
+config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
-- 
2.29.2


