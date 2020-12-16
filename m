Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690962DC49F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:50:56 +0100 (CET)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa0t-0001KW-By
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyi-0007yC-Nr
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:40 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyg-0002Oc-Lv
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id e25so3121070wme.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F94rT0EQPymnbu3NaubTDeXEy4qQxC3JVeupcYXtxYY=;
 b=VTM5eAWUl7Sigqn6U9VTHowMrY6zCHvxClYOayEytXV/cU/z3Bf+whDPn2G7HI+L+Q
 ZTPLNHrhhjVpH0W+Vw51X44+doXJ8lxpFb3TqGlslAdilpYiT+lBgruBuZghAeiDkFAT
 TGiGFWbQfc3c60h33OCP2LEJwN/Zno08AjxzWXHRoEG10uSJZh/BoY/u2kmcfqTrsK+W
 ZwKECQ0gtbwBC8ueQwXZFEVQFG/WLyMdlwPv13WcDnSIfhVL8slhVhBLHM2XmMrcSSz1
 sopnisX7q219JwWSkCxHxs4FC5DqE9XFxADDmfjUXVqXoklPincpzs1s1VTKsLpeltXj
 NOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F94rT0EQPymnbu3NaubTDeXEy4qQxC3JVeupcYXtxYY=;
 b=nm1BV7Wb16I+jcNjqbLZ817mUwwlsJWP3cKZcsF/NDaP17QO5NuGOyu1117cB0vy+T
 2KxknGb4nXTMc5SciT6YTHAb+F0/9iIANatzMfB3ppTatKd1z3IL9QtwyO1AvO3nOWL4
 mtnnSSEf6CUyM2bEgegs7PWsvpsnIWASFkRDrX4gT/kEpX+pifupDIZTcFbgnazn3pzQ
 bmBvQTx2vE1nsbce48pUhrebHzEhnK0RxvfIbcpDVCINv9iBp4IZTMhav09ffysNKjL3
 I9fsAvmmNsKSHqeZIl8eYOuStMhMhjG5WFqf5toCAQ3AHTbXk9S663iABIL6BowvzBZb
 purw==
X-Gm-Message-State: AOAM5320EkgavOR08SfXIJT07ESKztQbaYy/kLJM9qtJdKhWU03IkeZc
 tPrRfR8Sf+YBQK3lQbinHyOmxl20CfMTKQ==
X-Google-Smtp-Source: ABdhPJzdOZXcioAnYk9NcyAolbWRj2f/SuS0n+mUO14hjHNtYu/VIgHt13f1XA1WtVjA+63+nRTisA==
X-Received: by 2002:a1c:4954:: with SMTP id w81mr4240497wma.60.1608137317109; 
 Wed, 16 Dec 2020 08:48:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j9sm3919189wrm.14.2020.12.16.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 40EDE1FF90;
 Wed, 16 Dec 2020 16:48:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/11] configure: add --without-default-features
Date: Wed, 16 Dec 2020 16:48:20 +0000
Message-Id: <20201216164827.24457-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
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
Acked-by: Thomas Huth <thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201210190417.31673-5-alex.bennee@linaro.org>

diff --git a/configure b/configure
index f9b1e4fbb0..0e542b4c46 100755
--- a/configure
+++ b/configure
@@ -293,8 +293,19 @@ unset target_list_exclude
 # Distributions want to ensure that several features are compiled in, and it
 # is impossible without a --enable-foo that exits if a feature is not found.
 
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
@@ -303,52 +314,52 @@ netmap="no"
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
@@ -370,81 +381,81 @@ pie=""
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
@@ -455,7 +466,7 @@ fuse_lseek="auto"
 bogus_os="no"
 malloc_trim="auto"
 
-# parse CC options first
+# parse CC options second
 for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
@@ -798,7 +809,7 @@ Linux)
   audio_possible_drivers="oss alsa sdl pa"
   linux="yes"
   linux_user="yes"
-  vhost_user="yes"
+  vhost_user=${default_feature:-yes}
 ;;
 esac
 
@@ -942,6 +953,8 @@ for opt do
   ;;
   --without-default-devices) default_devices="no"
   ;;
+  --without-default-features) # processed above
+  ;;
   --enable-gprof) gprof="yes"
   ;;
   --enable-gcov) gcov="yes"
@@ -1747,7 +1760,8 @@ Advanced options (experts only):
   --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
 
 Optional features, enabled with --enable-FEATURE and
-disabled with --disable-FEATURE, default is enabled if available:
+disabled with --disable-FEATURE, default is enabled if available
+(unless built with --without-default-features):
 
   system          all system emulation targets
   user            supported user emulation targets
@@ -6957,6 +6971,7 @@ NINJA=$ninja $meson setup \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
+        $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
         $cross_arg \
         "$PWD" "$source_path"
 
-- 
2.20.1


