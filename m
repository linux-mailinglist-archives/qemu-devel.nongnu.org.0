Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3738319119
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:32:59 +0100 (CET)
Received: from localhost ([::1]:57140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFpq-0007kI-TD
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFdK-0005fs-Rw
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:20:02 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFdI-0005H6-SW
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:20:02 -0500
Received: by mail-wr1-x435.google.com with SMTP id 7so4984267wrz.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97euSTerjez5Tce8hHGcMNp4cX8yrwBdXJFrXOC2JXc=;
 b=xbD5H3NYhzAJ7qvapOjyovl4bg42BELbyrNRG6zw1q3UPUyzd8jX7jexxdcmxLVxTE
 rv1vIaa1IaulbpkTLDoYY+P8dN2ozs6OZq+itR/iusbN4d3LFziXoMfWzdnCH5SXEArn
 w5sulFaqxDBgw8+ZlxFQYCh/Vb9XFA7i04sms+qLj1NzzQu9wvKkWKWIgxDCpeO8yk5g
 s8F3Hs71+5tVvQvX8ionKzRg9bouu6aWKo9DXTGFQunviL69RSe57aiUtkXl/ZEaEw9C
 wzmpyMj337gzqdX8P9GcEhngmj3qSngmBF7Xzb+FfAJ87MCAWpjgWHrXO2WveLj3LAA+
 FMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97euSTerjez5Tce8hHGcMNp4cX8yrwBdXJFrXOC2JXc=;
 b=XK/76a/s7CoAgbMD4MYRtvwNJlZaljfxsiSLh3ZU48/zq98K9+x0Ybd8l6btRDEbFK
 sQ12NxIVzII6HmE4HG7E9z0bk0uicZ00mUYGFOp2fmp3CQHtteU3HZqfQ0pQu69onNQo
 yaBEPcW6vKYVLqpCukJjZDEtdWdmDfLE053kgcmeTfC7ImQb0MpAf8qkcz16HrojmU6g
 CeKQqaFu0qvSjGKtr2YaEMcw/Nm5XQQy7om7JFy7tfRt5eWllVtXbVyBbhvtFZ5IaLxI
 1IWglY9DRHbvOaKkamhC3PsLyiIbMumlhmmXybKu9ujpcghyGUYvXaN0spLLUtHts17g
 WZzg==
X-Gm-Message-State: AOAM532PXXXqTSVOQpzpN1HzhTFpkBle/raV5C9Dh7LtnkBr10NaUNUu
 NPiGlhQjGPYlEMnTPd0ix8L4yA==
X-Google-Smtp-Source: ABdhPJyzRo8kcYPUXSrP5mf6sQeEw14/2FdcWAVQ8gyif+dPFUJ6YCsxJGyHCsTfJsdULjTJavJKJw==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr1759324wrr.191.1613063999472; 
 Thu, 11 Feb 2021 09:19:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm5496898wrs.25.2021.02.11.09.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E48451FF93;
 Thu, 11 Feb 2021 17:19:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 7/7] tests/avocado: add boot_xen tests
Date: Thu, 11 Feb 2021 17:19:45 +0000
Message-Id: <20210211171945.18313-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211171945.18313-1-alex.bennee@linaro.org>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, xen-devel@lists.xenproject.org,
 stefano.stabellini@xilinx.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These tests make sure we can boot the Xen hypervisor with a Dom0
kernel using the guest-loader. We currently have to use a kernel I
built myself because there are issues using the Debian kernel images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS                  |   1 +
 tests/acceptance/boot_xen.py | 117 +++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 tests/acceptance/boot_xen.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 853f174fcf..537ca7a6f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1998,6 +1998,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
 F: docs/system/guest-loader.rst
+F: tests/acceptance/boot_xen.py
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
new file mode 100644
index 0000000000..8c7e091d40
--- /dev/null
+++ b/tests/acceptance/boot_xen.py
@@ -0,0 +1,117 @@
+# Functional test that boots a Xen hypervisor with a domU kernel and
+# checks the console output is vaguely sane .
+#
+# Copyright (c) 2020 Linaro
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import os
+
+from avocado import skipIf
+from avocado_qemu import wait_for_console_pattern
+from boot_linux_console import LinuxKernelTest
+
+
+class BootXenBase(LinuxKernelTest):
+    """
+    Boots a Xen hypervisor with a Linux DomU kernel.
+    """
+
+    timeout = 90
+    XEN_COMMON_COMMAND_LINE = 'dom0_mem=128M loglvl=all guest_loglvl=all'
+
+    def fetch_guest_kernel(self):
+        # Using my own built kernel - which works
+        kernel_url = ('https://fileserver.linaro.org/'
+                      's/JSsewXGZ6mqxPr5/download?path=%2F&files='
+                      'linux-5.9.9-arm64-ajb')
+        kernel_sha1 = '4f92bc4b9f88d5ab792fa7a43a68555d344e1b83'
+        kernel_path = self.fetch_asset(kernel_url,
+                                       asset_hash=kernel_sha1)
+
+        return kernel_path
+
+    def launch_xen(self, xen_path):
+        """
+        Launch Xen with a dom0 guest kernel
+        """
+        self.log.info("launch with xen_path: %s", xen_path)
+        kernel_path = self.fetch_guest_kernel()
+
+        self.vm.set_console()
+
+        xen_command_line = self.XEN_COMMON_COMMAND_LINE
+        self.vm.add_args('-machine', 'virtualization=on',
+                         '-cpu', 'cortex-a57',
+                         '-m', '768',
+                         '-kernel', xen_path,
+                         '-append', xen_command_line,
+                         '-device',
+                         "guest-loader,addr=0x47000000,kernel=%s,bootargs=console=hvc0"
+                         % (kernel_path))
+
+        self.vm.launch()
+
+        console_pattern = 'VFS: Cannot open root device'
+        wait_for_console_pattern(self, console_pattern, "Panic on CPU 0:")
+
+
+class BootXen(BootXenBase):
+
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+    def test_arm64_xen_411_and_dom0(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        """
+        xen_url = ('https://deb.debian.org/debian/'
+                   'pool/main/x/xen/'
+                   'xen-hypervisor-4.11-arm64_4.11.4+37-g3263f257ca-1_arm64.deb')
+        xen_sha1 = '034e634d4416adbad1212d59b62bccdcda63e62a'
+        xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
+        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.11-arm64")
+
+        self.launch_xen(xen_path)
+
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+    def test_arm64_xen_414_and_dom0(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        """
+        xen_url = ('https://deb.debian.org/debian/'
+                   'pool/main/x/xen/'
+                   'xen-hypervisor-4.14-arm64_4.14.0+80-gd101b417b7-1_arm64.deb')
+        xen_sha1 = 'b9d209dd689ed2b393e625303a225badefec1160'
+        xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
+        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.14-arm64")
+
+        self.launch_xen(xen_path)
+
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+    def test_arm64_xen_415_and_dom0(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        """
+
+        xen_url = ('https://fileserver.linaro.org/'
+                   's/JSsewXGZ6mqxPr5/download'
+                   '?path=%2F&files=xen-upstream-4.15-unstable.deb')
+        xen_sha1 = 'fc191172b85cf355abb95d275a24cc0f6d6579d8'
+        xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
+        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.15-unstable")
+
+        self.launch_xen(xen_path)
-- 
2.20.1


