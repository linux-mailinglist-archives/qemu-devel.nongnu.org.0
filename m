Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736AA55B853
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:46:20 +0200 (CEST)
Received: from localhost ([::1]:53052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jRr-0000fL-8N
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCx-0005VI-Bc
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:30:55 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCu-000655-57
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:30:54 -0400
Received: by mail-pl1-x630.google.com with SMTP id r1so7391552plo.10
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EB/Bt8Qjj35xoDj6iBfFFp6H1rhYmFpRvyg3Y4Mq7rk=;
 b=hiryN9IRJtAoacWPkatwYX9KhIAF3imkKqkDH6WHUgHCsbXu2bFIt0yyDNtzu563R/
 s9lpMZ9B8wsoLuilijMlmatyZtQBh4GRVz+2Rv/OeIXEyLl/uQ16koNRPcxcvkkHGaZc
 dHiPBT9GyTyTNFKnK12kg2781OEOP/T4/tJgIknBXX20hy8hLFqaLvNYBNCS8em8QqwC
 Tai6iY6uJqOEvmUyuogAj60MCsyIpkmQ9mjDkFr2GfEd0XiJ3e/qhSURkInsBh7l3a+N
 0XUDx+Q6Bb3rkoirLt1Esr/UteR/J9XU/N6vX98VXc85yVH1GQChJQbHUjEFHKFIIonW
 1iZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EB/Bt8Qjj35xoDj6iBfFFp6H1rhYmFpRvyg3Y4Mq7rk=;
 b=GToldp4Nqjp4faeiTJ/1HRuGnbVyXU1oOPm7EphOC1YtTWkBJbPaKoVYgxhFhMMdj7
 nJu1I94V4vdcArton6Ok+ZH5hw21UXDSUWIINU8bqaI8itaTDL0rtw+yCjIDR3u6BrTC
 xSNdkj0Ae2GSBLpXCj2ZtGbFVtBOKiDuufQlntLpKsBj3pMbLH1sKoylVknx3ogjmMNl
 jBZw2aoEQrpyD1nkwhtz0pf6NY1DUmw2BFEprj6tCFbZYpFOayrbzy/gW3+2bXmcGtBx
 aUK6HvVnN/Tr9aG4wVbGwUDkcyt/FbdQgYc3l8pwrFaMsj5CFtfkZym1sLzS0q2qe0ge
 TKOg==
X-Gm-Message-State: AJIora8TfCrcT+hd/wuzUsZqzlas6QbXQKmjs2BCNO479CFI2p2xCrA0
 ftSR6U06BnDmeN1z6OUsVqP/yQxjrJcFbj1++/Y=
X-Google-Smtp-Source: AGRyM1vHQZ4bBVqm5ZXf/BQguBxEXz4QMCj/kx9prFIKqOKtS7NYk002n9bJid85DRH4oG/X7iocVQ==
X-Received: by 2002:a17:903:2452:b0:16a:3b58:48fd with SMTP id
 l18-20020a170903245200b0016a3b5848fdmr12856420pls.67.1656315049503; 
 Mon, 27 Jun 2022 00:30:49 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm6420928plk.137.2022.06.27.00.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:30:49 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: imammedo@redhat.com,
	mst@redhat.com
Subject: [PATCH 09/12] acpi/tests/bits: add acpi and smbios python tests that
 uses biosbits
Date: Mon, 27 Jun 2022 12:58:53 +0530
Message-Id: <20220627072856.1529357-10-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627072856.1529357-1-ani@anisinha.ca>
References: <20220627072856.1529357-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This change adds python based qtest framework that can be used to run
qtests from within a virtual environment. A bash script creates the virtual
environment and then runs the python based tests from within that environment.
All dependent python packages are installed in the virtual environment using
pip module. QEMU python test modules are also available in the environment for
spawning the QEMU based VMs.

It also introduces QEMU acpi/smbios biosbits python test script which is run
from within the python virtual environment.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/acpi-bits/acpi-bits-test-venv.sh |  59 ++++
 tests/qtest/acpi-bits/acpi-bits-test.py      | 327 +++++++++++++++++++
 tests/qtest/acpi-bits/meson.build            |  39 +++
 tests/qtest/acpi-bits/requirements.txt       |   1 +
 4 files changed, 426 insertions(+)
 create mode 100644 tests/qtest/acpi-bits/acpi-bits-test-venv.sh
 create mode 100644 tests/qtest/acpi-bits/acpi-bits-test.py
 create mode 100644 tests/qtest/acpi-bits/meson.build
 create mode 100644 tests/qtest/acpi-bits/requirements.txt

diff --git a/tests/qtest/acpi-bits/acpi-bits-test-venv.sh b/tests/qtest/acpi-bits/acpi-bits-test-venv.sh
new file mode 100644
index 0000000000..124e03ce18
--- /dev/null
+++ b/tests/qtest/acpi-bits/acpi-bits-test-venv.sh
@@ -0,0 +1,59 @@
+#!/usr/bin/env bash
+# Generates a python virtual environment for the test to run.
+# Then runs python test scripts from within that virtual environment.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
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
+# Author: Ani Sinha <ani@anisinha.ca>
+
+set -e
+
+MYPATH=$(realpath ${BASH_SOURCE:-$0})
+MYDIR=$(dirname $MYPATH)
+
+if [ -z "$QTEST_SOURCE_ROOT" ]; then
+    echo -n "Please set QTEST_SOURCE_ROOT env pointing"
+    echo " to the root of the qemu source tree."
+    echo -n "This is required so that the test can find the "
+    echo "python modules that it needs for execution."
+    exit 1
+fi
+SRCDIR=$QTEST_SOURCE_ROOT
+TESTSCRIPTS=("acpi-bits-test.py")
+PIPCMD="-m pip -q --disable-pip-version-check"
+# we need to save the old value of PWD before we do a change-dir later
+QTEST_PWD=$PWD
+
+TESTS_PYTHON=/usr/bin/python3
+TESTS_VENV_REQ=requirements.txt
+
+# sadly for pip -e and -t options do not work together.
+# please see https://github.com/pypa/pip/issues/562
+cd $MYDIR
+
+$TESTS_PYTHON -m venv .
+$TESTS_PYTHON $PIPCMD install -e $SRCDIR/python/
+[ -f $TESTS_VENV_REQ ] && \
+    $TESTS_PYTHON $PIPCMD install -r $TESTS_VENV_REQ
+
+# venv is activated at this point.
+
+# run the test
+for testscript in ${TESTSCRIPTS[@]} ; do
+    export QTEST_PWD; python3 $testscript
+done
+
+cd $QTEST_PWD
+
+exit 0
diff --git a/tests/qtest/acpi-bits/acpi-bits-test.py b/tests/qtest/acpi-bits/acpi-bits-test.py
new file mode 100644
index 0000000000..673567bf8e
--- /dev/null
+++ b/tests/qtest/acpi-bits/acpi-bits-test.py
@@ -0,0 +1,327 @@
+#!/usr/bin/env python3
+# group: rw quick
+# Exercize QEMU generated ACPI/SMBIOS tables using biosbits,
+# https://biosbits.org/
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
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
+# Some parts are slightly taken from qtest.py and iotests.py
+#
+# Authors:
+#  Ani Sinha <ani@anisinha.ca>
+
+# pylint: disable=invalid-name
+
+"""
+QEMU bios tests using biosbits available at
+https://biosbits.org/.
+"""
+
+import logging
+import os
+import re
+import shutil
+import subprocess
+import sys
+import tarfile
+import tempfile
+import time
+import unittest
+import zipfile
+from typing import (
+    List,
+    Optional,
+    Sequence,
+)
+from tap import TAPTestRunner
+from qemu.machine import QEMUMachine
+
+QTESTQEMUPROG = os.getenv('QTEST_QEMU_BINARY')
+QTEST_PWD = os.getenv('QTEST_PWD')
+
+def get_arch():
+    """finds the arch from the qemu binary name"""
+    match = re.search('.*qemu-system-(.*)', QTESTQEMUPROG)
+    if match:
+        return match.group(1)
+    return 'x86_64'
+
+ARCH = get_arch()
+
+class QEMUBitsMachine(QEMUMachine):
+    """
+    A QEMU VM, with isa-debugcon enabled and bits iso passed
+    using -cdrom to QEMU commandline.
+    """
+    def __init__(self,
+                 binary: str,
+                 args: Sequence[str] = (),
+                 wrapper: Sequence[str] = (),
+                 name: Optional[str] = None,
+                 base_temp_dir: str = "/var/tmp",
+                 debugcon_log: str = "debugcon-log.txt",
+                 debugcon_addr: str = "0x403",
+                 sock_dir: Optional[str] = None,
+                 qmp_timer: Optional[float] = None):
+        # pylint: disable=too-many-arguments
+
+        if name is None:
+            name = "qemu-bits-%d" % os.getpid()
+        if sock_dir is None:
+            sock_dir = base_temp_dir
+        super().__init__(binary, args, wrapper=wrapper, name=name,
+                         base_temp_dir=base_temp_dir,
+                         sock_dir=sock_dir, qmp_timer=qmp_timer)
+        self.debugcon_log = debugcon_log
+        self.debugcon_addr = debugcon_addr
+        self.base_temp_dir = base_temp_dir
+
+    @property
+    def _base_args(self) -> List[str]:
+        args = super()._base_args
+        args.extend([
+            '-chardev',
+            'file,path=%s,id=debugcon' %os.path.join(self.base_temp_dir,
+                                                     self.debugcon_log),
+            '-device',
+            'isa-debugcon,iobase=%s,chardev=debugcon' %self.debugcon_addr,
+        ])
+        return args
+
+    def base_args(self):
+        """return the base argument to QEMU binary"""
+        return self._base_args
+
+class AcpiBitsTest(unittest.TestCase):
+    """ACPI and SMBIOS tests using biosbits."""
+    def __init__(self, *args, **kwargs):
+        super().__init__(*args, **kwargs)
+        self._vm = None
+        self._workdir = None
+        self._bitsver = 2095
+        self._debugcon_addr = '0x403'
+        self._debugcon_log = 'debugcon-log.txt'
+        logging.basicConfig(level=logging.INFO)
+
+    def copy_bits_config(self):
+        """ copies the bios bits config file into bits.
+        """
+        config_file = 'bits-cfg.txt'
+        qemu_bits_config_dir = os.path.join(os.getcwd(), 'bits-config')
+        target_config_dir = os.path.join(self._workdir,
+                                         'bits-%d' %self._bitsver, 'boot')
+        self.assertTrue(os.path.exists(qemu_bits_config_dir))
+        self.assertTrue(os.path.exists(target_config_dir))
+        self.assertTrue(os.access(os.path.join(qemu_bits_config_dir,
+                                               config_file), os.R_OK))
+        shutil.copy2(os.path.join(qemu_bits_config_dir, config_file),
+                     target_config_dir)
+        logging.info('copied config file %s to %s',
+                     config_file, target_config_dir)
+
+    def copy_test_scripts(self):
+        """copies the python test scripts into bits. """
+        qemu_test_dir = os.path.join(os.getcwd(), 'bits-tests')
+        target_test_dir = os.path.join(self._workdir, 'bits-%d' %self._bitsver,
+                                       'boot', 'python')
+
+        self.assertTrue(os.path.exists(qemu_test_dir))
+        self.assertTrue(os.path.exists(target_test_dir))
+
+        for filename in os.listdir(qemu_test_dir):
+            if os.path.isfile(os.path.join(qemu_test_dir, filename)) and \
+               filename.endswith('.py'):
+                shutil.copy2(os.path.join(qemu_test_dir, filename),
+                             target_test_dir)
+                logging.info('copied test file %s to %s',
+                             filename, target_test_dir)
+
+                # now remove the pyc test file if it exists, otherwise the
+                # changes in the python test script won't be executed.
+                testfile_pyc = os.path.splitext(filename)[0] + '.pyc'
+                if os.access(os.path.join(target_test_dir, testfile_pyc),
+                             os.R_OK):
+                    os.remove(os.path.join(target_test_dir, testfile_pyc))
+                    logging.info('removed compiled file %s',
+                                 os.path.join(target_test_dir, testfile_pyc))
+
+    def fix_mkrescue(self, mkrescue):
+        """ grub-mkrescue is a bash script with two variables, 'prefix' and
+            'libdir'. They must be pointed to the right location so that the
+            iso can be generated appropriately. We point the two variables to
+            the directory where we have extracted our pre-built bits grub
+            tarball.
+        """
+        grub_x86_64_mods = os.path.join(self._workdir, 'bits-grub',
+                                        'grub-inst-x86_64-efi')
+        grub_i386_mods = os.path.join(self._workdir, 'bits-grub',
+                                      'grub-inst')
+
+        self.assertTrue(os.path.exists(grub_x86_64_mods))
+        self.assertTrue(os.path.exists(grub_i386_mods))
+
+        new_script = ""
+        with open(mkrescue, 'r') as filehandle:
+            orig_script = filehandle.read()
+            new_script = re.sub('(^prefix=)(.*)',
+                                r'\1"%s"' %grub_x86_64_mods,
+                                orig_script, flags=re.M)
+            new_script = re.sub('(^libdir=)(.*)', r'\1"%s/lib"' %grub_i386_mods,
+                                new_script, flags=re.M)
+
+        with open(mkrescue, 'w') as filehandle:
+            filehandle.write(new_script)
+
+    def generate_bits_iso(self):
+        """ Uses grub-mkrescue to generate a fresh bits iso with the python
+            test scripts
+        """
+        bits_dir = os.path.join(self._workdir, 'bits-%d' %self._bitsver)
+        iso_file = os.path.join(self._workdir, 'bits-%d.iso' %self._bitsver)
+        mkrescue_script = os.path.join(self._workdir,
+                                       'bits-grub', 'grub-inst-x86_64-efi',
+                                       'bin', 'grub-mkrescue')
+
+        self.assertTrue(os.access(mkrescue_script, os.R_OK | os.W_OK))
+
+        self.fix_mkrescue(mkrescue_script)
+
+        logging.info('calling grub-mkrescue to generate the biosbits iso ...')
+
+        if os.getenv('V'):
+            subprocess.check_call([mkrescue_script, '-o', iso_file, bits_dir],
+                                  stdout=subprocess.DEVNULL)
+        else:
+            subprocess.check_call([mkrescue_script, '-o', iso_file, bits_dir],
+                                  stderr=subprocess.DEVNULL,
+                                  stdout=subprocess.DEVNULL)
+
+        self.assertTrue(os.access(iso_file, os.R_OK))
+
+        logging.info('iso file %s successfully generated.', iso_file)
+
+    def setUp(self):
+        self._workdir = tempfile.mkdtemp(prefix='acpi-bits-',
+                                         suffix='.tmp')
+
+        logging.info('generated working dir: %s', self._workdir)
+
+        # extract the bits software in the temp working directory
+        bits_zip_file = os.path.join(os.getcwd(), 'prebuilt', 'bits-%d.zip'
+                                     %self._bitsver)
+        grub_tar_file = os.path.join(os.getcwd(), 'prebuilt',
+                                     'bits-%d-grub.tar.gz' %self._bitsver)
+
+        with zipfile.ZipFile(bits_zip_file, 'r') as zref:
+            zref.extractall(self._workdir)
+
+        with tarfile.open(grub_tar_file, 'r') as tarball:
+            tarball.extractall(self._workdir)
+
+        self.copy_test_scripts()
+        self.copy_bits_config()
+        self.generate_bits_iso()
+
+    def parse_log(self):
+        """parse the log generated by running bits tests and
+           check for failures.
+        """
+        debugconf = os.path.join(self._workdir, self._debugcon_log)
+        log = ""
+        with open(debugconf, 'r') as filehandle:
+            log = filehandle.read()
+
+        if os.getenv('V'):
+            print('\nlogs from biosbits follows:')
+            print('==========================================\n\n')
+            print(log)
+            print('\n==========================================\n')
+
+        matchiter = re.finditer(r'(.*Summary: )(\d+ passed), (\d+ failed).*',
+                                log)
+        for match in matchiter:
+            # verify that no test cases failed.
+            self.assertEqual(match.group(3).split()[0], '0',
+                             'Some bits tests seems to have failed. ' \
+                             'Set V=1 in the environment to get the entire ' \
+                             'log from bits.')
+
+    def tearDown(self):
+        if self._vm:
+            self.assertFalse(not self._vm.is_running)
+        logging.info('removing the work directory %s', self._workdir)
+        shutil.rmtree(self._workdir)
+
+    def test_acpi_smbios_bits(self):
+        """The main test case implementaion."""
+
+        qemu_bin = QTESTQEMUPROG
+        iso_file = os.path.join(self._workdir, 'bits-%d.iso' %self._bitsver)
+
+        # QTESTQEMUPROG could be relative to the current directory
+        if not os.access(QTESTQEMUPROG, os.X_OK):
+            qemu_bin = os.path.join(QTEST_PWD, QTESTQEMUPROG)
+
+        logging.info('QEMU binary used: %s', qemu_bin)
+
+        self.assertTrue(os.access(qemu_bin, os.X_OK))
+        self.assertTrue(os.access(iso_file, os.R_OK))
+
+        self._vm = QEMUBitsMachine(binary=qemu_bin,
+                                   base_temp_dir=self._workdir,
+                                   debugcon_log=self._debugcon_log,
+                                   debugcon_addr=self._debugcon_addr)
+
+        self._vm.add_args('-cdrom', '%s' %iso_file)
+
+        args = " ".join(str(arg) for arg in self._vm.base_args()) + \
+            " " + " ".join(str(arg) for arg in self._vm.args)
+
+        logging.info("launching QEMU vm with the following arguments: %s",
+                     args)
+
+        self._vm.launch()
+        # biosbits has been configured to run all the specified test suites
+        # in batch mode and then automatically initiate a vm shutdown.
+        # sleep for maximum of one minute
+        max_sleep_time = time.monotonic() + 60
+        while self._vm.is_running() and time.monotonic() < max_sleep_time:
+            time.sleep(1)
+
+        self.assertFalse(time.monotonic() > max_sleep_time,
+                         'The VM seems to have failed to shutdown in time')
+
+        self.parse_log()
+
+def execute_unittest(argv: List[str], debug: bool = False,
+                     runner: TAPTestRunner = None) -> None:
+    """Executes unittests within the calling module."""
+
+    unittest.main(argv=argv,
+                  testRunner=runner,
+                  verbosity=2 if debug else 1,
+                  warnings=None if sys.warnoptions else 'ignore')
+
+def main():
+    """ The main function where execution begins. """
+
+    assert QTESTQEMUPROG is not None, \
+        "Environment variable QTEST_QEMU_BINARY required."
+
+    runner = TAPTestRunner()
+    runner.set_stream(True)
+    runner.set_format("%s/acpi-bits-test" %ARCH)
+    execute_unittest(sys.argv, False, runner)
+
+main()
diff --git a/tests/qtest/acpi-bits/meson.build b/tests/qtest/acpi-bits/meson.build
new file mode 100644
index 0000000000..95c096914f
--- /dev/null
+++ b/tests/qtest/acpi-bits/meson.build
@@ -0,0 +1,39 @@
+xorriso = find_program('xorriso', required: true)
+if not xorriso.found()
+  message('xorriso not found ... disabled bits acpi tests.')
+  subdir_done()
+endif
+
+# biosbits qtests are currenly only supported on x86_64 platforms.
+qtests_x86_64 += ['acpi-bits-test']
+qtests +=  {'acpi-bits-test' : files('acpi-bits-test.py'),}
+slow_qtests += {'acpi-bits-test': 120, }
+
+subdir('prebuilt')
+subdir('bits-tests')
+subdir('bits-config')
+
+test_files = ['acpi-bits-test.py']
+requirements = 'requirements.txt'
+
+copytestfiles = custom_target('copy test files',
+  input : test_files,
+  output :  test_files,
+  command : ['cp', '@INPUT@', '@OUTPUT@'],
+  install : false,
+  build_by_default : true)
+
+requirementsfiles = custom_target('copy py req files',
+  input : requirements,
+  output : requirements,
+  command : ['cp', '@INPUT@', '@OUTPUT@'],
+  install : false,
+  build_by_default : true)
+
+other_deps += [copytestfiles,requirementsfiles]
+
+qtest_executables += {
+    'acpi-bits-test': configure_file(copy:true,
+                                     input:'acpi-bits-test-venv.sh',
+				     output:'acpi-bits-test')
+}
diff --git a/tests/qtest/acpi-bits/requirements.txt b/tests/qtest/acpi-bits/requirements.txt
new file mode 100644
index 0000000000..00cdad09ef
--- /dev/null
+++ b/tests/qtest/acpi-bits/requirements.txt
@@ -0,0 +1 @@
+tap.py
-- 
2.25.1


