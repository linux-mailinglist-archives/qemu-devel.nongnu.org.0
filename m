Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62433A197
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 23:17:51 +0100 (CET)
Received: from localhost ([::1]:57842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLCZx-0004R3-EW
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 17:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lLCYs-0003y2-OQ
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 17:16:42 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:45885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lLCYq-0007qR-Vo
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 17:16:42 -0500
Received: by mail-qt1-x834.google.com with SMTP id u7so6638645qtq.12
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 14:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5uakRAL0IUEzxHmwSDA75pxFvHDnculgMtAbcUWmwk0=;
 b=JoaxiljezQn7vfqC+zqChJteH0ZBcbmb/kyY4y24/myiUFQmmUjjr/69u/HprImDEo
 z8dIsA7/ddLtE2xz8QQuhOgmmJJVe5mjgcnwrR8MrcEWiWFOzOi5YxawTYPwes94sv/U
 gEIsyOqlD0/SF7FjxJwNuI1ifLSrnGmJS3TwPl32gNug7anV+WhK12htm3LsGphkE/Vv
 CuNu9JJfDe/crlE1aBwTygCU8AmimD7he7iO7jlBV+DPRhv+UBR5IPyGOenvrRmJK2Cs
 p/kGeE2vjvEiJRSmT2lEGeFMFsLCNQxSiggSduQXd61iX+Lx2DlVaXIMsaNPRaM20p2T
 saKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5uakRAL0IUEzxHmwSDA75pxFvHDnculgMtAbcUWmwk0=;
 b=dAHYyR8vNLIfn+SJ8XfhyJJl+1XjQrpppoqBUEISqrqYgr2Wn8LW8ltzRSbaLSnFm8
 rUz4LBoUbUG4y/G2EkvxlqFK2YVlRRv7Em67fDbutEVryk8MQ1qD8bDfUbi1kCHaCeTx
 cNky5gv9rf2xM+4Ja2bDj9roK+9tts79JY3scRvLeGa5dq9vVOcasuLHMpfCY2/XiCP6
 BUNc/Us/N7TDUiT+GMsMgMKz2iE+61F10Ze1mk0bH4hx0jeASdmTX0cFV7ujwzV1O1lH
 QiRAw4oz75Rqd0/DuFXN9fiYOkNIpZCkIWmCitcXqIiQxMNdVSab5zGzyS1nGT7zR1xI
 8iMw==
X-Gm-Message-State: AOAM5322iJcgx3OWSTOzn88rhsNgZopscN7WZcfhEcYzB7jCBGwGD689
 sllVnH4OsGgSGTRiixHURjOpDv+XNc1UaXR5WYQ=
X-Google-Smtp-Source: ABdhPJxHpc1HB03ACk+Gei8oBMeQGwwRd1EMt51OITe2N264bOKEQDkbRMyyA+QB8EK+Z6+sdGuAc1cACnyBC+THOIM=
X-Received: by 2002:ac8:734c:: with SMTP id q12mr17680730qtp.160.1615673799600; 
 Sat, 13 Mar 2021 14:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20210313165445.2113938-1-f4bug@amsat.org>
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sun, 14 Mar 2021 00:16:03 +0200
Message-ID: <CAK4993hda2fbac-At4P05rTyzF8a4Fae8913E4-mBwKq3H2pOQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] AVR patch queue for QEMU 6.0
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000e5eca005bd725eeb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=mrolnik@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e5eca005bd725eeb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Sat, Mar 13, 2021 at 6:54 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> Hi,
>
> This series contains all the AVR patches I could find on the list.
>
> Niteesh, I fixed minor issues. Do you mind reviewing on top?
>
> Pull request planned for Monday if no problem arises.
>
> Thanks,
>
> Phil.
>
> G S Niteesh Babu (2):
>   hw/gpio/avr_gpio: Add tracing for reads and writes
>   hw/avr/arduino: Add D13 LED
>
> Heecheol Yang (1):
>   hw/avr: Add limited support for avr gpio registers
>
> Ivanov Arkasha (1):
>   target/avr: Fix interrupt execution
>
> Lichang Zhao (1):
>   target/avr: Fix some comment spelling errors
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   hw/misc/led: Add yellow LED
>   hw/avr/arduino: List board schematic links
>   hw/gpio/avr_gpio: Add migration VMstate
>   hw/gpio/avr_gpio: Add 'id' field in AVRGPIOState
>   hw/gpio/avr_gpio: Simplify avr_gpio_write_port using extract32()
>   hw/avr/arduino: Replace magic number by gpio_port_index() call
>
>  hw/avr/atmega.h            |   2 +
>  include/hw/gpio/avr_gpio.h |  54 ++++++++++++
>  include/hw/misc/led.h      |   1 +
>  hw/avr/arduino.c           |  44 +++++++++-
>  hw/avr/atmega.c            |   8 +-
>  hw/gpio/avr_gpio.c         | 173 +++++++++++++++++++++++++++++++++++++
>  hw/misc/led.c              |   1 +
>  target/avr/helper.c        |  10 ++-
>  hw/avr/Kconfig             |   2 +
>  hw/gpio/Kconfig            |   3 +
>  hw/gpio/meson.build        |   1 +
>  hw/gpio/trace-events       |   5 ++
>  12 files changed, 294 insertions(+), 10 deletions(-)
>  create mode 100644 include/hw/gpio/avr_gpio.h
>  create mode 100644 hw/gpio/avr_gpio.c
>
> --
> 2.26.2
>
>

--=20
Best Regards,
Michael Rolnik

--000000000000e5eca005bd725eeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 13, 2021 at 6:54 PM Philipp=
e Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi,<br>
<br>
This series contains all the AVR patches I could find on the list.<br>
<br>
Niteesh, I fixed minor issues. Do you mind reviewing on top?<br>
<br>
Pull request planned for Monday if no problem arises.<br>
<br>
Thanks,<br>
<br>
Phil.<br>
<br>
G S Niteesh Babu (2):<br>
=C2=A0 hw/gpio/avr_gpio: Add tracing for reads and writes<br>
=C2=A0 hw/avr/arduino: Add D13 LED<br>
<br>
Heecheol Yang (1):<br>
=C2=A0 hw/avr: Add limited support for avr gpio registers<br>
<br>
Ivanov Arkasha (1):<br>
=C2=A0 target/avr: Fix interrupt execution<br>
<br>
Lichang Zhao (1):<br>
=C2=A0 target/avr: Fix some comment spelling errors<br>
<br>
Philippe Mathieu-Daud=C3=A9 (6):<br>
=C2=A0 hw/misc/led: Add yellow LED<br>
=C2=A0 hw/avr/arduino: List board schematic links<br>
=C2=A0 hw/gpio/avr_gpio: Add migration VMstate<br>
=C2=A0 hw/gpio/avr_gpio: Add &#39;id&#39; field in AVRGPIOState<br>
=C2=A0 hw/gpio/avr_gpio: Simplify avr_gpio_write_port using extract32()<br>
=C2=A0 hw/avr/arduino: Replace magic number by gpio_port_index() call<br>
<br>
=C2=A0hw/avr/atmega.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0include/hw/gpio/avr_gpio.h |=C2=A0 54 ++++++++++++<br>
=C2=A0include/hw/misc/led.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/avr/arduino.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 44 +=
++++++++-<br>
=C2=A0hw/avr/atmega.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A08 +-<br>
=C2=A0hw/gpio/avr_gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 173 +++++++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/misc/led.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A01 +<br>
=C2=A0target/avr/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 ++-<br>
=C2=A0hw/avr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +<br>
=C2=A0hw/gpio/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +<br>
=C2=A0hw/gpio/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/gpio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 ++<br>
=C2=A012 files changed, 294 insertions(+), 10 deletions(-)<br>
=C2=A0create mode 100644 include/hw/gpio/avr_gpio.h<br>
=C2=A0create mode 100644 hw/gpio/avr_gpio.c<br>
<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000e5eca005bd725eeb--

