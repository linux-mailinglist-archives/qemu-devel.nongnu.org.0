Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D79F407977
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 18:10:20 +0200 (CEST)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP5a6-0002NZ-PW
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 12:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hinkocevar@gmail.com>)
 id 1mP5Z1-0001iS-TG
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:09:11 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:39705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hinkocevar@gmail.com>)
 id 1mP5Z0-0001IE-3m
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:09:11 -0400
Received: by mail-qk1-x72d.google.com with SMTP id y144so5611371qkb.6
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mtH6i5Gm4oBoAxRHhUzQ1NpmdYYo20Q/DKBG7mT5r6c=;
 b=UR2u2SuH6JT29ymzAQ4FTy9QL4T9XnIFz1scITj8bJNmfaPT+BPsMIODJpvhzVrXpH
 e2DNHI3bDShzMmCW9H1qIiuLaxzo3UtiW+g8ZI5WYj/C2rHKrmo+rssyBWSCGef7bRRi
 Va4TfFY5ZYQM6aP/FmtMHFCmJJiQ8nSbknaTvEeEHQfyCW2bDSVMg1PAeCF59rBC+PIs
 h8+RqhKp2AM/uM//JaXSkwiZEdnwxit5YaHCnMs+QCVqFsKQnkww9igZJSpS5EiHu6Uh
 sLuZHO0os9UrZ6plad5aagM2rwCEDrtT/+v+qD3R+9KwgZnmdd0+7Fj2ZZpOEcntxzpR
 r1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mtH6i5Gm4oBoAxRHhUzQ1NpmdYYo20Q/DKBG7mT5r6c=;
 b=y5glKUPlqF9wuajmg+rAo3S88el3qaUP9hJxr2aqwihVwr1nPpKoGewiTGE3pcK8Ds
 6UgEU2hmKAt284ZHg/y8IkWXtiDskYRqD/RkLwtKkhdPkQs+Jl4nELYFxQy2gPIZmbTZ
 dwteX1MAXg+bj1ZdW2yMalFnohWlTJ51w69rMBYcZronA2AGvbKKBOqoczqeo5D3+8bW
 1FqvTzWf/MMlCMvTy52yOaUIPTS01WRh6CppmfYuxbqXBXYRK9iIaMjp8sveEV0mVwNK
 VMveB+P3jWD5kKNldGXtCOinRo0THwU7wAFOTkaBsmHl18y9OhTi4rQIN9kdYL/CH6PN
 cBvA==
X-Gm-Message-State: AOAM531i0Uxs/s8trmnFvBcYlDv2Rl8cPAt3oKONJY0dWA3UbwQecrBC
 C9hvp7wr0uAdMTf6UiG+eOD2mHV17vift3g4+LI=
X-Google-Smtp-Source: ABdhPJxVNq3AEVszMvgsBDQ6M9Uzqtk5WmmtWaZLHkbmr+6arMFWFW/C0aCVsv9ppWWfwU6fMFNGHTLX6ooYdY0CNqA=
X-Received: by 2002:a37:8242:: with SMTP id e63mr2659116qkd.294.1631376548254; 
 Sat, 11 Sep 2021 09:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <CACOP0z-muPwpLjimweiACOoSiAeULS_aP16+_9goOZv12gTxug@mail.gmail.com>
 <fe2a2b9d-e7b6-cbf6-ea3a-49702e297562@amsat.org>
 <CAFEAcA8DHC+_2BqqdH88oVDoNuPGuWysMC3DjDt4oj2_wfAKLg@mail.gmail.com>
In-Reply-To: <CAFEAcA8DHC+_2BqqdH88oVDoNuPGuWysMC3DjDt4oj2_wfAKLg@mail.gmail.com>
From: Hinko Kocevar <hinkocevar@gmail.com>
Date: Sat, 11 Sep 2021 18:08:57 +0200
Message-ID: <CACOP0z_YODj672p_5qLYSw7HCOGgNG-7GyptcJ=VSpzXdszC0A@mail.gmail.com>
Subject: Re: simple serial device emulation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a758d605cbba7342"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=hinkocevar@gmail.com; helo=mail-qk1-x72d.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a758d605cbba7342
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Sep 2021 at 17:24, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 10 Sept 2021 at 22:51, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
> wrote:
> >
> > On 9/10/21 9:35 PM, Hinko Kocevar wrote:
> > > I have an emulated MMIO area holding couple of registers that deal wi=
th
> > > serial UART. Very simple access to the Tx and Rx registers from the
> > > userspace point of view involves polling for a bit in one register an=
d
> > > then writing another; when there is room for another character. When
> the
> > > guest app does write to a MMIO Tx register, as expected, io_writex() =
is
> > > invoked and my handler is invoked. At the moment it does not do much.
> > > I'm thinking now that the character needs to be fed to the serial
> device
> > > instance or something.
> > >
> > > Where should I look for suitable examples in the qemu code? I reckon
> > > that other machines exist that do the similar. I found lots of
> > > serial_mm_init() and sysbus_mmio_map() uses around serial port
> instances
> > > but I'm not sure how to couple my "serial ops" to the "bus" or Serial=
MM
> > > (if that is the way to go).
> >
> > Your device is a "character device frontend". See the API in
> > include/chardev/char-fe.h. Frontends can be connected to various
> > backends. The simplest backend is the standard input/output
> > (named 'stdio').
>
> More specifically, it's a UART model. All of our UART models
> are in hw/char/.
>
> > I recommend you to look at the hw/char/digic-uart.c model which is
> > quite simple, it returns the last char received, and only transmit
> > one char per I/O.


Phil, that was perfect. Just something someone like me with no prior
experience in hacking qemu can use. I have my chars on stdout as we speak.
I took the digic code as a starting point.


>
> digic-uart does still use the old qemu_chr_fe_write_all() blocking
> API, though (there is an XXX comment about that). If you want an
> example of the non-blocking approach, try hw/char/cmsdk-apb-uart.c.


Peter, thanks for the input. I=E2=80=99ll look into the improved handling, =
too!


>
> > Finally the hw/char/serial.c is probably the most complete models,
> > with 2 FIFOs (RX & TX) and try to respect timings.
>
> hw/char/serial.c is kind of complicated though, both because
> it's quite old code that's been gradually modernized, and also
> because it has to support both mmio and io port type serial ports.
> So I'm not sure I'd recommend it as an example to learn from.


Good to know!

//hinko
--=20
.. the more I see the less I believe.., AE AoR

--000000000000a758d605cbba7342
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">O=
n Sat, 11 Sep 2021 at 17:24, Peter Maydell &lt;<a href=3D"mailto:peter.mayd=
ell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 10 Sept 2021 a=
t 22:51, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org"=
 target=3D"_blank">f4bug@amsat.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 9/10/21 9:35 PM, Hinko Kocevar wrote:<br>
&gt; &gt; I have an emulated MMIO area holding couple of registers that dea=
l with<br>
&gt; &gt; serial UART. Very simple access to the Tx and Rx registers from t=
he<br>
&gt; &gt; userspace point of view involves polling for a bit in one registe=
r and<br>
&gt; &gt; then writing another; when there is room for another character. W=
hen the<br>
&gt; &gt; guest app does write to a MMIO Tx register, as expected, io_write=
x() is<br>
&gt; &gt; invoked and my handler is invoked. At the moment it does not do m=
uch.<br>
&gt; &gt; I&#39;m thinking now that the character needs to be fed to the se=
rial device<br>
&gt; &gt; instance or something.<br>
&gt; &gt;<br>
&gt; &gt; Where should I look for suitable examples in the qemu code? I rec=
kon<br>
&gt; &gt; that other machines exist that do the similar. I found lots of<br=
>
&gt; &gt; serial_mm_init() and sysbus_mmio_map() uses around serial port in=
stances<br>
&gt; &gt; but I&#39;m not sure how to couple my &quot;serial ops&quot; to t=
he &quot;bus&quot; or SerialMM<br>
&gt; &gt; (if that is the way to go).<br>
&gt;<br>
&gt; Your device is a &quot;character device frontend&quot;. See the API in=
<br>
&gt; include/chardev/char-fe.h. Frontends can be connected to various<br>
&gt; backends. The simplest backend is the standard input/output<br>
&gt; (named &#39;stdio&#39;).<br>
<br>
More specifically, it&#39;s a UART model. All of our UART models<br>
are in hw/char/.<br>
<br>
&gt; I recommend you to look at the hw/char/digic-uart.c model which is<br>
&gt; quite simple, it returns the last char received, and only transmit<br>
&gt; one char per I/O.</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">Phil, that was perfect. Just something someone like me with no prior =
experience in hacking qemu can use. I have my chars on stdout as we speak. =
I took the digic code as a starting point.=C2=A0<br></div><div dir=3D"auto"=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
digic-uart does still use the old qemu_chr_fe_write_all() blocking<br>
API, though (there is an XXX comment about that). If you want an<br>
example of the non-blocking approach, try hw/char/cmsdk-apb-uart.c.</blockq=
uote><div dir=3D"auto"><br></div><div dir=3D"auto">Peter, thanks for the in=
put. I=E2=80=99ll look into the improved handling, too!<br></div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; Finally the hw/char/serial.c is probably the most complete models,<br>
&gt; with 2 FIFOs (RX &amp; TX) and try to respect timings.<br>
<br>
hw/char/serial.c is kind of complicated though, both because<br>
it&#39;s quite old code that&#39;s been gradually modernized, and also<br>
because it has to support both mmio and io port type serial ports.<br>
So I&#39;m not sure I&#39;d recommend it as an example to learn from.</bloc=
kquote><div dir=3D"auto"><br></div><div dir=3D"auto">Good to know!</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">//hinko</div></div></div>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e">.. the more I see the less I believe.., AE AoR</div>

--000000000000a758d605cbba7342--

