Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053171081BB
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Nov 2019 06:11:09 +0100 (CET)
Received: from localhost ([::1]:33936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYkAt-00048M-UP
	for lists+qemu-devel@lfdr.de; Sun, 24 Nov 2019 00:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60580)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1iYk3U-00040v-6p
 for qemu-devel@nongnu.org; Sun, 24 Nov 2019 00:03:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1iYk3S-0007fn-Rh
 for qemu-devel@nongnu.org; Sun, 24 Nov 2019 00:03:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42275)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1iYk3S-0007fI-LS
 for qemu-devel@nongnu.org; Sun, 24 Nov 2019 00:03:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id a15so13378489wrf.9
 for <qemu-devel@nongnu.org>; Sat, 23 Nov 2019 21:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PWvHTATx1P5cJRWP5UbdfJCdwe3FSZcOH5uS+KaaF0k=;
 b=HhMzTSltnJKGQVzDUcu66T4sOaQfMOIPeY0jmmGJ5ojQs2cYGFjrtuWR7d/nuh46Ac
 rS1pI6dlqnPJNMfm4phoCtCzq+2ic/unGqWSialZurXBYjC964OUA714MZulyaNgJ+JR
 1nvcXaTZaLwHpx1GrsyYQVuVm36ENkqDb7GY3tuY852+0NOivbVIETReQFl+33hPB8Vj
 PuMc6mo3OqkF1gbqxi0a6o5Tx5InbFbjyLw3C9S5afFA6fA1/iGL5p2Ou/mrly93FmyQ
 Bgu8UACqsPvhjcnztgnV6lwpeNqHVDNwTgStXBW5c5q6Bz7oVfed4fpVZ78E0BVU9WBY
 fWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PWvHTATx1P5cJRWP5UbdfJCdwe3FSZcOH5uS+KaaF0k=;
 b=USosGP4qNbOVolltm26G8kgLYyMjAaAraFwoy0m1Qe+ubDYbXtreVVscMn7wR+QOwt
 sB9S/tuf5WhCuJ7ye816sthL9XTdsagVZvlUZN6NDT/gy7NkWc3FhRPpj1yqPHtabVYw
 5Ul7iMFQGSi0U9klpa7/Xg2s+xjl4mql3oYPtNdcmDdR12VSLw5q5D/gbDL85jXrj7/i
 FzCLIq0otGp8w6TLZSgrYf68mKQUMM2r9M7EbzZCuWFoBcc1VyvGuqTx43sZWvSLjvIJ
 /FX/W4dZp4ynJKd/JNxmEE+9peK1c4ZLTvs2pfZ+rSRYgoRzJtUdEHD43covW7Ob9Cve
 Y4Dw==
X-Gm-Message-State: APjAAAWpZqXyo0HLtibJI/MCyZidnZw3+BwfnFAtRGXQlXBxDeU6ycIR
 qN1rWsem7nHfpg/PmPQuxkerrQmcdd7JnUWP
X-Google-Smtp-Source: APXvYqzuE+XdU7KiLFU3dtLoez6Up6+y/dvHO5noxs0aCuZnYTAQk2crsvq1psI2fNiwyCMactC23w==
X-Received: by 2002:adf:f445:: with SMTP id f5mr2226674wrp.193.1574571805322; 
 Sat, 23 Nov 2019 21:03:25 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-178-10-38.red.bezeqint.net. [79.178.10.38])
 by smtp.gmail.com with ESMTPSA id t185sm4173976wmf.45.2019.11.23.21.03.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 23 Nov 2019 21:03:24 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v36 16/17] target/avr: Add Avocado test
Date: Sun, 24 Nov 2019 07:02:24 +0200
Message-Id: <20191124050225.30351-17-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191124050225.30351-1-mrolnik@gmail.com>
References: <20191124050225.30351-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
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
 richard.henderson@linaro.org, dovgaluk@ispras.ru, imammedo@redhat.com,
 philmd@redhat.com, aleksandar.m.mail@gmail.com
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
 tests/acceptance/machine_avr6.py | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 tests/acceptance/machine_avr6.py

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
-- 
2.17.2 (Apple Git-113)


