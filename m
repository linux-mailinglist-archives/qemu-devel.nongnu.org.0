Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C169852945
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 12:18:43 +0200 (CEST)
Received: from localhost ([::1]:58336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfiXD-00072A-0G
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 06:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33996)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hfiUj-0005oT-1u
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:16:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hfiUg-0007OD-9E
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:16:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35646)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hfiUe-000789-VR
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:16:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1899F30820EA;
 Tue, 25 Jun 2019 10:15:46 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB50C5B68D;
 Tue, 25 Jun 2019 10:15:41 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 25 Jun 2019 12:15:20 +0200
Message-Id: <20190625101524.13447-2-philmd@redhat.com>
In-Reply-To: <20190625101524.13447-1-philmd@redhat.com>
References: <20190625101524.13447-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 25 Jun 2019 10:15:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/5] tests/acceptance: Rename avocado_qemu.Test
 as MachineTest
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This class is used to test QEMU machines, rename it as MachineTest.
This will allow us to add a UserTest class for qemu-user tests.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 docs/devel/testing.rst                    | 8 ++++----
 tests/acceptance/avocado_qemu/__init__.py | 7 ++++++-
 tests/acceptance/boot_linux_console.py    | 4 ++--
 tests/acceptance/cpu_queries.py           | 4 ++--
 tests/acceptance/empty_cpu_model.py       | 4 ++--
 tests/acceptance/linux_initrd.py          | 4 ++--
 tests/acceptance/linux_ssh_mips_malta.py  | 4 ++--
 tests/acceptance/migration.py             | 4 ++--
 tests/acceptance/version.py               | 4 ++--
 tests/acceptance/virtio_version.py        | 4 ++--
 tests/acceptance/vnc.py                   | 4 ++--
 11 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index da2d0fc964..5b911e153d 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -599,7 +599,7 @@ class.  Here's a simple usage example:
   from avocado_qemu import Test
=20
=20
-  class Version(Test):
+  class Version(MachineTest):
       """
       :avocado: tags=3Dquick
       """
@@ -623,7 +623,7 @@ in the current directory, tagged as "quick", run:
=20
   avocado run -t quick .
=20
-The ``avocado_qemu.Test`` base test class
+The ``avocado_qemu.MachineTest`` base test class
 -----------------------------------------
=20
 The ``avocado_qemu.Test`` class has a number of characteristics that
@@ -644,10 +644,10 @@ and hypothetical example follows:
=20
 .. code::
=20
-  from avocado_qemu import Test
+  from avocado_qemu import MachineTest
=20
=20
-  class MultipleMachines(Test):
+  class MultipleMachines(MachineTest):
       """
       :avocado: enable
       """
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
index 2b236a1cf0..84fe090458 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -52,7 +52,6 @@ def pick_default_qemu_bin(arch=3DNone):
=20
 class Test(avocado.Test):
     def setUp(self):
-        self._vms =3D {}
         arches =3D self.tags.get('arch', [])
         if len(arches) =3D=3D 1:
             arch =3D arches.pop()
@@ -65,6 +64,12 @@ class Test(avocado.Test):
         if self.qemu_bin is None:
             self.cancel("No QEMU binary defined or found in the source t=
ree")
=20
+
+class MachineTest(Test):
+    def setUp(self):
+        self._vms =3D {}
+        super().setUp()
+
     def _new_vm(self, *args):
         vm =3D QEMUMachine(self.qemu_bin)
         if args:
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
index 32159503e9..1a7b378413 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -14,12 +14,12 @@ import lzma
 import gzip
 import shutil
=20
-from avocado_qemu import Test
+from avocado_qemu import MachineTest
 from avocado.utils import process
 from avocado.utils import archive
=20
=20
-class BootLinuxConsole(Test):
+class BootLinuxConsole(MachineTest):
     """
     Boots a Linux kernel and checks that the console is operational and =
the
     kernel command line is properly passed from QEMU to the kernel
diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queri=
es.py
index e71edec39f..30f545fe48 100644
--- a/tests/acceptance/cpu_queries.py
+++ b/tests/acceptance/cpu_queries.py
@@ -10,9 +10,9 @@
=20
 import logging
=20
-from avocado_qemu import Test
+from avocado_qemu import MachineTest
=20
-class QueryCPUModelExpansion(Test):
+class QueryCPUModelExpansion(MachineTest):
     """
     Run query-cpu-model-expansion for each CPU model, and validate resul=
ts
     """
diff --git a/tests/acceptance/empty_cpu_model.py b/tests/acceptance/empty=
_cpu_model.py
index 3f4f663582..a4e9cc62f8 100644
--- a/tests/acceptance/empty_cpu_model.py
+++ b/tests/acceptance/empty_cpu_model.py
@@ -8,9 +8,9 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 import subprocess
-from avocado_qemu import Test
+from avocado_qemu import MachineTest
=20
-class EmptyCPUModel(Test):
+class EmptyCPUModel(MachineTest):
     def test(self):
         cmd =3D [self.qemu_bin, '-S', '-display', 'none', '-machine', 'n=
one', '-cpu', '']
         r =3D subprocess.run(cmd, stderr=3Dsubprocess.PIPE, stdout=3Dsub=
process.PIPE)
diff --git a/tests/acceptance/linux_initrd.py b/tests/acceptance/linux_in=
itrd.py
index 23be5a63aa..b9b2d3dab1 100644
--- a/tests/acceptance/linux_initrd.py
+++ b/tests/acceptance/linux_initrd.py
@@ -12,10 +12,10 @@ import logging
 import tempfile
 from avocado.utils.process import run
=20
-from avocado_qemu import Test
+from avocado_qemu import MachineTest
=20
=20
-class LinuxInitrd(Test):
+class LinuxInitrd(MachineTest):
     """
     Checks QEMU evaluates correctly the initrd file passed as -initrd op=
tion.
=20
diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/=
linux_ssh_mips_malta.py
index aafb0c39f6..8451d05f7c 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -13,12 +13,12 @@ import paramiko
 import time
=20
 from avocado import skipIf
-from avocado_qemu import Test
+from avocado_qemu import MachineTest
 from avocado.utils import process
 from avocado.utils import archive
=20
=20
-class LinuxSSH(Test):
+class LinuxSSH(MachineTest):
=20
     timeout =3D 150 # Not for 'configure --enable-debug --enable-debug-t=
cg'
=20
diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.p=
y
index 6115cf6c24..7fdb717628 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -10,13 +10,13 @@
 # later.  See the COPYING file in the top-level directory.
=20
=20
-from avocado_qemu import Test
+from avocado_qemu import MachineTest
=20
 from avocado.utils import network
 from avocado.utils import wait
=20
=20
-class Migration(Test):
+class Migration(MachineTest):
     """
     :avocado: enable
     """
diff --git a/tests/acceptance/version.py b/tests/acceptance/version.py
index 67c2192c93..e11661f780 100644
--- a/tests/acceptance/version.py
+++ b/tests/acceptance/version.py
@@ -9,10 +9,10 @@
 # later.  See the COPYING file in the top-level directory.
=20
=20
-from avocado_qemu import Test
+from avocado_qemu import MachineTest
=20
=20
-class Version(Test):
+class Version(MachineTest):
     """
     :avocado: tags=3Dquick
     """
diff --git a/tests/acceptance/virtio_version.py b/tests/acceptance/virtio=
_version.py
index 8b97453ff8..04c68e41e6 100644
--- a/tests/acceptance/virtio_version.py
+++ b/tests/acceptance/virtio_version.py
@@ -13,7 +13,7 @@ import os
=20
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'pyt=
hon'))
 from qemu import QEMUMachine
-from avocado_qemu import Test
+from avocado_qemu import MachineTest
=20
 # Virtio Device IDs:
 VIRTIO_NET =3D 1
@@ -55,7 +55,7 @@ def get_pci_interfaces(vm, devtype):
     interfaces =3D ('pci-express-device', 'conventional-pci-device')
     return [i for i in interfaces if devtype_implements(vm, devtype, i)]
=20
-class VirtioVersionCheck(Test):
+class VirtioVersionCheck(MachineTest):
     """
     Check if virtio-version-specific device types result in the
     same device tree created by `disable-modern` and
diff --git a/tests/acceptance/vnc.py b/tests/acceptance/vnc.py
index 064ceabcc1..2c532dab5e 100644
--- a/tests/acceptance/vnc.py
+++ b/tests/acceptance/vnc.py
@@ -8,10 +8,10 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
=20
-from avocado_qemu import Test
+from avocado_qemu import MachineTest
=20
=20
-class Vnc(Test):
+class Vnc(MachineTest):
     """
     :avocado: tags=3Dvnc,quick
     """
--=20
2.20.1


