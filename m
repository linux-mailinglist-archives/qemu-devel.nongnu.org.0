Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2199DDD94B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 17:17:24 +0200 (CEST)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLqTr-0006KU-5E
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 11:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45651)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqNn-0001BW-S2
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:11:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqNm-0006wZ-Dz
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:11:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35006)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqNl-0006tx-UH
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:11:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id 14so2069870wmu.0
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2019 08:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w2ENnodrkebcANajyxBbU6bIiMWLNySDu9Cotb19W1w=;
 b=abiqNl25RX3y8Pe4qxEujhmQkC+ZRwdCye23N7LWvU7tmXrmB0M3G361o3KHxWL0aO
 RYGBRMf7GzoVpYblyASAOmM/zz9xX8YA0JhlLOAodBMnJOwCdbI9uE+rXdhD2kmpfaw9
 +mtNcfzyuKFe4hrrIVY5y8EZ2A+j75jI/59iwQL+HxUnxiTJClp1OAUX+X01jPt04Z7P
 W/LySH1AsU12XGEEmZLeKLZjW8LhnEltOeRWh6U8vPeETMjh1uNJFU6fGi+Ny/WGLOTn
 0Cc6FKKYU1FJZbe+NnJILow3KO4Rhe7hymTs/DbtklF1EGNSROad7GTAwwAsbo1c9821
 4aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w2ENnodrkebcANajyxBbU6bIiMWLNySDu9Cotb19W1w=;
 b=aTaR2olOqno7GfJPKRh857w1D7aLZ3KnBL9mf7UAnduKBmG8Vst5s3XEVCpmWvIVif
 W3K+a3t5h0URLlgpwLivyWpmsExO+lwuXY1kumant81Rg5qtfdKB+l4usttsSBX//bbg
 dtZC0BA2o2/g00zZsRCIjfuldCkztE9GajmPJfqgSWjaZgn8PNdXkDQk26MEDdYlaTo7
 82odnNkXMnP3UCVFmToqPNta2wA9dtjFzjvhrClp9B/mk8RQCgteA9ez0ik6QB1Hgz6B
 DROy+sWyrRbtA3GO2wrFB4MHlzHHb2uWofcOaSEKWl0fGwoDH6T6mmZFukQC9wU2pvYc
 woVQ==
X-Gm-Message-State: APjAAAXgWbHA/5TXa+P1cHV5H1TQ3vcZrQPIEMy3AicQBHL1U0BPF/cW
 +FBkClEFTB0avI94NuEWrAxNIUnA
X-Google-Smtp-Source: APXvYqzO6IX/iBoc7c2OnYnAbmq6nBSOJ2X0MuUVnVsiO5/eolUNoSn98q6XfvGMhPOZQmnOL5714Q==
X-Received: by 2002:a1c:7401:: with SMTP id p1mr6712090wmc.144.1571497862235; 
 Sat, 19 Oct 2019 08:11:02 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id t13sm10753964wra.70.2019.10.19.08.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 08:11:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] Acceptance tests: refactor wait_for_console_pattern
Date: Sat, 19 Oct 2019 17:10:48 +0200
Message-Id: <20191019151058.31733-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019151058.31733-1-f4bug@amsat.org>
References: <20191019151058.31733-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::329
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Cleber Rosa <crosa@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

The same utility method is already present in two different test
files, so let's consolidate it into a single utility function.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20190916164011.7653-1-crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: failure_message is optional]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 25 +++++++++++++++++++++
 tests/acceptance/boot_linux_console.py    | 27 +++++------------------
 tests/acceptance/linux_ssh_mips_malta.py  | 18 +++------------
 3 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index bd41e0443c..e3101cba30 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -8,6 +8,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
+import logging
 import os
 import sys
 import uuid
@@ -53,6 +54,30 @@ def pick_default_qemu_bin(arch=None):
         return qemu_bin_from_src_dir_path
 
 
+def wait_for_console_pattern(test, success_message, failure_message=None):
+    """
+    Waits for messages to appear on the console, while logging the content
+
+    :param test: an Avocado test containing a VM that will have its console
+                 read and probed for a success or failure message
+    :type test: :class:`avocado_qemu.Test`
+    :param success_message: if this message appears, test succeeds
+    :param failure_message: if this message appears, test fails
+    """
+    console = test.vm.console_socket.makefile()
+    console_logger = logging.getLogger('console')
+    while True:
+        msg = console.readline().strip()
+        if not msg:
+            continue
+        console_logger.debug(msg)
+        if success_message in msg:
+            break
+        if failure_message and failure_message in msg:
+            fail = 'Failure message found in console: %s' % failure_message
+            test.fail(fail)
+
+
 class Test(avocado.Test):
     def setUp(self):
         self._vms = {}
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 8a9a314ab4..8897e0c253 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -9,12 +9,12 @@
 # later.  See the COPYING file in the top-level directory.
 
 import os
-import logging
 import lzma
 import gzip
 import shutil
 
 from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
 
@@ -29,31 +29,14 @@ class BootLinuxConsole(Test):
 
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
-    def wait_for_console_pattern(self, success_message,
-                                 failure_message='Kernel panic - not syncing'):
-        """
-        Waits for messages to appear on the console, while logging the content
-
-        :param success_message: if this message appears, test succeeds
-        :param failure_message: if this message appears, test fails
-        """
-        console = self.vm.console_socket.makefile()
-        console_logger = logging.getLogger('console')
-        while True:
-            msg = console.readline().strip()
-            if not msg:
-                continue
-            console_logger.debug(msg)
-            if success_message in msg:
-                break
-            if failure_message in msg:
-                fail = 'Failure message found in console: %s' % failure_message
-                self.fail(fail)
+    def wait_for_console_pattern(self, success_message):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing')
 
     def exec_command_and_wait_for_pattern(self, command, success_message):
         command += '\n'
         self.vm.console_socket.sendall(command.encode())
-        self.wait_for_console_pattern(success_message)
+        wait_for_console_pattern(self, success_message)
 
     def extract_from_deb(self, deb, path):
         """
diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
index 25a1df5098..ffbb06f846 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -13,6 +13,7 @@ import time
 
 from avocado import skipUnless
 from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
 from avocado.utils import ssh
@@ -40,19 +41,6 @@ class LinuxSSH(Test):
     def setUp(self):
         super(LinuxSSH, self).setUp()
 
-    def wait_for_console_pattern(self, success_message,
-                                 failure_message='Oops'):
-        console = self.vm.console_socket.makefile()
-        console_logger = logging.getLogger('console')
-        while True:
-            msg = console.readline()
-            console_logger.debug(msg.strip())
-            if success_message in msg:
-                break
-            if failure_message in msg:
-                fail = 'Failure message found in console: %s' % failure_message
-                self.fail(fail)
-
     def get_portfwd(self):
         res = self.vm.command('human-monitor-command',
                               command_line='info usernet')
@@ -109,7 +97,7 @@ class LinuxSSH(Test):
 
         self.log.info('VM launched, waiting for sshd')
         console_pattern = 'Starting OpenBSD Secure Shell server: sshd'
-        self.wait_for_console_pattern(console_pattern)
+        wait_for_console_pattern(self, console_pattern, 'Oops')
         self.log.info('sshd ready')
 
         self.ssh_connect('root', 'root')
@@ -117,7 +105,7 @@ class LinuxSSH(Test):
     def shutdown_via_ssh(self):
         self.ssh_command('poweroff')
         self.ssh_disconnect_vm()
-        self.wait_for_console_pattern('Power down')
+        wait_for_console_pattern(self, 'Power down', 'Oops')
 
     def ssh_command_output_contains(self, cmd, exp):
         stdout, _ = self.ssh_command(cmd)
-- 
2.21.0


