Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F333173B2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:53:00 +0100 (CET)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yLz-0000EC-QQ
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqD-0006w2-Na
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:09 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqA-0006oI-DX
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:09 -0500
Received: by mail-wm1-x330.google.com with SMTP id w4so3205138wmi.4
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j4XmWVEBX2ENQRRduA5gKPU5AX0OB2Qj1ZjmkgHICaE=;
 b=fa6NFK/B+UnoWsiE/5MwVW2nbwy14i6XChQfMDtKBl/B1grK17ouQUx9SpYU12Aqit
 UU8dDvjIfrZGxX0fcBDVAdV/qAwWasvnxNkrFqkNYRckV9Jmlx/5XMiDODyCxOYte9Pf
 dr6r8D2qHzmxpLdCJrLdEF/U6PYsocIjzBTv20XMm8hVURCF/HM/xuKlPfsQ6ZwkDAAc
 HOa/5YynFMSs9PTp+IndKQDcVSv1knnbg08Z+IKTfpU96Nk2dcy8wgTE4VhpfyFf44fb
 o2EwG4TLfJsIf4BisEHKpybzi3lCQNhNw7kzM+ZAtU/Q4H3Q/aPQEEOVzvNFSXLgS/Wk
 2aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4XmWVEBX2ENQRRduA5gKPU5AX0OB2Qj1ZjmkgHICaE=;
 b=QQ/huGELzLY3ahgOqtBWbe3R37MblahT312ju9/lwkLVSvNOiB5EJKu/d9GV6VTR6P
 G7a9eOiIPTVUYwiDDSKDfBjw5/J2YlmZClWnn4nOYfYoKCQUM7SFcwQwMVyruWZvaylx
 flI7bCHRANxYpu22/eQJkvECVPadz97M5rZZ0REOAw6ZZBa3JneEaz8+VGZe+m8cY3n5
 trVxzxYTL5KAAG4/QQLDIUZy33A3aGN8LhD5g4jCDYeDxlMqR1AMV8Ty8ZkMvq/We1Qs
 RKJPhBQ+KUxbUWfepBn2yfiPkFmNuGjH/AXURND4kiNtS9i+wiudHgR+NyJnl4LHTIOZ
 JduQ==
X-Gm-Message-State: AOAM5325PpQlZ1rh0XRbahBkMSfbuMBWljZwY2D2ziXEqxmdcZ4XSRCr
 fi5v+fYp0rsyG5kAcJoiyUridQ==
X-Google-Smtp-Source: ABdhPJz1jj45n1Fg1lpol9+hw5S4VqPh5Youuzip+n6bEgyy92RhM/4qrG0MzzUit/ovqgrfC+DxZA==
X-Received: by 2002:a1c:c904:: with SMTP id f4mr1270608wmb.14.1612995604850;
 Wed, 10 Feb 2021 14:20:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o83sm5038838wme.37.2021.02.10.14.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:20:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1376C1FF9E;
 Wed, 10 Feb 2021 22:10:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/21] tests/acceptance: add a new set of tests to exercise
 plugins
Date: Wed, 10 Feb 2021 22:10:47 +0000
Message-Id: <20210210221053.18050-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Message-Id: <20210209182749.31323-7-alex.bennee@linaro.org>
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


