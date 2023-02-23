Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FA86A12A6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:14:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJqK-0000kD-Lu; Thu, 23 Feb 2023 17:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vilen.kamalov@gmail.com>)
 id 1pVJqH-0000iS-Ji
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:13:33 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vilen.kamalov@gmail.com>)
 id 1pVJqF-0005iO-Py
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:13:33 -0500
Received: by mail-ed1-x536.google.com with SMTP id da10so48957568edb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 14:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677190410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dNuFY5ZM1LXdYMwKJZhJq9DSmINOrQiB5j7nGjId/Ho=;
 b=M9v050K32BxA1lHW+7X0FKn8Kq3RwFtUTSIhAe95LjptV3EayNf3q3LIX0me7JPvSv
 r8DcTYiP3XEcxBER09oOOUpUXfrCWM6/yrFm621m9e9Lu0Ihvwmc1esC0Z7lHOD0uPXe
 Jgf5SdZHsADluywnvbSizzJ4mJCjCvcgCrZ/VHllbQD10ndTwfGAanvku9dB8lydDnrM
 X0SDkLWRewnVGPgX4prmNKehrwraUAV6bqB4DMI01aJc7Ne/ZaeZpSMgkHQ5Wq7DiNKG
 LOl6Jxy+5jyNqqUTx5qJXi6CJSEPtzUz7QUUUy8DjdEMO7G4Qbfc16Kmn9++PPjNm8z8
 QsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677190410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dNuFY5ZM1LXdYMwKJZhJq9DSmINOrQiB5j7nGjId/Ho=;
 b=7rJdk9Jb71WO5U7pEXXXY0xzTZQk4NyAb3KV6uW93r2er8CiIbRwZ3ms4g6bfAWAFZ
 RtmvQWDVXkv8uAb8wOXLGl9Ip+1DFQUqZn10ch3CGcgipn+5Sz4Uqo1f+CsL7Z5rrBx2
 fMQ0FMtFtrHU0tdRTo/jLOvidq22yHkrjBiKl+hq8K/RkbytnBwpyGHMIsESPJFmGwqU
 WQt3d0wLHewLn/c9Ael4RRwtFAb/hUKdsedyoKgbMq21oVbHzjnOyWwG6BhV9Jn49HfH
 gmRcysusr89GEiQrqGo/LaMwm48HS7OmcOux0AEFnLEky5sxXdtpBxHx8BH0byexcr5/
 OVuQ==
X-Gm-Message-State: AO0yUKW5W1RLcxU6+h1oysStTmcEiVvrn9TVc3Alpwm/puSPbkeniDVD
 X4tqO0CrgVQotAOn/JfdUdelodqZwFnMj7EHLMI=
X-Google-Smtp-Source: AK7set88k6JvMEXd+u7EKDrSmiQqQ9LTWdDT1dzCtAOG74ArggmUhHfuqFUHFVqPgg8S+VyXIv/mDpmmoAEgdtQHwZk=
X-Received: by 2002:a50:d086:0:b0:4ad:72b2:cf57 with SMTP id
 v6-20020a50d086000000b004ad72b2cf57mr6286657edd.0.1677190409583; Thu, 23 Feb
 2023 14:13:29 -0800 (PST)
MIME-Version: 1.0
References: <167718710208.23058.11278141733696221981-1@git.sr.ht>
 <1ecf3d94-8e0e-94fd-51a0-7772ea8cb786@linaro.org>
In-Reply-To: <1ecf3d94-8e0e-94fd-51a0-7772ea8cb786@linaro.org>
From: Vilen Kamalov <vilen.kamalov@gmail.com>
Date: Fri, 24 Feb 2023 01:13:18 +0300
Message-ID: <CAOaAw8Ypzn8QM43kdO+5ip1dkRGp2zKAsmFLV9C-bejRGOpB0Q@mail.gmail.com>
Subject: Re: [PATCH qemu 1/1] target/i386: Fix gen_shift_rm_T1,
 wrong eflags calculation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, pbonzini@redhat.com
Content-Type: multipart/alternative; boundary="00000000000095838c05f5655278"
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

--00000000000095838c05f5655278
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, agree that my explanation is incorrect, just looked again, there is a
code in the default, down the line 5488

        default:
            /* Otherwise, generate EFLAGS and replace the C bit.  */
            gen_compute_eflags(s);
            tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src,
* s->tmp4,*                               ctz32(CC_C), 1);
            break;

and changing tmp0 to tmp4 fixes the issue.

On Fri, Feb 24, 2023 at 1:01=E2=80=AFAM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/23/23 11:13, ~vilenka wrote:
> > From: Vilen Kamalov <vilen.kamalov@gmail.com>
> >
> > gen_shift_rm_T1 in the uses wrong tmp0 register, eflags calculation use=
s
> tmp4 at target/i386/tcg/translate.c, line 5488
> > `tcg_gen_mov_tl(cpu_cc_src, s->tmp4);`
>
> The line you quote only applies to the bit instructions, bt/bts/btr/btc,
> so your
> explanation is clearly incorrect.
>
> > push rcx
> > mov dword ptr [rsp], 010000000h
> > mov rcx, 01eh
> > sar dword ptr [rsp], cl
> > jnc pass1
> > int 3
> > pass1:
> > mov dword ptr [rsp], 0ffffffffh
> > mov rcx, 01eh
> > sar dword ptr [rsp], cl
> > jc pass2
> > int 3
> > pass2:
> > pop rcx
>
> Thanks for the test case.
>
> > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> > index 9d9392b009..9048e22868 100644
> > --- a/target/i386/tcg/translate.c
> > +++ b/target/i386/tcg/translate.c
> > @@ -1686,27 +1686,27 @@ static void gen_shift_rm_T1(DisasContext *s,
> MemOp ot, int op1,
> >       }
> >
> >       tcg_gen_andi_tl(s->T1, s->T1, mask);
> > -    tcg_gen_subi_tl(s->tmp0, s->T1, 1);
> > +    tcg_gen_subi_tl(s->tmp4, s->T1, 1);
> >
> >       if (is_right) {
> >           if (is_arith) {
> >               gen_exts(ot, s->T0);
> > -            tcg_gen_sar_tl(s->tmp0, s->T0, s->tmp0);
> > +            tcg_gen_sar_tl(s->tmp4, s->T0, s->tmp4);
> >               tcg_gen_sar_tl(s->T0, s->T0, s->T1);
> >           } else {
> >               gen_extu(ot, s->T0);
> > -            tcg_gen_shr_tl(s->tmp0, s->T0, s->tmp0);
> > +            tcg_gen_shr_tl(s->tmp4, s->T0, s->tmp4);
> >               tcg_gen_shr_tl(s->T0, s->T0, s->T1);
> >           }
> >       } else {
> > -        tcg_gen_shl_tl(s->tmp0, s->T0, s->tmp0);
> > +        tcg_gen_shl_tl(s->tmp4, s->T0, s->tmp4);
> >           tcg_gen_shl_tl(s->T0, s->T0, s->T1);
> >       }
> >
> >       /* store */
> >       gen_op_st_rm_T0_A0(s, ot, op1);
> >
> > -    gen_shift_flags(s, ot, s->T0, s->tmp0, s->T1, is_right);
> > +    gen_shift_flags(s, ot, s->T0, s->tmp4, s->T1, is_right);
> >   }
>
> The use of tmp0 vs tmp4 is completely local to this function.
> Within gen_shift_flags, the 4th argument is consistently used, and neithe=
r
> tmp0 nor tmp4
> are referenced.
>
> If this does fix the issue, that means there's some other explanation, an=
d
> possibly some
> deeper fix is required.
>
>
> r~
>

--00000000000095838c05f5655278
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, agree that my explanation is incorrect, just looked a=
gain, there is a code in the default, down the line 5488<div><div><br></div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Otherwise, generate EFLAGS and replace the C bit. =C2=A0*/=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_compute_eflags(s);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_deposit_tl(cpu_cc_src, cpu_c=
c_src,<b> s-&gt;tmp4,<br></b>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctz32(CC_=
C), 1);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br></div></div>=
<div><br></div><div>and changing tmp0 to tmp4 fixes the issue.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 Feb 24, 2023 at 1:01=E2=80=AFAM Richard Henderson &lt;<a href=3D"mailto:ri=
chard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 2/23/23 11:13, ~=
vilenka wrote:<br>
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

--00000000000095838c05f5655278--

