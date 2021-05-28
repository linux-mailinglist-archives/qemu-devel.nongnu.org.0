Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108853945F0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 18:32:59 +0200 (CEST)
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmfPt-0005oi-TB
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 12:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmfOV-00056S-Bm
 for qemu-devel@nongnu.org; Fri, 28 May 2021 12:31:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmfOS-0001bx-QY
 for qemu-devel@nongnu.org; Fri, 28 May 2021 12:31:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id n4so3891334wrw.3
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 09:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Twe5NygAd7RxUtKnZiyqPZSZMsu5AWUKgEuyMuFUC7g=;
 b=J/KUZY2p8sxKYw8Qfv3YugmpCbGdFeUV+5MStA1VSI3L3Q9hWq3jByba93ceNTa9OQ
 Y6G+CIkteNegals2Gs5XsW1jbU8LIRY5N/zbArren2UoA5pP6LxDYQT19J26g/KOABmR
 vJxDazuas7v5wlDRFOz6JacXEpuGNAIVNtgOrZBjbnSKFImO4pxqghhPrl0HWGsQ28ir
 zRbLcfvCdQSVtRmfhnPwzKjm3ALCgd9lWCgMe8cd82EBjWMElk2//n9hP6dtiCRql18r
 GO6bLkTtOoY5S7q3sn/HXW8D5RnoWKqF64PvoaVPAgqWJDxPFuRHJMhlgFtwxIz3BJ37
 RFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Twe5NygAd7RxUtKnZiyqPZSZMsu5AWUKgEuyMuFUC7g=;
 b=kfR9YH72npkpY0Qt5Fe//YSJfQtFUgJJYuFOfK12xZ5llRNzkjxHvE613I73iqVRsX
 BXswx5FttFjeKoIvH0+6xIuRCn3jyrq7ms9cP51z1wn7uF/VpMYESavTYpM7nSV0MTLN
 7vXYtkgd1awweAHta+D+LnJEpQik2MwxrRmiUGHnU19pFonxzW7KjmDQ7hVY1WdAGdn1
 PM5FwS1aoCDCUT2OiAwTfo7vV5uD3znpaJqEOuKX7TdGEU9w5GN9EApVAGKh3DIG3jvK
 x0LIXTpHbtFr3d694rMxWVRt/Ci+44npwZkXRq4E9jH2ozWNs4K+cSDApuBDIJh3SFYn
 2NcA==
X-Gm-Message-State: AOAM5323mtCcywkkaTrFlVWqk/2xnytbtFPPWWZhoZDgMVw92Jnkb17h
 iRnNPpXBqRjKFH9H1mcKnKLy2Q==
X-Google-Smtp-Source: ABdhPJxL7H6eehkuSQpWmB+0gr14qpb1Jxm9RMxD3IRTWyjWLqUNev8sWgyOPHWbXYfvO7wNU9FxqA==
X-Received: by 2002:a05:6000:511:: with SMTP id
 a17mr9649774wrf.351.1622219486114; 
 Fri, 28 May 2021 09:31:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m9sm7431961wrq.78.2021.05.28.09.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 09:31:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4325F1FF7E;
 Fri, 28 May 2021 17:31:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] configure: allow the overriding of default-config in the
 build
Date: Fri, 28 May 2021 17:31:16 +0100
Message-Id: <20210528163116.31902-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 f4bug@amsat.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the default config works well enough it does end up enabling a
lot of stuff. For more minimal builds we can pass a slimmed down list
of devices and let Kconfig work out what we want. For example:

  ../../configure --without-default-features \
    --target-list=arm-softmmu,aarch64-softmmu \
    --with-devices-aarch64=(pwd)/../../configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak

will override the aarch64-softmmu default devices to one of our own
choosing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                        | 16 ++++++++++++++++
 .../aarch64-softmmu-64bit-only.mak               | 10 ++++++++++
 meson.build                                      |  3 ++-
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak

diff --git a/configure b/configure
index 90c0807347..5acb8b2ed5 100755
--- a/configure
+++ b/configure
@@ -921,6 +921,12 @@ for opt do
   ;;
   --without-default-devices) default_devices="false"
   ;;
+  --with-devices-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --with-devices-cc-FOO option"
+  ;;
+  --with-devices-*)  device_arch=${opt#--with-devices-}; device_arch=${device_arch%%=*}
+                     device_archs="$device_archs $device_arch"
+                     eval "devices_${device_arch}=\$optarg"
+  ;;
   --without-default-features) # processed above
   ;;
   --enable-gprof) gprof="yes"
@@ -1767,6 +1773,7 @@ Advanced options (experts only):
   --without-default-devices  do not include any device that is not needed to
                            start the emulator (only use if you are including
                            desired devices in default-configs/devices/)
+  --with-devices-ARCH=PATH override default-configs/devices with your own file
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --enable-tsan            enable thread sanitizer
@@ -6378,6 +6385,15 @@ if test "$skip_meson" = no; then
 
   echo "# Automatically generated by configure - do not modify" > $cross
   echo "[properties]" >> $cross
+
+  # unroll any custom device configs
+  if test -n "$device_archs"; then
+      for a in $device_archs; do
+          eval "c=\$devices_${a}"
+          echo "${a}-softmmu = [ '$c' ]" >> $cross
+      done
+  fi
+
   test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
   echo "c_args = [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross
diff --git a/configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak b/configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak
new file mode 100644
index 0000000000..3626de9e3c
--- /dev/null
+++ b/configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak
@@ -0,0 +1,10 @@
+#
+# A version of the config that only supports 64bits and their devices.
+# This doesn't quite eliminate all 32 bit devices as some boards like
+# "virt" support both.
+#
+
+CONFIG_ARM_VIRT=y
+CONFIG_XLNX_ZYNQMP_ARM=y
+CONFIG_XLNX_VERSAL=y
+CONFIG_SBSA_REF=y
diff --git a/meson.build b/meson.build
index 3f065f53f2..656ebde513 100644
--- a/meson.build
+++ b/meson.build
@@ -1350,9 +1350,10 @@ foreach target : target_dirs
                                                configuration: config_target_data)}
 
   if target.endswith('-softmmu')
+    config_input = meson.get_external_property(target, 'default-configs/devices' / target + '.mak')
     config_devices_mak = target + '-config-devices.mak'
     config_devices_mak = configure_file(
-      input: ['default-configs/devices' / target + '.mak', 'Kconfig'],
+      input: [config_input, 'Kconfig'],
       output: config_devices_mak,
       depfile: config_devices_mak + '.d',
       capture: true,
-- 
2.20.1


