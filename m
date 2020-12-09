Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A2E2D4794
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:12:56 +0100 (CET)
Received: from localhost ([::1]:39980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn31L-0007qy-Qk
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2q1-0006WK-DT
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:13 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2px-0000rD-0H
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id w206so1251063wma.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fjelfr20ONB8EE1U9iETs2U+O4AtShFet7oBRiVQZlY=;
 b=n5XjI/nsQ28+DcNSvZ5a97ZM+GV0GKN1MIDusKJkhnkUBZR/igrsMGXwtJUtIS3kJJ
 ZnoFQrBhyctq6k87a181gY6kZ7djGDTn1AHmj+ULx0QsXkMvUM2Bo5X7QvUNG+HbxfkA
 eW3E/4FOmIOpw80QpJW5Mv3xxBcxO0A8Xiy8TJW5NF/nZ/KYY16JLwr+tYuQYvkw4cai
 BZkQlg+YMyAv8Hskg/w5+q4iKb/DLE7/5IO5HsGhUw0C4/6l2++IrbkQ/CExdv5YMzOo
 d0efMik78z8f5/W8JsquiAxZN/g+uSbxUCN8R8AJG67DrFRIv7Xk6D0ezZug8/QmXmvc
 gu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fjelfr20ONB8EE1U9iETs2U+O4AtShFet7oBRiVQZlY=;
 b=OHIUXtjDQOko6XYM2ONxRwfHxe7XiIiXgg/2A1FTCSmkgpUni8bhp6HI+AqoX5KZAs
 gTnm08uOE0U+Vs23J/cpFdZwD0FjrBW+DNc60z+MMmoNW+0cGLwXjBteBCTCFasKsMce
 LbC7Ut1VSAk5aUfLhh8Sl97m3w70hslpd9UeUocsctAP+adDvbCnjR9RtdgN24cF8e6V
 L9uSb+1Qj1BKJSS1Q/UZYxf0q7W7pyDHCMpIcY3YM4svjDeL8NtWZ1NYos8FQphsqF+e
 5SvDEtCfeDDCGcGhh5qTVHBpULmFo9lOFOSMLzq35gnXKHkV0ESknmhrlPIzD7IyyR+p
 qjrQ==
X-Gm-Message-State: AOAM533eGfdB4tN4larQnwMaX7laZ/YH+unZNlp58R5Re/ffX8WokKVQ
 qp3w8QkUNZcEIxv+hv4qM6HYDA==
X-Google-Smtp-Source: ABdhPJxVReJSrXB1xHdmLk1mGq2ztzyUii1S2QZajki9G+oVTzBSPRbDkSKMG4erGDOvLmzaUQwtAA==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr3690801wmc.102.1607533266694; 
 Wed, 09 Dec 2020 09:01:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r128sm4806581wma.5.2020.12.09.09.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 09:01:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B6E81FF8F;
 Wed,  9 Dec 2020 17:00:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/6] configure: add --without-default-features
Date: Wed,  9 Dec 2020 17:00:56 +0000
Message-Id: <20201209170059.20742-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201209170059.20742-1-alex.bennee@linaro.org>
References: <20201209170059.20742-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default QEMU enables a lot of features if it can probe and find the
support libraries. It also enables a bunch of features by default.
This patch adds the ability to build --without-default-features which
can be paired with a --without-default-devices for a barely functional
build.

The main use case for this is testing our build assumptions and for
minimising the amount of stuff you build if you just want to test a
particular feature on your relatively slow emulated test system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 159 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 88 insertions(+), 71 deletions(-)

diff --git a/configure b/configure
index 8f2095a2db..a08e6c96e0 100755
--- a/configure
+++ b/configure
@@ -291,10 +291,24 @@ unset target_list_exclude
 #
 # Always add --enable-foo and --disable-foo command line args.
 # Distributions want to ensure that several features are compiled in, and it
-# is impossible without a --enable-foo that exits if a feature is not found.
+# is impossible without a --enable-foo that exits if a feature is not
+# found.
 
-brlapi=""
-curl=""
+default_feature=""
+default_yes_feature="yes"
+# parse CC options second
+for opt do
+  optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
+  case "$opt" in
+      --without-default-features)
+          default_feature="no"
+          default_yes_feature="no"
+  ;;
+  esac
+done
+
+brlapi="$default_feature"
+curl="$default_feature"
 iconv="auto"
 curses="auto"
 docs="auto"
@@ -303,52 +317,52 @@ netmap="no"
 sdl="auto"
 sdl_image="auto"
 virtiofsd="auto"
-virtfs=""
+virtfs="$default_feature"
 libudev="auto"
 mpath="auto"
 vnc="enabled"
 sparse="auto"
-vde=""
+vde="$default_feature"
 vnc_sasl="auto"
 vnc_jpeg="auto"
 vnc_png="auto"
 xkbcommon="auto"
-xen=""
-xen_ctrl_version=""
+xen="$default_feature"
+xen_ctrl_version="$default_feature"
 xen_pci_passthrough="auto"
-linux_aio=""
-linux_io_uring=""
-cap_ng=""
-attr=""
-libattr=""
-xfs=""
+linux_aio="$default_feature"
+linux_io_uring="$default_feature"
+cap_ng="$default_feature"
+attr="$default_feature"
+libattr="$default_feature"
+xfs="$default_feature"
 tcg="enabled"
-membarrier=""
-vhost_net=""
-vhost_crypto=""
-vhost_scsi=""
-vhost_vsock=""
+membarrier="$default_feature"
+vhost_net="$default_feature"
+vhost_crypto="$default_feature"
+vhost_scsi="$default_feature"
+vhost_vsock="$default_feature"
 vhost_user="no"
 vhost_user_blk_server="auto"
-vhost_user_fs=""
+vhost_user_fs="$default_feature"
 kvm="auto"
 hax="auto"
 hvf="auto"
 whpx="auto"
-rdma=""
-pvrdma=""
+rdma="$default_feature"
+pvrdma="$default_feature"
 gprof="no"
 debug_tcg="no"
 debug="no"
 sanitizers="no"
 tsan="no"
-fortify_source=""
+fortify_source="$default_feature"
 strip_opt="yes"
 tcg_interpreter="no"
 bigendian="no"
 mingw32="no"
 gcov="no"
-EXESUF=""
+EXESUF="$default_feature"
 HOST_DSOSUF=".so"
 modules="no"
 module_upgrades="no"
@@ -370,81 +384,81 @@ pie=""
 qom_cast_debug="yes"
 trace_backends="log"
 trace_file="trace"
-spice=""
-rbd=""
-smartcard=""
+spice="$default_feature"
+rbd="$default_feature"
+smartcard="$default_feature"
 u2f="auto"
-libusb=""
-usb_redir=""
-opengl=""
+libusb="$default_feature"
+usb_redir="$default_feature"
+opengl="$default_feature"
 opengl_dmabuf="no"
 cpuid_h="no"
-avx2_opt=""
+avx2_opt="$default_feature"
 capstone="auto"
-lzo=""
-snappy=""
-bzip2=""
-lzfse=""
-zstd=""
-guest_agent=""
+lzo="$default_feature"
+snappy="$default_feature"
+bzip2="$default_feature"
+lzfse="$default_feature"
+zstd="$default_feature"
+guest_agent="$default_feature"
 guest_agent_with_vss="no"
 guest_agent_ntddscsi="no"
-guest_agent_msi=""
-vss_win32_sdk=""
+guest_agent_msi="$default_feature"
+vss_win32_sdk="$default_feature"
 win_sdk="no"
-want_tools=""
-libiscsi=""
-libnfs=""
+want_tools="$default_feature"
+libiscsi="$default_feature"
+libnfs="$default_feature"
 coroutine=""
-coroutine_pool=""
+coroutine_pool="$default_feature"
 debug_stack_usage="no"
 crypto_afalg="no"
-seccomp=""
-glusterfs=""
+seccomp="$default_feature"
+glusterfs="$default_feature"
 glusterfs_xlator_opt="no"
 glusterfs_discard="no"
 glusterfs_fallocate="no"
 glusterfs_zerofill="no"
 glusterfs_ftruncate_has_stat="no"
 glusterfs_iocb_has_stat="no"
-gtk=""
+gtk="$default_feature"
 gtk_gl="no"
 tls_priority="NORMAL"
-gnutls=""
-nettle=""
+gnutls="$default_feature"
+nettle="$default_feature"
 nettle_xts="no"
-gcrypt=""
+gcrypt="$default_feature"
 gcrypt_hmac="no"
 gcrypt_xts="no"
 qemu_private_xts="yes"
-auth_pam=""
-vte=""
-virglrenderer=""
-tpm=""
-libssh=""
-live_block_migration="yes"
-numa=""
+auth_pam="$default_feature"
+vte="$default_feature"
+virglrenderer="$default_feature"
+tpm="$default_feature"
+libssh="$default_feature"
+live_block_migration="$default_yes_feature"
+numa="$default_feature"
 tcmalloc="no"
 jemalloc="no"
-replication="yes"
-bochs="yes"
-cloop="yes"
-dmg="yes"
-qcow1="yes"
-vdi="yes"
-vvfat="yes"
-qed="yes"
-parallels="yes"
+replication="$default_yes_feature"
+bochs="$default_yes_feature"
+cloop="$default_yes_feature"
+dmg="$default_yes_feature"
+qcow1="$default_yes_feature"
+vdi="$default_yes_feature"
+vvfat="$default_yes_feature"
+qed="$default_yes_feature"
+parallels="$default_yes_feature"
 sheepdog="no"
-libxml2=""
+libxml2="$default_feature"
 debug_mutex="no"
-libpmem=""
+libpmem="$default_feature"
 default_devices="yes"
 plugins="no"
 fuzzing="no"
 rng_none="no"
-secret_keyring=""
-libdaxctl=""
+secret_keyring="$default_feature"
+libdaxctl="$default_feature"
 meson=""
 ninja=""
 skip_meson=no
@@ -453,7 +467,7 @@ gettext=""
 bogus_os="no"
 malloc_trim="auto"
 
-# parse CC options first
+# parse CC options second
 for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
@@ -796,7 +810,7 @@ Linux)
   audio_possible_drivers="oss alsa sdl pa"
   linux="yes"
   linux_user="yes"
-  vhost_user="yes"
+  vhost_user="$default_yes_feature"
 ;;
 esac
 
@@ -940,6 +954,8 @@ for opt do
   ;;
   --without-default-devices) default_devices="no"
   ;;
+  --without-default-features) # processed above
+  ;;
   --enable-gprof) gprof="yes"
   ;;
   --enable-gcov) gcov="yes"
@@ -1737,7 +1753,8 @@ Advanced options (experts only):
   --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
 
 Optional features, enabled with --enable-FEATURE and
-disabled with --disable-FEATURE, default is enabled if available:
+disabled with --disable-FEATURE, default is enabled if available
+(unless built with --without-default-features):
 
   system          all system emulation targets
   user            supported user emulation targets
-- 
2.20.1


