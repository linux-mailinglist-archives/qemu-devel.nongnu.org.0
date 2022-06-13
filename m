Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C303E548567
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 15:29:50 +0200 (CEST)
Received: from localhost ([::1]:38296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0k8b-0003dL-L8
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 09:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k56-0000Fm-Lj; Mon, 13 Jun 2022 09:26:12 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:58171
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k54-0004Sj-AI; Mon, 13 Jun 2022 09:26:12 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC4v69d9z4yZ7;
 Mon, 13 Jun 2022 23:26:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC4p3vB9z4yXP;
 Mon, 13 Jun 2022 23:26:02 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 02/17] test/avocado/machine_aspeed.py: Move OpenBMC tests
Date: Mon, 13 Jun 2022 15:25:24 +0200
Message-Id: <20220613132539.2199772-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220613132539.2199772-1-clg@kaod.org>
References: <20220613132539.2199772-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's easier to run. Keep test_arm_ast2600_debian() under the
boot_linux_console.py file because it requires the extract_from_deb()
helper. We could remove it when we have tests for the AST2600.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/boot_linux_console.py | 43 -------------------------
 tests/avocado/machine_aspeed.py     | 50 +++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 43 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 45a2ceda2227..6b1533c17c8b 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1043,49 +1043,6 @@ def test_arm_vexpressa9(self):
         self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
         self.do_test_advcal_2018('16', tar_hash, 'winter.zImage')
 
-    def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:palmetto-bmc
-        """
-
-        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
-                     'obmc-phosphor-image-palmetto.static.mtd')
-        image_hash = ('3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d')
-        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
-                                      algorithm='sha256')
-
-        self.do_test_arm_aspeed(image_path)
-
-    def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:romulus-bmc
-        """
-
-        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
-                     'obmc-phosphor-image-romulus.static.mtd')
-        image_hash = ('820341076803f1955bc31e647a512c79f9add4f5233d0697678bab4604c7bb25')
-        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
-                                      algorithm='sha256')
-
-        self.do_test_arm_aspeed(image_path)
-
-    def do_test_arm_aspeed(self, image):
-        self.vm.set_console()
-        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
-                         '-net', 'nic')
-        self.vm.launch()
-
-        self.wait_for_console_pattern("U-Boot 2016.07")
-        self.wait_for_console_pattern("## Loading kernel from FIT Image at 20080000")
-        self.wait_for_console_pattern("Starting kernel ...")
-        self.wait_for_console_pattern("Booting Linux on physical CPU 0x0")
-        self.wait_for_console_pattern(
-                "aspeed-smc 1e620000.spi: read control register: 203b0641")
-        self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
-        self.wait_for_console_pattern("systemd[1]: Set hostname to")
-
     def test_arm_ast2600_debian(self):
         """
         :avocado: tags=arch:arm
diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 33090af19940..89bfad307661 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -34,3 +34,53 @@ def test_ast1030_zephyros(self):
         wait_for_console_pattern(self, "Booting Zephyr OS")
         exec_command_and_wait_for_pattern(self, "help",
                                           "Available commands")
+
+class AST2x00Machine(QemuSystemTest):
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    def do_test_arm_aspeed(self, image):
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic')
+        self.vm.launch()
+
+        self.wait_for_console_pattern("U-Boot 2016.07")
+        self.wait_for_console_pattern("## Loading kernel from FIT Image at 20080000")
+        self.wait_for_console_pattern("Starting kernel ...")
+        self.wait_for_console_pattern("Booting Linux on physical CPU 0x0")
+        wait_for_console_pattern(self,
+                "aspeed-smc 1e620000.spi: read control register: 203b0641")
+        self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
+        self.wait_for_console_pattern("systemd[1]: Set hostname to")
+
+    def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:palmetto-bmc
+        """
+
+        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
+                     'obmc-phosphor-image-palmetto.static.mtd')
+        image_hash = ('3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed(image_path)
+
+    def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:romulus-bmc
+        """
+
+        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
+                     'obmc-phosphor-image-romulus.static.mtd')
+        image_hash = ('820341076803f1955bc31e647a512c79f9add4f5233d0697678bab4604c7bb25')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed(image_path)
-- 
2.35.3


