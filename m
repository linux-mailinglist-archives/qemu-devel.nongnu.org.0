Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E012DFD6C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:22:00 +0100 (CET)
Received: from localhost ([::1]:50122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krN0Z-0004CA-7l
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRQ-0005FE-On
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:40 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRM-0007yC-5b
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:40 -0500
Received: by mail-wr1-x432.google.com with SMTP id 91so11314171wrj.7
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+XV7POEVzZV9uOrwvIZLsGMYHJ/WzP2anWj6Wklw4o=;
 b=EpVJHdcrjVOeV+TcaUSqr98K+inA8CLtvlYV4nS1r/a6wbu1hYhRQdRGQIMm+dqr1N
 gNCvAdGIOrit0x8P5tdKdFhtRF387c536drwILymXUSHW7pR4Ak0t0hFpBevixCiptN1
 FAB7BqrVDJmhIWgaH1bXmX0o4yBLDIaWNcv4Lw7bR8Y39zwJhuQlnni+hD3IludyZGI5
 kNJ6CT5pE1z268xMpJ/yxk+QSt4F3w8YEEbYr13g/fBr27yO4fEME1QcQaPWf+NtbgrX
 eZuEd0xa0xIbKuQUeZ4R3mYl6BG6YZb3v9Gf2IaRT+GUg40JacK4lOfJq6BhomOayOg2
 wTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x+XV7POEVzZV9uOrwvIZLsGMYHJ/WzP2anWj6Wklw4o=;
 b=iHJefzhMpy7O4MmR/rcpw4PfkurjfeKeT1BxIu5y67yhwPKc+Om86cZZ04nfU9LuYp
 ZDM4gwwRgbusGwmQTUnwaUGxvchcFytepmpHNYcjFF1706CyKGiUSpcTV/HjYBSbTkd8
 R6QwCqTGAHnk8echHnOnJ26CN/6MWq1/W7MgD/Ezk/lLv7tkYVrrPyQNJ67exJ2L4MN8
 R+6h1Zhe/MJ+3/cLgz73S3Eir/cBmqxel/2CK/r3liH1ndYA3blzT7xyn13budKYfpoU
 AcBuO1NLMk0kUVlzwp1wTB3cwM7lkRj8i6N6UN6kPgZV5k/pWumCmmlsd+6m42ydHi7k
 DexQ==
X-Gm-Message-State: AOAM531gT+U+e6jVsU3NA7D9d8n5jGCbPP7hsYpO1rtYGU58ZU2RDjmh
 jpVV+wbhlaqAcYOVOLS1zID7c/7WTpw=
X-Google-Smtp-Source: ABdhPJzgchAneWYicCTcY6OhG+m2iBC46VsiZk0xoe9x2AK3SYrKNSt4ddJ0OHvAfVEFfuVQXrVSLQ==
X-Received: by 2002:adf:c387:: with SMTP id p7mr18943960wrf.95.1608561934748; 
 Mon, 21 Dec 2020 06:45:34 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 52/55] libattr: convert to meson
Date: Mon, 21 Dec 2020 15:44:44 +0100
Message-Id: <20201221144447.26161-53-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 45 ++++-----------------------------------------
 meson.build       | 38 +++++++++++++++++++++++++++++++++++---
 meson_options.txt |  2 ++
 3 files changed, 41 insertions(+), 44 deletions(-)

diff --git a/configure b/configure
index 569396248b..18af62a3e0 100755
--- a/configure
+++ b/configure
@@ -331,8 +331,7 @@ xen_pci_passthrough="auto"
 linux_aio="$default_feature"
 linux_io_uring="$default_feature"
 cap_ng="auto"
-attr="$default_feature"
-libattr="$default_feature"
+attr="auto"
 xfs="$default_feature"
 tcg="enabled"
 membarrier="$default_feature"
@@ -1229,9 +1228,9 @@ for opt do
   ;;
   --enable-linux-io-uring) linux_io_uring="yes"
   ;;
-  --disable-attr) attr="no"
+  --disable-attr) attr="disabled"
   ;;
-  --enable-attr) attr="yes"
+  --enable-attr) attr="enabled"
   ;;
   --disable-membarrier) membarrier="no"
   ;;
@@ -3542,36 +3541,6 @@ elif test "$tpm" = "yes"; then
   fi
 fi
 
-##########################################
-# attr probe
-
-libattr_libs=
-if test "$attr" != "no" ; then
-  cat > $TMPC <<EOF
-#include <stdio.h>
-#include <sys/types.h>
-#ifdef CONFIG_LIBATTR
-#include <attr/xattr.h>
-#else
-#include <sys/xattr.h>
-#endif
-int main(void) { getxattr(NULL, NULL, NULL, 0); setxattr(NULL, NULL, NULL, 0, 0); return 0; }
-EOF
-  if compile_prog "" "" ; then
-    attr=yes
-  # Older distros have <attr/xattr.h>, and need -lattr:
-  elif compile_prog "-DCONFIG_LIBATTR" "-lattr" ; then
-    attr=yes
-    libattr_libs="-lattr"
-    libattr=yes
-  else
-    if test "$attr" = "yes" ; then
-      feature_not_found "ATTR" "Install libc6 or libattr devel"
-    fi
-    attr=no
-  fi
-fi
-
 ##########################################
 # iovec probe
 cat > $TMPC <<EOF
@@ -5866,13 +5835,6 @@ if test "$linux_io_uring" = "yes" ; then
   echo "LINUX_IO_URING_CFLAGS=$linux_io_uring_cflags" >> $config_host_mak
   echo "LINUX_IO_URING_LIBS=$linux_io_uring_libs" >> $config_host_mak
 fi
-if test "$attr" = "yes" ; then
-  echo "CONFIG_ATTR=y" >> $config_host_mak
-  echo "LIBATTR_LIBS=$libattr_libs" >> $config_host_mak
-fi
-if test "$libattr" = "yes" ; then
-  echo "CONFIG_LIBATTR=y" >> $config_host_mak
-fi
 if test "$vhost_scsi" = "yes" ; then
   echo "CONFIG_VHOST_SCSI=y" >> $config_host_mak
 fi
@@ -6534,6 +6496,7 @@ NINJA=$ninja $meson setup \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
+        -Dattr=$attr \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index f580f2f67f..fef0c0f013 100644
--- a/meson.build
+++ b/meson.build
@@ -324,10 +324,40 @@ if not get_option('libnfs').auto() or have_block
                       required: get_option('libnfs'),
                       method: 'pkg-config', static: enable_static)
 endif
+
+libattr_test = '''
+  #include <stddef.h>
+  #include <sys/types.h>
+  #ifdef CONFIG_LIBATTR
+  #include <attr/xattr.h>
+  #else
+  #include <sys/xattr.h>
+  #endif
+  int main(void) { getxattr(NULL, NULL, NULL, 0); setxattr(NULL, NULL, NULL, 0, 0); return 0; }'''
+
 libattr = not_found
-if 'CONFIG_ATTR' in config_host
-  libattr = declare_dependency(link_args: config_host['LIBATTR_LIBS'].split())
+have_old_libattr = false
+if not get_option('attr').disabled()
+  if cc.links(libattr_test)
+    libattr = declare_dependency()
+  else
+    libattr = cc.find_library('attr', has_headers: ['attr/xattr.h'],
+                              required: get_option('attr'),
+                              static: enable_static)
+    if libattr.found() and not \
+      cc.links(libattr_test, dependencies: libattr, args: '-DCONFIG_LIBATTR')
+      libattr = not_found
+      if get_option('attr').enabled()
+        error('could not link libattr')
+      else
+        warning('could not link libattr, disabling')
+      endif
+    else
+      have_old_libattr = libattr.found()
+    endif
+  endif
 endif
+
 seccomp = not_found
 if not get_option('libiscsi').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
@@ -1010,6 +1040,7 @@ config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') /
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
 config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
 
+config_host_data.set('CONFIG_ATTR', libattr.found())
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
@@ -1027,6 +1058,7 @@ if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT', glusterfs_ftruncate_has_stat)
   config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 endif
+config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
 config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
@@ -2350,7 +2382,7 @@ summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
 summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
-summary_info += {'ATTR/XATTR support': config_host.has_key('CONFIG_ATTR')}
+summary_info += {'ATTR/XATTR support': libattr.found()}
 summary_info += {'Install blobs':     get_option('install_blobs')}
 summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
 summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
diff --git a/meson_options.txt b/meson_options.txt
index 12a1872f20..8fcec056cd 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -40,6 +40,8 @@ option('cfi', type: 'boolean', value: 'false',
 option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
 
+option('attr', type : 'feature', value : 'auto',
+       description: 'attr/xattr support')
 option('brlapi', type : 'feature', value : 'auto',
        description: 'brlapi character device driver')
 option('bzip2', type : 'feature', value : 'auto',
-- 
2.29.2



