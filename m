Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880C20A74E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 23:17:58 +0200 (CEST)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joZFt-0006PK-Ia
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 17:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1joZE9-00056Z-Fx; Thu, 25 Jun 2020 17:16:09 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:38223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1joZE7-0000Pz-IA; Thu, 25 Jun 2020 17:16:09 -0400
Received: by mail-ej1-x644.google.com with SMTP id w16so7366737ejj.5;
 Thu, 25 Jun 2020 14:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PGwvlMhQlyiU8D8zbHhsbWvAGjd7KedoFdvGmMz3WK8=;
 b=sQavn8WSHSXXbCg6zrFGe9HqZExsdthc6Korf7ediogwCntmGGwGeaJE1r0G4gv8vV
 e8W3PC0T7MYLgBaRy6S4GsHWVmfLwx/Fj8NiwliKh0D4VRsn6Xnk1L3hG8QSI2ez5uKF
 Z/wLanDnpj83pxSBk8PC7cijVRaDwX34+yeWnjiutAYHF1wYGMc4wR027UEIU6kPuxCW
 QIhUBSh5lHeE+7ihnZTADwNrBfDfJnnRjfCvEW4SttW1BD9RAQUT0NO5XZTtEGW2Ezz3
 7tY95e5Y1re5yd+bwdzBVxuyuTT8Cc7dxaAbqYvEeeJvxrAermKzp1HXZw9yYO2bONkN
 HHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PGwvlMhQlyiU8D8zbHhsbWvAGjd7KedoFdvGmMz3WK8=;
 b=YDXWJh87UTFSh4wLPkRRtKLtPpuarSU4peGhOg/VkXVF0mkYIIjssKjZuT4Xmud3hw
 a3+XlxQaiht6RpA6wwcB1ciEeui5YEfsD6RVInwguVib+6Psi9ddv8CzuMW4fFq/lcLC
 FULBFTSZ+9kmS5MEAwoQVbHIIjJ6WEyCkNx9Hdg+/3+7XqLJLm3muzogZwm9aZbl3pQn
 u1EIv6qKAANEY3xx6EA4+FXcdj6q4M1rJEG5ctpNNVfdPI36RJ4B6epE35Rm7F9lcGiM
 3e84EQijy6hHCse/zs67mmsBlF77sM8Ovzg4T8bDH5Ig6KtFgZ5UGr3WH0N9s5fxY9Uk
 XVcg==
X-Gm-Message-State: AOAM530AljEp1rBMIfIRwluHgPox6CcVkldFGsqI2p6DUVrBNUanXVhK
 j6YzuB6748/5EdG4u+C3ZnRtYQkJgHQ6/1JtTzdD1zBFanE=
X-Google-Smtp-Source: ABdhPJzTnmxl/MFTonCTTzeyMyfScl3DL2LTfUEcOs6jd7FG0Bh5QzwDDh6tKwt/gr3yjFavthXOiEcp3fE4nkWQOfw=
X-Received: by 2002:a17:907:35c2:: with SMTP id
 ap2mr29548096ejc.530.1593119765282; 
 Thu, 25 Jun 2020 14:16:05 -0700 (PDT)
MIME-Version: 1.0
From: David CARLIER <devnexen@gmail.com>
Date: Thu, 25 Jun 2020 22:15:54 +0100
Message-ID: <CA+XhMqy_bAnWm3cByobn+4LkVoAEZk3DU2=kWBcdB4m1b2Cd0g@mail.gmail.com>
Subject: [PATCH v2] build: Haiku build fix
To: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=devnexen@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From f249bb9dc67a5d96b55e8b7faef3887c39a6de2c Mon Sep 17 00:00:00 2001
From: David Carlier <devnexen@gmail.com>
Date: Thu, 25 Jun 2020 19:32:42 +0000
Subject: [PATCH] build: haiku system build fix

Most of missing features resides in the bsd library.
Also defining constant equivalence.

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 configure            | 34 ++++++++++++++++++++++++++++++++--
 include/qemu/bswap.h |  2 ++
 include/qemu/osdep.h |  4 ++++
 os-posix.c           |  4 ++++
 util/Makefile.objs   |  2 +-
 util/compatfd.c      |  2 ++
 util/main-loop.c     |  1 +
 util/oslib-posix.c   | 20 ++++++++++++++++++++
 util/qemu-openpty.c  |  2 +-
 9 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index ba88fd1824..43baeadf31 100755
--- a/configure
+++ b/configure
@@ -901,8 +901,8 @@ SunOS)
 ;;
 Haiku)
   haiku="yes"
-  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS $QEMU_CFLAGS"
-  LIBS="-lposix_error_mapper -lnetwork $LIBS"
+  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
+  LIBS="-lposix_error_mapper -lnetwork -lbsd $LIBS"
 ;;
 Linux)
   audio_drv_list="try-pa oss"
@@ -2373,6 +2373,30 @@ else
   l2tpv3=no
 fi

+cat > $TMPC <<EOF
+#include <pty.h>
+int main(int argc, char *argv[]) {
+    return 0;
+}
+EOF
+if compile_prog "" "" ; then
+  pty_h=yes
+else
+  pty_h=no
+fi
+
+cat > $TMPC <<EOF
+#include <sys/mman.h>
+int main(int argc, char *argv[]) {
+    return mlockall(MCL_FUTURE);
+}
+EOF
+if compile_prog "" "" ; then
+  have_mlockall=yes
+else
+  have_mlockall=no
+fi
+
 #########################################
 # vhost interdependencies and host support

@@ -7758,6 +7782,12 @@ fi
 if test "$sheepdog" = "yes" ; then
   echo "CONFIG_SHEEPDOG=y" >> $config_host_mak
 fi
+if test "$pty_h" = "yes" ; then
+  echo "CONFIG_PTY=y" >> $config_host_mak
+fi
+if test "$have_mlockall" = "yes" ; then
+  echo "CONFIG_MLOCKALL=y" >> $config_host_mak
+fi
 if test "$fuzzing" = "yes" ; then
   if test "$have_fuzzer" = "yes"; then
     FUZZ_LDFLAGS=" -fsanitize=address,fuzzer"
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 2a9f3fe783..1d3e4c24e4 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -8,6 +8,8 @@
 # include <machine/bswap.h>
 #elif defined(__FreeBSD__)
 # include <sys/endian.h>
+#elif defined(__HAIKU__)
+# include <endian.h>
 #elif defined(CONFIG_BYTESWAP_H)
 # include <byteswap.h>

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ff7c17b857..da970cf654 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -388,6 +388,10 @@ void qemu_anon_ram_free(void *ptr, size_t size);
 #define HAVE_CHARDEV_PARPORT 1
 #endif

+#if defined(__HAIKU__)
+#define SIGIO SIGPOLL
+#endif
+
 #if defined(CONFIG_LINUX)
 #ifndef BUS_MCEERR_AR
 #define BUS_MCEERR_AR 4
diff --git a/os-posix.c b/os-posix.c
index 3cd52e1e70..c95468c218 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -337,6 +337,7 @@ bool is_daemonized(void)

 int os_mlock(void)
 {
+#if defined(CONFIG_MLOCKALL)
     int ret = 0;

     ret = mlockall(MCL_CURRENT | MCL_FUTURE);
@@ -345,4 +346,7 @@ int os_mlock(void)
     }

     return ret;
+#else
+    return ENOSYS;
+#endif
 }
diff --git a/util/Makefile.objs b/util/Makefile.objs
index cc5e37177a..faebc13fac 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -39,7 +39,7 @@ util-obj-y += qsp.o
 util-obj-y += range.o
 util-obj-y += stats64.o
 util-obj-y += systemd.o
-util-obj-$(CONFIG_POSIX) += drm.o
+util-obj-$(CONFIG_LINUX) += drm.o
 util-obj-y += guest-random.o
 util-obj-$(CONFIG_GIO) += dbus.o
 dbus.o-cflags = $(GIO_CFLAGS)
diff --git a/util/compatfd.c b/util/compatfd.c
index c296f55d14..ee47dd8089 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -16,7 +16,9 @@
 #include "qemu/osdep.h"
 #include "qemu/thread.h"

+#if defined(CONFIG_SIGNALFD)
 #include <sys/syscall.h>
+#endif

 struct sigfd_compat_info
 {
diff --git a/util/main-loop.c b/util/main-loop.c
index eda63fe4e0..43a4bd30c1 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -85,6 +85,7 @@ static int qemu_signal_init(Error **errp)
      * by sigwait() in the signal thread. Otherwise, the cpu thread will
      * not catch it reliably.
      */
+
     sigemptyset(&set);
     sigaddset(&set, SIG_IPI);
     sigaddset(&set, SIGIO);
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 39ddc77c85..fdb5907a31 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -38,7 +38,12 @@
 #include "qemu/sockets.h"
 #include "qemu/thread.h"
 #include <libgen.h>
+#if !defined(__HAIKU__)
 #include <sys/signal.h>
+#else
+#include <kernel/image.h>
+#include <signal.h>
+#endif
 #include "qemu/cutils.h"

 #ifdef CONFIG_LINUX
@@ -390,6 +395,21 @@ void qemu_init_exec_dir(const char *argv0)
             }
         }
     }
+#elif defined(__HAIKU__)
+    {
+        image_info ii;
+        int32_t c = 0;
+
+        *buf = '\0';
+        while (get_next_image_info(0, &c, &ii) == B_OK) {
+            if (ii.type == B_APP_IMAGE) {
+                strncpy(buf, ii.name, sizeof(buf));
+                buf[sizeof(buf) - 1] = '\0';
+                p = buf;
+                break;
+            }
+        }
+    }
 #endif
     /* If we don't have any way of figuring out the actual executable
        location then try argv[0].  */
diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
index 2e8b43bdf5..9d8ad6905e 100644
--- a/util/qemu-openpty.c
+++ b/util/qemu-openpty.c
@@ -35,7 +35,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"

-#if defined(__GLIBC__)
+#if defined CONFIG_PTY
 # include <pty.h>
 #elif defined CONFIG_BSD
 # include <termios.h>
-- 
2.26.0

