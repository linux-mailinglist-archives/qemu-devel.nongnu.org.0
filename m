Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA21702B5A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:22:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWEh-0002Fs-Nc; Mon, 15 May 2023 07:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pyWEd-00027v-1O
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:19:23 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pyWEZ-0001Vg-Dq
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:19:22 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxZPAwFWJky8sIAA--.15178S3;
 Mon, 15 May 2023 19:19:12 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a8tFWJkkOZfAA--.35452S4; 
 Mon, 15 May 2023 19:19:12 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 2/5] tests/avocado: Add LoongArch machine start test
Date: Mon, 15 May 2023 19:19:05 +0800
Message-Id: <20230515111908.2606580-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230515111908.2606580-1-gaosong@loongson.cn>
References: <20230515111908.2606580-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a8tFWJkkOZfAA--.35452S4
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAF4rXryfuFy8JrW3tw1kZrb_yoW5ZF45pr
 4jkr15Grn7AFsaqrsagasY9FyrXa1kGa47XF42yrnY9F4DAr48WF1Yyw1IvFWDXa1UWa4a
 9rykZw4fW3WxJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a new test in tests/avocado to check LoongArch virt machine start.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Message-Id: <20230513012744.1885728-1-gaosong@loongson.cn>
---
 MAINTAINERS                        |  1 +
 tests/avocado/machine_loongarch.py | 58 ++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 tests/avocado/machine_loongarch.py

diff --git a/MAINTAINERS b/MAINTAINERS
index ff2aa53bb9..50585117a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -245,6 +245,7 @@ M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
 S: Maintained
 F: target/loongarch/
 F: tests/tcg/loongarch64/
+F: tests/avocado/machine_loongarch.py
 
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
diff --git a/tests/avocado/machine_loongarch.py b/tests/avocado/machine_loongarch.py
new file mode 100644
index 0000000000..7d8a3c1fa5
--- /dev/null
+++ b/tests/avocado/machine_loongarch.py
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# LoongArch virt test.
+#
+# Copyright (c) 2023 Loongson Technology Corporation Limited
+#
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import wait_for_console_pattern
+
+class LoongArchMachine(QemuSystemTest):
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    timeout = 120
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    def test_loongarch64_devices(self):
+
+        """
+        :avocado: tags=arch:loongarch64
+        :avocado: tags=machine:virt
+        """
+
+        kernel_url = ('https://github.com/yangxiaojuan-loongson/qemu-binary/'
+                      'releases/download/binary-files/vmlinuz.efi')
+        kernel_hash = '951b485b16e3788b6db03a3e1793c067009e31a2'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        initrd_url = ('https://github.com/yangxiaojuan-loongson/qemu-binary/'
+                      'releases/download/binary-files/ramdisk')
+        initrd_hash = 'c67658d9b2a447ce7db2f73ba3d373c9b2b90ab2'
+        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+
+        bios_url = ('https://github.com/yangxiaojuan-loongson/qemu-binary/'
+                    'releases/download/binary-files/QEMU_EFI.fd')
+        bios_hash = ('dfc1bfba4853cd763b9d392d0031827e8addbca8')
+        bios_path = self.fetch_asset(bios_url, asset_hash=bios_hash)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'root=/dev/ram rdinit=/sbin/init console=ttyS0,115200')
+        self.vm.add_args('-nographic',
+                         '-smp', '4',
+                         '-m', '1024',
+                         '-cpu', 'la464',
+                         '-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-bios', bios_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        self.wait_for_console_pattern('Run /sbin/init as init process')
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                          'processor		: 3')
-- 
2.39.1


