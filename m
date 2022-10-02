Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B35F23B4
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 16:54:35 +0200 (CEST)
Received: from localhost ([::1]:42616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of0MU-000749-E7
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 10:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <commandspider12@gmail.com>)
 id 1of0L7-0005Ne-40
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 10:53:09 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <commandspider12@gmail.com>)
 id 1of0L5-0001JF-9D
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 10:53:08 -0400
Received: by mail-qt1-x833.google.com with SMTP id gb14so5202954qtb.3
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 07:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=Ey3AR4K4hR3pMPO9DtW9UEiVUrTlJ5NnVVoOtg2f8Ac=;
 b=APAn+Wa6MAAPQkvwSTaF7f3PNB16SJy7ZARuWf+szJz5EsFMcAL/wnvVTSmYt+EXiF
 4W4tsbDJFz2zPrHHfjfMK1aqxoi18/knlzcLVXYKUNNYUbk6dvb8fIj0xEqPh2FlWmQ8
 2Bses/awqYr7/p5cSLb2oFevEENY7m9Orx6PKGme8AxZr3QPfBze+WIhoGVk0HXjw/1P
 YSiFnSzTVgHbloim63w0IDje99E9u8DfJ0lQpyBodSzSzL4ySI+JeK/szFkeHertPO3r
 ZEHuT2Uen+GEzNa/cIw7S0sc4Mss3W0Oq65JX+G8KSTCQgmw/4JeE/cFoDBCsAAtFuU3
 k2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ey3AR4K4hR3pMPO9DtW9UEiVUrTlJ5NnVVoOtg2f8Ac=;
 b=O+5LIcWjJHLO1K6boYmVNXcYNt+7vudH2QwzHQwgvogSjSq/e+7hfQ3l1ltheoHQyp
 aqxC6WRsRK+yr6+APaaqrme6nRMbyV0GwM33B8jDQiqDnGuHXbhUd/4M2G7kKeG92Imf
 PBF3uGOKpAeVC0GzOnuNdEsCcDceWjRy9W0DLkuqYl5R9CRKrnh03CQYemohHutc1O+M
 qFaltgMaF9lcUhW7QVI9hACLHm35/duULQunABGzr1Fgk+7DvrvqdK1dpt4N7ia4vCzl
 jfX1QeQf4xMVAO2TCAuSQOreMTmbWwGllR8LvBn0UTrhN0Ax1KWJiFiCItIPK09yUeSZ
 i8EQ==
X-Gm-Message-State: ACrzQf3vyTBw/HXLdHvVncpTp5h9tWXwSaykDxLwPTWgd9fCWSSzXFPo
 z+EC4rcMCFk70+8glqT0dxJYKe0A4DQ5UGIW0otcvo0e
X-Google-Smtp-Source: AMsMyM4EqSMFGNvQWA41vurAi7ZM0Qe9JX+2qp+W1WJdvs+lw5C8my0kZTXOPIIAaGrOA626q/EWE+haLdmktQfIvwQ=
X-Received: by 2002:ac8:5dcd:0:b0:35c:e209:39e7 with SMTP id
 e13-20020ac85dcd000000b0035ce20939e7mr13544254qtx.651.1664722386257; Sun, 02
 Oct 2022 07:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
 <3ca717d7-fbc9-b2f9-71cc-01ef459da257@linaro.org>
 <CABVhSWNkCn-V=ZzUTEi7+hO_a4KJgfpv7N_MW_t+jKRtmTh08A@mail.gmail.com>
 <e1538b70-8e32-a6b7-4132-77a7ea6a60fa@linaro.org>
In-Reply-To: <e1538b70-8e32-a6b7-4132-77a7ea6a60fa@linaro.org>
From: BitFriends <commandspider12@gmail.com>
Date: Sun, 2 Oct 2022 16:52:55 +0200
Message-ID: <CABVhSWPQnDCCBhCtSUFVBkyFBzPjGyvk1wixpHW0GNooQ7b32g@mail.gmail.com>
Subject: Re: access guest address from within instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007b8b6005ea0e6243"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=commandspider12@gmail.com; helo=mail-qt1-x833.google.com
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

--0000000000007b8b6005ea0e6243
Content-Type: text/plain; charset="UTF-8"

my bad, then I was mislead by "Which is, in general, what you want for
implementing a custom instruction". Also the code around me is full of gen
instructions, so I thought that's what I should use.

So, when reading the doc I found out about the cpu_{ld,st}*_mmu functions.
That sounds more what I want for a direct action, No?

Regards

BitFriends

Richard Henderson <richard.henderson@linaro.org> schrieb am So., 2. Okt.
2022, 16:40:

> On 10/2/22 02:20, BitFriends wrote:
> > I now came up with this code:
> >
> > TCGv_i64 res = 0;
> > TCGv_i64 addr = (TCGv_i64)(env->regs[R_EDI]);
> >
> > tcg_gen_qemu_ld_i64(res, addr, 0, MO_LEUQ);
> >
> > env->regs[R_EAX] = (target_ulong)res;
> >
> > However this crashes afterwards in test_bit. Maybe this is caused by an
> invalid access?
> > Anything wrong about the code? This still gives some warnings, like
> TCGv_i32 expected (and
> > when you use TCGv_i32, it says TCGv_i64 expected) plus some casting
> warnings.
>
> It is as if you did not read the second paragraph of my response at all.
> tcg_gen_qemu_ld_i64 is for generating code, not performing a direct action.
> Can you see how your code differs from *all* of the code around it?
>
> r~
>
> >
> > Am Sa., 1. Okt. 2022 um 22:23 Uhr schrieb Richard Henderson <
> richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>>:
> >
> >     On 10/1/22 13:10, BitFriends wrote:
> >      > Hello,
> >      >
> >      > I am trying to create a custom instruction that accesses guest
> memory specified by an
> >      > address in a register. I specifically want to read from that
> address. So I tried to do
> >      > that using "tcg_gen_qemu_ld_i64(&res, env->regs[R_EDI], 0,
> MO_LEUQ);", but that
> >     doesn't
> >      > save any result in res.
> >
> >     This statement should have given you compilation errors, so I don't
> know what you mean by
> >     "doesn't save any result".  There's clearly a disconnect between
> what you describe and
> >     what you actually attempted.
> >
> >     Anyway, by the name you can see that function "gen"erates a "tcg"
> operation, which is
> >     then
> >     later compiled by the jit, the output of which is later executed to
> produce a result.
> >     Which is, in general, what you want for implementing a custom
> instruction.
> >
> >
> >     r~
> >
>
>

--0000000000007b8b6005ea0e6243
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">my bad, then I was mislead by &quot;Which is, in general,=
 what you want for implementing a custom instruction&quot;. Also the code a=
round me is full of gen instructions, so I thought that&#39;s what I should=
 use.=C2=A0<div dir=3D"auto"><br></div><div dir=3D"auto">So, when reading t=
he doc I found out about the cpu_{ld,st}*_mmu functions. That sounds more w=
hat I want for a direct action, No?</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Regards</div><div dir=3D"auto"><br></div><div dir=3D"auto">BitF=
riends=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Richard Henderson &lt;<a href=3D"mailto:richard.henderson=
@linaro.org" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ric=
hard.henderson@linaro.org</a>&gt; schrieb am So., 2. Okt. 2022, 16:40:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On 10/2/22 02:20, BitFriends wrote:<br>
&gt; I now came up with this code:<br>
&gt; <br>
&gt; TCGv_i64 res =3D 0;<br>
&gt; TCGv_i64 addr =3D (TCGv_i64)(env-&gt;regs[R_EDI]);<br>
&gt; <br>
&gt; tcg_gen_qemu_ld_i64(res, addr, 0, MO_LEUQ);<br>
&gt; <br>
&gt; env-&gt;regs[R_EAX] =3D (target_ulong)res;<br>
&gt; <br>
&gt; However this crashes afterwards in test_bit. Maybe this is caused by a=
n invalid access? <br>
&gt; Anything wrong about the code? This still gives some warnings, like TC=
Gv_i32 expected (and <br>
&gt; when you use TCGv_i32, it says TCGv_i64 expected) plus some casting wa=
rnings.<br>
<br>
It is as if you did not read the second paragraph of my response at all.<br=
>
tcg_gen_qemu_ld_i64 is for generating code, not performing a direct action.=
<br>
Can you see how your code differs from *all* of the code around it?<br>
<br>
r~<br>
<br>
&gt; <br>
&gt; Am Sa., 1. Okt. 2022 um 22:23=C2=A0Uhr schrieb Richard Henderson &lt;<=
a href=3D"mailto:richard.henderson@linaro.org" rel=3D"noreferrer noreferrer=
 noreferrer noreferrer" target=3D"_blank">richard.henderson@linaro.org</a> =
<br>
&gt; &lt;mailto:<a href=3D"mailto:richard.henderson@linaro.org" rel=3D"nore=
ferrer noreferrer noreferrer noreferrer" target=3D"_blank">richard.henderso=
n@linaro.org</a>&gt;&gt;:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 10/1/22 13:10, BitFriends wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I am trying to create a custom instruction th=
at accesses guest memory specified by an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; address in a register. I specifically want to=
 read from that address. So I tried to do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; that using &quot;tcg_gen_qemu_ld_i64(&amp;res=
, env-&gt;regs[R_EDI], 0, MO_LEUQ);&quot;, but that<br>
&gt;=C2=A0 =C2=A0 =C2=A0doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; save any result in res.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This statement should have given you compilation er=
rors, so I don&#39;t know what you mean by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;doesn&#39;t save any result&quot;.=C2=A0 Ther=
e&#39;s clearly a disconnect between what you describe and<br>
&gt;=C2=A0 =C2=A0 =C2=A0what you actually attempted.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Anyway, by the name you can see that function &quot=
;gen&quot;erates a &quot;tcg&quot; operation, which is<br>
&gt;=C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0later compiled by the jit, the output of which is l=
ater executed to produce a result.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Which is, in general, what you want for implementin=
g a custom instruction.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0r~<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000007b8b6005ea0e6243--

