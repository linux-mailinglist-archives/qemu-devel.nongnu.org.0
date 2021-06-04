Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51A39BE74
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:19:49 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDU5-0007Kp-2L
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkz-0000XQ-E2
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkl-0002EP-6G
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h8so9890538wrz.8
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=79gl5zIRvGor1ajCQ3OtdQMP/o/iWQG5y8hlHOshVx0=;
 b=cosZHVJqYiqSsO9gtZOu09LMFBHi+HLcGtBn5yfdWzeHis1OzWVeByF6tT5Y4BFCiN
 BwVTmlOfN/yXWllQXCtdz662amm44Eyhdc0BspAljUgGIP9ZqmGXsMS6GTzr7FZUzW94
 97NbSlcZ8U9wkoELJK0DyqsXC3XaeRHJkgjMnvmGZ7mdpo2Miq4FaIUrz+YUv7DTDdC7
 InMOdFXh53CB0snTkE/6CdNx2XPuiJn+C5wQj4CJVVBsrbz/K7L1i91SZT4V2LKDw3Jy
 5+eTbY+XlXfHrxGJCQwa3hJWjc9f+DXzjPjy6HRkkEB6MkMnT5cL0YE8oVSzu3bUoG+Q
 FJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=79gl5zIRvGor1ajCQ3OtdQMP/o/iWQG5y8hlHOshVx0=;
 b=ezVTEoy0ko8B/Pwzmi8cjOgV9CXDOsi9p5n++6RHAMcdAtO6T+wlUi6InD14mkbyuS
 7iz9lrJKgRfbArAROZ6Ph7qOzaA2ueNbVIaP00jYRtK8XQwGtCjdX8zGuH8L1xAoN6/3
 aKZWUBhuI+VcgidP91QbHyWd/PCW5tA8lu1f+GXzU2u+6TR3VvXcURaXVRIiG02hKEjb
 xEqJ/pgO9TWEH1Ndir185h5nhDjqX1zlcDooZReW66BZe6Kysu8XTPsIMm1q0mciHcvj
 UEJi39ivkVOai2Lz+8V8vZcxNyd0oIKulbiXmU9z6BCz23Cu5eFdfvrS5vrQVIW7R+HT
 A07w==
X-Gm-Message-State: AOAM532iO9U2Th6cLp8DJvQni6eCIGvWY4kJv0bH2+wQOcTuzUt6hDBT
 ilotZkXc4aCeeEFZLmwiymWK1Q==
X-Google-Smtp-Source: ABdhPJwaoKH+g3X9d/mVql5khmtAzEGja+y/sgp8ABUT3sxlOo8mIaYKx/i/GVsLHSjk2RiKoikJww==
X-Received: by 2002:a05:6000:1b8f:: with SMTP id
 r15mr4696767wru.119.1622824377325; 
 Fri, 04 Jun 2021 09:32:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z188sm6319988wme.38.2021.06.04.09.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C857720025;
 Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 98/99] configure: allow the overriding of default-config
 in the build
Date: Fri,  4 Jun 2021 16:53:11 +0100
Message-Id: <20210604155312.15902-99-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the default config works well enough it does end up enabling a
lot of stuff. For more minimal builds we can pass a slimmed down list
of devices and let Kconfig work out what we want. For example:

  ../../configure --without-default-features \
    --target-list=arm-softmmu,aarch64-softmmu \
    --with-devices-aarch64=(pwd)/../../configs/aarch64-softmmu/64bit-only.mak

will override the aarch64-softmmu default devices to one of our own
choosing. Currently there are two configs provided:

  - 64bit-only, to build without any 32 bit boards at all
  - virt, even more minimal set for --disable-tcg builds

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210528163116.31902-1-alex.bennee@linaro.org>

---
v2
  - remove extraneous cc
  - dropped pathname from config
  - add virt.mak config
  - drop ZYNQMP from the 64bit only build
  - test -f the --with-devices-FOO file
---
 configure                              | 20 ++++++++++++++++++++
 configs/aarch64-softmmu/64bit-only.mak | 10 ++++++++++
 configs/aarch64-softmmu/virt-only.mak  |  8 ++++++++
 meson.build                            |  3 ++-
 4 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 configs/aarch64-softmmu/64bit-only.mak
 create mode 100644 configs/aarch64-softmmu/virt-only.mak

diff --git a/configure b/configure
index f0c8629dc6..5bf2f56ac6 100755
--- a/configure
+++ b/configure
@@ -920,6 +920,16 @@ for opt do
   ;;
   --without-default-devices) default_devices="false"
   ;;
+  --with-devices-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --with-devices-FOO option"
+  ;;
+  --with-devices-*) device_arch=${opt#--with-devices-}; device_arch=${device_arch%%=*}
+                    if test -f "$optarg"; then
+                        device_archs="$device_archs $device_arch"
+                        eval "devices_${device_arch}=\$optarg"
+                    else
+                         error_exit "File $optarg does not exist"
+                    fi
+  ;;
   --without-default-features) # processed above
   ;;
   --enable-gprof) gprof="yes"
@@ -1766,6 +1776,7 @@ Advanced options (experts only):
   --without-default-devices  do not include any device that is not needed to
                            start the emulator (only use if you are including
                            desired devices in default-configs/devices/)
+  --with-devices-ARCH=PATH override default-configs/devices with your own file
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --enable-tsan            enable thread sanitizer
@@ -6343,6 +6354,15 @@ if test "$skip_meson" = no; then
 
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
diff --git a/configs/aarch64-softmmu/64bit-only.mak b/configs/aarch64-softmmu/64bit-only.mak
new file mode 100644
index 0000000000..19638a56cf
--- /dev/null
+++ b/configs/aarch64-softmmu/64bit-only.mak
@@ -0,0 +1,10 @@
+#
+# A version of the config that only supports 64bits and their devices.
+# This doesn't quite eliminate all 32 bit devices as some boards like
+# "virt" support both. The CONFIG_XLNX_ZYNQMP_ARM isn't included as it
+# also requires 32 bit support for the R5s
+#
+
+CONFIG_ARM_VIRT=y
+CONFIG_XLNX_VERSAL=y
+CONFIG_SBSA_REF=y
diff --git a/configs/aarch64-softmmu/virt-only.mak b/configs/aarch64-softmmu/virt-only.mak
new file mode 100644
index 0000000000..cadacf3e89
--- /dev/null
+++ b/configs/aarch64-softmmu/virt-only.mak
@@ -0,0 +1,8 @@
+#
+# A version of the config that only supports virtual machines. This is
+# intended to be combined with options like --disable-tcg for a
+# minimal build supporting only machines we can virtualise with a
+# hypervisor.
+#
+
+CONFIG_ARM_VIRT=y
diff --git a/meson.build b/meson.build
index 09c7809d6b..9d25906219 100644
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


