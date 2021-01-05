Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26462EA354
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 03:25:40 +0100 (CET)
Received: from localhost ([::1]:40386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwc2V-0005Q0-Ll
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 21:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwbyE-0000nF-VL; Mon, 04 Jan 2021 21:21:15 -0500
Received: from mail-pl1-f176.google.com ([209.85.214.176]:41862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwby9-0001y8-P3; Mon, 04 Jan 2021 21:21:12 -0500
Received: by mail-pl1-f176.google.com with SMTP id y8so15548274plp.8;
 Mon, 04 Jan 2021 18:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcmmNnx5sKD4ruzOX0lhQ8usYfBuywgyniQ6FiHnrzc=;
 b=Qf6TwTToEYp5gbe92hJIkfNRohBifV31aJsTQpZSNgnOytHSSFKCnIIGU2qIo/mlEd
 7aSmqCD1hfzIv16tTDCSo8vfYKuISVmWQMarM1OHF/izBC3KMQcljkSb3kzgERypkAlu
 PnJTC65XffxeTNp900mdJPLVnf+V33HJoHlibcpCAaSoUgxzmCOwz8RqINvLfMm2fhbk
 XQcQDPVf1QhrZVQC7TiILOQ5gVGF6jv7nE0jWW0sO5570sUqZ3A7zC9z6OIAB6WqPbOF
 dqyex+Fv/+wVxjw1+Mhc1Y7vD0N7AVATV0mcunwdt9BgPYRBZVgAuuNcXiOujIzY1rLD
 Kokg==
X-Gm-Message-State: AOAM532wd9XBTECng8gm1UOfX0uJ6o4Y+23FJGadWOzxxiucSsLC223t
 RoBufGWyVp9+fCEZRjAlwXOd/xgV9xY=
X-Google-Smtp-Source: ABdhPJxkn5IKv4acLiZpwlAb3lC0q+C3d4W4sGRPLxkZj4U8zRjDga21smMWilhRIZu6C55zE6bgVQ==
X-Received: by 2002:a17:90a:4a4:: with SMTP id
 g33mr1738308pjg.221.1609813262071; 
 Mon, 04 Jan 2021 18:21:02 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.186])
 by smtp.gmail.com with ESMTPSA id y27sm57674386pfr.78.2021.01.04.18.21.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jan 2021 18:21:01 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/7] qemu: add support for iOS host
Date: Mon,  4 Jan 2021 18:20:51 -0800
Message-Id: <20210105022055.12113-4-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210105022055.12113-1-j@getutm.app>
References: <20210105022055.12113-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.176;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Max Reitz <mreitz@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Joelle van Dyne <j@getutm.app>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces support for building for iOS hosts. When the correct Xcode
toolchain is used, iOS host will be detected automatically.

* block: disable features not supported by iOS sandbox
* slirp: disable SMB features for iOS
* osdep: disable system() calls for iOS

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 docs/devel/index.rst    |  1 +
 docs/devel/ios.rst      | 28 +++++++++++++++++++++++++++
 configure               | 43 ++++++++++++++++++++++++++++++++++++++++-
 meson.build             |  2 +-
 include/qemu/osdep.h    | 11 +++++++++++
 block.c                 |  2 +-
 block/file-posix.c      | 31 +++++++++++++++++------------
 net/slirp.c             | 16 +++++++--------
 qga/commands-posix.c    |  6 ++++++
 MAINTAINERS             |  7 +++++++
 tests/qtest/meson.build |  7 +++----
 11 files changed, 127 insertions(+), 27 deletions(-)
 create mode 100644 docs/devel/ios.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index f10ed77e4c..2cc8a13ebe 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -35,3 +35,4 @@ Contents:
    clocks
    qom
    block-coroutine-wrapper
+   ios
diff --git a/docs/devel/ios.rst b/docs/devel/ios.rst
new file mode 100644
index 0000000000..b4ab11bec1
--- /dev/null
+++ b/docs/devel/ios.rst
@@ -0,0 +1,28 @@
+===========
+iOS Support
+===========
+
+To run qemu on the iOS platform, some modifications were required. Most of the
+modifications are conditioned on the ``CONFIG_IOS`` and configuration variable.
+
+Build support
+-------------
+
+For the code to compile, certain changes in the block driver and the slirp
+driver had to be made. There is no ``system()`` call, so it has been replaced
+with an assertion error. There should be no code path that call system() from
+iOS.
+
+``ucontext`` support is broken on iOS. The implementation from ``libucontext``
+is used instead.
+
+JIT support
+-----------
+
+On iOS, allocating RWX pages require special entitlements not usually granted to
+apps. However, it is possible to use `bulletproof JIT`_ with a development
+certificate. This means that we need to allocate one chunk of memory with RX
+permissions and then mirror map the same memory with RW permissions. We generate
+code to the mirror mapping and execute the original mapping.
+
+.. _bulletproof JIT: https://www.blackhat.com/docs/us-16/materials/us-16-Krstic.pdf
diff --git a/configure b/configure
index 744d1990be..c1a08f0171 100755
--- a/configure
+++ b/configure
@@ -560,6 +560,19 @@ EOF
   compile_object
 }
 
+check_ios() {
+  cat > $TMPC <<EOF
+#ifdef __APPLE__
+#import "TargetConditionals.h"
+#if !TARGET_OS_IPHONE
+#error TARGET_OS_IPHONE not true
+#endif
+#endif
+int main(void) { return 0; }
+EOF
+  compile_object
+}
+
 check_include() {
 cat > $TMPC <<EOF
 #include <$1>
@@ -602,7 +615,11 @@ elif check_define __DragonFly__ ; then
 elif check_define __NetBSD__; then
   targetos='NetBSD'
 elif check_define __APPLE__; then
-  targetos='Darwin'
+  if check_ios ; then
+    targetos='iOS'
+  else
+    targetos='Darwin'
+  fi
 else
   # This is a fatal error, but don't report it yet, because we
   # might be going to just print the --help text, or it might
@@ -779,6 +796,22 @@ Darwin)
   # won't work when we're compiling with gcc as a C compiler.
   QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
 ;;
+iOS)
+  bsd="yes"
+  darwin="yes"
+  ios="yes"
+  if [ "$cpu" = "x86_64" ] ; then
+    QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
+    QEMU_LDFLAGS="-arch x86_64 $QEMU_LDFLAGS"
+  fi
+  host_block_device_support="no"
+  audio_drv_list=""
+  audio_possible_drivers=""
+  QEMU_LDFLAGS="-framework CoreFoundation $QEMU_LDFLAGS"
+  # Disable attempts to use ObjectiveC features in os/object.h since they
+  # won't work when we're compiling with gcc as a C compiler.
+  QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
+;;
 SunOS)
   solaris="yes"
   make="${MAKE-gmake}"
@@ -5992,6 +6025,10 @@ if test "$darwin" = "yes" ; then
   echo "CONFIG_DARWIN=y" >> $config_host_mak
 fi
 
+if test "$ios" = "yes" ; then
+  echo "CONFIG_IOS=y" >> $config_host_mak
+fi
+
 if test "$solaris" = "yes" ; then
   echo "CONFIG_SOLARIS=y" >> $config_host_mak
 fi
@@ -6956,6 +6993,7 @@ echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
 echo "[binaries]" >> $cross
 echo "c = [$(meson_quote $cc)]" >> $cross
 test -n "$cxx" && echo "cpp = [$(meson_quote $cxx)]" >> $cross
+test -n "$objcc" && echo "objc = [$(meson_quote $objcc)]" >> $cross
 echo "ar = [$(meson_quote $ar)]" >> $cross
 echo "nm = [$(meson_quote $nm)]" >> $cross
 echo "pkgconfig = [$(meson_quote $pkg_config_exe)]" >> $cross
@@ -6974,6 +7012,9 @@ if test "$cross_compile" = "yes"; then
     if test "$linux" = "yes" ; then
         echo "system = 'linux'" >> $cross
     fi
+    if test "$darwin" = "yes" ; then
+        echo "system = 'darwin'" >> $cross
+    fi
     case "$ARCH" in
         i386|x86_64)
             echo "cpu_family = 'x86'" >> $cross
diff --git a/meson.build b/meson.build
index 9a640d3407..ee333b7a94 100644
--- a/meson.build
+++ b/meson.build
@@ -181,7 +181,7 @@ if targetos == 'windows'
                                       include_directories: include_directories('.'))
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
-  iokit = dependency('appleframeworks', modules: 'IOKit')
+  iokit = dependency('appleframeworks', modules: 'IOKit', required: 'CONFIG_IOS' not in config_host)
   cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
 elif targetos == 'sunos'
   socket = [cc.find_library('socket'),
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f9ec8c84e9..eb8d06cbf5 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -686,4 +686,15 @@ char *qemu_get_host_name(Error **errp);
  */
 size_t qemu_get_host_physmem(void);
 
+/**
+ * iOS does not support system() so we replace it with an assertion failure.
+ */
+#ifdef CONFIG_IOS
+#define system ios_does_not_support_system
+static inline int ios_does_not_support_system(const char *command)
+{
+    assert(0);
+}
+#endif /* CONFIG_IOS */
+
 #endif
diff --git a/block.c b/block.c
index 8f177504d4..984a73a82c 100644
--- a/block.c
+++ b/block.c
@@ -54,7 +54,7 @@
 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
 #include <sys/queue.h>
-#ifndef __DragonFly__
+#if !defined(__DragonFly__) && !defined(CONFIG_IOS)
 #include <sys/disk.h>
 #endif
 #endif
diff --git a/block/file-posix.c b/block/file-posix.c
index c34bb9fac1..9f556322e6 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -181,7 +181,17 @@ typedef struct BDRVRawReopenState {
     bool check_cache_dropped;
 } BDRVRawReopenState;
 
-static int fd_open(BlockDriverState *bs);
+static int fd_open(BlockDriverState *bs)
+{
+    BDRVRawState *s = bs->opaque;
+
+    /* this is just to ensure s->fd is sane (its called by io ops) */
+    if (s->fd >= 0) {
+        return 0;
+    }
+    return -EIO;
+}
+
 static int64_t raw_getlength(BlockDriverState *bs);
 
 typedef struct RawPosixAIOData {
@@ -252,6 +262,12 @@ static int raw_normalize_devicepath(const char **filename, Error **errp)
 }
 #endif
 
+#if defined(CONFIG_IOS)
+static int probe_logical_blocksize(int fd, unsigned int *sector_size_p)
+{
+    return -ENOTSUP; /* not supported on iOS */
+}
+#else /* CONFIG_IOS */
 /*
  * Get logical block size via ioctl. On success store it in @sector_size_p.
  */
@@ -284,6 +300,7 @@ static int probe_logical_blocksize(int fd, unsigned int *sector_size_p)
 
     return success ? 0 : -errno;
 }
+#endif /* !CONFIG_IOS */
 
 /**
  * Get physical block size of @fd.
@@ -2307,7 +2324,7 @@ again:
         }
         if (size == 0)
 #endif
-#if defined(__APPLE__) && defined(__MACH__)
+#if !defined(CONFIG_IOS) && defined(__APPLE__) && defined(__MACH__)
         {
             uint64_t sectors = 0;
             uint32_t sector_size = 0;
@@ -3543,16 +3560,6 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
 }
 #endif /* linux */
 
-static int fd_open(BlockDriverState *bs)
-{
-    BDRVRawState *s = bs->opaque;
-
-    /* this is just to ensure s->fd is sane (its called by io ops) */
-    if (s->fd >= 0)
-        return 0;
-    return -EIO;
-}
-
 static coroutine_fn int
 hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
 {
diff --git a/net/slirp.c b/net/slirp.c
index 77042e6df7..8413042c09 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -27,7 +27,7 @@
 #include "net/slirp.h"
 
 
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(CONFIG_IOS)
 #include <pwd.h>
 #include <sys/wait.h>
 #endif
@@ -90,7 +90,7 @@ typedef struct SlirpState {
     Slirp *slirp;
     Notifier poll_notifier;
     Notifier exit_notifier;
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(CONFIG_IOS)
     gchar *smb_dir;
 #endif
     GSList *fwd;
@@ -103,7 +103,7 @@ static QTAILQ_HEAD(, SlirpState) slirp_stacks =
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp);
 static int slirp_guestfwd(SlirpState *s, const char *config_str, Error **errp);
 
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(CONFIG_IOS)
 static int slirp_smb(SlirpState *s, const char *exported_dir,
                      struct in_addr vserver_addr, Error **errp);
 static void slirp_smb_cleanup(SlirpState *s);
@@ -368,7 +368,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
     struct in6_addr ip6_prefix;
     struct in6_addr ip6_host;
     struct in6_addr ip6_dns;
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(CONFIG_IOS)
     struct in_addr smbsrv = { .s_addr = 0 };
 #endif
     NetClientState *nc;
@@ -478,7 +478,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         return -1;
     }
 
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(CONFIG_IOS)
     if (vsmbserver && !inet_aton(vsmbserver, &smbsrv)) {
         error_setg(errp, "Failed to parse SMB address");
         return -1;
@@ -593,7 +593,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
             }
         }
     }
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(CONFIG_IOS)
     if (smb_export) {
         if (slirp_smb(s, smb_export, smbsrv, errp) < 0) {
             goto error;
@@ -785,7 +785,7 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
 
 }
 
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(CONFIG_IOS)
 
 /* automatic user mode samba server configuration */
 static void slirp_smb_cleanup(SlirpState *s)
@@ -900,7 +900,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
     return 0;
 }
 
-#endif /* !defined(_WIN32) */
+#endif /* !defined(_WIN32) && !defined(CONFIG_IOS) */
 
 static int guestfwd_can_read(void *opaque)
 {
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c089e38120..81e40ac14a 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -34,6 +34,12 @@
 
 #ifndef CONFIG_HAS_ENVIRON
 #ifdef __APPLE__
+#include "TargetConditionals.h"
+#if !TARGET_OS_IPHONE && !TARGET_IPHONE_SIMULATOR
+#define APPLE_USE_CRT_EXTERNS
+#endif
+#endif
+#ifdef APPLE_USE_CRT_EXTERNS
 #include <crt_externs.h>
 #define environ (*_NSGetEnviron())
 #else
diff --git a/MAINTAINERS b/MAINTAINERS
index ce5ef9bde6..3baf289a1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -538,6 +538,13 @@ F: include/*/*win32*
 X: qga/*win32*
 F: qemu.nsi
 
+IOS
+M: Joelle van Dyne <j@getutm.app>
+S: Maintained
+K: ^Subject:.*(?i)iOS
+F: docs/devel/ios.rst
+F: include/tcg/tcg-apple-jit.h
+
 Alpha Machines
 --------------
 M: Richard Henderson <richard.henderson@linaro.org>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6a67c538be..42b46a7ca4 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -46,12 +46,11 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
+  (not config_host.has_key('CONFIG_IOS') ? ['bios-tables-test', 'hd-geo-test'] : []) +      \
   qtests_pci +                                                                              \
   ['fdc-test',
    'ide-test',
-   'hd-geo-test',
    'boot-order-test',
-   'bios-tables-test',
    'rtc-test',
    'i440fx-test',
    'fuzz-test',
@@ -148,9 +147,9 @@ qtests_arm = \
    'boot-serial-test',
    'hexloader-test']
 
-# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
+# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional (except on iOS)
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
+  (cpu != 'arm' and not config_host.has_key('CONFIG_IOS') ? ['bios-tables-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
-- 
2.28.0


