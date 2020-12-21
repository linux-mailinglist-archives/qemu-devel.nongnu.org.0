Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03D2DFD54
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:16:48 +0100 (CET)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMvX-0006nD-IL
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRP-0005Aw-3X
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:39 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRK-0007xd-Hj
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:38 -0500
Received: by mail-wm1-x330.google.com with SMTP id q75so11189946wme.2
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9TR752MNLWceHvtFCikM71zHYckwDkSayW1xOx+GF/E=;
 b=OH1Dn3eXzv2fyHQW6fas9aGA+o1IBVHTUTtxTZ4e/Xy/apuxeR8OVhdVzzM5zYjXuv
 P/tRfcKFr+PIlpZY5qUMtmqcI3K3pc+cit2LjbeiQm3MT7pHAuB9egnQo/K09sgqLHWM
 85QQUGlEPWPmTa62dZAv9NSxawRPBfUoBVHb8QEixVpCL1fRHnvNh7bDRjj6tKUd2m72
 /85MuuThoZ3BJ5SQjrIu83wgVvuAYAEEmYNnt8xbRxK1h9z/bl/O4LDVu33OL1eHFbX3
 jlXdyGNJN/8rACEblxIi+qQtxax5SYAzi5sW32Zl7d3huBl7kfYdVoDDdOO5dmzjj3xB
 Dhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9TR752MNLWceHvtFCikM71zHYckwDkSayW1xOx+GF/E=;
 b=mDl5OyDecJaE/UWVB6DNwp5ACByXfduEy0pdfWgEFmUqT7/wz9rigZfnw7MckqW9wx
 JZUH+qKTeUSAXMlP8EzamIUXKGJqjx6LOoXlfKxYZskYRUJa8ztLHv8U741TMe762eET
 AHUsudoYWB8LiebKYakJ4qxA+ipA9xwqWrmYdRJCCzGjsoY7ekJ1iNtu8m3z1tP1ao2w
 M8XiNvcST+QREWqfiwj8dBlIZGP2GAI/FsJanqm2BJXUL0X/18QmRfq1ofBNIrm+ocdY
 572NbNU8rOmQ0MjA5YzNo+/f34rXb9mvuBwLxR0En2h341ws3tuBFoXFN5in5bQjv6ai
 saWA==
X-Gm-Message-State: AOAM5318BxWlX6rnMyO80wtHDrU/SRqUSERxxsjem1Z6/BL4AKHL/HfW
 haOBRYrmR3htMZhdSf5pVJpxb16VFnA=
X-Google-Smtp-Source: ABdhPJyvWoiSUAIoP6kSXKjoeyYPNUmWS0GqhIfGQoFKKtPX8WdqHkuQdXJ6DR0/azUqhyo4s4g/qA==
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr17292922wmg.152.1608561933122; 
 Mon, 21 Dec 2020 06:45:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 50/55] virtfs: convert to meson
Date: Mon, 21 Dec 2020 15:44:42 +0100
Message-Id: <20201221144447.26161-51-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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
 configure         | 29 ++++-------------------------
 meson.build       | 24 ++++++++++++++++++++++--
 meson_options.txt | 11 +++++++----
 3 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/configure b/configure
index ba8c6e74be..46ee3da40e 100755
--- a/configure
+++ b/configure
@@ -315,7 +315,7 @@ netmap="no"
 sdl="auto"
 sdl_image="auto"
 virtiofsd="auto"
-virtfs="$default_feature"
+virtfs="auto"
 libudev="auto"
 mpath="auto"
 vnc="enabled"
@@ -1004,9 +1004,9 @@ for opt do
   ;;
   --enable-qom-cast-debug) qom_cast_debug="yes"
   ;;
-  --disable-virtfs) virtfs="no"
+  --disable-virtfs) virtfs="disabled"
   ;;
-  --enable-virtfs) virtfs="yes"
+  --enable-virtfs) virtfs="enabled"
   ;;
   --disable-libudev) libudev="disabled"
   ;;
@@ -5443,24 +5443,6 @@ if [ "$eventfd" = "yes" ]; then
   ivshmem=yes
 fi
 
-if test "$softmmu" = yes ; then
-  if test "$linux" = yes; then
-    if test "$virtfs" != no && test "$cap_ng" = yes && test "$attr" = yes ; then
-      virtfs=yes
-    else
-      if test "$virtfs" = yes; then
-        error_exit "VirtFS requires libcap-ng devel and libattr devel"
-      fi
-      virtfs=no
-    fi
-  else
-    if test "$virtfs" = yes; then
-      error_exit "VirtFS is supported only on Linux"
-    fi
-    virtfs=no
-  fi
-fi
-
 # Probe for guest agent support/options
 
 if [ "$guest_agent" != "no" ]; then
@@ -5917,9 +5899,6 @@ fi
 if test "$libattr" = "yes" ; then
   echo "CONFIG_LIBATTR=y" >> $config_host_mak
 fi
-if test "$virtfs" = "yes" ; then
-  echo "CONFIG_VIRTFS=y" >> $config_host_mak
-fi
 if test "$vhost_scsi" = "yes" ; then
   echo "CONFIG_VHOST_SCSI=y" >> $config_host_mak
 fi
@@ -6580,7 +6559,7 @@ NINJA=$ninja $meson setup \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dzstd=$zstd -Dseccomp=$seccomp \
+        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 99c4d0dd1a..22413b4f16 100644
--- a/meson.build
+++ b/meson.build
@@ -963,6 +963,25 @@ endif
 # config-host.h #
 #################
 
+have_virtfs = (targetos == 'linux' and
+    have_system and
+    libattr.found() and
+    libcap_ng.found())
+
+if get_option('virtfs').enabled()
+  if not have_virtfs
+    if targetos != 'linux'
+      error('virtio-9p (virtfs) requires Linux')
+    elif not libcap_ng.found() or not libattr.found()
+      error('virtio-9p (virtfs) requires libcap-ng-devel and libattr-devel')
+    elif not have_system
+      error('virtio-9p (virtfs) needs system emulation support')
+    endif
+  endif
+elif get_option('virtfs').disabled()
+  have_virtfs = false
+endif
+
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
@@ -1007,6 +1026,7 @@ config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
 config_host_data.set('CONFIG_VNC_PNG', png.found())
 config_host_data.set('CONFIG_VNC_SASL', sasl.found())
+config_host_data.set('CONFIG_VIRTFS', have_virtfs)
 config_host_data.set('CONFIG_XKBCOMMON', xkbcommon.found())
 config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
@@ -1105,7 +1125,7 @@ host_kconfig = \
   ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
   ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=y'] : []) + \
   ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
-  ('CONFIG_VIRTFS' in config_host ? ['CONFIG_VIRTFS=y'] : []) + \
+  (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : [])
 
@@ -2294,7 +2314,7 @@ summary_info += {'mingw32 support':   targetos == 'windows'}
 summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
 summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
 summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
-summary_info += {'VirtFS support':    config_host.has_key('CONFIG_VIRTFS')}
+summary_info += {'VirtFS support':    have_virtfs}
 summary_info += {'build virtiofs daemon': have_virtiofsd}
 summary_info += {'Multipath support': mpathpersist.found()}
 summary_info += {'VNC support':       vnc.found()}
diff --git a/meson_options.txt b/meson_options.txt
index 1854a9639f..59a8a50e5b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -90,10 +90,6 @@ option('vnc_sasl', type : 'feature', value : 'auto',
        description: 'SASL authentication for VNC server')
 option('xkbcommon', type : 'feature', value : 'auto',
        description: 'xkbcommon support')
-option('virtiofsd', type: 'feature', value: 'auto',
-       description: 'build virtiofs daemon (virtiofsd)')
-option('vhost_user_blk_server', type: 'feature', value: 'auto',
-       description: 'build vhost-user-blk server')
 option('zstd', type : 'feature', value : 'auto',
        description: 'zstd compression support')
 option('fuse', type: 'feature', value: 'auto',
@@ -101,6 +97,13 @@ option('fuse', type: 'feature', value: 'auto',
 option('fuse_lseek', type : 'feature', value : 'auto',
        description: 'SEEK_HOLE/SEEK_DATA support for FUSE exports')
 
+option('vhost_user_blk_server', type: 'feature', value: 'auto',
+       description: 'build vhost-user-blk server')
+option('virtfs', type: 'feature', value: 'auto',
+       description: 'virtio-9p support')
+option('virtiofsd', type: 'feature', value: 'auto',
+       description: 'build virtiofs daemon (virtiofsd)')
+
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
        description: 'Whether and how to find the capstone library')
-- 
2.29.2



