Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E9B14EA34
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 10:41:54 +0100 (CET)
Received: from localhost ([::1]:50634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixSoD-00084v-Uq
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 04:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ixSn9-0007BV-Eg
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 04:40:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ixSn7-0006Qa-Qr
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 04:40:47 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:32791)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ixSn7-0006Q1-Jq
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 04:40:45 -0500
Received: by mail-ot1-x341.google.com with SMTP id b18so6034777otp.0
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 01:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5iwrAXkH8v6grgeLv0GLBpeko/kXNodpSmGQOyGJ5xs=;
 b=eo/643r6SutQl+5HAs/nRBnXDicfMOAtha9MtZyy6w0i1VKkz4aLkho/lwoDD2XN/d
 UsvYytb52GsmET15U+TcWXtIZVoT1vxvcFbBg4IknuemdfHTN/CGdc25U5n+S0ozjXcR
 oiTFl0HJ1U1jXnRqRFqykdSpQlC0F8d3Jblgkq+lmzGgNxOod5gdP6QRxVmhFG/6Bj29
 JxnruvO9CVZ8tnPLoR6o01/w+VFfja4UO6PtYpt3tH+/HcV8CdYyfe4ima2Ky0dyuLIx
 cZ5fdhcGQ9BFV/WDUM9crOXuwBC7OHGoTYyVdV8MsjcwClhJ6RoQ5lkJaYCpnpgrgRQY
 x/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5iwrAXkH8v6grgeLv0GLBpeko/kXNodpSmGQOyGJ5xs=;
 b=PMZnkU+0VPddG7T9urpdJBY13DRt8mZtHvhk2FSqIF8d//lpcReel3Q7Mnr0GlgkdK
 qfjBDdIgrKVVx6oOn6ElJhBygweWTpqRhagpmk+P2YiGd/72fSPifJ89sIgYgy2DpSrh
 ICwKAkaRrGfn1F5jz3dUT+dyAGcaERAvCQgdZQcSFXpDSqBx3LtxG+q+heVJI4cNvrQ7
 Alwp4CGk/9slFc3ZDXDVLpsGM+S2sBH3eLFMWbUm/jOqgrMvzJM1mwKxme6zg6NGfKWx
 BYS5HuQkcMDLHrCgPD/SYs7Omx4tN4tq2gJv5Pwo4xVDvVB9Ze/hRVIAqbrsvlXwWZZx
 Mtsw==
X-Gm-Message-State: APjAAAXz8bfxwDihR+Yi1hU+uZyeB7BaoJWrXQThRaHEV0yyiOdJ24bI
 rjfKp3K+5hw4GnY5ArC3Zym2UHJ+KNoaXxzXDE0=
X-Google-Smtp-Source: APXvYqwcW7m87NF0FlCmTxjelWUDsZWvuzb6HorFwLuhjbvCa7CVsxlQ9wPqtyLCYE6Lul7HTPdMfSM2RcNhNJXOx+k=
X-Received: by 2002:a9d:7305:: with SMTP id e5mr6684768otk.64.1580463644648;
 Fri, 31 Jan 2020 01:40:44 -0800 (PST)
MIME-Version: 1.0
References: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1580428993-4767-25-git-send-email-aleksandar.markovic@rt-rk.com>
 <CAL1e-=j3b6Gfo4K56=tXc9jbXAy3fou5Dsxq3ns9C89mpuPXxA@mail.gmail.com>
 <CAAdtpL6F=qbWT7keQxHtacndN+JUM32tyd9vW0ZEEMYYN=a=3g@mail.gmail.com>
 <CAL1e-=hqWdFckhi30iws0_OMEB01dvs=ARTvpWrAJ4bF5qrKbQ@mail.gmail.com>
 <CAL1e-=i-=NkATmB0XJ12mGBOin-OGZ5VMc1BD3O1iheNfbhBAQ@mail.gmail.com>
 <91e475a8-ba43-05da-73d1-d59ca28228bf@redhat.com>
In-Reply-To: <91e475a8-ba43-05da-73d1-d59ca28228bf@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 31 Jan 2020 10:40:33 +0100
Message-ID: <CAL1e-=hCY+WRva59fkQCFaeCkoBJNqyLW-Y7HNiRZRJ07w4AwQ@mail.gmail.com>
Subject: Re: [PATCH rc4 24/29] hw/avr: Add some ATmega microcontrollers
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 31, 2020 at 10:35 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 31/01/2020 05.11, Aleksandar Markovic wrote:
> > On Fri, Jan 31, 2020 at 4:45 AM Aleksandar Markovic
> > <aleksandar.m.mail@gmail.com> wrote:
> >>
> >> On Fri, Jan 31, 2020 at 4:09 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>>
> >>> Hi Aleksandar,
> >>>
> >>> Cc'ing Thomas & Daniel who are not lawyers but tried to explain me fe=
w
> >>> times how licensing works.
> >>>
> >>> On Fri, Jan 31, 2020 at 2:56 AM Aleksandar Markovic
> >>> <aleksandar.m.mail@gmail.com> wrote:
> >>>> On Fri, Jan 31, 2020 at 1:03 AM Aleksandar Markovic
> >>>> <aleksandar.markovic@rt-rk.com> wrote:
> >>>>>
> >>>>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>>>>
> >>>>> Add some AVR microcontrollers from the ATmega family:
> >>>>>
> >>>>>   - middle range: ATmega168 and ATmega328
> >>>>>   - high range: ATmega1280 and ATmega2560
> >>>>>
> >>>>> For product comparison:
> >>>>>   https://www.microchip.com/wwwproducts/ProductCompare/ATmega168P/A=
Tmega328P
> >>>>>   https://www.microchip.com/wwwproducts/ProductCompare/ATmega1280/A=
Tmega2560
> >>>>>
> >>>>> Datasheets:
> >>>>>   http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega48A-PA-88A-=
PA-168A-PA-328-P-DS-DS40002061A.pdf
> >>>>>   http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2549-8-bit-=
AVR-Microcontroller-ATmega640-1280-1281-2560-2561_datasheet.pdf
> >>>>>
> >>>>> [AM: Remove word 'Atmel' from filenames and all elements of code]
> >>>>> Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> >>>>>
> >>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >>>>> Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> >>>>> ---
> >>>>>  hw/avr/Kconfig       |   5 +
> >>>>>  hw/avr/Makefile.objs |   1 +
> >>>>>  hw/avr/atmega.c      | 470 +++++++++++++++++++++++++++++++++++++++=
++++++++++++
> >>>>>  hw/avr/atmega.h      |  48 ++++++
> >>>>>  4 files changed, 524 insertions(+)
> >>>>>  create mode 100644 hw/avr/Kconfig
> >>>>>  create mode 100644 hw/avr/atmega.c
> >>>>>  create mode 100644 hw/avr/atmega.h
> >>>>>
> >>>>> diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
> >>>>> new file mode 100644
> >>>>> index 0000000..9e6527e
> >>>>> --- /dev/null
> >>>>> +++ b/hw/avr/Kconfig
> >>>>> @@ -0,0 +1,5 @@
> >>>>> +config AVR_ATMEGA_MCU
> >>>>> +    bool
> >>>>> +    select AVR_TIMER16
> >>>>> +    select AVR_USART
> >>>>> +    select AVR_POWER
> >>>>> diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
> >>>>> index 123f174..af0fdde 100644
> >>>>> --- a/hw/avr/Makefile.objs
> >>>>> +++ b/hw/avr/Makefile.objs
> >>>>> @@ -1 +1,2 @@
> >>>>>  obj-y +=3D boot.o
> >>>>> +obj-$(CONFIG_AVR_ATMEGA_MCU) +=3D atmega.o
> >>>>> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> >>>>> new file mode 100644
> >>>>> index 0000000..8cdf28b
> >>>>> --- /dev/null
> >>>>> +++ b/hw/avr/atmega.c
> >>>>> @@ -0,0 +1,470 @@
> >>>>> +/*
> >>>>> + * QEMU ATmega MCU
> >>>>> + *
> >>>>> + * Copyright (c) 2019 Philippe Mathieu-Daud=C3=A9
> >>>>> + *
> >>>>> + * This work is licensed under the terms of the GNU GPLv2 or later=
.
> >>>>> + * See the COPYING file in the top-level directory.
> >>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
> >>>>> + */
> >>>>
> >>>> Philippe,
> >>>>
> >>>> Michael and I already agreed at some moment that the whole target AV=
R
> >>>> should have harmonized licenses, and Sarrah agreed to change her
> >>>> license to achieve this. Do you agree to harmonize your licenses wit=
h
> >>>> the rest of the project? (This would mean changing the preable, but =
of
> >>>> course you remain copyright carrier as is now.)
> >>>
> >>> What license do you want to use? I always use "GPLv2 or later" with
> >>> QEMU, mostly following what the others do.
> >>>
> >>> Per https://wiki.qemu.org/License:
> >>>
> >>>   Source files with no licensing information are released under the
> >>> GNU General Public License, version 2 or (at your option) any later
> >>> version.
> >>>
> >>> Reading about licensing is not fun :(
> >>>
> >>
> >> Philippe, here is the deal: All new files for AVR platform has the
> >> following preamble, that Michael chose from the outset:
> >>
> >> + * This library is free software; you can redistribute it and/or
> >> + * modify it under the terms of the GNU Lesser General Public
> >> + * License as published by the Free Software Foundation; either
> >> + * version 2.1 of the License, or (at your option) any later version.
> >> + *
> >> + * This library is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> + * Lesser General Public License for more details.
> >> + *
> >> + * You should have received a copy of the GNU Lesser General Public
> >> + * License along with this library; if not, see
> >> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> >>
> >> Now, it is preferable that licenses are harmonized within a module,
> >> and I ask you to change the preamble to be the same as the rest of the
> >> module, that is all. This practically means LGPL2.1+later instead
> >> LGPL2.0+later. I think it is reasonable that we want to simplify out
> >> license stuff, not complicate it with different licenses within a
> >> module. There are examples of complications in cases of different
> >> license within the same module, so it would be ideal if we avoid such
> >> situations.
> >>
> >
> > I didn't mean to scare you, I am just a developer like you, and I want
> > to avoid thinking about licenses, and think of our real work, so, I
> > gather, in my layman terms, it is better to have the same license for
> > the new platform in its entirety, if possible, that is all. :)
>
> This is all part of QEMU, and QEMU is licensed under the GPLv2. If
> someone wants to use a less strict license for their own code that is
> still compatible with the GPLv2, like the LGPLv2.1, that's fine. But I
> think if Philippe does not like to release his code under the LGPL, and
> wants to use GPL instead, you can not force him to use LGPL here. It's
> the decision of Philippe what he wants to use for his code.
>

It is his decision, but it can be reasonable or not so reasonable. I
think it is logical that he follows the license model of the module he
contributes to, isn't it?

Aleksandar

>  Thomas
>

