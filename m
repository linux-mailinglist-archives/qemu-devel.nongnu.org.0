Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6896B125475
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 22:16:30 +0100 (CET)
Received: from localhost ([::1]:60774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihggH-0008NY-Ci
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 16:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1ihgVA-0002Ys-Rk
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:05:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1ihgV9-0001PB-4z
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:05:00 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39820)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1ihgV7-0001Ny-FD
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:04:57 -0500
Received: by mail-wr1-x42c.google.com with SMTP id y11so3795286wrt.6
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 13:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fuht1ahwiE11JwSlXF7XmtmpSUzGlU/Kyo3G3cPff64=;
 b=gQCPq6qZu5DUdd7xVvdvEF5JX5UOOrnENRnz50FQXMCXylpSbI4KcA4G+A8hNhM9mH
 GSP1us+iM4V7boPXQCx+yI8rug8xeRw+Pfz6gjjtjbVbN86YfOOO/1fYSDNUBRNppOGy
 kzei1m5gx8DKFb8xR/4zxFf5EEWa77tK/2/eq9Kv1zhKpkeUUWvW8y7/Z5XZsE8PEJmn
 L2DZZ1LjNtx/CNVE8770FNG1PEQgFLeZl7czSRP2kyEmHgLYUciI7JcqOR0AwkDXeF7J
 kFFv4e3Oyx1DJOzIo5tWRjoptsTU2upkIJ+1VbB0xK3679SPspU/iB1s2/cp5DDdbVlY
 1ANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fuht1ahwiE11JwSlXF7XmtmpSUzGlU/Kyo3G3cPff64=;
 b=CLJFm39ATYjRr/kMDIcFPmDq0bFb1WPBbiPeqxk8sA8Tu5aajn+hIT2B2GL0d0KfkG
 66yP0kBFEQeMb4vN64lKFfZjc+GPSsUY8zAWRX5dKbBHciw5tIwkRQkTc2W7hSk27cvL
 22w5ODPV8wj9LexIVaKbCthe9tDSoCIoSk1VdFnRW2jmHxeCGw2o0/HCNhxB6agsbA5Q
 g8SAQmTLaqQsozi+PzRBqGhCYftYTjMB8zEO3c9RLMQuWOyAr0xPMLkUJDuNk4QI7xl4
 fuKZOOxDHPP60Xx71rEZXZ1aGgKk1weIwRrLylte4IL5ZTKt5RKszsKa4kZAbioe1/2Y
 2ixw==
X-Gm-Message-State: APjAAAVSQ+r4WrRE7XYqRob0kgkOg1Hg/9sjXN6qtgJGtAchdQ8zE/g7
 +W2z+EiAwfmORSAaEJOKE1bmAyx49jUz8Q==
X-Google-Smtp-Source: APXvYqx5W1NOBdFU/QKWrYYPtSrzZjo8EyB44NG4snCNmmiI7D2hxg/4oz9XJuQJWtxOkMEocYLyow==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr4935971wrv.18.1576703092472;
 Wed, 18 Dec 2019 13:04:52 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-109-65-2-109.red.bezeqint.net. [109.65.2.109])
 by smtp.gmail.com with ESMTPSA id a133sm3808933wme.29.2019.12.18.13.04.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 18 Dec 2019 13:04:51 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v39 21/22] target/avr: Add Avocado test
Date: Wed, 18 Dec 2019 23:03:28 +0200
Message-Id: <20191218210329.1960-22-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191218210329.1960-1-mrolnik@gmail.com>
References: <20191218210329.1960-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
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
Cc: thuth@redhat.com, Michael Rolnik <mrolnik@gmail.com>,
 me@xcancerberox.com.ar, richard.henderson@linaro.org, dovgaluk@ispras.ru,
 imammedo@redhat.com, philmd@redhat.com, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test is based on
https://github.com/seharris/qemu-avr-tests/tree/master/free-rtos/Demo
demo which. If working correctly, prints 'ABCDEFGHIJKLMNOPQRSTUVWX' out.
it also demostrates that timer and IRQ are working

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/machine_avr6.py | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 tests/acceptance/machine_avr6.py

diff --git a/tests/acceptance/machine_avr6.py b/tests/acceptance/machine_avr6.py
new file mode 100644
index 0000000000..7a7d8afc29
--- /dev/null
+++ b/tests/acceptance/machine_avr6.py
@@ -0,0 +1,58 @@
+#
+# QEMU AVR
+#
+# Copyright (c) 2019 Michael Rolnik <mrolnik@gmail.com>
+#
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation, either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
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
+        rom_sha1= '36c3e67b8755dcf37e06af6730ef5d477b8ed16d'
+        rom_url += '/raw/'
+        rom_url += rom_sha1
+        rom_url += '/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf'
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
-- 
2.17.2 (Apple Git-113)


