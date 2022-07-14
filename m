Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45C6575444
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 19:53:20 +0200 (CEST)
Received: from localhost ([::1]:57040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC31b-00058i-2N
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 13:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oC2yK-0002t0-4e
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 13:49:56 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oC2yF-00036p-UO
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 13:49:55 -0400
Received: by mail-ej1-x634.google.com with SMTP id os14so4760640ejb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 10:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LlTg6MqyZRNnGVp5MT13iZRWaQY3xwqM6SZrgTTIMco=;
 b=6FOH11f1q8SG/5B9amU07FUag6/20GX7t3s4eUW8sD+WxV6Ai/yXa0xTOIIdss9keg
 pPAyBv1uiw+rIq91iJFS2Rhjpzf3qsjoJuWVyYfuPkACF2J8Nxz2+W3XJ15q0ZHnQ4ne
 Zq64LwLiRLEz9hsBkRIi+BFb+NbgaEEkedvhmEePdcnxFpPeJkZo8niFPwyVR4F/seSo
 /XDB4GvGFJ2dyvUm3RNZoQ+vHiLzwC496LKqvv3AkTworDrCibb/Rt5hWtj1uc+tLJnk
 TgkyjIGzoU9rImp1DEPmhIwUny4VY3DMbWIp+Y6q0F1pfTrKA3zTW3R4Ypou4s6rOFTn
 Qplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LlTg6MqyZRNnGVp5MT13iZRWaQY3xwqM6SZrgTTIMco=;
 b=A7UoBVGVuuD+T5vu7VoVmewGB2wfsHukuew7E4Br6HDOJoIS9TDSc/FctReRt9rpMQ
 ht+hIhvy4Ghw64wyIhz9VzOf6RMbGegy5k1bqrSgobiX1tS+/zydIauaMSPLKkfbdDQc
 HbOkL3YVXM6BqaOLHMSy9BiO0XZcw+RR1SsRnPxslN1HtTOcvIb/GyRvdqTE3mKNXouJ
 RoNPewdwTY0Y7eEV1TseLZR/6loH3q8zhcdMLvHshJvj/gBAIHnRKmY//ufK1P4kILx3
 l67+NG1FByPtxU4o70fegSE5mxUOtIVjdvPd3LqF0Pj0fbeclxbUJCbQgNEr7XOQNarm
 NZBA==
X-Gm-Message-State: AJIora8fVyL/6P+RpKFfIi5be4ImltzbGO7XPncjlxzp0GIDNQzFnPf+
 2DO27YnMz5JYi+WrhEzrSld4lk/Zh4t3k7bFgVIsew==
X-Google-Smtp-Source: AGRyM1s9OySqhcWjhqEC10rsBGkAtW/QGPw5Sleb9vQzTvIulpPEgUz308JbIKoQgKKHZUrgpeqU1v8lUyL8ndE9Fy4=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr9878775ejc.64.1657820990112; Thu, 14
 Jul 2022 10:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <YtAitsVyHmsLRKEL@redhat.com>
 <alpine.DEB.2.22.394.2207141943060.2135546@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2207141943060.2135546@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 14 Jul 2022 23:19:39 +0530
Message-ID: <CAARzgwxX8H=DnUsZ3kRmCb_aaG4HUsPmxPT_9R1Kf+Who7pTWQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: imammedo@redhat.com, jsnow@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, thuth@redhat.com
Content-Type: multipart/alternative; boundary="00000000000037a4a405e3c787b0"
Received-SPF: none client-ip=2a00:1450:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x634.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SORTED_RECIPS=2.499,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--00000000000037a4a405e3c787b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 19:49 Ani Sinha <ani@anisinha.ca> wrote:

>
>
> On Thu, 14 Jul 2022, Daniel P. Berrang=C3=A9 wrote:
>
> > On Sun, Jul 10, 2022 at 10:30:10PM +0530, Ani Sinha wrote:
> > > This change adds python based test environment that can be used to ru=
n
> pytest
> > > from within a virtual environment. A bash script sets up a virtual
> environment
> > > and then runs the python based tests from within that environment.
> > > All dependent python packages are installed in the virtual environmen=
t
> using
> > > pip python module. QEMU python test modules are also available in the
> environment
> > > for spawning the QEMU based VMs.
> > >
> > > It also introduces QEMU acpi/smbios biosbits python test script which
> is run
> > > from within the python virtual environment. When the bios bits tests
> are run,
> > > bios bits binaries are downloaded from an external repo/location.
> > > Currently, the test points to an external private github repo where
> the bits
> > > archives are checked in.
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  tests/pytest/acpi-bits/acpi-bits-test-venv.sh |  59 +++
> > >  tests/pytest/acpi-bits/acpi-bits-test.py      | 382 ++++++++++++++++=
++
> > >  tests/pytest/acpi-bits/meson.build            |  33 ++
> > >  tests/pytest/acpi-bits/requirements.txt       |   1 +
> > >  4 files changed, 475 insertions(+)
> > >  create mode 100644 tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> > >  create mode 100644 tests/pytest/acpi-bits/acpi-bits-test.py
> > >  create mode 100644 tests/pytest/acpi-bits/meson.build
> > >  create mode 100644 tests/pytest/acpi-bits/requirements.txt
> > >
> > > diff --git a/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> > > new file mode 100644
> > > index 0000000000..186395473b
> > > --- /dev/null
> > > +++ b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> > > @@ -0,0 +1,59 @@
> > > +#!/usr/bin/env bash
> > > +# Generates a python virtual environment for the test to run.
> > > +# Then runs python test scripts from within that virtual environment=
.
> > > +#
> > > +# This program is free software; you can redistribute it and/or modi=
fy
> > > +# it under the terms of the GNU General Public License as published =
by
> > > +# the Free Software Foundation; either version 2 of the License, or
> > > +# (at your option) any later version.
> > > +#
> > > +# This program is distributed in the hope that it will be useful,
> > > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > +# GNU General Public License for more details.
> > > +#
> > > +# You should have received a copy of the GNU General Public License
> > > +# along with this program.  If not, see <http://www.gnu.org/licenses=
/
> >.
> > > +#
> > > +# Author: Ani Sinha <ani@anisinha.ca>
> > > +
> > > +set -e
> > > +
> > > +MYPATH=3D$(realpath ${BASH_SOURCE:-$0})
> > > +MYDIR=3D$(dirname $MYPATH)
> > > +
> > > +if [ -z "$PYTEST_SOURCE_ROOT" ]; then
> > > +    echo -n "Please set QTEST_SOURCE_ROOT env pointing"
> > > +    echo " to the root of the qemu source tree."
> > > +    echo -n "This is required so that the test can find the "
> > > +    echo "python modules that it needs for execution."
> > > +    exit 1
> > > +fi
> > > +SRCDIR=3D$PYTEST_SOURCE_ROOT
> > > +TESTSCRIPTS=3D("acpi-bits-test.py")
> > > +PIPCMD=3D"-m pip -q --disable-pip-version-check"
> > > +# we need to save the old value of PWD before we do a change-dir lat=
er
> > > +PYTEST_PWD=3D$PWD
> > > +
> > > +TESTS_PYTHON=3D/usr/bin/python3
> > > +TESTS_VENV_REQ=3Drequirements.txt
> > > +
> > > +# sadly for pip -e and -t options do not work together.
> > > +# please see https://github.com/pypa/pip/issues/562
> > > +cd $MYDIR
> > > +
> > > +$TESTS_PYTHON -m venv .
> > > +$TESTS_PYTHON $PIPCMD install -e $SRCDIR/python/
> > > +[ -f $TESTS_VENV_REQ ] && \
> > > +    $TESTS_PYTHON $PIPCMD install -r $TESTS_VENV_REQ || exit 0
> > > +
> > > +# venv is activated at this point.
> > > +
> > > +# run the test
> > > +for testscript in ${TESTSCRIPTS[@]} ; do
> > > +    export PYTEST_PWD; python3 $testscript
> > > +done
> > > +
> > > +cd $PYTEST_PWD
> > > +
> > > +exit 0
> > > diff --git a/tests/pytest/acpi-bits/acpi-bits-test.py
> b/tests/pytest/acpi-bits/acpi-bits-test.py
> > > new file mode 100644
> > > index 0000000000..97e61eb709
> > > --- /dev/null
> > > +++ b/tests/pytest/acpi-bits/acpi-bits-test.py
> > > @@ -0,0 +1,382 @@
> > > +#!/usr/bin/env python3
> > > +# group: rw quick
> > > +# Exercize QEMU generated ACPI/SMBIOS tables using biosbits,
> > > +# https://biosbits.org/
> > > +#
> > > +# This program is free software; you can redistribute it and/or modi=
fy
> > > +# it under the terms of the GNU General Public License as published =
by
> > > +# the Free Software Foundation; either version 2 of the License, or
> > > +# (at your option) any later version.
> > > +#
> > > +# This program is distributed in the hope that it will be useful,
> > > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > +# GNU General Public License for more details.
> > > +#
> > > +# You should have received a copy of the GNU General Public License
> > > +# along with this program.  If not, see <http://www.gnu.org/licenses=
/
> >.
> > > +#
> > > +# Some parts are slightly taken from qtest.py and iotests.py
> > > +#
> > > +# Authors:
> > > +#  Ani Sinha <ani@anisinha.ca>
> > > +
> > > +# pylint: disable=3Dinvalid-name
> > > +
> > > +"""
> > > +QEMU bios tests using biosbits available at
> > > +https://biosbits.org/.
> > > +"""
> > > +
> > > +import logging
> > > +import os
> > > +import re
> > > +import shutil
> > > +import subprocess
> > > +import sys
> > > +import tarfile
> > > +import tempfile
> > > +import time
> > > +import unittest
> > > +from urllib import request
> > > +import zipfile
> > > +from typing import (
> > > +    List,
> > > +    Optional,
> > > +    Sequence,
> > > +)
> > > +from tap import TAPTestRunner
> > > +from qemu.machine import QEMUMachine
> > > +
> > > +PYTESTQEMUBIN =3D os.getenv('PYTEST_QEMU_BINARY')
> > > +PYTEST_PWD =3D os.getenv('PYTEST_PWD')
> > > +
> > > +def get_arch():
> > > +    """finds the arch from the qemu binary name"""
> > > +    match =3D re.search('.*qemu-system-(.*)', PYTESTQEMUBIN)
> > > +    if match:
> > > +        return match.group(1)
> > > +    return 'x86_64'
> > > +
> > > +ARCH =3D get_arch()
> > > +
> > > +class QEMUBitsMachine(QEMUMachine):
> > > +    """
> > > +    A QEMU VM, with isa-debugcon enabled and bits iso passed
> > > +    using -cdrom to QEMU commandline.
> > > +    """
> > > +    def __init__(self,
> > > +                 binary: str,
> > > +                 args: Sequence[str] =3D (),
> > > +                 wrapper: Sequence[str] =3D (),
> > > +                 name: Optional[str] =3D None,
> > > +                 base_temp_dir: str =3D "/var/tmp",
> > > +                 debugcon_log: str =3D "debugcon-log.txt",
> > > +                 debugcon_addr: str =3D "0x403",
> > > +                 sock_dir: Optional[str] =3D None,
> > > +                 qmp_timer: Optional[float] =3D None):
> > > +        # pylint: disable=3Dtoo-many-arguments
> > > +
> > > +        if name is None:
> > > +            name =3D "qemu-bits-%d" % os.getpid()
> > > +        if sock_dir is None:
> > > +            sock_dir =3D base_temp_dir
> > > +        super().__init__(binary, args, wrapper=3Dwrapper, name=3Dnam=
e,
> > > +                         base_temp_dir=3Dbase_temp_dir,
> > > +                         sock_dir=3Dsock_dir, qmp_timer=3Dqmp_timer)
> > > +        self.debugcon_log =3D debugcon_log
> > > +        self.debugcon_addr =3D debugcon_addr
> > > +        self.base_temp_dir =3D base_temp_dir
> > > +
> > > +    @property
> > > +    def _base_args(self) -> List[str]:
> > > +        args =3D super()._base_args
> > > +        args.extend([
> > > +            '-chardev',
> > > +            'file,path=3D%s,id=3Ddebugcon'
> %os.path.join(self.base_temp_dir,
> > > +
>  self.debugcon_log),
> > > +            '-device',
> > > +            'isa-debugcon,iobase=3D%s,chardev=3Ddebugcon'
> %self.debugcon_addr,
> > > +        ])
> > > +        return args
> > > +
> > > +    def base_args(self):
> > > +        """return the base argument to QEMU binary"""
> > > +        return self._base_args
> > > +
> > > +class AcpiBitsTest(unittest.TestCase):
> > > +    """ACPI and SMBIOS tests using biosbits."""
> > > +    def __init__(self, *args, **kwargs):
> > > +        super().__init__(*args, **kwargs)
> > > +        self._vm =3D None
> > > +        self._workDir =3D None
> > > +        self._bitsVer =3D 2100
> > > +        self._bitsLoc =3D "
> https://github.com/ani-sinha/bits/raw/bits-builds/"
> >
> > This URL location gives a 404 - was it supposed to be poiinting to the
> > bits-builds  branch ?  eg to form a URL like:
> >
>
> You are looking at a partial URL. The code completes the URL based on the
> version we are using.  Append to this URL the archive name, like
> bits-2100.zip or something.
>
> eg, https://github.com/ani-sinha/bits/raw/bits-builds/bits-2100.zip
>
> >
> https://github.com/ani-sinha/bits/blob/bits-builds/bits-2100.zip?raw=3Dtr=
ue
> >
> > > +        self._debugcon_addr =3D '0x403'
> > > +        self._debugcon_log =3D 'debugcon-log.txt'
> > > +        logging.basicConfig(level=3Dlogging.INFO)
> > > +
> > > +    def copy_bits_config(self):
> > > +        """ copies the bios bits config file into bits.
> > > +        """
> > > +        config_file =3D 'bits-cfg.txt'
> > > +        qemu_bits_config_dir =3D os.path.join(os.getcwd(),
> 'bits-config')
> > > +        target_config_dir =3D os.path.join(self._workDir,
> > > +                                         'bits-%d' %self._bitsVer,
> 'boot')
> > > +        self.assertTrue(os.path.exists(qemu_bits_config_dir))
> > > +        self.assertTrue(os.path.exists(target_config_dir))
> > > +        self.assertTrue(os.access(os.path.join(qemu_bits_config_dir,
> > > +                                               config_file), os.R_OK=
))
> > > +        shutil.copy2(os.path.join(qemu_bits_config_dir, config_file)=
,
> > > +                     target_config_dir)
> > > +        logging.info('copied config file %s to %s',
> > > +                     config_file, target_config_dir)
> > > +
> > > +    def copy_test_scripts(self):
> > > +        """copies the python test scripts into bits. """
> > > +        qemu_test_dir =3D os.path.join(os.getcwd(), 'bits-tests')
> > > +        target_test_dir =3D os.path.join(self._workDir, 'bits-%d'
> %self._bitsVer,
> > > +                                       'boot', 'python')
> > > +
> > > +        self.assertTrue(os.path.exists(qemu_test_dir))
> > > +        self.assertTrue(os.path.exists(target_test_dir))
> > > +
> > > +        for filename in os.listdir(qemu_test_dir):
> > > +            if os.path.isfile(os.path.join(qemu_test_dir, filename))
> and \
> > > +               filename.endswith('.py'):
> > > +                shutil.copy2(os.path.join(qemu_test_dir, filename),
> > > +                             target_test_dir)
> > > +                logging.info('copied test file %s to %s',
> > > +                             filename, target_test_dir)
> > > +
> > > +                # now remove the pyc test file if it exists,
> otherwise the
> > > +                # changes in the python test script won't be execute=
d.
> > > +                testfile_pyc =3D os.path.splitext(filename)[0] + '.p=
yc'
> > > +                if os.access(os.path.join(target_test_dir,
> testfile_pyc),
> > > +                             os.F_OK):
> > > +                    os.remove(os.path.join(target_test_dir,
> testfile_pyc))
> > > +                    logging.info('removed compiled file %s',
> > > +                                 os.path.join(target_test_dir,
> testfile_pyc))
> > > +
> > > +    def fix_mkrescue(self, mkrescue):
> > > +        """ grub-mkrescue is a bash script with two variables,
> 'prefix' and
> > > +            'libdir'. They must be pointed to the right location so
> that the
> > > +            iso can be generated appropriately. We point the two
> variables to
> > > +            the directory where we have extracted our pre-built bits
> grub
> > > +            tarball.
> > > +        """
> > > +        grub_x86_64_mods =3D os.path.join(self._workDir,
> 'grub-inst-x86_64-efi')
> > > +        grub_i386_mods =3D os.path.join(self._workDir, 'grub-inst')
> > > +
> > > +        self.assertTrue(os.path.exists(grub_x86_64_mods))
> > > +        self.assertTrue(os.path.exists(grub_i386_mods))
> > > +
> > > +        new_script =3D ""
> > > +        with open(mkrescue, 'r') as filehandle:
> > > +            orig_script =3D filehandle.read()
> > > +            new_script =3D re.sub('(^prefix=3D)(.*)',
> > > +                                r'\1"%s"' %grub_x86_64_mods,
> > > +                                orig_script, flags=3Dre.M)
> > > +            new_script =3D re.sub('(^libdir=3D)(.*)', r'\1"%s/lib"'
> %grub_i386_mods,
> > > +                                new_script, flags=3Dre.M)
> > > +
> > > +        with open(mkrescue, 'w') as filehandle:
> > > +            filehandle.write(new_script)
> > > +
> > > +    def generate_bits_iso(self):
> > > +        """ Uses grub-mkrescue to generate a fresh bits iso with the
> python
> > > +            test scripts
> > > +        """
> > > +        bits_dir =3D os.path.join(self._workDir, 'bits-%d'
> %self._bitsVer)
> > > +        iso_file =3D os.path.join(self._workDir, 'bits-%d.iso'
> %self._bitsVer)
> > > +        mkrescue_script =3D os.path.join(self._workDir,
> > > +                                       'grub-inst-x86_64-efi', 'bin'=
,
> > > +                                       'grub-mkrescue')
> > > +
> > > +        self.assertTrue(os.access(mkrescue_script,
> > > +                                  os.R_OK | os.W_OK | os.X_OK))
> > > +
> > > +        self.fix_mkrescue(mkrescue_script)
> > > +
> > > +        logging.info('calling grub-mkrescue to generate the biosbits
> iso ...')
> > > +
> > > +        try:
> > > +            if os.getenv('V'):
> > > +                subprocess.check_call([mkrescue_script, '-o',
> > > +                                       iso_file, bits_dir],
> > > +                                      stdout=3Dsubprocess.DEVNULL)
> > > +            else:
> > > +                subprocess.check_call([mkrescue_script, '-o',
> > > +                                       iso_file, bits_dir],
> > > +                                      stderr=3Dsubprocess.DEVNULL,
> > > +                                      stdout=3Dsubprocess.DEVNULL)
> > > +        except Exception as e: # pylint: disable=3Dbroad-except
> > > +            self.skipTest("Error while generating the bits iso. "
> > > +                          "Pass V=3D1 in the environment to get more
> details. "
> > > +                          + str(e))
> > > +
> > > +        self.assertTrue(os.access(iso_file, os.R_OK))
> > > +
> > > +        logging.info('iso file %s successfully generated.', iso_file=
)
> > > +
> > > +    def setUp(self):
> > > +        BITS_LOC =3D os.getenv("PYTEST_BITSLOC")
> > > +        if BITS_LOC:
> > > +            prefix =3D BITS_LOC
> > > +        else:
> > > +            prefix =3D os.path.join(os.getcwd(), 'prebuilt')
> > > +            if not os.path.isdir(prefix):
> > > +                os.mkdir(prefix, mode=3D0o775)
> > > +
> > > +        bits_zip_file =3D os.path.join(prefix, 'bits-%d.zip'
> > > +                                     %self._bitsVer)
> > > +        grub_tar_file =3D os.path.join(prefix,
> > > +                                     'bits-%d-grub.tar.gz'
> %self._bitsVer)
> > > +        # if the location of the bits binaries has been specified by
> the user
> > > +        # and they are not found in that location, skip the test.
> > > +        if BITS_LOC and not os.access(bits_zip_file, os.F_OK):
> > > +            self.skipTest("test skipped since biosbits binaries " +
> > > +                          "could not be found in the specified
> location %s." \
> > > +                          %BITS_LOC)
> > > +        if BITS_LOC and not os.access(grub_tar_file, os.F_OK):
> > > +            self.skipTest("test skipped since biosbits binaries " +
> > > +                          "could not be found in the specified
> location %s." \
> > > +                          %BITS_LOC)
> > > +
> > > +        self._workDir =3D tempfile.mkdtemp(prefix=3D'acpi-bits-',
> > > +                                         suffix=3D'.tmp')
> > > +        logging.info('working dir: %s', self._workDir)
> > > +
> > > +        localArchive =3D "bits-%d.zip" % self._bitsVer
> > > +        if not os.access(bits_zip_file, os.F_OK):
> > > +            logging.info("archive %s not found in %s, downloading
> ...",
> > > +                         localArchive, bits_zip_file)
> > > +            try:
> > > +                req =3D request.urlopen(self._bitsLoc + localArchive=
)
> > > +                with open(os.path.join(prefix, localArchive),
> > > +                          'wb') as archivef:
> > > +                    archivef.write(req.read())
> > > +            except Exception as e: # pylint: disable=3Dbroad-except
> > > +                self.skipTest("test skipped since biosbits binaries =
"
> +
> > > +                              "could not be obtained." + str(e))
> > > +        else:
> > > +            logging.info('using locally found %s', localArchive)
> >
> > so you skip downlaod if it already exists locally. IIUC it is looking
> > in the CWD, which is presumably the directory the QEMU build is
> > performed in ?
>
> Yes, build/test/pytest/bits-test
>
> > So if dev cleans their build tree, the cache is lost ?
>
> Yes.
>
> >
> > Avocado has a more persistent cache outside the build tree IIUC.


To be honest I=E2=80=99m not sure if I like that. If I clear out my build d=
irectory
I would want all build related artifacts to go away, including downloaded
build stuff from the cache.


> >
>
> So that is why I have the environment variable mechanism for passing to
> the test that will point to the location of the archives. The developer
> can download the files there and point to the test. Or I can change the
> scriprt accordingly if we know where we were downloading. We were
> discussing submodules and it was fiercely hated. So mst suggested another
> repo where to keep the binaries. My script that check out that repo
> somewhere outside the build directory and point the test to that location=
.
>
> I have kept several options open. We just need to make some decisions.
>
>
> > With regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
> >
> >

--00000000000037a4a405e3c787b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jul 14, 2022 at 19:49 Ani Sinha &lt;<a href=3D"mail=
to:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
"><br>
<br>
On Thu, 14 Jul 2022, Daniel P. Berrang=C3=A9 wrote:<br>
<br>
&gt; On Sun, Jul 10, 2022 at 10:30:10PM +0530, Ani Sinha wrote:<br>
&gt; &gt; This change adds python based test environment that can be used t=
o run pytest<br>
&gt; &gt; from within a virtual environment. A bash script sets up a virtua=
l environment<br>
&gt; &gt; and then runs the python based tests from within that environment=
.<br>
&gt; &gt; All dependent python packages are installed in the virtual enviro=
nment using<br>
&gt; &gt; pip python module. QEMU python test modules are also available in=
 the environment<br>
&gt; &gt; for spawning the QEMU based VMs.<br>
&gt; &gt;<br>
&gt; &gt; It also introduces QEMU acpi/smbios biosbits python test script w=
hich is run<br>
&gt; &gt; from within the python virtual environment. When the bios bits te=
sts are run,<br>
&gt; &gt; bios bits binaries are downloaded from an external repo/location.=
<br>
&gt; &gt; Currently, the test points to an external private github repo whe=
re the bits<br>
&gt; &gt; archives are checked in.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" t=
arget=3D"_blank">ani@anisinha.ca</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 tests/pytest/acpi-bits/acpi-bits-test-venv.sh |=C2=A0 59 ++=
+<br>
&gt; &gt;=C2=A0 tests/pytest/acpi-bits/acpi-bits-test.py=C2=A0 =C2=A0 =C2=
=A0 | 382 ++++++++++++++++++<br>
&gt; &gt;=C2=A0 tests/pytest/acpi-bits/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 33 ++<br>
&gt; &gt;=C2=A0 tests/pytest/acpi-bits/requirements.txt=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 4 files changed, 475 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/acpi-bits-test-ve=
nv.sh<br>
&gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/acpi-bits-test.py=
<br>
&gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/meson.build<br>
&gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/requirements.txt<=
br>
&gt; &gt;<br>
&gt; &gt; diff --git a/tests/pytest/acpi-bits/acpi-bits-test-venv.sh b/test=
s/pytest/acpi-bits/acpi-bits-test-venv.sh<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..186395473b<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh<br>
&gt; &gt; @@ -0,0 +1,59 @@<br>
&gt; &gt; +#!/usr/bin/env bash<br>
&gt; &gt; +# Generates a python virtual environment for the test to run.<br=
>
&gt; &gt; +# Then runs python test scripts from within that virtual environ=
ment.<br>
&gt; &gt; +#<br>
&gt; &gt; +# This program is free software; you can redistribute it and/or =
modify<br>
&gt; &gt; +# it under the terms of the GNU General Public License as publis=
hed by<br>
&gt; &gt; +# the Free Software Foundation; either version 2 of the License,=
 or<br>
&gt; &gt; +# (at your option) any later version.<br>
&gt; &gt; +#<br>
&gt; &gt; +# This program is distributed in the hope that it will be useful=
,<br>
&gt; &gt; +# but WITHOUT ANY WARRANTY; without even the implied warranty of=
<br>
&gt; &gt; +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See=
 the<br>
&gt; &gt; +# GNU General Public License for more details.<br>
&gt; &gt; +#<br>
&gt; &gt; +# You should have received a copy of the GNU General Public Lice=
nse<br>
&gt; &gt; +# along with this program.=C2=A0 If not, see &lt;<a href=3D"http=
://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.g=
nu.org/licenses/</a>&gt;.<br>
&gt; &gt; +#<br>
&gt; &gt; +# Author: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" targe=
t=3D"_blank">ani@anisinha.ca</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +set -e<br>
&gt; &gt; +<br>
&gt; &gt; +MYPATH=3D$(realpath ${BASH_SOURCE:-$0})<br>
&gt; &gt; +MYDIR=3D$(dirname $MYPATH)<br>
&gt; &gt; +<br>
&gt; &gt; +if [ -z &quot;$PYTEST_SOURCE_ROOT&quot; ]; then<br>
&gt; &gt; +=C2=A0 =C2=A0 echo -n &quot;Please set QTEST_SOURCE_ROOT env poi=
nting&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 echo &quot; to the root of the qemu source tree.&q=
uot;<br>
&gt; &gt; +=C2=A0 =C2=A0 echo -n &quot;This is required so that the test ca=
n find the &quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 echo &quot;python modules that it needs for execut=
ion.&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 exit 1<br>
&gt; &gt; +fi<br>
&gt; &gt; +SRCDIR=3D$PYTEST_SOURCE_ROOT<br>
&gt; &gt; +TESTSCRIPTS=3D(&quot;acpi-bits-test.py&quot;)<br>
&gt; &gt; +PIPCMD=3D&quot;-m pip -q --disable-pip-version-check&quot;<br>
&gt; &gt; +# we need to save the old value of PWD before we do a change-dir=
 later<br>
&gt; &gt; +PYTEST_PWD=3D$PWD<br>
&gt; &gt; +<br>
&gt; &gt; +TESTS_PYTHON=3D/usr/bin/python3<br>
&gt; &gt; +TESTS_VENV_REQ=3Drequirements.txt<br>
&gt; &gt; +<br>
&gt; &gt; +# sadly for pip -e and -t options do not work together.<br>
&gt; &gt; +# please see <a href=3D"https://github.com/pypa/pip/issues/562" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/pypa/pip/issues/562=
</a><br>
&gt; &gt; +cd $MYDIR<br>
&gt; &gt; +<br>
&gt; &gt; +$TESTS_PYTHON -m venv .<br>
&gt; &gt; +$TESTS_PYTHON $PIPCMD install -e $SRCDIR/python/<br>
&gt; &gt; +[ -f $TESTS_VENV_REQ ] &amp;&amp; \<br>
&gt; &gt; +=C2=A0 =C2=A0 $TESTS_PYTHON $PIPCMD install -r $TESTS_VENV_REQ |=
| exit 0<br>
&gt; &gt; +<br>
&gt; &gt; +# venv is activated at this point.<br>
&gt; &gt; +<br>
&gt; &gt; +# run the test<br>
&gt; &gt; +for testscript in ${TESTSCRIPTS[@]} ; do<br>
&gt; &gt; +=C2=A0 =C2=A0 export PYTEST_PWD; python3 $testscript<br>
&gt; &gt; +done<br>
&gt; &gt; +<br>
&gt; &gt; +cd $PYTEST_PWD<br>
&gt; &gt; +<br>
&gt; &gt; +exit 0<br>
&gt; &gt; diff --git a/tests/pytest/acpi-bits/acpi-bits-test.py b/tests/pyt=
est/acpi-bits/acpi-bits-test.py<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..97e61eb709<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/tests/pytest/acpi-bits/acpi-bits-test.py<br>
&gt; &gt; @@ -0,0 +1,382 @@<br>
&gt; &gt; +#!/usr/bin/env python3<br>
&gt; &gt; +# group: rw quick<br>
&gt; &gt; +# Exercize QEMU generated ACPI/SMBIOS tables using biosbits,<br>
&gt; &gt; +# <a href=3D"https://biosbits.org/" rel=3D"noreferrer" target=3D=
"_blank">https://biosbits.org/</a><br>
&gt; &gt; +#<br>
&gt; &gt; +# This program is free software; you can redistribute it and/or =
modify<br>
&gt; &gt; +# it under the terms of the GNU General Public License as publis=
hed by<br>
&gt; &gt; +# the Free Software Foundation; either version 2 of the License,=
 or<br>
&gt; &gt; +# (at your option) any later version.<br>
&gt; &gt; +#<br>
&gt; &gt; +# This program is distributed in the hope that it will be useful=
,<br>
&gt; &gt; +# but WITHOUT ANY WARRANTY; without even the implied warranty of=
<br>
&gt; &gt; +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See=
 the<br>
&gt; &gt; +# GNU General Public License for more details.<br>
&gt; &gt; +#<br>
&gt; &gt; +# You should have received a copy of the GNU General Public Lice=
nse<br>
&gt; &gt; +# along with this program.=C2=A0 If not, see &lt;<a href=3D"http=
://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.g=
nu.org/licenses/</a>&gt;.<br>
&gt; &gt; +#<br>
&gt; &gt; +# Some parts are slightly taken from qtest.py and iotests.py<br>
&gt; &gt; +#<br>
&gt; &gt; +# Authors:<br>
&gt; &gt; +#=C2=A0 Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=
=3D"_blank">ani@anisinha.ca</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +# pylint: disable=3Dinvalid-name<br>
&gt; &gt; +<br>
&gt; &gt; +&quot;&quot;&quot;<br>
&gt; &gt; +QEMU bios tests using biosbits available at<br>
&gt; &gt; +<a href=3D"https://biosbits.org/" rel=3D"noreferrer" target=3D"_=
blank">https://biosbits.org/</a>.<br>
&gt; &gt; +&quot;&quot;&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +import logging<br>
&gt; &gt; +import os<br>
&gt; &gt; +import re<br>
&gt; &gt; +import shutil<br>
&gt; &gt; +import subprocess<br>
&gt; &gt; +import sys<br>
&gt; &gt; +import tarfile<br>
&gt; &gt; +import tempfile<br>
&gt; &gt; +import time<br>
&gt; &gt; +import unittest<br>
&gt; &gt; +from urllib import request<br>
&gt; &gt; +import zipfile<br>
&gt; &gt; +from typing import (<br>
&gt; &gt; +=C2=A0 =C2=A0 List,<br>
&gt; &gt; +=C2=A0 =C2=A0 Optional,<br>
&gt; &gt; +=C2=A0 =C2=A0 Sequence,<br>
&gt; &gt; +)<br>
&gt; &gt; +from tap import TAPTestRunner<br>
&gt; &gt; +from qemu.machine import QEMUMachine<br>
&gt; &gt; +<br>
&gt; &gt; +PYTESTQEMUBIN =3D os.getenv(&#39;PYTEST_QEMU_BINARY&#39;)<br>
&gt; &gt; +PYTEST_PWD =3D os.getenv(&#39;PYTEST_PWD&#39;)<br>
&gt; &gt; +<br>
&gt; &gt; +def get_arch():<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;finds the arch from the qemu bin=
ary name&quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 match =3D re.search(&#39;.*qemu-system-(.*)&#39;, =
PYTESTQEMUBIN)<br>
&gt; &gt; +=C2=A0 =C2=A0 if match:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return match.group(1)<br>
&gt; &gt; +=C2=A0 =C2=A0 return &#39;x86_64&#39;<br>
&gt; &gt; +<br>
&gt; &gt; +ARCH =3D get_arch()<br>
&gt; &gt; +<br>
&gt; &gt; +class QEMUBitsMachine(QEMUMachine):<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 A QEMU VM, with isa-debugcon enabled and bits iso =
passed<br>
&gt; &gt; +=C2=A0 =C2=A0 using -cdrom to QEMU commandline.<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 def __init__(self,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bi=
nary: str,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ar=
gs: Sequence[str] =3D (),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wr=
apper: Sequence[str] =3D (),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
me: Optional[str] =3D None,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ba=
se_temp_dir: str =3D &quot;/var/tmp&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0de=
bugcon_log: str =3D &quot;debugcon-log.txt&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0de=
bugcon_addr: str =3D &quot;0x403&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0so=
ck_dir: Optional[str] =3D None,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qm=
p_timer: Optional[float] =3D None):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # pylint: disable=3Dtoo-many-argumen=
ts<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if name is None:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &quot;qemu-bi=
ts-%d&quot; % os.getpid()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sock_dir is None:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock_dir =3D base_temp=
_dir<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(binary, args, wrapp=
er=3Dwrapper, name=3Dname,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0base_temp_dir=3Dbase_temp_dir,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0sock_dir=3Dsock_dir, qmp_timer=3Dqmp_timer)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.debugcon_log =3D debugcon_log<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.debugcon_addr =3D debugcon_addr=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.base_temp_dir =3D base_temp_dir=
<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 @property<br>
&gt; &gt; +=C2=A0 =C2=A0 def _base_args(self) -&gt; List[str]:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 args =3D super()._base_args<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 args.extend([<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-chardev&#39;,<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;file,path=3D%s,id=
=3Ddebugcon&#39; %os.path.join(self.base_temp_dir,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.debugcon_log),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-device&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;isa-debugcon,ioba=
se=3D%s,chardev=3Ddebugcon&#39; %self.debugcon_addr,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return args<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 def base_args(self):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;return the base ar=
gument to QEMU binary&quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._base_args<br>
&gt; &gt; +<br>
&gt; &gt; +class AcpiBitsTest(unittest.TestCase):<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;ACPI and SMBIOS tests using bios=
bits.&quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 def __init__(self, *args, **kwargs):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(*args, **kwargs)<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm =3D None<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._workDir =3D None<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._bitsVer =3D 2100<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._bitsLoc =3D &quot;<a href=3D"h=
ttps://github.com/ani-sinha/bits/raw/bits-builds/" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/ani-sinha/bits/raw/bits-builds/</a>&quot;<b=
r>
&gt;<br>
&gt; This URL location gives a 404 - was it supposed to be poiinting to the=
<br>
&gt; bits-builds=C2=A0 branch ?=C2=A0 eg to form a URL like:<br>
&gt;<br>
<br>
You are looking at a partial URL. The code completes the URL based on the<b=
r>
version we are using.=C2=A0 Append to this URL the archive name, like<br>
bits-2100.zip or something.<br>
<br>
eg, <a href=3D"https://github.com/ani-sinha/bits/raw/bits-builds/bits-2100.=
zip" rel=3D"noreferrer" target=3D"_blank">https://github.com/ani-sinha/bits=
/raw/bits-builds/bits-2100.zip</a><br>
<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/ani-sinha/bits/blob/bits-bui=
lds/bits-2100.zip?raw=3Dtrue" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/ani-sinha/bits/blob/bits-builds/bits-2100.zip?raw=3Dtrue</a><br>
&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._debugcon_addr =3D &#39;0x403&#=
39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._debugcon_log =3D &#39;debugcon=
-log.txt&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.basicConfig(level=3Dlogging.=
INFO)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 def copy_bits_config(self):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot; copies the bios b=
its config file into bits.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 config_file =3D &#39;bits-cfg.txt&#3=
9;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_bits_config_dir =3D os.path.joi=
n(os.getcwd(), &#39;bits-config&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_config_dir =3D os.path.join(s=
elf._workDir,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;bits-%d&#39; %self._bitsVer, &#39;boot&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(qemu_=
bits_config_dir))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(targe=
t_config_dir))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.access(os.path.jo=
in(qemu_bits_config_dir,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_file), os.R_OK))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(os.path.join(qemu_bits_=
config_dir, config_file),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0target_config_dir)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=
=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;copied config file =
%s to %s&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0config_file, target_config_dir)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 def copy_test_scripts(self):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;copies the python =
test scripts into bits. &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_test_dir =3D os.path.join(os.ge=
tcwd(), &#39;bits-tests&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_test_dir =3D os.path.join(sel=
f._workDir, &#39;bits-%d&#39; %self._bitsVer,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;boot&#39;, &#39;python&#39;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(qemu_=
test_dir))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(targe=
t_test_dir))<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for filename in os.listdir(qemu_test=
_dir):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(os.p=
ath.join(qemu_test_dir, filename)) and \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename.=
endswith(&#39;.py&#39;):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.c=
opy2(os.path.join(qemu_test_dir, filename),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_test_dir)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://logging.info" rel=3D"noreferrer" target=3D"_blank">logging.info<=
/a>(&#39;copied test file %s to %s&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename, target_test_dir)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # now re=
move the pyc test file if it exists, otherwise the<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # change=
s in the python test script won&#39;t be executed.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 testfile=
_pyc =3D os.path.splitext(filename)[0] + &#39;.pyc&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.ac=
cess(os.path.join(target_test_dir, testfile_pyc),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.F_OK):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.remove(os.path.join(target_test_dir, testfile_pyc))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <a href=3D"http://logging.info" rel=3D"noreferrer" target=3D"_blank"=
>logging.info</a>(&#39;removed compiled file %s&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.path.join(target_=
test_dir, testfile_pyc))<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 def fix_mkrescue(self, mkrescue):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot; grub-mkrescue is =
a bash script with two variables, &#39;prefix&#39; and<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;libdir&#39;. They=
 must be pointed to the right location so that the<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iso can be generated a=
ppropriately. We point the two variables to<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the directory where we=
 have extracted our pre-built bits grub<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tarball.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_x86_64_mods =3D os.path.join(se=
lf._workDir, &#39;grub-inst-x86_64-efi&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_i386_mods =3D os.path.join(self=
._workDir, &#39;grub-inst&#39;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(grub_=
x86_64_mods))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(grub_=
i386_mods))<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_script =3D &quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(mkrescue, &#39;r&#39;) as =
filehandle:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_script =3D fileha=
ndle.read()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_script =3D re.sub(=
&#39;(^prefix=3D)(.*)&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r&#39;\1&quot;%s&quot;&#39=
; %grub_x86_64_mods,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_script, flags=3Dre.M)=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_script =3D re.sub(=
&#39;(^libdir=3D)(.*)&#39;, r&#39;\1&quot;%s/lib&quot;&#39; %grub_i386_mods=
,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_script, flags=3Dre.M)<=
br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(mkrescue, &#39;w&#39;) as =
filehandle:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filehandle.write(new_s=
cript)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 def generate_bits_iso(self):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot; Uses grub-mkrescu=
e to generate a fresh bits iso with the python<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test scripts<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bits_dir =3D os.path.join(self._work=
Dir, &#39;bits-%d&#39; %self._bitsVer)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iso_file =3D os.path.join(self._work=
Dir, &#39;bits-%d.iso&#39; %self._bitsVer)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkrescue_script =3D os.path.join(sel=
f._workDir,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;grub-inst-x86_64-efi&#39;, &#39;bin&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;grub-mkrescue&#39;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.access(mkrescue_s=
cript,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.R_OK | os.W_OK |=
 os.X_OK))<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fix_mkrescue(mkrescue_script)<b=
r>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=
=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;calling grub-mkresc=
ue to generate the biosbits iso ...&#39;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.getenv(&#39;V&#3=
9;):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subproce=
ss.check_call([mkrescue_script, &#39;-o&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0iso_file, bits_dir],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdou=
t=3Dsubprocess.DEVNULL)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subproce=
ss.check_call([mkrescue_script, &#39;-o&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0iso_file, bits_dir],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stder=
r=3Dsubprocess.DEVNULL,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdou=
t=3Dsubprocess.DEVNULL)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e: # pylint: dis=
able=3Dbroad-except<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&quot;Er=
ror while generating the bits iso. &quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Pass V=3D1 in the environment to get more=
 details. &quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + str(e))<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.access(iso_file, =
os.R_OK))<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=
=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;iso file %s success=
fully generated.&#39;, iso_file)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 def setUp(self):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BITS_LOC =3D os.getenv(&quot;PYTEST_=
BITSLOC&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if BITS_LOC:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D BITS_LOC<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D os.path.joi=
n(os.getcwd(), &#39;prebuilt&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isdir(p=
refix):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mkdir=
(prefix, mode=3D0o775)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bits_zip_file =3D os.path.join(prefi=
x, &#39;bits-%d.zip&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%self.=
_bitsVer)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_tar_file =3D os.path.join(prefi=
x,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;b=
its-%d-grub.tar.gz&#39; %self._bitsVer)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if the location of the bits binari=
es has been specified by the user<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # and they are not found in that loc=
ation, skip the test.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if BITS_LOC and not os.access(bits_z=
ip_file, os.F_OK):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&quot;te=
st skipped since biosbits binaries &quot; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;could not be found in the specified locat=
ion %s.&quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 %BITS_LOC)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if BITS_LOC and not os.access(grub_t=
ar_file, os.F_OK):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&quot;te=
st skipped since biosbits binaries &quot; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;could not be found in the specified locat=
ion %s.&quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 %BITS_LOC)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._workDir =3D tempfile.mkdtemp(p=
refix=3D&#39;acpi-bits-&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0suffix=3D&#39;.tmp&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=
=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;working dir: %s&#39=
;, self._workDir)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 localArchive =3D &quot;bits-%d.zip&q=
uot; % self._bitsVer<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.access(bits_zip_file, os.F=
_OK):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logg=
ing.info" rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&quot;archi=
ve %s not found in %s, downloading ...&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0localArchive, bits_zip_file)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req =3D =
request.urlopen(self._bitsLoc + localArchive)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ope=
n(os.path.join(prefix, localArchive),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;wb&#39;) as archivef:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 archivef.write(req.read())<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:=
 # pylint: disable=3Dbroad-except<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ski=
pTest(&quot;test skipped since biosbits binaries &quot; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;could not be obtained.&quot=
; + str(e))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logg=
ing.info" rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;using =
locally found %s&#39;, localArchive)<br>
&gt;<br>
&gt; so you skip downlaod if it already exists locally. IIUC it is looking<=
br>
&gt; in the CWD, which is presumably the directory the QEMU build is<br>
&gt; performed in ?<br>
<br>
Yes, build/test/pytest/bits-test<br>
<br>
&gt; So if dev cleans their build tree, the cache is lost ?<br>
<br>
Yes.<br>
<br>
&gt;<br>
&gt; Avocado has a more persistent cache outside the build tree IIUC.</bloc=
kquote><div dir=3D"auto"><br></div><div dir=3D"auto">To be honest I=E2=80=
=99m not sure if I like that. If I clear out my build directory I would wan=
t all build related artifacts to go away, including downloaded build stuff =
from the cache.=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=
=3D"auto"><br>
&gt;<br>
<br>
So that is why I have the environment variable mechanism for passing to<br>
the test that will point to the location of the archives. The developer<br>
can download the files there and point to the test. Or I can change the<br>
scriprt accordingly if we know where we were downloading. We were<br>
discussing submodules and it was fiercely hated. So mst suggested another<b=
r>
repo where to keep the binaries. My script that check out that repo<br>
somewhere outside the build directory and point the test to that location.<=
br>
<br>
I have kept several options open. We just need to make some decisions.<br>
<br>
<br>
&gt; With regards,<br>
&gt; Daniel<br>
&gt; --<br>
&gt; |: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blan=
k">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_bla=
nk">https://www.flickr.com/photos/dberrange</a> :|<br>
&gt; |: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank=
">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=
=3D"noreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
&gt; |: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D=
"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a hr=
ef=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.instagram.com/dberrange</a> :|<br>
&gt;<br>
&gt;</blockquote></div></div>

--00000000000037a4a405e3c787b0--

