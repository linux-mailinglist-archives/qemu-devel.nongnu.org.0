Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3360769FB95
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:57:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuIw-0008J7-O1; Wed, 22 Feb 2023 13:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUuIj-0007w3-Tm; Wed, 22 Feb 2023 13:57:15 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUuIZ-0005yA-93; Wed, 22 Feb 2023 13:57:13 -0500
Received: by mail-vs1-xe29.google.com with SMTP id b20so10603612vsu.5;
 Wed, 22 Feb 2023 10:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677092220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FKciHc1fA+dcV3BGBbSCib2qsehn3gx7+vyAooq5Qd4=;
 b=p1Nd1dpH31VXhEcncKAuTVAJdoFkCuaiPzyBYdAUIQuiY5ayYhj9haXlxar5TJq8CM
 QFORYGaugv11Nu41RhVZs7Pwk2YeXJiQ6IXggPSTxD0H53m8OqZp63po2zhKZipTeQEa
 9BwSzgwut/XyMSzc6xcRi3mCL+Qa47EUlEKkcQsAFseHeK1bHSbeZVTWuhs7f3b3Flcb
 M7U53I6y7oohq+O6rTLGu1+QDjygesvXRA5Yi+FrzOtjjTi4zNZ5sF9dat8dPkAvrA4p
 TQg+HnILtCImkGN1tjHiM1ZFWa9b67uM3r3cJMGbnpcq89sEvRef5PiS0HK9o1bMfLP3
 JB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677092220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FKciHc1fA+dcV3BGBbSCib2qsehn3gx7+vyAooq5Qd4=;
 b=hatfkbu9BOHlo4A5xRyA0DWEqpN7UZGAqF+BOqKEDOz89JQ0f5t/n7B3BKWVbtNw/z
 kFQ/hBcUH2o8rUWH043hQXPWGtGSDtv6UCWO+rI9TEtaPuuwbsoR55Zuwq65ppg97x75
 9AvuX9mJYnvDAc9ScBo9+FmYkFdXQ+ETZ7QiD+d0+tO4oBDRfIwCr3K13a5XBd757Jg+
 y4BQHbWqG5N/WtRTkXWud46sAUdL0eMqLuOb5akjkAnTH27MY5HvowU3D2lhgdGWRXjy
 RH+Qu8cvnWjCAuIjpOh0TcxagZP+WSXOtI4lVinenLlJs0zGv5/3sHM3cWTYA9p6zpFO
 +v+A==
X-Gm-Message-State: AO0yUKVUUsXLSBLETRnbkkyBNErF6a7gOniQnbDbWe6iSfLvQLdd5NQg
 +O7knyFl5S3c8qlec6uBGhjLOgAWPsZmOqzxGVc=
X-Google-Smtp-Source: AK7set8nC+8unvyvKcBOp+d9l8c/xRlqgMfZTbDoKmj+fUvViwt8uF4t2T6qELg2Lv6JFalQzwPIEycRn3mMc0ZXS8Y=
X-Received: by 2002:a05:6122:84a:b0:411:b190:fe5b with SMTP id
 10-20020a056122084a00b00411b190fe5bmr168222vkk.39.1677092220410; Wed, 22 Feb
 2023 10:57:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
In-Reply-To: <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Wed, 22 Feb 2023 19:56:46 +0100
Message-ID: <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@redhat.com
Content-Type: multipart/alternative; boundary="0000000000000da17f05f54e765f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000000da17f05f54e765f
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <shentey@gmail.com> wrote:

>
>
> On Tue, Feb 21, 2023 at 7:44 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
>> This series fixes PCI interrupts on the ppc/pegasos2 machine and adds
>> partial implementation of the via-ac97 sound part enough to get audio
>> output. I'd like this to be merged for QEMU 8.0.
>>
>> Regards,
>> BALATON Zoltan
>>
>> BALATON Zoltan (5):
>>   hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq
>>   hw/isa/vt82c686: Implement PIRQ pins
>>   hw/ppc/pegasos2: Fix PCI interrupt routing
>>   hw/audio/ac97: Split off some definitions to a header
>>   hw/audio/via-ac97: Basic implementation of audio playback
>>
>>  hw/audio/ac97.c            |  43 +---
>>  hw/audio/ac97.h            |  65 ++++++
>>  hw/audio/trace-events      |   6 +
>>  hw/audio/via-ac97.c        | 436 ++++++++++++++++++++++++++++++++++++-
>>  hw/ide/via.c               |   2 +-
>>  hw/isa/vt82c686.c          |  61 +++++-
>>  hw/pci-host/mv64361.c      |   4 -
>>  hw/ppc/pegasos2.c          |  26 ++-
>>  hw/usb/vt82c686-uhci-pci.c |   5 +-
>>  include/hw/isa/vt82c686.h  |  39 +++-
>>  10 files changed, 626 insertions(+), 61 deletions(-)
>>  create mode 100644 hw/audio/ac97.h
>>
>> --
>> 2.30.7
>>
>>
> Wow, the MorphOS people paid attention to sound design. Thanks for
> presenting it to us, Zoltan!
>
> I've had a closer look at your series and I think it can be simplified:
> Patch 2 can be implemented quite straight-forward like I proposed in a
> private mail: https://github.com/shentok/qemu/commit/via-priq-routing.
> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interrupt routing"
> working, one can expose the PCI interrupts with a single line like you do
> in patch 2. With this, patch 1 "hw/isa/vt82c686: Implement interrupt
> routing in via_isa_set_irq" isn't needed any longer and can be omitted.
>
> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq() can be
> used instead. pci_set_irq() internally takes care of all the ISA interrupt
> level tracking patch 1 attempted to address.
>

Here is a proof of concept branch to demonstrate that the simplification
actually works: https://github.com/shentok/qemu/commits/pegasos2 (Tested
with MorphOS with and without pegasos2.rom).

Best regards,
Bernhard

>
> I might have further comments but I think it's enough for now.
>
> Thanks again for making via-ac97 work!
>
> Best regards,
> Bernhard
>

--0000000000000da17f05f54e765f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 22, 2023 at 4:38 PM Bernh=
ard Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 21, 2023 at 7:44 PM BALATON Zo=
ltan &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@ei=
k.bme.hu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">This series fixes PCI interrupts on the ppc/pegasos2 machine and ad=
ds<br>
partial implementation of the via-ac97 sound part enough to get audio<br>
output. I&#39;d like this to be merged for QEMU 8.0.<br>
<br>
Regards,<br>
BALATON Zoltan<br>
<br>
BALATON Zoltan (5):<br>
=C2=A0 hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq<br>
=C2=A0 hw/isa/vt82c686: Implement PIRQ pins<br>
=C2=A0 hw/ppc/pegasos2: Fix PCI interrupt routing<br>
=C2=A0 hw/audio/ac97: Split off some definitions to a header<br>
=C2=A0 hw/audio/via-ac97: Basic implementation of audio playback<br>
<br>
=C2=A0hw/audio/ac97.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 43 +=
---<br>
=C2=A0hw/audio/ac97.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 65 +=
+++++<br>
=C2=A0hw/audio/trace-events=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0hw/audio/via-ac97.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 436 ++++++++++++++++=
++++++++++++++++++++-<br>
=C2=A0hw/ide/via.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0hw/isa/vt82c686.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 61 +++++-=
<br>
=C2=A0hw/pci-host/mv64361.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 -<br>
=C2=A0hw/ppc/pegasos2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 26 ++-<br=
>
=C2=A0hw/usb/vt82c686-uhci-pci.c |=C2=A0 =C2=A05 +-<br>
=C2=A0include/hw/isa/vt82c686.h=C2=A0 |=C2=A0 39 +++-<br>
=C2=A010 files changed, 626 insertions(+), 61 deletions(-)<br>
=C2=A0create mode 100644 hw/audio/ac97.h<br>
<br>
-- <br>
2.30.7<br>
<br></blockquote><div><br></div><div>Wow, the MorphOS people paid attention=
 to sound design. Thanks for presenting it to us, Zoltan!</div><div><br></d=
iv><div>I&#39;ve had a closer look at your series and I think it can be sim=
plified: Patch 2 can be implemented quite straight-forward like I proposed =
in a private mail: <a href=3D"https://github.com/shentok/qemu/commit/via-pr=
iq-routing" target=3D"_blank">https://github.com/shentok/qemu/commit/via-pr=
iq-routing</a>. Then, in order to make patch 3 &quot;hw/ppc/pegasos2: Fix P=
CI interrupt routing&quot; working, one can expose the PCI interrupts with =
a single line like you do in patch 2. With this, patch 1 &quot;hw/isa/vt82c=
686: Implement interrupt routing in via_isa_set_irq&quot; isn&#39;t needed =
any longer and can be omitted.</div></div><div class=3D"gmail_quote"><div><=
br></div><div>In via-ac97, rather than  using via_isa_set_irq(), pci_set_ir=
q() can be used instead. pci_set_irq() internally takes care of all the ISA=
 interrupt level tracking patch 1 attempted to address.</div></div></div></=
blockquote><div><br></div><div>Here is a proof of concept branch to demonst=
rate that the simplification actually works: <a href=3D"https://github.com/=
shentok/qemu/commits/pegasos2">https://github.com/shentok/qemu/commits/pega=
sos2</a> (Tested with MorphOS with and without pegasos2.rom).<br></div><div=
><br></div><div>Best regards,</div><div>Bernhard<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div><br></div><div>I might have further comments but I think it&#39;s en=
ough for now.</div><div><br></div><div>Thanks again for making via-ac97 wor=
k!</div><div><br></div><div>Best regards,</div><div>Bernhard<br></div></div=
></div>
</blockquote></div></div>

--0000000000000da17f05f54e765f--

