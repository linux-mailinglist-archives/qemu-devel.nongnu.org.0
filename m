Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D7814EB45
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 11:47:46 +0100 (CET)
Received: from localhost ([::1]:51192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixTpw-0003sd-KZ
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 05:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixToL-0003Fg-VO
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 05:46:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixTnz-00034z-SH
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 05:46:05 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:36282)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixTnz-0002z1-Nr
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 05:45:43 -0500
Received: by mail-yw1-f66.google.com with SMTP id n184so4221853ywc.3
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 02:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s0k44jyvObwUOpLkbbKSS63Yxc+GYoKpHc6GRQ2a9Zk=;
 b=sBKcYaHDGoJvs5njfNtq4zioOjGRYZ+lX+Bmi3Rs82aOTBiOVykUqQQKFGVwZiQ+Tz
 8FommhKolO4WEkPyj95Ul15rVuKfoOBnXnNQqwJHjCqwr7fMsWAtNeqzlRr1zp+uVdPt
 9cZQpr9TWRtTNGd0ZnAmWByYPyB8/BdTqjizx1+/iB+hcIKhIZw5U+ArpUzG0EhkV+Gw
 cQL1LyiIuRvYdKeZe4kbKMv0ajO6fv2E9fGye0ZB35lxoCNiiEgjrh5dssVJXPgdnj5H
 PbNGuXXwnTVCQSX1j4FshsVkBWk+uWz0pMQMcD71/5NIcKZxclfnTvaXUMIDPzjxsE9F
 tAbw==
X-Gm-Message-State: APjAAAXpCBiw6I16B9nWGAVNCYJca9ebC+D00PI5puGTx5bGfm5kBsdP
 uVTJFy6e9ZT+tukfb36wMAiB3kXDdV1wFttgZQs=
X-Google-Smtp-Source: APXvYqxn7c6kX0moq9EZFu2NN4r9d0DGQ/oS18TQjsenAHfQeU7EjtEqaw3I7fvBlcR1eUAqSNo9xvpWM2s1l0cmxA4=
X-Received: by 2002:a0d:d84b:: with SMTP id a72mr6852734ywe.33.1580467539395; 
 Fri, 31 Jan 2020 02:45:39 -0800 (PST)
MIME-Version: 1.0
References: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1580428993-4767-25-git-send-email-aleksandar.markovic@rt-rk.com>
 <CAL1e-=j3b6Gfo4K56=tXc9jbXAy3fou5Dsxq3ns9C89mpuPXxA@mail.gmail.com>
 <CAAdtpL6F=qbWT7keQxHtacndN+JUM32tyd9vW0ZEEMYYN=a=3g@mail.gmail.com>
 <CAL1e-=hqWdFckhi30iws0_OMEB01dvs=ARTvpWrAJ4bF5qrKbQ@mail.gmail.com>
 <CAL1e-=i-=NkATmB0XJ12mGBOin-OGZ5VMc1BD3O1iheNfbhBAQ@mail.gmail.com>
 <91e475a8-ba43-05da-73d1-d59ca28228bf@redhat.com>
 <CAL1e-=hCY+WRva59fkQCFaeCkoBJNqyLW-Y7HNiRZRJ07w4AwQ@mail.gmail.com>
In-Reply-To: <CAL1e-=hCY+WRva59fkQCFaeCkoBJNqyLW-Y7HNiRZRJ07w4AwQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 31 Jan 2020 11:45:27 +0100
Message-ID: <CAAdtpL5r2m6Y6NVG=Y0KV58Q-OunHPqUi12Rqwgr5pdxhaS0Cg@mail.gmail.com>
Subject: Re: [PATCH rc4 24/29] hw/avr: Add some ATmega microcontrollers
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.161.66
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
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 31, 2020 at 10:40 AM Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
> On Fri, Jan 31, 2020 at 10:35 AM Thomas Huth <thuth@redhat.com> wrote:
> > On 31/01/2020 05.11, Aleksandar Markovic wrote:
> > > On Fri, Jan 31, 2020 at 4:45 AM Aleksandar Markovic
> > > <aleksandar.m.mail@gmail.com> wrote:
> > >>
> > >> On Fri, Jan 31, 2020 at 4:09 AM Philippe Mathieu-Daud=C3=A9 <f4bug@a=
msat.org> wrote:
> > >>>
> > >>> Hi Aleksandar,
> > >>>
> > >>> Cc'ing Thomas & Daniel who are not lawyers but tried to explain me =
few
> > >>> times how licensing works.
> > >>>
> > >>> On Fri, Jan 31, 2020 at 2:56 AM Aleksandar Markovic
> > >>> <aleksandar.m.mail@gmail.com> wrote:
> > >>>> On Fri, Jan 31, 2020 at 1:03 AM Aleksandar Markovic
> > >>>> <aleksandar.markovic@rt-rk.com> wrote:
> > >>>>>
> > >>>>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >>>>>
> > >>>>> Add some AVR microcontrollers from the ATmega family:
> > >>>>>
> > >>>>>   - middle range: ATmega168 and ATmega328
> > >>>>>   - high range: ATmega1280 and ATmega2560
> > >>>>>
> > >>>>> For product comparison:
> > >>>>>   https://www.microchip.com/wwwproducts/ProductCompare/ATmega168P=
/ATmega328P
> > >>>>>   https://www.microchip.com/wwwproducts/ProductCompare/ATmega1280=
/ATmega2560
> > >>>>>
> > >>>>> Datasheets:
> > >>>>>   http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega48A-PA-88=
A-PA-168A-PA-328-P-DS-DS40002061A.pdf
> > >>>>>   http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2549-8-bi=
t-AVR-Microcontroller-ATmega640-1280-1281-2560-2561_datasheet.pdf
> > >>>>>
> > >>>>> [AM: Remove word 'Atmel' from filenames and all elements of code]
> > >>>>> Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> > >>>>>
> > >>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > >>>>> Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> > >>>>> ---
> > >>>>>  hw/avr/Kconfig       |   5 +
> > >>>>>  hw/avr/Makefile.objs |   1 +
> > >>>>>  hw/avr/atmega.c      | 470 +++++++++++++++++++++++++++++++++++++=
++++++++++++++
> > >>>>>  hw/avr/atmega.h      |  48 ++++++
> > >>>>>  4 files changed, 524 insertions(+)
> > >>>>>  create mode 100644 hw/avr/Kconfig
> > >>>>>  create mode 100644 hw/avr/atmega.c
> > >>>>>  create mode 100644 hw/avr/atmega.h
> > >>>>>
> > >>>>> diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
> > >>>>> new file mode 100644
> > >>>>> index 0000000..9e6527e
> > >>>>> --- /dev/null
> > >>>>> +++ b/hw/avr/Kconfig
> > >>>>> @@ -0,0 +1,5 @@
> > >>>>> +config AVR_ATMEGA_MCU
> > >>>>> +    bool
> > >>>>> +    select AVR_TIMER16
> > >>>>> +    select AVR_USART
> > >>>>> +    select AVR_POWER
> > >>>>> diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
> > >>>>> index 123f174..af0fdde 100644
> > >>>>> --- a/hw/avr/Makefile.objs
> > >>>>> +++ b/hw/avr/Makefile.objs
> > >>>>> @@ -1 +1,2 @@
> > >>>>>  obj-y +=3D boot.o
> > >>>>> +obj-$(CONFIG_AVR_ATMEGA_MCU) +=3D atmega.o
> > >>>>> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> > >>>>> new file mode 100644
> > >>>>> index 0000000..8cdf28b
> > >>>>> --- /dev/null
> > >>>>> +++ b/hw/avr/atmega.c
> > >>>>> @@ -0,0 +1,470 @@
> > >>>>> +/*
> > >>>>> + * QEMU ATmega MCU
> > >>>>> + *
> > >>>>> + * Copyright (c) 2019 Philippe Mathieu-Daud=C3=A9
> > >>>>> + *
> > >>>>> + * This work is licensed under the terms of the GNU GPLv2 or lat=
er.
> > >>>>> + * See the COPYING file in the top-level directory.
> > >>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
> > >>>>> + */
> > >>>>
> > >>>> Philippe,
> > >>>>
> > >>>> Michael and I already agreed at some moment that the whole target =
AVR
> > >>>> should have harmonized licenses, and Sarrah agreed to change her
> > >>>> license to achieve this. Do you agree to harmonize your licenses w=
ith
> > >>>> the rest of the project? (This would mean changing the preable, bu=
t of
> > >>>> course you remain copyright carrier as is now.)

Note I'm not worried about my authorship but than other contributors
being able to reuse and modify this code.

> > >>>
> > >>> What license do you want to use? I always use "GPLv2 or later" with
> > >>> QEMU, mostly following what the others do.
> > >>>
> > >>> Per https://wiki.qemu.org/License:
> > >>>
> > >>>   Source files with no licensing information are released under the
> > >>> GNU General Public License, version 2 or (at your option) any later
> > >>> version.
> > >>>
> > >>> Reading about licensing is not fun :(
> > >>>
> > >>
> > >> Philippe, here is the deal: All new files for AVR platform has the
> > >> following preamble, that Michael chose from the outset:
> > >>
> > >> + * This library is free software; you can redistribute it and/or
> > >> + * modify it under the terms of the GNU Lesser General Public
> > >> + * License as published by the Free Software Foundation; either
> > >> + * version 2.1 of the License, or (at your option) any later versio=
n.
> > >> + *
> > >> + * This library is distributed in the hope that it will be useful,
> > >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GN=
U
> > >> + * Lesser General Public License for more details.
> > >> + *
> > >> + * You should have received a copy of the GNU Lesser General Public
> > >> + * License along with this library; if not, see
> > >> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> > >>
> > >> Now, it is preferable that licenses are harmonized within a module,
> > >> and I ask you to change the preamble to be the same as the rest of t=
he
> > >> module, that is all. This practically means LGPL2.1+later instead
> > >> LGPL2.0+later. I think it is reasonable that we want to simplify out
> > >> license stuff, not complicate it with different licenses within a
> > >> module. There are examples of complications in cases of different
> > >> license within the same module, so it would be ideal if we avoid suc=
h
> > >> situations.

I don't use QEMU as a library, it is my main application.
I tried to make this file clean/easy to read so it can be reused by
other archs when implementing boards able to use multiple SoCs, this
is not AVR-only.

I see LGPLv2.1 is deprecated for version 3, why use 2.1?

https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html

```
You can use it too, but we suggest you first think carefully about
whether this license or the ordinary General Public License is the
better strategy to use in any particular case, based on the
explanations below.
...
Most GNU software, including some libraries, is covered by the
ordinary GNU General Public License. This license, the GNU Lesser
General Public License, applies to certain designated libraries, and
is quite different from the ordinary General Public License. We use
this license for certain libraries in order to permit linking those
libraries into non-free programs.
```

Personally I don't care about non-free programs using QEMU as a
library, and I don't think a such program would use the default QEMU
config anyway.

You can build the AVR (tcg) cpus without GPLv2+ hardware with this patch:

---
--- a/default-configs/avr-softmmu.mak
+++ b/default-configs/avr-softmmu.mak
@@ -2,4 +2,4 @@

 # Boards:
 #
-CONFIG_ARDUINO=3Dy
+CONFIG_ARDUINO=3Dn
---

But I doubt you can build QEMU without GPLv2+ components.

See also:
https://www.gnu.org/licenses/why-not-lgpl.html

```
Which license is best for a given library is a matter of strategy ...
Using the ordinary GPL for a library gives free software developers an
advantage over proprietary developers: a library that they can use,
while proprietary developers cannot use it ... When a free library's
features are readily available for proprietary software through other
alternative libraries ... the library cannot give free software any
particular advantage, so it is better to use the Lesser GPL for that
library.
```

> > > I didn't mean to scare you, I am just a developer like you, and I wan=
t
> > > to avoid thinking about licenses, and think of our real work, so, I
> > > gather, in my layman terms, it is better to have the same license for
> > > the new platform in its entirety, if possible, that is all. :)
> >
> > This is all part of QEMU, and QEMU is licensed under the GPLv2. If
> > someone wants to use a less strict license for their own code that is
> > still compatible with the GPLv2, like the LGPLv2.1, that's fine. But I
> > think if Philippe does not like to release his code under the LGPL, and
> > wants to use GPL instead, you can not force him to use LGPL here. It's
> > the decision of Philippe what he wants to use for his code.
> >
>
> It is his decision, but it can be reasonable or not so reasonable. I
> think it is logical that he follows the license model of the module he
> contributes to, isn't it?
>
> Aleksandar
>
> >  Thomas
> >

