Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC282334283
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:09:27 +0100 (CET)
Received: from localhost ([::1]:38418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Oo-0002vX-Mn
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1G5-0004gH-UR
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:25 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1G3-0002kh-QZ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:25 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p7so28324902eju.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pvLRFhKRZ46zoLGE2Of04xq5NWvYqMo8l3LmqWGUFBQ=;
 b=IwK8gjMnOpzsE2avGNlBQ5w7FERzLBKlt+MKY4ckwx+ztKXQKA0q2XQhOMOqp0LRPC
 3y3M9Pwdmh/iYNsQg3scHK5lTjUwER1XCoCwv8zW0ziKRQcQEvCmltDSI/eyLFPNPJ0A
 SOuDH2Oglx5EzM+YDmUCRM0zHtdBRS6Z0mPUNC162FFxWA2wyShrD09galSqFsh3/Bvi
 UelD45/gQIOfckOVeJ0qJYrvWPZ7G3WNZHMU5+OueKBVZDMdk07MAIw/zFvYu9dLnkAQ
 2F9fVDjMW8QCtsNO6nHe/0NgWMj6EoY/d11gm0Z4zBSJDHElmoS51oz/yE2Ctm1S8cJm
 7hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pvLRFhKRZ46zoLGE2Of04xq5NWvYqMo8l3LmqWGUFBQ=;
 b=FM3TebXA8wsNlubBgSbVxoHjsH7ilDG0Bcn0HQk+/YNO0HOZVsRy52o/RzeLEIWkhi
 HKmtMWiNnp0gnVvZBO6feCGU3pnCCsVUYABFF2y+2Xxv0qMF8AmEK/b195s/2nSVwHmn
 iVlMOLrJBVqaEfPtXkxT4x/hJ5Z6YVeruM2uUKG27fE2TQDE8mwm3uQyylDvvG47SMi5
 oMsBmoBD7S0hdzogDNbqHOQFIeALbHiN9SYRZcChFokv92l9m75kjB0zGI0YNTEZmTFt
 1uI2GiBtlXVZ7dgzMwomIHSEcYjIH2+HLcOM+qXb472AuT2vhuRNki0KcpdO51PMaU3j
 YT9A==
X-Gm-Message-State: AOAM530M3XPueFKwark5/AJJJ52SlfVAFkCrnvJFEuCI8vBSCkrGSxoO
 Q6Rz0ivb78MNJp0A4cC1Ai/mTA==
X-Google-Smtp-Source: ABdhPJwsUIR9EyMy13g5THHDTjDjO6qooH5yrs+pJSpXEh0RWz7n+DiGDKONgiXdR0wOjGqbHOzx/A==
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr4375981ejj.204.1615392021038; 
 Wed, 10 Mar 2021 08:00:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id jv19sm10355768ejc.74.2021.03.10.08.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3E941FF9C;
 Wed, 10 Mar 2021 16:00:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 13/15] tests/avocado: add boot_xen tests
Date: Wed, 10 Mar 2021 16:00:00 +0000
Message-Id: <20210310160002.11659-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These tests make sure we can boot the Xen hypervisor with a Dom0
kernel using the guest-loader. We currently have to use a kernel I
built myself because there are issues using the Debian kernel images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210303173642.3805-8-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ad004fed5..ea200aae1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2027,6 +2027,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
 F: docs/system/guest-loader.rst
+F: tests/acceptance/boot_xen.py
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
new file mode 100644
index 0000000000..75c2d44492
--- /dev/null
+++ b/tests/acceptance/boot_xen.py
@@ -0,0 +1,118 @@
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
+                         'guest-loader,addr=0x47000000,kernel=%s,bootargs=console=hvc0'
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
+    def test_arm64_xen_411_and_dom0(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        """
+
+        # archive of file from https://deb.debian.org/debian/pool/main/x/xen/
+        xen_url = ('https://fileserver.linaro.org/s/JSsewXGZ6mqxPr5/'
+                   'download?path=%2F&files='
+                   'xen-hypervisor-4.11-arm64_4.11.4%2B37-g3263f257ca-1_arm64.deb')
+        xen_sha1 = '034e634d4416adbad1212d59b62bccdcda63e62a'
+        xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
+        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.11-arm64")
+
+        self.launch_xen(xen_path)
+
+    def test_arm64_xen_414_and_dom0(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        """
+
+        # archive of file from https://deb.debian.org/debian/pool/main/x/xen/
+        xen_url = ('https://fileserver.linaro.org/s/JSsewXGZ6mqxPr5/'
+                   'download?path=%2F&files='
+                   'xen-hypervisor-4.14-arm64_4.14.0%2B80-gd101b417b7-1_arm64.deb')
+        xen_sha1 = 'b9d209dd689ed2b393e625303a225badefec1160'
+        xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
+        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.14-arm64")
+
+        self.launch_xen(xen_path)
+
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


