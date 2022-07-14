Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F303957506A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 16:10:45 +0200 (CEST)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBzYC-0002aG-KN
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 10:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBzTV-00054H-O1
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:05:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBzTT-00026u-09
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657807550;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=P2aVHrfgSLXl3ws8+YIUG6/PcdcitT2lVODSVX87y0g=;
 b=AqK7pYEvPb9TAatxt8g+aH6eDg+wVsauLVhhEWewD55d4Dd3gYWla5Zq2BYADYTFT8dvgZ
 tNzUwMpXjtuOUG/1ZvBgtbGybqNsr+arLyK7uoartlrxAgsQLSaP+a9QQLsoz8omIiqKQk
 iGcN8w6jU2Qbx+GTbZY4TsJd1qNoPk8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-IgKddlWPM92-m7iuegSDIg-1; Thu, 14 Jul 2022 10:05:47 -0400
X-MC-Unique: IgKddlWPM92-m7iuegSDIg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0E57294EDD1;
 Thu, 14 Jul 2022 14:05:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B296F492C3B;
 Thu, 14 Jul 2022 14:05:44 +0000 (UTC)
Date: Thu, 14 Jul 2022 15:05:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, peter.maydell@linaro.org,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <YtAitsVyHmsLRKEL@redhat.com>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220710170014.1673480-8-ani@anisinha.ca>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 10, 2022 at 10:30:10PM +0530, Ani Sinha wrote:
> This change adds python based test environment that can be used to run pytest
> from within a virtual environment. A bash script sets up a virtual environment
> and then runs the python based tests from within that environment.
> All dependent python packages are installed in the virtual environment using
> pip python module. QEMU python test modules are also available in the environment
> for spawning the QEMU based VMs.
> 
> It also introduces QEMU acpi/smbios biosbits python test script which is run
> from within the python virtual environment. When the bios bits tests are run,
> bios bits binaries are downloaded from an external repo/location.
> Currently, the test points to an external private github repo where the bits
> archives are checked in.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/pytest/acpi-bits/acpi-bits-test-venv.sh |  59 +++
>  tests/pytest/acpi-bits/acpi-bits-test.py      | 382 ++++++++++++++++++
>  tests/pytest/acpi-bits/meson.build            |  33 ++
>  tests/pytest/acpi-bits/requirements.txt       |   1 +
>  4 files changed, 475 insertions(+)
>  create mode 100644 tests/pytest/acpi-bits/acpi-bits-test-venv.sh
>  create mode 100644 tests/pytest/acpi-bits/acpi-bits-test.py
>  create mode 100644 tests/pytest/acpi-bits/meson.build
>  create mode 100644 tests/pytest/acpi-bits/requirements.txt
> 
> diff --git a/tests/pytest/acpi-bits/acpi-bits-test-venv.sh b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> new file mode 100644
> index 0000000000..186395473b
> --- /dev/null
> +++ b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> @@ -0,0 +1,59 @@
> +#!/usr/bin/env bash
> +# Generates a python virtual environment for the test to run.
> +# Then runs python test scripts from within that virtual environment.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +# Author: Ani Sinha <ani@anisinha.ca>
> +
> +set -e
> +
> +MYPATH=$(realpath ${BASH_SOURCE:-$0})
> +MYDIR=$(dirname $MYPATH)
> +
> +if [ -z "$PYTEST_SOURCE_ROOT" ]; then
> +    echo -n "Please set QTEST_SOURCE_ROOT env pointing"
> +    echo " to the root of the qemu source tree."
> +    echo -n "This is required so that the test can find the "
> +    echo "python modules that it needs for execution."
> +    exit 1
> +fi
> +SRCDIR=$PYTEST_SOURCE_ROOT
> +TESTSCRIPTS=("acpi-bits-test.py")
> +PIPCMD="-m pip -q --disable-pip-version-check"
> +# we need to save the old value of PWD before we do a change-dir later
> +PYTEST_PWD=$PWD
> +
> +TESTS_PYTHON=/usr/bin/python3
> +TESTS_VENV_REQ=requirements.txt
> +
> +# sadly for pip -e and -t options do not work together.
> +# please see https://github.com/pypa/pip/issues/562
> +cd $MYDIR
> +
> +$TESTS_PYTHON -m venv .
> +$TESTS_PYTHON $PIPCMD install -e $SRCDIR/python/
> +[ -f $TESTS_VENV_REQ ] && \
> +    $TESTS_PYTHON $PIPCMD install -r $TESTS_VENV_REQ || exit 0
> +
> +# venv is activated at this point.
> +
> +# run the test
> +for testscript in ${TESTSCRIPTS[@]} ; do
> +    export PYTEST_PWD; python3 $testscript
> +done
> +
> +cd $PYTEST_PWD
> +
> +exit 0
> diff --git a/tests/pytest/acpi-bits/acpi-bits-test.py b/tests/pytest/acpi-bits/acpi-bits-test.py
> new file mode 100644
> index 0000000000..97e61eb709
> --- /dev/null
> +++ b/tests/pytest/acpi-bits/acpi-bits-test.py
> @@ -0,0 +1,382 @@
> +#!/usr/bin/env python3
> +# group: rw quick
> +# Exercize QEMU generated ACPI/SMBIOS tables using biosbits,
> +# https://biosbits.org/
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +# Some parts are slightly taken from qtest.py and iotests.py
> +#
> +# Authors:
> +#  Ani Sinha <ani@anisinha.ca>
> +
> +# pylint: disable=invalid-name
> +
> +"""
> +QEMU bios tests using biosbits available at
> +https://biosbits.org/.
> +"""
> +
> +import logging
> +import os
> +import re
> +import shutil
> +import subprocess
> +import sys
> +import tarfile
> +import tempfile
> +import time
> +import unittest
> +from urllib import request
> +import zipfile
> +from typing import (
> +    List,
> +    Optional,
> +    Sequence,
> +)
> +from tap import TAPTestRunner
> +from qemu.machine import QEMUMachine
> +
> +PYTESTQEMUBIN = os.getenv('PYTEST_QEMU_BINARY')
> +PYTEST_PWD = os.getenv('PYTEST_PWD')
> +
> +def get_arch():
> +    """finds the arch from the qemu binary name"""
> +    match = re.search('.*qemu-system-(.*)', PYTESTQEMUBIN)
> +    if match:
> +        return match.group(1)
> +    return 'x86_64'
> +
> +ARCH = get_arch()
> +
> +class QEMUBitsMachine(QEMUMachine):
> +    """
> +    A QEMU VM, with isa-debugcon enabled and bits iso passed
> +    using -cdrom to QEMU commandline.
> +    """
> +    def __init__(self,
> +                 binary: str,
> +                 args: Sequence[str] = (),
> +                 wrapper: Sequence[str] = (),
> +                 name: Optional[str] = None,
> +                 base_temp_dir: str = "/var/tmp",
> +                 debugcon_log: str = "debugcon-log.txt",
> +                 debugcon_addr: str = "0x403",
> +                 sock_dir: Optional[str] = None,
> +                 qmp_timer: Optional[float] = None):
> +        # pylint: disable=too-many-arguments
> +
> +        if name is None:
> +            name = "qemu-bits-%d" % os.getpid()
> +        if sock_dir is None:
> +            sock_dir = base_temp_dir
> +        super().__init__(binary, args, wrapper=wrapper, name=name,
> +                         base_temp_dir=base_temp_dir,
> +                         sock_dir=sock_dir, qmp_timer=qmp_timer)
> +        self.debugcon_log = debugcon_log
> +        self.debugcon_addr = debugcon_addr
> +        self.base_temp_dir = base_temp_dir
> +
> +    @property
> +    def _base_args(self) -> List[str]:
> +        args = super()._base_args
> +        args.extend([
> +            '-chardev',
> +            'file,path=%s,id=debugcon' %os.path.join(self.base_temp_dir,
> +                                                     self.debugcon_log),
> +            '-device',
> +            'isa-debugcon,iobase=%s,chardev=debugcon' %self.debugcon_addr,
> +        ])
> +        return args
> +
> +    def base_args(self):
> +        """return the base argument to QEMU binary"""
> +        return self._base_args
> +
> +class AcpiBitsTest(unittest.TestCase):
> +    """ACPI and SMBIOS tests using biosbits."""
> +    def __init__(self, *args, **kwargs):
> +        super().__init__(*args, **kwargs)
> +        self._vm = None
> +        self._workDir = None
> +        self._bitsVer = 2100
> +        self._bitsLoc = "https://github.com/ani-sinha/bits/raw/bits-builds/"

This URL location gives a 404 - was it supposed to be poiinting to the
bits-builds  branch ?  eg to form a URL like:

  https://github.com/ani-sinha/bits/blob/bits-builds/bits-2100.zip?raw=true

> +        self._debugcon_addr = '0x403'
> +        self._debugcon_log = 'debugcon-log.txt'
> +        logging.basicConfig(level=logging.INFO)
> +
> +    def copy_bits_config(self):
> +        """ copies the bios bits config file into bits.
> +        """
> +        config_file = 'bits-cfg.txt'
> +        qemu_bits_config_dir = os.path.join(os.getcwd(), 'bits-config')
> +        target_config_dir = os.path.join(self._workDir,
> +                                         'bits-%d' %self._bitsVer, 'boot')
> +        self.assertTrue(os.path.exists(qemu_bits_config_dir))
> +        self.assertTrue(os.path.exists(target_config_dir))
> +        self.assertTrue(os.access(os.path.join(qemu_bits_config_dir,
> +                                               config_file), os.R_OK))
> +        shutil.copy2(os.path.join(qemu_bits_config_dir, config_file),
> +                     target_config_dir)
> +        logging.info('copied config file %s to %s',
> +                     config_file, target_config_dir)
> +
> +    def copy_test_scripts(self):
> +        """copies the python test scripts into bits. """
> +        qemu_test_dir = os.path.join(os.getcwd(), 'bits-tests')
> +        target_test_dir = os.path.join(self._workDir, 'bits-%d' %self._bitsVer,
> +                                       'boot', 'python')
> +
> +        self.assertTrue(os.path.exists(qemu_test_dir))
> +        self.assertTrue(os.path.exists(target_test_dir))
> +
> +        for filename in os.listdir(qemu_test_dir):
> +            if os.path.isfile(os.path.join(qemu_test_dir, filename)) and \
> +               filename.endswith('.py'):
> +                shutil.copy2(os.path.join(qemu_test_dir, filename),
> +                             target_test_dir)
> +                logging.info('copied test file %s to %s',
> +                             filename, target_test_dir)
> +
> +                # now remove the pyc test file if it exists, otherwise the
> +                # changes in the python test script won't be executed.
> +                testfile_pyc = os.path.splitext(filename)[0] + '.pyc'
> +                if os.access(os.path.join(target_test_dir, testfile_pyc),
> +                             os.F_OK):
> +                    os.remove(os.path.join(target_test_dir, testfile_pyc))
> +                    logging.info('removed compiled file %s',
> +                                 os.path.join(target_test_dir, testfile_pyc))
> +
> +    def fix_mkrescue(self, mkrescue):
> +        """ grub-mkrescue is a bash script with two variables, 'prefix' and
> +            'libdir'. They must be pointed to the right location so that the
> +            iso can be generated appropriately. We point the two variables to
> +            the directory where we have extracted our pre-built bits grub
> +            tarball.
> +        """
> +        grub_x86_64_mods = os.path.join(self._workDir, 'grub-inst-x86_64-efi')
> +        grub_i386_mods = os.path.join(self._workDir, 'grub-inst')
> +
> +        self.assertTrue(os.path.exists(grub_x86_64_mods))
> +        self.assertTrue(os.path.exists(grub_i386_mods))
> +
> +        new_script = ""
> +        with open(mkrescue, 'r') as filehandle:
> +            orig_script = filehandle.read()
> +            new_script = re.sub('(^prefix=)(.*)',
> +                                r'\1"%s"' %grub_x86_64_mods,
> +                                orig_script, flags=re.M)
> +            new_script = re.sub('(^libdir=)(.*)', r'\1"%s/lib"' %grub_i386_mods,
> +                                new_script, flags=re.M)
> +
> +        with open(mkrescue, 'w') as filehandle:
> +            filehandle.write(new_script)
> +
> +    def generate_bits_iso(self):
> +        """ Uses grub-mkrescue to generate a fresh bits iso with the python
> +            test scripts
> +        """
> +        bits_dir = os.path.join(self._workDir, 'bits-%d' %self._bitsVer)
> +        iso_file = os.path.join(self._workDir, 'bits-%d.iso' %self._bitsVer)
> +        mkrescue_script = os.path.join(self._workDir,
> +                                       'grub-inst-x86_64-efi', 'bin',
> +                                       'grub-mkrescue')
> +
> +        self.assertTrue(os.access(mkrescue_script,
> +                                  os.R_OK | os.W_OK | os.X_OK))
> +
> +        self.fix_mkrescue(mkrescue_script)
> +
> +        logging.info('calling grub-mkrescue to generate the biosbits iso ...')
> +
> +        try:
> +            if os.getenv('V'):
> +                subprocess.check_call([mkrescue_script, '-o',
> +                                       iso_file, bits_dir],
> +                                      stdout=subprocess.DEVNULL)
> +            else:
> +                subprocess.check_call([mkrescue_script, '-o',
> +                                       iso_file, bits_dir],
> +                                      stderr=subprocess.DEVNULL,
> +                                      stdout=subprocess.DEVNULL)
> +        except Exception as e: # pylint: disable=broad-except
> +            self.skipTest("Error while generating the bits iso. "
> +                          "Pass V=1 in the environment to get more details. "
> +                          + str(e))
> +
> +        self.assertTrue(os.access(iso_file, os.R_OK))
> +
> +        logging.info('iso file %s successfully generated.', iso_file)
> +
> +    def setUp(self):
> +        BITS_LOC = os.getenv("PYTEST_BITSLOC")
> +        if BITS_LOC:
> +            prefix = BITS_LOC
> +        else:
> +            prefix = os.path.join(os.getcwd(), 'prebuilt')
> +            if not os.path.isdir(prefix):
> +                os.mkdir(prefix, mode=0o775)
> +
> +        bits_zip_file = os.path.join(prefix, 'bits-%d.zip'
> +                                     %self._bitsVer)
> +        grub_tar_file = os.path.join(prefix,
> +                                     'bits-%d-grub.tar.gz' %self._bitsVer)
> +        # if the location of the bits binaries has been specified by the user
> +        # and they are not found in that location, skip the test.
> +        if BITS_LOC and not os.access(bits_zip_file, os.F_OK):
> +            self.skipTest("test skipped since biosbits binaries " +
> +                          "could not be found in the specified location %s." \
> +                          %BITS_LOC)
> +        if BITS_LOC and not os.access(grub_tar_file, os.F_OK):
> +            self.skipTest("test skipped since biosbits binaries " +
> +                          "could not be found in the specified location %s." \
> +                          %BITS_LOC)
> +
> +        self._workDir = tempfile.mkdtemp(prefix='acpi-bits-',
> +                                         suffix='.tmp')
> +        logging.info('working dir: %s', self._workDir)
> +
> +        localArchive = "bits-%d.zip" % self._bitsVer
> +        if not os.access(bits_zip_file, os.F_OK):
> +            logging.info("archive %s not found in %s, downloading ...",
> +                         localArchive, bits_zip_file)
> +            try:
> +                req = request.urlopen(self._bitsLoc + localArchive)
> +                with open(os.path.join(prefix, localArchive),
> +                          'wb') as archivef:
> +                    archivef.write(req.read())
> +            except Exception as e: # pylint: disable=broad-except
> +                self.skipTest("test skipped since biosbits binaries " +
> +                              "could not be obtained." + str(e))
> +        else:
> +            logging.info('using locally found %s', localArchive)

so you skip downlaod if it already exists locally. IIUC it is looking
in the CWD, which is presumably the directory the QEMU build is
performed in ?  So if dev cleans their build tree, the cache is lost ?

Avocado has a more persistent cache outside the build tree IIUC.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


