Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7835FF32E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 19:54:31 +0200 (CEST)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojOtC-0004QG-SZ
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 13:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojOc5-00037L-5x
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:49 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojOc2-0008A3-J7
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:48 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso5370775pjk.1
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 10:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFeF205s7eGJD3bBagO1ABwxfvxEB9YFagGiBb9TV2g=;
 b=3UJ0hOXbHTklOZYmQeIy258Wul05zRasAfzJj6qdZrdqHgh7s1zaRMU91K7ZvZV0bN
 xgP7ab+uVGl0InR3xEVln+HZOo/gAQlssujr3CodXrKOdCPp8NbOCJBLrb5WsHKEjAyv
 p985cgyW+StlUhoG4Z6L9du9Y1L0jtunfn5ivVuSahE9vVs1FvvSx2WFBRAylzTyBXT0
 SLTG5x81hZNJO2+7iAYyPjpG97bz/xxaMW9fyTxVuooo0PncKHqijgqdKRpB9MCJgr/S
 s+VP6+8E1YCRT+UNCFbSMDtWavNjAne5TaCp2bCF8q0AXkVnSfF5q5byn4aRLJVKSr0K
 XVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFeF205s7eGJD3bBagO1ABwxfvxEB9YFagGiBb9TV2g=;
 b=M2e+KJWL+NJo8keWzlAKhCRbJITzwmXvgOm29D0gCOGLCRy4pw1U7bdxOFASg8lsxt
 xcVSgQHl4hhF2Yynawe6QFEoxpzuYK4tM4wzw+/DAMmFSsH+i1EsFuf1kG5eoE+rHkGt
 eKfWlvZftZPdLVnC6/HGA4D+NNqseKtNYO8DBY3tQsWcH1h01Ztr7/GU1rDavfvspWFS
 WEvPgMvB2di5UssQFDzL/oTW5huqHxLbdCs6tdtBSpCC+9U3Ib72gqfswK0YOWV86cTc
 UAw1Dg3x7yUPtja0Bu6awIdopHIiAU8TTmH0kTBPnHuEDwGZwj9MjZZWFBuMHUEzIEzw
 vIeg==
X-Gm-Message-State: ACrzQf1crK+kIljwp95mNxsWGX2C0x1rJKUgvyLoeCszSZlRGppCsNxO
 wnTKE5kDRnxoMZk/i9f3jerQEg==
X-Google-Smtp-Source: AMsMyM6nMw6fgoAgmqhW+T5+mo0ocrLX3eBkx6+SL0kLhlTB25uArLaAS236hkVpQ7/wtAifupoQew==
X-Received: by 2002:a17:902:f78b:b0:17f:9c94:b247 with SMTP id
 q11-20020a170902f78b00b0017f9c94b247mr6162487pln.137.1665769004982; 
 Fri, 14 Oct 2022 10:36:44 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.243.197])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a1709027fcd00b0016d8d277c02sm2030042plb.25.2022.10.14.10.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 10:36:44 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v4 08/10] acpi/tests/avocado/bits: add acpi and smbios avocado
 tests that uses biosbits
Date: Fri, 14 Oct 2022 23:05:06 +0530
Message-Id: <20221014173508.222823-9-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014173508.222823-1-ani@anisinha.ca>
References: <20221014173508.222823-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This introduces QEMU acpi/smbios biosbits avocado test which is run
from within the python virtual environment. When the bits tests are run, bits
binaries are downloaded from an external repo/location, bios bits iso is
regenerated containing the acpi/smbios bits tests that are maintained as a part
of the QEMU source under tests/avocado/acpi-bits/bits-test . When the VM is
spawned with the iso, it runs the tests in batch mode and the results are pushed
out from the VM to the test machine where they are analyzed by this script and
pass/fail results are reported.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits.py | 359 +++++++++++++++++++++++++++++++++++++
 1 file changed, 359 insertions(+)
 create mode 100644 tests/avocado/acpi-bits.py

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
new file mode 100644
index 0000000000..009c7f5327
--- /dev/null
+++ b/tests/avocado/acpi-bits.py
@@ -0,0 +1,359 @@
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
+#
+# Author:
+#  Ani Sinha <ani@anisinha.ca>
+
+# pylint: disable=invalid-name
+# pylint: disable=consider-using-f-string
+
+"""
+This is QEMU ACPI/SMBIOS avocado tests using biosbits.
+Biosbits is available originally at https://biosbits.org/.
+This test uses a fork of the upstream bits and has numerous fixes
+including an upgraded acpica. The fork is located here:
+https://gitlab.com/qemu-project/biosbits-bits .
+"""
+
+import logging
+import os
+import re
+import shutil
+import subprocess
+import tarfile
+import tempfile
+import time
+import zipfile
+from typing import (
+    List,
+    Optional,
+    Sequence,
+)
+from qemu.machine import QEMUMachine
+from avocado import skipIf
+from avocado_qemu import QemuBaseTest
+
+def _print_log(log):
+    print('\nlogs from biosbits follows:')
+    print('==========================================\n')
+    print(log)
+    print('==========================================\n')
+
+class QEMUBitsMachine(QEMUMachine): # pylint: disable=too-few-public-methods
+    """
+    A QEMU VM, with isa-debugcon enabled and bits iso passed
+    using -cdrom to QEMU commandline.
+
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
+@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+class AcpiBitsTest(QemuBaseTest): #pylint: disable=too-many-instance-attributes
+    """
+    ACPI and SMBIOS tests using biosbits.
+
+    :avocado: tags=arch:x86_64
+    :avocado: tags=acpi
+
+    """
+    def __init__(self, *args, **kwargs):
+        super().__init__(*args, **kwargs)
+        self._vm = None
+        self._workDir = None
+        self._baseDir = None
+
+        # following are some standard configuration constants
+        self._bitsInternalVer = 2020
+        self._bitsCommitHash = 'b972c69d' # commit hash must match
+                                          # the artifact tag below
+        self._bitsTag = "qemu-bits-09272022" # this is the latest bits
+                                             # release as of today.
+        self._bitsArtSHA1Hash = '6915ad4781de0d80d1a099438a4cb4bd9e12df70'
+        self._bitsArtURL = ("https://gitlab.com/qemu-project/"
+                            "biosbits-bits/-/jobs/artifacts/%s/"
+                            "download?job=qemu-bits-build" %self._bitsTag)
+        self._debugcon_addr = '0x403'
+        self._debugcon_log = 'debugcon-log.txt'
+        logging.basicConfig(level=logging.INFO)
+
+    def copy_bits_config(self):
+        """ copies the bios bits config file into bits.
+        """
+        config_file = 'bits-cfg.txt'
+        bits_config_dir = os.path.join(self._baseDir, 'acpi-bits',
+                                       'bits-config')
+        target_config_dir = os.path.join(self._workDir,
+                                         'bits-%d' %self._bitsInternalVer,
+                                         'boot')
+        self.assertTrue(os.path.exists(bits_config_dir))
+        self.assertTrue(os.path.exists(target_config_dir))
+        self.assertTrue(os.access(os.path.join(bits_config_dir,
+                                               config_file), os.R_OK))
+        shutil.copy2(os.path.join(bits_config_dir, config_file),
+                     target_config_dir)
+        logging.info('copied config file %s to %s',
+                     config_file, target_config_dir)
+
+    def copy_test_scripts(self):
+        """copies the python test scripts into bits. """
+
+        bits_test_dir = os.path.join(self._baseDir, 'acpi-bits',
+                                     'bits-tests')
+        target_test_dir = os.path.join(self._workDir,
+                                       'bits-%d' %self._bitsInternalVer,
+                                       'boot', 'python')
+
+        self.assertTrue(os.path.exists(bits_test_dir))
+        self.assertTrue(os.path.exists(target_test_dir))
+
+        for filename in os.listdir(bits_test_dir):
+            if os.path.isfile(os.path.join(bits_test_dir, filename)) and \
+               filename.endswith('.py2'):
+                # all test scripts are named with extension .py2 so that
+                # avocado does not try to load them. These scripts are
+                # written for python 2.7 not python 3 and hence if avocado
+                # loaded them, it would complain about python 3 specific
+                # syntaxes.
+                newfilename = os.path.splitext(filename)[0] + '.py'
+                shutil.copy2(os.path.join(bits_test_dir, filename),
+                             os.path.join(target_test_dir, newfilename))
+                logging.info('copied test file %s to %s',
+                             filename, target_test_dir)
+
+                # now remove the pyc test file if it exists, otherwise the
+                # changes in the python test script won't be executed.
+                testfile_pyc = os.path.splitext(filename)[0] + '.pyc'
+                if os.access(os.path.join(target_test_dir, testfile_pyc),
+                             os.F_OK):
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
+        grub_x86_64_mods = os.path.join(self._workDir, 'grub-inst-x86_64-efi')
+        grub_i386_mods = os.path.join(self._workDir, 'grub-inst')
+
+        self.assertTrue(os.path.exists(grub_x86_64_mods))
+        self.assertTrue(os.path.exists(grub_i386_mods))
+
+        new_script = ""
+        with open(mkrescue, 'r', encoding='utf-8') as filehandle:
+            orig_script = filehandle.read()
+            new_script = re.sub('(^prefix=)(.*)',
+                                r'\1"%s"' %grub_x86_64_mods,
+                                orig_script, flags=re.M)
+            new_script = re.sub('(^libdir=)(.*)', r'\1"%s/lib"' %grub_i386_mods,
+                                new_script, flags=re.M)
+
+        with open(mkrescue, 'w', encoding='utf-8') as filehandle:
+            filehandle.write(new_script)
+
+    def generate_bits_iso(self):
+        """ Uses grub-mkrescue to generate a fresh bits iso with the python
+            test scripts
+        """
+        bits_dir = os.path.join(self._workDir,
+                                'bits-%d' %self._bitsInternalVer)
+        iso_file = os.path.join(self._workDir,
+                                'bits-%d.iso' %self._bitsInternalVer)
+        mkrescue_script = os.path.join(self._workDir,
+                                       'grub-inst-x86_64-efi', 'bin',
+                                       'grub-mkrescue')
+
+        self.assertTrue(os.access(mkrescue_script,
+                                  os.R_OK | os.W_OK | os.X_OK))
+
+        self.fix_mkrescue(mkrescue_script)
+
+        logging.info('calling grub-mkrescue to generate the biosbits iso ...')
+
+        try:
+            if os.getenv('V'):
+                subprocess.check_call([mkrescue_script, '-o',
+                                      iso_file, bits_dir],
+                                      stdout=subprocess.DEVNULL)
+            else:
+                subprocess.check_call([mkrescue_script, '-o',
+                                      iso_file, bits_dir],
+                                      stderr=subprocess.DEVNULL,
+                                      stdout=subprocess.DEVNULL)
+        except Exception as e: # pylint: disable=broad-except
+            self.skipTest("Error while generating the bits iso. "
+                          "Pass V=1 in the environment to get more details. "
+                          + str(e))
+
+        self.assertTrue(os.access(iso_file, os.R_OK))
+
+        logging.info('iso file %s successfully generated.', iso_file)
+
+    def setUp(self): # pylint: disable=arguments-differ
+        super().setUp('qemu-system-')
+        self._baseDir = os.getenv('AVOCADO_TEST_BASEDIR')
+
+        # workdir could also be avocado's own workdir in self.workdir.
+        # At present, I prefer to maintain my own temporary working
+        # directory. It gives us more control over the generated bits
+        # log files and also for debugging, we may chose not to remove
+        # this working directory so that the logs and iso can be
+        # inspected manually and archived if needed.
+        self._workDir = tempfile.mkdtemp(prefix='acpi-bits-',
+                                         suffix='.tmp')
+        logging.info('working dir: %s', self._workDir)
+
+        prebuiltDir = os.path.join(self._workDir, 'prebuilt')
+        if not os.path.isdir(prebuiltDir):
+            os.mkdir(prebuiltDir, mode=0o775)
+
+        bits_zip_file = os.path.join(prebuiltDir, 'bits-%d-%s.zip'
+                                     %(self._bitsInternalVer,
+                                       self._bitsCommitHash))
+        grub_tar_file = os.path.join(prebuiltDir,
+                                     'bits-%d-%s-grub.tar.gz'
+                                     %(self._bitsInternalVer,
+                                       self._bitsCommitHash))
+
+        bitsLocalArtLoc = self.fetch_asset(self._bitsArtURL,
+                                           asset_hash=self._bitsArtSHA1Hash)
+        logging.info("downloaded bits artifacts to %s", bitsLocalArtLoc)
+
+        # extract the bits artifact in the temp working directory
+        with zipfile.ZipFile(bitsLocalArtLoc, 'r') as zref:
+            zref.extractall(prebuiltDir)
+
+        # extract the bits software in the temp working directory
+        with zipfile.ZipFile(bits_zip_file, 'r') as zref:
+            zref.extractall(self._workDir)
+
+        with tarfile.open(grub_tar_file, 'r', encoding='utf-8') as tarball:
+            tarball.extractall(self._workDir)
+
+        self.copy_test_scripts()
+        self.copy_bits_config()
+        self.generate_bits_iso()
+
+    def parse_log(self):
+        """parse the log generated by running bits tests and
+           check for failures.
+        """
+        debugconf = os.path.join(self._workDir, self._debugcon_log)
+        log = ""
+        with open(debugconf, 'r', encoding='utf-8') as filehandle:
+            log = filehandle.read()
+
+        matchiter = re.finditer(r'(.*Summary: )(\d+ passed), (\d+ failed).*',
+                                log)
+        for match in matchiter:
+            # verify that no test cases failed.
+            try:
+                self.assertEqual(match.group(3).split()[0], '0',
+                                 'Some bits tests seems to have failed. ' \
+                                 'Please check the test logs for more info.')
+            except AssertionError as e:
+                _print_log(log)
+                raise e
+            else:
+                if os.getenv('V'):
+                    _print_log(log)
+
+    def tearDown(self):
+        """
+           Lets do some cleanups.
+        """
+        if self._vm:
+            self.assertFalse(not self._vm.is_running)
+        logging.info('removing the work directory %s', self._workDir)
+        shutil.rmtree(self._workDir)
+        super().tearDown()
+
+    def test_acpi_smbios_bits(self):
+        """The main test case implementaion."""
+
+        iso_file = os.path.join(self._workDir,
+                                'bits-%d.iso' %self._bitsInternalVer)
+
+        self.assertTrue(os.access(iso_file, os.R_OK))
+
+        self._vm = QEMUBitsMachine(binary=self.qemu_bin,
+                                   base_temp_dir=self._workDir,
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
-- 
2.34.1


