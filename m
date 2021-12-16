Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE287477FBB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:00:56 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyo3-0008KT-UJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:00:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1mxwxw-0000JH-7w; Thu, 16 Dec 2021 15:03:00 -0500
Received: from [2607:f8b0:4864:20::f30] (port=40602
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1mxwxu-0001dX-9o; Thu, 16 Dec 2021 15:02:59 -0500
Received: by mail-qv1-xf30.google.com with SMTP id eq6so325792qvb.7;
 Thu, 16 Dec 2021 12:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KLxLm8TpKavGXoLgANwIbESUlYfyTO+539rjIefpqJ4=;
 b=m6FlQJRdaEDx+iB6Qi6EMVRG4Yx7hbERZdEbclpflmUO29aXjYletBnBeyjxGP/fQ4
 NbUOpFItGkrEqLR26PTGzbW9UTSp7ltEz6WOLHcHZauCf9I6t82csopSIZEKcwcVXKrq
 xCvAdiOnxU++3m0fVDCH3zWGg99PUhlFYivs3ybZ3RvT16SxzFoccv7yMqjPkEqHxea5
 D+UXldF+Xck2czyPQLSSs/PaSwEv3Oz0ObQ13pEmD7jSFoPjREr7yXshfmL2LUsAV+4w
 X0xm6092d5NJSJJHajkcbO158Nthn5hrd6XJtLQFn/bKZ05p9mZA5bz9NzJOk6YR3t80
 byng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KLxLm8TpKavGXoLgANwIbESUlYfyTO+539rjIefpqJ4=;
 b=LwzSpj2PZOdaNAe/5O8hseUY+r5oBvw/DM1PikWW7WIknZQE+aaRV7xngi+In81NgJ
 K21oOyewGt8UCxtqnjfX6Lm5n05kzuCyAUnE8YxvwrSMlOY2uyuPxIQBq+XPYVv4/zZ1
 IuA7GmDVrfOcZkW1/fGJK4pQ4RuZ5EDwPloS7zTL1PjW8TiDmjChtSa/T9DDFphK3TgU
 9HiN6Hbtnc5IaymrGkClKS24bcsUbQ8FnuwKT0mVqQUAdYUyxBtJ4JslRlpFmu5NePmp
 wB5VobSkm6d/EQNsU3xKS38mPEwc6XN/XToXiGKcZNEu3baECUY2QPwt1W3tHCgK5j8c
 ghzA==
X-Gm-Message-State: AOAM532iBFm9jWHmwur8QMESC3UiVsDQuQYadsp2pEIg1aWC6LIFoxev
 mcrYRTZrME2j8HcYi5w+TPwVYMbm6dkJ+vtiQU8=
X-Google-Smtp-Source: ABdhPJxuq3ZvJVNOdhSAo77zTDAIYMFdkEtVeoXLUKOHgrsB8gy0e3R7uvvQoFb0u7vWFqsFpjmY+xmY0zVYSeiPKj8=
X-Received: by 2002:a05:6214:c6e:: with SMTP id
 t14mr12155345qvj.57.1639684976597; 
 Thu, 16 Dec 2021 12:02:56 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT1x=9z9jwRxUg-J_nyGQKiga=xcDddWzG5a9HCkiC2Tog@mail.gmail.com>
 <6b16b0e4-c0db-02de-1d95-ec831fdff938@amsat.org>
 <CAFEAcA9v6JQD3OR1tKL7yJaY+=-ohhvMCzF4xpSRAATXAB59vA@mail.gmail.com>
In-Reply-To: <CAFEAcA9v6JQD3OR1tKL7yJaY+=-ohhvMCzF4xpSRAATXAB59vA@mail.gmail.com>
From: abhijeet inamdar <abhijeetinamdar3005@gmail.com>
Date: Thu, 16 Dec 2021 21:02:45 +0100
Message-ID: <CAP4GjT1dhNPhHgNWJFH1CJg4zkZU0zkGr-rAqTZE1-HzqG=ahw@mail.gmail.com>
Subject: Re: Exception return
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000092dca805d348e845"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=abhijeetinamdar3005@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Dec 2021 16:15:06 -0500
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
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000092dca805d348e845
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I made some changes to the code in qemu :
https://github.com/qemu/qemu/blob/stable-6.0/target/arm/cpu.c#L339 . I have
commented out the variable vecbase and directly given the address of my
vector address(not zero) or where they are located in our binary file. Is
that a problem?

BR.
Abhijeet.

On Thu, Dec 16, 2021 at 7:47 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 16 Dec 2021 at 17:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
> wrote:
> >
> > Cc'ing qemu-arm developers.
> >
> > On 12/16/21 18:31, abhijeet inamdar wrote:
> > > Hi,
> > >
> > > I was running my .elf file on my custom machine(CM3) and was hit with
> > > this error when debugging and had the required -d flags and single
> stepping.
> > >
> > > IN: Hal_MemFault
> > > 0x7004e794:  4770       bx       lr
> > >
> > > Trace 0: 0x7f4faa471100 [00000000/7004e794/0x312000c1]  Hal_MemFault
> > > R00=3D7004938d R01=3D00000000 R02=3D7004938c R03=3Dffffffff
> > > R04=3D7005e410 R05=3D10020000 R06=3De000eda0 R07=3D00000000
> > > R08=3D00000010 R09=3D1003f8e0 R10=3De000ed94 R11=3D00000000
> > > R12=3Dffffffff R13=3D1003dbe0 R14=3Dfffffff9 R15=3D7004e794
> > > XPSR=3D01000003 ---- T handler
> > > Taking exception 8 [QEMU v7M exception exit]
> > > Exception return: magic PC fffffff9 previous exception 3
> > > M profile return from interrupt with misaligned PC is UNPREDICTABLE o=
n
> v7M
> > > ...successful exception return
> > > DRBAR[6]: 0xa0000000 misaligned to DRSR region size, mask =3D 0x3ffff=
fff
> > > Taking exception 3 [Prefetch Abort]
> > > ...with CFSR.IACCVIOL
> > > ...taking pending nonsecure exception 3
>
> The logging here tells you what happened:
>
>  * we are in an exception handler
>  * we do the bx lr to magic value which is M-profile's exception-return
>  * ...but there's something wrong with the return address we pull
>    off the stack, because it's not an aligned value (its least
>    significant bit is set)
>  * moreover, it's an address that corresponds to an MPU region
>    that has been misprogrammed (the DRBAR value isn't right);
>    the MPU treats such regions as not matching
>  * and so we take an instruction access fault
>
> So you have two problems:
>  (1) the PC value on the stack that you're trying to return to is wrong
>  (2) you're programming the MPU wrong
>
> You need to investigate and fix both.
>
> -- PMM
>

--00000000000092dca805d348e845
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I made some changes to the code in qemu :=C2=A0<a href=3D"=
https://github.com/qemu/qemu/blob/stable-6.0/target/arm/cpu.c#L339">https:/=
/github.com/qemu/qemu/blob/stable-6.0/target/arm/cpu.c#L339</a> . I have co=
mmented out the variable vecbase and directly given the address of my vecto=
r address(not zero) or where they are=C2=A0located in our binary file. Is t=
hat a problem?=C2=A0<div><br></div><div>BR.</div><div>Abhijeet.</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Dec 16, 2021 at 7:47 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell=
@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Thu, 16 Dec 2021 at 17:44, Philippe=
 Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank=
">f4bug@amsat.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Cc&#39;ing qemu-arm developers.<br>
&gt;<br>
&gt; On 12/16/21 18:31, abhijeet inamdar wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I was running my .elf file on my custom machine(CM3) and was hit =
with<br>
&gt; &gt; this error when debugging and had the required -d flags and singl=
e stepping.<br>
&gt; &gt;<br>
&gt; &gt; IN: Hal_MemFault<br>
&gt; &gt; 0x7004e794:=C2=A0 4770=C2=A0 =C2=A0 =C2=A0 =C2=A0bx=C2=A0 =C2=A0 =
=C2=A0 =C2=A0lr<br>
&gt; &gt;<br>
&gt; &gt; Trace 0: 0x7f4faa471100 [00000000/7004e794/0x312000c1]=C2=A0 Hal_=
MemFault<br>
&gt; &gt; R00=3D7004938d R01=3D00000000 R02=3D7004938c R03=3Dffffffff<br>
&gt; &gt; R04=3D7005e410 R05=3D10020000 R06=3De000eda0 R07=3D00000000<br>
&gt; &gt; R08=3D00000010 R09=3D1003f8e0 R10=3De000ed94 R11=3D00000000<br>
&gt; &gt; R12=3Dffffffff R13=3D1003dbe0 R14=3Dfffffff9 R15=3D7004e794<br>
&gt; &gt; XPSR=3D01000003 ---- T handler<br>
&gt; &gt; Taking exception 8 [QEMU v7M exception exit]<br>
&gt; &gt; Exception return: magic PC fffffff9 previous exception 3<br>
&gt; &gt; M profile return from interrupt with misaligned PC is UNPREDICTAB=
LE on v7M<br>
&gt; &gt; ...successful exception return<br>
&gt; &gt; DRBAR[6]: 0xa0000000 misaligned to DRSR region size, mask =3D 0x3=
fffffff<br>
&gt; &gt; Taking exception 3 [Prefetch Abort]<br>
&gt; &gt; ...with CFSR.IACCVIOL<br>
&gt; &gt; ...taking pending nonsecure exception 3<br>
<br>
The logging here tells you what happened:<br>
<br>
=C2=A0* we are in an exception handler<br>
=C2=A0* we do the bx lr to magic value which is M-profile&#39;s exception-r=
eturn<br>
=C2=A0* ...but there&#39;s something wrong with the return address we pull<=
br>
=C2=A0 =C2=A0off the stack, because it&#39;s not an aligned value (its leas=
t<br>
=C2=A0 =C2=A0significant bit is set)<br>
=C2=A0* moreover, it&#39;s an address that corresponds to an MPU region<br>
=C2=A0 =C2=A0that has been misprogrammed (the DRBAR value isn&#39;t right);=
<br>
=C2=A0 =C2=A0the MPU treats such regions as not matching<br>
=C2=A0* and so we take an instruction access fault<br>
<br>
So you have two problems:<br>
=C2=A0(1) the PC value on the stack that you&#39;re trying to return to is =
wrong<br>
=C2=A0(2) you&#39;re programming the MPU wrong<br>
<br>
You need to investigate and fix both.<br>
<br>
-- PMM<br>
</blockquote></div>

--00000000000092dca805d348e845--

