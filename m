Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16E55BF63
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:20:36 +0200 (CEST)
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66SX-0001fr-Hq
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o65cp-0004T8-RO
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:27:08 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o65cn-0003gR-Au
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:27:07 -0400
Received: by mail-ej1-x631.google.com with SMTP id d2so12119677ejy.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GT44jPZF5wz6OxfMIiDchKCTI68PLo68FtO0nlpr3sM=;
 b=NpjshHSy4r4d4Z3U40xlxccCKoGq+74il9txv3R6R7eJiQHEIL7MmYiaTFdahGKt/O
 xR6lY+IhQzSchh5jcYqelMTY7GCIz0PvF16BeCRzOn5Ut3vwF2GOCg2/zsaJQ5dpWutP
 RQ4h2RyC8Dh9qJBxmxnGKN6a2eHmvVX9mgN73uXyD2ERpvaqqNrnINMYI1H+hkqrFETa
 jhMVq7rb/HLth3w3nME881Da2JWQpxAfmp6/iiTDcG8sRcsA+Ypv+/KTdOskUXZ47s0H
 hDnM9gw8DOm0028ootQh3W90FLIQYnpyoIWPmNmlUMqRXCX7zjmBEwfPUld8DcZi6Xnc
 S/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GT44jPZF5wz6OxfMIiDchKCTI68PLo68FtO0nlpr3sM=;
 b=b+fwenlYQYa0RZW4axII9PGOCElJ4eHQ9p25OZVt4pwJTAT0OufXdFeOCCf0LQ6y8n
 I7CJ0X2QeTU5/C+0mKF4p/v2BsTwTfxZFsQOt8hg1BkftXFFKl02ZKGX2Wh3pnBrG+GZ
 8/Cz2I78gbCLGS+gr2JOgMP5zPPRCKFj6TQtyb5EGG9bzv0qLtlKkjLTK+32TZuiGwUp
 h7qVN/msht3v/w1v+oJMS82r6P9FSNlDyvXI3yEVs2AFeQ5v8atLAp6bqH95Z8LLg6Yu
 2ickxjs8H9mmASFs+CSYcszOsAXS7M95vqf6Jm1ikWrijpYoyzbL3nWeYcR0WaNCn1Rw
 POrw==
X-Gm-Message-State: AJIora99ZYBEmzbrF9sXA0QF/UZfJMN8egkSitrod7cHt56i3uSrPQfq
 lT8JFD4OurekWmowXW16JanPSmzmh5kHWCkZgb/YMQ==
X-Google-Smtp-Source: AGRyM1sy3rpO8kdf3kvRpmSJyDB+W2PkZGwf/DdVv+4CxGVQ6j9U9+Drq9gOqTbJTuW4w/2VFW89NYkEiYwkmZUbE38=
X-Received: by 2002:a17:907:608b:b0:722:fb4c:5675 with SMTP id
 ht11-20020a170907608b00b00722fb4c5675mr17072795ejc.273.1656401223135; Tue, 28
 Jun 2022 00:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-10-ani@anisinha.ca>
 <a9614691-5f79-fb77-1514-876deb487e98@redhat.com>
In-Reply-To: <a9614691-5f79-fb77-1514-876deb487e98@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 12:56:52 +0530
Message-ID: <CAARzgwz2oNiR56j7UYstEVweianLUwy8AqC5yRccyR2f4iWipA@mail.gmail.com>
Subject: Re: [PATCH 09/12] acpi/tests/bits: add acpi and smbios python tests
 that uses biosbits
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, mst@redhat.com, 
 John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x631.google.com
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

On Tue, Jun 28, 2022 at 12:50 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/06/2022 09.28, Ani Sinha wrote:
> > This change adds python based qtest framework that can be used to run
> > qtests from within a virtual environment. A bash script creates the virtual
> > environment and then runs the python based tests from within that environment.
> > All dependent python packages are installed in the virtual environment using
> > pip module. QEMU python test modules are also available in the environment for
> > spawning the QEMU based VMs.
> >
> > It also introduces QEMU acpi/smbios biosbits python test script which is run
> > from within the python virtual environment.
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >   tests/qtest/acpi-bits/acpi-bits-test-venv.sh |  59 ++++
> >   tests/qtest/acpi-bits/acpi-bits-test.py      | 327 +++++++++++++++++++
> >   tests/qtest/acpi-bits/meson.build            |  39 +++
> >   tests/qtest/acpi-bits/requirements.txt       |   1 +
> >   4 files changed, 426 insertions(+)
> >   create mode 100644 tests/qtest/acpi-bits/acpi-bits-test-venv.sh
> >   create mode 100644 tests/qtest/acpi-bits/acpi-bits-test.py
> >   create mode 100644 tests/qtest/acpi-bits/meson.build
> >   create mode 100644 tests/qtest/acpi-bits/requirements.txt
> >
> > diff --git a/tests/qtest/acpi-bits/acpi-bits-test-venv.sh b/tests/qtest/acpi-bits/acpi-bits-test-venv.sh
> > new file mode 100644
> > index 0000000000..124e03ce18
> > --- /dev/null
> > +++ b/tests/qtest/acpi-bits/acpi-bits-test-venv.sh
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
> > +if [ -z "$QTEST_SOURCE_ROOT" ]; then
> > +    echo -n "Please set QTEST_SOURCE_ROOT env pointing"
> > +    echo " to the root of the qemu source tree."
> > +    echo -n "This is required so that the test can find the "
> > +    echo "python modules that it needs for execution."
> > +    exit 1
> > +fi
> > +SRCDIR=$QTEST_SOURCE_ROOT
> > +TESTSCRIPTS=("acpi-bits-test.py")
> > +PIPCMD="-m pip -q --disable-pip-version-check"
> > +# we need to save the old value of PWD before we do a change-dir later
> > +QTEST_PWD=$PWD
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
> > +    $TESTS_PYTHON $PIPCMD install -r $TESTS_VENV_REQ
> > +
> > +# venv is activated at this point.
> > +
> > +# run the test
> > +for testscript in ${TESTSCRIPTS[@]} ; do
> > +    export QTEST_PWD; python3 $testscript
> > +done
> > +
> > +cd $QTEST_PWD
> > +
> > +exit 0
> > diff --git a/tests/qtest/acpi-bits/acpi-bits-test.py b/tests/qtest/acpi-bits/acpi-bits-test.py
> > new file mode 100644
> > index 0000000000..673567bf8e
> > --- /dev/null
> > +++ b/tests/qtest/acpi-bits/acpi-bits-test.py
> > @@ -0,0 +1,327 @@
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
> > +import zipfile
> > +from typing import (
> > +    List,
> > +    Optional,
> > +    Sequence,
> > +)
> > +from tap import TAPTestRunner
> > +from qemu.machine import QEMUMachine
> > +
> > +QTESTQEMUPROG = os.getenv('QTEST_QEMU_BINARY')
> > +QTEST_PWD = os.getenv('QTEST_PWD')
> > +
> > +def get_arch():
> > +    """finds the arch from the qemu binary name"""
> > +    match = re.search('.*qemu-system-(.*)', QTESTQEMUPROG)
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
>
> So is this patch series *really* related to qtests? qtests are using a
> special "accelerator" mode of QEMU where it gets launched with the "-qtest"
> parameter. I can't see that you're using "-qtest" here or anywhere else, so
> this rather looks like another framework to me to run python-based QEMU
> tests (similar to the avocado tests).

yes you are right. This does not use or need the qtest accelerator
because we are not inspecting the guest memory for anything.

>
> Thus if this is really not related to qtests, may I suggest to move this
> into another folder instead? Maybe tests/pytests/acpi-bits or something similar?

The problem I faced with this test is that it does not quite fall into
the qtest category. Nor does it fall into the integration test
category. I asked Igor and he suggested I use the qtest framework.
Should we invent a new class of tests then? How many such tests are we
going to have in the future?  Lets see what others think.

>
>   Thomas
>

