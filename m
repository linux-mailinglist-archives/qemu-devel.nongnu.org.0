Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C553BA195
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:48:36 +0200 (CEST)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJX1-0002JK-Uv
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLa-0002Wm-1U
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLY-000422-EU
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id u8so12487602wrq.8
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BdMlioqEm9E1wpS8AcjxouwS36MURC9LLrc7wkl7cFg=;
 b=Hn5bncr1Yy/a6wC3znuBznBdEnu5+Zw/DHeB0EvgfWv9hMSdx//p1wZyVZn83eEb7H
 Lt6y9gme/wmxqyS8Iraekg1LqjkZrRBhBLWJQr6TzNDdXK7uz29sM4WvWVDwIW7jOvAJ
 hjnqBOpnl8XTlfAi8ItPRVZWoU1iITjgCCmtpcSLVpEwaFS7yKumDVkw6KbTunXvIM3F
 EaCgaMax1FL1WtH0eZsvqIDe/s+rGfaByHYb2n8nIh9zSyu98dcWklFMpJaE1KRM51Xi
 UT8kUH47lXttYjzwLga2EtVCwzE4ovLQWbIRGk5KtMq4XmcBPtT2no4bKoZikeTcWTXI
 Jq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BdMlioqEm9E1wpS8AcjxouwS36MURC9LLrc7wkl7cFg=;
 b=JjkPDijC0prdZ71iEpyt3tlAEYT4vaVnAmmL0mkPe8aX5+MqoO4HOAcbAHRV6bCu2L
 EwYlfqkPTjXmMrUUgplmW7mFgyQcetg7NKjQGrY6uektVbnefEdkn+Kf0UhFKjF0S4MQ
 lrSsKH3QWD598ipvL/AgYMurEna9GXZrCpk/e9wC58Kx/HXQQXA0lbLvEdY9SQAFWIXt
 dKGBDx+ajpOoDqKo+1uk6P7lrxxiQN162sWvuBbnclCCvGTFvp9Y3amtXgmt3mLI7mSq
 vmlFXw3idZsvKD+fiZ+pjwViEeiwvKBWvlUB1KXVdZQEr3VYI0EvVi3zzwY0dGVsMkrd
 P2sA==
X-Gm-Message-State: AOAM530zHjtTPrOosciLbab6JoQVIiUs8OoLho0c2csmknR/ICqbEGJa
 FFq3jdzw4KIS5qrSFOgUA/PVbULyOCEvZ0kO
X-Google-Smtp-Source: ABdhPJyIOu/wp4EKqCmpmGJGt+SudUyihsDI2H+sfWnF3Cm4Fn6SAebiKHnda5UW+Dc57i/VJKTv+g==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr5825427wrw.89.1625233002810;
 Fri, 02 Jul 2021 06:36:42 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id y20sm12436214wmi.31.2021.07.02.06.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:36:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/18] tests/acceptance: Test Linux on the Fuloong 2E machine
Date: Fri,  2 Jul 2021 15:35:46 +0200
Message-Id: <20210702133557.60317-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
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
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210624202747.1433023-5-f4bug@amsat.org>
---
 MAINTAINERS                                |  1 +
 tests/acceptance/machine_mips_fuloong2e.py | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 tests/acceptance/machine_mips_fuloong2e.py

diff --git a/MAINTAINERS b/MAINTAINERS
index c663dfe4d76..cb8f3ea2c2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1178,6 +1178,7 @@ F: hw/isa/vt82c686.c
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


