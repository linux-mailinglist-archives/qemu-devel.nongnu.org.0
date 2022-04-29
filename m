Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D18514FFE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:54:50 +0200 (CEST)
Received: from localhost ([::1]:50970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSxF-0004jA-7B
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSz-0002QB-9C
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:39 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSx-0006Aw-Id
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:33 -0400
Received: by mail-ej1-x62e.google.com with SMTP id dk23so16094508ejb.8
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/18lXHZZ+IfJB2of/Nxw+vWT4xDhKdMnNhc/M3EslhI=;
 b=MZW8nictPiVq4XudMnBnWhL4URutv730x/qXBfgoiymkj+LoAzaw3QVlaMIozGAH7+
 gaD2fwHYgAIMcc5DTCABKvR3jt/axcluOiHbkmTgmNgSaiZNVWecNgANRiIv4dX4ac9q
 tpsxggemEaNyeRR0arstsBF8hYKYMx8ly6APJ0VvKKhlk2lJrJxC3JA3MeYfNS2YY3D3
 y28eV7/TCCP7SdIjYi9uYpkEl6256mnYPuFinKHRUlku9M3x7VEGloHtWQtIy6FvmrNF
 PW1WDEtcPVlkQXBw0A/hnsv1xOygwIvYa6N0hSWOyCeZnVsQ+GhTlzcIBnaeeH4jfyXa
 jlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/18lXHZZ+IfJB2of/Nxw+vWT4xDhKdMnNhc/M3EslhI=;
 b=xCuRlxYT6nPErM8AtbB+xIEV5wO8pvWynUXiP6cW6kRP2xG1xD6kZoxH+ZynlkhC0b
 OUqJhQ8qmKCf+7gqz6SfZ8NIhcMwOu3F0e3aPhhyXQqFmUnbHY/6r02RnkSOnsiNXRwp
 gWeFbRxYeQArnvan60bvBTkeYKnlCnBqcSxSNskzJHdna/tBN80BMQ2R108/CLU8vpiI
 ni8aRCmnsVJ7cmImDOTndg8Kk9l4rC/jFHrFEv1A4vVGbuXlXekUUHrFsmsA0Dxq9172
 Pomr/5DY7M08ctZcxyAqVB+O5csOxnR57QWnkiJj5Ynki7KRMoqHD6OjUON6sp/T9KeC
 zdiQ==
X-Gm-Message-State: AOAM532+GswyR7b+PLRIi1tvytceJo1HdeczD30ht84L6JRXMCiejvjt
 e9+4KgBVQjd3wWx60/dUvsChNOer3Dp0/A==
X-Google-Smtp-Source: ABdhPJxw3j4+76UsS8rKXnTtXM57Siak17t5FT+FMhADVA4LvUzh4s8pc+fx9EkvnsUhgeIbyDx1Xg==
X-Received: by 2002:a17:906:948:b0:6d6:e479:1fe4 with SMTP id
 j8-20020a170906094800b006d6e4791fe4mr36274166ejd.240.1651245810244; 
 Fri, 29 Apr 2022 08:23:30 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/25] build: move vhost-scsi configuration to Kconfig
Date: Fri, 29 Apr 2022 17:23:07 +0200
Message-Id: <20220429152312.335715-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
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
index 603434fc7f..d268a9cf49 100755
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
@@ -874,10 +873,6 @@ for opt do
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
@@ -1104,7 +1099,6 @@ cat << EOF
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
   vhost-net       vhost-net kernel acceleration support
-  vhost-scsi      vhost-scsi kernel target support
   vhost-crypto    vhost-user-crypto backend support
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
@@ -1538,12 +1532,6 @@ if test "$vhost_kernel" = "yes" && test "$linux" != "yes"; then
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
@@ -2080,9 +2068,6 @@ if test "$modules" = "yes"; then
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
index 8621f84916..db585832a4 100644
--- a/meson.build
+++ b/meson.build
@@ -3690,7 +3690,6 @@ summary_info += {'QOM debugging':     get_option('qom_cast_debug')}
 summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
-summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
-- 
2.35.1



