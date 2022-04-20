Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310B2508D2A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:24:02 +0200 (CEST)
Received: from localhost ([::1]:58300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhD7Z-0004T9-A9
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCM5-00029M-ON
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:58 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCM3-00011k-Um
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:57 -0400
Received: by mail-wr1-x431.google.com with SMTP id g18so2768337wrb.10
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tklFHVdjTCpGYEV3/SiOWASQte8kP1y3oT2mjbpxLNc=;
 b=n9Rgwkl6rAhbJgk7g0KN6M/9lycDUF3G26QSeA0dIPCeVCVB7PB48SmO3Biwc051Xv
 /pAX2WN+j8X+Cos1KgusreVKf9w9NZ1X/7MRSyJBgT+iE0JSVMGamwnh6qLVh1z7qTqU
 zr1z+y/gTRVwitevfoKeLyOQtnTf5bwsfcuLsxdS0x8fhdiFJpK171Ev8JPE869twM8C
 ABG2brcY2ggO5wC6SrVpxApDQxDWIHVBp2Z72qabINRs8e3Ek80V8ANF4sNEciiAMKy6
 PcwuUcfU6Zn+1xcAVrv/kaRMsD3S32pubhgWM8AN/Lqx680+0ZUIzWkexHaOdNyAIUjS
 cvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tklFHVdjTCpGYEV3/SiOWASQte8kP1y3oT2mjbpxLNc=;
 b=XRuZtp9jCqaLj7ycAPxXR+7dM0NHpLHa6CbH80/zi4x8vBh/vWzazBh73nLXbcrSIK
 OdzrAJDrXQqae4kSJ0uVeUZJ6g1fT+lOJ2iqB3HhG8rIcLxBKkIrPQokx39HDg6iqBtk
 z4c0QPKXeAgP71djppthQUD7gpsoE1qol2Psh02zY9x8CPCqPjT67E1LY2L4784pkQu+
 14RiOjg6ASf7Y6dEJmTK3yLftYymgJJqczDnrIrN/EZQZGlYsf2WRiqR1+efFdlShiEc
 Ih0KLl2H3qKTVYXsmAKo7Hs3cewsbCv5QSmIU3lu7QHVyT5VDy56w7OtP2A90DBmaIuU
 oGMw==
X-Gm-Message-State: AOAM5305CcRuiuX7JDYVRDKzpMy3ar1ThUcOCLeZUf5k4G+Ka6b7RXPR
 +60xqFpVfq7wodxzdN8n35Ve7a/rih39TQ==
X-Google-Smtp-Source: ABdhPJxb0RZX/4mA3c5AoxNX7Ig/u7OTWm1wRJ0C1twDCRjb11l0lm+RIiaT9P6QlE5E/DjjVLestA==
X-Received: by 2002:adf:eece:0:b0:20a:7bc8:d51 with SMTP id
 a14-20020adfeece000000b0020a7bc80d51mr16837761wrp.339.1650468894590; 
 Wed, 20 Apr 2022 08:34:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/34] build: move vhost-scsi configuration to Kconfig
Date: Wed, 20 Apr 2022 17:34:03 +0200
Message-Id: <20220420153407.73926-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-scsi and vhost-user-scsi are two devices of their own; it should
be possible to enable/disable them with --without-default-devices, not
--without-default-features.  Compute their default value in Kconfig to
obtain the more intuitive behavior.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                       | 15 ---------------
 hw/scsi/Kconfig                 |  5 +++++
 include/hw/virtio/virtio-scsi.h |  2 --
 meson.build                     |  1 -
 4 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index a3b57877e5..65ae2c0c1f 100755
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
index 033d0c9aa1..b18731ee84 100644
--- a/meson.build
+++ b/meson.build
@@ -3677,7 +3677,6 @@ summary_info += {'QOM debugging':     get_option('qom_cast_debug')}
 summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
-summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
-- 
2.35.1



