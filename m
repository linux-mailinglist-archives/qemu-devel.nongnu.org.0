Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F152D5A39B6
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 21:20:38 +0200 (CEST)
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oS1MD-00023O-Rd
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 15:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1oS1Hn-0006LF-LI
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 15:16:05 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:34428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1oS1Hl-0004nC-Hm
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 15:16:03 -0400
Received: by mail-vs1-xe30.google.com with SMTP id b128so1086550vsc.1
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=J6c5UzqEwFW63nwQHAus0X+tlSqUYSiqpdkszP7a21c=;
 b=Qnwgbt4ovUiU3z+HvB5EgPG/ntf4ZysEFRcHRqPz2NIhkFdkhURBfY/XDpiQ4q3ZME
 ifQJFEDtxM+fgtV23DEvwJNc4e1y4w7G7BsZkryKC7ntD+bPoiDsj9t3sjQpz82cAubX
 MxgREBoLVeFahvEdDH1JpuWKmaZ3CFIE7XRPyGU9+JBtk/CniduFLOZmGcYlSA7RdRtx
 /2VnLl3GpTAs5AVGIRlkX/Mfmzm69g30X6c14lKzpPNoB01kMBxqWXx9TRcu1wNaq4aF
 miL+3veWvb6jqxPfm+bDXNWTfhsQJhJmrIUAtNZTiWJ7fVDdSm0MtiNdTl3tEq0PrGIN
 FIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=J6c5UzqEwFW63nwQHAus0X+tlSqUYSiqpdkszP7a21c=;
 b=7IqY/o8Nvqq/IiLsapT6iz+o00aNWfbv4n0L78vX2zozdKt2NpngK+qcO0/jlf3M8I
 sxQy2Gzz+C0SdujJRWlJ6/uDUkhudzDQKixs4cdrB4zSCnjEUBrChtgqqJ6QiLmZE87P
 nyUn3tMn8X4jjkVV1jwzYLDsxMlpNJDmbZVg39hvhbFReguhizc285RfV52Fmi/vOiCt
 SQrkPNj90aKSDVlPY2HWcIim7XrXnPsgrG4GQKkHvTUIOWw9+q6dU6oT9BGXz4SwE0M5
 zegKD0GoX1Pv3MAcQpe7nF/+byWHxiZAky5+Rrb+4euiCBdnausH9NVVKZvFmrr90vgH
 yATg==
X-Gm-Message-State: ACgBeo3+Z7Mt1F3ODuXbTa2zBMghD4p6AMxUrBJaFqayayMCvyq2ISX9
 b6waRb3ccVPGLXUl2eFiHgCBfZHfaeFvhCoWP2LHL4qXH0M=
X-Google-Smtp-Source: AA6agR6ll7TK/TiywaqzLFo9HSaOGGG6rEbPOAQ4/N6UhwVHWvlc9O0NBZ/C/5/wREzy5z/DqRiml/p/Tt8qOseIlgY=
X-Received: by 2002:a05:6102:232b:b0:390:d06f:eef1 with SMTP id
 b11-20020a056102232b00b00390d06feef1mr668751vsa.64.1661627756518; Sat, 27 Aug
 2022 12:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220826205518.2339352-1-richard.henderson@linaro.org>
 <20220826205518.2339352-4-richard.henderson@linaro.org>
In-Reply-To: <20220826205518.2339352-4-richard.henderson@linaro.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sat, 27 Aug 2022 22:15:20 +0300
Message-ID: <CAK4993gb7EVbDDMvmM99FAewxFf0_5K3852K7=6mqCTrLpLo9w@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/avr: Disable interrupts when env->skip set
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002d218805e73ddc58"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=mrolnik@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000002d218805e73ddc58
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Fri, Aug 26, 2022 at 11:55 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> This bit is not saved across interrupts, so we must
> delay delivering the interrupt until the skip has
> been processed.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1118
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/helper.c    |  9 +++++++++
>  target/avr/translate.c | 26 ++++++++++++++++++++++----
>  2 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/target/avr/helper.c b/target/avr/helper.c
> index 34f1cbffb2..156dde4e92 100644
> --- a/target/avr/helper.c
> +++ b/target/avr/helper.c
> @@ -31,6 +31,15 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      AVRCPU *cpu = AVR_CPU(cs);
>      CPUAVRState *env = &cpu->env;
>
> +    /*
> +     * We cannot separate a skip from the next instruction,
> +     * as the skip would not be preserved across the interrupt.
> +     * Separating the two insn normally only happens at page boundaries.
> +     */
> +    if (env->skip) {
> +        return false;
> +    }
> +
>      if (interrupt_request & CPU_INTERRUPT_RESET) {
>          if (cpu_interrupts_enabled(env)) {
>              cs->exception_index = EXCP_RESET;
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index dc9c3d6bcc..026753c963 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -2971,8 +2971,18 @@ static void avr_tr_translate_insn(DisasContextBase
> *dcbase, CPUState *cs)
>      if (skip_label) {
>          canonicalize_skip(ctx);
>          gen_set_label(skip_label);
> -        if (ctx->base.is_jmp == DISAS_NORETURN) {
> +
> +        switch (ctx->base.is_jmp) {
> +        case DISAS_NORETURN:
>              ctx->base.is_jmp = DISAS_CHAIN;
> +            break;
> +        case DISAS_NEXT:
> +            if (ctx->base.tb->flags & TB_FLAGS_SKIP) {
> +                ctx->base.is_jmp = DISAS_TOO_MANY;
> +            }
> +            break;
> +        default:
> +            break;
>          }
>      }
>
> @@ -2989,6 +2999,11 @@ static void avr_tr_tb_stop(DisasContextBase
> *dcbase, CPUState *cs)
>  {
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>      bool nonconst_skip = canonicalize_skip(ctx);
> +    /*
> +     * Because we disable interrupts while env->skip is set,
> +     * we must return to the main loop to re-evaluate afterward.
> +     */
> +    bool force_exit = ctx->base.tb->flags & TB_FLAGS_SKIP;
>
>      switch (ctx->base.is_jmp) {
>      case DISAS_NORETURN:
> @@ -2997,7 +3012,7 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase,
> CPUState *cs)
>      case DISAS_NEXT:
>      case DISAS_TOO_MANY:
>      case DISAS_CHAIN:
> -        if (!nonconst_skip) {
> +        if (!nonconst_skip && !force_exit) {
>              /* Note gen_goto_tb checks singlestep.  */
>              gen_goto_tb(ctx, 1, ctx->npc);
>              break;
> @@ -3005,8 +3020,11 @@ static void avr_tr_tb_stop(DisasContextBase
> *dcbase, CPUState *cs)
>          tcg_gen_movi_tl(cpu_pc, ctx->npc);
>          /* fall through */
>      case DISAS_LOOKUP:
> -        tcg_gen_lookup_and_goto_ptr();
> -        break;
> +        if (!force_exit) {
> +            tcg_gen_lookup_and_goto_ptr();
> +            break;
> +        }
> +        /* fall through */
>      case DISAS_EXIT:
>          tcg_gen_exit_tb(NULL, 0);
>          break;
> --
> 2.34.1
>
>

-- 
Best Regards,
Michael Rolnik

--0000000000002d218805e73ddc58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 11:55 PM Ri=
chard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard=
.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">This bit is not saved across interrupts, so we must<br=
>
delay delivering the interrupt until the skip has<br>
been processed.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1118" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/i=
ssues/1118</a><br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/avr/helper.c=C2=A0 =C2=A0 |=C2=A0 9 +++++++++<br>
=C2=A0target/avr/translate.c | 26 ++++++++++++++++++++++----<br>
=C2=A02 files changed, 31 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/target/avr/helper.c b/target/avr/helper.c<br>
index 34f1cbffb2..156dde4e92 100644<br>
--- a/target/avr/helper.c<br>
+++ b/target/avr/helper.c<br>
@@ -31,6 +31,15 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_=
request)<br>
=C2=A0 =C2=A0 =C2=A0AVRCPU *cpu =3D AVR_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPUAVRState *env =3D &amp;cpu-&gt;env;<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* We cannot separate a skip from the next instruction,=
<br>
+=C2=A0 =C2=A0 =C2=A0* as the skip would not be preserved across the interr=
upt.<br>
+=C2=A0 =C2=A0 =C2=A0* Separating the two insn normally only happens at pag=
e boundaries.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (env-&gt;skip) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (interrupt_request &amp; CPU_INTERRUPT_RESET) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_interrupts_enabled(env)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D =
EXCP_RESET;<br>
diff --git a/target/avr/translate.c b/target/avr/translate.c<br>
index dc9c3d6bcc..026753c963 100644<br>
--- a/target/avr/translate.c<br>
+++ b/target/avr/translate.c<br>
@@ -2971,8 +2971,18 @@ static void avr_tr_translate_insn(DisasContextBase *=
dcbase, CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0if (skip_label) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0canonicalize_skip(ctx);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_set_label(skip_label);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;base.is_jmp =3D=3D DISAS_NORETURN)=
 {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (ctx-&gt;base.is_jmp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DISAS_NORETURN:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;base.is_jmp =3D DIS=
AS_CHAIN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DISAS_NEXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;base.tb-&gt;flags &a=
mp; TB_FLAGS_SKIP) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;base.is_jm=
p =3D DISAS_TOO_MANY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -2989,6 +2999,11 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase,=
 CPUState *cs)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DisasContext *ctx =3D container_of(dcbase, DisasContext=
, base);<br>
=C2=A0 =C2=A0 =C2=A0bool nonconst_skip =3D canonicalize_skip(ctx);<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Because we disable interrupts while env-&gt;skip is =
set,<br>
+=C2=A0 =C2=A0 =C2=A0* we must return to the main loop to re-evaluate after=
ward.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 bool force_exit =3D ctx-&gt;base.tb-&gt;flags &amp; TB_FLAGS=
_SKIP;<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (ctx-&gt;base.is_jmp) {<br>
=C2=A0 =C2=A0 =C2=A0case DISAS_NORETURN:<br>
@@ -2997,7 +3012,7 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, =
CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0case DISAS_NEXT:<br>
=C2=A0 =C2=A0 =C2=A0case DISAS_TOO_MANY:<br>
=C2=A0 =C2=A0 =C2=A0case DISAS_CHAIN:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!nonconst_skip) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!nonconst_skip &amp;&amp; !force_exit) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Note gen_goto_tb checks =
singlestep.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_goto_tb(ctx, 1, ctx-&gt=
;npc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -3005,8 +3020,11 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase,=
 CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_movi_tl(cpu_pc, ctx-&gt;npc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fall through */<br>
=C2=A0 =C2=A0 =C2=A0case DISAS_LOOKUP:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_lookup_and_goto_ptr();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!force_exit) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_lookup_and_goto_ptr();<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */<br>
=C2=A0 =C2=A0 =C2=A0case DISAS_EXIT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_exit_tb(NULL, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--0000000000002d218805e73ddc58--

