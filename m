Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60F68D3B1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:10:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKul-00024o-76; Tue, 07 Feb 2023 05:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKug-0001qv-7S; Tue, 07 Feb 2023 05:09:22 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKud-0002Zj-1F; Tue, 07 Feb 2023 05:09:21 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zP43Mxmz4xxJ;
 Tue,  7 Feb 2023 21:08:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zP23Dbkz4xGR;
 Tue,  7 Feb 2023 21:08:54 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 24/25] tests/avocado: Test Aspeed Zephyr SDK v00.01.08 on
 AST1030 board
Date: Tue,  7 Feb 2023 11:07:43 +0100
Message-Id: <20230207100744.698694-25-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Add a very quick test that runs some commands in a Zephyr shell:

  $ tests/venv/bin/avocado --show=app,console run -t os:zephyr tests/avocado
  (2/2) tests/avocado/machine_aspeed.py:AST1030Machine.test_ast1030_zephyros_1_07:
  console: *** Booting Zephyr OS build v00.01.07  ***
  console: ast1030_evb demo
  console: SOC: AST1030-A1
  console: uart:~$ kernel stacks
  console: 0x36910 wdt_background (real size 1024):	unused 988	usage 36 / 1024 (3 %)
  console: 0x36ad8 shell_uart (real size 4096):	unused 3084	usage 1012 / 4096 (24 %)
  console: 0x2edb8 ADC0       (real size 400):	unused 260	usage 140 / 400 (35 %)
  console: 0x2f0f0 ADC1       (real size 400):	unused 260	usage 140 / 400 (35 %)
  console: 0x3b098 sysworkq   (real size 1024):	unused 860	usage 164 / 1024 (16 %)
  console: 0x36cc0 usbdworkq  (real size 1024):	unused 860	usage 164 / 1024 (16 %)
  console: 0x36bd8 usbworkq   (real size 1024):	unused 860	usage 164 / 1024 (16 %)
  console: 0x36a10 logging    (real size 768):	unused 548	usage 220 / 768 (28 %)
  console: 0x36ef8 idle 00    (real size 320):	unused 268	usage 52 / 320 (16 %)
  console: 0x47800 IRQ 00     (real size 2048):	unused 1504	usage 544 / 2048 (26 %)
  console: uart:~$ otp info scu
  console: SCU     BIT   reg_protect     Description
  console: ____________________________________________________________________
  console: 0x500   0x0   0x0             Disable ARM CM4 CPU boot (TXD5)
  console: 0x500   0x1   0x0            /Reserved
  console: 0x500   0x2   0x0            \ "
  console: 0x500   0x3   0x0             Address offset of single chip ABR mode
  console: 0x500   0x4   0x0            /Reserved
  console: 0x500   0x5   0x0            | "
  console: 0x500   0x6   0x0            | "
  console: 0x500   0x7   0x0            | "
  console: 0x500   0x8   0x0            | "
  console: 0x500   0x9   0x0            | "
  console: 0x500   0xA   0x0            | "
  console: 0x500   0xB   0x0            | "
  console: 0x500   0xC   0x0            | "
  console: 0x500   0xD   0x0            | "
  console: 0x500   0xE   0x0            | "
  console: 0x500   0xF   0x0            | "
  console: 0x500   0x10  0x0            \ "
  console: 0x500   0x11  0x0             Disabl3 ARM JTAG debug
  console: 0x500   0x12  0x0            /Reserved
  console: 0x500   0x13  0x0            | "
  console: 0x500   0x14  0x0            | "
  console: 0x500   0x15  0x0            | "
  console: 0x500   0x16  0x0            | "
  console: 0x500   0x17  0x0            | "
  console: 0x500   0x18  0x0            | "
  console: 0x500   0x19  0x0            | "
  console: 0x500   0x1A  0x0            | "
  console: 0x500   0x1B  0x0            | "
  console: 0x500   0x1C  0x0            | "
  console: 0x500   0x1D  0x0            | "
  console: 0x500   0x1E  0x0            | "
  console: 0x500   0x1F  0x0            \ "
  console: 0x510   0x0   0x0            /Reserved
  console: 0x510   0x1   0x0            | "
  console: 0x510   0x2   0x0            | "
  console: 0x510   0x3   0x0            \ "
  console: 0x510   0x4   0x0             Disable debug interfaces
  console: 0x510   0x5   0x0            /Reserved
  console: 0x510   0x6   0x0            | "
  console: 0x510   0x7   0x0            \ "
  console: 0x510   0x8   0x0             Enable boot from Uart5 by Pin Strap
  console: 0x510   0x9   0x0            /Reserved
  console: 0x510   0xA   0x0            \ "
  console: 0x510   0xB   0x0             Enable boot SPI ABR
  console: 0x510   0xC   0x0             Boot SPI ABR Mode
  console: 0x510   0xD   0x0            /Boot SPI flash size
  console: 0x510   0xE   0x0            | "
  console: 0x510   0xF   0x0            \ "
  console: 0x510   0x10  0x0            /Reserved
  console: 0x510   0x11  0x0            | "
  console: 0x510   0x12  0x0            | "
  console: 0x510   0x13  0x0            | "
  console: 0x510   0x14  0x0            | "
  console: 0x510   0x15  0x0            \ "
  console: 0x510   0x16  0x0             Enable boot SPI auxiliary control pins
  console: 0x510   0x19  0x0            /Reserved
  console: 0x510   0x1A  0x0            | "
  console: 0x510   0x1B  0x0            | "
  console: 0x510   0x1C  0x0            | "
  console: 0x510   0x1D  0x0            | "
  console: 0x510   0x1E  0x0            | "
  console: 0x510   0x1F  0x0            \ "
  console: 0x510   0x1E  0x0             Enable dedicate GPIO strap pins
  console: 0x510   0x1F  0x0             Enable Secure Boot by Pin Strap
  console: uart:~$ hwinfo devid
  console: Length: 8
  console: ID: 0x0000018000000180
  console: uart:~$ crypto aes256_cbc_vault
  console: aes256_cbc vault key 1
  console: Was waiting for:
  console: 6b c1 be e2 2e 40 9f 96 e9 3d 7e 11 73 93 17 2a
  console: ae 2d 8a 57 1e 03 ac 9c 9e b7 6f ac 45 af 8e 51
  console: 30 c8 1c 46 a3 5c e4 11 e5 fb c1 19 1a 0a 52 ef
  console: f6 9f 24 45 df 4f 9b 17 ad 2b 41 7b e6 6c 37 10
  console: But got:
  console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  console: uart:~$ random get
  console: 0x862460d
  console: uart:~$ i2c scan I2C_0
  console: 0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
  console: 00:             -- -- -- -- -- -- -- -- -- -- -- --
  console: 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 70: -- -- -- -- -- -- -- --
  console: 1 devices found on I2C_0
  console: uart:~$ kernel uptime
  console: Uptime: 9897 ms
  console: uart:~$ kernel reboot warm
  console: *** Booting Zephyr OS build v00.01.07  ***
  PASS (1.08 s)

Ref: https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.07/Aspeed_Zephy_SDK_User_Guide_v00.01.07.pdf

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 41 ++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 1cab946727..ddf05b3617 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -22,10 +22,11 @@ class AST1030Machine(QemuSystemTest):
 
     timeout = 10
 
-    def test_ast1030_zephyros(self):
+    def test_ast1030_zephyros_1_04(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:ast1030-evb
+        :avocado: tags=os:zephyr
         """
         tar_url = ('https://github.com/AspeedTech-BMC'
                    '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip')
@@ -41,6 +42,44 @@ def test_ast1030_zephyros(self):
         exec_command_and_wait_for_pattern(self, "help",
                                           "Available commands")
 
+    def test_ast1030_zephyros_1_07(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast1030-evb
+        :avocado: tags=os:zephyr
+        """
+        tar_url = ('https://github.com/AspeedTech-BMC'
+                   '/zephyr/releases/download/v00.01.07/ast1030-evb-demo.zip')
+        tar_hash = '40ac87eabdcd3b3454ce5aad11fedc72a33ecda2'
+        tar_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(tar_path, self.workdir)
+        kernel_file = self.workdir + "/ast1030-evb-demo/zephyr.bin"
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_file,
+                         '-nographic')
+        self.vm.launch()
+        wait_for_console_pattern(self, "Booting Zephyr OS")
+        for shell_cmd in [
+                'kernel stacks',
+                'otp info conf',
+                'otp info scu',
+                'hwinfo devid',
+                'crypto aes256_cbc_vault',
+                'random get',
+                'jtag JTAG1 sw_xfer high TMS',
+                'adc ADC0 resolution 12',
+                'adc ADC0 read 42',
+                'adc ADC1 read 69',
+                'i2c scan I2C_0',
+                'i3c attach I3C_0',
+                'hash test',
+                'kernel uptime',
+                'kernel reboot warm',
+                'kernel uptime',
+                'kernel reboot cold',
+                'kernel uptime',
+        ]: exec_command_and_wait_for_pattern(self, shell_cmd, "uart:~$")
+
 class AST2x00Machine(QemuSystemTest):
 
     timeout = 90
-- 
2.39.1


