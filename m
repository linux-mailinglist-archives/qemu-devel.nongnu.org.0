Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE6B81ED6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 16:17:05 +0200 (CEST)
Received: from localhost ([::1]:54310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hudnM-0000ce-6t
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 10:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mrolnik@gmail.com>) id 1hudky-000409-5i
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:14:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1hudkw-0006s8-RY
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:14:36 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55710)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1hudkw-0006rW-LS
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:14:34 -0400
Received: by mail-wm1-x342.google.com with SMTP id a15so74922998wmj.5
 for <qemu-devel@nongnu.org>; Mon, 05 Aug 2019 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/aFiK1DjmQocsW5DVTZI7IxatWlz8yacEpmE1egYvGw=;
 b=sBZVy7gAev6ZxBhYL1FgsuWHPUoJxRso/KhAL4XFaJaZm9bYfbT2tBRWrX+utNWv2V
 qrJ/aSKN2Ri3RgUmMsMVz6NWtDInH2M7Zq9eNqrqihT/HZbg68DX5gKGh8EUThnbQ+lh
 arxXxUoMtSw9abyWpdVNMuQgoWfAeB4C1uHpO/mywpinuqkU9Ahd5zJ4Sr+6ZQKyVofe
 plGiO2flqtcrJDJ1G8qyF1qq3fUh8HGLnRkWjYZJWZa80owucmK18k6eTLh1LiwV2tVF
 ne/yRUafL7vtTdKw2aFoWXD6ej2PlQQGKzf150PLnPZbMkxOJ0n485otLH75Qp9/UYCz
 P46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/aFiK1DjmQocsW5DVTZI7IxatWlz8yacEpmE1egYvGw=;
 b=rxu8phqZkkPAs3fSf1fPdpip4hREXmBNwGviQLJETs0kBL7vpzIoymH99TWI7yZQEK
 VSh1hyPZjcRYzbiJtt/wsLWWmTgMR/UU6r/SVlAQ1tcv/PippkeVm91Ml4hT2X7eMWSn
 PoCHIY5282Oexk9wRilyryV7Fu2BhxZgw4/4/kL4MyFAywTTMzGPXlUCJ8DLoLlrQsyB
 K0upW9BSk12ztoEj+lFikF2F3FSnmthJO/5Mz45M3EE9QK2azKG8fDARnI4WKmoDrJBT
 5AOfW350iLkUIIvYYOxEfjb9NJWbyUbqmgdPVgvKw72xuIBXdsy2FBkwwIsEEtHVOuVv
 vI0g==
X-Gm-Message-State: APjAAAVcFJ6AYPyFEg/mLog161KHWepEWDLtLWv8UV+M2xN8jB3vPnuF
 cit3og7xM4G2jhoweHSTw2jhX7yYttV9ThGU
X-Google-Smtp-Source: APXvYqxWiSechKVKmyipo5RHvg3er3t5KvvWIn3p0XsajM+1fk9u2CzIwHsvASq4AFUbsE02DZSfPQ==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr18731638wmh.100.1565014473337; 
 Mon, 05 Aug 2019 07:14:33 -0700 (PDT)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-182-81-63.red.bezeqint.net. [79.182.81.63])
 by smtp.gmail.com with ESMTPSA id v23sm75256211wmj.32.2019.08.05.07.14.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 07:14:32 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 17:14:08 +0300
Message-Id: <20190805141408.89268-9-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20190805141408.89268-1-mrolnik@gmail.com>
References: <20190805141408.89268-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH for 4.2 v28 8/8] target/avr: Add tests
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
Cc: thuth@redhat.com, dovgaluk@ispras.ru, richard.henderson@linaro.org,
 Michael Rolnik <mrolnik@gmail.com>, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1. Avocado test
    The test is based on
    https://github.com/seharris/qemu-avr-tests/tree/master/free-rtos/Demo
    demo which. If working correctly, prints 'ABCDEFGHIJKLMNOPQRSTUVWX' out.
    it also demostrates that timer and IRQ are working

2. Boot serial test
    Prinit out 'T' through serial port

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/Makefile.include           |  2 ++
 tests/acceptance/machine_avr6.py | 36 ++++++++++++++++++++++++++++++++
 tests/boot-serial-test.c         | 10 +++++++++
 3 files changed, 48 insertions(+)
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
index 24852d4c7d..22cbaccc1b 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -16,6 +16,15 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
+static const uint8_t bios_avr[] = {
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
@@ -92,6 +101,7 @@ typedef struct testdef {
 
 static testdef_t tests[] = {
     { "alpha", "clipper", "", "PCI:" },
+    { "avr", "sample", "", "T", sizeof(bios_avr), NULL, bios_avr },
     { "ppc", "ppce500", "", "U-Boot" },
     { "ppc", "40p", "-vga none -boot d", "Trying cd:," },
     { "ppc", "g3beige", "", "PowerPC,750" },
-- 
2.17.2 (Apple Git-113)


