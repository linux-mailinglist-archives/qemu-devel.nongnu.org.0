Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402926039F6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 08:41:00 +0200 (CEST)
Received: from localhost ([::1]:46876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol2l8-0003B8-NZ
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 02:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ol2ah-0006ea-TO
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 02:30:11 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:39560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ol2aV-0008RI-Ri
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 02:30:11 -0400
Received: by mail-il1-x12d.google.com with SMTP id u2so8677987ilv.6
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fDs8web7dV413AK5B7kePG4esO+vDgdaLFUh1Q3qTNw=;
 b=NsAouxDBK59V4REBNtLy/BgJmhDaoTxun0FqALNzZtqcS/+UxVH5RbgJjovkPCgllK
 vWal3qN6KjqJO7o9MTIblQoCnqhiluqNlhWlFicHr0FaVGBWO/GFtp3lATi1na3QKrof
 SjiryfT6EVc9BJMONx2QWYO8SKIbGAZr2YroFxA7j9T4kjcjDB14sXX6MD5Ypvr/U8by
 U3B9tFP0IVgDN2ebK10803GxOveIN5AcGhY/X4EX5BKDi5k62i6RvcV5/6sLXgjiX4Xy
 zGmyC/Xl5N4sxnRKbu5EsJHmCmpJUDi0FdrqakS1kiAJAV64stPCHoizSCiW14H6iHis
 8Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fDs8web7dV413AK5B7kePG4esO+vDgdaLFUh1Q3qTNw=;
 b=Ax1Yxqvva8S33kfyAQqOlV6uEQt7D2RSHjoZvPL4x30Skyt4Po2e86GID/xko8P1ow
 P79xybdfSNiIgQnm40umYQzVGAyhWALYcM5hxYNUD2NUt3Eh0jYLhkroMP1W0qO1S3Zu
 Z+7lihmoAkye31cKHvrLEpoVcCtn4c/srWkR4muqWE4XaaVTk0JMhr7N7pl4tBBt52MC
 ZljGvEhzYu+g3LjvYygwT6k/AmYlW1Veqsjn+VATE1EvNMNVxadpf6TN2L9p6SNPsECI
 SB6eIlnDYs6OFQMMNE/45jXJUzPUCpTrUlotAojbBYSVCgivuazdvvFTiZlX1aVoR0o2
 V9Sg==
X-Gm-Message-State: ACrzQf2MGlA8MPp/t+810r71KIqH/xqaMaiPBLzsDu9kpt4FP4w1/PqO
 H6jPPINDpksFEJ3Q9ETuqcksRCauwKJpU4fOXIEqkw==
X-Google-Smtp-Source: AMsMyM79dmuRn7Gmw0v9sYN5SUbnxev/IAD4boNakN/Lb//hEAIPIdlS5coe69JlHGhxKku2rvF0IVAPGEoIgas5HOc=
X-Received: by 2002:a92:c548:0:b0:2f9:fe3f:f4c2 with SMTP id
 a8-20020a92c548000000b002f9fe3ff4c2mr4598136ilj.180.1666160997259; Tue, 18
 Oct 2022 23:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-9-ani@anisinha.ca>
In-Reply-To: <20221019025828.683113-9-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 19 Oct 2022 11:59:46 +0530
Message-ID: <CAARzgwz6DwgfOcyq9fFitu7SKUfx6xz_WUiYj8pkP0wmeT=UZQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] acpi/tests/avocado/bits: add acpi and smbios
 avocado tests that uses biosbits
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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

On Wed, Oct 19, 2022 at 8:29 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> This introduces QEMU acpi/smbios biosbits avocado test which is run
> from within the python virtual environment. When the bits tests are run, =
bits
> binaries are downloaded from an external repo/location, bios bits iso is
> regenerated containing the acpi/smbios bits tests that are maintained as =
a part
> of the QEMU source under tests/avocado/acpi-bits/bits-test . When the VM =
is
> spawned with the iso, it runs the tests in batch mode and the results are=
 pushed
> out from the VM to the test machine where they are analyzed by this scrip=
t and
> pass/fail results are reported.
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/avocado/acpi-bits.py | 363 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 363 insertions(+)
>  create mode 100644 tests/avocado/acpi-bits.py
>
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> new file mode 100644
> index 0000000000..4365537fa8
> --- /dev/null
> +++ b/tests/avocado/acpi-bits.py
> @@ -0,0 +1,363 @@
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
> +#
> +# Author:
> +#  Ani Sinha <ani@anisinha.ca>
> +
> +# pylint: disable=3Dinvalid-name
> +# pylint: disable=3Dconsider-using-f-string
> +
> +"""
> +This is QEMU ACPI/SMBIOS avocado tests using biosbits.
> +Biosbits is available originally at https://biosbits.org/.
> +This test uses a fork of the upstream bits and has numerous fixes
> +including an upgraded acpica. The fork is located here:
> +https://gitlab.com/qemu-project/biosbits-bits .
> +"""
> +
> +import logging
> +import os
> +import re
> +import shutil
> +import subprocess
> +import tarfile
> +import tempfile
> +import time
> +import zipfile
> +from typing import (
> +    List,
> +    Optional,
> +    Sequence,
> +)
> +from qemu.machine import QEMUMachine
> +from avocado import skipIf
> +from avocado_qemu import QemuBaseTest
> +
> +def _print_log(log):
> +    print('\nlogs from biosbits follows:')
> +    print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n')
> +    print(log)
> +    print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n')
> +
> +class QEMUBitsMachine(QEMUMachine): # pylint: disable=3Dtoo-few-public-m=
ethods
> +    """
> +    A QEMU VM, with isa-debugcon enabled and bits iso passed
> +    using -cdrom to QEMU commandline.
> +
> +    """
> +    def __init__(self,
> +                 binary: str,
> +                 args: Sequence[str] =3D (),
> +                 wrapper: Sequence[str] =3D (),
> +                 name: Optional[str] =3D None,
> +                 base_temp_dir: str =3D "/var/tmp",
> +                 debugcon_log: str =3D "debugcon-log.txt",
> +                 debugcon_addr: str =3D "0x403",
> +                 sock_dir: Optional[str] =3D None,
> +                 qmp_timer: Optional[float] =3D None):
> +        # pylint: disable=3Dtoo-many-arguments
> +
> +        if name is None:
> +            name =3D "qemu-bits-%d" % os.getpid()
> +        if sock_dir is None:
> +            sock_dir =3D base_temp_dir
> +        super().__init__(binary, args, wrapper=3Dwrapper, name=3Dname,
> +                         base_temp_dir=3Dbase_temp_dir,
> +                         sock_dir=3Dsock_dir, qmp_timer=3Dqmp_timer)
> +        self.debugcon_log =3D debugcon_log
> +        self.debugcon_addr =3D debugcon_addr
> +        self.base_temp_dir =3D base_temp_dir
> +
> +    @property
> +    def _base_args(self) -> List[str]:
> +        args =3D super()._base_args
> +        args.extend([
> +            '-chardev',
> +            'file,path=3D%s,id=3Ddebugcon' %os.path.join(self.base_temp_=
dir,
> +                                                     self.debugcon_log),
> +            '-device',
> +            'isa-debugcon,iobase=3D%s,chardev=3Ddebugcon' %self.debugcon=
_addr,
> +        ])
> +        return args
> +
> +    def base_args(self):
> +        """return the base argument to QEMU binary"""
> +        return self._base_args
> +
> +@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +class AcpiBitsTest(QemuBaseTest): #pylint: disable=3Dtoo-many-instance-a=
ttributes
> +    """
> +    ACPI and SMBIOS tests using biosbits.
> +
> +    :avocado: tags=3Darch:x86_64
> +    :avocado: tags=3Dacpi
> +
> +    """
> +    def __init__(self, *args, **kwargs):
> +        super().__init__(*args, **kwargs)
> +        self._vm =3D None
> +        self._workDir =3D None
> +        self._baseDir =3D None
> +
> +        # following are some standard configuration constants
> +        self._bitsInternalVer =3D 2020
> +        self._bitsCommitHash =3D 'b48b88ff' # commit hash must match
> +                                          # the artifact tag below
> +        self._bitsTag =3D "qemu-bits-10182022" # this is the latest bits
> +                                             # release as of today.
> +        self._bitsArtSHA1Hash =3D 'b04790ac9b99b5662d0416392c73b97580641=
fe5'
> +        self._bitsArtURL =3D ("https://gitlab.com/qemu-project/"
> +                            "biosbits-bits/-/jobs/artifacts/%s/"
> +                            "download?job=3Dqemu-bits-build" %self._bits=
Tag)
> +        self._debugcon_addr =3D '0x403'
> +        self._debugcon_log =3D 'debugcon-log.txt'
> +        logging.basicConfig(level=3Dlogging.INFO)
> +
> +    def copy_bits_config(self):
> +        """ copies the bios bits config file into bits.
> +        """
> +        config_file =3D 'bits-cfg.txt'
> +        bits_config_dir =3D os.path.join(self._baseDir, 'acpi-bits',
> +                                       'bits-config')
> +        target_config_dir =3D os.path.join(self._workDir,
> +                                         'bits-%d' %self._bitsInternalVe=
r,
> +                                         'boot')
> +        self.assertTrue(os.path.exists(bits_config_dir))
> +        self.assertTrue(os.path.exists(target_config_dir))
> +        self.assertTrue(os.access(os.path.join(bits_config_dir,
> +                                               config_file), os.R_OK))
> +        shutil.copy2(os.path.join(bits_config_dir, config_file),
> +                     target_config_dir)
> +        logging.info('copied config file %s to %s',
> +                     config_file, target_config_dir)
> +
> +    def copy_test_scripts(self):
> +        """copies the python test scripts into bits. """
> +
> +        bits_test_dir =3D os.path.join(self._baseDir, 'acpi-bits',
> +                                     'bits-tests')
> +        target_test_dir =3D os.path.join(self._workDir,
> +                                       'bits-%d' %self._bitsInternalVer,
> +                                       'boot', 'python')
> +
> +        self.assertTrue(os.path.exists(bits_test_dir))
> +        self.assertTrue(os.path.exists(target_test_dir))
> +
> +        for filename in os.listdir(bits_test_dir):
> +            if os.path.isfile(os.path.join(bits_test_dir, filename)) and=
 \
> +               filename.endswith('.py2'):
> +                # all test scripts are named with extension .py2 so that
> +                # avocado does not try to load them. These scripts are
> +                # written for python 2.7 not python 3 and hence if avoca=
do
> +                # loaded them, it would complain about python 3 specific
> +                # syntaxes.
> +                newfilename =3D os.path.splitext(filename)[0] + '.py'
> +                shutil.copy2(os.path.join(bits_test_dir, filename),
> +                             os.path.join(target_test_dir, newfilename))
> +                logging.info('copied test file %s to %s',
> +                             filename, target_test_dir)
> +
> +                # now remove the pyc test file if it exists, otherwise t=
he
> +                # changes in the python test script won't be executed.
> +                testfile_pyc =3D os.path.splitext(filename)[0] + '.pyc'
> +                if os.access(os.path.join(target_test_dir, testfile_pyc)=
,
> +                             os.F_OK):
> +                    os.remove(os.path.join(target_test_dir, testfile_pyc=
))
> +                    logging.info('removed compiled file %s',
> +                                 os.path.join(target_test_dir, testfile_=
pyc))
> +
> +    def fix_mkrescue(self, mkrescue):
> +        """ grub-mkrescue is a bash script with two variables, 'prefix' =
and
> +            'libdir'. They must be pointed to the right location so that=
 the
> +            iso can be generated appropriately. We point the two variabl=
es to
> +            the directory where we have extracted our pre-built bits gru=
b
> +            tarball.
> +        """
> +        grub_x86_64_mods =3D os.path.join(self._workDir, 'grub-inst-x86_=
64-efi')
> +        grub_i386_mods =3D os.path.join(self._workDir, 'grub-inst')
> +
> +        self.assertTrue(os.path.exists(grub_x86_64_mods))
> +        self.assertTrue(os.path.exists(grub_i386_mods))
> +
> +        new_script =3D ""
> +        with open(mkrescue, 'r', encoding=3D'utf-8') as filehandle:
> +            orig_script =3D filehandle.read()
> +            new_script =3D re.sub('(^prefix=3D)(.*)',
> +                                r'\1"%s"' %grub_x86_64_mods,
> +                                orig_script, flags=3Dre.M)
> +            new_script =3D re.sub('(^libdir=3D)(.*)', r'\1"%s/lib"' %gru=
b_i386_mods,
> +                                new_script, flags=3Dre.M)
> +
> +        with open(mkrescue, 'w', encoding=3D'utf-8') as filehandle:
> +            filehandle.write(new_script)
> +
> +    def generate_bits_iso(self):
> +        """ Uses grub-mkrescue to generate a fresh bits iso with the pyt=
hon
> +            test scripts
> +        """
> +        bits_dir =3D os.path.join(self._workDir,
> +                                'bits-%d' %self._bitsInternalVer)
> +        iso_file =3D os.path.join(self._workDir,
> +                                'bits-%d.iso' %self._bitsInternalVer)
> +        mkrescue_script =3D os.path.join(self._workDir,
> +                                       'grub-inst-x86_64-efi', 'bin',
> +                                       'grub-mkrescue')
> +
> +        self.assertTrue(os.access(mkrescue_script,
> +                                  os.R_OK | os.W_OK | os.X_OK))
> +
> +        self.fix_mkrescue(mkrescue_script)
> +
> +        logging.info('calling grub-mkrescue to generate the biosbits iso=
 ...')
> +
> +        try:
> +            if os.getenv('V'):
> +                subprocess.check_call([mkrescue_script, '-o', iso_file,
> +                                       bits_dir], stderr=3Dsubprocess.ST=
DOUT)
> +            else:
> +                subprocess.check_call([mkrescue_script, '-o',
> +                                      iso_file, bits_dir],
> +                                      stderr=3Dsubprocess.DEVNULL,
> +                                      stdout=3Dsubprocess.DEVNULL)
> +        except Exception as e: # pylint: disable=3Dbroad-except
> +            self.skipTest("Error while generating the bits iso. "
> +                          "Pass V=3D1 in the environment to get more det=
ails. "
> +                          + str(e))
> +
> +        self.assertTrue(os.access(iso_file, os.R_OK))
> +
> +        logging.info('iso file %s successfully generated.', iso_file)
> +
> +    def setUp(self): # pylint: disable=3Darguments-differ
> +        super().setUp('qemu-system-')
> +
> +        if shutil.which('xorriso') is None:
> +            logging.error('xorriso is required to run this test.')
> +            self.skipTest("xorriso is not installed. Please install it."=
)

This would result in output like this when xorriso is not found:

$ which xorriso
/usr/bin/which: no xorriso in
(/home/anisinha/.local/bin:/home/anisinha/bin:/usr/share/Modules/bin:/usr/l=
ocal/bin:/usr/bin:/usr/local/sbin:/usr/sbin)
[anisinha@centos8 build]$ ./tests/venv/bin/avocado run -t acpi tests/avocad=
o
Fetching asset from
tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
JOB ID     : 95aba043201755ed888ef7d1598402c555118df4
JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-19T02.27-95aba0=
4/job.log
 (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
ERROR: xorriso is not installed. Please install it. (0.00 s)
RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
| CANCEL 0
JOB TIME   : 0.61 s


> +
> +        self._baseDir =3D os.getenv('AVOCADO_TEST_BASEDIR')
> +
> +        # workdir could also be avocado's own workdir in self.workdir.
> +        # At present, I prefer to maintain my own temporary working
> +        # directory. It gives us more control over the generated bits
> +        # log files and also for debugging, we may chose not to remove
> +        # this working directory so that the logs and iso can be
> +        # inspected manually and archived if needed.
> +        self._workDir =3D tempfile.mkdtemp(prefix=3D'acpi-bits-',
> +                                         suffix=3D'.tmp')
> +        logging.info('working dir: %s', self._workDir)
> +
> +        prebuiltDir =3D os.path.join(self._workDir, 'prebuilt')
> +        if not os.path.isdir(prebuiltDir):
> +            os.mkdir(prebuiltDir, mode=3D0o775)
> +
> +        bits_zip_file =3D os.path.join(prebuiltDir, 'bits-%d-%s.zip'
> +                                     %(self._bitsInternalVer,
> +                                       self._bitsCommitHash))
> +        grub_tar_file =3D os.path.join(prebuiltDir,
> +                                     'bits-%d-%s-grub.tar.gz'
> +                                     %(self._bitsInternalVer,
> +                                       self._bitsCommitHash))
> +
> +        bitsLocalArtLoc =3D self.fetch_asset(self._bitsArtURL,
> +                                           asset_hash=3Dself._bitsArtSHA=
1Hash)
> +        logging.info("downloaded bits artifacts to %s", bitsLocalArtLoc)
> +
> +        # extract the bits artifact in the temp working directory
> +        with zipfile.ZipFile(bitsLocalArtLoc, 'r') as zref:
> +            zref.extractall(prebuiltDir)
> +
> +        # extract the bits software in the temp working directory
> +        with zipfile.ZipFile(bits_zip_file, 'r') as zref:
> +            zref.extractall(self._workDir)
> +
> +        with tarfile.open(grub_tar_file, 'r', encoding=3D'utf-8') as tar=
ball:
> +            tarball.extractall(self._workDir)
> +
> +        self.copy_test_scripts()
> +        self.copy_bits_config()
> +        self.generate_bits_iso()
> +
> +    def parse_log(self):
> +        """parse the log generated by running bits tests and
> +           check for failures.
> +        """
> +        debugconf =3D os.path.join(self._workDir, self._debugcon_log)
> +        log =3D ""
> +        with open(debugconf, 'r', encoding=3D'utf-8') as filehandle:
> +            log =3D filehandle.read()
> +
> +        matchiter =3D re.finditer(r'(.*Summary: )(\d+ passed), (\d+ fail=
ed).*',
> +                                log)
> +        for match in matchiter:
> +            # verify that no test cases failed.
> +            try:
> +                self.assertEqual(match.group(3).split()[0], '0',
> +                                 'Some bits tests seems to have failed. =
' \
> +                                 'Please check the test logs for more in=
fo.')
> +            except AssertionError as e:
> +                _print_log(log)
> +                raise e
> +            else:
> +                if os.getenv('V'):
> +                    _print_log(log)
> +
> +    def tearDown(self):
> +        """
> +           Lets do some cleanups.
> +        """
> +        if self._vm:
> +            self.assertFalse(not self._vm.is_running)
> +        logging.info('removing the work directory %s', self._workDir)
> +        shutil.rmtree(self._workDir)
> +        super().tearDown()
> +
> +    def test_acpi_smbios_bits(self):
> +        """The main test case implementaion."""
> +
> +        iso_file =3D os.path.join(self._workDir,
> +                                'bits-%d.iso' %self._bitsInternalVer)
> +
> +        self.assertTrue(os.access(iso_file, os.R_OK))
> +
> +        self._vm =3D QEMUBitsMachine(binary=3Dself.qemu_bin,
> +                                   base_temp_dir=3Dself._workDir,
> +                                   debugcon_log=3Dself._debugcon_log,
> +                                   debugcon_addr=3Dself._debugcon_addr)
> +
> +        self._vm.add_args('-cdrom', '%s' %iso_file)
> +
> +        args =3D " ".join(str(arg) for arg in self._vm.base_args()) + \
> +            " " + " ".join(str(arg) for arg in self._vm.args)
> +
> +        logging.info("launching QEMU vm with the following arguments: %s=
",
> +                     args)
> +
> +        self._vm.launch()
> +        # biosbits has been configured to run all the specified test sui=
tes
> +        # in batch mode and then automatically initiate a vm shutdown.
> +        # sleep for maximum of one minute
> +        max_sleep_time =3D time.monotonic() + 60
> +        while self._vm.is_running() and time.monotonic() < max_sleep_tim=
e:
> +            time.sleep(1)
> +
> +        self.assertFalse(time.monotonic() > max_sleep_time,
> +                         'The VM seems to have failed to shutdown in tim=
e')
> +
> +        self.parse_log()
> --
> 2.34.1
>

