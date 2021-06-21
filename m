Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF03AE2D5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 07:41:20 +0200 (CEST)
Received: from localhost ([::1]:58624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvCgR-0000ja-FP
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 01:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lvCem-0007ux-La
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 01:39:36 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lvCej-0007w8-S9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 01:39:36 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id dj3so6836387qvb.11
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 22:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rTrToKuWUunLHBbHyO0EObufI7DwMHE9tsrwfwfoghY=;
 b=WlGsC1mpNaxjtFE+KgHTfa0WatzaEX7+Zf/5NXKk3XoK0yateYq+hKQMQp2ZJxt6FW
 Y0BuWQE9QOy9HAgpShpxfCzoRbeTZB0YlkmnhWSSnItGNoRNjM702LI2aS9ONKKO2ZCv
 84sSs67Jr0b5+8GRlzrqHpN16hgyGi/pYQpNF6n8sIpC/4bPXhKvQHwI7qLOZiZJpLbw
 cuUIOBPdniw8UUKyHvbkN7pbwFqDAK26UiNprjVhgs0Oo+gDOzqA5FL1l6ukY7OKNYqs
 3W76AdeA7UlAlEEnW1CjNpLGPQQLgJT/h0kxA2lXWEagCZsIWqRUWTQUmyIRJCEtbrdB
 xtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTrToKuWUunLHBbHyO0EObufI7DwMHE9tsrwfwfoghY=;
 b=qwj4H7u7EDrrlfid+x2ZJS1nuiixUe3i2BYxC4Pw1rKIo9fGQ+scKg8tRnsvVBlU3+
 LdpXoTCUIHNH15rmzeJ4+I9qMZX3whI+R3Jfb3QRPBhh4oCzg5xeke5qEsdeBbwywfFe
 4tg8GzCthDrxvzvgr7jkRYTwAv9AGDxhQ+kgFwK0P1zmFoUuAH+45UMaghNke/eU7cGY
 0aIDkUT5FfKDeyiSxSqxSPaQoPB+ejLcqwIWZFgm3BTlVriVMDSjxHEg5dto36fmg4Nq
 auNpykAWU+pvtjhYE+rBZZA2LocbR6/r8vbJPIV/DimSp1St7tddIDPd71nXANQxdv7y
 pSiw==
X-Gm-Message-State: AOAM532pR2oc7vitHpZaPQ5o4Cnvtop4fGG1WfOD1TgnhBRzszCNoscm
 HcLvef7a4VnTYzKtJkwOTn7434WVWBKWLwph5yw=
X-Google-Smtp-Source: ABdhPJxikEr2G9fPkhESSDOrdbwQ9C1V6SkWdZA0WXzyc9diFGZeEgWE1hLKPcSrOGMSrdQCA4wrFudbUMd9aisAEzE=
X-Received: by 2002:ad4:4eee:: with SMTP id dv14mr18171230qvb.45.1624253972728; 
 Sun, 20 Jun 2021 22:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210620215022.1510617-1-richard.henderson@linaro.org>
 <20210620215022.1510617-4-richard.henderson@linaro.org>
In-Reply-To: <20210620215022.1510617-4-richard.henderson@linaro.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Mon, 21 Jun 2021 08:38:56 +0300
Message-ID: <CAK4993hJGbWG067n3cqOg5dBKkvPnEfL6k4appc+=smMQGP7mw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/avr: Convert to TranslatorOps
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000011ce9205c540197c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=mrolnik@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000011ce9205c540197c
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Tested-by: Michael Rolnik <mrolnik@gmail.com>

On Mon, Jun 21, 2021 at 12:50 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/translate.c | 234 ++++++++++++++++++++++-------------------
>  1 file changed, 128 insertions(+), 106 deletions(-)
>
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index 66e9882422..c06ce45bc7 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -2897,113 +2897,131 @@ static bool canonicalize_skip(DisasContext *ctx)
>      return true;
>  }
>
> -void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int
> max_insns)
> +static void gen_breakpoint(DisasContext *ctx)
>  {
> +    canonicalize_skip(ctx);
> +    tcg_gen_movi_tl(cpu_pc, ctx->npc);
> +    gen_helper_debug(cpu_env);
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +}
> +
> +static void avr_tr_init_disas_context(DisasContextBase *dcbase, CPUState
> *cs)
> +{
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
>      CPUAVRState *env = cs->env_ptr;
> -    DisasContext ctx1 = {
> -        .base.tb = tb,
> -        .base.is_jmp = DISAS_NEXT,
> -        .base.pc_first = tb->pc,
> -        .base.pc_next = tb->pc,
> -        .base.singlestep_enabled = cs->singlestep_enabled,
> -        .cs = cs,
> -        .env = env,
> -        .memidx = 0,
> -        .skip_cond = TCG_COND_NEVER,
> -    };
> -    DisasContext *ctx = &ctx1;
> -    target_ulong pc_start = tb->pc / 2;
> -    int num_insns = 0;
> +    uint32_t tb_flags = ctx->base.tb->flags;
>
> -    if (tb->flags & TB_FLAGS_FULL_ACCESS) {
> -        /*
> -         * This flag is set by ST/LD instruction we will regenerate it
> ONLY
> -         * with mem/cpu memory access instead of mem access
> -         */
> -        max_insns = 1;
> -    }
> -    if (ctx->base.singlestep_enabled) {
> -        max_insns = 1;
> -    }
> +    ctx->cs = cs;
> +    ctx->env = env;
> +    ctx->npc = ctx->base.pc_first / 2;
>
> -    gen_tb_start(tb);
> -
> -    ctx->npc = pc_start;
> -    if (tb->flags & TB_FLAGS_SKIP) {
> +    ctx->skip_cond = TCG_COND_NEVER;
> +    if (tb_flags & TB_FLAGS_SKIP) {
>          ctx->skip_cond = TCG_COND_ALWAYS;
>          ctx->skip_var0 = cpu_skip;
>      }
>
> -    do {
> -        TCGLabel *skip_label = NULL;
> -
> -        /* translate current instruction */
> -        tcg_gen_insn_start(ctx->npc);
> -        num_insns++;
> -
> +    if (tb_flags & TB_FLAGS_FULL_ACCESS) {
>          /*
> -         * this is due to some strange GDB behavior
> -         * let's assume main has address 0x100
> -         * b main   - sets breakpoint at address 0x00000100 (code)
> -         * b *0x100 - sets breakpoint at address 0x00800100 (data)
> +         * This flag is set by ST/LD instruction we will regenerate it
> ONLY
> +         * with mem/cpu memory access instead of mem access
>           */
> -        if (unlikely(!ctx->base.singlestep_enabled &&
> -            (cpu_breakpoint_test(cs, OFFSET_CODE + ctx->npc * 2, BP_ANY)
> ||
> -             cpu_breakpoint_test(cs, OFFSET_DATA + ctx->npc * 2,
> BP_ANY)))) {
> -            canonicalize_skip(ctx);
> -            tcg_gen_movi_tl(cpu_pc, ctx->npc);
> -            gen_helper_debug(cpu_env);
> -            goto done_generating;
> -        }
> +        ctx->base.max_insns = 1;
> +    }
> +}
>
> -        /* Conditionally skip the next instruction, if indicated.  */
> -        if (ctx->skip_cond != TCG_COND_NEVER) {
> -            skip_label = gen_new_label();
> -            if (ctx->skip_var0 == cpu_skip) {
> -                /*
> -                 * Copy cpu_skip so that we may zero it before the branch.
> -                 * This ensures that cpu_skip is non-zero after the label
> -                 * if and only if the skipped insn itself sets a skip.
> -                 */
> -                ctx->free_skip_var0 = true;
> -                ctx->skip_var0 = tcg_temp_new();
> -                tcg_gen_mov_tl(ctx->skip_var0, cpu_skip);
> -                tcg_gen_movi_tl(cpu_skip, 0);
> -            }
> -            if (ctx->skip_var1 == NULL) {
> -                tcg_gen_brcondi_tl(ctx->skip_cond, ctx->skip_var0,
> -                                   0, skip_label);
> -            } else {
> -                tcg_gen_brcond_tl(ctx->skip_cond, ctx->skip_var0,
> -                                  ctx->skip_var1, skip_label);
> -                ctx->skip_var1 = NULL;
> -            }
> -            if (ctx->free_skip_var0) {
> -                tcg_temp_free(ctx->skip_var0);
> -                ctx->free_skip_var0 = false;
> -            }
> -            ctx->skip_cond = TCG_COND_NEVER;
> -            ctx->skip_var0 = NULL;
> -        }
> +static void avr_tr_tb_start(DisasContextBase *db, CPUState *cs)
> +{
> +}
>
> -        translate(ctx);
> +static void avr_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
> +{
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
>
> -        if (skip_label) {
> -            canonicalize_skip(ctx);
> -            gen_set_label(skip_label);
> -            if (ctx->base.is_jmp == DISAS_NORETURN) {
> -                ctx->base.is_jmp = DISAS_CHAIN;
> -            }
> -        }
> -    } while (ctx->base.is_jmp == DISAS_NEXT
> -             && num_insns < max_insns
> -             && (ctx->npc - pc_start) * 2 < TARGET_PAGE_SIZE - 4
> -             && !tcg_op_buf_full());
> +    tcg_gen_insn_start(ctx->npc);
> +}
>
> -    if (tb->cflags & CF_LAST_IO) {
> -        gen_io_end();
> +static bool avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState
> *cs,
> +                                    const CPUBreakpoint *bp)
> +{
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +
> +    gen_breakpoint(ctx);
> +    return true;
> +}
> +
> +static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
> +{
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +    TCGLabel *skip_label = NULL;
> +
> +    /*
> +     * This is due to some strange GDB behavior
> +     * Let's assume main has address 0x100:
> +     * b main   - sets breakpoint at address 0x00000100 (code)
> +     * b *0x100 - sets breakpoint at address 0x00800100 (data)
> +     *
> +     * The translator driver has already taken care of the code pointer.
> +     */
> +    if (!ctx->base.singlestep_enabled &&
> +        cpu_breakpoint_test(cs, OFFSET_DATA + ctx->base.pc_next, BP_ANY))
> {
> +        gen_breakpoint(ctx);
> +        return;
>      }
>
> +    /* Conditionally skip the next instruction, if indicated.  */
> +    if (ctx->skip_cond != TCG_COND_NEVER) {
> +        skip_label = gen_new_label();
> +        if (ctx->skip_var0 == cpu_skip) {
> +            /*
> +             * Copy cpu_skip so that we may zero it before the branch.
> +             * This ensures that cpu_skip is non-zero after the label
> +             * if and only if the skipped insn itself sets a skip.
> +             */
> +            ctx->free_skip_var0 = true;
> +            ctx->skip_var0 = tcg_temp_new();
> +            tcg_gen_mov_tl(ctx->skip_var0, cpu_skip);
> +            tcg_gen_movi_tl(cpu_skip, 0);
> +        }
> +        if (ctx->skip_var1 == NULL) {
> +            tcg_gen_brcondi_tl(ctx->skip_cond, ctx->skip_var0, 0,
> skip_label);
> +        } else {
> +            tcg_gen_brcond_tl(ctx->skip_cond, ctx->skip_var0,
> +                              ctx->skip_var1, skip_label);
> +            ctx->skip_var1 = NULL;
> +        }
> +        if (ctx->free_skip_var0) {
> +            tcg_temp_free(ctx->skip_var0);
> +            ctx->free_skip_var0 = false;
> +        }
> +        ctx->skip_cond = TCG_COND_NEVER;
> +        ctx->skip_var0 = NULL;
> +    }
> +
> +    translate(ctx);
> +
> +    ctx->base.pc_next = ctx->npc * 2;
> +
> +    if (skip_label) {
> +        canonicalize_skip(ctx);
> +        gen_set_label(skip_label);
> +        if (ctx->base.is_jmp == DISAS_NORETURN) {
> +            ctx->base.is_jmp = DISAS_CHAIN;
> +        }
> +    }
> +
> +    if (ctx->base.is_jmp == DISAS_NEXT) {
> +        target_ulong page_first = ctx->base.pc_first & TARGET_PAGE_MASK;
> +
> +        if ((ctx->base.pc_next - page_first) >= TARGET_PAGE_SIZE - 4) {
> +            ctx->base.is_jmp = DISAS_TOO_MANY;
> +        }
> +    }
> +}
> +
> +static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
> +{
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
>      bool nonconst_skip = canonicalize_skip(ctx);
>
>      switch (ctx->base.is_jmp) {
> @@ -3036,24 +3054,28 @@ void gen_intermediate_code(CPUState *cs,
> TranslationBlock *tb, int max_insns)
>      default:
>          g_assert_not_reached();
>      }
> +}
>
> -done_generating:
> -    gen_tb_end(tb, num_insns);
> +static void avr_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
> +{
> +    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
> +    log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
> +}
>
> -    tb->size = (ctx->npc - pc_start) * 2;
> -    tb->icount = num_insns;
> +static const TranslatorOps avr_tr_ops = {
> +    .init_disas_context = avr_tr_init_disas_context,
> +    .tb_start           = avr_tr_tb_start,
> +    .insn_start         = avr_tr_insn_start,
> +    .breakpoint_check   = avr_tr_breakpoint_check,
> +    .translate_insn     = avr_tr_translate_insn,
> +    .tb_stop            = avr_tr_tb_stop,
> +    .disas_log          = avr_tr_disas_log,
> +};
>
> -#ifdef DEBUG_DISAS
> -    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
> -        && qemu_log_in_addr_range(tb->pc)) {
> -        FILE *fd;
> -        fd = qemu_log_lock();
> -        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
> -        log_target_disas(cs, tb->pc, tb->size);
> -        qemu_log("\n");
> -        qemu_log_unlock(fd);
> -    }
> -#endif
> +void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int
> max_insns)
> +{
> +    DisasContext dc = { };
> +    translator_loop(&avr_tr_ops, &dc.base, cs, tb, max_insns);
>  }
>
>  void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
> --
> 2.25.1
>
>

-- 
Best Regards,
Michael Rolnik

--00000000000011ce9205c540197c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;<div>Tested-by: Michael Rolnik &lt;<a h=
ref=3D"mailto:mrolnik@gmail.com">mrolnik@gmail.com</a>&gt;<br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Jun 21, 2021 at 12:50 AM Richard Henderson &lt;<a href=3D"mailto:richard.h=
enderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Richard Hen=
derson &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank=
">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/avr/translate.c | 234 ++++++++++++++++++++++------------------=
-<br>
=C2=A01 file changed, 128 insertions(+), 106 deletions(-)<br>
<br>
diff --git a/target/avr/translate.c b/target/avr/translate.c<br>
index 66e9882422..c06ce45bc7 100644<br>
--- a/target/avr/translate.c<br>
+++ b/target/avr/translate.c<br>
@@ -2897,113 +2897,131 @@ static bool canonicalize_skip(DisasContext *ctx)<=
br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_ins=
ns)<br>
+static void gen_breakpoint(DisasContext *ctx)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 canonicalize_skip(ctx);<br>
+=C2=A0 =C2=A0 tcg_gen_movi_tl(cpu_pc, ctx-&gt;npc);<br>
+=C2=A0 =C2=A0 gen_helper_debug(cpu_env);<br>
+=C2=A0 =C2=A0 ctx-&gt;base.is_jmp =3D DISAS_NORETURN;<br>
+}<br>
+<br>
+static void avr_tr_init_disas_context(DisasContextBase *dcbase, CPUState *=
cs)<br>
+{<br>
+=C2=A0 =C2=A0 DisasContext *ctx =3D container_of(dcbase, DisasContext, bas=
e);<br>
=C2=A0 =C2=A0 =C2=A0CPUAVRState *env =3D cs-&gt;env_ptr;<br>
-=C2=A0 =C2=A0 DisasContext ctx1 =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .base.tb =3D tb,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .base.is_jmp =3D DISAS_NEXT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .base.pc_first =3D tb-&gt;pc,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .base.pc_next =3D tb-&gt;pc,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .base.singlestep_enabled =3D cs-&gt;singlestep=
_enabled,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cs =3D cs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .env =3D env,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .memidx =3D 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .skip_cond =3D TCG_COND_NEVER,<br>
-=C2=A0 =C2=A0 };<br>
-=C2=A0 =C2=A0 DisasContext *ctx =3D &amp;ctx1;<br>
-=C2=A0 =C2=A0 target_ulong pc_start =3D tb-&gt;pc / 2;<br>
-=C2=A0 =C2=A0 int num_insns =3D 0;<br>
+=C2=A0 =C2=A0 uint32_t tb_flags =3D ctx-&gt;base.tb-&gt;flags;<br>
<br>
-=C2=A0 =C2=A0 if (tb-&gt;flags &amp; TB_FLAGS_FULL_ACCESS) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This flag is set by ST/LD instruction =
we will regenerate it ONLY<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* with mem/cpu memory access instead of =
mem access<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_insns =3D 1;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (ctx-&gt;base.singlestep_enabled) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_insns =3D 1;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ctx-&gt;cs =3D cs;<br>
+=C2=A0 =C2=A0 ctx-&gt;env =3D env;<br>
+=C2=A0 =C2=A0 ctx-&gt;npc =3D ctx-&gt;base.pc_first / 2;<br>
<br>
-=C2=A0 =C2=A0 gen_tb_start(tb);<br>
-<br>
-=C2=A0 =C2=A0 ctx-&gt;npc =3D pc_start;<br>
-=C2=A0 =C2=A0 if (tb-&gt;flags &amp; TB_FLAGS_SKIP) {<br>
+=C2=A0 =C2=A0 ctx-&gt;skip_cond =3D TCG_COND_NEVER;<br>
+=C2=A0 =C2=A0 if (tb_flags &amp; TB_FLAGS_SKIP) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;skip_cond =3D TCG_COND_ALWAYS;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;skip_var0 =3D cpu_skip;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGLabel *skip_label =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* translate current instruction */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_insn_start(ctx-&gt;npc);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 num_insns++;<br>
-<br>
+=C2=A0 =C2=A0 if (tb_flags &amp; TB_FLAGS_FULL_ACCESS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this is due to some strange GDB behavi=
or<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* let&#39;s assume main has address 0x10=
0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* b main=C2=A0 =C2=A0- sets breakpoint a=
t address 0x00000100 (code)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* b *0x100 - sets breakpoint at address =
0x00800100 (data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This flag is set by ST/LD instruction =
we will regenerate it ONLY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* with mem/cpu memory access instead of =
mem access<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(!ctx-&gt;base.singlestep_enabled =
&amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cpu_breakpoint_test(cs, OFFSET_=
CODE + ctx-&gt;npc * 2, BP_ANY) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_breakpoint_test(cs, OF=
FSET_DATA + ctx-&gt;npc * 2, BP_ANY)))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 canonicalize_skip(ctx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(cpu_pc, ctx-&gt;=
npc);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_debug(cpu_env);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done_generating;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;base.max_insns =3D 1;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Conditionally skip the next instruction, if=
 indicated.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;skip_cond !=3D TCG_COND_NEVER) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_label =3D gen_new_label();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;skip_var0 =3D=3D cpu=
_skip) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Copy cpu_s=
kip so that we may zero it before the branch.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This ensur=
es that cpu_skip is non-zero after the label<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if and onl=
y if the skipped insn itself sets a skip.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;free_skip_=
var0 =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;skip_var0 =
=3D tcg_temp_new();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(ctx=
-&gt;skip_var0, cpu_skip);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(cp=
u_skip, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;skip_var1 =3D=3D NUL=
L) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcondi_tl=
(ctx-&gt;skip_cond, ctx-&gt;skip_var0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, skip_label);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcond_tl(=
ctx-&gt;skip_cond, ctx-&gt;skip_var0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;skip_var1, skip_label=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;skip_var1 =
=3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;free_skip_var0) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(ctx-=
&gt;skip_var0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;free_skip_=
var0 =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;skip_cond =3D TCG_COND_N=
EVER;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;skip_var0 =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+static void avr_tr_tb_start(DisasContextBase *db, CPUState *cs)<br>
+{<br>
+}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 translate(ctx);<br>
+static void avr_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)<br>
+{<br>
+=C2=A0 =C2=A0 DisasContext *ctx =3D container_of(dcbase, DisasContext, bas=
e);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (skip_label) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 canonicalize_skip(ctx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_label(skip_label);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;base.is_jmp =3D=3D D=
ISAS_NORETURN) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;base.is_jm=
p =3D DISAS_CHAIN;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 } while (ctx-&gt;base.is_jmp =3D=3D DISAS_NEXT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; num_insns &lt; =
max_insns<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (ctx-&gt;npc - =
pc_start) * 2 &lt; TARGET_PAGE_SIZE - 4<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !tcg_op_buf_ful=
l());<br>
+=C2=A0 =C2=A0 tcg_gen_insn_start(ctx-&gt;npc);<br>
+}<br>
<br>
-=C2=A0 =C2=A0 if (tb-&gt;cflags &amp; CF_LAST_IO) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_end();<br>
+static bool avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const CPUBreakpoint *b=
p)<br>
+{<br>
+=C2=A0 =C2=A0 DisasContext *ctx =3D container_of(dcbase, DisasContext, bas=
e);<br>
+<br>
+=C2=A0 =C2=A0 gen_breakpoint(ctx);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)<=
br>
+{<br>
+=C2=A0 =C2=A0 DisasContext *ctx =3D container_of(dcbase, DisasContext, bas=
e);<br>
+=C2=A0 =C2=A0 TCGLabel *skip_label =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* This is due to some strange GDB behavior<br>
+=C2=A0 =C2=A0 =C2=A0* Let&#39;s assume main has address 0x100:<br>
+=C2=A0 =C2=A0 =C2=A0* b main=C2=A0 =C2=A0- sets breakpoint at address 0x00=
000100 (code)<br>
+=C2=A0 =C2=A0 =C2=A0* b *0x100 - sets breakpoint at address 0x00800100 (da=
ta)<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* The translator driver has already taken care of the =
code pointer.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (!ctx-&gt;base.singlestep_enabled &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_breakpoint_test(cs, OFFSET_DATA + ctx-&gt;=
base.pc_next, BP_ANY)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_breakpoint(ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /* Conditionally skip the next instruction, if indicated.=C2=
=A0 */<br>
+=C2=A0 =C2=A0 if (ctx-&gt;skip_cond !=3D TCG_COND_NEVER) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_label =3D gen_new_label();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;skip_var0 =3D=3D cpu_skip) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Copy cpu_skip so that we=
 may zero it before the branch.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This ensures that cpu_sk=
ip is non-zero after the label<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if and only if the skipp=
ed insn itself sets a skip.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;free_skip_var0 =3D true;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;skip_var0 =3D tcg_temp_n=
ew();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(ctx-&gt;skip_var0=
, cpu_skip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(cpu_skip, 0);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;skip_var1 =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcondi_tl(ctx-&gt;skip_=
cond, ctx-&gt;skip_var0, 0, skip_label);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcond_tl(ctx-&gt;skip_c=
ond, ctx-&gt;skip_var0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;skip_var1, skip_label);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;skip_var1 =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;free_skip_var0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(ctx-&gt;skip_var0)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;free_skip_var0 =3D false=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;skip_cond =3D TCG_COND_NEVER;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;skip_var0 =3D NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 translate(ctx);<br>
+<br>
+=C2=A0 =C2=A0 ctx-&gt;base.pc_next =3D ctx-&gt;npc * 2;<br>
+<br>
+=C2=A0 =C2=A0 if (skip_label) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 canonicalize_skip(ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_label(skip_label);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;base.is_jmp =3D=3D DISAS_NORETURN)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;base.is_jmp =3D DISAS_CH=
AIN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (ctx-&gt;base.is_jmp =3D=3D DISAS_NEXT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong page_first =3D ctx-&gt;base.pc_fi=
rst &amp; TARGET_PAGE_MASK;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ctx-&gt;base.pc_next - page_first) &gt;=
=3D TARGET_PAGE_SIZE - 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;base.is_jmp =3D DISAS_TO=
O_MANY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)<br>
+{<br>
+=C2=A0 =C2=A0 DisasContext *ctx =3D container_of(dcbase, DisasContext, bas=
e);<br>
=C2=A0 =C2=A0 =C2=A0bool nonconst_skip =3D canonicalize_skip(ctx);<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (ctx-&gt;base.is_jmp) {<br>
@@ -3036,24 +3054,28 @@ void gen_intermediate_code(CPUState *cs, Translatio=
nBlock *tb, int max_insns)<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
<br>
-done_generating:<br>
-=C2=A0 =C2=A0 gen_tb_end(tb, num_insns);<br>
+static void avr_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)=
<br>
+{<br>
+=C2=A0 =C2=A0 qemu_log(&quot;IN: %s\n&quot;, lookup_symbol(dcbase-&gt;pc_f=
irst));<br>
+=C2=A0 =C2=A0 log_target_disas(cs, dcbase-&gt;pc_first, dcbase-&gt;tb-&gt;=
size);<br>
+}<br>
<br>
-=C2=A0 =C2=A0 tb-&gt;size =3D (ctx-&gt;npc - pc_start) * 2;<br>
-=C2=A0 =C2=A0 tb-&gt;icount =3D num_insns;<br>
+static const TranslatorOps avr_tr_ops =3D {<br>
+=C2=A0 =C2=A0 .init_disas_context =3D avr_tr_init_disas_context,<br>
+=C2=A0 =C2=A0 .tb_start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D avr_tr=
_tb_start,<br>
+=C2=A0 =C2=A0 .insn_start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D avr_tr_insn=
_start,<br>
+=C2=A0 =C2=A0 .breakpoint_check=C2=A0 =C2=A0=3D avr_tr_breakpoint_check,<b=
r>
+=C2=A0 =C2=A0 .translate_insn=C2=A0 =C2=A0 =C2=A0=3D avr_tr_translate_insn=
,<br>
+=C2=A0 =C2=A0 .tb_stop=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D avr_tr=
_tb_stop,<br>
+=C2=A0 =C2=A0 .disas_log=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D avr_tr_disa=
s_log,<br>
+};<br>
<br>
-#ifdef DEBUG_DISAS<br>
-=C2=A0 =C2=A0 if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; qemu_log_in_addr_range(tb-&gt;pc)) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE *fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_log_lock();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IN: %s\n&quot;, lookup_symbol(t=
b-&gt;pc));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 log_target_disas(cs, tb-&gt;pc, tb-&gt;size);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_unlock(fd);<br>
-=C2=A0 =C2=A0 }<br>
-#endif<br>
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_ins=
ns)<br>
+{<br>
+=C2=A0 =C2=A0 DisasContext dc =3D { };<br>
+=C2=A0 =C2=A0 translator_loop(&amp;avr_tr_ops, &amp;dc.base, cs, tb, max_i=
nsns);<br>
=C2=A0}<br>
<br>
=C2=A0void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--00000000000011ce9205c540197c--

