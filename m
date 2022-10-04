Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEC65F47E3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 18:48:29 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofl5o-0004Jv-99
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 12:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofki1-0006i5-NT
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 12:23:53 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofkhz-0006TM-GD
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 12:23:53 -0400
Received: by mail-ed1-x529.google.com with SMTP id x59so9570917ede.7
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=MRiL0TWNNlgDyp6OZWDJM/DCsv4yogguusU1h3DM4Zo=;
 b=XUw0zNmqYP4z4ZDdL11bFdXqe6i7n9fNSU43+Jlq5N4RAO7U5sXbSQwbSzuSnNB8zf
 0//Zno2bQNigsw21dbTFdVpM/sSkBUz6+3r+xwWRcvxeUF2UbUiiGDyB/A4nZRHA3y79
 rtPCYucm2tk2T0UuagOPTGRpcW6VtDfOKH3bQbeB2vmbhuyc1pNxPnqGd6xakkP1mOJh
 21AunI4waXrd5aa1oGndUkWSJEhulW9XSsBXYKFgeOhQbtYgELx5mz3bFvAcplR3N1xn
 p91jK0r9Jy330wyiB8KEO58XqZKDW/0Q4HoajxyRtcpn7V1G7tV6a8XJx+lBG/riuJ56
 4Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MRiL0TWNNlgDyp6OZWDJM/DCsv4yogguusU1h3DM4Zo=;
 b=W3f1krLgkJ+jVKMOFFEoqPG5eyESruDuZTaVP9AQF3G4j/PYz71fm0eeHuhkephG2d
 tX5fXDcEtGUFVcHsBkTQTxWpK46YJXJ0m4FA02W3bvXS4Q3zo5hAKUYlfw5WUsJK+Pre
 4JBH3GFkmmIjzlkiAWvdt0BQb6QpeD3IyFfE7lBMQljImHXVKrJepAjW3R9y6UNfP3gO
 3wVy8rzwgCTFl+Z2OI5nOZwzTlFdR9ZUY6+U2C6plo/NebekxjLx5+yGbrSkrXPJtMgl
 8xx+G27RAzevhkEylrn2Lp4crmCZSX2yZt8apTlLMA8YoqoT/VOushx5ULf5eGIl1mc6
 vVKw==
X-Gm-Message-State: ACrzQf1p9/v0J71IO3XI9IWdvkt92sRSs8rqQRBaNy4wPnmAVbDHVHZ7
 GrmIgBAB31CbYdopCT2+PDDtt8cIDamtPf2q5qMj2g==
X-Google-Smtp-Source: AMsMyM5j1m02rKG9sHfBHdIutDNo+xy7CbD9N+92NZ4oFZK9z3HGzTz+p+pe09TMeIBNGvZ2DBXAf9vpoCTML+R3aQg=
X-Received: by 2002:a05:6402:1686:b0:459:4ddf:8f05 with SMTP id
 a6-20020a056402168600b004594ddf8f05mr4311543edv.375.1664900629495; Tue, 04
 Oct 2022 09:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-10-richard.henderson@linaro.org>
In-Reply-To: <20220930220312.135327-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 17:23:38 +0100
Message-ID: <CAFEAcA_x9zJQy1_9_ySO+TNnnXnYPC3Uq37AN1jP65SuEMvJZw@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] target/arm: Enable TARGET_TB_PCREL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 30 Sept 2022 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h     |  1 +
>  target/arm/translate.h     | 19 ++++++++++++
>  target/arm/cpu.c           | 23 +++++++-------
>  target/arm/translate-a64.c | 37 ++++++++++++++++++-----
>  target/arm/translate.c     | 62 ++++++++++++++++++++++++++++++--------
>  5 files changed, 112 insertions(+), 30 deletions(-)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 68ffb12427..29c5fc4241 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -30,6 +30,7 @@
>   */
>  # define TARGET_PAGE_BITS_VARY
>  # define TARGET_PAGE_BITS_MIN  10
> +# define TARGET_TB_PCREL 1
>  #endif
>
>  #define NB_MMU_MODES 15
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index 4aa239e23c..41d14cc067 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -12,6 +12,25 @@ typedef struct DisasContext {
>
>      /* The address of the current instruction being translated. */
>      target_ulong pc_curr;
> +    /*
> +     * For TARGET_TB_PCREL, the full value of cpu_pc is not known
> +     * (although the page offset is known).  For convenience, the
> +     * translation loop uses the full virtual address that triggered
> +     * the translation is used, from base.pc_start through pc_curr.

s/ is used//

> +     * For efficiency, we do not update cpu_pc for every instruction.
> +     * Instead, pc_save has the value of pc_curr at the time of the
> +     * last update to cpu_pc, which allows us to compute the addend
> +     * needed to bring cpu_pc current: pc_curr - pc_save.
> +     * If cpu_pc now contains the destiation of an indirect branch,

"destination"

> +     * pc_save contains -1 to indicate that relative updates are no
> +     * longer possible.
> +     */
> +    target_ulong pc_save;
> +    /*
> +     * Similarly, pc_cond_save contains the value of pc_save at the
> +     * beginning of an AArch32 conditional instruction.
> +     */
> +    target_ulong pc_cond_save;
>      target_ulong page_start;
>      uint32_t insn;
>      /* Nonzero if this instruction has been conditionally skipped.  */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 94ca6f163f..0bc5e9b125 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -76,17 +76,18 @@ static vaddr arm_cpu_get_pc(CPUState *cs)
>  void arm_cpu_synchronize_from_tb(CPUState *cs,
>                                   const TranslationBlock *tb)
>  {
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -
> -    /*
> -     * It's OK to look at env for the current mode here, because it's
> -     * never possible for an AArch64 TB to chain to an AArch32 TB.
> -     */
> -    if (is_a64(env)) {
> -        env->pc = tb_pc(tb);
> -    } else {
> -        env->regs[15] = tb_pc(tb);
> +    /* The program counter is always up to date with TARGET_TB_PCREL. */

I was confused for a bit about this, but it works because
although the synchronize_from_tb hook has a name that implies
it's comparatively general purpose, in fact we use it only
in the special case of "we abandoned execution at the start of
this TB without executing any of it".

> +    if (!TARGET_TB_PCREL) {
> +        CPUARMState *env = cs->env_ptr;
> +        /*
> +         * It's OK to look at env for the current mode here, because it's
> +         * never possible for an AArch64 TB to chain to an AArch32 TB.
> +         */
> +        if (is_a64(env)) {
> +            env->pc = tb_pc(tb);
> +        } else {
> +            env->regs[15] = tb_pc(tb);
> +        }
>      }
>  }
>  #endif /* CONFIG_TCG */

> @@ -347,16 +354,22 @@ static void gen_exception_internal(int excp)
>
>  static void gen_exception_internal_insn(DisasContext *s, int excp)
>  {
> +    target_ulong pc_save = s->pc_save;
> +
>      gen_a64_update_pc(s, 0);
>      gen_exception_internal(excp);
>      s->base.is_jmp = DISAS_NORETURN;
> +    s->pc_save = pc_save;

What is trashing s->pc_save that we have to work around like this,
here and in the other similar changes ?

thanks
-- PMM

