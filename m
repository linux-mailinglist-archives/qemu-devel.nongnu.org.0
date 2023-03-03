Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDAA6A8F2B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXv80-0000w6-AI; Thu, 02 Mar 2023 21:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31VoBZAUKCrYdodWjckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--hshan.bounces.google.com>)
 id 1pXv7y-0000vh-Fk
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:34 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31VoBZAUKCrYdodWjckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--hshan.bounces.google.com>)
 id 1pXv7w-0007Tp-Gt
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:34 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-53700262a47so10209807b3.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677810390;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f+OxS+1AaW76FnXi9lTpcZqFimdsdKsZro+NfNTxQls=;
 b=tg8dihemw9rIxgTdgaa1viONfJxqMeTnRTbUvUhzLPoSgWnwCNjbiuDZ1hHJbW99Al
 Uwg6O2QJiuVAkUyw6m2g8qO6L+30UYB2BsTEcd9SXfS1894bvJFUOSH+zfKBiKH9Q4/T
 l1s2LysNNSMr62xQAhruDeiTY3XZKvg3y34d441Xr99jbfEKiLvkRqTTnmMFlLUF03gh
 udm2VgWmw55D8eRwQI3SPLSx/AXfeo3wCcrUpQw9cjBsgF0L0Suoy/iynpSwJ7uw+zAB
 5OmJ7M1sHkCnB2Ojm6vi+/9y7Mj9OlYvx+H1NQw0HSRhJ9NaZLx7Y/HF/8fy7yA9kk+6
 Ia7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677810390;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f+OxS+1AaW76FnXi9lTpcZqFimdsdKsZro+NfNTxQls=;
 b=jixsC2YtkkHWXZvhrvaDYO4LygIzcxJXU8ps+G9mW2AvgbYAAE3+cv0Run5Wo6YzHC
 xtoYVvVnuelZ1V59SQSsaf9sAfxaoOMxtZ62MhX/SUpA8oVEEwtQ3FRBrmDxftHb8anq
 LseK0J7aeLrIUsHoeq5mkUw03OLfFLykE0drMQh+rgT4PBbvuadZH+b3JeUY/1rcAGP9
 /Dc4cGBKYSKnloV9Ps1DOP5nzz+Kc3AyAw2zMVHwWr2LQAspNlKLuCVnf/P5jhF0MfDO
 3HPU9hZspm1l/jz++/4NlicoROU/zsLo7yyHQG9ohZIvEt8ZO0szffJ8cFt1itWSYBMw
 HELg==
X-Gm-Message-State: AO0yUKVamBc+O80BOCYUQpcsXvtZvKpkmA0l83UPEbS6yRNbbXkfZhWC
 E9gUgeZTO/PyuVmXeqj7C7MgErxeAr0qjkZlMaEDjqniz3awg/XLPOheMrtroBYDWKrSXnHXJj6
 eyq/HMgZ0xJ1S4C7POFIRVAO6yTCVrWhSO7wH1aT+gpnXjKA77gNpv1YNyA==
X-Google-Smtp-Source: AK7set+ZrjOQS4DV+PDIjLshx4gLIzt7xIs/iv82AxtiTm+4XAYwn4N0mWExi8Ct/4qcQGEaDMtPtM2JLA==
X-Received: from hshan17.roam.corp.google.com
 ([2620:15c:211:201:633f:2163:6a23:74ef])
 (user=hshan job=sendgmr) by 2002:a81:ad45:0:b0:52e:cacb:d7c4 with SMTP id
 l5-20020a81ad45000000b0052ecacbd7c4mr7599518ywk.5.1677810389953; Thu, 02 Mar
 2023 18:26:29 -0800 (PST)
Date: Thu,  2 Mar 2023 18:26:12 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230303022618.4098825-1-hshan@google.com>
Subject: [PATCH 1/6] Add the Android Emulator hypervisor driver (AEHD)
 accelerator.
From: Haitao Shan <hshan@google.com>
To: qemu-devel@nongnu.org
Cc: Haitao Shan <hshan@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=" <marcandre.lureau@redhat.com>, 
 "=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=31VoBZAUKCrYdodWjckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--hshan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add the configure support for the Android Emulator hypervisor driver
accelerator. The Android Emulator hypervisor driver is a Windows
driver made by porting the KVM from kernel 4.9-rc7.

Signed-off-by: Haitao Shan <hshan@google.com>
---
 accel/Kconfig                  |  3 +++
 docs/about/build-platforms.rst |  2 +-
 include/exec/poison.h          |  1 +
 meson.build                    | 16 ++++++++++++++++
 meson_options.txt              |  2 ++
 qemu-options.hx                | 20 ++++++++++----------
 scripts/meson-buildoptions.sh  |  2 ++
 7 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/accel/Kconfig b/accel/Kconfig
index 8bdedb7d15..187d8f6acf 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -16,6 +16,9 @@ config TCG
 config KVM
     bool
 
+config AEHD
+    bool
+
 config XEN
     bool
     select FSDEV_9P if VIRTFS
diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 20b97c3310..184707bd62 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -52,7 +52,7 @@ Those hosts are officially supported, with various accelerators:
    * - SPARC
      - tcg
    * - x86
-     - hax, hvf (64 bit only), kvm, nvmm, tcg, whpx (64 bit only), xen
+     - aehd (64 bit only), hax, hvf (64 bit only), kvm, nvmm, tcg, whpx (64 bit only), xen
 
 Other host architectures are not supported. It is possible to build QEMU system
 emulation on an unsupported host architecture using the configure
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 140daa4a85..cb851744d1 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -86,6 +86,7 @@
 #pragma GCC poison CONFIG_HVF
 #pragma GCC poison CONFIG_LINUX_USER
 #pragma GCC poison CONFIG_KVM
+#pragma GCC poison CONFIG_AEHD
 #pragma GCC poison CONFIG_SOFTMMU
 #pragma GCC poison CONFIG_WHPX
 #pragma GCC poison CONFIG_XEN
diff --git a/meson.build b/meson.build
index 77d2ae87e4..f2b049ceac 100644
--- a/meson.build
+++ b/meson.build
@@ -146,6 +146,11 @@ if cpu in ['x86', 'x86_64']
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
   }
 endif
+if cpu in ['x86_64']
+  accelerator_targets += {
+    'CONFIG_AEHD': ['i386-softmmu', 'x86_64-softmmu'],
+  }
+endif
 
 modular_tcg = []
 # Darwin does not support references to thread-local variables in modules
@@ -421,6 +426,13 @@ accelerators = []
 if get_option('kvm').allowed() and targetos == 'linux'
   accelerators += 'CONFIG_KVM'
 endif
+if get_option('aehd').allowed() and targetos == 'windows'
+  if get_option('aehd').enabled() and host_machine.cpu() != 'x86_64'
+    error('AEHD requires 64-bit host')
+  else
+    accelerators += 'CONFIG_AEHD'
+  endif
+endif
 if get_option('whpx').allowed() and targetos == 'windows'
   if get_option('whpx').enabled() and host_machine.cpu() != 'x86_64'
     error('WHPX requires 64-bit host')
@@ -482,6 +494,9 @@ endif
 if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
   error('KVM not available on this platform')
 endif
+if 'CONFIG_AEHD' not in accelerators and get_option('aehd').enabled()
+  error('AEHD not available on this platform')
+endif
 if 'CONFIG_HVF' not in accelerators and get_option('hvf').enabled()
   error('HVF not available on this platform')
 endif
@@ -3873,6 +3888,7 @@ endif
 summary_info = {}
 if have_system
   summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
+  summary_info += {'AEHD support':      config_all.has_key('CONFIG_AEHD')}
   summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
   summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
   summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
diff --git a/meson_options.txt b/meson_options.txt
index fc9447d267..d3e9805b6d 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -66,6 +66,8 @@ option('malloc', type : 'combo', choices : ['system', 'tcmalloc', 'jemalloc'],
 
 option('kvm', type: 'feature', value: 'auto',
        description: 'KVM acceleration support')
+option('aehd', type: 'feature', value: 'auto',
+       description: 'AEHD acceleration support')
 option('hax', type: 'feature', value: 'auto',
        description: 'HAX acceleration support')
 option('whpx', type: 'feature', value: 'auto',
diff --git a/qemu-options.hx b/qemu-options.hx
index beeb4475ba..2870c54a43 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -26,7 +26,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "-machine [type=]name[,prop[=value][,...]]\n"
     "                selects emulated machine ('-machine help' for list)\n"
     "                property accel=accel1[:accel2[:...]] selects accelerator\n"
-    "                supported accelerators are kvm, xen, hax, hvf, nvmm, whpx or tcg (default: tcg)\n"
+    "                supported accelerators are kvm, xen, hax, hvf, nvmm, whpx, aehd or tcg (default: tcg)\n"
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
@@ -59,10 +59,10 @@ SRST
 
     ``accel=accels1[:accels2[:...]]``
         This is used to enable an accelerator. Depending on the target
-        architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be available.
-        By default, tcg is used. If there is more than one accelerator
-        specified, the next one is used if the previous one fails to
-        initialize.
+        architecture, kvm, xen, hax, hvf, nvmm, whpx, aehd or tcg can be
+        available. By default, tcg is used. If there is more than one
+        accelerator specified, the next one is used if the previous one
+        fails to initialize.
 
     ``vmport=on|off|auto``
         Enables emulation of VMWare IO port, for vmmouse etc. auto says
@@ -178,7 +178,7 @@ ERST
 
 DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "-accel [accel=]accelerator[,prop[=value][,...]]\n"
-    "                select accelerator (kvm, xen, hax, hvf, nvmm, whpx or tcg; use 'help' for a list)\n"
+    "                select accelerator (kvm, xen, hax, hvf, nvmm, whpx, aehd or tcg; use 'help' for a list)\n"
     "                igd-passthru=on|off (enable Xen integrated Intel graphics passthrough, default=off)\n"
     "                kernel-irqchip=on|off|split controls accelerated irqchip support (default=on)\n"
     "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
@@ -190,10 +190,10 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
 SRST
 ``-accel name[,prop=value[,...]]``
     This is used to enable an accelerator. Depending on the target
-    architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be available. By
-    default, tcg is used. If there is more than one accelerator
-    specified, the next one is used if the previous one fails to
-    initialize.
+    architecture, kvm, xen, hax, hvf, nvmm, whpx, aehd or tcg can be
+    available. By default, tcg is used. If there is more than one
+    accelerator specified, the next one is used if the previous one
+    fails to initialize.
 
     ``igd-passthru=on|off``
         When Xen is in use, this option controls whether Intel
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 009fab1515..f17df07c5d 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -289,6 +289,8 @@ _meson_option_parse() {
     --disable-guest-agent) printf "%s" -Dguest_agent=disabled ;;
     --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=enabled ;;
     --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=disabled ;;
+    --enable-aehd) printf "%s" -Daehd=enabled ;;
+    --disable-aehd) printf "%s" -Daehd=disabled ;;
     --enable-hax) printf "%s" -Dhax=enabled ;;
     --disable-hax) printf "%s" -Dhax=disabled ;;
     --enable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=true ;;
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


