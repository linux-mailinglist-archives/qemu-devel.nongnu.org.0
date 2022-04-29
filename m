Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E05514FEC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:52:36 +0200 (CEST)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSv5-00089z-Fm
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSy-0002Np-65
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:32 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSw-0006Ai-JP
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:31 -0400
Received: by mail-ed1-x536.google.com with SMTP id be20so9446432edb.12
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zIP/FpIDyeAUa2Urappf0zBnARGkdksC+WXOMtSPtO0=;
 b=D/C8hGNe7HNYTD68BrrmSM7XINo96GeeR5VX+I7FyM8Uqt3TBTo7CG8/CD8wTupaNI
 GMHPBPxoQ4ThohfgOuPlz0dfL34t6b3RHRbZ0H5qMVjCyEGZdLdHVGfXXiPAh3g1n9g2
 CgAgSnpXqyM+3CD+7OLo3+XADn6uoz/TSL770Bk2RS+Q5jMZcUxDXZUr6klCzoaUctuo
 MUzwNe1+pQuZYcLc/S1jsjEi5LxdBHRWefxERPsN7MZaXUocE61G1I/w7dcMNTTVpVS3
 OZsUPAOTo4hufZzn8cxDIY5gcMaayQkU6k/7efuQRSNmDNLreAkDg37Ji7+cD1Fexqln
 6WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zIP/FpIDyeAUa2Urappf0zBnARGkdksC+WXOMtSPtO0=;
 b=vVXec5zHXjSLesIKcNSDNb4ETzDsB8zLTVmai4GrRkGHdLgsstlYxvKSXR5OHgev1d
 o/MeBW+xwP+zGwESfSyVi0wycGcFcGEWlrmf/k98h6DAyCMFdQ3nahaZifa9NqxRRW+R
 N7CdnYtI0v4SMGe0t8+pCVaJX16/wkzSXs0Z2VrXSzFEhxtYrglRlEMa/EJClZa5x97T
 2iK6nhDU1grSD3tZUGwR1KloF3a11Ycqpvl6lVSmNjpvaTWaL78iFCp2vA3k2SoOnX+s
 uA9/ahBF6yukohLFgENJVQJcwLQTxHXV9svX0XNSYkE8ODFBgzQs/9XvBghmOTWgqJDw
 EJbw==
X-Gm-Message-State: AOAM5300WvgEQhQeK8VleyEXqkKtDLASrWXOOr9X06QYbTmxTiO+DnUE
 WRuc87JVhsZgfy6hQH98+g2b64SejdY0TA==
X-Google-Smtp-Source: ABdhPJzPPLkktQXtFzRVuBl+DgVFk6JNC+QKeY6Frj95+Cs10cie9QpBknBWE4KsELUJ3NwuRvMczw==
X-Received: by 2002:a50:d65c:0:b0:425:ea34:7dd7 with SMTP id
 c28-20020a50d65c000000b00425ea347dd7mr27002673edj.18.1651245809241; 
 Fri, 29 Apr 2022 08:23:29 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/25] build: move vhost-vsock configuration to Kconfig
Date: Fri, 29 Apr 2022 17:23:06 +0200
Message-Id: <20220429152312.335715-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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

vhost-vsock and vhost-user-vsock are two devices of their own; it should
be possible to enable/disable them with --without-default-devices, not
--without-default-features.  Compute their default value in Kconfig to
obtain the more intuitive behavior.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 16 ----------------
 hw/virtio/Kconfig | 10 ++++++++++
 meson.build       |  1 -
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index d6ddd4f05f..603434fc7f 100755
--- a/configure
+++ b/configure
@@ -286,7 +286,6 @@ vhost_kernel="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
 vhost_scsi="$default_feature"
-vhost_vsock="$default_feature"
 vhost_user="no"
 vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
@@ -879,10 +878,6 @@ for opt do
   ;;
   --enable-vhost-scsi) vhost_scsi="yes"
   ;;
-  --disable-vhost-vsock) vhost_vsock="no"
-  ;;
-  --enable-vhost-vsock) vhost_vsock="yes"
-  ;;
   --disable-vhost-user-fs) vhost_user_fs="no"
   ;;
   --enable-vhost-user-fs) vhost_user_fs="yes"
@@ -1109,7 +1104,6 @@ cat << EOF
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
   vhost-net       vhost-net kernel acceleration support
-  vhost-vsock     virtio sockets device support
   vhost-scsi      vhost-scsi kernel target support
   vhost-crypto    vhost-user-crypto backend support
   vhost-kernel    vhost kernel backend support
@@ -1549,10 +1543,6 @@ test "$vhost_scsi" = "" && vhost_scsi=$vhost_kernel
 if test "$vhost_scsi" = "yes" && test "$vhost_kernel" != "yes"; then
   error_exit "--enable-vhost-scsi requires --enable-vhost-kernel"
 fi
-test "$vhost_vsock" = "" && vhost_vsock=$vhost_kernel
-if test "$vhost_vsock" = "yes" && test "$vhost_kernel" != "yes"; then
-  error_exit "--enable-vhost-vsock requires --enable-vhost-kernel"
-fi
 
 # vhost-user backends
 test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
@@ -2105,12 +2095,6 @@ fi
 if test "$vhost_crypto" = "yes" ; then
   echo "CONFIG_VHOST_CRYPTO=y" >> $config_host_mak
 fi
-if test "$vhost_vsock" = "yes" ; then
-  echo "CONFIG_VHOST_VSOCK=y" >> $config_host_mak
-  if test "$vhost_user" = "yes" ; then
-    echo "CONFIG_VHOST_USER_VSOCK=y" >> $config_host_mak
-  fi
-fi
 if test "$vhost_kernel" = "yes" ; then
   echo "CONFIG_VHOST_KERNEL=y" >> $config_host_mak
 fi
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index c144d42f9b..b642ae1081 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -59,6 +59,16 @@ config VIRTIO_MEM
     depends on VIRTIO_MEM_SUPPORTED
     select MEM_DEVICE
 
+config VHOST_VSOCK
+    bool
+    default y
+    depends on VIRTIO && VHOST_KERNEL
+
+config VHOST_USER_VSOCK
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
+
 config VHOST_USER_I2C
     bool
     default y
diff --git a/meson.build b/meson.build
index 7c52ef135c..8621f84916 100644
--- a/meson.build
+++ b/meson.build
@@ -3691,7 +3691,6 @@ summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNE
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
 summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
-summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
-- 
2.35.1



