Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915C2D65FA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:09:06 +0100 (CET)
Received: from localhost ([::1]:59540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRJI-0007MN-8X
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knREs-0005WH-Q2
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:04:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knREq-0003R4-KP
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:04:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id a3so6404111wmb.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7+zh2hnADOiv/9aZ/cgkVHXaMA7g26Ouc1haNXvz7k=;
 b=G/G6udAezt6M2iEpqRWuHGTRbxShV2MTolcKRSgr1GNu2nx5QUNcy2Tn0nkJxNT25F
 9j7pr4MXuAVePg1BP0qLZss4mGlP8sf4CYWNCOlN66Sea+NdVRSeP5mIvEMMK9ugiYO3
 B+TQSYzFnjI3MJI30mBs7VBo3t1O5Yz4NYdx6tuSilW3SHFaKyUg7CKV3hglfTEcOZCi
 0XmHVKOPO3Q+y7SP4VH05NaUdMeb6iGLe26k8e+Kzr77tfmSpK28S0cVgIoQMB6FkqRF
 zuI8yRAlogpr0/f+lK/DZS3PpwtGkIpaOIGEC0x3tJAtwhgJfUFuRdkqpFp591YPARHu
 /zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7+zh2hnADOiv/9aZ/cgkVHXaMA7g26Ouc1haNXvz7k=;
 b=L06XPK8whYKn5RdgVmMFgRcBiE+GMijMdzPG4Kzo32RCEFwSCV0m7Q9Wwat/rjmICt
 CnhTIF3waXcCR8MhMvbQKqk8iuXi4YBgKgURYXHmvs4G0gof2HnpdoDe4OTTHxyIH/Vs
 2j/IccOwVmfhUT/SzzJIhD4oWTSPtIrWmwjzJC+NSCAdSe1b5dHoldSLY72UofU3C+5q
 VDP9jLoD/iMJUlDcUcNEdUxPVjzn4BEaZUu1I5oeb1SYDXuEwTS+CLxYjTl7QakW6ypo
 A2iIiQMynwH5Xd/l/Dr33iM3Vn3j0+KvHzCiZ3ivScsf51hshC3hperSHGdI8BihfjvW
 L4GA==
X-Gm-Message-State: AOAM530nwqDgDymMio5E9w0FmNQhD5Z88YhDZKiZu5Eggv4m2UvDYPap
 JQMGrq7RAewUlD/hb6dHwypZtw==
X-Google-Smtp-Source: ABdhPJyQ0I+Ybt+RkResJ1VenVTYQPo3T5tNGfPFeuK873XwFS9XrOEKuOWJcEL80As7sZ4rDr6iww==
X-Received: by 2002:a1c:234d:: with SMTP id j74mr9703147wmj.18.1607627066870; 
 Thu, 10 Dec 2020 11:04:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a14sm2046616wrn.3.2020.12.10.11.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 11:04:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51E1E1FF90;
 Thu, 10 Dec 2020 19:04:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 4/8] configure: add --without-default-features
Date: Thu, 10 Dec 2020 19:04:13 +0000
Message-Id: <20201210190417.31673-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210190417.31673-1-alex.bennee@linaro.org>
References: <20201210190417.31673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
particular feature on your relatively slow emulated test system. On
it's own I go from:

  $ ls -lh qemu-system-aarch64
  -rwxr-xr-x 1 alex alex 120M Dec 10 12:45 qemu-system-aarch64*
  $ ldd qemu-system-aarch64 | wc -l
  170

to:

  $ ls -lh qemu-aarch64
  -rwxr-xr-x 1 alex alex 43M Dec 10 12:41 qemu-aarch64*
  $ ldd qemu-system-aarch64 | wc -l
  57

which is still able to run my default Debian ARM64 machine with a lot
less fat involved.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use ${default_feature:-yes} instead of default_yes_features
  - pass -Dauto_features=disabled to meson
  - add some numbers to commit message
---
 configure | 158 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 87 insertions(+), 71 deletions(-)

diff --git a/configure b/configure
index 46fdea88c7..11f5878a59 100755
--- a/configure
+++ b/configure
@@ -291,10 +291,22 @@ unset target_list_exclude
 #
 # Always add --enable-foo and --disable-foo command line args.
 # Distributions want to ensure that several features are compiled in, and it
-# is impossible without a --enable-foo that exits if a feature is not found.
+# is impossible without a --enable-foo that exits if a feature is not
+# found.
 
-brlapi=""
-curl=""
+default_feature=""
+# parse CC options second
+for opt do
+  optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
+  case "$opt" in
+      --without-default-features)
+          default_feature="no"
+  ;;
+  esac
+done
+
+brlapi="$default_feature"
+curl="$default_feature"
 iconv="auto"
 curses="auto"
 docs="auto"
@@ -303,52 +315,52 @@ netmap="no"
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
@@ -370,81 +382,81 @@ pie=""
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
+live_block_migration=${default_feature:-yes}
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
+replication=${default_feature:-yes}
+bochs=${default_feature:-yes}
+cloop=${default_feature:-yes}
+dmg=${default_feature:-yes}
+qcow1=${default_feature:-yes}
+vdi=${default_feature:-yes}
+vvfat=${default_feature:-yes}
+qed=${default_feature:-yes}
+parallels=${default_feature:-yes}
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
@@ -453,7 +465,7 @@ gettext="auto"
 bogus_os="no"
 malloc_trim="auto"
 
-# parse CC options first
+# parse CC options second
 for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
@@ -796,7 +808,7 @@ Linux)
   audio_possible_drivers="oss alsa sdl pa"
   linux="yes"
   linux_user="yes"
-  vhost_user="yes"
+  vhost_user=${default_feature:-yes}
 ;;
 esac
 
@@ -940,6 +952,8 @@ for opt do
   ;;
   --without-default-devices) default_devices="no"
   ;;
+  --without-default-features) # processed above
+  ;;
   --enable-gprof) gprof="yes"
   ;;
   --enable-gcov) gcov="yes"
@@ -1737,7 +1751,8 @@ Advanced options (experts only):
   --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
 
 Optional features, enabled with --enable-FEATURE and
-disabled with --disable-FEATURE, default is enabled if available:
+disabled with --disable-FEATURE, default is enabled if available
+(unless built with --without-default-features):
 
   system          all system emulation targets
   user            supported user emulation targets
@@ -7001,6 +7016,7 @@ NINJA=$ninja $meson setup \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
+        $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
         $cross_arg \
         "$PWD" "$source_path"
 
-- 
2.20.1


