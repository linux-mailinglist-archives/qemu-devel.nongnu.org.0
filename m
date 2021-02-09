Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3783155FE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:36:36 +0100 (CET)
Received: from localhost ([::1]:50464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9XsI-0003cH-Uv
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9XkB-0003Kn-Be
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:11 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk9-0007rt-GD
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:11 -0500
Received: by mail-wm1-x32a.google.com with SMTP id j21so4466656wmj.0
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEIjvY3Wkc2WIeF8s4uxzLxZhJzabaYoCUAadrDeVZE=;
 b=KliXru9u15xBMEQw+4hAdOmtBHJ8ZGifwxmLu0rMZ9CSLdzjp80aaRWbK+VPHXDkJa
 geLxag8vbe7grek6tVlCfepqw8km0gpQ2qc1X0kXZ1fg6QQjL+PSTbyU3F6lGPTS/NdR
 MzLAa3kTRZUS8jJpm3lKqwHqM44b3v94ruxhTQqHRouMxTUeraOvZiMtWkV0Tz0xqH4V
 UDZR3w5m6GS7lALIYDpfTB7ZdWo1UngariYrV7qBg0Hc2WKNm8hE2TBYKeBHQA0xRnGt
 wAAjSQFiSiMh0V+1UsI+AU1etyjAO4ioBjs2qw3iJmUOdX3lgOi28ywUB3IbBloQouNR
 D/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEIjvY3Wkc2WIeF8s4uxzLxZhJzabaYoCUAadrDeVZE=;
 b=ISlwE7mHCaeBs+EZXxUyu0iR+DiOQ5vTWXbm4OI7X/LWdRlXQ/zf7AdosGxzxDr0b9
 4H7q7Tr3ZZ8HX99yMVODZh1cB6dUlfug7rdL24nJbhQPFaqAyiJ9toqIo0ZKwkhz41x+
 WTMIeOPSn4PoKqAs+5h2uP86ExhDf+heX8kSZccLwRgF5vFTVIO+cfklaK8LkfZiwfVY
 3AryQ2KSI0AE0jR8h+3NNgQZMXUv2Rt/e5YeR0S/WdnfhU/Obd/a2PSwSjcf1dLCIzjH
 9fPItur+f59kPaK8BbXnA76iUy0NCg4XfkW4vgVfBRU+EazaSatVS7gt1wdq8dFph3qz
 S4OQ==
X-Gm-Message-State: AOAM530fnkkvtYKTF2uCUMBhqvEGs+AyGS7T3cF4L2crgKq66t2+0etV
 l+5Q49d0Db2zSETsRZu3kvsQ/A==
X-Google-Smtp-Source: ABdhPJwnWXDgY43mx8oHByXUypUcqv6ZqKYD6LjoXyl6zsWxye93BMnrhmgsam0sayRdoD2kjlnSFA==
X-Received: by 2002:a05:600c:354b:: with SMTP id
 i11mr4698374wmq.72.1612895288086; 
 Tue, 09 Feb 2021 10:28:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w25sm5678434wmc.42.2021.02.09.10.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A22FC1FF92;
 Tue,  9 Feb 2021 18:27:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 06/12] tests/acceptance: add a new set of tests to exercise
 plugins
Date: Tue,  9 Feb 2021 18:27:42 +0000
Message-Id: <20210209182749.31323-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
 robhenry@microsoft.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a simple test to count the instructions executed by a
kernel. However a later test will detect a failure condition when
icount is enabled.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/acceptance/tcg_plugins.py | 103 ++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 tests/acceptance/tcg_plugins.py

diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
new file mode 100644
index 0000000000..b512979769
--- /dev/null
+++ b/tests/acceptance/tcg_plugins.py
@@ -0,0 +1,103 @@
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
+import logging
+import time
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
+        logger = logging.getLogger('plugin')
+        start_time = time.time()
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
+            # fails if plugins not enabled
+            self.cancel("TCG Plugins not enabled")
+
+        self.wait_for_console_pattern(console_pattern, vm)
+        elapsed = time.time() - start_time
+        logger.info('elapsed time %.2f sec' % elapsed)
+        # ensure logs are flushed
+        vm.shutdown()
+        return elapsed
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
+        logger = logging.getLogger()
+
+        with plugin_log as lf, \
+             mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
+
+            m = re.search(br"insns: (?P<count>\d+)", s)
+            if "count" in m.groupdict():
+                logger.debug("reported %d instructions",
+                             int(m.group("count")))
+            else:
+                logger.debug("Failed to find instruction count")
+                self.fail
-- 
2.20.1


