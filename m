Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE9660672F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:40:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZWg-0006Ia-K0
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:40:14 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZWe-0007CK-9X
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZWH-0004px-IQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:39:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZWC-0003GI-S6
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:39:49 -0400
Received: by mail-wr1-x433.google.com with SMTP id f11so116317wrm.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 10:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NztC5PqFZGLXNv4XkIWyf4APF9DxdXBVFikzgY9sXQ=;
 b=pUVlrvaZNKkQWVdRVgNYcYgfHR08PoIFOf4YdvtC4dU20ilGqa/xJ8GS5wPUzAhsnR
 EzXwZ3ZSu0gzin7l/o/EmxGntpjXxuQ7AggMdyR6zAVmzxFvx/mM7efnPyb+gQdtGS+1
 9QBJxPIMQLb7gq8ACo9gxdWQFc5hxUrnBV896VfxaHbmfyxYT7ZskfsqwVe/pKuWOYlR
 8GUZQbHtFqwyRqQrR/xwPvV4HvcelhNBIHBFNeghLMRj6mRv70tWfMAXgWb8BQXW2FYV
 1jmLsQjMMFsghmmRxzWiJsQ5XB0BGRwKSraBbv+KvrY71jCOZQOl8E7jJsf+P0kEyCIi
 jPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0NztC5PqFZGLXNv4XkIWyf4APF9DxdXBVFikzgY9sXQ=;
 b=Ip81DkHBYi/JFma/tLL46nQy9R1zB8M141ROeXPSnsV/7537QPZ1Ik7gyqMXxgBdh/
 13M6KxsImIF2H9hE7S+DOwSiZVlSTLlLAU49NUXNr5tLNsZPNPxvXzQcabhnTlCeNB5h
 LMrYjOxAdTx5Pwn1fqNCr3VJNfYrHmOiQweMSasC6bKGEEUyshM3vEPEAArlJLlY91Ji
 1AizwttqnsGWyfekrXVZkM9ycbfw6M9euld9YfHoSFnCXFxECjCKQ56GXaLO4biw12/y
 A5K1IxGNAph7dXZHIaSZf7lFMkNezda7V9HtvOqg9OEImgFzeXuEqSkN/4up7y7xZTPl
 QBwA==
X-Gm-Message-State: ACrzQf3PwQNi+KvpR+eO+nScKIkl83bdQjrxGAKPJcf1HhmE11dux7s2
 zUvW2awbfgBcs+RZ0THo9BphlQ==
X-Google-Smtp-Source: AMsMyM7srU/TgEoa83XDLyFa5/I2smnFxBp7v/0qxtIQKUUAnqnApyEqs2gJM/bq4EACFQRkDmSOQA==
X-Received: by 2002:a5d:590d:0:b0:236:4ddd:1869 with SMTP id
 v13-20020a5d590d000000b002364ddd1869mr1163325wrd.709.1666287579693; 
 Thu, 20 Oct 2022 10:39:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b7-20020adfe307000000b0022cbf4cda62sm20571305wrj.27.2022.10.20.10.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 10:39:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0C521FFB7;
 Thu, 20 Oct 2022 18:39:38 +0100 (BST)
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020123506.26363-9-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 08/10] acpi/tests/avocado/bits: add acpi and smbios
 avocado tests that uses biosbits
Date: Thu, 20 Oct 2022 18:30:21 +0100
In-reply-to: <20221020123506.26363-9-ani@anisinha.ca>
Message-ID: <871qr28kdh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Ani Sinha <ani@anisinha.ca> writes:

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
>  tests/avocado/acpi-bits.py | 389 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 389 insertions(+)
>  create mode 100644 tests/avocado/acpi-bits.py
>
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> new file mode 100644
> index 0000000000..14d453e3ad
> --- /dev/null
> +++ b/tests/avocado/acpi-bits.py
> @@ -0,0 +1,389 @@
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
> +import platform
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
> +deps =3D ["xorriso"] # dependent tools needed in the test setup/box.
> +supported_platforms =3D ['x86_64'] # supported test platforms.
> +
> +def _print_log(log):
> +    print('\nlogs from biosbits follows:')
> +    print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n')
> +    print(log)
> +    print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n')

Please log to avocado itself using the logger() functions otherwise this
ends up polluting stdout rather than going into the test log.

> +
> +def which(tool):
> +    """ looks up the full path for @tool, returns None if not found
> +        or if @tool does not have executable permissions.
> +    """
> +    paths=3Dos.getenv('PATH')
> +    for p in paths.split(os.path.pathsep):
> +        p =3D os.path.join(p, tool)
> +        if os.path.exists(p) and os.access(p, os.X_OK):
> +            return p
> +    return None
> +
> +def missing_deps():
> +    """ returns True if any of the test dependent tools are absent.
> +    """
> +    for dep in deps:
> +        if which(dep) is None:
> +            return True
> +    return False
> +
> +def supported_platform():
> +    """ checks if the test is running on a supported platform.
> +    """
> +    return platform.machine() in supported_platforms
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
> +@skipIf(not supported_platform() or missing_deps() or os.getenv('GITLAB_=
CI'),
> +        'incorrect platform or dependencies (%s) not installed ' \
> +        'or running on GitLab' % ','.join(deps))
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
> +                if os.access(os.path.join(target_test_dir, testfile_pyc),
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
> +            the directory where we have extracted our pre-built bits grub
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

logging() and logging.debug can be used here.

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


--=20
Alex Benn=C3=A9e

