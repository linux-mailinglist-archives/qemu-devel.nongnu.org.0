Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B163ADFCB
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 20:36:02 +0200 (CEST)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv2Ia-0005PV-RG
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 14:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lv2H5-0004gM-I0
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 14:34:27 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lv2H1-0003qq-Qk
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 14:34:27 -0400
Received: by mail-qk1-x736.google.com with SMTP id g142so24804767qke.4
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VxuhGmJ6TbgNQE8Ok4Psxg6KH3wcx3ncz6miZPziot0=;
 b=G5028WXmvyjG1myJ4uFQK4N8osVF5KkENQ01MtlApZc69e3B8sJ2A/5LjQ0WwNVm+6
 aYPWH6OUvgfP0istYES8HtxEx78zoerLe3qgBNgE9xVMWI6A3vAFbfcQdniSIVd9G1S5
 U5oXgRpDW3zMMnN8MKXpko/B8SXnOTkNrARSGV/H0hfWhcMKVH4ZtDjkcz08POTj1xdo
 2HCe/88g/uhu3UN3TeRwxlPa5Q9ONX+5Iz/2AryA1+w9oDW8WHseYnH5T9mxd9X4dNkJ
 +m8ok05D/yj4rD1pLA+ejuFaP5S3SXgGdrDeeB78WpJ8e8U5SthA4ZEen9wZrInBRtN2
 J3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VxuhGmJ6TbgNQE8Ok4Psxg6KH3wcx3ncz6miZPziot0=;
 b=JOcypb+KYPJZMWy4CX8liHP7LouwnjxHK5rIuG3VJaj8gD4C5F2YPeTKIxhHSGZxL9
 natakgJ8rhshR74Fbw22xaNtUZX84xgIh0/2kqkf3CooLzm0liZ17kfAje4ZLaAu5lPy
 BWrs/CX2tvbVqo4/yw8+ccQZEhMhsgwxUzaEQFlgDYvKg+6eYnvOstIf3RCbaIMguN/D
 6bcvNkQ8oJMkBtO5LivwC9EnMce7fS40pleIstGFnxXSCf6k7nyK/Az0RQ05BEfP3ZS9
 i/uSYPhggYufwgV/RRRSHhXcYwLRgRWjI8ogIpRWZF98qpom+UdIW1/a3vZScliTDxIM
 fV0g==
X-Gm-Message-State: AOAM533i/D5IiGvwzNAEdA3sTaHXdDnCQVXs4rhHCkjLt2mfk0dmdU15
 yGoJ4IcIFIqNhoIe4xRgyh22MrBWHEaNgF58k1Y=
X-Google-Smtp-Source: ABdhPJwUWiGs7B2YiorC/vSoyVTaG3EKkU5zS1xKNtNaSIbS+gpUkdLJFo28A4iVNY6IJXoPndx/Re5AhV2BhZLg+fU=
X-Received: by 2002:a37:4388:: with SMTP id q130mr6338486qka.460.1624214061958; 
 Sun, 20 Jun 2021 11:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210620062007.1398574-1-richard.henderson@linaro.org>
 <20210620062007.1398574-4-richard.henderson@linaro.org>
In-Reply-To: <20210620062007.1398574-4-richard.henderson@linaro.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sun, 20 Jun 2021 21:33:45 +0300
Message-ID: <CAK4993i-BK=breSb3gtKsFDoopWcz4JaBgR-oJiZ-dghzwCnyw@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/avr: Convert to TranslatorOps
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000033c8e105c536ce95"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=mrolnik@gmail.com; helo=mail-qk1-x736.google.com
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

--00000000000033c8e105c536ce95
Content-Type: text/plain; charset="UTF-8"

Hi Richard.

I reviewed the changes, they look good however
```
avocado --show=app run -t arch:avr tests/acceptance
```
fails with
```
Fetching asset from
tests/acceptance/machine_avr6.py:AVR6Machine.test_freertos
JOB ID     : 930e8b1e13b2b907f1623096099029c33f83762f
JOB LOG    :
/home/mrolnik/avocado/job-results/job-2021-06-20T21.30-930e8b1/job.log
 (1/1) tests/acceptance/machine_avr6.py:AVR6Machine.test_freertos: ERROR:
Could not perform graceful shutdown (2.05 s)
RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 5.27 s
```
after applying the third patch.

On Sun, Jun 20, 2021 at 9:20 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/translate.c | 238 +++++++++++++++++++++++------------------
>  1 file changed, 132 insertions(+), 106 deletions(-)
>
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index 66e9882422..72117bf3b9 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -2897,113 +2897,135 @@ static bool canonicalize_skip(DisasContext *ctx)
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
> +    ctx->cs = cs,
> +    ctx->env = env,
> +    ctx->memidx = 0,
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
> +    if (ctx->base.singlestep_enabled) {
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
> @@ -3036,24 +3058,28 @@ void gen_intermediate_code(CPUState *cs,
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
> +    DisasContext dc;
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

--00000000000033c8e105c536ce95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard.<div><br></div><div>I reviewed the changes, the=
y look=C2=A0good however</div><div>```</div><div>avocado --show=3Dapp run -=
t arch:avr tests/acceptance<br></div><div>```</div><div>fails with</div><di=
v>```</div><div>Fetching asset from tests/acceptance/machine_avr6.py:AVR6Ma=
chine.test_freertos<br>JOB ID =C2=A0 =C2=A0 : 930e8b1e13b2b907f162309609902=
9c33f83762f<br>JOB LOG =C2=A0 =C2=A0: /home/mrolnik/avocado/job-results/job=
-2021-06-20T21.30-930e8b1/job.log<br>=C2=A0(1/1) tests/acceptance/machine_a=
vr6.py:AVR6Machine.test_freertos: ERROR: Could not perform graceful shutdow=
n (2.05 s)<br>RESULTS =C2=A0 =C2=A0: PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | W=
ARN 0 | INTERRUPT 0 | CANCEL 0<br>JOB TIME =C2=A0 : 5.27 s<br></div><div>``=
`</div><div>after applying the third patch.</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 20, 2021 at 9:=
20 AM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org"=
>richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Signed-off-by: Richard Henderson &lt;<a href=
=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richard.henderso=
n@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/avr/translate.c | 238 +++++++++++++++++++++++-----------------=
-<br>
=C2=A01 file changed, 132 insertions(+), 106 deletions(-)<br>
<br>
diff --git a/target/avr/translate.c b/target/avr/translate.c<br>
index 66e9882422..72117bf3b9 100644<br>
--- a/target/avr/translate.c<br>
+++ b/target/avr/translate.c<br>
@@ -2897,113 +2897,135 @@ static bool canonicalize_skip(DisasContext *ctx)<=
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
+=C2=A0 =C2=A0 ctx-&gt;cs =3D cs,<br>
+=C2=A0 =C2=A0 ctx-&gt;env =3D env,<br>
+=C2=A0 =C2=A0 ctx-&gt;memidx =3D 0,<br>
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
+=C2=A0 =C2=A0 if (ctx-&gt;base.singlestep_enabled) {<br>
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
@@ -3036,24 +3058,28 @@ void gen_intermediate_code(CPUState *cs, Translatio=
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
+=C2=A0 =C2=A0 DisasContext dc;<br>
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

--00000000000033c8e105c536ce95--

