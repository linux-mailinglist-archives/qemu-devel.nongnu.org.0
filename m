Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1538350CA94
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:27:04 +0200 (CEST)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFmw-0008GY-Ab
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFG3-0007Vy-Tz
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:53:05 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFy-0005Dz-Qj
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:53:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id y10so21133871ejw.8
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZNRX3H15aUSHjnvlph2zsvIxMGJo5fkoDDNDKWVA9tA=;
 b=YSUHSSAx468QIylbKAlzibfIp98uravmF26O3zRZNP/NtOvnX3ACNaUGYdzxzfDJC5
 ntJey9cegbgNOPt04NAW6dBSbnjX3g985YsM1NR2KO5gpSYjwkFgVm1j2ck+7X5E9lOL
 yg2hM8V4mSo8jSwn8+OrUu83XhS4LxZZg2MKUrrccr1i49SwbFXaCf5WRxAriw8JN4iQ
 jiIfUTCNDGsd1rfF9JlbExpXVkVIUzFPzkUCGHoYwbAZkP5fdyFHdB6Krcx2fUv0gT/f
 nyR5cs6hvkWftnFxUx4QqASpbP0lZLJhJG/xaULMe7szGncbpPo6isyUwYVpDQUmwC/+
 MTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZNRX3H15aUSHjnvlph2zsvIxMGJo5fkoDDNDKWVA9tA=;
 b=I7tL65pXfvJyCMXcdTOifOT1uzMcAIaJyEBNquKIQB2eCErRtJU9OkJD8zYIdileBx
 tzeuaU+hm5V3apiQjruf1Ft35RKe1aHViJXoK+EPukyJzQu/SFfHmZAyWSfBIUeJ7jm4
 JW3lOTq93vZEbsnH+rClFIQVDcIKa/zEmgYzr73Kwm3azhQvZleM4HwUhvTDOFsPphDU
 oIgQJUsrBRIRTX6Kxz4d8i2TFlSPdTFigM7btzF4u1UL5KhBHbywcM+uvJbyFc4FFMhN
 92EMhHEWU6LIMHryp5JLegaLXjnfXGDXaE+zXJtMMiVveeZwI4LG55KfgPVvgRgvv7Jp
 Bvxg==
X-Gm-Message-State: AOAM532B2swaaNQ2HEd7Mm+KTVhFgbHGgQb7/YY3/JAXzDGAlr+pST9Y
 BPGq2ZR03ZwlJ3HnctaeSDfUpRnKs8xCSw==
X-Google-Smtp-Source: ABdhPJyDbWaEoAI69ZXE+emmcU1fmtlHiFB/sMwGK9qb1BvAbLuMtUoHo6k8WoW35myAYFsKiO0g6w==
X-Received: by 2002:a17:906:1841:b0:6e8:872d:8999 with SMTP id
 w1-20020a170906184100b006e8872d8999mr8137524eje.492.1650718377627; 
 Sat, 23 Apr 2022 05:52:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/34] build: move vhost-scsi configuration to Kconfig
Date: Sat, 23 Apr 2022 14:51:47 +0200
Message-Id: <20220423125151.27821-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-scsi and vhost-user-scsi are two devices of their own; it should
be possible to enable/disable them with --without-default-devices, not
--without-default-features.  Compute their default value in Kconfig to
obtain the more intuitive behavior.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                       | 15 ---------------
 hw/scsi/Kconfig                 |  5 +++++
 include/hw/virtio/virtio-scsi.h |  2 --
 meson.build                     |  1 -
 4 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index 18b18a6551..ceef39a615 100755
--- a/configure
+++ b/configure
@@ -285,7 +285,6 @@ EXTRA_LDFLAGS=""
 vhost_kernel="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
-vhost_scsi="$default_feature"
 vhost_user="no"
 vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
@@ -873,10 +872,6 @@ for opt do
   ;;
   --enable-vhost-crypto) vhost_crypto="yes"
   ;;
-  --disable-vhost-scsi) vhost_scsi="no"
-  ;;
-  --enable-vhost-scsi) vhost_scsi="yes"
-  ;;
   --disable-vhost-user-fs) vhost_user_fs="no"
   ;;
   --enable-vhost-user-fs) vhost_user_fs="yes"
@@ -1103,7 +1098,6 @@ cat << EOF
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
   vhost-net       vhost-net kernel acceleration support
-  vhost-scsi      vhost-scsi kernel target support
   vhost-crypto    vhost-user-crypto backend support
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
@@ -1537,12 +1531,6 @@ if test "$vhost_kernel" = "yes" && test "$linux" != "yes"; then
   error_exit "vhost-kernel is only available on Linux"
 fi
 
-# vhost-kernel devices
-test "$vhost_scsi" = "" && vhost_scsi=$vhost_kernel
-if test "$vhost_scsi" = "yes" && test "$vhost_kernel" != "yes"; then
-  error_exit "--enable-vhost-scsi requires --enable-vhost-kernel"
-fi
-
 # vhost-user backends
 test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
 if test "$vhost_crypto" = "yes" && test "$vhost_user" = "no"; then
@@ -2079,9 +2067,6 @@ if test "$modules" = "yes"; then
   echo "CONFIG_MODULES=y" >> $config_host_mak
 fi
 
-if test "$vhost_scsi" = "yes" ; then
-  echo "CONFIG_VHOST_SCSI=y" >> $config_host_mak
-fi
 if test "$vhost_net" = "yes" ; then
   echo "CONFIG_VHOST_NET=y" >> $config_host_mak
 fi
diff --git a/hw/scsi/Kconfig b/hw/scsi/Kconfig
index 77d397c949..e7b34dc8e2 100644
--- a/hw/scsi/Kconfig
+++ b/hw/scsi/Kconfig
@@ -48,6 +48,11 @@ config VIRTIO_SCSI
     depends on VIRTIO
     select SCSI
 
+config VHOST_SCSI
+    bool
+    default y
+    depends on VIRTIO && VHOST_KERNEL
+
 config VHOST_USER_SCSI
     bool
     # Only PCI devices are provided for now
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 543681bc18..0997313f0a 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -55,10 +55,8 @@ struct VirtIOSCSIConf {
     bool seg_max_adjust;
     uint32_t max_sectors;
     uint32_t cmd_per_lun;
-#ifdef CONFIG_VHOST_SCSI
     char *vhostfd;
     char *wwpn;
-#endif
     CharBackend chardev;
     uint32_t boot_tpgt;
     IOThread *iothread;
diff --git a/meson.build b/meson.build
index a2de079801..ac1a8fd4e7 100644
--- a/meson.build
+++ b/meson.build
@@ -3688,7 +3688,6 @@ summary_info += {'QOM debugging':     get_option('qom_cast_debug')}
 summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
-summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
-- 
2.35.1



