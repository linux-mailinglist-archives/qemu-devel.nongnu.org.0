Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D647851B023
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:09:53 +0200 (CEST)
Received: from localhost ([::1]:47272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMFs-00032p-MA
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmMCa-0006Pk-CW
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:06:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmMCY-0007AZ-MW
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651698385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2DsmhxEVt7RD587klYO8QUQ4fKSDrwlm8IBbwh9qZyQ=;
 b=cTHw+Z4TnEMGlBiL5nBpefnTnunRI27u28zdvCkhR2C0c55hgOO+WMpDX+aElLJtjorBHF
 TknIYWXCGs7KRBJhKS/Vtu74PZHZMTeID9DswDJc8Xy7UkQW1a1e1ZVuRaxp/+6N7fnIgN
 g+h5eRDBA24ofcmGt4Xd+T42zmmdiE0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-W0Y-WWdnPwyMJs0atim_XQ-1; Wed, 04 May 2022 17:06:24 -0400
X-MC-Unique: W0Y-WWdnPwyMJs0atim_XQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 hq12-20020a1709073f0c00b006f48c335617so1520940ejc.2
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 14:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2DsmhxEVt7RD587klYO8QUQ4fKSDrwlm8IBbwh9qZyQ=;
 b=4ONCO5M4xLz9tgu5NGWGmWO2EYXbG5bpC8XxMs1KfSt94BOP+GmSbho51i7PuoyjfI
 mAFTxLES3sXI0Qmwnn4OR/5WOOPwkmVORfCD6XsaEHXHkQ61Zhg8IRF9CkIaSmEUU3x9
 OnOcpWAMAF4L2SqSu5kNVXKwjB54j0cY72TILhSqDq6duLQX4Fr1526dHld3em20B4RR
 iCTmbRSSWgPNPJom24tYiMSy+PfpwlAbZC8hf6a+lsytOIhtbqK2chOF1zXryyqfjGlq
 9Jqx8H5Em595eOwQ05uIoGvmyheegGt26ZMuBRZ1pOwZLMxxOg5ZbHOP9Mr7iQe1/vjH
 Y7+Q==
X-Gm-Message-State: AOAM531YCOWGgj8waIv4cU/QPWrSr4KUR9SP8bXlYNJ40hMhQ7wRwjXO
 TxNHR3PxdtRysKOrcBZ5KgbBqJ6c2XTQieixJH0eiPxnJJK5gwlQ4GpOuvyuufM+Mdvg/a5A3ZU
 6ubGFVarxX/q81ypRDcUADQCuJw9EU08OOTaNy4rl2Hy+i2QpjFirZw7kBRdyQPS1jrk=
X-Received: by 2002:a17:907:6e1c:b0:6f4:487c:5ec3 with SMTP id
 sd28-20020a1709076e1c00b006f4487c5ec3mr15231192ejc.210.1651698382746; 
 Wed, 04 May 2022 14:06:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzC7kHYYWkVa77U1Zyr/h86pCwQIQjV5U3Bu/i5fMsqbxI8zmfUZI4yVei7AMaP6KzZBkzxA==
X-Received: by 2002:a17:907:6e1c:b0:6f4:487c:5ec3 with SMTP id
 sd28-20020a1709076e1c00b006f4487c5ec3mr15231173ejc.210.1651698382494; 
 Wed, 04 May 2022 14:06:22 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 c19-20020aa7d613000000b0042617ba638bsm9704969edr.21.2022.05.04.14.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:06:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 19/25] build: move vhost-vsock configuration to Kconfig
Date: Wed,  4 May 2022 23:06:15 +0200
Message-Id: <20220504210615.680072-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504210615.680072-1-pbonzini@redhat.com>
References: <20220504210615.680072-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

vhost-vsock and vhost-user-vsock are two devices of their own; it should
be possible to enable/disable them with --without-default-devices, not
--without-default-features.  Compute their default value in Kconfig to
obtain the more intuitive behavior.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                       | 16 ----------------
 hw/virtio/Kconfig                               | 10 ++++++++++
 meson.build                                     |  1 -
 scripts/ci/org.centos/stream/8/x86_64/configure |  2 --
 4 files changed, 10 insertions(+), 19 deletions(-)

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
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index 08225ee514..e6ac2e5877 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/configure
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -136,7 +136,6 @@
 --disable-vhost-user \
 --disable-vhost-user-blk-server \
 --disable-vhost-vdpa \
---disable-vhost-vsock \
 --disable-virglrenderer \
 --disable-virtfs \
 --disable-virtiofsd \
@@ -198,7 +197,6 @@
 --enable-vhost-user \
 --enable-vhost-user-blk-server \
 --enable-vhost-vdpa \
---enable-vhost-vsock \
 --enable-vnc \
 --enable-png \
 --enable-vnc-sasl \
-- 
2.35.1


