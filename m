Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA731ABB1
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:25:47 +0100 (CET)
Received: from localhost ([::1]:58764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAuvi-0000nx-II
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuib-0000Pk-Mf
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:12:13 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuiW-0000qg-PD
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:12:13 -0500
Received: by mail-wr1-x42c.google.com with SMTP id n8so2895260wrm.10
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aIq5bpXjB8VxTd7qw4GPn/KZHh7n/kvmyOl4idsIkH0=;
 b=YFSI4eiXlC5Rol/48ide6xiaMCTMlvS2ZfDcwFLqBz6fAy8G8vvoT4v9TGe2Oeq6Yg
 y3Vj6/xkIF2ohRX2zE5z8krIfjldikt7v8N0x29pY3Vc+mjF+6pE62FezrrAPmpMg8Rj
 3/Um2BPxqJrxZM+msZTiJhhbB1HctZwWFfjA5nG1J8Wd/LPTym2A2dExt0d1n3mc6jk2
 P3IkDh8dk9+nE/HkvpCiH1KgWLvg3PH8Wq5xbUK3kBWFH6plCiElUWK1fPzDfKSUr3gl
 oOydHsVM8AGcHE1OGSdzwYhGTzzhRu1CqlYU2ALJ9n1SJnGilxALR9NPMvo8EEwNNyOX
 ZyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aIq5bpXjB8VxTd7qw4GPn/KZHh7n/kvmyOl4idsIkH0=;
 b=NvmHYOFn7VgOaHHiBIPDgmUr0fBpI/bsg0d9m856qvVc6fqWtl6L83UL677jxQRKRP
 O6pFDYWr0iIBqxgdrOoPdU4TJ66XT8bGvcokU57WGDE9B8Ea9TbRDUNDtS4MV2S8ffpT
 THJnQC0s3soLY7tU8eC3XUK/yzDVnReJkEuhe3UeHidGLfJiARlvVEZ18BbOWUb8ihpd
 U9fVEADLo0tYyGX9oaF2NAbpG1y/8jpnI4gDlgwg6C6200Kq9my+z7iCCN6V5OaE9pSS
 HK9qhXvW36SLeO/FZThuTSsROI2U9HHQggzQgWBgImR3yc5E4dsnp6bxOMYsqgoq4sdG
 AJvQ==
X-Gm-Message-State: AOAM532wOcX4MFO8LU1iQRI7t9uXXX5dPlOU+bjAkZCYpZIeagifrFfG
 J7SLCY2GYMfshg1sq0fOLGRRIg==
X-Google-Smtp-Source: ABdhPJx+10S6PsabcCMwxg9tqaT3X0zmMBBuz9tcKm5cX2nri+Iv6of7vMfEb3r9YME6k+lkUBjYWg==
X-Received: by 2002:a05:6000:18f:: with SMTP id
 p15mr928137wrx.27.1613221927057; 
 Sat, 13 Feb 2021 05:12:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n5sm15710487wmq.7.2021.02.13.05.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:12:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF1B91FF9E;
 Sat, 13 Feb 2021 13:03:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/23] tests/acceptance: add a new set of tests to exercise
 plugins
Date: Sat, 13 Feb 2021 13:03:17 +0000
Message-Id: <20210213130325.14781-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a simple test to count the instructions executed by a
kernel. However a later test will detect a failure condition when
icount is enabled.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210210221053.18050-16-alex.bennee@linaro.org>

---
v3
  - update MAINTAINERS
  - add TODO
  - removed excess logging, proper self.fail message
---
 MAINTAINERS                     |  1 +
 tests/acceptance/tcg_plugins.py | 91 +++++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 tests/acceptance/tcg_plugins.py

diff --git a/MAINTAINERS b/MAINTAINERS
index e6f1eca30f..f8d06df0c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2889,6 +2889,7 @@ S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
 F: tests/plugin/
+F: tests/acceptance/tcg_plugins.py
 F: contrib/plugins/
 
 AArch64 TCG target
diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
new file mode 100644
index 0000000000..adec40d3a5
--- /dev/null
+++ b/tests/acceptance/tcg_plugins.py
@@ -0,0 +1,91 @@
+# TCG Plugins tests
+#
+# These are a little more involved than the basic tests run by check-tcg.
+#
+# Copyright (c) 2021 Linaro
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import tempfile
+import mmap
+import re
+
+from boot_linux_console import LinuxKernelTest
+
+
+class PluginKernelBase(LinuxKernelTest):
+    """
+    Boots a Linux kernel with a TCG plugin enabled.
+    """
+
+    timeout = 120
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=1 panic=-1 '
+
+    def run_vm(self, kernel_path, kernel_command_line,
+               plugin, plugin_log, console_pattern, args):
+
+        vm = self.get_vm()
+        vm.set_console()
+        vm.add_args('-kernel', kernel_path,
+                    '-append', kernel_command_line,
+                    '-plugin', plugin,
+                    '-d', 'plugin',
+                    '-D', plugin_log,
+                    '-net', 'none',
+                    '-no-reboot')
+        if args:
+            vm.add_args(*args)
+
+        try:
+            vm.launch()
+        except:
+            # TODO: probably fails because plugins not enabled but we
+            # can't currently probe for the feature.
+            self.cancel("TCG Plugins not enabled?")
+
+        self.wait_for_console_pattern(console_pattern, vm)
+        # ensure logs are flushed
+        vm.shutdown()
+
+
+class PluginKernelNormal(PluginKernelBase):
+
+    def _grab_aarch64_kernel(self):
+        kernel_url = ('http://security.debian.org/'
+                      'debian-security/pool/updates/main/l/linux-signed-arm64/'
+                      'linux-image-4.19.0-12-arm64_4.19.152-1_arm64.deb')
+        kernel_sha1 = '2036c2792f80ac9c4ccaae742b2e0a28385b6010'
+        kernel_deb = self.fetch_asset(kernel_url, asset_hash=kernel_sha1)
+        kernel_path = self.extract_from_deb(kernel_deb,
+                                            "/boot/vmlinuz-4.19.0-12-arm64")
+        return kernel_path
+
+    def test_aarch64_virt_insn(self):
+        """
+        :avocado: tags=accel:tcg
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
+        :avocado: tags=cpu:cortex-a57
+        """
+        kernel_path = self._grab_aarch64_kernel()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyAMA0')
+        console_pattern = 'Kernel panic - not syncing: VFS:'
+
+        plugin_log = tempfile.NamedTemporaryFile(mode="r+t", prefix="plugin",
+                                                 suffix=".log")
+
+        self.run_vm(kernel_path, kernel_command_line,
+                    "tests/plugin/libinsn.so", plugin_log.name,
+                    console_pattern,
+                    args=('-cpu', 'cortex-a53'))
+
+        with plugin_log as lf, \
+             mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
+
+            m = re.search(br"insns: (?P<count>\d+)", s)
+            if "count" not in m.groupdict():
+                self.fail("Failed to find instruction count")
-- 
2.20.1


