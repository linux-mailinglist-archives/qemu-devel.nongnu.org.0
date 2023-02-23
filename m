Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EC16A12B6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:20:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJw7-0004fl-Mt; Thu, 23 Feb 2023 17:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vilen.kamalov@gmail.com>)
 id 1pVJw5-0004fK-Nk
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:19:33 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vilen.kamalov@gmail.com>)
 id 1pVJw3-0006zZ-QZ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:19:33 -0500
Received: by mail-ed1-x536.google.com with SMTP id eg37so43955132edb.12
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 14:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677190770;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wlRwJ5ockODpHXoITn3b6iDunNr4XvxJg6+GewinYUI=;
 b=mVQdf+1tpD4Dr30m5NcgFKYWhD52Lk72vQZHWThjQnCX/ogunrOQDk1htjjcAX0lS4
 i0ZbnXGCUemFWKungV7hlaO9xsD+qd8YHRCwepvW+igJhBkMMvl+KiBCc2VjkxS8IDTW
 maeJuTdQQo20mDQ0G4dmZB5R7l+GCwpHztCboHiw3j3HRnM1277shaUqbhBs5PL+WSxv
 T973aDSNOLOuwjx3EPNNAw41ADwOUL5gCHwSTcZU9KztwfhiNqD0fZ5cUI2QVZpLi679
 YkxjmMXiwTLiKahjmuZd8c60kTUPvM0ug9rjVDkHwIBFqXmDe3+veToNgG/gqxGmjci8
 uJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677190770;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wlRwJ5ockODpHXoITn3b6iDunNr4XvxJg6+GewinYUI=;
 b=3oLkYRQMFoE5+IJGLhDyfSeS0SjbI2rLOO1uqOd+UZLoWK0XjmJlaNnnEptECQ4ZyF
 rPolzU85ugG0LwqRZrEnb1/7a0MSqIPeW76yfZ2DiJGRtjmm3koXgZzGHjEyrqgqSbsL
 4T5tRxctkIPWA69wGBsGkwwI350VlNxrLNvR82trja1H2zX3ePPytMI3VAhsby8feGuP
 BoFx00+dgZqqkRGqWvz4sDcV5LncWYjwb63ma5+BSQ695SBLhmpMO7SD52lf1bRJS+97
 58feyt72vFdgUEszVBlWDGE+DVnTGRJmqqy2fDoRFAHxvHhTi/ciFDAuvNl4sqAQED5O
 ySsw==
X-Gm-Message-State: AO0yUKV3noTEX9pyAqkoO6IAwPMLnycHkpDjDMsb7vkBuUux6Lxvm5J0
 BKCdsDGc7IZdeZa3g5nfZRwDrcMDp+Vjsxn893s=
X-Google-Smtp-Source: AK7set9i8fmMOC75KjN1I0Lh+c4QUK6UsNgWThdAIXz/hSClieTTcyZS/Gkgw/hA74xxKTLOMNxySkKLvzkuxJz9ZSE=
X-Received: by 2002:a17:906:e217:b0:8b1:38d6:9853 with SMTP id
 gf23-20020a170906e21700b008b138d69853mr9883636ejb.2.1677190769885; Thu, 23
 Feb 2023 14:19:29 -0800 (PST)
MIME-Version: 1.0
References: <167718710208.23058.11278141733696221981-1@git.sr.ht>
 <1ecf3d94-8e0e-94fd-51a0-7772ea8cb786@linaro.org>
 <CAOaAw8Ypzn8QM43kdO+5ip1dkRGp2zKAsmFLV9C-bejRGOpB0Q@mail.gmail.com>
In-Reply-To: <CAOaAw8Ypzn8QM43kdO+5ip1dkRGp2zKAsmFLV9C-bejRGOpB0Q@mail.gmail.com>
From: Vilen Kamalov <vilen.kamalov@gmail.com>
Date: Fri, 24 Feb 2023 01:19:18 +0300
Message-ID: <CAOaAw8YP9genTV=RAT9tJZg7BgUuS7AVNU+QitC4qw3Oc5jEHw@mail.gmail.com>
Subject: Re: [PATCH qemu 1/1] target/i386: Fix gen_shift_rm_T1,
 wrong eflags calculation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, pbonzini@redhat.com
Content-Type: multipart/alternative; boundary="0000000000000f462105f5656880"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=vilen.kamalov@gmail.com; helo=mail-ed1-x536.google.com
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

--0000000000000f462105f5656880
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

nevermind, I do not understand how it is fixing the problem. :)

On Fri, Feb 24, 2023 at 1:13=E2=80=AFAM Vilen Kamalov <vilen.kamalov@gmail.=
com>
wrote:

> Yes, agree that my explanation is incorrect, just looked again, there is =
a
> code in the default, down the line 5488
>
>         default:
>             /* Otherwise, generate EFLAGS and replace the C bit.  */
>             gen_compute_eflags(s);
>             tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src,
> * s->tmp4,*                               ctz32(CC_C), 1);
>             break;
>
> and changing tmp0 to tmp4 fixes the issue.
>
> On Fri, Feb 24, 2023 at 1:01=E2=80=AFAM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 2/23/23 11:13, ~vilenka wrote:
>> > From: Vilen Kamalov <vilen.kamalov@gmail.com>
>> >
>> > gen_shift_rm_T1 in the uses wrong tmp0 register, eflags calculation
>> uses tmp4 at target/i386/tcg/translate.c, line 5488
>> > `tcg_gen_mov_tl(cpu_cc_src, s->tmp4);`
>>
>> The line you quote only applies to the bit instructions, bt/bts/btr/btc,
>> so your
>> explanation is clearly incorrect.
>>
>> > push rcx
>> > mov dword ptr [rsp], 010000000h
>> > mov rcx, 01eh
>> > sar dword ptr [rsp], cl
>> > jnc pass1
>> > int 3
>> > pass1:
>> > mov dword ptr [rsp], 0ffffffffh
>> > mov rcx, 01eh
>> > sar dword ptr [rsp], cl
>> > jc pass2
>> > int 3
>> > pass2:
>> > pop rcx
>>
>> Thanks for the test case.
>>
>> > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
>> > index 9d9392b009..9048e22868 100644
>> > --- a/target/i386/tcg/translate.c
>> > +++ b/target/i386/tcg/translate.c
>> > @@ -1686,27 +1686,27 @@ static void gen_shift_rm_T1(DisasContext *s,
>> MemOp ot, int op1,
>> >       }
>> >
>> >       tcg_gen_andi_tl(s->T1, s->T1, mask);
>> > -    tcg_gen_subi_tl(s->tmp0, s->T1, 1);
>> > +    tcg_gen_subi_tl(s->tmp4, s->T1, 1);
>> >
>> >       if (is_right) {
>> >           if (is_arith) {
>> >               gen_exts(ot, s->T0);
>> > -            tcg_gen_sar_tl(s->tmp0, s->T0, s->tmp0);
>> > +            tcg_gen_sar_tl(s->tmp4, s->T0, s->tmp4);
>> >               tcg_gen_sar_tl(s->T0, s->T0, s->T1);
>> >           } else {
>> >               gen_extu(ot, s->T0);
>> > -            tcg_gen_shr_tl(s->tmp0, s->T0, s->tmp0);
>> > +            tcg_gen_shr_tl(s->tmp4, s->T0, s->tmp4);
>> >               tcg_gen_shr_tl(s->T0, s->T0, s->T1);
>> >           }
>> >       } else {
>> > -        tcg_gen_shl_tl(s->tmp0, s->T0, s->tmp0);
>> > +        tcg_gen_shl_tl(s->tmp4, s->T0, s->tmp4);
>> >           tcg_gen_shl_tl(s->T0, s->T0, s->T1);
>> >       }
>> >
>> >       /* store */
>> >       gen_op_st_rm_T0_A0(s, ot, op1);
>> >
>> > -    gen_shift_flags(s, ot, s->T0, s->tmp0, s->T1, is_right);
>> > +    gen_shift_flags(s, ot, s->T0, s->tmp4, s->T1, is_right);
>> >   }
>>
>> The use of tmp0 vs tmp4 is completely local to this function.
>> Within gen_shift_flags, the 4th argument is consistently used, and
>> neither tmp0 nor tmp4
>> are referenced.
>>
>> If this does fix the issue, that means there's some other explanation,
>> and possibly some
>> deeper fix is required.
>>
>>
>> r~
>>
>

--0000000000000f462105f5656880
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">nevermind, I do not understand how it is fixing the proble=
m. :)</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, Feb 24, 2023 at 1:13=E2=80=AFAM Vilen Kamalov &lt;<a href=3D"m=
ailto:vilen.kamalov@gmail.com">vilen.kamalov@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Yes,=
 agree that my explanation is incorrect, just looked again, there is a code=
 in the default, down the line 5488<div><div><br></div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 default:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Othe=
rwise, generate EFLAGS and replace the C bit. =C2=A0*/<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gen_compute_eflags(s);<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src,<b> s-&gt;tmp4,=
<br></b>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctz32(CC_C), 1);<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br></div></div><div><br></div><div>a=
nd changing tmp0 to tmp4 fixes the issue.</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 24, 2023 at 1:01=
=E2=80=AFAM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linar=
o.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On 2/23/23 11:13, ~vil=
enka wrote:<br>
&gt; From: Vilen Kamalov &lt;<a href=3D"mailto:vilen.kamalov@gmail.com" tar=
get=3D"_blank">vilen.kamalov@gmail.com</a>&gt;<br>
&gt; <br>
&gt; gen_shift_rm_T1 in the uses wrong tmp0 register, eflags calculation us=
es tmp4 at target/i386/tcg/translate.c, line 5488<br>
&gt; `tcg_gen_mov_tl(cpu_cc_src, s-&gt;tmp4);`<br>
<br>
The line you quote only applies to the bit instructions, bt/bts/btr/btc, so=
 your <br>
explanation is clearly incorrect.<br>
<br>
&gt; push rcx<br>
&gt; mov dword ptr [rsp], 010000000h<br>
&gt; mov rcx, 01eh<br>
&gt; sar dword ptr [rsp], cl<br>
&gt; jnc pass1<br>
&gt; int 3<br>
&gt; pass1:<br>
&gt; mov dword ptr [rsp], 0ffffffffh<br>
&gt; mov rcx, 01eh<br>
&gt; sar dword ptr [rsp], cl<br>
&gt; jc pass2<br>
&gt; int 3<br>
&gt; pass2:<br>
&gt; pop rcx<br>
<br>
Thanks for the test case.<br>
<br>
&gt; diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c=
<br>
&gt; index 9d9392b009..9048e22868 100644<br>
&gt; --- a/target/i386/tcg/translate.c<br>
&gt; +++ b/target/i386/tcg/translate.c<br>
&gt; @@ -1686,27 +1686,27 @@ static void gen_shift_rm_T1(DisasContext *s, M=
emOp ot, int op1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_andi_tl(s-&gt;T1, s-&gt;T1, mask);<b=
r>
&gt; -=C2=A0 =C2=A0 tcg_gen_subi_tl(s-&gt;tmp0, s-&gt;T1, 1);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_subi_tl(s-&gt;tmp4, s-&gt;T1, 1);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_right) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_arith) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_exts(ot, s-&=
gt;T0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_sar_tl(s-&gt;tmp0, =
s-&gt;T0, s-&gt;tmp0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_sar_tl(s-&gt;tmp4, =
s-&gt;T0, s-&gt;tmp4);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_sar_tl(s=
-&gt;T0, s-&gt;T0, s-&gt;T1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_extu(ot, s-&=
gt;T0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shr_tl(s-&gt;tmp0, =
s-&gt;T0, s-&gt;tmp0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shr_tl(s-&gt;tmp4, =
s-&gt;T0, s-&gt;tmp4);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_shr_tl(s=
-&gt;T0, s-&gt;T0, s-&gt;T1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shl_tl(s-&gt;tmp0, s-&gt;T0, s-&g=
t;tmp0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shl_tl(s-&gt;tmp4, s-&gt;T0, s-&g=
t;tmp4);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_shl_tl(s-&gt;T0, s-&gt=
;T0, s-&gt;T1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* store */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_op_st_rm_T0_A0(s, ot, op1);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 gen_shift_flags(s, ot, s-&gt;T0, s-&gt;tmp0, s-&gt;T1, =
is_right);<br>
&gt; +=C2=A0 =C2=A0 gen_shift_flags(s, ot, s-&gt;T0, s-&gt;tmp4, s-&gt;T1, =
is_right);<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
The use of tmp0 vs tmp4 is completely local to this function.<br>
Within gen_shift_flags, the 4th argument is consistently used, and neither =
tmp0 nor tmp4 <br>
are referenced.<br>
<br>
If this does fix the issue, that means there&#39;s some other explanation, =
and possibly some <br>
deeper fix is required.<br>
<br>
<br>
r~<br>
</blockquote></div>
</blockquote></div>

--0000000000000f462105f5656880--

