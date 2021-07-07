Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A23BE8B8
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:23:52 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17Wp-0002cy-Hr
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m17R9-0002f5-Ae
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:17:59 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m17R7-0001gO-Fw
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:17:59 -0400
Received: by mail-wm1-x336.google.com with SMTP id j34so1820440wms.5
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZHpWPobIbA03TJUKi0+wCVaCpkuPa8qHe0PT2RSzKRM=;
 b=iOw5/qYtdQWVoxKs5hsyNsr1JfrmLLcWTsMqAwBE384IgVKDG9wQ/+JECuuZnFB1bu
 uW0SSE5owUdzK1D9jxzfQzVlFEHsksfNQCg2zkreHykrwecsnBCsleeKpFpy8OaNeGCi
 7BfOblWz+xl3Mqy4gxoUVp+CRHUCj+GND/I8hw3ytYL8+KVESqJNjXmeZvhGHccflmGx
 vi+1aRjhqWnueKdrPWcLtDqzQ2/TJLfBefJ8Zgpq2x4NPbx35DcFxdbkcG0UpHc5ieKz
 dfMlg6rpzvoGYcUsB7z4Y4UsmAjIvNNvTZfxrTff9CXQp3TBAxT/3jLiSJq5Ya/kiVZx
 jSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZHpWPobIbA03TJUKi0+wCVaCpkuPa8qHe0PT2RSzKRM=;
 b=i5a/7NS2fTP7IH888SSgtKubTIAAFIaBQh+rmTtAt3MYhI8eGReMl65pPmk8PtLdFP
 zJEBC2n9LAk5owmgzvFM3SjwUElfa9xEbyAMhyQh7DyZwc0YZs4+1G2oce7w22mYRXFn
 JvqaSy8W/hX+Pkce301FJ/ZTlZq4WZytuTH5lbCLwAEXQkx6vYBBgvC8Mh+8fWZbXsKC
 lwQjny8AlMYb945ovyM7R1jq8CENRnL3t0oHVcznxanaEKx0jCwZcugxiYZ91myENO4K
 mW1f7CLFXNQqCEFFmQIL9feOk9YOfZN7v2TvVd0rxuUAUE73LuIwUQjvN6aBDSEpIKqX
 DO0g==
X-Gm-Message-State: AOAM533BLLg0um7LPzsJjzzGxM2m/hvrinsVVkQ0l7JZjz4QtifKnC8B
 J9uRwvd20W25rO5tS2S+mD2aGQ==
X-Google-Smtp-Source: ABdhPJwzl4GipFHOPHD1wyBxAI/p4nwlMlESU4rtft/N2OnMA5ua/RkJZh7qtcucEVjMicTCRD8kLA==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr6881544wmf.157.1625663876198; 
 Wed, 07 Jul 2021 06:17:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d17sm19934580wro.93.2021.07.07.06.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 06:17:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 28D531FF91;
 Wed,  7 Jul 2021 14:17:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v2 5/5] configure: allow the selection of alternate config in
 the build
Date: Wed,  7 Jul 2021 14:17:44 +0100
Message-Id: <20210707131744.26027-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210707131744.26027-1-alex.bennee@linaro.org>
References: <20210707131744.26027-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the default config works well enough it does end up enabling a
lot of stuff. For more minimal builds we can select a different list
of devices and let Kconfig work out what we want. For example:

  ../../configure --without-default-features \
    --target-list=arm-softmmu,aarch64-softmmu \
    --with-devices-aarch64=minimal

will override the aarch64-softmmu default set of devices with a more
minimal set of devices that just enables the virt and sbsa-ref models.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210621152120.4465-6-alex.bennee@linaro.org>

---
v2
  - fix ws
---
 configure                                   | 24 ++++++++++++++++++++-
 configs/devices/aarch64-softmmu/minimal.mak |  9 ++++++++
 meson.build                                 |  3 ++-
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 configs/devices/aarch64-softmmu/minimal.mak

diff --git a/configure b/configure
index 0ed451d9a0..d3942b78e3 100755
--- a/configure
+++ b/configure
@@ -915,6 +915,18 @@ for opt do
   ;;
   --without-default-devices) default_devices="false"
   ;;
+  --with-devices-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --with-devices-FOO option"
+  ;;
+  --with-devices-*) device_arch=${opt#--with-devices-};
+                    device_arch=${device_arch%%=*}
+                    cf=$source_path/configs/devices/$device_arch-softmmu/$optarg.mak
+                    if test -f "$cf"; then
+                        device_archs="$device_archs $device_arch"
+                        eval "devices_${device_arch}=\$optarg"
+                    else
+                        error_exit "File $cf does not exist"
+                    fi
+  ;;
   --without-default-features) # processed above
   ;;
   --enable-gprof) gprof="yes"
@@ -1764,7 +1776,8 @@ Advanced options (experts only):
   --without-default-features default all --enable-* options to "disabled"
   --without-default-devices  do not include any device that is not needed to
                            start the emulator (only use if you are including
-                           desired devices in default-configs/devices/)
+                           desired devices in configs/devices/)
+  --with-devices-ARCH=NAME override default configs/devices
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --enable-tsan            enable thread sanitizer
@@ -5088,6 +5101,15 @@ if test "$skip_meson" = no; then
 
   echo "# Automatically generated by configure - do not modify" > $cross
   echo "[properties]" >> $cross
+
+  # unroll any custom device configs
+  if test -n "$device_archs"; then
+      for a in $device_archs; do
+          eval "c=\$devices_${a}"
+          echo "${a}-softmmu = '$c'" >> $cross
+      done
+  fi
+
   test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
   echo "c_args = [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross
diff --git a/configs/devices/aarch64-softmmu/minimal.mak b/configs/devices/aarch64-softmmu/minimal.mak
new file mode 100644
index 0000000000..0ebc1dca56
--- /dev/null
+++ b/configs/devices/aarch64-softmmu/minimal.mak
@@ -0,0 +1,9 @@
+#
+# A minimal version of the config that only supports only a few
+# virtual machines. This avoids bringing in any of numerous legacy
+# features from the 32bit platform (although virt still supports 32bit
+# itself)
+#
+
+CONFIG_ARM_VIRT=y
+CONFIG_SBSA_REF=y
diff --git a/meson.build b/meson.build
index 283b4d12af..563dddd2b3 100644
--- a/meson.build
+++ b/meson.build
@@ -1584,9 +1584,10 @@ foreach target : target_dirs
                                                configuration: config_target_data)}
 
   if target.endswith('-softmmu')
+    config_input = meson.get_external_property(target, 'default')
     config_devices_mak = target + '-config-devices.mak'
     config_devices_mak = configure_file(
-      input: ['configs/devices' / target / 'default.mak', 'Kconfig'],
+      input: ['configs/devices' / target / config_input + '.mak', 'Kconfig'],
       output: config_devices_mak,
       depfile: config_devices_mak + '.d',
       capture: true,
-- 
2.20.1


