Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82CD2CC10A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:39:52 +0100 (CET)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUER-0004mt-IL
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkUDK-0004ME-Lv
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:38:42 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkUDI-0005dx-Lc
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:38:42 -0500
Received: by mail-wm1-x342.google.com with SMTP id v14so8437781wml.1
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 07:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3bVP23Fe7KdWHe37gUTAZ1T2seLh9HbpKjQASLFxBTo=;
 b=OT7LNm8pfSyHkg5Gn4+gl5m7WZevPxsuMi4xR31NJ5vga3MxZZDqjEmN1yKyLiFEBL
 nhJnSe9T5OeOkz5LZniXeNcIcqmPrsw5R9dVr0i2vnYIaC0GzCxXESNZoDIZWudKQvfO
 fQasj+cC6e9T1bb8JD7ktsqBhVMNjc/J3fxFeiX3DL1gWcQTMYI8/UW1FyYQ2oXgwoqP
 SB90NxnrxNIpZioWXg9P9kMbcTr/IiW1HgDZMvDgC+S0Fwz5tmSjpcf3W2nyLHij6LUY
 bJ5t5qGpxk8DVngvIRhAxhbWQGFIP12TAh+N/kT2zJjBoYL1u8u45BmpAeGCA5DUbT4g
 I56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3bVP23Fe7KdWHe37gUTAZ1T2seLh9HbpKjQASLFxBTo=;
 b=BkPUSama9+QBRXMTmI2TIvSpLa22zNfnqbg1WIeawLz+Xm88GXrsxDcc6nPPd4s/SG
 T9yZ53HSM1rLmBmnrrE7R8sosl7CPZNFlN1jJj4oENmuzh7om2ZoCTEFsDf6HAdkJPN5
 7QTnYtrjwDKS5Scvd5B4kiy2LHPohZdO2MLMJwGsfQpatYgBSjpf/WyDoBI+TwTJNAhK
 9ldGIZCfi7jiCmxfQum/WPKdLyqwbyjZsGUgtjLFT1TDIqACojwrJBucH69lkuLdB9NS
 HG+s4QQbSDBYqyZoh5n6gtiqV3vtPt7C7a9f40px/EU6C2NiOTX9AE8Th6VxjR+BQ+/C
 mxQg==
X-Gm-Message-State: AOAM5312Sq67cQ/Nz/YUdiBZgt5A3o+TnKFwiQNNDpVO6hgRCP+mzpCu
 7h/UH/LAVT2qaFSx9NCFbFYrBQ==
X-Google-Smtp-Source: ABdhPJy3gE2ISmv01osXj4gJcSSZBOT11G0v2rT10ArSkjbr6KN8M45J1nKytSHdp9+Wz1DbgneOGQ==
X-Received: by 2002:a1c:b104:: with SMTP id a4mr3704455wmf.138.1606923518877; 
 Wed, 02 Dec 2020 07:38:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c190sm2604311wme.19.2020.12.02.07.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 07:38:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A36F1FF7E;
 Wed,  2 Dec 2020 15:38:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] configure: add --without-default-features
Date: Wed,  2 Dec 2020 15:38:27 +0000
Message-Id: <20201202153827.17446-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
 configure | 161 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 89 insertions(+), 72 deletions(-)

diff --git a/configure b/configure
index 18c26e0389..23fa6f9421 100755
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
@@ -303,59 +317,59 @@ netmap="no"
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
 prefix="/usr/local"
 qemu_suffix="qemu"
 slirp="auto"
-oss_lib=""
+oss_lib="$default_feature"
 bsd="no"
 linux="no"
 solaris="no"
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


