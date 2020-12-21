Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664A72DFC09
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 13:53:11 +0100 (CET)
Received: from localhost ([::1]:47810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krKgY-0004uX-Fp
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 07:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krKfW-0004F1-1y
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:52:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:57088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krKfT-0001YN-Nj
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:52:05 -0500
X-Gm-Message-State: AOAM530d0OCbgE8s3hy8FYNBFRDcGboUenym1Tr9xxkk01kD6ZW3jwPs
 iIoEQ99mtiJ2TVOZt5Ptir/Gb7nPEpqsXGdgpNA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608555122;
 bh=MFZMyKGRv06CaVhflIYPz0b1KQi4EwJ90NAp6cg0WP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CZoqBmawew63dc3JB+E5IQzm4/saXM/1bXO8HYn91B86Cea94ZbPaQ5ywNLlY0fZI
 oHxiRKveRRe8H2/OhzRtNO7m1XQ+lp4SORz1RAX2pRXMGvAnZjoWI+YGuAzj+MUZPN
 lnHKCAIMR2iIvJ5KMLDDMqGMX7oLZ91laskc24rafEHMeMy6NCkvNOno6XCra+3cLv
 Za1vZfxu/ipCn26vZA7pJPXRj6LSOA7vMI+NfxsUDV1Zn0B9fgORA88D6WesGaU452
 CbQ3m76RvVDnyB9yRT61y+yIwwEksxf7NMU8V6s+S0Fzmun3YJUiiIvEFcfMpS/2Dm
 FeBBGmu58Y1CA==
X-Google-Smtp-Source: ABdhPJwY5qbD/T6f6YMBkRLXJk4SbYN8rWyB378uMnKZ2D5SNUY8X1rWKu1QGX+w5U55JFWoxSPtKvpK4hSZzZxYX6I=
X-Received: by 2002:a92:870b:: with SMTP id m11mr15516956ild.134.1608555121310; 
 Mon, 21 Dec 2020 04:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20201216181759.933527-1-f4bug@amsat.org>
 <ad7ff216-66b9-9b0c-eece-80a294240c28@redhat.com>
In-Reply-To: <ad7ff216-66b9-9b0c-eece-80a294240c28@redhat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Dec 2020 20:51:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7f4Bw_+BLCC0DcrUQKK0nUanQTTQ+a272ADBheB_NBJQ@mail.gmail.com>
Message-ID: <CAAhV-H7f4Bw_+BLCC0DcrUQKK0nUanQTTQ+a272ADBheB_NBJQ@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: Willian Rampazzo <wrampazz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Sat, Dec 19, 2020 at 4:51 AM Willian Rampazzo <wrampazz@redhat.com> wrot=
e:
>
> On 12/16/20 3:17 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Test the PMON firmware. As the firmware is not redistributable,
> > it has to be downloaded manually first. Then it can be used by
> > providing its path via the PMON_PATH environment variable:
A1101 is a real machine type, and there is a UEFI-based bios designed
for loongson3-virt machine (though it is also not redistributable),
why not test that one?

Huacai
> >
> >    $ AVOCADO_ALLOW_UNTRUSTED_CODE=3D1 \
> >      PMON_PATH=3D/images/pmon \
> >      avocado --show=3Dapp,console \
> >        run -t machine:loongson3-virt tests/acceptance
> >    JOB ID     : 363e66a2d20b1c0e3f515653f9137483b83b2984
> >    JOB LOG    : /home/phil/avocado/job-results/job-2020-12-16T19.02-363=
e66a/job.log
> >     (1/2) tests/acceptance/machine_mips_fuloong3.py:MipsFuloong3.test_p=
mon_BLD_serial_console:
> >    console: PMON2000 MIPS Initializing. Standby...
> >    console: 00000000
> >    console: Shut down other cores
> >    console: 0xbfe00190  : 0000000000000000
> >    console: CPU CLK SEL : 00000000
> >    console: MEM CLK SEL : 00000000
> >    console: Change the driver
> >    console: Soft CLK SEL adjust begin
> >    console: HT         :00000000
> >    console: DDR_DIV:00000002
> >    console: BBGEN start  :
> >    console: BBGEN config value  :00000000
> >    console: MC RESET
> >    console: Fix L1xbar illegal access at NODE 0
> >    console: Fix L2xbar in NODE 0
> >    console: 32 bit PCI space translate to 64 bit HT space
> >    console: Waiting HyperTransport bus to be up.
> >    PASS (0.10 s)
> >     (2/2) tests/acceptance/machine_mips_fuloong3.py:MipsFuloong3.test_p=
mon_A1101_serial_console:
> >    console: PMON2000 MIPS Initializing. Standby...
> >    console: 0xbfe00190  : 0000000000000000
> >    console: CPU CLK SEL : 00000000
> >    console: CPU clk frequency =3D SYSCLK x 0x0000001e /  1
> >    console: MEM CLK SEL : 00000000
> >    console: DDR clk frequency =3D MEMCLK x 0x0000001e /  3
> >    console: Fix L1xbar illegal access
> >    console: Fix L2xbar illegal access
> >    console: Init tlb...
> >    console: godson2 caches found
> >    PASS (0.12 s)
> >    RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT=
 0 | CANCEL 0
> >    JOB TIME   : 0.58 s
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > Based-on: <20201215125716.477023-1-chenhuacai@kernel.org>
> > ---
> >   MAINTAINERS                                 |  1 +
> >   tests/acceptance/machine_mips_loongson3v.py | 66 ++++++++++++++++++++=
+
> >   2 files changed, 67 insertions(+)
> >   create mode 100644 tests/acceptance/machine_mips_loongson3v.py
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f75fa2a7142..9a02d44f997 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1166,6 +1166,7 @@ M: Huacai Chen <chenhuacai@kernel.org>
> >   R: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   S: Maintained
> >   F: hw/intc/loongson_liointc.c
> > +F: tests/acceptance/machine_mips_loongson3v.py
> >
> >   Boston
> >   M: Paul Burton <paulburton@kernel.org>
> > diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/accept=
ance/machine_mips_loongson3v.py
> > new file mode 100644
> > index 00000000000..8e698bbc99b
> > --- /dev/null
> > +++ b/tests/acceptance/machine_mips_loongson3v.py
> > @@ -0,0 +1,66 @@
> > +# Functional tests for the Generic Loongson-3 Platform.
> > +#
> > +# Copyright (c) 2020 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2 or l=
ater.
> > +# See the COPYING file in the top-level directory.
> > +#
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +import os
> > +import time
> > +
> > +from avocado import skipUnless
> > +from avocado_qemu import Test
> > +from avocado_qemu import wait_for_console_pattern
> > +
> > +class MipsFuloong3(Test):
> > +
> > +    timeout =3D 60
> > +
> > +    @skipUnless(os.getenv('PMON_PATH'), 'PMON_PATH not available')
> > +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted =
code')
> > +    def test_pmon_BLD_serial_console(self):
> > +        """
> > +        :avocado: tags=3Darch:mips64el
> > +        :avocado: tags=3Dendian:little
> > +        :avocado: tags=3Dmachine:loongson3-virt
> > +        :avocado: tags=3Dcpu:Loongson-3A1000
> > +        :avocado: tags=3Ddevice:liointc
> > +        :avocado: tags=3Ddevice:goldfish_rtc
> > +        """
> > +        pmon_name =3D 'pmon_BLD-3A3000-780EMATX-1w-V1.10.bin'
> > +        pmon_hash =3D '38916ee03ed09a86997b40c687c83e92'
>
> In case you keep this approach of manually downloading the binary, it
> would be good to have a pointer (url) to it to avoid download of an
> incorrect binary that will not match the hash here.
>
> > +        pmon_path =3D self.fetch_asset('file://' + os.path.join(
> > +                                        os.getenv('PMON_PATH'), pmon_n=
ame),
> > +                                     asset_hash=3Dpmon_hash, algorithm=
=3D'md5')
> > +
> > +        self.vm.set_console()
> > +        self.vm.add_args('-bios', pmon_path)
> > +        self.vm.launch()
> > +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. St=
andby...')
> > +        wait_for_console_pattern(self, 'Shut down other cores')
> > +        wait_for_console_pattern(self, 'Waiting HyperTransport bus to =
be up.')
> > +
> > +    @skipUnless(os.getenv('PMON_PATH'), 'PMON_PATH not available')
> > +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted =
code')
> > +    def test_pmon_A1101_serial_console(self):
> > +        """
> > +        :avocado: tags=3Darch:mips64el
> > +        :avocado: tags=3Dendian:little
> > +        :avocado: tags=3Dmachine:loongson3-virt
> > +        :avocado: tags=3Dcpu:Loongson-3A1000
> > +        :avocado: tags=3Ddevice:liointc
> > +        :avocado: tags=3Ddevice:goldfish_rtc
> > +        """
> > +        pmon_name =3D 'pmon-A1101-2.0.8.bin'
>
> Same comment here about the pointer to the binary.
>
> > +        pmon_hash =3D 'cc40276213cfa20922720f183b92ab61'
> > +        pmon_path =3D self.fetch_asset('file://' + os.path.join(
> > +                                        os.getenv('PMON_PATH'), pmon_n=
ame),
> > +                                     asset_hash=3Dpmon_hash, algorithm=
=3D'md5')
> > +
> > +        self.vm.set_console()
> > +        self.vm.add_args('-bios', pmon_path)
> > +        self.vm.launch()
> > +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. St=
andby...')
> > +        wait_for_console_pattern(self, 'godson2 caches found')
> >
>
> Inspite of a small comment,
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>

