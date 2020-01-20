Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846DC1422D5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 06:31:35 +0100 (CET)
Received: from localhost ([::1]:58670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itPew-0000Mw-IY
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 00:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1itPdn-0008Lx-Au
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 00:30:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1itPdl-0005fg-Jk
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 00:30:23 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:44613)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1itPdl-0005f8-CG
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 00:30:21 -0500
Received: by mail-qt1-x843.google.com with SMTP id w8so12377028qts.11
 for <qemu-devel@nongnu.org>; Sun, 19 Jan 2020 21:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWp2F/b4ZbThjQh09GapjomcVXOw8/YWltvUiOxfleY=;
 b=lnR6jJuiZfFrc0MjfAaCGio83Ze473SOy/ENQZj/NeuTBj2ml5FzmZg8g1xj1K1DZf
 GNSGz16VMBvsth9jOiPd0fyQck7Jg0rYLao3BgJNMx3UnExbhU5hlFuVPu1aXJziEjNk
 v5IjXWTAgAWftOlGmVC+e0U5Qt1VHTvlwytqVF0q6WlCOFCP9kbdtuMEjHLxkekaZzHr
 jIMWmbn4fdtnUSenbQGNKZvloF3eAhZJq7ZL99FMQdrvFajdoTsAdBFOjuJKfV3j8nI7
 MA7lmKekkiskCgazs1HN5tbXmHs3zQ17URYD2gD9xWb0Txty1G0QMmtNaqPMdfYUYhqz
 frpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWp2F/b4ZbThjQh09GapjomcVXOw8/YWltvUiOxfleY=;
 b=psvy6qIkI6UbGQ9wiCgmqyUuM8NGemUFD4G+C+qbo0ao3H9P1JYoDW2+BaSJzG2qsW
 D83+SZ63D6doLapfLeprqtor0BJlPayBeYT1LWq9u3+AWMe1WmTX/JNhQC+j5aXaM2uJ
 9u7XlPka07pDJcAazUEDh4ed546RNpSiISIMEkCUUug0WUTJt89R1Z4fb7oG5KH5c+U8
 8RasrU8/yHULOwt4Vj9jtI8tqmJ7I6btcXh4BjT/SeGGp16TgPfKhNffMB8PkqaECLOe
 XHg6jTd1WdfPWJKZdk4ZNiGgrC9LA3V4GuDmnhX+qx8wEgqM/yJf2q0lV8phu2gYFi4V
 KUHw==
X-Gm-Message-State: APjAAAWZkv62XvykUnv0DKmc0zTbVyxUK/SJwt1121Uh59bvDtC/9q3j
 Ujbf53pAGGZb+AkT3eA2MCAuhc5qx2gM5Fqqlso=
X-Google-Smtp-Source: APXvYqzg5imy2Cl7tsRreXiaTbLe7ZceNcn95Mz9YkqWkEm+UqI/Mblfb4qx2savgFpGl0wM6ku+pD0Ty4nuaW5D/sE=
X-Received: by 2002:ac8:1769:: with SMTP id u38mr18582195qtk.160.1579498219669; 
 Sun, 19 Jan 2020 21:30:19 -0800 (PST)
MIME-Version: 1.0
References: <20191229224505.24466-1-f4bug@amsat.org>
 <CAK4993jswyYwanXZ4G4y4XwJ6nrtSLXZjvsE+LK+KRJASpe9Kw@mail.gmail.com>
 <c6d7f25d-b74c-a29f-14e8-885659262bdf@amsat.org>
In-Reply-To: <c6d7f25d-b74c-a29f-14e8-885659262bdf@amsat.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Mon, 20 Jan 2020 07:29:42 +0200
Message-ID: <CAK4993jo8Z7CFrV_=Xihry7qjntMCGnO6tMvsekvELuHvne9cw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] hw/avr: Introduce the Arduino boards
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000004e8cb3059c8b9655"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004e8cb3059c8b9655
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, no problem.

On Mon, Jan 20, 2020 at 12:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Michael,
>
> On 12/30/19 7:17 PM, Michael Rolnik wrote:
> > Hi Philippe.
> >
> > Thank you for joining the effort.
>
> Could you test this series?
>
> Are you OK if we use the Arduino machines it introduces to replace your
> 'sample' board?
>
> > Regards,
> > Michael Rolnik
> >
> >
> > On Mon, Dec 30, 2019 at 12:45 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org
> > <mailto:f4bug@amsat.org>> wrote:
> >
> >     Hi,
> >
> >     This series add the arduino boards, aiming at removing the
> >     'sample' board that doesn't follow any specification.
> >
> >     Since v2:
> >     - rebased on Michael's v40
> >
> >     Since v1:
> >     - Addressed Igor comments
> >     - Addressed Aleksandar comments
> >     - Fixed UART issue (was due to IRQ shifted by 2 in CPU)
> >
> >     TODO after merge is:
> >     - Extract Timer8 common parts from Timer16
> >     - Add GPIOs
> >     - Connect LED to GPIO on Arduino
> >     - Plug to Scratch (See http://s4a.cat/).
> >       (I plan to purpose that as a GSoC idea).
> >
> >     Michael, thank you for having insisted with this port during so lon=
g!
> >
> >     Regards,
> >
> >     Phil.
> >
> >     Series available at
> https://gitlab.com/philmd/qemu/commits/arduino-v3
> >
> >     Regards,
> >
> >     Phil.
> >
> >     Based-on: <20191229215158.5788-1-mrolnik@gmail.com
> >     <mailto:20191229215158.5788-1-mrolnik@gmail.com>>
> >     https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg05309.html
> >
> >     Philippe Mathieu-Daud=C3=A9 (8):
> >       hw/char/avr: Reduce USART I/O size
> >       hw/timer/avr_timer16: Rename memory region debugging name
> >       hw/avr: Add some ATmega microcontrollers
> >       hw/avr: Add some Arduino boards
> >       tests/boot-serial-test: Test some Arduino boards (AVR based)
> >       tests/acceptance: Do not set the machine type manually
> >       tests/acceptance: Keep multilines comment consistent with other
> tests
> >       tests/acceptance: Test the Arduino MEGA2560 board
> >
> >      hw/avr/atmega.h                  |  48 ++++
> >      hw/avr/arduino.c                 | 177 ++++++++++++
> >      hw/avr/atmega.c                  | 464
> +++++++++++++++++++++++++++++++
> >      hw/char/avr_usart.c              |   2 +-
> >      hw/timer/avr_timer16.c           |   6 +-
> >      tests/boot-serial-test.c         |   2 +
> >      hw/avr/Makefile.objs             |   2 +
> >      tests/acceptance/machine_avr6.py |  11 +-
> >      8 files changed, 701 insertions(+), 11 deletions(-)
> >      create mode 100644 hw/avr/atmega.h
> >      create mode 100644 hw/avr/arduino.c
> >      create mode 100644 hw/avr/atmega.c
> >
> >     --
> >     2.21.0
> >
> >
> >
> > --
> > Best Regards,
> > Michael Rolnik
>


--=20
Best Regards,
Michael Rolnik

--0000000000004e8cb3059c8b9655
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure, no problem.=C2=A0<br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 20, 2020 at 12:50 A=
M Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@=
amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Michael,<br>
<br>
On 12/30/19 7:17 PM, Michael Rolnik wrote:<br>
&gt; Hi Philippe.<br>
&gt; <br>
&gt; Thank you for joining the effort.<br>
<br>
Could you test this series?<br>
<br>
Are you OK if we use the Arduino machines it introduces to replace your<br>
&#39;sample&#39; board?<br>
<br>
&gt; Regards,<br>
&gt; Michael Rolnik<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Dec 30, 2019 at 12:45 AM Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@=
amsat.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This series add the arduino boards, aiming at remov=
ing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;sample&#39; board that doesn&#39;t follow any =
specification.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Since v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- rebased on Michael&#39;s v40<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Since v1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Addressed Igor comments<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Addressed Aleksandar comments<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Fixed UART issue (was due to IRQ shifted by 2 in =
CPU)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0TODO after merge is:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Extract Timer8 common parts from Timer16<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Add GPIOs<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Connect LED to GPIO on Arduino<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Plug to Scratch (See <a href=3D"http://s4a.cat/" =
rel=3D"noreferrer" target=3D"_blank">http://s4a.cat/</a>).<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 (I plan to purpose that as a GSoC idea).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Michael, thank you for having insisted with this po=
rt during so long!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Phil.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Series available at <a href=3D"https://gitlab.com/p=
hilmd/qemu/commits/arduino-v3" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.com/philmd/qemu/commits/arduino-v3</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Phil.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Based-on: &lt;<a href=3D"mailto:20191229215158.5788=
-1-mrolnik@gmail.com" target=3D"_blank">20191229215158.5788-1-mrolnik@gmail=
.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:20191229215158.5788-1-=
mrolnik@gmail.com" target=3D"_blank">20191229215158.5788-1-mrolnik@gmail.co=
m</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.gnu.org/archive/html/qemu-=
devel/2019-12/msg05309.html" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.gnu.org/archive/html/qemu-devel/2019-12/msg05309.html</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Philippe Mathieu-Daud=C3=A9 (8):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw/char/avr: Reduce USART I/O size<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw/timer/avr_timer16: Rename memory region d=
ebugging name<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw/avr: Add some ATmega microcontrollers<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw/avr: Add some Arduino boards<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tests/boot-serial-test: Test some Arduino bo=
ards (AVR based)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tests/acceptance: Do not set the machine typ=
e manually<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tests/acceptance: Keep multilines comment co=
nsistent with other tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tests/acceptance: Test the Arduino MEGA2560 =
board<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/avr/atmega.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 48 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/avr/arduino.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 177 ++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/avr/atmega.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 464 +++++++++++++++++++++++++++++++<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/char/avr_usart.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/timer/avr_timer16.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0tests/boot-serial-test.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/avr/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0tests/acceptance/machine_avr6.py |=C2=A0 11 +=
-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A08 files changed, 701 insertions(+), 11 deleti=
ons(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 hw/avr/atmega.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 hw/avr/arduino.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 hw/avr/atmega.c<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.21.0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Best Regards,<br>
&gt; Michael Rolnik<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--0000000000004e8cb3059c8b9655--

