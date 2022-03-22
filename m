Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71FC4E370B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 03:58:56 +0100 (CET)
Received: from localhost ([::1]:51376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWUjX-0003qx-TX
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 22:58:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUe7-0003mu-Vj; Mon, 21 Mar 2022 22:53:20 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:2991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUe5-0001xe-QB; Mon, 21 Mar 2022 22:53:19 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22M2fXAY078453;
 Tue, 22 Mar 2022 10:41:33 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Mar
 2022 10:52:01 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v1 9/9] test/avocado/machine_aspeed.py: Add ast1030 test case
Date: Tue, 22 Mar 2022 10:51:54 +0800
Message-ID: <20220322025154.3989-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22M2fXAY078453
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add test case to test "ast1030-evb" machine with zephyr os

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 tests/avocado/machine_aspeed.py | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 tests/avocado/machine_aspeed.py

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
new file mode 100644
index 0000000000..33090af199
--- /dev/null
+++ b/tests/avocado/machine_aspeed.py
@@ -0,0 +1,36 @@
+# Functional test that boots the ASPEED SoCs with firmware
+#
+# Copyright (C) 2022 ASPEED Technology Inc
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado.utils import archive
+
+
+class AST1030Machine(QemuSystemTest):
+    """Boots the zephyr os and checks that the console is operational"""
+
+    timeout = 10
+
+    def test_ast1030_zephyros(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast1030-evb
+        """
+        tar_url = ('https://github.com/AspeedTech-BMC'
+                   '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip')
+        tar_hash = '4c6a8ce3a8ba76ef1a65dae419ae3409343c4b20'
+        tar_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(tar_path, self.workdir)
+        kernel_file = self.workdir + "/ast1030-evb-demo/zephyr.elf"
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_file,
+                         '-nographic')
+        self.vm.launch()
+        wait_for_console_pattern(self, "Booting Zephyr OS")
+        exec_command_and_wait_for_pattern(self, "help",
+                                          "Available commands")
-- 
2.17.1


