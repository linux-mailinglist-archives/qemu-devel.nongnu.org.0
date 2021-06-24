Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E220F3B37E5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:33:20 +0200 (CEST)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwW2J-0005eq-UQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVxM-0008QQ-5a
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:28:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVxK-0003BH-AS
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:28:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id r3so311518wmq.1
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Adhypnk7BG1yfQh4oI+8s5/C55cxVDofX6w8rqZ/nYQ=;
 b=uvT6nxwGH/9Bz0rq9fnd5TaGA0Wxtwdzx8cJYVXq4rfEo+ZdzF9Q0aEJujTplkUd+w
 RmepZyeVwnND78PNUvbs5blMNGqsAtg5JPg7nymQ+48vkps+G5FTtTOl+KIXmOOq+9jB
 3kBDZMu8EeccuMbBR04IcdkGkOE4VmNuK7obsxgW7r2T54KR9BvZKtqecWmCsHJx4qu+
 dKVJz2rU3sQqokNUqHolwlQEup/duFYZLVg78hVLflAIx3D0u3Sf2ZZQ+i3G9KL05lgA
 oe3b5dr8gExV3UkgSu/8uPu6Ht4YwQKAgFmrNdndtTqc01rxRNJaQExWtG21T9jjzvBo
 zLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Adhypnk7BG1yfQh4oI+8s5/C55cxVDofX6w8rqZ/nYQ=;
 b=BOhVqtJlgdZzAWVIBE6sMlMjILXxBOXpiKhJ4L5yfDXVxdojmJj3tQdT5i9xGs3iAe
 QLY+y4q91XSgzNDzspVREeXzGlmRN/w62AS887aF4xNUkIlT5qnXjLTDZySWUOIx5eaE
 pUOnAZ9HZNWD+o1P+ReOSnVs4rer0KCu9TliOKt2kyTwvGsDrkU62M78/kHUyWm+gtzt
 L2+GxDmEl4dgWMuaExZjPC1n0T8Kqr5RUWQ7u20pTnOt8DIaKCeO7q28JhhM4jVSvPRN
 R4wak2exmXEKis48ejCqTqRrzsvfJCwJU2QFOxzlbpakzX9Nddma1XUx/vHRJ7fSEvei
 M2AQ==
X-Gm-Message-State: AOAM533QBLq3b4JAby7aRh/uxDquhdZoNQ02M2Qqnc3Lbuw/YmZTNyVo
 SscXfNf8RXUbG4t3Le+aW2kwY9ordO3Lmg==
X-Google-Smtp-Source: ABdhPJxbfmvU2ncizXBabK7KltNeOWnY/t46G7Se/Iz2ctUESHtz82kNTmexz3Wz0Fb8eazIK8lRPg==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr6518661wma.5.1624566488830;
 Thu, 24 Jun 2021 13:28:08 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z9sm9545609wmf.43.2021.06.24.13.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:28:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] tests/acceptance: Test Linux on the Fuloong 2E machine
Date: Thu, 24 Jun 2021 22:27:46 +0200
Message-Id: <20210624202747.1433023-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624202747.1433023-1-f4bug@amsat.org>
References: <20210624202747.1433023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test the kernel from Lemote rescue image:
http://dev.lemote.com/files/resource/download/rescue/rescue-yl
Once downloaded, set the RESCUE_YL_PATH environment variable
to point to the downloaded image and test as:

  $ RESCUE_YL_PATH=~/images/fuloong2e/rescue-yl \
    AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
    avocado --show=app,console run tests/acceptance/machine_mips_fuloong2e.py
  Fetching asset from tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial
   (1/1) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial:
  console: Linux version 2.6.27.7lemote (root@debian) (gcc version 4.1.3 20080623 (prerelease) (Debian 4.1.2-23)) #6 Fri Dec 12 00:11:25 CST 2008
  console: busclock=33000000, cpuclock=-2145008360,memsize=256,highmemsize=0
  console: console [early0] enabled
  console: CPU revision is: 00006302 (ICT Loongson-2)
  PASS (0.16 s)
  JOB TIME   : 0.51 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS                                |  1 +
 tests/acceptance/machine_mips_fuloong2e.py | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 tests/acceptance/machine_mips_fuloong2e.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a041eaf864..1c515b4ba14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1176,6 +1176,7 @@ F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
 F: hw/usb/vt82c686-uhci-pci.c
 F: include/hw/isa/vt82c686.h
+F: tests/acceptance/machine_mips_fuloong2e.py
 
 Loongson-3 virtual platforms
 M: Huacai Chen <chenhuacai@kernel.org>
diff --git a/tests/acceptance/machine_mips_fuloong2e.py b/tests/acceptance/machine_mips_fuloong2e.py
new file mode 100644
index 00000000000..0ac285e2af1
--- /dev/null
+++ b/tests/acceptance/machine_mips_fuloong2e.py
@@ -0,0 +1,42 @@
+# Functional tests for the Lemote Fuloong-2E machine.
+#
+# Copyright (c) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+
+from avocado import skipUnless
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class MipsFuloong2e(Test):
+
+    timeout = 60
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    @skipUnless(os.getenv('RESCUE_YL_PATH'), 'RESCUE_YL_PATH not available')
+    def test_linux_kernel_isa_serial(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:fuloong2e
+        :avocado: tags=endian:little
+        :avocado: tags=device:bonito64
+        :avocado: tags=device:via686b
+        """
+        # Recovery system for the Yeeloong laptop
+        # (enough to test the fuloong2e southbridge, accessing its ISA bus)
+        # http://dev.lemote.com/files/resource/download/rescue/rescue-yl
+        kernel_hash = 'ec4d1bd89a8439c41033ca63db60160cc6d6f09a'
+        kernel_path = self.fetch_asset('file://' + os.getenv('RESCUE_YL_PATH'),
+                                       asset_hash=kernel_hash)
+
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path)
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Linux version 2.6.27.7lemote')
+        cpu_revision = 'CPU revision is: 00006302 (ICT Loongson-2)'
+        wait_for_console_pattern(self, cpu_revision)
-- 
2.31.1


