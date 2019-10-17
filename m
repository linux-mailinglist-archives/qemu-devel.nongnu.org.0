Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A84DB831
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 22:18:35 +0200 (CEST)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLCEE-000841-0p
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 16:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iLCCk-0007bu-Gw
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 16:17:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iLCCj-0007zL-4A
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 16:17:02 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37920)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iLCCi-0007yt-Uk
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 16:17:01 -0400
Received: by mail-ot1-x341.google.com with SMTP id e11so3032993otl.5
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 13:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lPikBztTwrznI9bZxTqDNGMe94Wng8kpLIKl8jgo5Ts=;
 b=LT8/D1nwlbi29IegoOzl3deU8DX4QDYVfmx+CK1C+eyFswClNqpBMK/QqGp0wr/0BF
 xWD+xf/ZiZgV+JwXAW28Ru3VuIuWaDL98682oRThft145J5tqFsa9vloP6P2vOhLjKww
 7z30QcmYJ4mD6h/QSvjDdWDZsu19OS3TkfT2ZGFecRgJVUFWSdmeFpLT5TcSskM7H4Ig
 jYut1dTTHKEU1iNJ4BNaRWIdK7qny9U++bKY1KPE3U4cwTnMIqXvenDoXPQQ4xM9PoUn
 Ob09R6Klg/TPHFn1kufsx/9RlhN72QWgiGU1UtuW3tqbyMpWUY1uNa5JbCv2WyAKbsri
 RjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lPikBztTwrznI9bZxTqDNGMe94Wng8kpLIKl8jgo5Ts=;
 b=YNuqQu+WU05qrdLx3sqAHKzJSQ3OcGRzl+ggpLTdpyxhJlP4zONWNyYZTXLaUpEkxb
 0kFNn41qtONGLfzegZqzBaHvdB1sk6oZGz4kaQjaNQJlh9qbLOuDl0LsxOZY6utC3rBC
 LvKc+sutILTdnF8KFAZ6jSyI1tFu81dHBQuIlzhPAltxsurptxrdF+WH5B3Ak/fwSIff
 uailyuk0jVln+fl/YvOaweFNSiub94kHRk940IFQ9gER9CeUY4OYVg9nFZW/nftyGhTC
 CfxxXIwlQO7eJJHM7NLFCb0+76+T8k7KGRwZZmwMgQ92ihkCpNLS5oJZfN4MRdtp1Re6
 c1kg==
X-Gm-Message-State: APjAAAX+uKXNDkDuYosGmoVzMQ9xRtbfY3Ntz9B/qs09GCdu+ThyPyaf
 A/2cNyWr5cD7C1Je9IeiAYTGfJlaEKMj3ttS/MQ=
X-Google-Smtp-Source: APXvYqykcfycEbcjiTOBxPtxqBVLEQhNYBceYvYcPb9DMJh6h6PetMQHp4x7G0EYG+Aysu3JSEKIyAhNILjLSRQ7qpQ=
X-Received: by 2002:a05:6830:1d8f:: with SMTP id
 y15mr4344701oti.121.1571343419914; 
 Thu, 17 Oct 2019 13:16:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 13:16:59
 -0700 (PDT)
In-Reply-To: <CAK4993gm=8tVXyprjHPMiNZuKZRkx0iDYnXh76cQfMwUayqcWQ@mail.gmail.com>
References: <20191014161843.84845-1-mrolnik@gmail.com>
 <20191014161843.84845-5-mrolnik@gmail.com>
 <CAL1e-=g9ER4tuqEL2ubqb7oAbatcVR8x+A0LAydSwBJEnk9_ow@mail.gmail.com>
 <CAK4993gm=8tVXyprjHPMiNZuKZRkx0iDYnXh76cQfMwUayqcWQ@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 22:16:59 +0200
Message-ID: <CAL1e-=hGJQqVnvAu=ZJRV-AdoAWpkSvdf5ex=b7EwkodUGKpUg@mail.gmail.com>
Subject: Re: [PATCH v32 04/13] target/avr: Add instruction translation -
 Registers definition
To: Michael Rolnik <mrolnik@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005d471f059520e6ef"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005d471f059520e6ef
Content-Type: text/plain; charset="UTF-8"

>
>
> >> +static TCGv cpu_Cf;
> >> +static TCGv cpu_Zf;
> >> +static TCGv cpu_Nf;
> >> +static TCGv cpu_Vf;
> >> +static TCGv cpu_Sf;
> >> +static TCGv cpu_Hf;
> >> +static TCGv cpu_Tf;
> >> +static TCGv cpu_If;
> >> +
> >
> >
> > Hello, Michael,
> >
> > Is there any particular reason or motivation beyond modelling status
> register flags as TCGv variables?



I think it's easier this way as I don't need to convert flag values to
> bits or bits to flag values.


Ok. But, how do you map 0/1 flag value to the value of a TCGv variable and
vice versa? In other words, what value or values (out of 2^32 vales) of a
TCGv variable mean the flag is 1? And the same question for 0.

Is 0110000111000010100 one or zero?

Besides, in such arrangement, how do you display the 8-bit status register
in gdb, if at all?

A.


> >
> > A.
> >
> >
> >
> >>
> >> +static TCGv cpu_rampD;
> >> +static TCGv cpu_rampX;
> >> +static TCGv cpu_rampY;
> >> +static TCGv cpu_rampZ;
> >> +
> >> +static TCGv cpu_r[NO_CPU_REGISTERS];
> >> +static TCGv cpu_eind;
> >> +static TCGv cpu_sp;
> >> +
> >> +static TCGv cpu_skip;
> >> +
> >> +static const char reg_names[NO_CPU_REGISTERS][8] = {
> >> +    "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
> >> +    "r8",  "r9",  "r10", "r11", "r12", "r13", "r14", "r15",
> >> +    "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
> >> +    "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
> >> +};
> >> +#define REG(x) (cpu_r[x])
> >> +
> >> +enum {
> >> +    DISAS_EXIT   = DISAS_TARGET_0,  /* We want return to the cpu main
> loop.  */
> >> +    DISAS_LOOKUP = DISAS_TARGET_1,  /* We have a variable condition
> exit.  */
> >> +    DISAS_CHAIN  = DISAS_TARGET_2,  /* We have a single condition
> exit.  */
> >> +};
> >> +
> >> +typedef struct DisasContext DisasContext;
> >> +
> >> +/* This is the state at translation time. */
> >> +struct DisasContext {
> >> +    TranslationBlock *tb;
> >> +
> >> +    CPUAVRState *env;
> >> +    CPUState *cs;
> >> +
> >> +    target_long npc;
> >> +    uint32_t opcode;
> >> +
> >> +    /* Routine used to access memory */
> >> +    int memidx;
> >> +    int bstate;
> >> +    int singlestep;
> >> +
> >> +    TCGv skip_var0;
> >> +    TCGv skip_var1;
> >> +    TCGCond skip_cond;
> >> +    bool free_skip_var0;
> >> +};
> >> +
> >> +static int to_A(DisasContext *ctx, int indx) { return 16 + (indx %
> 16); }
> >> +static int to_B(DisasContext *ctx, int indx) { return 16 + (indx % 8);
> }
> >> +static int to_C(DisasContext *ctx, int indx) { return 24 + (indx % 4)
> * 2; }
> >> +static int to_D(DisasContext *ctx, int indx) { return (indx % 16) * 2;
> }
> >> +
> >> +static uint16_t next_word(DisasContext *ctx)
> >> +{
> >> +    return cpu_lduw_code(ctx->env, ctx->npc++ * 2);
> >> +}
> >> +
> >> +static int append_16(DisasContext *ctx, int x)
> >> +{
> >> +    return x << 16 | next_word(ctx);
> >> +}
> >> +
> >> +
> >> +static bool avr_have_feature(DisasContext *ctx, int feature)
> >> +{
> >> +    if (!avr_feature(ctx->env, feature)) {
> >> +        gen_helper_unsupported(cpu_env);
> >> +        ctx->bstate = DISAS_NORETURN;
> >> +        return false;
> >> +    }
> >> +    return true;
> >> +}
> >> +
> >> +static bool decode_insn(DisasContext *ctx, uint16_t insn);
> >> +#include "decode_insn.inc.c"
> >> +
> >> --
> >> 2.17.2 (Apple Git-113)
> >>
>
>
> --
> Best Regards,
> Michael Rolnik
>

--0000000000005d471f059520e6ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
&gt;&gt; +static TCGv cpu_Cf;<br>
&gt;&gt; +static TCGv cpu_Zf;<br>
&gt;&gt; +static TCGv cpu_Nf;<br>
&gt;&gt; +static TCGv cpu_Vf;<br>
&gt;&gt; +static TCGv cpu_Sf;<br>
&gt;&gt; +static TCGv cpu_Hf;<br>
&gt;&gt; +static TCGv cpu_Tf;<br>
&gt;&gt; +static TCGv cpu_If;<br>
&gt;&gt; +<br>
&gt;<br>
&gt;<br>
&gt; Hello, Michael,<br>
&gt;<br>
&gt; Is there any particular reason or motivation beyond modelling status r=
egister flags as TCGv variables?</blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
I think it&#39;s easier this way as I don&#39;t need to convert flag values=
 to<br>
bits or bits to flag values.</blockquote><div><br></div><div>Ok. But, how d=
o you map 0/1 flag value to the value of a TCGv variable and vice versa? In=
 other words, what value or values (out of 2^32 vales) of a TCGv variable m=
ean the flag is 1? And the same question for 0.</div><div><br></div><div>Is=
 0110000111000010100 one or zero?</div><div><br></div><div>Besides, in such=
 arrangement, how do you display the 8-bit status register in gdb, if at al=
l?</div><div><br></div><div>A.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
&gt;<br>
&gt; A.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; +static TCGv cpu_rampD;<br>
&gt;&gt; +static TCGv cpu_rampX;<br>
&gt;&gt; +static TCGv cpu_rampY;<br>
&gt;&gt; +static TCGv cpu_rampZ;<br>
&gt;&gt; +<br>
&gt;&gt; +static TCGv cpu_r[NO_CPU_REGISTERS];<br>
&gt;&gt; +static TCGv cpu_eind;<br>
&gt;&gt; +static TCGv cpu_sp;<br>
&gt;&gt; +<br>
&gt;&gt; +static TCGv cpu_skip;<br>
&gt;&gt; +<br>
&gt;&gt; +static const char reg_names[NO_CPU_REGISTERS][8] =3D {<br>
&gt;&gt; +=C2=A0 =C2=A0 &quot;r0&quot;,=C2=A0 &quot;r1&quot;,=C2=A0 &quot;r=
2&quot;,=C2=A0 &quot;r3&quot;,=C2=A0 &quot;r4&quot;,=C2=A0 &quot;r5&quot;,=
=C2=A0 &quot;r6&quot;,=C2=A0 &quot;r7&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 &quot;r8&quot;,=C2=A0 &quot;r9&quot;,=C2=A0 &quot;r=
10&quot;, &quot;r11&quot;, &quot;r12&quot;, &quot;r13&quot;, &quot;r14&quot=
;, &quot;r15&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 &quot;r16&quot;, &quot;r17&quot;, &quot;r18&quot;, =
&quot;r19&quot;, &quot;r20&quot;, &quot;r21&quot;, &quot;r22&quot;, &quot;r=
23&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 &quot;r24&quot;, &quot;r25&quot;, &quot;r26&quot;, =
&quot;r27&quot;, &quot;r28&quot;, &quot;r29&quot;, &quot;r30&quot;, &quot;r=
31&quot;,<br>
&gt;&gt; +};<br>
&gt;&gt; +#define REG(x) (cpu_r[x])<br>
&gt;&gt; +<br>
&gt;&gt; +enum {<br>
&gt;&gt; +=C2=A0 =C2=A0 DISAS_EXIT=C2=A0 =C2=A0=3D DISAS_TARGET_0,=C2=A0 /*=
 We want return to the cpu main loop.=C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 DISAS_LOOKUP =3D DISAS_TARGET_1,=C2=A0 /* We have a=
 variable condition exit.=C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 DISAS_CHAIN=C2=A0 =3D DISAS_TARGET_2,=C2=A0 /* We h=
ave a single condition exit.=C2=A0 */<br>
&gt;&gt; +};<br>
&gt;&gt; +<br>
&gt;&gt; +typedef struct DisasContext DisasContext;<br>
&gt;&gt; +<br>
&gt;&gt; +/* This is the state at translation time. */<br>
&gt;&gt; +struct DisasContext {<br>
&gt;&gt; +=C2=A0 =C2=A0 TranslationBlock *tb;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 CPUAVRState *env;<br>
&gt;&gt; +=C2=A0 =C2=A0 CPUState *cs;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 target_long npc;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t opcode;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Routine used to access memory */<br>
&gt;&gt; +=C2=A0 =C2=A0 int memidx;<br>
&gt;&gt; +=C2=A0 =C2=A0 int bstate;<br>
&gt;&gt; +=C2=A0 =C2=A0 int singlestep;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 TCGv skip_var0;<br>
&gt;&gt; +=C2=A0 =C2=A0 TCGv skip_var1;<br>
&gt;&gt; +=C2=A0 =C2=A0 TCGCond skip_cond;<br>
&gt;&gt; +=C2=A0 =C2=A0 bool free_skip_var0;<br>
&gt;&gt; +};<br>
&gt;&gt; +<br>
&gt;&gt; +static int to_A(DisasContext *ctx, int indx) { return 16 + (indx =
% 16); }<br>
&gt;&gt; +static int to_B(DisasContext *ctx, int indx) { return 16 + (indx =
% 8); }<br>
&gt;&gt; +static int to_C(DisasContext *ctx, int indx) { return 24 + (indx =
% 4) * 2; }<br>
&gt;&gt; +static int to_D(DisasContext *ctx, int indx) { return (indx % 16)=
 * 2; }<br>
&gt;&gt; +<br>
&gt;&gt; +static uint16_t next_word(DisasContext *ctx)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 return cpu_lduw_code(ctx-&gt;env, ctx-&gt;npc++ * 2=
);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static int append_16(DisasContext *ctx, int x)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 return x &lt;&lt; 16 | next_word(ctx);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; +static bool avr_have_feature(DisasContext *ctx, int feature)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!avr_feature(ctx-&gt;env, feature)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_unsupported(cpu_<wbr>env);=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;bstate =3D DISAS_NORETURN;<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 return true;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static bool decode_insn(DisasContext *ctx, uint16_t insn);<br>
&gt;&gt; +#include &quot;decode_insn.inc.c&quot;<br>
&gt;&gt; +<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.2 (Apple Git-113)<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Best Regards,<br>
Michael Rolnik<br>
</blockquote>

--0000000000005d471f059520e6ef--

