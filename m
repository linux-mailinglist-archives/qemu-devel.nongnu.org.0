Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42F603C71
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 10:46:57 +0200 (CEST)
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol4iy-0008TM-DC
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 04:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ol4U8-0007ol-LU
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 04:31:32 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:36549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ol4U4-00022t-Mm
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 04:31:32 -0400
Received: by mail-il1-x134.google.com with SMTP id h18so8797327ilh.3
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvwxlqcfLdlr7SbwFxHloA1nOJhK33iBR58H7YVNuKo=;
 b=FlNGxuz9Lc1tlBu04anPAsgBgmDVpcfCghR7BcTrcTwyq/4AKJpDdzJ6gqoYR7i57o
 8wjeR4lEv7oqs4lhgmLsEsZIrROmgNvaC2no6X9GFfpx+YZ3Y/gBCfdgwoSwXYvbE4dq
 nxiaaqb6jI49a1ctdnHEviPODHgDTiJCFCvxwGDdeZMjAT6vffRuPdlmPllcofp6S+Oi
 qBNapQ0fzBeFXx6opXjeaxyY8tV7g/ZcshhgNDn435e2YJlpAWwaJtXKd/KQuep3jzZP
 y6O/twt05FbE5nUbhWC7Zxwv31CXhuLESXXQMDoeowBBsH9lot+A+E3D0OYVuCO1ey23
 OrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NvwxlqcfLdlr7SbwFxHloA1nOJhK33iBR58H7YVNuKo=;
 b=3TdUcjdm0LL6dIu3RWQuKyKISkRSTT5UtNs6YveYKeF2RvZaEYt8dP2Y117oGi4RL2
 fS/+QI4MjzmUfQvAlEEZHGf9iw7DaDkFH/SkNQ6Bx4JpBX2C1MsualVzjS7tr17jH5pK
 g/T/iODdb2KjvFmqufhcVUqSj8vOLz0xDspqCyKhVZh8PCoprPwc6MjtHT/BxI/oAyYj
 Ed+g5DscqLmtJ8PJ/XrF3n5TwgYjgLI/CfKEPmCXQ+qRi+N9EIZyyFMTEaXDq5++XoZb
 SkQ7xfv/wOGg6ALU2jNrSJGfLMaH0SAcoTlrQDkhyKZyDoAceJQ0oEVhrbaW1R+4LUtA
 V+nw==
X-Gm-Message-State: ACrzQf0YQUR8ZbLv7GjsrC46UeRoL0ZpbUDkhFT3rVVeAnFQN1oksukc
 poTmCsRsx8U3MOhZsp3BIYFUN8WbxhQ6LYGGQRxGCA==
X-Google-Smtp-Source: AMsMyM7Gnbs/IgGVfOvPCTLijJv9pGr7gH/36ONavwUCrCAdCzPEU5YCxJu4ooovbYcEM0d2D4E4lkYkMHkNLRXXH84=
X-Received: by 2002:a92:c548:0:b0:2f9:fe3f:f4c2 with SMTP id
 a8-20020a92c548000000b002f9fe3ff4c2mr4858463ilj.180.1666168287368; Wed, 19
 Oct 2022 01:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-9-ani@anisinha.ca>
 <CAARzgwz6DwgfOcyq9fFitu7SKUfx6xz_WUiYj8pkP0wmeT=UZQ@mail.gmail.com>
In-Reply-To: <CAARzgwz6DwgfOcyq9fFitu7SKUfx6xz_WUiYj8pkP0wmeT=UZQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 19 Oct 2022 14:01:16 +0530
Message-ID: <CAARzgwyRwh-fYuUTNjOgoRzjf4UZbAVCxJvSGzf4b-2jmqq=cQ@mail.gmail.com>
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
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x134.google.com
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

On Wed, Oct 19, 2022 at 11:59 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Wed, Oct 19, 2022 at 8:29 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
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
> >  tests/avocado/acpi-bits.py | 363 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 363 insertions(+)
> >  create mode 100644 tests/avocado/acpi-bits.py
> >
> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> > new file mode 100644
> > index 0000000000..4365537fa8
> > --- /dev/null
> > +++ b/tests/avocado/acpi-bits.py
> > @@ -0,0 +1,363 @@
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

 <snip>

> > +
> > +    def setUp(self): # pylint: disable=3Darguments-differ
> > +        super().setUp('qemu-system-')
> > +
> > +        if shutil.which('xorriso') is None:
> > +            logging.error('xorriso is required to run this test.')
> > +            self.skipTest("xorriso is not installed. Please install it=
.")
>
> This would result in output like this when xorriso is not found:
>
> $ which xorriso
> /usr/bin/which: no xorriso in
> (/home/anisinha/.local/bin:/home/anisinha/bin:/usr/share/Modules/bin:/usr=
/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin)
> [anisinha@centos8 build]$ ./tests/venv/bin/avocado run -t acpi tests/avoc=
ado
> Fetching asset from
> tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> JOB ID     : 95aba043201755ed888ef7d1598402c555118df4
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-19T02.27-95ab=
a04/job.log
>  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> ERROR: xorriso is not installed. Please install it. (0.00 s)
> RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> | CANCEL 0
> JOB TIME   : 0.61 s
>
>

skipIf() was not working for me, hence I had to resort to this. I got
skipIf() working now so in v6 I will remove the above hunk and add the
conditional as @skipIf decorator.

For the records,
> @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
does not work for me.
> @skipIf(os.getenv('GITLAB_CI') is not None, 'Running on GitLab')
works.
A quick grep indicates that the former is used all over the place!

$ grep GITLAB_CI *
grep: acpi-bits: Is a directory
acpi-bits.py:@skipIf(os.getenv('GITLAB_CI') is not None, 'Running on GitLab=
')
grep: avocado_qemu: Is a directory
boot_linux.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
intel_iommu.py:@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
linux_initrd.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
machine_aspeed.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
machine_aspeed.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
machine_mips_malta.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLa=
b')
machine_mips_malta.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLa=
b')
machine_rx_gdbsim.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab=
')
machine_rx_gdbsim.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab=
')
machine_s390_ccw_virtio.py:    @skipIf(os.getenv('GITLAB_CI'),
'Running on GitLab')
grep: __pycache__: Is a directory
replay_kernel.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
replay_kernel.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
reverse_debugging.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab=
')
reverse_debugging.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab=
')
smmu.py:@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')

