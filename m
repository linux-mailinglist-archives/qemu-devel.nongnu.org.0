Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0D34E9C06
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 18:16:07 +0200 (CEST)
Received: from localhost ([::1]:57850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYs2H-0004sM-OW
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 12:16:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYs0N-0003cn-R4
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:14:07 -0400
Received: from [2a00:1450:4864:20::530] (port=45809
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYs0L-0000et-Ry
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:14:07 -0400
Received: by mail-ed1-x530.google.com with SMTP id u26so17492980eda.12
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 09:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aKpBv3U0hobzkCwe2ZAGwg6ApjZd5S9HLueRuddE1qg=;
 b=Ok94tF4X62f0h1lxr/08ALmUHVpp1FTSfBJWaiDGIfo/GDpZVWQ4xh+wPE1iuqh9EN
 t66xXyL1j4RRrpX6JstehIqcUDR31fT9AtaSybuxFXCmGbc7LajwUPaUfMVt7V+edfq1
 0NvcRqKiPYD/CBHAxWamxikRt/+E7FS2fpmXMKxswCyo7PJ59i2SA52bft6E49OCbTCy
 mxQce4gWK0V3tQoUNW37H91UIQBchCU9K81cbW02kPbCa0+DXsKkVcKDNVdW19a01Qla
 Zj7TVxpo08ZBcpMG+rSUOdrCT7RG3W6xrbll7/WyAZwMwbVtzyiv3m2o4xlQWfZe+CLu
 RodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aKpBv3U0hobzkCwe2ZAGwg6ApjZd5S9HLueRuddE1qg=;
 b=rF9DE9ddZExk5Fl0H4tg8CFKkLgxdc/MaAKx3KwatlKD8FfrOXiW3o1uUtOObyMnnS
 hesZX1G6sLtHZM/RC1SWf+I+7TpPP19e6ti9F+Dr1lr4OlNMWpoABOPeB7wHZc7Jhc11
 qgmtP8B5GRQHJYNPDq59SgXp5hDlJrYocBQQQZFj4zaZdO7mif6KLW0fHAWlj4kPaYul
 9IFjFYNTdzUd3CPazqChYqCp4EPtUkzvyJsyYXCZa+Q38HhrgmQDSSWCZR6DHIFvYhei
 4YpWuSdZxA8rVzPfVfI3WF8L3si7rqon1p4VuNH93tMyUjnffS5bn3/Krs2q1KeDDIJW
 8/kw==
X-Gm-Message-State: AOAM533QPFnTv60s2tL264FXHjaC71+lpu4me4QxuUQj0yKjAf3NO+MS
 FmB4ZNC8EK+wbnuCNmtMCRzMfw==
X-Google-Smtp-Source: ABdhPJwCkupY3CrOxr7+jOXiH7kqeQvTQ4+4sLPO+PfIJjjCH2cb1jveVf+RnoDsdmlME11RAYtBYA==
X-Received: by 2002:a05:6402:278d:b0:419:3794:de39 with SMTP id
 b13-20020a056402278d00b004193794de39mr17150898ede.137.1648484042873; 
 Mon, 28 Mar 2022 09:14:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 rh26-20020a17090720fa00b006e0da7ef847sm3139597ejb.13.2022.03.28.09.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 09:14:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE39A1FFB7;
 Mon, 28 Mar 2022 17:14:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] tests/avocado: update aarch64_virt test to exercise -cpu
 max
Date: Mon, 28 Mar 2022 17:13:57 +0100
Message-Id: <20220328161357.2464572-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:Virt" <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Fedora 29 kernel is quite old and importantly fails when running
in LPA2 scenarios. As it's not really exercising much of the CPU space
replace it with a custom 5.16.12 kernel with all the architecture
options turned on. There is a minimal buildroot initramfs included in
the kernel which has a few tools for stress testing the memory
subsystem. The userspace also targets the Neoverse N1 processor so
would fail with a v8.0 cpu like cortex-a53.

While we are at it move the test into its own file so it can have an
assigned maintainer.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220315121251.2280317-3-alex.bennee@linaro.org>

---
v2
  - move test into own machine file
v3
  - minor reword of commit, added tags
---
 MAINTAINERS                           |  1 +
 tests/avocado/boot_linux_console.py   | 25 -------------
 tests/avocado/machine_aarch64_virt.py | 51 +++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 25 deletions(-)
 create mode 100644 tests/avocado/machine_aarch64_virt.py

diff --git a/MAINTAINERS b/MAINTAINERS
index cc364afef7..4fd1c2c955 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -942,6 +942,7 @@ S: Maintained
 F: hw/arm/virt*
 F: include/hw/arm/virt.h
 F: docs/system/arm/virt.rst
+F: tests/avocado/machine_aarch64_virt.py
 
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index b40a3abc81..45a2ceda22 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -325,31 +325,6 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         kernel_hash = '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
         self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
 
-    def test_aarch64_virt(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a53
-        """
-        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
-                      '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
-                      '/vmlinuz')
-        kernel_hash = '8c73e469fc6ea06a58dc83a628fc695b693b8493'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
-        self.vm.set_console()
-        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               'console=ttyAMA0')
-        self.require_accelerator("tcg")
-        self.vm.add_args('-cpu', 'cortex-a53',
-                         '-accel', 'tcg',
-                         '-kernel', kernel_path,
-                         '-append', kernel_command_line)
-        self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.wait_for_console_pattern(console_pattern)
-
     def test_aarch64_xlnx_versal_virt(self):
         """
         :avocado: tags=arch:aarch64
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
new file mode 100644
index 0000000000..21848cba70
--- /dev/null
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -0,0 +1,51 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# Copyright (c) 2022 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import time
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+
+class Aarch64VirtMachine(QemuSystemTest):
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    def test_aarch64_virt(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:max
+        """
+        kernel_url = ('https://fileserver.linaro.org/s/'
+                      'z6B2ARM7DQT3HWN/download')
+
+        kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyAMA0')
+        self.require_accelerator("tcg")
+        self.vm.add_args('-cpu', 'max,pauth-impdef=on',
+                         '-accel', 'tcg',
+                         '-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        self.wait_for_console_pattern('Welcome to Buildroot')
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+        exec_command(self, 'cat /proc/self/maps')
+        time.sleep(0.1)
-- 
2.30.2


