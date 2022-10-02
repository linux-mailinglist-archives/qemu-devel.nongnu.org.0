Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D795F23B7
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 16:59:08 +0200 (CEST)
Received: from localhost ([::1]:36930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of0Qs-000141-KT
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 10:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <commandspider12@gmail.com>)
 id 1of0Pi-0007is-4p
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 10:57:54 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:38720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <commandspider12@gmail.com>)
 id 1of0Pg-0002Av-Dx
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 10:57:53 -0400
Received: by mail-qk1-x732.google.com with SMTP id 3so5427710qka.5
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=6moPFtSiuFLVbgtPetSUBgo4aGfPohW/s2ESjUnAJrs=;
 b=oNDYOHEeWZNvJVbMT/nOt7RzKdMaWiXjpya8O5xTs9bUUlpIgC8bO9K58bYUNpt+KE
 a8+ZxE0IqTNLmliJ3bRfkhMrTUloYiHx8r9MvBQVg20bQdAjy6rueZ8sKl6JMrFdOIKc
 YLxH54h7LaeyDfOb9Hi1Yaf19zSY+LCAwTPvNU+6VcKp0SGq9S1in/mOmnTqu38NYtj8
 a6WRYvKJSkvZBRgs4/320gN6y+cAGHIcwCInzE/l0JNPRGXw+OqHNavW09Cfgieal4rQ
 R+N0DEwBRr3onM2Il81Fczt4xra3IFnmxIHPhI6+4fyFnrJwza0g+veSY1pmpTdfvnJQ
 gWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6moPFtSiuFLVbgtPetSUBgo4aGfPohW/s2ESjUnAJrs=;
 b=G8au2h7QiCz4CWCP2y+Iigml7a7cY3UUpC54ODek9QNjqoadBMlrwd/O3eOZ72gCPS
 WKW8lF5vvkTIev3kvmdp1R4AqSOXt8BXxtfMTGmFSG4eRNwcERvun3sMs+pRk4svITJE
 LE6gyAZgMJ5/wB/EKOnSCrE5D7betiZEA6OIekxZgAYcytinHvoFmUHfmVDu1pDGtf6c
 6kIJvf1X8tWZyTBklH1q1CKe64GkEszBXThIav6HoQd7cfSahrOK/rX/l74vkMXLNHjO
 DvvdJmEdtQwA4Ty9ANQxCVBAwwy0rc1B7ipjdobnDTWokOsDyaVrX6cqeoHRoGGYopHz
 IHmw==
X-Gm-Message-State: ACrzQf2/icV6qtrfGC4xfVb1sD5OM230x92cwKU/G7bjA3nqc8J7FS2k
 NYdSbCcCFO5TGZ6xLsAaH5M17g4mAEj/uxSdX44=
X-Google-Smtp-Source: AMsMyM5/aKZtRg9U5YopPS1dTyCdA8i1a0j+HrVSg7uKFmbqFjfd7ea6Rno73L/Ks1iLfuGVmCa64Tqqbp2V11JaYYo=
X-Received: by 2002:a05:620a:4143:b0:6ce:87a7:77cb with SMTP id
 k3-20020a05620a414300b006ce87a777cbmr11670929qko.230.1664722671388; Sun, 02
 Oct 2022 07:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
 <3ca717d7-fbc9-b2f9-71cc-01ef459da257@linaro.org>
 <CABVhSWNkCn-V=ZzUTEi7+hO_a4KJgfpv7N_MW_t+jKRtmTh08A@mail.gmail.com>
 <CAFEAcA-JztxsEQ-RMAtnkQxVZOFcRXxg-+Csa+uEeQWH73PQzg@mail.gmail.com>
In-Reply-To: <CAFEAcA-JztxsEQ-RMAtnkQxVZOFcRXxg-+Csa+uEeQWH73PQzg@mail.gmail.com>
From: BitFriends <commandspider12@gmail.com>
Date: Sun, 2 Oct 2022 16:57:40 +0200
Message-ID: <CABVhSWP=xt+XsMmENJh1W7rErQiQBPjAS_fufyE=LKAXpQQ-Tg@mail.gmail.com>
Subject: Re: access guest address from within instruction
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007a4ca005ea0e7371"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=commandspider12@gmail.com; helo=mail-qk1-x732.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007a4ca005ea0e7371
Content-Type: text/plain; charset="UTF-8"

thanks for the clarification, I will look at those insns. My instruction is
for some more advanced logging between guest and host, that should be done
quickly.

Regards

BitFriends

Peter Maydell <peter.maydell@linaro.org> schrieb am So., 2. Okt. 2022,
16:45:

> On Sun, 2 Oct 2022 at 10:22, BitFriends <commandspider12@gmail.com> wrote:
> > I now came up with this code:
> >
> > TCGv_i64 res = 0;
> > TCGv_i64 addr = (TCGv_i64)(env->regs[R_EDI]);
> >
> > tcg_gen_qemu_ld_i64(res, addr, 0, MO_LEUQ);
> >
> > env->regs[R_EAX] = (target_ulong)res;
>
> This is wrong, because you cannot read or write env->regs[] at
> translate time. The "translate time" vs "run time" distinction
> in a JIT is critical to understand:
>
>  * translate time is when we read guest instructions,
>    and output TCG ops. We do this once, the first time
>    we encounter a particular piece of guest code. At
>    this point you cannot directly access the state of the
>    guest CPU. This is because the exact value of EDI
>    will be *different* each time the generated code is run.
>  * run time is when we are actually emulating the guest
>    CPU, by executing the code built from the TCG ops.
>    At run time the CPU state is known and can be updated.
>
> You should look at how existing instructions in the x86
> translator generate code to read and write registers --
> you will see that they use cpu_regs[], which is an array
> of TCGv which correspond to the CPU registers (so they can
> say "generate code which will read EDI"), and they
> never use env->regs[] (which would be "read EDI right now").
>
> More generally, "read guest memory and get the result into
> a guest CPU register" is a common thing in existing x86
> instructions. So find how we implement one of those
> existing insns that's similar to what you want, and see
> how that is handled.
>
> (NB: so far you haven't said why your custom instruction
> would be any different from a normal load instruction
> that x86 already has...)
>
> thanks
> -- PMM
>

--0000000000007a4ca005ea0e7371
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">thanks for the clarification, I will look at those insns.=
 My instruction is for some more advanced logging between guest and host, t=
hat should be done quickly.<div dir=3D"auto"><br></div><div dir=3D"auto">Re=
gards=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">BitFriends</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.may=
dell@linaro.org</a>&gt; schrieb am So., 2. Okt. 2022, 16:45:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Sun, 2 Oct 2022 at 10:22, BitFriends &lt;<a hr=
ef=3D"mailto:commandspider12@gmail.com" target=3D"_blank" rel=3D"noreferrer=
">commandspider12@gmail.com</a>&gt; wrote:<br>
&gt; I now came up with this code:<br>
&gt;<br>
&gt; TCGv_i64 res =3D 0;<br>
&gt; TCGv_i64 addr =3D (TCGv_i64)(env-&gt;regs[R_EDI]);<br>
&gt;<br>
&gt; tcg_gen_qemu_ld_i64(res, addr, 0, MO_LEUQ);<br>
&gt;<br>
&gt; env-&gt;regs[R_EAX] =3D (target_ulong)res;<br>
<br>
This is wrong, because you cannot read or write env-&gt;regs[] at<br>
translate time. The &quot;translate time&quot; vs &quot;run time&quot; dist=
inction<br>
in a JIT is critical to understand:<br>
<br>
=C2=A0* translate time is when we read guest instructions,<br>
=C2=A0 =C2=A0and output TCG ops. We do this once, the first time<br>
=C2=A0 =C2=A0we encounter a particular piece of guest code. At<br>
=C2=A0 =C2=A0this point you cannot directly access the state of the<br>
=C2=A0 =C2=A0guest CPU. This is because the exact value of EDI<br>
=C2=A0 =C2=A0will be *different* each time the generated code is run.<br>
=C2=A0* run time is when we are actually emulating the guest<br>
=C2=A0 =C2=A0CPU, by executing the code built from the TCG ops.<br>
=C2=A0 =C2=A0At run time the CPU state is known and can be updated.<br>
<br>
You should look at how existing instructions in the x86<br>
translator generate code to read and write registers --<br>
you will see that they use cpu_regs[], which is an array<br>
of TCGv which correspond to the CPU registers (so they can<br>
say &quot;generate code which will read EDI&quot;), and they<br>
never use env-&gt;regs[] (which would be &quot;read EDI right now&quot;).<b=
r>
<br>
More generally, &quot;read guest memory and get the result into<br>
a guest CPU register&quot; is a common thing in existing x86<br>
instructions. So find how we implement one of those<br>
existing insns that&#39;s similar to what you want, and see<br>
how that is handled.<br>
<br>
(NB: so far you haven&#39;t said why your custom instruction<br>
would be any different from a normal load instruction<br>
that x86 already has...)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000007a4ca005ea0e7371--

