Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639545F9ECB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 14:37:05 +0200 (CEST)
Received: from localhost ([::1]:39352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohs1n-0007k7-Tj
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 08:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohrxE-0005pB-Kn
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 08:32:30 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:46625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohrxC-0003KY-21
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 08:32:19 -0400
Received: by mail-io1-xd34.google.com with SMTP id n73so3471507iod.13
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 05:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kTcfRl2f7CT4FVmCj3DSCrpQ+4WT70SD0chnFx1+i0g=;
 b=cDx6cpSctTcpxQJ+36jto7gC07Z/mGqX7u/ogotmkKLCzz/gwnKkKv8gN+jC/Gn4Wa
 /GkHLOCFc/R9glI490FBQ7o7IZgOUZuAVEZQJZizM4Se69yH7prZtINI0N5nh2HBqugz
 ELWLjR2RY9soYIy6WBk5z7JfERN0jBXxJwJs/ccJfxwt7b+neHKWYzd3XlZuyfhuV27L
 n7AXGPV4rQAYThW1Cjd8vvi7V4yyKsvE0XHV8QaL9EaBVU++hwxpq1+7kYGp067e2w+r
 dMiYWKGpNJXQVphlk9nD1ewcO8gS+CSuL3Jic/4X+CxXfbL8KumrJSsS4ovVC3turO0D
 16Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTcfRl2f7CT4FVmCj3DSCrpQ+4WT70SD0chnFx1+i0g=;
 b=UhasM3YauM88HoOIxNgc/ZgCG2ndm/gMtjcQiw5+BK+z8eYnscTZSY+VeG80CfQXOY
 PH5hfVOqSyQ2mkiZ3oGYpDVgYaRlJLhcNHXGhAST2iDQBraNWGXci4bVpdu0opvITnE1
 rk5U4em6nZZ2Uq8FPM5ZXJFOJTGv9ZPeZr6cJ/wb5kXO0rU/fGC1c6QvGhADCe0qIrGG
 yfcPLsJBRPOkGXCdPA3bJioyQbh367qlAFX0c2ouWg2QRE4m6cP61pzt6XcC7nPvraQn
 FYkWxJTVq04BeDwZBM2HLOrjlgDqy3rkZb+dH0f+obKnH22rY96nrSNfLo/YVaNCQhbu
 ZHJw==
X-Gm-Message-State: ACrzQf3i7UyQe2SeO1RK7ESjRHcT+6TaFxyJ/BtkEkp7d4dupxoy7Th8
 o+lvxL2kKGq30gIP07l3rl5K+i+Z1iUDKAmdFoBGNtktzFA=
X-Google-Smtp-Source: AMsMyM6YuxKq5l9YzU7eOwbSJLvmwkuNAgH5OhUiifjdRfuG6gHVGFa+vcTG7wlUbNOdWG+gHh5zDlwbZTNLNBvdd4k=
X-Received: by 2002:a05:6638:25c5:b0:35a:69fd:946e with SMTP id
 u5-20020a05663825c500b0035a69fd946emr9989065jat.174.1665405136043; Mon, 10
 Oct 2022 05:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221010075619.4147111-2-ani@anisinha.ca>
 <20221010075619.4147111-9-ani@anisinha.ca>
In-Reply-To: <20221010075619.4147111-9-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 10 Oct 2022 18:02:04 +0530
Message-ID: <CAARzgwy+CW_7HyabkS+7a4KOQNWE6TpEjqh9LDn8P4g6XtL3vQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] acpi/tests/avocado/bits: add acpi and smbios
 avocado tests that uses biosbits
To: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: mst@redhat.com, imammedo@redhat.com, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd34.google.com
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

On Mon, Oct 10, 2022 at 1:27 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> This introduces QEMU acpi/smbios biosbits avocado test which is run
> from within the python virtual environment. When the bios bits tests are =
run,
> bios bits binaries are downloaded from an external repo/location.
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/avocado/acpi-bits.py | 334 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 334 insertions(+)
>  create mode 100644 tests/avocado/acpi-bits.py
>
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> new file mode 100644
> index 0000000000..d4b74b6624
> --- /dev/null
> +++ b/tests/avocado/acpi-bits.py
> @@ -0,0 +1,334 @@
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

<snip>

> +    def parse_log(self):
> +        """parse the log generated by running bits tests and
> +           check for failures.
> +        """
> +        debugconf =3D os.path.join(self._workDir, self._debugcon_log)
> +        log =3D ""
> +        with open(debugconf, 'r', encoding=3D'utf-8') as filehandle:
> +            log =3D filehandle.read()
> +
> +        if os.getenv('V'):
> +            print('\nlogs from biosbits follows:')
> +            print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
\n')
> +            print(log)
> +            print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
\n')

There is a bug here. I unknowingly removed the actual parsing of
failed and passed tests from the bios bits logs. It was present in v2.
I will fix this by re-adding this again in v4.

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

