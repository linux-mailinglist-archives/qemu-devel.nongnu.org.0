Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2615750A7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 16:22:15 +0200 (CEST)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBzjJ-0003z8-Hm
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 10:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oBzgx-000193-7f
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:19:47 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oBzgu-0004mT-DO
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:19:46 -0400
Received: by mail-pf1-x432.google.com with SMTP id c3so1053403pfb.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 07:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=tmPLFep19KbGgqwLw3T2XcnALKzopanmsskhZE6QuQU=;
 b=nl8PsjsoS8o9ifN/AkWCSTjJeRGd9CgXKjfhemBgZ5oAgEgcL+2VkfaMbdZsnvh4pq
 xRGtyEXyD1QvrYnpDxTS6HQyZrjCi4boiHKBxPDDYJLDg6JLtGcGavQhnkTD351DUQpy
 AVvKNLd03vs2uiNoGwJw9y8QMnA66lb3HaqCd+N6P9sgshLnmofKUPHZwe0GO7ql3mch
 2a0dTs6halUJS8USb4DtP8pWwNmDPdkoCoO1YzUEWS2ZCZNr2tfuURbeu8rplKrxSZPU
 JCc6oLGEZt0im+kyJ2YjQmti7Ba8PHJvytERCAR1TyK577UJWt9d0Yf6x3dlT2E10+cV
 O0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=tmPLFep19KbGgqwLw3T2XcnALKzopanmsskhZE6QuQU=;
 b=lsVIt/28h5Onbj+42WEe5QrUcUb7rPkuqUn0MXP18fiT5y4Rous8A+tNn4R9XrLy9Z
 TpggXoaQvF51gpb4ogu8qA7Pi1RCW8qN5zKse0Y98Nc36XHBiZf8getBFgDIMjPpVGuW
 Vt0T72oexH1zo7/IMisd84QW26gSRywdKtRueoe3cAiZ/Qhet3LO72yA7RESIH7l/TKo
 P9eNlNxtiyo/wxm7o6i2xVpU92RBND0HJE/oA0YynOfeJWy5Kh4FlGF1Ck2DcD1Q0pXz
 r5gwyNr56UjZzzkhEx6q4gr6N/UB0gRpzUFO517DglzTjarHJpzDQz9ACSqk+t0SJqtg
 4D6A==
X-Gm-Message-State: AJIora+MxrJYfXqgjcuzS3KGl/PF31fZqooZ5xAm3d62d6j+9w16PT7W
 uBoKDGf+g6sMCCHVFP3aYHZpNw==
X-Google-Smtp-Source: AGRyM1tZ2ooL+b10EBg7coowm45nkVoOs3YIJjuuiUiwVs7kfS1bjccLNaqeiN7/IqT1pPlhgov0LA==
X-Received: by 2002:a65:6c03:0:b0:412:ac5a:bcab with SMTP id
 y3-20020a656c03000000b00412ac5abcabmr7955567pgu.7.1657808382317; 
 Thu, 14 Jul 2022 07:19:42 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.141.24])
 by smtp.googlemail.com with ESMTPSA id
 mi9-20020a17090b4b4900b001ec84b0f199sm9694245pjb.1.2022.07.14.07.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 07:19:41 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 14 Jul 2022 19:49:36 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org, thuth@redhat.com, 
 peter.maydell@linaro.org, jsnow@redhat.com, pbonzini@redhat.com, 
 imammedo@redhat.com, mst@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
In-Reply-To: <YtAitsVyHmsLRKEL@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2207141943060.2135546@anisinha-lenovo>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca> <YtAitsVyHmsLRKEL@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1274299089-1657808381=:2135546"
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x432.google.com
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1274299089-1657808381=:2135546
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 14 Jul 2022, Daniel P. Berrangé wrote:

> On Sun, Jul 10, 2022 at 10:30:10PM +0530, Ani Sinha wrote:
> > This change adds python based test environment that can be used to run pytest
> > from within a virtual environment. A bash script sets up a virtual environment
> > and then runs the python based tests from within that environment.
> > All dependent python packages are installed in the virtual environment using
> > pip python module. QEMU python test modules are also available in the environment
> > for spawning the QEMU based VMs.
> >
> > It also introduces QEMU acpi/smbios biosbits python test script which is run
> > from within the python virtual environment. When the bios bits tests are run,
> > bios bits binaries are downloaded from an external repo/location.
> > Currently, the test points to an external private github repo where the bits
> > archives are checked in.
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/pytest/acpi-bits/acpi-bits-test-venv.sh |  59 +++
> >  tests/pytest/acpi-bits/acpi-bits-test.py      | 382 ++++++++++++++++++
> >  tests/pytest/acpi-bits/meson.build            |  33 ++
> >  tests/pytest/acpi-bits/requirements.txt       |   1 +
> >  4 files changed, 475 insertions(+)
> >  create mode 100644 tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> >  create mode 100644 tests/pytest/acpi-bits/acpi-bits-test.py
> >  create mode 100644 tests/pytest/acpi-bits/meson.build
> >  create mode 100644 tests/pytest/acpi-bits/requirements.txt
> >
> > diff --git a/tests/pytest/acpi-bits/acpi-bits-test-venv.sh b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> > new file mode 100644
> > index 0000000000..186395473b
> > --- /dev/null
> > +++ b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> > @@ -0,0 +1,59 @@
> > +#!/usr/bin/env bash
> > +# Generates a python virtual environment for the test to run.
> > +# Then runs python test scripts from within that virtual environment.
> > +#
> > +# This program is free software; you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License as published by
> > +# the Free Software Foundation; either version 2 of the License, or
> > +# (at your option) any later version.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> > +# You should have received a copy of the GNU General Public License
> > +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> > +#
> > +# Author: Ani Sinha <ani@anisinha.ca>
> > +
> > +set -e
> > +
> > +MYPATH=$(realpath ${BASH_SOURCE:-$0})
> > +MYDIR=$(dirname $MYPATH)
> > +
> > +if [ -z "$PYTEST_SOURCE_ROOT" ]; then
> > +    echo -n "Please set QTEST_SOURCE_ROOT env pointing"
> > +    echo " to the root of the qemu source tree."
> > +    echo -n "This is required so that the test can find the "
> > +    echo "python modules that it needs for execution."
> > +    exit 1
> > +fi
> > +SRCDIR=$PYTEST_SOURCE_ROOT
> > +TESTSCRIPTS=("acpi-bits-test.py")
> > +PIPCMD="-m pip -q --disable-pip-version-check"
> > +# we need to save the old value of PWD before we do a change-dir later
> > +PYTEST_PWD=$PWD
> > +
> > +TESTS_PYTHON=/usr/bin/python3
> > +TESTS_VENV_REQ=requirements.txt
> > +
> > +# sadly for pip -e and -t options do not work together.
> > +# please see https://github.com/pypa/pip/issues/562
> > +cd $MYDIR
> > +
> > +$TESTS_PYTHON -m venv .
> > +$TESTS_PYTHON $PIPCMD install -e $SRCDIR/python/
> > +[ -f $TESTS_VENV_REQ ] && \
> > +    $TESTS_PYTHON $PIPCMD install -r $TESTS_VENV_REQ || exit 0
> > +
> > +# venv is activated at this point.
> > +
> > +# run the test
> > +for testscript in ${TESTSCRIPTS[@]} ; do
> > +    export PYTEST_PWD; python3 $testscript
> > +done
> > +
> > +cd $PYTEST_PWD
> > +
> > +exit 0
> > diff --git a/tests/pytest/acpi-bits/acpi-bits-test.py b/tests/pytest/acpi-bits/acpi-bits-test.py
> > new file mode 100644
> > index 0000000000..97e61eb709
> > --- /dev/null
> > +++ b/tests/pytest/acpi-bits/acpi-bits-test.py
> > @@ -0,0 +1,382 @@
> > +#!/usr/bin/env python3
> > +# group: rw quick
> > +# Exercize QEMU generated ACPI/SMBIOS tables using biosbits,
> > +# https://biosbits.org/
> > +#
> > +# This program is free software; you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License as published by
> > +# the Free Software Foundation; either version 2 of the License, or
> > +# (at your option) any later version.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> > +# You should have received a copy of the GNU General Public License
> > +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> > +#
> > +# Some parts are slightly taken from qtest.py and iotests.py
> > +#
> > +# Authors:
> > +#  Ani Sinha <ani@anisinha.ca>
> > +
> > +# pylint: disable=invalid-name
> > +
> > +"""
> > +QEMU bios tests using biosbits available at
> > +https://biosbits.org/.
> > +"""
> > +
> > +import logging
> > +import os
> > +import re
> > +import shutil
> > +import subprocess
> > +import sys
> > +import tarfile
> > +import tempfile
> > +import time
> > +import unittest
> > +from urllib import request
> > +import zipfile
> > +from typing import (
> > +    List,
> > +    Optional,
> > +    Sequence,
> > +)
> > +from tap import TAPTestRunner
> > +from qemu.machine import QEMUMachine
> > +
> > +PYTESTQEMUBIN = os.getenv('PYTEST_QEMU_BINARY')
> > +PYTEST_PWD = os.getenv('PYTEST_PWD')
> > +
> > +def get_arch():
> > +    """finds the arch from the qemu binary name"""
> > +    match = re.search('.*qemu-system-(.*)', PYTESTQEMUBIN)
> > +    if match:
> > +        return match.group(1)
> > +    return 'x86_64'
> > +
> > +ARCH = get_arch()
> > +
> > +class QEMUBitsMachine(QEMUMachine):
> > +    """
> > +    A QEMU VM, with isa-debugcon enabled and bits iso passed
> > +    using -cdrom to QEMU commandline.
> > +    """
> > +    def __init__(self,
> > +                 binary: str,
> > +                 args: Sequence[str] = (),
> > +                 wrapper: Sequence[str] = (),
> > +                 name: Optional[str] = None,
> > +                 base_temp_dir: str = "/var/tmp",
> > +                 debugcon_log: str = "debugcon-log.txt",
> > +                 debugcon_addr: str = "0x403",
> > +                 sock_dir: Optional[str] = None,
> > +                 qmp_timer: Optional[float] = None):
> > +        # pylint: disable=too-many-arguments
> > +
> > +        if name is None:
> > +            name = "qemu-bits-%d" % os.getpid()
> > +        if sock_dir is None:
> > +            sock_dir = base_temp_dir
> > +        super().__init__(binary, args, wrapper=wrapper, name=name,
> > +                         base_temp_dir=base_temp_dir,
> > +                         sock_dir=sock_dir, qmp_timer=qmp_timer)
> > +        self.debugcon_log = debugcon_log
> > +        self.debugcon_addr = debugcon_addr
> > +        self.base_temp_dir = base_temp_dir
> > +
> > +    @property
> > +    def _base_args(self) -> List[str]:
> > +        args = super()._base_args
> > +        args.extend([
> > +            '-chardev',
> > +            'file,path=%s,id=debugcon' %os.path.join(self.base_temp_dir,
> > +                                                     self.debugcon_log),
> > +            '-device',
> > +            'isa-debugcon,iobase=%s,chardev=debugcon' %self.debugcon_addr,
> > +        ])
> > +        return args
> > +
> > +    def base_args(self):
> > +        """return the base argument to QEMU binary"""
> > +        return self._base_args
> > +
> > +class AcpiBitsTest(unittest.TestCase):
> > +    """ACPI and SMBIOS tests using biosbits."""
> > +    def __init__(self, *args, **kwargs):
> > +        super().__init__(*args, **kwargs)
> > +        self._vm = None
> > +        self._workDir = None
> > +        self._bitsVer = 2100
> > +        self._bitsLoc = "https://github.com/ani-sinha/bits/raw/bits-builds/"
>
> This URL location gives a 404 - was it supposed to be poiinting to the
> bits-builds  branch ?  eg to form a URL like:
>

You are looking at a partial URL. The code completes the URL based on the
version we are using.  Append to this URL the archive name, like
bits-2100.zip or something.

eg, https://github.com/ani-sinha/bits/raw/bits-builds/bits-2100.zip

>   https://github.com/ani-sinha/bits/blob/bits-builds/bits-2100.zip?raw=true
>
> > +        self._debugcon_addr = '0x403'
> > +        self._debugcon_log = 'debugcon-log.txt'
> > +        logging.basicConfig(level=logging.INFO)
> > +
> > +    def copy_bits_config(self):
> > +        """ copies the bios bits config file into bits.
> > +        """
> > +        config_file = 'bits-cfg.txt'
> > +        qemu_bits_config_dir = os.path.join(os.getcwd(), 'bits-config')
> > +        target_config_dir = os.path.join(self._workDir,
> > +                                         'bits-%d' %self._bitsVer, 'boot')
> > +        self.assertTrue(os.path.exists(qemu_bits_config_dir))
> > +        self.assertTrue(os.path.exists(target_config_dir))
> > +        self.assertTrue(os.access(os.path.join(qemu_bits_config_dir,
> > +                                               config_file), os.R_OK))
> > +        shutil.copy2(os.path.join(qemu_bits_config_dir, config_file),
> > +                     target_config_dir)
> > +        logging.info('copied config file %s to %s',
> > +                     config_file, target_config_dir)
> > +
> > +    def copy_test_scripts(self):
> > +        """copies the python test scripts into bits. """
> > +        qemu_test_dir = os.path.join(os.getcwd(), 'bits-tests')
> > +        target_test_dir = os.path.join(self._workDir, 'bits-%d' %self._bitsVer,
> > +                                       'boot', 'python')
> > +
> > +        self.assertTrue(os.path.exists(qemu_test_dir))
> > +        self.assertTrue(os.path.exists(target_test_dir))
> > +
> > +        for filename in os.listdir(qemu_test_dir):
> > +            if os.path.isfile(os.path.join(qemu_test_dir, filename)) and \
> > +               filename.endswith('.py'):
> > +                shutil.copy2(os.path.join(qemu_test_dir, filename),
> > +                             target_test_dir)
> > +                logging.info('copied test file %s to %s',
> > +                             filename, target_test_dir)
> > +
> > +                # now remove the pyc test file if it exists, otherwise the
> > +                # changes in the python test script won't be executed.
> > +                testfile_pyc = os.path.splitext(filename)[0] + '.pyc'
> > +                if os.access(os.path.join(target_test_dir, testfile_pyc),
> > +                             os.F_OK):
> > +                    os.remove(os.path.join(target_test_dir, testfile_pyc))
> > +                    logging.info('removed compiled file %s',
> > +                                 os.path.join(target_test_dir, testfile_pyc))
> > +
> > +    def fix_mkrescue(self, mkrescue):
> > +        """ grub-mkrescue is a bash script with two variables, 'prefix' and
> > +            'libdir'. They must be pointed to the right location so that the
> > +            iso can be generated appropriately. We point the two variables to
> > +            the directory where we have extracted our pre-built bits grub
> > +            tarball.
> > +        """
> > +        grub_x86_64_mods = os.path.join(self._workDir, 'grub-inst-x86_64-efi')
> > +        grub_i386_mods = os.path.join(self._workDir, 'grub-inst')
> > +
> > +        self.assertTrue(os.path.exists(grub_x86_64_mods))
> > +        self.assertTrue(os.path.exists(grub_i386_mods))
> > +
> > +        new_script = ""
> > +        with open(mkrescue, 'r') as filehandle:
> > +            orig_script = filehandle.read()
> > +            new_script = re.sub('(^prefix=)(.*)',
> > +                                r'\1"%s"' %grub_x86_64_mods,
> > +                                orig_script, flags=re.M)
> > +            new_script = re.sub('(^libdir=)(.*)', r'\1"%s/lib"' %grub_i386_mods,
> > +                                new_script, flags=re.M)
> > +
> > +        with open(mkrescue, 'w') as filehandle:
> > +            filehandle.write(new_script)
> > +
> > +    def generate_bits_iso(self):
> > +        """ Uses grub-mkrescue to generate a fresh bits iso with the python
> > +            test scripts
> > +        """
> > +        bits_dir = os.path.join(self._workDir, 'bits-%d' %self._bitsVer)
> > +        iso_file = os.path.join(self._workDir, 'bits-%d.iso' %self._bitsVer)
> > +        mkrescue_script = os.path.join(self._workDir,
> > +                                       'grub-inst-x86_64-efi', 'bin',
> > +                                       'grub-mkrescue')
> > +
> > +        self.assertTrue(os.access(mkrescue_script,
> > +                                  os.R_OK | os.W_OK | os.X_OK))
> > +
> > +        self.fix_mkrescue(mkrescue_script)
> > +
> > +        logging.info('calling grub-mkrescue to generate the biosbits iso ...')
> > +
> > +        try:
> > +            if os.getenv('V'):
> > +                subprocess.check_call([mkrescue_script, '-o',
> > +                                       iso_file, bits_dir],
> > +                                      stdout=subprocess.DEVNULL)
> > +            else:
> > +                subprocess.check_call([mkrescue_script, '-o',
> > +                                       iso_file, bits_dir],
> > +                                      stderr=subprocess.DEVNULL,
> > +                                      stdout=subprocess.DEVNULL)
> > +        except Exception as e: # pylint: disable=broad-except
> > +            self.skipTest("Error while generating the bits iso. "
> > +                          "Pass V=1 in the environment to get more details. "
> > +                          + str(e))
> > +
> > +        self.assertTrue(os.access(iso_file, os.R_OK))
> > +
> > +        logging.info('iso file %s successfully generated.', iso_file)
> > +
> > +    def setUp(self):
> > +        BITS_LOC = os.getenv("PYTEST_BITSLOC")
> > +        if BITS_LOC:
> > +            prefix = BITS_LOC
> > +        else:
> > +            prefix = os.path.join(os.getcwd(), 'prebuilt')
> > +            if not os.path.isdir(prefix):
> > +                os.mkdir(prefix, mode=0o775)
> > +
> > +        bits_zip_file = os.path.join(prefix, 'bits-%d.zip'
> > +                                     %self._bitsVer)
> > +        grub_tar_file = os.path.join(prefix,
> > +                                     'bits-%d-grub.tar.gz' %self._bitsVer)
> > +        # if the location of the bits binaries has been specified by the user
> > +        # and they are not found in that location, skip the test.
> > +        if BITS_LOC and not os.access(bits_zip_file, os.F_OK):
> > +            self.skipTest("test skipped since biosbits binaries " +
> > +                          "could not be found in the specified location %s." \
> > +                          %BITS_LOC)
> > +        if BITS_LOC and not os.access(grub_tar_file, os.F_OK):
> > +            self.skipTest("test skipped since biosbits binaries " +
> > +                          "could not be found in the specified location %s." \
> > +                          %BITS_LOC)
> > +
> > +        self._workDir = tempfile.mkdtemp(prefix='acpi-bits-',
> > +                                         suffix='.tmp')
> > +        logging.info('working dir: %s', self._workDir)
> > +
> > +        localArchive = "bits-%d.zip" % self._bitsVer
> > +        if not os.access(bits_zip_file, os.F_OK):
> > +            logging.info("archive %s not found in %s, downloading ...",
> > +                         localArchive, bits_zip_file)
> > +            try:
> > +                req = request.urlopen(self._bitsLoc + localArchive)
> > +                with open(os.path.join(prefix, localArchive),
> > +                          'wb') as archivef:
> > +                    archivef.write(req.read())
> > +            except Exception as e: # pylint: disable=broad-except
> > +                self.skipTest("test skipped since biosbits binaries " +
> > +                              "could not be obtained." + str(e))
> > +        else:
> > +            logging.info('using locally found %s', localArchive)
>
> so you skip downlaod if it already exists locally. IIUC it is looking
> in the CWD, which is presumably the directory the QEMU build is
> performed in ?

Yes, build/test/pytest/bits-test

> So if dev cleans their build tree, the cache is lost ?

Yes.

>
> Avocado has a more persistent cache outside the build tree IIUC.
>

So that is why I have the environment variable mechanism for passing to
the test that will point to the location of the archives. The developer
can download the files there and point to the test. Or I can change the
scriprt accordingly if we know where we were downloading. We were
discussing submodules and it was fiercely hated. So mst suggested another
repo where to keep the binaries. My script that check out that repo
somewhere outside the build directory and point the test to that location.

I have kept several options open. We just need to make some decisions.


> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
>
>
--2088271309-1274299089-1657808381=:2135546--

