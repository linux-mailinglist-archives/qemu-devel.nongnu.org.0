Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415D414E7AA
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 04:47:00 +0100 (CET)
Received: from localhost ([::1]:48072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixNGk-0007JE-TX
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 22:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ixNFq-0006sM-5i
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 22:46:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ixNFo-0003ri-55
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 22:46:01 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42767)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ixNFo-0003rD-03
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 22:46:00 -0500
Received: by mail-ot1-x343.google.com with SMTP id 66so5299839otd.9
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 19:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DNBA4y8bHv8iCKajimatU39v6YwgTgZT7lKIrHPROGM=;
 b=tp0cg8Aht+Sdw6bSryvCRIS+M3vJj4So5W/yOM8/Y/Q0L4j+fgknpuLP8l2VXB5x0L
 B02LAIOwbno1BHThcEMht8GGsSjeBHJCTPSDlufoir2JT30Xj3Wit0nhTQqfSoVvenBs
 J2Bx5Y/FBAEjznmME7T6NvWhWcNOFOL7SNOUQjnHSZBJ7S3tCzhL4sYA5I/fpHKDYN9Q
 71yX0Dx8uJ8NH2mclyVoQKQ2bX7W1sU1zZ5sKjNcTQX3w/9VLsL/xzJJAX2NM8fFt16H
 abqL8esSgG5e9T8qw0iiyNZEY2PvRGx5d64mt+dQ6KRmP1aq1FvznfC9/zzRsuFyg3yw
 t/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DNBA4y8bHv8iCKajimatU39v6YwgTgZT7lKIrHPROGM=;
 b=IBND6yLDddke8178rxgUXFMw+9Rkl0aHeCUUVt2ExXIh0OzBuo6gAZBDjq177dSgs8
 A9qx8T8lKOiX7h94WV2cZScJjQjzaEyd2ZSBuLBXAD1ynv65y8tveA3/s9nXtjiTGD+P
 1APm29hfL6gpJtSkU7J9BfDWar08NvI5x4jh6q1TgK0gtOMYiPfyybhuHsSB7jatP/69
 0qX0QvIqW/TERdr6LWTibw4ByurvtGdhOYdg7DLrxJJye+cJIg8BSf0X/GibleQnYRsb
 HfshOMrEU16NUzBd6uUDvTxxll5i7dcnWSDKgEnzNeQjmB+a8ffPYqD/tNGA/EKT+Kx+
 td2Q==
X-Gm-Message-State: APjAAAUHgu8t9aGxuPEyTaO/F+7ypcdW4rp45YNM9z4dXXVcJqfIca2n
 Gfw1P2ASTAfohKHXQX13w2HGhXlbDFQKeMj7SPk=
X-Google-Smtp-Source: APXvYqxI9oZaBzNDKX3hYnsOpXKllSvtlif2mYvIGtSIbfefZAcQ+NhiV9z/rGRLazmUp5rwBH+ny+zKpYOdVaPNkvU=
X-Received: by 2002:a9d:6505:: with SMTP id i5mr5805151otl.121.1580442358994; 
 Thu, 30 Jan 2020 19:45:58 -0800 (PST)
MIME-Version: 1.0
References: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1580428993-4767-25-git-send-email-aleksandar.markovic@rt-rk.com>
 <CAL1e-=j3b6Gfo4K56=tXc9jbXAy3fou5Dsxq3ns9C89mpuPXxA@mail.gmail.com>
 <CAAdtpL6F=qbWT7keQxHtacndN+JUM32tyd9vW0ZEEMYYN=a=3g@mail.gmail.com>
In-Reply-To: <CAAdtpL6F=qbWT7keQxHtacndN+JUM32tyd9vW0ZEEMYYN=a=3g@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 31 Jan 2020 04:45:48 +0100
Message-ID: <CAL1e-=hqWdFckhi30iws0_OMEB01dvs=ARTvpWrAJ4bF5qrKbQ@mail.gmail.com>
Subject: Re: [PATCH rc4 24/29] hw/avr: Add some ATmega microcontrollers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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

On Fri, Jan 31, 2020 at 4:09 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Aleksandar,
>
> Cc'ing Thomas & Daniel who are not lawyers but tried to explain me few
> times how licensing works.
>
> On Fri, Jan 31, 2020 at 2:56 AM Aleksandar Markovic
> <aleksandar.m.mail@gmail.com> wrote:
> > On Fri, Jan 31, 2020 at 1:03 AM Aleksandar Markovic
> > <aleksandar.markovic@rt-rk.com> wrote:
> > >
> > > From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >
> > > Add some AVR microcontrollers from the ATmega family:
> > >
> > >   - middle range: ATmega168 and ATmega328
> > >   - high range: ATmega1280 and ATmega2560
> > >
> > > For product comparison:
> > >   https://www.microchip.com/wwwproducts/ProductCompare/ATmega168P/ATm=
ega328P
> > >   https://www.microchip.com/wwwproducts/ProductCompare/ATmega1280/ATm=
ega2560
> > >
> > > Datasheets:
> > >   http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega48A-PA-88A-PA=
-168A-PA-328-P-DS-DS40002061A.pdf
> > >   http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2549-8-bit-AV=
R-Microcontroller-ATmega640-1280-1281-2560-2561_datasheet.pdf
> > >
> > > [AM: Remove word 'Atmel' from filenames and all elements of code]
> > > Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> > >
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> > > ---
> > >  hw/avr/Kconfig       |   5 +
> > >  hw/avr/Makefile.objs |   1 +
> > >  hw/avr/atmega.c      | 470 +++++++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  hw/avr/atmega.h      |  48 ++++++
> > >  4 files changed, 524 insertions(+)
> > >  create mode 100644 hw/avr/Kconfig
> > >  create mode 100644 hw/avr/atmega.c
> > >  create mode 100644 hw/avr/atmega.h
> > >
> > > diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
> > > new file mode 100644
> > > index 0000000..9e6527e
> > > --- /dev/null
> > > +++ b/hw/avr/Kconfig
> > > @@ -0,0 +1,5 @@
> > > +config AVR_ATMEGA_MCU
> > > +    bool
> > > +    select AVR_TIMER16
> > > +    select AVR_USART
> > > +    select AVR_POWER
> > > diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
> > > index 123f174..af0fdde 100644
> > > --- a/hw/avr/Makefile.objs
> > > +++ b/hw/avr/Makefile.objs
> > > @@ -1 +1,2 @@
> > >  obj-y +=3D boot.o
> > > +obj-$(CONFIG_AVR_ATMEGA_MCU) +=3D atmega.o
> > > diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> > > new file mode 100644
> > > index 0000000..8cdf28b
> > > --- /dev/null
> > > +++ b/hw/avr/atmega.c
> > > @@ -0,0 +1,470 @@
> > > +/*
> > > + * QEMU ATmega MCU
> > > + *
> > > + * Copyright (c) 2019 Philippe Mathieu-Daud=C3=A9
> > > + *
> > > + * This work is licensed under the terms of the GNU GPLv2 or later.
> > > + * See the COPYING file in the top-level directory.
> > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > + */
> >
> > Philippe,
> >
> > Michael and I already agreed at some moment that the whole target AVR
> > should have harmonized licenses, and Sarrah agreed to change her
> > license to achieve this. Do you agree to harmonize your licenses with
> > the rest of the project? (This would mean changing the preable, but of
> > course you remain copyright carrier as is now.)
>
> What license do you want to use? I always use "GPLv2 or later" with
> QEMU, mostly following what the others do.
>
> Per https://wiki.qemu.org/License:
>
>   Source files with no licensing information are released under the
> GNU General Public License, version 2 or (at your option) any later
> version.
>
> Reading about licensing is not fun :(
>

Philippe, here is the deal: All new files for AVR platform has the
following preamble, that Michael chose from the outset:

+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>

Now, it is preferable that licenses are harmonized within a module,
and I ask you to change the preamble to be the same as the rest of the
module, that is all. This practically means LGPL2.1+later instead
LGPL2.0+later. I think it is reasonable that we want to simplify out
license stuff, not complicate it with different licenses within a
module. There are examples of complications in cases of different
license within the same module, so it would be ideal if we avoid such
situations.

Aleksandar

> >
> > Thanks,
> > Aleksandar

