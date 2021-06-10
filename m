Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BE3A2586
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 09:32:46 +0200 (CEST)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrFBE-0000de-9k
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 03:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lrFA1-0008E3-6b
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 03:31:31 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lrF9z-0004Gm-CL
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 03:31:28 -0400
Received: by mail-qk1-x735.google.com with SMTP id j184so26403500qkd.6
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 00:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/4lyN2KyfW1i8gsQE8qe1rODwAFmuRBtnjTP0R14xnU=;
 b=XJXuk6nD5UNwsLw3pNOzy8ovpdVI2Ds/w26oIZ8lfn0oZahjbkI6XjQopKXAX+X3dc
 fIhUlYJU/Di6WhdEM+CBih5tpWIEvpZ1j0giaHz3tUvfepqwnD4Mq79f8SfLlqveXYlQ
 R/rmDcPV/27RUq8Zp/8FBJCoGofSAgSNrTgF53+5/05sMR/sI2EBMX0jHe/X1zZzAq/O
 ackH3fy/u/mEU9vdk7yeN85WE+GN7ORQl22sGLm/oAw1bbAiRTUAkLvwTwC6HBYzadYV
 JP5wXw0lSgu/0nh37/0I7VVMjT8PPZLInlENehOdPvUzEShjVL5Pu0VLYBgn4JX9OpxB
 3Riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/4lyN2KyfW1i8gsQE8qe1rODwAFmuRBtnjTP0R14xnU=;
 b=RXQkb0mRNfXKzBFPtomF4BnkL3czdw38o88lPw2QIL6D3XVeaLCHvGPd2SYyM2OrTA
 Coi9VbdllE9M4q4ubQOdB+2Zgc/Aw/7/KDGvbYJNSJSTvuH1Vq9tb+7RBUDVwygVEL17
 eP78saqYggyVpkkQbxvwO5q8SfPynF+6KALiLDgyc5bsIkaH2m6IPFkkqYPiLF3hC2cy
 0Llx36tiQTscyN7UrN+Ls0HiME/xDzdKC6O+bnduXtdBMWXWvXcoSgAyWsNxPRhc0jXE
 FXZtHHdQnO/0SI1IXM/uhqMY01RPlQesbL7AJgb+r6bz4aQMVhc9jJNgbg7ck+b4rP+O
 +pqw==
X-Gm-Message-State: AOAM5332lMgPTT/xjCg7QQDI95cFjqi7LBkfAgOtYZzMb7izw7z3SiVc
 5DCnz/lhfxSYkSQBolUj4rwURyh5pBHSsdNP53ts+6d7
X-Google-Smtp-Source: ABdhPJxsQn9VPiZQln/e6/K8t38J1DD6mri1cWSm9Zhj338bqKCb/IeUmYSUjpe+nPOt9rS1G3Ze6z8CLztVJUCp4mQ=
X-Received: by 2002:a05:620a:c0b:: with SMTP id
 l11mr3381926qki.181.1623310285409; 
 Thu, 10 Jun 2021 00:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210515220957.13053-1-mrolnik@gmail.com>
In-Reply-To: <20210515220957.13053-1-mrolnik@gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Thu, 10 Jun 2021 10:30:49 +0300
Message-ID: <CAK4993iLzF1L7xkE9SSc1gYvoF0a08s3cXb6WKUD0iJUOQLKXA@mail.gmail.com>
Subject: Re: [RFC v3 0/1] Implement AVR WDT (watchdog timer)
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ec116c05c464604d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=mrolnik@gmail.com; helo=mail-qk1-x735.google.com
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 Fred Konrad <konrad@adacore.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ec116c05c464604d
Content-Type: text/plain; charset="UTF-8"

ping

On Sun, May 16, 2021 at 1:10 AM Michael Rolnik <mrolnik@gmail.com> wrote:

> 1.  Initial implementation of AVR WDT
>     There are two issues with this implementation so I need your help here
>     a. when I configure the WDT to fire an interrupt every 15ms it
> actually happens every 6 instructions
>     b. when I specify --icount shift=0 qemu stucks
>
> changes since v1
> 1.  correct RW or RW1C behavior is implemented
> 2.  icount functionality is fixed
> 3.  I still observe something strange, it takes AVR 150 instructions to
> simulate 15ms
>
> changes since v2
> 1.  use REG8 & FIELD macros to define registers
> 2.  fixing ICOUNT behavior
>
> *** BLURB HERE ***
>
> Michael Rolnik (1):
>   Implement AVR watchdog timer
>
>  MAINTAINERS                   |   2 +
>  hw/avr/Kconfig                |   1 +
>  hw/avr/atmega.c               |  15 +-
>  hw/avr/atmega.h               |   2 +
>  hw/watchdog/Kconfig           |   3 +
>  hw/watchdog/avr_wdt.c         | 279 ++++++++++++++++++++++++++++++++++
>  hw/watchdog/meson.build       |   2 +
>  hw/watchdog/trace-events      |   5 +
>  include/hw/watchdog/avr_wdt.h |  47 ++++++
>  target/avr/cpu.c              |   3 +
>  target/avr/cpu.h              |   1 +
>  target/avr/helper.c           |   7 +-
>  target/avr/translate.c        |  58 ++++++-
>  13 files changed, 419 insertions(+), 6 deletions(-)
>  create mode 100644 hw/watchdog/avr_wdt.c
>  create mode 100644 include/hw/watchdog/avr_wdt.h
>
> --
> 2.25.1
>
>

-- 
Best Regards,
Michael Rolnik

--000000000000ec116c05c464604d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, May 16, 2021 at 1:10 AM Michael Rolnik &lt;<a =
href=3D"mailto:mrolnik@gmail.com">mrolnik@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">1.=C2=A0 Initial impleme=
ntation of AVR WDT<br>
=C2=A0 =C2=A0 There are two issues with this implementation so I need your =
help here<br>
=C2=A0 =C2=A0 a. when I configure the WDT to fire an interrupt every 15ms i=
t actually happens every 6 instructions<br>
=C2=A0 =C2=A0 b. when I specify --icount shift=3D0 qemu stucks<br>
<br>
changes since v1<br>
1.=C2=A0 correct RW or RW1C behavior is implemented<br>
2.=C2=A0 icount functionality is fixed<br>
3.=C2=A0 I still observe something strange, it takes AVR 150 instructions t=
o simulate 15ms<br>
<br>
changes since v2<br>
1.=C2=A0 use REG8 &amp; FIELD macros to define registers<br>
2.=C2=A0 fixing ICOUNT behavior<br>
<br>
*** BLURB HERE ***<br>
<br>
Michael Rolnik (1):<br>
=C2=A0 Implement AVR watchdog timer<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0hw/avr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/avr/atmega.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 15 +-<br>
=C2=A0hw/avr/atmega.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
=C2=A0hw/watchdog/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +<br>
=C2=A0hw/watchdog/avr_wdt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 279 ++++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/watchdog/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<b=
r>
=C2=A0hw/watchdog/trace-events=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0include/hw/watchdog/avr_wdt.h |=C2=A0 47 ++++++<br>
=C2=A0target/avr/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +<br>
=C2=A0target/avr/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0target/avr/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A07 +-<br>
=C2=A0target/avr/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 58 ++++++-<=
br>
=C2=A013 files changed, 419 insertions(+), 6 deletions(-)<br>
=C2=A0create mode 100644 hw/watchdog/avr_wdt.c<br>
=C2=A0create mode 100644 include/hw/watchdog/avr_wdt.h<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000ec116c05c464604d--

