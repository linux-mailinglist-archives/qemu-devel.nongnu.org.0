Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01F5E7662
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:00:51 +0200 (CEST)
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obeYF-0006rt-1I
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMK-00059P-S0; Fri, 23 Sep 2022 04:48:35 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:39371
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMD-0005J2-0Y; Fri, 23 Sep 2022 04:48:30 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5B6BZGz4x1L;
 Fri, 23 Sep 2022 18:48:14 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm582Kdgz4xGR;
 Fri, 23 Sep 2022 18:48:12 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/6] tests/avocado/machine_aspeed.py: Fix typos on buildroot
Date: Fri, 23 Sep 2022 10:47:58 +0200
Message-Id: <20220923084803.498337-2-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Replace 'buidroot' and 'builroot' by 'buildroot'.

Fixes: f7bc7da0724f ("test/avocado/machine_aspeed.py: Add tests using buildroot images")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 0f64eb636c28..c703be99a6f7 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -92,7 +92,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
 
         self.do_test_arm_aspeed(image_path)
 
-    def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
+    def do_test_arm_aspeed_buildroot_start(self, image, cpu_id):
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
                          '-net', 'nic', '-net', 'user')
@@ -109,11 +109,11 @@ def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
         exec_command(self, 'root')
         time.sleep(0.1)
 
-    def do_test_arm_aspeed_buidroot_poweroff(self):
+    def do_test_arm_aspeed_buildroot_poweroff(self):
         exec_command_and_wait_for_pattern(self, 'poweroff',
                                           'reboot: System halted');
 
-    def test_arm_ast2500_evb_builroot(self):
+    def test_arm_ast2500_evb_buildroot(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:ast2500-evb
@@ -127,7 +127,7 @@ def test_arm_ast2500_evb_builroot(self):
 
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
-        self.do_test_arm_aspeed_buidroot_start(image_path, '0x0')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0x0')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -139,9 +139,9 @@ def test_arm_ast2500_evb_builroot(self):
         exec_command_and_wait_for_pattern(self,
                              'cat /sys/class/hwmon/hwmon1/temp1_input', '18000')
 
-        self.do_test_arm_aspeed_buidroot_poweroff()
+        self.do_test_arm_aspeed_buildroot_poweroff()
 
-    def test_arm_ast2600_evb_builroot(self):
+    def test_arm_ast2600_evb_buildroot(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:ast2600-evb
@@ -157,7 +157,7 @@ def test_arm_ast2600_evb_builroot(self):
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.3,address=0x32');
-        self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -175,7 +175,7 @@ def test_arm_ast2600_evb_builroot(self):
         year = time.strftime("%Y")
         exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
 
-        self.do_test_arm_aspeed_buidroot_poweroff()
+        self.do_test_arm_aspeed_buildroot_poweroff()
 
 
 class AST2x00MachineSDK(QemuSystemTest):
-- 
2.37.3


