Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D9F337D23
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:02:10 +0100 (CET)
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQZV-0005zf-JU
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lKQVs-00048n-8M
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:58:24 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:34383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lKQVq-0003XE-EK
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:58:24 -0500
Received: by mail-qt1-x836.google.com with SMTP id c6so1947644qtc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6ge1U3DfXS7QFpowJsAl87wYaACjboeO+Y+QhWbSt4=;
 b=fgjmdQ4PlfuwnwnYhOote8pC4Tv2X10qg+qC7rrTi18Vye2isCPyh2I9h+n+hkrTd8
 /Fmf9S609awET+zkU3G8y4M2CGxiV6tduyO7Fwl9nqPrdEnh5O/B37UYWfJWlhnwpHTe
 2o6bX8xdofNo/NpGk+vzHf5NipLEjSTo1lsbDS47kdkw9mu1Zava7GJZh9ks5zkMEcSo
 mePbk5nFUDAsJP2JmB2c+zr6pvpQcu2vngWaW1Of4dm3gem1nqUKYiFkBs5lAItIZ315
 j3RhbB4XEnIZgzcuE/DlI/4PpW/LkgopBs7GrjZHLOxap6bV9Nsq9QKJ831IyZ6fZHQD
 EJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6ge1U3DfXS7QFpowJsAl87wYaACjboeO+Y+QhWbSt4=;
 b=SEdNOJjddtWrWIhc3KQ/1JVmi4HiBrIq9tq8SlXSxltQLldz1Mn6whQ0uneqbylsOt
 xDt2cPCgfmus0kAgpKJh4Br2+q6HUZ5WzuS9by+anPVbjXSm1V/fXuswYFkTiwBhBwWt
 tyouy7HOLr28UpT7HdqbZmUkJ5gjFzj+r0z01CjarPnq3UuRuHizINa5F5J5AOVYaKCX
 GB/j0oc/cJJ53q1YuuR8B/Q9ly0jFcuINjFDMji2a/xQqWD2uwx1Dkj6Njm473gR9Sc+
 VyMGQSsC24Fpt7szoccI3b9+5lrXqEqsf5mCURrzm8vLzd1lSn/x9Bem9RQd5LvNyC7R
 WpBw==
X-Gm-Message-State: AOAM5303fUnAuBRNXP7RQkFfR2jlHVFWQuCdGPGgyLBeWmFIjdEj6rC5
 j400TlwNRmpgQtgzr6mokb3nwPp+hJF89tcbjgA=
X-Google-Smtp-Source: ABdhPJyOzUYmTvvJSksVtUqlZDH1EIQzInTZNgpiQ31dfh9S10tEo51STU8Q4unb0s+rDESxPkrHWZG6d4mnzt2pd/Y=
X-Received: by 2002:ac8:71d2:: with SMTP id i18mr8662226qtp.371.1615489100809; 
 Thu, 11 Mar 2021 10:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20210311135539.10206-1-niteesh.gs@gmail.com>
In-Reply-To: <20210311135539.10206-1-niteesh.gs@gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Thu, 11 Mar 2021 20:57:44 +0200
Message-ID: <CAK4993ijE2p1UVVWF+C80oHX7U21AGjDjKe9wk-DVtkwiosJnQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] AVR GPIO Emulation and Arduino D13 LED
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000fe08da05bd475dc6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=mrolnik@gmail.com; helo=mail-qt1-x836.google.com
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fe08da05bd475dc6
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Thu, Mar 11, 2021 at 3:55 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Hello,
>
> The following series of the patches add a basic AVR GPIO emulation
> to QEMU. The AVR GPIO emulation patch was originally written by
> Heecheol Yang and was posted on the mailing list around 5 months ago.
> I am re-publishing the patch with some bug fixes along with my own
> patch, Adding the D13 onboard LED.
>
> G S Niteesh Babu (2):
>   hw/gpio/avr_gpio.c: add tracing for read and writes
>   avr/arduino: Add D13 LED
>
> Heecheol Yang (1):
>   hw/avr: Add limited support for avr gpio registers
>
>  hw/avr/Kconfig             |   2 +
>  hw/avr/arduino.c           |  15 ++++
>  hw/avr/atmega.c            |   7 +-
>  hw/avr/atmega.h            |   2 +
>  hw/gpio/Kconfig            |   3 +
>  hw/gpio/avr_gpio.c         | 148 +++++++++++++++++++++++++++++++++++++
>  hw/gpio/meson.build        |   1 +
>  hw/gpio/trace-events       |   6 ++
>  include/hw/gpio/avr_gpio.h |  53 +++++++++++++
>  9 files changed, 235 insertions(+), 2 deletions(-)
>  create mode 100644 hw/gpio/avr_gpio.c
>  create mode 100644 include/hw/gpio/avr_gpio.h
>
> --
> 2.17.1
>
>

-- 
Best Regards,
Michael Rolnik

--000000000000fe08da05bd475dc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 3:55 PM G S Nit=
eesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
ello,<br>
<br>
The following series of the patches add a basic AVR GPIO emulation<br>
to QEMU. The AVR GPIO emulation patch was originally written by<br>
Heecheol Yang and was posted on the mailing list around 5 months ago.<br>
I am re-publishing the patch with some bug fixes along with my own<br>
patch, Adding the D13 onboard LED.<br>
<br>
G S Niteesh Babu (2):<br>
=C2=A0 hw/gpio/avr_gpio.c: add tracing for read and writes<br>
=C2=A0 avr/arduino: Add D13 LED<br>
<br>
Heecheol Yang (1):<br>
=C2=A0 hw/avr: Add limited support for avr gpio registers<br>
<br>
=C2=A0hw/avr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +<br>
=C2=A0hw/avr/arduino.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +=
+++<br>
=C2=A0hw/avr/atmega.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A07 +-<br>
=C2=A0hw/avr/atmega.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0hw/gpio/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +<br>
=C2=A0hw/gpio/avr_gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 148 +++++++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/gpio/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/gpio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 ++<br>
=C2=A0include/hw/gpio/avr_gpio.h |=C2=A0 53 +++++++++++++<br>
=C2=A09 files changed, 235 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 hw/gpio/avr_gpio.c<br>
=C2=A0create mode 100644 include/hw/gpio/avr_gpio.h<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000fe08da05bd475dc6--

