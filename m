Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37CD3B37D9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:30:38 +0200 (CEST)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwVzh-0002La-RI
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVxQ-00008F-Pz
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:28:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVxP-0003EH-1Z
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:28:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id m3so4824105wms.4
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UCi9zS+WOU642oVpvfnDDUDAscPjtG7ffJ6K2lD9Qwg=;
 b=TLPuGl1TMUEq/UOZeZ6u3CFhQSinB3sAxHRWZm2TYVRVun6FDuTD8CHJcTkfU7qxHl
 Or3v4oBH0vVJ5IepZbfLh0S/19N7qC5wYqHp9pJgly9y5PTisb0U35SUsAt+GX6dv+MO
 VDA5A/u9qRwfYQsofjaUnS57yKo7NaYcqspk0VBqMInXnFoQ/knNA5RO0T9iEQpFCVgQ
 qgtyDgwz+tYu5ejw0GQmPVQDL/4eNXCI0EWpsw6tVukpOTaM/uWugp6Nb+gne/y5tfsF
 XT1h/s9j7p7dRTmNVSwgDVi1bCth6642rf4oChVvub0k+KQKkgHOdtx+stQjDwFjm1wS
 KIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UCi9zS+WOU642oVpvfnDDUDAscPjtG7ffJ6K2lD9Qwg=;
 b=C48XHq/vEGLgLVZnVt3I/NQ6qPp+KW0dci5sBVSp8XyAyays6tk2ooKpnXr3sOVYOE
 vmpIhJq5dZLBG4LpZLzJn5jN9AqAyVqPPuhr9HzbF5956CjuSCK19K1J6mUp6l5SIs1/
 C38LwSc42n6gg79AuYtHy49dy4/poG1gukUIuA4pi2cg6Hgs6ZNIGvdVN7WGD6rGfaJ2
 CQiG8yLGeDPO9tg8/OAmLzPsYQAveKwV1rwnpY20CdSZBUY+ECs7brlclAGfxwmxp1m9
 ik075B+i73REimloKDRg9bKHV/feJ67KZjDuQ7yfWP4rOkaXKTVHFxmtdKmUKme2SPFh
 9Wwg==
X-Gm-Message-State: AOAM530LPrFnSjLGu0Pf0rpIpgZqM6ez4M9JABoWkB4PdcL8zP4n54z+
 VA3qRXZtMmKWK5LaRXUbZt09wIGsOFHPLg==
X-Google-Smtp-Source: ABdhPJyNwhoGvLwqSjI1MJdyRpZOdiVSjBwwhSGw96BiAU/d1vThocBAYzWzRBFNCiEWvdUPUTjl/Q==
X-Received: by 2002:a05:600c:291:: with SMTP id
 17mr6399367wmk.52.1624566493521; 
 Thu, 24 Jun 2021 13:28:13 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r2sm4251734wrv.39.2021.06.24.13.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:28:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] tests/acceptance: Test PMON on the Fuloong 2E machine
Date: Thu, 24 Jun 2021 22:27:47 +0200
Message-Id: <20210624202747.1433023-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624202747.1433023-1-f4bug@amsat.org>
References: <20210624202747.1433023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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

Test the PMON firmware. As the firmware is not redistributable,
it has to be downloaded manually first. Then it can be used by
providing its path via the PMON_BIN_PATH environment variable:

  $ PMON2E_BIN_PATH=~/images/fuloong2e/pmon_2e.bin \
    AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
    avocado --show=app,console run tests/acceptance/machine_mips_fuloong2e.py
  Fetching asset from tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial
   (1/3) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_pmon_serial_console:
  console: PMON2000 MIPS Initializing. Standby...
  console: ERRORPC=00000000 CONFIG=00030932
  console: PRID=00006302
  console: Init SDRAM Done!
  console: Sizing caches...
  console: Init caches...
  console: godson2 caches found
  console: Init caches done, cfg = 00030932
  console: Copy PMON to execute location...
  console: copy text section done.
  console: Copy PMON to execute location done.
  Uncompressing Bios........................OK,Booting Bios
  PASS (0.25 s)
   (2/3) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_pmon_framebuffer_console:
  [...]
  Uncompressing Bios........................OK,Booting Bios
  console: FREQ
  console: FREI
  console: DONE
  console: TTYI
  console: TTYD
  console: ENVI
  console: MAPV
  console: Mfg  0, Id 60
  console: STDV
  console: SBDD
  console: PPCIH
  console: PCIS
  console: PCIR
  console: PCIW
  console: NETI
  console: RTCL
  console: PCID
  console: VGAI
  console: Default MODE_ID 2
  console: starting radeon init...
  console: radeon init done
  console: FRBI
  console: cfb_console init,fb=b4000000
  console: Video: Drawing the logo ...
  console: CONSOLE_SIZE 450560HSTI
  PASS (4.10 s)
   (3/3) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial:
  console: Linux version 2.6.27.7lemote (root@debian) (gcc version 4.1.3 20080623 (prerelease) (Debian 4.1.2-23)) #6 Fri Dec 12 00:11:25 CST 2008
  console: busclock=33000000, cpuclock=-2145008360,memsize=256,highmemsize=0
  console: console [early0] enabled
  console: CPU revision is: 00006302 (ICT Loongson-2)
  PASS (0.19 s)
  RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 5.10 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/machine_mips_fuloong2e.py | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/acceptance/machine_mips_fuloong2e.py b/tests/acceptance/machine_mips_fuloong2e.py
index 0ac285e2af1..4854ba98560 100644
--- a/tests/acceptance/machine_mips_fuloong2e.py
+++ b/tests/acceptance/machine_mips_fuloong2e.py
@@ -8,15 +8,77 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 import os
+import time
 
 from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
 
+from tesseract_utils import tesseract_available, tesseract_ocr
+
 class MipsFuloong2e(Test):
 
     timeout = 60
 
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    @skipUnless(os.getenv('PMON2E_BIN_PATH'), 'PMON2E_BIN_PATH not available')
+    def test_pmon_serial_console(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:fuloong2e
+        :avocado: tags=endian:little
+        :avocado: tags=device:bonito64
+        :avocado: tags=device:via686b
+        """
+        pmon_hash = 'c812e1695d7b2320036f3ef494976969' # v1.1.2
+        pmon_path = self.fetch_asset('file://' + os.getenv('PMON2E_BIN_PATH'),
+                                     asset_hash=pmon_hash, algorithm='md5')
+
+        self.vm.set_console()
+        self.vm.add_args('-bios', pmon_path)
+        self.vm.launch()
+        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
+        wait_for_console_pattern(self, 'Booting Bios')
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    # Tesseract 4 adds a new OCR engine based on LSTM neural networks. The
+    # new version is faster and more accurate than version 3. The drawback is
+    # that it is still alpha-level software.
+    @skipUnless(tesseract_available(4), 'tesseract v4 OCR tool not available')
+    @skipUnless(os.getenv('PMON2E_BIN_PATH'), 'PMON2E_BIN_PATH not available')
+    def test_pmon_framebuffer_console(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:fuloong2e
+        :avocado: tags=endian:little
+        :avocado: tags=device:bonito64
+        :avocado: tags=device:ati-vga
+        """
+        screenshot_path = os.path.join(self.workdir, 'dump.ppm')
+
+        pmon_hash = 'c812e1695d7b2320036f3ef494976969' # v1.1.2
+        pmon_path = self.fetch_asset('file://' + os.getenv('PMON2E_BIN_PATH'),
+                                     asset_hash=pmon_hash, algorithm='md5')
+
+        self.vm.set_console()
+        self.vm.add_args('-bios', pmon_path,
+                         '-vga', 'std',
+                         '-device', 'ati-vga,model=rv100')
+        self.vm.launch()
+
+        wait_for_console_pattern(self, 'Video: Drawing the logo ...')
+        self.log.info('VM launched, waiting for logo on display')
+        time.sleep(2)
+        wait_for_console_pattern(self, 'CONSOLE_SIZE')
+        self.vm.command('human-monitor-command', command_line='stop')
+        self.vm.command('human-monitor-command',
+                        command_line='screendump %s' % screenshot_path)
+
+        lines = tesseract_ocr(screenshot_path, tesseract_version=4,
+                              tesseract_args='--dpi 128')
+        pmon_version = 'PNON2000 for Loongson, Version 1.1.2' # PNON is enough
+        self.assertIn(pmon_version, lines)
+
     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
     @skipUnless(os.getenv('RESCUE_YL_PATH'), 'RESCUE_YL_PATH not available')
     def test_linux_kernel_isa_serial(self):
-- 
2.31.1


