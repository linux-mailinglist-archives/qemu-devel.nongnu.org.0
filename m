Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2116E27C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 10:28:46 +0200 (CEST)
Received: from localhost ([::1]:43058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoOFx-0000W1-FT
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 04:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50355)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mrolnik@gmail.com>) id 1hoOEQ-0002vR-R8
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 04:27:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1hoOEP-0003cs-Cx
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 04:27:10 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36808)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1hoOEP-0003cQ-6q
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 04:27:09 -0400
Received: by mail-wr1-x442.google.com with SMTP id n4so31410076wrs.3
 for <qemu-devel@nongnu.org>; Fri, 19 Jul 2019 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MswsMcusFMRoCStwb3d6LqZBFUU85lqt8dkB+FLKWCY=;
 b=RbBmInfhgsjynk98HU1QvHJl21t5u839DBplCTdVNPflxv0D1DjBHcajVfRodTSZP/
 Y5phQn5/fQ9Hpx5DpHqTqRKG7ITa+85MmDPTxvZLHuTM5OHw8AyWVI/8e7kkyXoZEaQF
 OlTEgW7H4KY9jhoAkcNCX6jcTL8SUPb94cE6jdKdcaTgcHu5O8hwJuISEkc+/nIJa26I
 YqHJ3yyJWAtgZYA5dKkqmnjZlWXt7P5xpv2E+TKDXLYF2IgtVTa5EFlyNIdLPxLwmYBo
 d1A/vfbEAy2R5szyzkzCFueuYfbXHJ/PSj1EzRZAYZdvk3oSWUmaKPRoagrh4zY/YMAp
 C/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MswsMcusFMRoCStwb3d6LqZBFUU85lqt8dkB+FLKWCY=;
 b=UL1xESNvNdzzkaLOKycx1n2cktlXEMy4hDbuN1Z4nY7M5x8DFhwoe3mEomuTAVHx6G
 wVfOrw7oBHD9pXxAygZXiTJy41FHql2SFKJqJM7BsGjA+dWeyz5HJAw9xchAHHLMp8vd
 Od3BdRGWAgPUE/y5nZ2vUep1ECOar4KT+DrsRrs60f7XsKaxU7RhVcetMw+yVDEkq39V
 JsW2j6CokgdUfAuI6wBtZ5BdW87pjrNvds1u1CdfHJFAzil2i+YtfjabU9rcbQMWuitr
 4lv6u78qh8PdsA8+Dj8uh0++xZtkww6ssiHz21CsZJf2JxCK1wvHQ4qvB9XKw4/csVKX
 BxVA==
X-Gm-Message-State: APjAAAWYMUswrC2VdwB7pJWgXS/DW/n8qDYJginj6rmF+O0PmhZfOGM6
 y/08Fx8Ei6W16gXVz8ycCk9qZIWeBjg=
X-Google-Smtp-Source: APXvYqwEA/nD1YwbSu1eJgIJfGC950+ETKDucgbDP8NsF0LkZ9PvOzWGnnbzSac9pgGYvOLlbVmuGA==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr56386518wrv.164.1563524827817; 
 Fri, 19 Jul 2019 01:27:07 -0700 (PDT)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-177-34-186.red.bezeqint.net. [79.177.34.186])
 by smtp.gmail.com with ESMTPSA id v15sm29720696wrt.25.2019.07.19.01.27.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 19 Jul 2019 01:27:07 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 11:26:47 +0300
Message-Id: <20190719082647.18113-9-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20190719082647.18113-1-mrolnik@gmail.com>
References: <20190719082647.18113-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v27 8/8] target/avr: Add tests
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
Cc: philmd@redhat.com, richard.henderson@linaro.org,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1. Avocado test
    The test is based on
    https://github.com/seharris/qemu-avr-tests/tree/master/free-rtos/Demo
    demo which, If working correctly, prints 'ABCDEFGHIJKLMNOPQRSTUVWX' out

2. Boot serial test
    Prinit out 'T' through serial port

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 tests/Makefile.include           |  2 ++
 tests/acceptance/machine_avr6.py | 36 ++++++++++++++++++++++++++++++++
 tests/boot-serial-test.c         | 12 +++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 tests/acceptance/machine_avr6.py

diff --git a/tests/Makefile.include b/tests/Makefile.include
index fd7fdb8658..8a186dcc23 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -201,6 +201,8 @@ check-qtest-i386-y += tests/test-x86-cpuid-compat$(EXESUF)
 check-qtest-i386-y += tests/numa-test$(EXESUF)
 check-qtest-x86_64-y += $(check-qtest-i386-y)
 
+check-qtest-avr-y += tests/boot-serial-test$(EXESUF)
+
 check-qtest-alpha-y += tests/boot-serial-test$(EXESUF)
 check-qtest-alpha-$(CONFIG_VGA) += tests/display-vga-test$(EXESUF)
 
diff --git a/tests/acceptance/machine_avr6.py b/tests/acceptance/machine_avr6.py
new file mode 100644
index 0000000000..0601080b01
--- /dev/null
+++ b/tests/acceptance/machine_avr6.py
@@ -0,0 +1,36 @@
+import logging
+import time
+import distutils.spawn
+
+from avocado import skipUnless
+from avocado_qemu import Test
+from avocado.utils import process
+
+class AVR6Machine(Test):
+    timeout = 5
+
+    def test_freertos(self):
+        """
+        :avocado: tags=arch:avr
+        :avocado: tags=machine:sample
+        """
+        """
+        https://github.com/seharris/qemu-avr-tests/raw/master/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf
+        constantly prints out 'ABCDEFGHIJKLMNOPQRSTUVWXABCDEFGHIJKLMNOPQRSTUVWX'
+        """
+        rom_url = 'https://github.com/seharris/qemu-avr-tests'
+        rom_url += '/raw/master/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf'
+        rom_hash = '7eb521f511ca8f2622e0a3c5e8dd686efbb911d4'
+        rom_path = self.fetch_asset(rom_url, asset_hash=rom_hash)
+
+        self.vm.set_machine('sample')
+        self.vm.add_args('-bios', rom_path)
+        self.vm.add_args('-nographic')
+        self.vm.launch()
+
+        time.sleep(2)
+        self.vm.shutdown()
+
+        match = 'ABCDEFGHIJKLMNOPQRSTUVWXABCDEFGHIJKLMNOPQRSTUVWX'
+
+        self.assertIn(match, self.vm.get_log())
diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index 24852d4c7d..73d273b73f 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -16,6 +16,17 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
+static const uint8_t bios_avr[] = {
+    0x89, 0xe1,             /* ldi r24, 0x19   */
+    0x80, 0x93, 0xc5, 0x00, /* sts 0x00C5, r24 ; set baud rate to 38400 */
+    0x88, 0xe0,             /* ldi r24, 0x08   */
+    0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
+    0x86, 0xe0,             /* ldi r24, 0x06   */
+    0x80, 0x93, 0xc2, 0x00, /* sts 0x00C2, r24 ; Set the data bits to 8 */
+    0x84, 0xe5,             /* ldi r24, 0x54   */
+    0x80, 0x93, 0xc6, 0x00, /* sts 0x00C6, r24 ; Output 'T' */
+};
+
 static const uint8_t kernel_mcf5208[] = {
     0x41, 0xf9, 0xfc, 0x06, 0x00, 0x00,     /* lea 0xfc060000,%a0 */
     0x10, 0x3c, 0x00, 0x54,                 /* move.b #'T',%d0 */
@@ -92,6 +103,7 @@ typedef struct testdef {
 
 static testdef_t tests[] = {
     { "alpha", "clipper", "", "PCI:" },
+    { "avr", "sample", "", "T", sizeof(bios_avr), NULL, bios_avr },
     { "ppc", "ppce500", "", "U-Boot" },
     { "ppc", "40p", "-vga none -boot d", "Trying cd:," },
     { "ppc", "g3beige", "", "PowerPC,750" },
-- 
2.17.2 (Apple Git-113)


