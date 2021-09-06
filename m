Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD95401514
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 04:48:40 +0200 (CEST)
Received: from localhost ([::1]:59434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN4gY-0008Pc-P0
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 22:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mN4f2-0007X2-3f
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 22:47:05 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:37813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mN4ez-0005Vz-Ro
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 22:47:03 -0400
Received: by mail-io1-xd34.google.com with SMTP id b7so6907394iob.4
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 19:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V2OxHY926gJidfXOVJi92SA+yUQ6xXfB4jg7t3vez7c=;
 b=V16jWKnQU3Iq+ZMxqlbvDfD9d7OVr+i+a1oCjmS+AJMQED0IWUnb21JE3hSESJ7gz+
 yRqXSEqgIe9jgXB1amYB6BXb506yzWeHZFvNSeK+xP4Hzk7rYi6v45/b/pbX88HOkBuF
 4jmdyjbUBEJc6x4W12RWzKL1pceigeeuiqWiQHHdo0o2vtwIDWAQxZ5BRHKFRsURlXCQ
 OI/5jZjd/71Yip+TV/20XLaNsBb+c8EizPqkALefO5nJBZ64jHQsU1tOvaHL72B7E2j1
 xH76lOaj8zgprznUSxXPl6LCTqWoT8NthIwHhOlS5Dpwh6DFVtbyEZqao2m8NAAlIxTV
 lkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V2OxHY926gJidfXOVJi92SA+yUQ6xXfB4jg7t3vez7c=;
 b=ZQvLx4SF87uDiqFttb04C91y9dBwgNP4JvGrStWVcstlt6LFIN29akig/Kd0i3N56g
 X5SqnDOmLibrAU6cgW8podiQYY1hIrBg+BWojDBvIgp8UaxNBMPnSHCF3E1s5PmDMhmm
 26psG8V6VNiRLNwS78QLqITbk2tywPGnDyK+7G+hXl0WOh2a86i4gyDy8V+TKRATPrYZ
 vvibMCEulFn3I0gJuEDIC/38L/b59QIFcxUHL1XbGZQhjkm1ErZ30kLsCymTLZ5NuFW/
 SMWF7p/vMYKPUDeJeWc9AxqPccmJ47MkuHbcraaruC5H15AU0G8iIc1rBpadoHV1jLnI
 Yvag==
X-Gm-Message-State: AOAM5306E2u+9mEpdjk79psEq3Q9l1HsKL/f4H1XGaglNVnxK1+tcM/0
 IGkT/XXk8iRlHvTZxZRl86BBTLcIxsZPA/gniKk=
X-Google-Smtp-Source: ABdhPJzmUy77aQ5Gj5veTDfTbwHOWyxwuOFfCG9SW47mgRJ587tvZcNYVeL7cRQDkmClGh4qffCPNpatm3cb2JuUwsY=
X-Received: by 2002:a5e:8711:: with SMTP id y17mr7963613ioj.16.1630896419633; 
 Sun, 05 Sep 2021 19:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
 <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
 <CALUzjTY56_A3mMtvWGFTyyZAKshWSeUfcHWJFFxYSm7P7BuNAQ@mail.gmail.com>
 <CAFEAcA_Zvw1V5=8OxUXerb3zg=C6AGLfQgZ5k1kCY5NGT-CdHw@mail.gmail.com>
 <CALUzjTa1ZNFFjdo6eCy13TCrqAibYLMzJ7JqjY5+GwpukhfMAQ@mail.gmail.com>
 <CAFEAcA_EAx858BpONn+7+wCCxwCOsUm42gUMP0LW5JZwd5AkCA@mail.gmail.com>
 <CALUzjTaDo94110xX7bAr4B5y_XEXqoFH==88hsgffau0rNgZAw@mail.gmail.com>
 <CAFEAcA-8iXVQtjv3akpwz==D6wvY7JDvKbpP5QgrLGdxBNLJeg@mail.gmail.com>
In-Reply-To: <CAFEAcA-8iXVQtjv3akpwz==D6wvY7JDvKbpP5QgrLGdxBNLJeg@mail.gmail.com>
From: Duo jia <jiaduo19920301@gmail.com>
Date: Mon, 6 Sep 2021 10:46:50 +0800
Message-ID: <CALUzjTZKYx92qkxxmcVTMJ5_b0_eL+kwjW5ZYsr8SDXi58EPpw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_How_does_qemu_detect_the_completion_of_interrupt?=
 =?UTF-8?Q?_execution=EF=BC=9F?=
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c1fb3205cb4aa9e4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c1fb3205cb4aa9e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your explanation.

 And finishing the execution of the interrupt routine will automatically
> allow a pending second interrupt to be taken immediately
>

I think this is a hardware feature. But how to achieve it with qemu

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B49=E6=9C=883=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=887:20=E5=86=99=E9=81=93=EF=BC=
=9A

> On Fri, 3 Sept 2021 at 11:54, Duo jia <jiaduo19920301@gmail.com> wrote:
> >
> > I do some support on STM8 arch, the reference manual link is:
> >>
> >>
> https://www.st.com/resource/en/reference_manual/cd00218714-stm8l050j3-stm=
8l051f3-stm8l052c6-stm8l052r8-mcus-and-stm8l151l152-stm8l162-stm8al31-stm8a=
l3l-lines-stmicroelectronics.pdf
> >
> > I don't kown when to check the "PENDING" because I can't get the when
> interrrupt exec over.
> > Is there a similar implementation in qemu=EF=BC=9F
>
> Thanks for the link. Looking at that spec, the condition
> for "interrupt execution has finished" is "the guest executes an
> IRET instruction". However, you don't need to do anything special
> at that point (beyond making the IRET instruction do the things
> it should do with restoring registers).
>
> If you look at the diagram, the check you need to make
> is "do the I1:I0 bits for this pending interrupt specify a
> higher priority than the values in CCR.I1 and I0?". That is
> how you determine "interrupt has higher priority than current one"
> to know whether to actually take the interrupt.
>
> On interrupt entry the CCR bits are set from the ITC_SPRx registers,
> which means that taking an interrupt automatically sets the CPU
> priority such that the interrupt cannot be nested. And
> finishing the execution of the interrupt routine will automatically
> allow a pending second interrupt to be taken immediately, because
> the IRET instruction restores the old values of CCR.I1,I0, and
> those old values then mean that the CPU is at a priority that
> permits the pending interrupt to be taken.
>
> thanks
> -- PMM
>

--000000000000c1fb3205cb4aa9e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for your explanation.=C2=A0<br><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0And finishing the exe=
cution of the interrupt routine will automatically<br>allow a pending secon=
d interrupt to be taken immediately<br></blockquote><div><br></div><div>I t=
hink this is a hardware feature.=C2=A0But how to achieve it with qemu<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.may=
dell@linaro.org</a>&gt; =E4=BA=8E2021=E5=B9=B49=E6=9C=883=E6=97=A5=E5=91=A8=
=E4=BA=94 =E4=B8=8B=E5=8D=887:20=E5=86=99=E9=81=93=EF=BC=9A<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Fri, 3 Sept 2021 at 11:54, D=
uo jia &lt;<a href=3D"mailto:jiaduo19920301@gmail.com" target=3D"_blank">ji=
aduo19920301@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I do some support on STM8 arch, the reference manual link is:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://www.st.com/resource/en/reference_manual/cd00218=
714-stm8l050j3-stm8l051f3-stm8l052c6-stm8l052r8-mcus-and-stm8l151l152-stm8l=
162-stm8al31-stm8al3l-lines-stmicroelectronics.pdf" rel=3D"noreferrer" targ=
et=3D"_blank">https://www.st.com/resource/en/reference_manual/cd00218714-st=
m8l050j3-stm8l051f3-stm8l052c6-stm8l052r8-mcus-and-stm8l151l152-stm8l162-st=
m8al31-stm8al3l-lines-stmicroelectronics.pdf</a><br>
&gt;<br>
&gt; I don&#39;t kown when to check the &quot;PENDING&quot; because I can&#=
39;t get the when interrrupt exec over.<br>
&gt; Is there a similar implementation in qemu=EF=BC=9F<br>
<br>
Thanks for the link. Looking at that spec, the condition<br>
for &quot;interrupt execution has finished&quot; is &quot;the guest execute=
s an<br>
IRET instruction&quot;. However, you don&#39;t need to do anything special<=
br>
at that point (beyond making the IRET instruction do the things<br>
it should do with restoring registers).<br>
<br>
If you look at the diagram, the check you need to make<br>
is &quot;do the I1:I0 bits for this pending interrupt specify a<br>
higher priority than the values in CCR.I1 and I0?&quot;. That is<br>
how you determine &quot;interrupt has higher priority than current one&quot=
;<br>
to know whether to actually take the interrupt.<br>
<br>
On interrupt entry the CCR bits are set from the ITC_SPRx registers,<br>
which means that taking an interrupt automatically sets the CPU<br>
priority such that the interrupt cannot be nested. And<br>
finishing the execution of the interrupt routine will automatically<br>
allow a pending second interrupt to be taken immediately, because<br>
the IRET instruction restores the old values of CCR.I1,I0, and<br>
those old values then mean that the CPU is at a priority that<br>
permits the pending interrupt to be taken.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000c1fb3205cb4aa9e4--

