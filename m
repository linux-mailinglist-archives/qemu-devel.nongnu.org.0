Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380F03FFC1B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:34:44 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4eo-0002ws-0a
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mM4dN-0001oR-KF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:33:13 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:38643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mM4dL-0004Pv-Qq
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:33:13 -0400
Received: by mail-io1-xd30.google.com with SMTP id a13so5806036iol.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 01:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=56+vhST0mVRiWtgFOZketR3hM2FPJPSWoMnY7/YzSHA=;
 b=pwiI5Fs/wX3TgqkP84rXNzHwe3A47fxUP76ozUgCVuri4Sm5BYamkH1hTSvra7+bOu
 e7/S+47bGiyJLmyTPEV04yJ2oCf5oaKKKLXLb3cG9SkT1BoPB0SU2KT9WzrBAiqX3Yay
 RqkUStgfxAMcoNSf3ifHrhxZ6K/Hh9CKXpvo09amllP6Ad+dvey1JjBt6M+ZihVRJ0qs
 mZ4dux1dynd/MVJ66daAlNUtwjCzy7xGT1SSBXgYCBRng9gb7IXUFr9rv6XxurK/U3nk
 79llGZn9Au9WX+EloL0zjPPk7PGUKYUY/1PN85Z7XszQhP8sBprtqos9FX9IHCOaP0lk
 4BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=56+vhST0mVRiWtgFOZketR3hM2FPJPSWoMnY7/YzSHA=;
 b=FP9B9GCm/iZEzE0Ut505RvCOsRyCXYkNCW+SS8+DHAUwBoty0P0PF1c6hrg2aUMDh/
 lEyrUK2m012XzqoO+e8Vry7CAq2ELOU/bugp9TkQT1qq19R78UDggKMP4xGKWRVRIDxm
 9cQJHBcGIeob8v5vYUCSCRfMW7c0GEprgUGb9TEXVkMAQufmNZPgtkilr8AO7qVbnEx7
 r+uc2y9YAPxDgSz5VjfF7IK5vbKmnyUTbgwPzmZJSWgnNOcnElLXOwP3/guCCyxX+ijQ
 VH9AEKWQ92Ew8U9stVxgiAIQ/2RhlRBJWaHdgnHC5EHTa9hkn7wTHTjptYBfjeBv8aGs
 tG5g==
X-Gm-Message-State: AOAM531Q5R58LwKV+2pZS909wDsa7aX+ChhcgW5yrny6fzfVFw+AD7Dz
 2DrN11XoGGeyfMbDtylx7QUEwwKNu6EzcSXoX8Q=
X-Google-Smtp-Source: ABdhPJz1uyktnoeop3WlcbLV5/BMtUCqunuSMwd+afpfcBgcSnVKdSt5WQ8p3gZTPqykcv9q+ZeFMhcSrdNcP1NCtEo=
X-Received: by 2002:a05:6638:381e:: with SMTP id
 i30mr1695145jav.9.1630657989922; 
 Fri, 03 Sep 2021 01:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
 <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
 <CALUzjTY56_A3mMtvWGFTyyZAKshWSeUfcHWJFFxYSm7P7BuNAQ@mail.gmail.com>
 <CAFEAcA_Zvw1V5=8OxUXerb3zg=C6AGLfQgZ5k1kCY5NGT-CdHw@mail.gmail.com>
In-Reply-To: <CAFEAcA_Zvw1V5=8OxUXerb3zg=C6AGLfQgZ5k1kCY5NGT-CdHw@mail.gmail.com>
From: Duo jia <jiaduo19920301@gmail.com>
Date: Fri, 3 Sep 2021 16:32:59 +0800
Message-ID: <CALUzjTa1ZNFFjdo6eCy13TCrqAibYLMzJ7JqjY5+GwpukhfMAQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_How_does_qemu_detect_the_completion_of_interrupt?=
 =?UTF-8?Q?_execution=EF=BC=9F?=
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003d525905cb132698"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-io1-xd30.google.com
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

--0000000000003d525905cb132698
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I understand the hardware=EF=BC=8Cbut How to achieve this function with qem=
u=EF=BC=9F=EF=BC=8C

For example, this interrupt is not allowed to be nested. When the new
interrupt comes, how can I detect that the interrupt is executing?

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B49=E6=9C=882=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=883:43=E5=86=99=E9=81=93=EF=BC=
=9A

> On Thu, 2 Sept 2021 at 03:18, Duo jia <jiaduo19920301@gmail.com> wrote:
> >
> >   Hi,
> >    thank you for your response.
> >    As you say
> >>
> >>  "End of interrupt handling is entirely dependent on what the
> >> guest hardware being emulated is. Usually the guest software
> >> will indicate "interrupt handled" back to the interrupt
> >> controller (perhaps by writing a register; depends on the
> >> interrupt controller), and the interrupt controller will
> >> then look at what the next highest priority pending interrupt
> >> is and signal that back to the CPU, or do nothing if there's
> >> no new interrupt. So the second interrupt will automatically
> >> be taken and handled once the first one has finished,
> >> as a result of this interrupt controller and guest OS
> >> interaction."
> >
> > I agree with that. I has try some method, But Still have some problems.
> >
> > Q1:
> > My guest(target) cpu seem don't have a   "interrupt handled" , And I
> don't know How/When to program the  " interrupt controller"   to check th=
e
> second interrupt when the first over.
>
> There is always some way for the CPU to tell the system
> that an interrupt has been dealt with. You don't say what
> architecture you're working on, so it's impossible to
> be more specific. But I think it is very likely that you
> have misunderstood how the hardware works. Typically
> you don't need to program the interrupt controller to
> check for a second interrupt -- the hw specification
> says that it does that automatically.
>
> > Also I found the new problem(maybe bug) , when first interrupt
> > not over, the second interrupt may occur
>
> Whether this is permitted or not depends upon the
> specification of the hardware. Some interrupt controllers
> never allow preemption of interrupts like this. Some
> do. Some allow it but only if the guest has programmed
> it to permit it (eg by setting priority registers).
> As always, you need to look at what the hardware
> specification says each component in the system must do
> (and at how they interact with each other).
>
> thanks
> -- PMM
>

--0000000000003d525905cb132698
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I understand the hardware=EF=BC=8Cbut=C2=A0How to achieve =
this function with qemu=EF=BC=9F=EF=BC=8C<div><br></div><div>For example, t=
his interrupt is not allowed to be nested. When the new interrupt comes, ho=
w can I detect that the interrupt is executing?<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Peter Maydell &lt;=
<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt=
; =E4=BA=8E2021=E5=B9=B49=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=
=8D=883:43=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Thu, 2 Sept 2021 at 03:18, Duo jia &lt;<a href=3D"=
mailto:jiaduo19920301@gmail.com" target=3D"_blank">jiaduo19920301@gmail.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Hi,<br>
&gt;=C2=A0 =C2=A0 thank you for your response.<br>
&gt;=C2=A0 =C2=A0 As you say<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 &quot;End of interrupt handling is entirely dependent on wha=
t the<br>
&gt;&gt; guest hardware being emulated is. Usually the guest software<br>
&gt;&gt; will indicate &quot;interrupt handled&quot; back to the interrupt<=
br>
&gt;&gt; controller (perhaps by writing a register; depends on the<br>
&gt;&gt; interrupt controller), and the interrupt controller will<br>
&gt;&gt; then look at what the next highest priority pending interrupt<br>
&gt;&gt; is and signal that back to the CPU, or do nothing if there&#39;s<b=
r>
&gt;&gt; no new interrupt. So the second interrupt will automatically<br>
&gt;&gt; be taken and handled once the first one has finished,<br>
&gt;&gt; as a result of this interrupt controller and guest OS<br>
&gt;&gt; interaction.&quot;<br>
&gt;<br>
&gt; I agree with that. I has try some method, But Still have some problems=
.<br>
&gt;<br>
&gt; Q1:<br>
&gt; My guest(target) cpu seem don&#39;t have a=C2=A0 =C2=A0&quot;interrupt=
 handled&quot; , And I don&#39;t know How/When to program the=C2=A0 &quot; =
interrupt controller&quot;=C2=A0 =C2=A0to check the second interrupt when t=
he first over.<br>
<br>
There is always some way for the CPU to tell the system<br>
that an interrupt has been dealt with. You don&#39;t say what<br>
architecture you&#39;re working on, so it&#39;s impossible to<br>
be more specific. But I think it is very likely that you<br>
have misunderstood how the hardware works. Typically<br>
you don&#39;t need to program the interrupt controller to<br>
check for a second interrupt -- the hw specification<br>
says that it does that automatically.<br>
<br>
&gt; Also I found the new problem(maybe bug) , when first interrupt<br>
&gt; not over, the second interrupt may occur<br>
<br>
Whether this is permitted or not depends upon the<br>
specification of the hardware. Some interrupt controllers<br>
never allow preemption of interrupts like this. Some<br>
do. Some allow it but only if the guest has programmed<br>
it to permit it (eg by setting priority registers).<br>
As always, you need to look at what the hardware<br>
specification says each component in the system must do<br>
(and at how they interact with each other).<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000003d525905cb132698--

