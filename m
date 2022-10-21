Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ED26074FD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:30:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpHx-0004Sp-Oa
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:30:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olosg-00045N-Qw
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olorh-000277-L0
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:03:05 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olore-0006Jt-KT
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:02:57 -0400
Received: by mail-pf1-x429.google.com with SMTP id m6so2191557pfb.0
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KpFFXbze9zSnhewRp3etUDsRgD4VSMuCNwoBKIdcDoE=;
 b=I7vqmZSctFJK+IKtyK+3H9xaAEmJcYs90ZAG+pQYME3CxBt2kcjlncufaDYtSD1eK0
 lWOQhTtUdr5OxjgEdl0pUcm99VJcwNI6CkTefqEf+ELl5gc1ZwZtMHPs9IwJabcLtoew
 VErJZDCQAksm4fexE6uisEZiMvFK0uck/I+tIl8/vToGFg3pOpX8zT1nmTJq4CStSBRE
 p+qOrt4Zlungr3UZmg9/QKTiCnqy/yeTdGgTQgtEjBj2qxIOCQmHL3KcUiYWxxse44Us
 vZqCfLdgeVuiBSs+tV5gBktdhELdW7UP6/dbLJzdDp7RzrVc+0AFL+LMixYpPW44/t8H
 WdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KpFFXbze9zSnhewRp3etUDsRgD4VSMuCNwoBKIdcDoE=;
 b=WVigbYJJa9YKHozpKEhULDgHm+bK7mHj1EpYU8ow+4GHuFQdPuzyY4Y4/stg7dUWOU
 PvcULBP5iElF1f9JzYpwpcMj0eTioq6XflykHwcPNVUxbfIjDKxHO2Aoj5Kk3a6bRf8K
 kYPUPhUGXIG7m/4xytBLZ6TGXxqeLj5oPK4488ApvZ8znnD7zfk1Q0e6N1lsw8M7taqY
 5aP1ohQuv0w3w1+uKZrsvFG+qmbyuy9P9hfEOXhOwipVt6Pxgh3Q5q3qqH2Kdoepoe37
 Uy7ATI3L7/AV56GpAI9w16xhe3twCH7mYxXqe3pmVI87jmwGBunIKmyQuQd2JOk88bgG
 XDVA==
X-Gm-Message-State: ACrzQf3hT3He6tCJJ1PROest8uszjfra3CjSXUncWH+bODErrcutKccQ
 0RAjktOlcrX0aIKWr7WQBsAK8A==
X-Google-Smtp-Source: AMsMyM7rmmdrUwM4PW5VUMpvAo1xq+e2hQq6K17pO6+8Crhb6fSGmL3lJVxccl3p4eviUl10la+nPw==
X-Received: by 2002:a63:2c4c:0:b0:434:e001:89fd with SMTP id
 s73-20020a632c4c000000b00434e00189fdmr15556044pgs.444.1666346573112; 
 Fri, 21 Oct 2022 03:02:53 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.245.138])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020a631e0e000000b0042fe1914e26sm12997375pge.37.2022.10.21.03.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 03:02:52 -0700 (PDT)
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
Subject: [PATCH v7 5/7] acpi/tests/avocado/bits: add acpi and smbios avocado
 tests that uses biosbits
Date: Fri, 21 Oct 2022 15:21:06 +0530
Message-Id: <20221021095108.104843-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021095108.104843-1-ani@anisinha.ca>
References: <20221021095108.104843-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x429.google.com
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
 tests/avocado/acpi-bits.py | 396 +++++++++++++++++++++++++++++++++++++
 1 file changed, 396 insertions(+)
 create mode 100644 tests/avocado/acpi-bits.py

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
new file mode 100644
index 0000000000..8745a58a76
--- /dev/null
+++ b/tests/avocado/acpi-bits.py
@@ -0,0 +1,396 @@
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
+import platform
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
+deps = ["xorriso"] # dependent tools needed in the test setup/box.
+supported_platforms = ['x86_64'] # supported test platforms.
+
+
+def which(tool):
+    """ looks up the full path for @tool, returns None if not found
+        or if @tool does not have executable permissions.
+    """
+    paths=os.getenv('PATH')
+    for p in paths.split(os.path.pathsep):
+        p = os.path.join(p, tool)
+        if os.path.exists(p) and os.access(p, os.X_OK):
+            return p
+    return None
+
+def missing_deps():
+    """ returns True if any of the test dependent tools are absent.
+    """
+    for dep in deps:
+        if which(dep) is None:
+            return True
+    return False
+
+def supported_platform():
+    """ checks if the test is running on a supported platform.
+    """
+    return platform.machine() in supported_platforms
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
+@skipIf(not supported_platform() or missing_deps() or os.getenv('GITLAB_CI'),
+        'incorrect platform or dependencies (%s) not installed ' \
+        'or running on GitLab' % ','.join(deps))
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
+        self._bitsCommitHash = 'b48b88ff' # commit hash must match
+                                          # the artifact tag below
+        self._bitsTag = "qemu-bits-10182022" # this is the latest bits
+                                             # release as of today.
+        self._bitsArtSHA1Hash = 'b04790ac9b99b5662d0416392c73b97580641fe5'
+        self._bitsArtURL = ("https://gitlab.com/qemu-project/"
+                            "biosbits-bits/-/jobs/artifacts/%s/"
+                            "download?job=qemu-bits-build" %self._bitsTag)
+        self._debugcon_addr = '0x403'
+        self._debugcon_log = 'debugcon-log.txt'
+        logging.basicConfig(level=logging.INFO)
+        self.logger = logging.getLogger('acpi-bits')
+
+    def _print_log(self, log):
+        self.logger.info('\nlogs from biosbits follows:')
+        self.logger.info('==========================================\n')
+        self.logger.info(log)
+        self.logger.info('==========================================\n')
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
+        self.logger.info('copied config file %s to %s',
+                         config_file, target_config_dir)
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
+                self.logger.info('copied test file %s to %s',
+                                 filename, target_test_dir)
+
+                # now remove the pyc test file if it exists, otherwise the
+                # changes in the python test script won't be executed.
+                testfile_pyc = os.path.splitext(filename)[0] + '.pyc'
+                if os.access(os.path.join(target_test_dir, testfile_pyc),
+                             os.F_OK):
+                    os.remove(os.path.join(target_test_dir, testfile_pyc))
+                    self.logger.info('removed compiled file %s',
+                                     os.path.join(target_test_dir,
+                                     testfile_pyc))
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
+        self.logger.info('using grub-mkrescue for generating biosbits iso ...')
+
+        try:
+            if os.getenv('V'):
+                subprocess.check_call([mkrescue_script, '-o', iso_file,
+                                       bits_dir], stderr=subprocess.STDOUT)
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
+        self.logger.info('iso file %s successfully generated.', iso_file)
+
+    def setUp(self): # pylint: disable=arguments-differ
+        super().setUp('qemu-system-')
+
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
+        self.logger.info('working dir: %s', self._workDir)
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
+        self.logger.info("downloaded bits artifacts to %s", bitsLocalArtLoc)
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
+                self._print_log(log)
+                raise e
+            else:
+                if os.getenv('V'):
+                    self._print_log(log)
+
+    def tearDown(self):
+        """
+           Lets do some cleanups.
+        """
+        if self._vm:
+            self.assertFalse(not self._vm.is_running)
+        self.logger.info('removing the work directory %s', self._workDir)
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
+        # the vm needs to be run under icount so that TCG emulation is
+        # consistent in terms of timing. smilatency tests have consistent
+        # timing requirements.
+        self._vm.add_args('-icount', 'auto')
+
+        args = " ".join(str(arg) for arg in self._vm.base_args()) + \
+            " " + " ".join(str(arg) for arg in self._vm.args)
+
+        self.logger.info("launching QEMU vm with the following arguments: %s",
+                         args)
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


