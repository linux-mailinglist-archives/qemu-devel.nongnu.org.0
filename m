Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36A31E827
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:55:30 +0100 (CET)
Received: from localhost ([::1]:50950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCg1x-00075X-1I
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuD-0006zK-PY
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:29 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuB-0007Gu-P8
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n6so2177430wrv.8
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkerjIOSR1VBpLEavyIzaruBjnEooIufy3pN/kRsj3g=;
 b=gjafs3ONJf4x+OzJzIMuDlw2tuYuaYQxHbFvsmFoPfLxfrlQPqrqARkoGrL2vCCzI0
 Yw/WVKvQ+JeYx8QYwbG/l4BIuOX3YYiZZfMMVX2K2PZ7JE4ZZiIvAopkhq2LoDX2b49F
 HGKV4u4V/PjioLsoY9SneevvgfRBY63/sveCgcStkC9HgnizrPHXRwHggOLpXKPOxAwR
 iA5yaJSj+xKBFhIIXoQye83KEgD9+MdZOd+AzYyN/7O40H+agTfEijLv7Zrrd6fIzW5Z
 ZcGIEREo7tPAVIBY9pY1vBisHWUYasHGE9ijh2EYfCmVZy7vDh0GL7R7amfOHuhqoxOg
 JqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkerjIOSR1VBpLEavyIzaruBjnEooIufy3pN/kRsj3g=;
 b=N4hrS+ZPQeO40junO9AkmFIyGi4gGTOvA3cf5N0URrlNr0PxwUWOe2CZjPrS24S5Av
 vKo9ztPGqlz9v5y9bBi+WZUgPEvrUEtVDVg+uH1OQ813W6aXVQvJdhS7+3x5XLCdpu7g
 Wc15kF2RYHo7Yd2aZyOQca3wQCNIGHMuCMuUSqMj4NHo0Q2DCrT1sjROgq8rEk6Hdto3
 LWPZ2DH40fUhYBvSy0wHwsC+QdmG62cPd4E6fDKVJSS1U+qdeNGrjy5gaVDgMXKufGsl
 7mvygdf9O6gq0xGASNWXYxgoft01bpJy5zMlplN1TvCF9ubHncJ5qr5UGAW6FIGjqIpz
 mlUw==
X-Gm-Message-State: AOAM532GXSuSNtYH1QkMXWQZTkNBgxmD1P+KOMd2W1Ts5gs5N9w2sKeM
 9awFmFqyfuwEhOaeBMqEQTGUUQ==
X-Google-Smtp-Source: ABdhPJwnyCXZU7u6NOYEZzTiZgvDdXj6ceTeSdv/cR7lRUGY42OJImTD0ssF6G1ecCrUHt3+8FPejA==
X-Received: by 2002:a05:6000:1816:: with SMTP id
 m22mr3454193wrh.91.1613641646410; 
 Thu, 18 Feb 2021 01:47:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s23sm7062441wmc.29.2021.02.18.01.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6BC841FF9E;
 Thu, 18 Feb 2021 09:47:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/23] tests/acceptance: add a new set of tests to exercise
 plugins
Date: Thu, 18 Feb 2021 09:46:58 +0000
Message-Id: <20210218094706.23038-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a simple test to count the instructions executed by a
kernel. However a later test will detect a failure condition when
icount is enabled.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210213130325.14781-16-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 68ee271792..1d711e0cb8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2903,6 +2903,7 @@ S: Maintained
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


