Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084341995F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:40:49 +0200 (CEST)
Received: from localhost ([::1]:60526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtgO-0004HC-Ez
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXm-0002gP-EQ; Mon, 27 Sep 2021 12:31:54 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXj-0002mV-Bm; Mon, 27 Sep 2021 12:31:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id x20so8322009wrg.10;
 Mon, 27 Sep 2021 09:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cUq4xl4nW+7Tp/ISXBRxs5olh27djrkmsp59yEYwwd4=;
 b=KVxbygAlrftAANDaoA7MYCdirbtjmFVb/H32SgOYSDdKGtLUPpzo47LPAWRtWk1Sy+
 hSV+tYTVf5iWc8Ey6VDYk56taRnm0e0f2jYrTV4iVOxEP1qKmk9NDsGYtahK7DP2kRvR
 e2NqvXN8NgL1edHc8gbvMqLiyw+yYRu53wYEV6oi+Lf5brOW/H4+Mp9Lwc6XoUEHYtW8
 +63fhgvaFIzw1QoIRQ3JuuxgzRdatvy/hlqsoBw7pXdP4QV2O3al9OF0TyAL5T+0NNiT
 8TLU18fPgwSCJJ858KjXsnNsChd08sV/3CT7oLjM43AehRjvIWfNI62dIiYvkO1RVUqu
 AyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cUq4xl4nW+7Tp/ISXBRxs5olh27djrkmsp59yEYwwd4=;
 b=4nktWX5Ak2asSbnSfSYP+56n9tbYccQ4rpcDUiqYA77uoPKD5IUgrcmAX331mAN7pd
 Mvr+GPxO9NLRSrYw1Wwq2hi8gUaL5a4y1J08sAgkBhpr6Gl/KIw/N02TCdrGzKj8vSZz
 oybwP5BZsOZSC905C7XcZ5rr6Zpefinc7df4BCSyPb0bCRuRUNdSI8gUHcNUY0ti1FwQ
 y3ppFYadl+4MtyavD7nnFmrI6ZuNFGYrHSrg1ruth8Rx/3jSTWRYwR0sSrfHM/BenSBh
 D52aNCujVqK4+xjtubsEP2h7rgtL4dO9xvNvkhoTPy8e9izQX+Fw8e7pDilSRSFH6K8I
 gx2g==
X-Gm-Message-State: AOAM533OABVx21wckD4vv0G7C/3SP2aMR7fEFCZqXpEw6nbE2huQ1fyR
 Zfd5/b8PIrYrj5oSaSGDziGEBVXaS6k=
X-Google-Smtp-Source: ABdhPJy8SKOScrPUR6fVUTw2vgZScS9BLpfgqktNIY/Kc9eVEd/L7ohA3pJn96/U0H/nVpgyrn2nsQ==
X-Received: by 2002:a05:6000:144d:: with SMTP id
 v13mr845240wrx.303.1632760307527; 
 Mon, 27 Sep 2021 09:31:47 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n11sm4279wmq.19.2021.09.27.09.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:31:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] tests/acceptance: Rename avocado_qemu.Test ->
 QemuSystemTest
Date: Mon, 27 Sep 2021 18:31:16 +0200
Message-Id: <20210927163116.1998349-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927163116.1998349-1-f4bug@amsat.org>
References: <20210927163116.1998349-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To run user-mode emulation tests, we introduced the
avocado_qemu.QemuUserTest which inherits from avocado_qemu.QemuBaseTest.
System-mode emulation tests are based on the avocado_qemu.Test class,
which also inherits avocado_qemu.QemuBaseTest. To avoid confusion,
rename it as avocado_qemu.QemuSystemTest.

Suggested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py    | 21 +++++++++-----------
 tests/acceptance/boot_linux_console.py       |  4 ++--
 tests/acceptance/cpu_queries.py              |  4 ++--
 tests/acceptance/empty_cpu_model.py          |  4 ++--
 tests/acceptance/info_usernet.py             |  4 ++--
 tests/acceptance/linux_initrd.py             |  4 ++--
 tests/acceptance/linux_ssh_mips_malta.py     |  5 +++--
 tests/acceptance/machine_arm_canona1100.py   |  4 ++--
 tests/acceptance/machine_arm_integratorcp.py |  4 ++--
 tests/acceptance/machine_arm_n8x0.py         |  4 ++--
 tests/acceptance/machine_avr6.py             |  4 ++--
 tests/acceptance/machine_m68k_nextcube.py    |  4 ++--
 tests/acceptance/machine_microblaze.py       |  4 ++--
 tests/acceptance/machine_mips_fuloong2e.py   |  4 ++--
 tests/acceptance/machine_mips_loongson3v.py  |  4 ++--
 tests/acceptance/machine_mips_malta.py       |  4 ++--
 tests/acceptance/machine_ppc.py              |  4 ++--
 tests/acceptance/machine_rx_gdbsim.py        |  4 ++--
 tests/acceptance/machine_s390_ccw_virtio.py  |  4 ++--
 tests/acceptance/machine_sparc_leon3.py      |  4 ++--
 tests/acceptance/migration.py                |  4 ++--
 tests/acceptance/multiprocess.py             |  4 ++--
 tests/acceptance/pc_cpu_hotplug_props.py     |  4 ++--
 tests/acceptance/ppc_prep_40p.py             |  4 ++--
 tests/acceptance/version.py                  |  4 ++--
 tests/acceptance/virtio-gpu.py               |  4 ++--
 tests/acceptance/virtio_check_params.py      |  4 ++--
 tests/acceptance/virtio_version.py           |  4 ++--
 tests/acceptance/vnc.py                      |  4 ++--
 tests/acceptance/x86_cpu_model_versions.py   |  4 ++--
 30 files changed, 68 insertions(+), 70 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index a497a24f823..1abec2abaca 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -183,7 +183,7 @@ def interrupt_interactive_console_until_pattern(test, success_message,
 
     :param test: an Avocado test containing a VM that will have its console
                  read and probed for a success or failure message
-    :type test: :class:`avocado_qemu.Test`
+    :type test: :class:`avocado_qemu.QemuSystemTest`
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
     :param interrupt_string: a string to send to the console before trying
@@ -199,7 +199,7 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
 
     :param test: an Avocado test containing a VM that will have its console
                  read and probed for a success or failure message
-    :type test: :class:`avocado_qemu.Test`
+    :type test: :class:`avocado_qemu.QemuSystemTest`
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
     """
@@ -211,7 +211,7 @@ def exec_command(test, command):
     the content.
 
     :param test: an Avocado test containing a VM.
-    :type test: :class:`avocado_qemu.Test`
+    :type test: :class:`avocado_qemu.QemuSystemTest`
     :param command: the command to send
     :type command: str
     """
@@ -226,7 +226,7 @@ def exec_command_and_wait_for_pattern(test, command,
 
     :param test: an Avocado test containing a VM that will have its console
                  read and probed for a success or failure message
-    :type test: :class:`avocado_qemu.Test`
+    :type test: :class:`avocado_qemu.QemuSystemTest`
     :param command: the command to send
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
@@ -269,16 +269,13 @@ def fetch_asset(self, name,
                         cancel_on_missing=cancel_on_missing)
 
 
-class Test(QemuBaseTest):
-    """Facilitates system emulation tests.
-
-    TODO: Rename this class as `QemuSystemTest`.
-    """
+class QemuSystemTest(QemuBaseTest):
+    """Facilitates system emulation tests."""
 
     def setUp(self):
         self._vms = {}
 
-        super(Test, self).setUp('qemu-system-')
+        super(QemuSystemTest, self).setUp('qemu-system-')
 
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
@@ -515,11 +512,11 @@ def default_kernel_params(self):
         return self._info.get('kernel_params', None)
 
 
-class LinuxTest(Test, LinuxSSHMixIn):
+class LinuxTest(QemuSystemTest, LinuxSSHMixIn):
     """Facilitates having a cloud-image Linux based available.
 
     For tests that indend to interact with guests, this is a better choice
-    to start with than the more vanilla `Test` class.
+    to start with than the more vanilla `QemuSystemTest` class.
     """
 
     timeout = 900
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 0a49c0e2760..80740452f54 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -15,7 +15,7 @@
 
 from avocado import skip
 from avocado import skipUnless
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import interrupt_interactive_console_until_pattern
@@ -46,7 +46,7 @@ def image_pow2ceil_expand(path):
             with open(path, 'ab+') as fd:
                 fd.truncate(size_aligned)
 
-class LinuxKernelTest(Test):
+class LinuxKernelTest(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
     def wait_for_console_pattern(self, success_message, vm=None):
diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queries.py
index cc9e380cc7f..cf69f69b116 100644
--- a/tests/acceptance/cpu_queries.py
+++ b/tests/acceptance/cpu_queries.py
@@ -8,9 +8,9 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 
-class QueryCPUModelExpansion(Test):
+class QueryCPUModelExpansion(QemuSystemTest):
     """
     Run query-cpu-model-expansion for each CPU model, and validate results
     """
diff --git a/tests/acceptance/empty_cpu_model.py b/tests/acceptance/empty_cpu_model.py
index a1e59e45e4e..22f504418d2 100644
--- a/tests/acceptance/empty_cpu_model.py
+++ b/tests/acceptance/empty_cpu_model.py
@@ -7,9 +7,9 @@
 #
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 
-class EmptyCPUModel(Test):
+class EmptyCPUModel(QemuSystemTest):
     def test(self):
         self.vm.add_args('-S', '-display', 'none', '-machine', 'none', '-cpu', '')
         self.vm.set_qmp_monitor(enabled=False)
diff --git a/tests/acceptance/info_usernet.py b/tests/acceptance/info_usernet.py
index 9c1fd903a0b..dc01f74150c 100644
--- a/tests/acceptance/info_usernet.py
+++ b/tests/acceptance/info_usernet.py
@@ -8,12 +8,12 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 
 from qemu.utils import get_info_usernet_hostfwd_port
 
 
-class InfoUsernet(Test):
+class InfoUsernet(QemuSystemTest):
 
     def test_hostfwd(self):
         self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22')
diff --git a/tests/acceptance/linux_initrd.py b/tests/acceptance/linux_initrd.py
index a249e2f14a2..25fba6a28a7 100644
--- a/tests/acceptance/linux_initrd.py
+++ b/tests/acceptance/linux_initrd.py
@@ -12,11 +12,11 @@
 import logging
 import tempfile
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado import skipIf
 
 
-class LinuxInitrd(Test):
+class LinuxInitrd(QemuSystemTest):
     """
     Checks QEMU evaluates correctly the initrd file passed as -initrd option.
 
diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
index 4de19474188..c0f0be5adee 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -12,7 +12,8 @@
 import time
 
 from avocado import skipUnless
-from avocado_qemu import Test, LinuxSSHMixIn
+from avocado_qemu import LinuxSSHMixIn
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
@@ -21,7 +22,7 @@
 
 @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
 @skipUnless(ssh.SSH_CLIENT_BINARY, 'No SSH client available')
-class LinuxSSH(Test, LinuxSSHMixIn):
+class LinuxSSH(QemuSystemTest, LinuxSSHMixIn):
 
     timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
 
diff --git a/tests/acceptance/machine_arm_canona1100.py b/tests/acceptance/machine_arm_canona1100.py
index 0e5c43dbcf8..182a0b05134 100644
--- a/tests/acceptance/machine_arm_canona1100.py
+++ b/tests/acceptance/machine_arm_canona1100.py
@@ -8,11 +8,11 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
 
-class CanonA1100Machine(Test):
+class CanonA1100Machine(QemuSystemTest):
     """Boots the barebox firmware and checks that the console is operational"""
 
     timeout = 90
diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/acceptance/machine_arm_integratorcp.py
index 49c8ebff78b..1ffe1073ef8 100644
--- a/tests/acceptance/machine_arm_integratorcp.py
+++ b/tests/acceptance/machine_arm_integratorcp.py
@@ -12,7 +12,7 @@
 import logging
 
 from avocado import skipUnless
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 
 
@@ -29,7 +29,7 @@
     CV2_AVAILABLE = False
 
 
-class IntegratorMachine(Test):
+class IntegratorMachine(QemuSystemTest):
 
     timeout = 90
 
diff --git a/tests/acceptance/machine_arm_n8x0.py b/tests/acceptance/machine_arm_n8x0.py
index e5741f2d8d1..12e9a6803ba 100644
--- a/tests/acceptance/machine_arm_n8x0.py
+++ b/tests/acceptance/machine_arm_n8x0.py
@@ -11,10 +11,10 @@
 import os
 
 from avocado import skipUnless
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 
-class N8x0Machine(Test):
+class N8x0Machine(QemuSystemTest):
     """Boots the Linux kernel and checks that the console is operational"""
 
     timeout = 90
diff --git a/tests/acceptance/machine_avr6.py b/tests/acceptance/machine_avr6.py
index 6baf4e9c7f3..7536d83356f 100644
--- a/tests/acceptance/machine_avr6.py
+++ b/tests/acceptance/machine_avr6.py
@@ -19,9 +19,9 @@
 
 import time
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 
-class AVR6Machine(Test):
+class AVR6Machine(QemuSystemTest):
     timeout = 5
 
     def test_freertos(self):
diff --git a/tests/acceptance/machine_m68k_nextcube.py b/tests/acceptance/machine_m68k_nextcube.py
index 09e2745cc52..6790e7d9cd1 100644
--- a/tests/acceptance/machine_m68k_nextcube.py
+++ b/tests/acceptance/machine_m68k_nextcube.py
@@ -8,7 +8,7 @@
 import os
 import time
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado import skipUnless
 
 from tesseract_utils import tesseract_available, tesseract_ocr
@@ -20,7 +20,7 @@
     PIL_AVAILABLE = False
 
 
-class NextCubeMachine(Test):
+class NextCubeMachine(QemuSystemTest):
     """
     :avocado: tags=arch:m68k
     :avocado: tags=machine:next-cube
diff --git a/tests/acceptance/machine_microblaze.py b/tests/acceptance/machine_microblaze.py
index 7f6d18495d8..4928920f960 100644
--- a/tests/acceptance/machine_microblaze.py
+++ b/tests/acceptance/machine_microblaze.py
@@ -5,11 +5,11 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
 
-class MicroblazeMachine(Test):
+class MicroblazeMachine(QemuSystemTest):
 
     timeout = 90
 
diff --git a/tests/acceptance/machine_mips_fuloong2e.py b/tests/acceptance/machine_mips_fuloong2e.py
index 0ac285e2af1..89291f47b24 100644
--- a/tests/acceptance/machine_mips_fuloong2e.py
+++ b/tests/acceptance/machine_mips_fuloong2e.py
@@ -10,10 +10,10 @@
 import os
 
 from avocado import skipUnless
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 
-class MipsFuloong2e(Test):
+class MipsFuloong2e(QemuSystemTest):
 
     timeout = 60
 
diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/acceptance/machine_mips_loongson3v.py
index 85b131a40f0..5194cf18c9c 100644
--- a/tests/acceptance/machine_mips_loongson3v.py
+++ b/tests/acceptance/machine_mips_loongson3v.py
@@ -11,10 +11,10 @@
 import time
 
 from avocado import skipUnless
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 
-class MipsLoongson3v(Test):
+class MipsLoongson3v(QemuSystemTest):
     timeout = 60
 
     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
index b67d8cb141c..f1895d59f35 100644
--- a/tests/acceptance/machine_mips_malta.py
+++ b/tests/acceptance/machine_mips_malta.py
@@ -12,7 +12,7 @@
 import logging
 
 from avocado import skipUnless
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
 from avocado import skipIf
@@ -33,7 +33,7 @@
 
 @skipUnless(NUMPY_AVAILABLE, 'Python NumPy not installed')
 @skipUnless(CV2_AVAILABLE, 'Python OpenCV not installed')
-class MaltaMachineFramebuffer(Test):
+class MaltaMachineFramebuffer(QemuSystemTest):
 
     timeout = 30
 
diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
index a836e2496f1..67e24fa4f7c 100644
--- a/tests/acceptance/machine_ppc.py
+++ b/tests/acceptance/machine_ppc.py
@@ -6,10 +6,10 @@
 # later.  See the COPYING file in the top-level directory.
 
 from avocado.utils import archive
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 
-class PpcMachine(Test):
+class PpcMachine(QemuSystemTest):
 
     timeout = 90
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
diff --git a/tests/acceptance/machine_rx_gdbsim.py b/tests/acceptance/machine_rx_gdbsim.py
index 32b737b6d85..6cd8704b016 100644
--- a/tests/acceptance/machine_rx_gdbsim.py
+++ b/tests/acceptance/machine_rx_gdbsim.py
@@ -11,13 +11,13 @@
 import os
 
 from avocado import skipIf
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
 
 
-class RxGdbSimMachine(Test):
+class RxGdbSimMachine(QemuSystemTest):
 
     timeout = 30
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 4028c99afce..bd03d7160b4 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -13,12 +13,12 @@
 import tempfile
 
 from avocado import skipIf
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
 
-class S390CCWVirtioMachine(Test):
+class S390CCWVirtioMachine(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
     timeout = 120
diff --git a/tests/acceptance/machine_sparc_leon3.py b/tests/acceptance/machine_sparc_leon3.py
index 2405cd7a0d7..e61b223185a 100644
--- a/tests/acceptance/machine_sparc_leon3.py
+++ b/tests/acceptance/machine_sparc_leon3.py
@@ -5,12 +5,12 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado import skip
 
 
-class Leon3Machine(Test):
+class Leon3Machine(QemuSystemTest):
 
     timeout = 60
 
diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
index 792639cb693..584d6ef53f5 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -11,7 +11,7 @@
 
 
 import tempfile
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado import skipUnless
 
 from avocado.utils import network
@@ -19,7 +19,7 @@
 from avocado.utils.path import find_command
 
 
-class Migration(Test):
+class Migration(QemuSystemTest):
     """
     :avocado: tags=migration
     """
diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
index 96627f022a8..80a3b8f442b 100644
--- a/tests/acceptance/multiprocess.py
+++ b/tests/acceptance/multiprocess.py
@@ -7,12 +7,12 @@
 import os
 import socket
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
 
-class Multiprocess(Test):
+class Multiprocess(QemuSystemTest):
     """
     :avocado: tags=multiprocess
     """
diff --git a/tests/acceptance/pc_cpu_hotplug_props.py b/tests/acceptance/pc_cpu_hotplug_props.py
index 2e86d5017a5..52b878188ed 100644
--- a/tests/acceptance/pc_cpu_hotplug_props.py
+++ b/tests/acceptance/pc_cpu_hotplug_props.py
@@ -20,9 +20,9 @@
 # License along with this library; if not, see <http://www.gnu.org/licenses/>.
 #
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 
-class OmittedCPUProps(Test):
+class OmittedCPUProps(QemuSystemTest):
     """
     :avocado: tags=arch:x86_64
     :avocado: tags=cpu:qemu64
diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
index 2993ee3b078..cbcb7d06ad6 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/acceptance/ppc_prep_40p.py
@@ -9,11 +9,11 @@
 
 from avocado import skipIf
 from avocado import skipUnless
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 
 
-class IbmPrep40pMachine(Test):
+class IbmPrep40pMachine(QemuSystemTest):
 
     timeout = 60
 
diff --git a/tests/acceptance/version.py b/tests/acceptance/version.py
index 79b923d4fc0..ded7f039c1b 100644
--- a/tests/acceptance/version.py
+++ b/tests/acceptance/version.py
@@ -9,10 +9,10 @@
 # later.  See the COPYING file in the top-level directory.
 
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 
 
-class Version(Test):
+class Version(QemuSystemTest):
     """
     :avocado: tags=quick
     """
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 4acc1e6d5fd..2a249a3a2c1 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -4,8 +4,8 @@
 # later.  See the COPYING file in the top-level directory.
 
 
-from avocado_qemu import Test
 from avocado_qemu import BUILD_DIR
+from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import is_readable_executable_file
@@ -27,7 +27,7 @@ def pick_default_vug_bin():
         return bld_dir_path
 
 
-class VirtioGPUx86(Test):
+class VirtioGPUx86(QemuSystemTest):
     """
     :avocado: tags=virtio-gpu
     :avocado: tags=arch:x86_64
diff --git a/tests/acceptance/virtio_check_params.py b/tests/acceptance/virtio_check_params.py
index 87e6c839d14..e869690473a 100644
--- a/tests/acceptance/virtio_check_params.py
+++ b/tests/acceptance/virtio_check_params.py
@@ -24,7 +24,7 @@
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 from avocado import skip
 
 #list of machine types and virtqueue properties to test
@@ -41,7 +41,7 @@
                                     'driver=null-co,id=drive0,if=none']}
 
 
-class VirtioMaxSegSettingsCheck(Test):
+class VirtioMaxSegSettingsCheck(QemuSystemTest):
     @staticmethod
     def make_pattern(props):
         pattern_items = ['{0} = \w+'.format(prop) for prop in props]
diff --git a/tests/acceptance/virtio_version.py b/tests/acceptance/virtio_version.py
index 33593c29dd0..208910bb844 100644
--- a/tests/acceptance/virtio_version.py
+++ b/tests/acceptance/virtio_version.py
@@ -13,7 +13,7 @@
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 
 # Virtio Device IDs:
 VIRTIO_NET = 1
@@ -55,7 +55,7 @@ def get_pci_interfaces(vm, devtype):
     interfaces = ('pci-express-device', 'conventional-pci-device')
     return [i for i in interfaces if devtype_implements(vm, devtype, i)]
 
-class VirtioVersionCheck(Test):
+class VirtioVersionCheck(QemuSystemTest):
     """
     Check if virtio-version-specific device types result in the
     same device tree created by `disable-modern` and
diff --git a/tests/acceptance/vnc.py b/tests/acceptance/vnc.py
index 22656bbcc2b..e6ebdf5d1ee 100644
--- a/tests/acceptance/vnc.py
+++ b/tests/acceptance/vnc.py
@@ -8,10 +8,10 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
-from avocado_qemu import Test
+from avocado_qemu import QemuSystemTest
 
 
-class Vnc(Test):
+class Vnc(QemuSystemTest):
     """
     :avocado: tags=vnc,quick
     """
diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/acceptance/x86_cpu_model_versions.py
index 0e9feda62d4..a6edf74c1cc 100644
--- a/tests/acceptance/x86_cpu_model_versions.py
+++ b/tests/acceptance/x86_cpu_model_versions.py
@@ -24,7 +24,7 @@
 import avocado_qemu
 import re
 
-class X86CPUModelAliases(avocado_qemu.Test):
+class X86CPUModelAliases(avocado_qemu.QemuSystemTest):
     """
     Validation of PC CPU model versions and CPU model aliases
 
@@ -239,7 +239,7 @@ def test_none_alias(self):
         self.validate_aliases(cpus)
 
 
-class CascadelakeArchCapabilities(avocado_qemu.Test):
+class CascadelakeArchCapabilities(avocado_qemu.QemuSystemTest):
     """
     Validation of Cascadelake arch-capabilities
 
-- 
2.31.1


