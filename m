Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E20F3AEC51
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:26:25 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLod-0004LG-Rq
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvLjy-0006GF-Fn
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:21:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvLjs-0000X2-Q3
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:21:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so252660wmb.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CsXhssyw6Y5BPQf+p6ZLuSq1kR5JVGXqyZUOk9Pkbm8=;
 b=Vg2hLxk6G0EfAFSHAMoKCBadsy5sudjjI9FusZx8xpjodExh+AwPTO/JoPttmcaVcd
 2MuX7sRKP5/TbBAh1tOFP2+yjcABGZRTnA5BO9TV8Qex71Dr7/tkxqSWXsg65VDkowDa
 Sa3MBor0f+Km3OYG4+VrPEnVVA4YVaCqRQVk233nmqcuEuX4lJB1JwNBDggN8OofIjri
 FWh3kZgY7WWwWNXrjNR+4yXqYBCirhMQUHSR1/ZXIOg4sqqp02Xyaj1O048I8k5/92O/
 zK4gf3tZ9VBSLI3ogMGT3NWgdVrMcjjX4hzGb75HJNgCb49U7GQlZcD0MriADLv7lReb
 wrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CsXhssyw6Y5BPQf+p6ZLuSq1kR5JVGXqyZUOk9Pkbm8=;
 b=r2VhOpa0b72SclrStgvPwqixJI9mbYuOHYrBgnBVZ4RbfrPcnFeQf5mJmmbCyeYaCH
 sge4QaxSZYs/s+k0Vg8tBgcFAmiTLYeRgMIYY6fo/kh3fu/rOnkyTEGlXAijTy69rkuO
 AvxcpeAgjLR2pP9RvXe939YWD1k6KNS8fymUEGC3bGHkEu44x/K2RgaFuN10PvlU7xj4
 TOOCV66TJ0Y/vOnp9mEZqXJGiw+QE69pIVzRKUFdbjEolxuoBXO9xoeRNDf1A/v9t7q2
 5Pg5WKJ6qAcCULo6oVRs9M27Rx4ZPE6x/gXpivKejdPjgvnWYo0FVv08NkfkUTN/9hBm
 TgKA==
X-Gm-Message-State: AOAM531yfhWzrOmYXELEwMYZfqzRWLI1tTpx2J9JPx5op3VsDPmEVe6T
 yQ6TkN2aEB+syx2vrCdm9iR+wA==
X-Google-Smtp-Source: ABdhPJx3MEVZ0/UlLEkXKSh/7APssqMgafjyqoivWSn0bTpGAt7DZB/TBBIilW/mpzoTR5QZPTDxeA==
X-Received: by 2002:a1c:2cc3:: with SMTP id
 s186mr28962791wms.150.1624288887418; 
 Mon, 21 Jun 2021 08:21:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 24sm5327556wmi.35.2021.06.21.08.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:21:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 28F681FF91;
 Mon, 21 Jun 2021 16:21:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/5] configure: allow the selection of alternate config in
 the build
Date: Mon, 21 Jun 2021 16:21:20 +0100
Message-Id: <20210621152120.4465-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621152120.4465-1-alex.bennee@linaro.org>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Message-Id: <20210528163116.31902-1-alex.bennee@linaro.org>

---
v2
  - remove extraneous cc
  - dropped pathname from config
  - add virt.mak config
  - drop ZYNQMP from the 64bit only build
  - test -f the --with-devices-FOO file
v3
  - add config with the recently moved default-config->configs
  - dropped Phillipe's r-b due to refactoring
  - don't echo array to config-meson.cross
---
 configure                                   | 24 ++++++++++++++++++++-
 configs/devices/aarch64-softmmu/minimal.mak |  9 ++++++++
 meson.build                                 |  3 ++-
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 configs/devices/aarch64-softmmu/minimal.mak

diff --git a/configure b/configure
index b47c38b504..e5cc6b2b29 100755
--- a/configure
+++ b/configure
@@ -921,6 +921,18 @@ for opt do
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
+                         error_exit "File $cf does not exist"
+                    fi
+  ;;
   --without-default-features) # processed above
   ;;
   --enable-gprof) gprof="yes"
@@ -1770,7 +1782,8 @@ Advanced options (experts only):
   --without-default-features default all --enable-* options to "disabled"
   --without-default-devices  do not include any device that is not needed to
                            start the emulator (only use if you are including
-                           desired devices in default-configs/devices/)
+                           desired devices in configs/devices/)
+  --with-devices-ARCH=NAME override default configs/devices
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --enable-tsan            enable thread sanitizer
@@ -6331,6 +6344,15 @@ if test "$skip_meson" = no; then
 
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
index 4893ffa2ac..1d7a9ee421 100644
--- a/meson.build
+++ b/meson.build
@@ -1368,9 +1368,10 @@ foreach target : target_dirs
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


