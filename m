Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25236D803
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:06:55 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbju2-0001o4-QO
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.montesel.revng@gmail.com>)
 id 1lbhNl-0003Dl-6H
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:25:28 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:36478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.montesel.revng@gmail.com>)
 id 1lbhNi-00009v-Vo
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:25:24 -0400
Received: by mail-yb1-xb34.google.com with SMTP id t94so19970287ybi.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sgS2cuKa4ORROqZkDO5APus8DrlBPnnjoeOz02igMQc=;
 b=CjIHSBmi1vm6/ywj1ZspEQQOaAT5W1ISg2vNimiMDaDuajFj2JvFhIOzta0jBRe332
 xYNcHeCvm4jj5psZbbUQGIYcYi68wHgRIBifHIMzU19Tn14NhUn8CNGLN7pN2HroveTs
 A1U+6arnPo8026LWEetoOJ0vAxcR0wvA9K6bqxyzBG7ZmC4pSCHyKKV7Cw9vXbLj0M0a
 EOjmI9pCsy5c9o9EmGHsBljn5+m2G1KbZWX8yxZ7AXwUoSnc7ow4/I0tMtVxRVO2LAU6
 mop4SI0eTKC+0dfKW7JQF8xWVmyQee1LhUdx6q2VoThaDKCUQDvs+I6sOs/9/FEYFb2c
 Z5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgS2cuKa4ORROqZkDO5APus8DrlBPnnjoeOz02igMQc=;
 b=S0LcJqDx+FojvWg2quU4RC/EUEsApZ/h1iIWiDup+VWOh5CWmUOcoXJNZ+noRgOhbo
 Ko5NWUaZ6IMiTC93u2uPIY8Y4WIVVgzy00cz8Bk1LoDrBdiSNwMxyYglyAHpcIxcQMXC
 yND4QllRbyzxBzQxyquhtxGOYTSwAvTNIvmgLZmnUHy7GRnIWqQBnahyGN4R2agJuTNc
 zF7EMbdQs39ayzRwEpwAwWlpRAfpkNe1oORMU9aajrWLeLsjlWAayjfXoxWAqHFU5zVM
 lZQ5W3JPiPAdG79dLGcbqil5uQ9rbE4k8bgBBrFY9EJ5umADAM9f3qfADcmdNsK6Qnaf
 sbnQ==
X-Gm-Message-State: AOAM532SRfxIROXEXMj/54ollLaTFaeaBo6PPq5kThGps1841z//uP9G
 SDGNbqXKS9CNliNPGnCp8tuijWlit2hmGIJK8AY=
X-Google-Smtp-Source: ABdhPJwP4rSzCsMsl+ChfCvvYYgYrB0tj5laOsFKOOAB/ElXqmd4FHv3HZec2CFmKXp/zkPxrOEixgD44i+00X9h2bA=
X-Received: by 2002:a25:ba83:: with SMTP id s3mr39406360ybg.280.1619605520508; 
 Wed, 28 Apr 2021 03:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-10-ale.qemu@rev.ng>
 <BYAPR02MB488654E65A2BFCEEC3D8AD16DE419@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB488654E65A2BFCEEC3D8AD16DE419@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Paolo Montesel <paolo.montesel.revng@gmail.com>
Date: Wed, 28 Apr 2021 12:25:09 +0200
Message-ID: <CANnx7NNMoPxGeP2tda-0yBbvN3Donc+m2cFsr8ZaLg_JnZBQNA@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] target/hexagon: import lexer for idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: multipart/alternative; boundary="000000000000b9ea0e05c105cb66"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=paolo.montesel.revng@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Apr 2021 08:57:38 -0400
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b9ea0e05c105cb66
Content-Type: text/plain; charset="UTF-8"

>
> > +/**
> > + * Semantic record of the IMM token, identifying an immediate constant
> > + */
> > +typedef struct HexImm {
> > +    union {
> > +        char id;            /**< Identifier of the immediate
>      */
> > +        uint64_t value;     /**< Immediate value (for VALUE type
> immediates) */
>
> Most immediates are 32 bits.  Since you treat them as 64 bits, you end up
> with unnecessary extends and truncates in the TCG.
>
> Here's an example from idef-generated-emitter.c
> void emit_J2_jump(DisasContext *ctx, Insn *insn, Packet *pkt, int riV)
> /* fIMMEXT(riV); (riV = riV & ~3); (PC = fREAD_PC()+riV);} */
> {
> int64_t qemu_tmp_0 = ~((int64_t)3ULL);
> int32_t qemu_tmp_1 = riV & qemu_tmp_0;
> riV = qemu_tmp_1;
> TCGv_i32 tmp_0 = tcg_temp_local_new_i32();
> tcg_gen_movi_i32(tmp_0, ctx->base.pc_next);
> TCGv_i64 tmp_1 = tcg_temp_local_new_i64();
> tcg_gen_ext_i32_i64(tmp_1, tmp_0);
>   <- Don't need this extension
> tcg_temp_free_i32(tmp_0);
> TCGv_i64 tmp_2 = tcg_temp_local_new_i64();
> tcg_gen_addi_i64(tmp_2, tmp_1, (int64_t)riV);                        <-
> This should be 32 bits
> tcg_temp_free_i64(tmp_1);
> TCGv_i32 tmp_3 = tcg_temp_local_new_i32();
> tcg_gen_trunc_i64_tl(tmp_3, tmp_2);
>  <- Don't need this truncation
> tcg_temp_free_i64(tmp_2);
> gen_write_new_pc(tmp_3);
> tcg_temp_free_i32(tmp_3);
> }
>

Thanks for spotting this. It's actually a bug in the lexer. The token
`{IMM_ID}"iV"` didn't initialize `bit_width`. Now it does. This is the
result:

void emit_J2_jump(DisasContext *ctx, Insn *insn, Packet *pkt, int riV)
/* fIMMEXT(riV); (riV = riV & ~3); (PC = fREAD_PC()+riV);} */
{
int64_t qemu_tmp_0 = ~((int64_t)3ULL);
int32_t qemu_tmp_1 = riV & qemu_tmp_0;
riV = qemu_tmp_1;
TCGv_i32 tmp_0 = tcg_temp_local_new_i32();
tcg_gen_movi_i32(tmp_0, ctx->base.pc_next);
TCGv_i32 tmp_1 = tcg_temp_local_new_i32();
tcg_gen_addi_i32(tmp_1, tmp_0, (int64_t)riV);
tcg_temp_free_i32(tmp_0);
gen_write_new_pc(tmp_1);
tcg_temp_free_i32(tmp_1);
}

The `(int64_t)riV` cast is actually useless so I simply dropped it, thanks
for pointing it out.

This is all gonna be in the next patchset ofc.

~Paolo

--000000000000b9ea0e05c105cb66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
&gt; +/**<br>
&gt; + * Semantic record of the IMM token, identifying an immediate constan=
t<br>
&gt; + */<br>
&gt; +typedef struct HexImm {<br>
&gt; +=C2=A0 =C2=A0 union {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char id;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /**&lt; Identifier of the immediate=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t value;=C2=A0 =C2=A0 =C2=A0/**&lt=
; Immediate value (for VALUE type immediates) */<br>
<br>
Most immediates are 32 bits.=C2=A0 Since you treat them as 64 bits, you end=
 up with unnecessary extends and truncates in the TCG.<br>
<br>
Here&#39;s an example from idef-generated-emitter.c<br>
void emit_J2_jump(DisasContext *ctx, Insn *insn, Packet *pkt, int riV)<br>
/* fIMMEXT(riV); (riV =3D riV &amp; ~3); (PC =3D fREAD_PC()+riV);} */<br>
{<br>
int64_t qemu_tmp_0 =3D ~((int64_t)3ULL);<br>
int32_t qemu_tmp_1 =3D riV &amp; qemu_tmp_0;<br>
riV =3D qemu_tmp_1;<br>
TCGv_i32 tmp_0 =3D tcg_temp_local_new_i32();<br>
tcg_gen_movi_i32(tmp_0, ctx-&gt;base.pc_next);<br>
TCGv_i64 tmp_1 =3D tcg_temp_local_new_i64();<br>
tcg_gen_ext_i32_i64(tmp_1, tmp_0);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- Don&#39;t need this extension<br>
tcg_temp_free_i32(tmp_0);<br>
TCGv_i64 tmp_2 =3D tcg_temp_local_new_i64();<br>
tcg_gen_addi_i64(tmp_2, tmp_1, (int64_t)riV);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- This should b=
e 32 bits<br>
tcg_temp_free_i64(tmp_1);<br>
TCGv_i32 tmp_3 =3D tcg_temp_local_new_i32();<br>
tcg_gen_trunc_i64_tl(tmp_3, tmp_2);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;- Don&#39;t need this truncation<br>
tcg_temp_free_i64(tmp_2);<br>
gen_write_new_pc(tmp_3);<br>
tcg_temp_free_i32(tmp_3);<br>
}<br></blockquote><div><br></div><div>Thanks for spotting this. It&#39;s ac=
tually a bug in the lexer. The token `{IMM_ID}&quot;iV&quot;` didn&#39;t in=
itialize `bit_width`. Now it does. This is the result:</div><br>void emit_J=
2_jump(DisasContext *ctx, Insn *insn, Packet *pkt, int riV)<br>/* fIMMEXT(r=
iV); (riV =3D riV &amp; ~3); (PC =3D fREAD_PC()+riV);} */<br>{<br>int64_t q=
emu_tmp_0 =3D ~((int64_t)3ULL);<br>int32_t qemu_tmp_1 =3D riV &amp; qemu_tm=
p_0;<br>riV =3D qemu_tmp_1;<br>TCGv_i32 tmp_0 =3D tcg_temp_local_new_i32();=
<br>tcg_gen_movi_i32(tmp_0, ctx-&gt;base.pc_next);<br>TCGv_i32 tmp_1 =3D tc=
g_temp_local_new_i32();<br>tcg_gen_addi_i32(tmp_1, tmp_0, (int64_t)riV);<br=
>tcg_temp_free_i32(tmp_0);<br>gen_write_new_pc(tmp_1);<br>tcg_temp_free_i32=
(tmp_1);<br>}</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail=
_quote">The `(int64_t)riV` cast is actually useless so I simply dropped it,=
 thanks for pointing it out.</div><div class=3D"gmail_quote"><br></div><div=
 class=3D"gmail_quote">This is all gonna be in the next patchset ofc.</div>=
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">~Paolo<br><=
/div></div>

--000000000000b9ea0e05c105cb66--

