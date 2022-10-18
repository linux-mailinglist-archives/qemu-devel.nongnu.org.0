Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7760306A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 18:00:17 +0200 (CEST)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okp0o-0008Rr-LW
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 12:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okokc-0001jS-Rh
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:43:31 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okokZ-0002Ka-45
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:43:30 -0400
Received: by mail-il1-x135.google.com with SMTP id d14so7648663ilf.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C52Rwt4qw30qH/ekZDe6FkKINUUAJ55uOSqrXpXGQ2U=;
 b=7AAAhrOqW1z+v82zewL0oGgWXET2075YjvBLm+E+M1kKK5V+i9ge7eV78FUoIth4g8
 d2YFQT5fXTlfccMEhVbO1SQ+inIDaS3AVPgzUqK1j8xSRS6bg7+f0WAXVpdm2tThidMW
 7hCwP1XMLKWrdfIVjo9HfTByFoYNhw6GO/XWz5qt2E8fqP8UnE7+LiMoNHaHytbdHpMy
 YMkx8NMAiOX7D9nG3dhSJKY4Lq+Ocn6ScFO1aStdmgjb5CE+5H01IhWiYiPFVbb9JZka
 st8F96fQIzlKj1jw8D/T+Xhuz0FbqkttO1Ug6yVKePFua7LKc8QzRkXQZATKNOjmSDab
 VSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C52Rwt4qw30qH/ekZDe6FkKINUUAJ55uOSqrXpXGQ2U=;
 b=2Np8kmttm6hChS+h7mI0XIE/SdloaHTKRsbzqXvduZVyGoiZbLwrEsf4mwpR18L8fy
 ZB3Q6FwN4vaPOmPqk9zeWtdWSGEujKnNdxLCu5DqUGScLBf/OwyRIMg5F1ZvG/5D32ep
 AYzu02O7tytMlRUjfH9oRaWa5diVb4GUyJvUtuJ64RKfvPigFPm+aMmasSVkgNRJZowJ
 mu1cwA0f5ZEH3RptYgYw4MYRcjdMJqRw5KJKWVtOx97bJ0VgMA0cFLIeQY2VqSuy5Zar
 tVEnVZ+QM9UmiUbCRKqEYVaPEmFhDmKl78/OpXIDi3qRyR7BNwMhjxSnTwbcQx3xGQ6u
 GRPw==
X-Gm-Message-State: ACrzQf0jHyTnHW7yKS1RtL20G71JCfXb8b+DExt6p4EvtBKTk2OOXnoU
 aJ8qDkZZpY4wfcrXuVhIiCPUaqB4Mf3+sv/4wu9E0Q==
X-Google-Smtp-Source: AMsMyM5qaVjdAnoIin7/cf3yztpEvCBBqATzCxy8RHVZCKduxR/d0MruXLlYmt/E1d7TQEU5nEMJSLS6zISOEdh342A=
X-Received: by 2002:a92:c548:0:b0:2f9:fe3f:f4c2 with SMTP id
 a8-20020a92c548000000b002f9fe3ff4c2mr2043907ilj.180.1666107805121; Tue, 18
 Oct 2022 08:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221014173508.222823-1-ani@anisinha.ca>
 <20221014173508.222823-9-ani@anisinha.ca>
 <87wn8xb0oc.fsf@linaro.org>
In-Reply-To: <87wn8xb0oc.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 18 Oct 2022 21:13:13 +0530
Message-ID: <CAARzgwwW1xUt85FkoaXREiEOdAhB5SKvQ5nGcLSdn6pRHb4pcQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] acpi/tests/avocado/bits: add acpi and smbios
 avocado tests that uses biosbits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x135.google.com
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

On Tue, Oct 18, 2022 at 9:10 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > This introduces QEMU acpi/smbios biosbits avocado test which is run
> > from within the python virtual environment. When the bits tests are run=
, bits
> > binaries are downloaded from an external repo/location, bios bits iso i=
s
> > regenerated containing the acpi/smbios bits tests that are maintained a=
s a part
> > of the QEMU source under tests/avocado/acpi-bits/bits-test . When the V=
M is
> > spawned with the iso, it runs the tests in batch mode and the results a=
re pushed
> > out from the VM to the test machine where they are analyzed by this scr=
ipt and
> > pass/fail results are reported.
> >
> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Maydell Peter <peter.maydell@linaro.org>
> > Cc: John Snow <jsnow@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Michael Tsirkin <mst@redhat.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/avocado/acpi-bits.py | 359 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 359 insertions(+)
> >  create mode 100644 tests/avocado/acpi-bits.py
> >
> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> > new file mode 100644
> > index 0000000000..009c7f5327
> > --- /dev/null
> > +++ b/tests/avocado/acpi-bits.py
> > @@ -0,0 +1,359 @@
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
> > +# along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
> > +#
> > +#
> > +# Author:
> > +#  Ani Sinha <ani@anisinha.ca>
> > +
> > +# pylint: disable=3Dinvalid-name
> > +# pylint: disable=3Dconsider-using-f-string
> > +
> > +"""
> > +This is QEMU ACPI/SMBIOS avocado tests using biosbits.
> > +Biosbits is available originally at https://biosbits.org/.
> > +This test uses a fork of the upstream bits and has numerous fixes
> > +including an upgraded acpica. The fork is located here:
> > +https://gitlab.com/qemu-project/biosbits-bits .
> > +"""
> > +
> > +import logging
> > +import os
> > +import re
> > +import shutil
> > +import subprocess
> > +import tarfile
> > +import tempfile
> > +import time
> > +import zipfile
> > +from typing import (
> > +    List,
> > +    Optional,
> > +    Sequence,
> > +)
> > +from qemu.machine import QEMUMachine
> > +from avocado import skipIf
> > +from avocado_qemu import QemuBaseTest
> > +
> > +def _print_log(log):
> > +    print('\nlogs from biosbits follows:')
> > +    print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n')
> > +    print(log)
> > +    print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n')
> > +
> > +class QEMUBitsMachine(QEMUMachine): # pylint: disable=3Dtoo-few-public=
-methods
> > +    """
> > +    A QEMU VM, with isa-debugcon enabled and bits iso passed
> > +    using -cdrom to QEMU commandline.
> > +
> > +    """
> > +    def __init__(self,
> > +                 binary: str,
> > +                 args: Sequence[str] =3D (),
> > +                 wrapper: Sequence[str] =3D (),
> > +                 name: Optional[str] =3D None,
> > +                 base_temp_dir: str =3D "/var/tmp",
> > +                 debugcon_log: str =3D "debugcon-log.txt",
> > +                 debugcon_addr: str =3D "0x403",
> > +                 sock_dir: Optional[str] =3D None,
> > +                 qmp_timer: Optional[float] =3D None):
> > +        # pylint: disable=3Dtoo-many-arguments
> > +
> > +        if name is None:
> > +            name =3D "qemu-bits-%d" % os.getpid()
> > +        if sock_dir is None:
> > +            sock_dir =3D base_temp_dir
> > +        super().__init__(binary, args, wrapper=3Dwrapper, name=3Dname,
> > +                         base_temp_dir=3Dbase_temp_dir,
> > +                         sock_dir=3Dsock_dir, qmp_timer=3Dqmp_timer)
> > +        self.debugcon_log =3D debugcon_log
> > +        self.debugcon_addr =3D debugcon_addr
> > +        self.base_temp_dir =3D base_temp_dir
> > +
> > +    @property
> > +    def _base_args(self) -> List[str]:
> > +        args =3D super()._base_args
> > +        args.extend([
> > +            '-chardev',
> > +            'file,path=3D%s,id=3Ddebugcon' %os.path.join(self.base_tem=
p_dir,
> > +                                                     self.debugcon_log=
),
> > +            '-device',
> > +            'isa-debugcon,iobase=3D%s,chardev=3Ddebugcon' %self.debugc=
on_addr,
> > +        ])
> > +        return args
> > +
> > +    def base_args(self):
> > +        """return the base argument to QEMU binary"""
> > +        return self._base_args
> > +
> > +@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> > +class AcpiBitsTest(QemuBaseTest): #pylint: disable=3Dtoo-many-instance=
-attributes
> > +    """
> > +    ACPI and SMBIOS tests using biosbits.
> > +
> > +    :avocado: tags=3Darch:x86_64
> > +    :avocado: tags=3Dacpi
> > +
> > +    """
> > +    def __init__(self, *args, **kwargs):
> > +        super().__init__(*args, **kwargs)
> > +        self._vm =3D None
> > +        self._workDir =3D None
> > +        self._baseDir =3D None
> > +
> > +        # following are some standard configuration constants
> > +        self._bitsInternalVer =3D 2020
> > +        self._bitsCommitHash =3D 'b972c69d' # commit hash must match
> > +                                          # the artifact tag below
> > +        self._bitsTag =3D "qemu-bits-09272022" # this is the latest bi=
ts
> > +                                             # release as of today.
> > +        self._bitsArtSHA1Hash =3D '6915ad4781de0d80d1a099438a4cb4bd9e1=
2df70'
> > +        self._bitsArtURL =3D ("https://gitlab.com/qemu-project/"
> > +                            "biosbits-bits/-/jobs/artifacts/%s/"
> > +                            "download?job=3Dqemu-bits-build" %self._bi=
tsTag)
> > +        self._debugcon_addr =3D '0x403'
> > +        self._debugcon_log =3D 'debugcon-log.txt'
> > +        logging.basicConfig(level=3Dlogging.INFO)
> > +
> > +    def copy_bits_config(self):
> > +        """ copies the bios bits config file into bits.
> > +        """
> > +        config_file =3D 'bits-cfg.txt'
> > +        bits_config_dir =3D os.path.join(self._baseDir, 'acpi-bits',
> > +                                       'bits-config')
> > +        target_config_dir =3D os.path.join(self._workDir,
> > +                                         'bits-%d' %self._bitsInternal=
Ver,
> > +                                         'boot')
> > +        self.assertTrue(os.path.exists(bits_config_dir))
> > +        self.assertTrue(os.path.exists(target_config_dir))
> > +        self.assertTrue(os.access(os.path.join(bits_config_dir,
> > +                                               config_file), os.R_OK))
> > +        shutil.copy2(os.path.join(bits_config_dir, config_file),
> > +                     target_config_dir)
> > +        logging.info('copied config file %s to %s',
> > +                     config_file, target_config_dir)
> > +
> > +    def copy_test_scripts(self):
> > +        """copies the python test scripts into bits. """
> > +
> > +        bits_test_dir =3D os.path.join(self._baseDir, 'acpi-bits',
> > +                                     'bits-tests')
> > +        target_test_dir =3D os.path.join(self._workDir,
> > +                                       'bits-%d' %self._bitsInternalVe=
r,
> > +                                       'boot', 'python')
> > +
> > +        self.assertTrue(os.path.exists(bits_test_dir))
> > +        self.assertTrue(os.path.exists(target_test_dir))
> > +
> > +        for filename in os.listdir(bits_test_dir):
> > +            if os.path.isfile(os.path.join(bits_test_dir, filename)) a=
nd \
> > +               filename.endswith('.py2'):
> > +                # all test scripts are named with extension .py2 so th=
at
> > +                # avocado does not try to load them. These scripts are
> > +                # written for python 2.7 not python 3 and hence if avo=
cado
> > +                # loaded them, it would complain about python 3 specif=
ic
> > +                # syntaxes.
> > +                newfilename =3D os.path.splitext(filename)[0] + '.py'
> > +                shutil.copy2(os.path.join(bits_test_dir, filename),
> > +                             os.path.join(target_test_dir, newfilename=
))
> > +                logging.info('copied test file %s to %s',
> > +                             filename, target_test_dir)
> > +
> > +                # now remove the pyc test file if it exists, otherwise=
 the
> > +                # changes in the python test script won't be executed.
> > +                testfile_pyc =3D os.path.splitext(filename)[0] + '.pyc=
'
> > +                if os.access(os.path.join(target_test_dir, testfile_py=
c),
> > +                             os.F_OK):
> > +                    os.remove(os.path.join(target_test_dir, testfile_p=
yc))
> > +                    logging.info('removed compiled file %s',
> > +                                 os.path.join(target_test_dir, testfil=
e_pyc))
> > +
> > +    def fix_mkrescue(self, mkrescue):
> > +        """ grub-mkrescue is a bash script with two variables, 'prefix=
' and
> > +            'libdir'. They must be pointed to the right location so th=
at the
> > +            iso can be generated appropriately. We point the two varia=
bles to
> > +            the directory where we have extracted our pre-built bits g=
rub
> > +            tarball.
> > +        """
> > +        grub_x86_64_mods =3D os.path.join(self._workDir, 'grub-inst-x8=
6_64-efi')
> > +        grub_i386_mods =3D os.path.join(self._workDir, 'grub-inst')
> > +
> > +        self.assertTrue(os.path.exists(grub_x86_64_mods))
> > +        self.assertTrue(os.path.exists(grub_i386_mods))
> > +
> > +        new_script =3D ""
> > +        with open(mkrescue, 'r', encoding=3D'utf-8') as filehandle:
> > +            orig_script =3D filehandle.read()
> > +            new_script =3D re.sub('(^prefix=3D)(.*)',
> > +                                r'\1"%s"' %grub_x86_64_mods,
> > +                                orig_script, flags=3Dre.M)
> > +            new_script =3D re.sub('(^libdir=3D)(.*)', r'\1"%s/lib"' %g=
rub_i386_mods,
> > +                                new_script, flags=3Dre.M)
> > +
> > +        with open(mkrescue, 'w', encoding=3D'utf-8') as filehandle:
> > +            filehandle.write(new_script)
> > +
> > +    def generate_bits_iso(self):
> > +        """ Uses grub-mkrescue to generate a fresh bits iso with the p=
ython
> > +            test scripts
> > +        """
> > +        bits_dir =3D os.path.join(self._workDir,
> > +                                'bits-%d' %self._bitsInternalVer)
> > +        iso_file =3D os.path.join(self._workDir,
> > +                                'bits-%d.iso' %self._bitsInternalVer)
> > +        mkrescue_script =3D os.path.join(self._workDir,
> > +                                       'grub-inst-x86_64-efi', 'bin',
> > +                                       'grub-mkrescue')
>
> This seems wrong because it fails to find grub-mkrescue (which on my
> system is in the PATH):
>
>   =E2=9E=9C  which grub-mkrescue
>   /usr/bin/grub-mkrescue
>
> but because it can't find this it never works.

Unfortunately you cannot use grub-mkrescue from your host. It has to
be from the bits binary artifact that is downloaded. Is the download
failing?

>
> --
> Alex Benn=C3=A9e

