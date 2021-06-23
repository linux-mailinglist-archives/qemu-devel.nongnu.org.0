Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9E3B1B6E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 15:44:25 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3B2-0007UX-Hj
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 09:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lw3A4-0006kw-8Y
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:43:24 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:34655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lw3A2-0002c9-36
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:43:24 -0400
Received: by mail-lj1-x229.google.com with SMTP id a21so3062925ljj.1
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aHdf9phIC7o4YqcVGjKBhLvtxr0m8yooIwtLRglTF4o=;
 b=BPopcstWctp+HVZI3EStg49u2WiwHs81Q/1KFyAQpDXxuQX6H7hNngDJEvFckKcFpn
 wSaLZ7dnh8P0u26W/+58T+2CgwgiYLWwvaYx4gQHPdoSzRBTt9h6ENi8lbvDan0gvZ+k
 p2rCnFymY+JXfq2w87w76rr8wBKBMvQWxZf2pRJSi8pqEzaJcK5KKNxapDt842Mv1NOz
 fdWNwTwvOp9kZnucrM5b7fhay6hSeGwP7hfITKNDDF9NiDDQVh19yV86euAHzDUXHk6J
 MfLTlf2mV2/fAWrbGs/amKHyI66dlaaBjsYbobEJzLaYKdXZuEfVLEls4qWCa4uNpEEj
 X4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aHdf9phIC7o4YqcVGjKBhLvtxr0m8yooIwtLRglTF4o=;
 b=hHprLUX94CoTUlOtTPwgP3HIEy6rNg5CXxEbLUa9iqYzN55IaJ/JwM3vHBsqGkwEE7
 q0izKABRUBeKzS5DwkGa7dhzrKpOarMgxSW9ZNl9LFRVwuk5BHLuw0Y+HsXexLbOmPH3
 o4Jap96a8ooP+q207T4lFplFthOYKUP5XAUJ5Le+hudr61vZ/jYMRXZlw1xCpmgVpgud
 YDhPyLNpPNq7BiVYOG5dG4YFzQa5X2+qtUkIxulnxyeRzN3pbhhFxRjVv9DYQACJbnxX
 Nl4pVf93Jjkouipw7a+blN1hT5PiEqQa6XkeyhnpIsf28yye/YNZ2XkZVOBY/FnSJ711
 IcLA==
X-Gm-Message-State: AOAM530pqttOj+a1CAtCFnfXNV57LfaB0P3DzlFNskzEPJtNZpuBGSaG
 eADVFwiUpvoXgFoC+4nx7TM=
X-Google-Smtp-Source: ABdhPJy4icTQ1pzo6NbIIcg7WBr4yrofLfDYDPFW6JYOFruqYeTq4Lx77Hd4hmKM710lXUopB/vfuA==
X-Received: by 2002:a2e:7a16:: with SMTP id v22mr8002956ljc.101.1624455799402; 
 Wed, 23 Jun 2021 06:43:19 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v7sm329515ljn.14.2021.06.23.06.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:43:19 -0700 (PDT)
Date: Wed, 23 Jun 2021 15:43:18 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 11/15] target/cris: Add DISAS_DBRANCH
Message-ID: <20210623134318.GB3586016@toto>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
 <20210622154820.1978982-12-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622154820.1978982-12-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22, 2021 at 08:48:16AM -0700, Richard Henderson wrote:
> Move delayed branch handling to tb_stop, where we can re-use other
> end-of-tb code, e.g. the evaluation of flags.  Honor single stepping.
> Validate that we aren't losing state by overwriting is_jmp.

Hi Richard,

This patch breaks my kernel boot test:

edgar@zapote:cris-axisdev88$ ./qemu-run.sh
+ MACH=-M axis-dev88
+ QEMU_BUILD_PATH=/home/edgar/src/c/qemu/build-qemu/
+ QEMU=/home/edgar/src/c/qemu/build-qemu//cris-softmmu/qemu-system-cris
+ KERNEL=-kernel kimage
+ NIC0=-netdev user,id=net0,hostfwd=tcp::2256-10.0.2.15:21 -net nic,netdev=net0
+ /home/edgar/src/c/qemu/build-qemu//cris-softmmu/qemu-system-cris -M axis-dev88 -netdev user,id=net0,hostfwd=tcp::2256-10.0.2.15:21 -net nic,netdev=net0 -serial stdio -display none -kernel kimage
Linux version 2.6.33 (edgar@edde) (gcc version 4.3.1 20080521 (prerelease) [gcc-4_3-branch revision 135713] (GCC 4.3.1 Axis release R93/1.93) ) #4 Thu Jan 13 15:11:20 CET 2011
bootconsole [early0] enabled
ROM fs in RAM, size 6946816 bytes
Setting up paging and the MMU.
Linux/CRISv32 port on ETRAX FS (C) 2003, 2004 Axis Communications AB
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 4080
Kernel command line: root=/dev/mtdblock3 init=/linuxrc rootfstype=jffs2 mmc_core.use_spi_crc=0 mmc_spi.spi_mode=3
PID hash table entries: 128 (order: -4, 512 bytes)
Dentry cache hash table entries: 4096 (order: 1, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 0, 8192 bytes)
Memory: 22864k/32768k available (2260k kernel code, 9904k reserved, 504k data, 80k init)
Hierarchical RCU implementation.
NR_IRQS:80
Enabling watchdog...
Calibrating delay loop... qemu-system-cris: ../qemu/target/cris/translate.c:3236: cris_tr_translate_insn: Assertion `dc->base.is_jmp == DISAS_NEXT || dc->cpustate_changed' failed.
Aborted (core dumped)


I can share the image if you like.

Best regards,
Edgar


> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c | 96 ++++++++++++++++++++++++-----------------
>  1 file changed, 56 insertions(+), 40 deletions(-)
> 
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index c9822eae4c..f58f6f2e5e 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -61,6 +61,8 @@
>  #define DISAS_UPDATE        DISAS_TARGET_1
>  /* Cpu state was modified dynamically, excluding pc -- use npc */
>  #define DISAS_UPDATE_NEXT   DISAS_TARGET_2
> +/* PC update for delayed branch, see cpustate_changed otherwise */
> +#define DISAS_DBRANCH       DISAS_TARGET_3
>  
>  /* Used by the decoder.  */
>  #define EXTRACT_FIELD(src, start, end) \
> @@ -3228,50 +3230,22 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>      dc->cpustate_changed |= dc->flags_x != (dc->base.tb->flags & X_FLAG);
>  
>      /*
> -     * Check for delayed branches here.  If we do it before
> -     * actually generating any host code, the simulator will just
> -     * loop doing nothing for on this program location.
> +     * All branches are delayed branches, handled immediately below.
> +     * We don't expect to see odd combinations of exit conditions.
>       */
> +    assert(dc->base.is_jmp == DISAS_NEXT || dc->cpustate_changed);
> +
>      if (dc->delayed_branch && --dc->delayed_branch == 0) {
> -        if (dc->base.tb->flags & 7) {
> -            t_gen_movi_env_TN(dslot, 0);
> -        }
> +        dc->base.is_jmp = DISAS_DBRANCH;
> +        return;
> +    }
>  
> -        if (dc->cpustate_changed) {
> -            cris_store_direct_jmp(dc);
> -        }
> -
> -        if (dc->clear_locked_irq) {
> -            dc->clear_locked_irq = 0;
> -            t_gen_movi_env_TN(locked_irq, 0);
> -        }
> -
> -        if (dc->jmp == JMP_DIRECT_CC) {
> -            TCGLabel *l1 = gen_new_label();
> -            cris_evaluate_flags(dc);
> -
> -            /* Conditional jmp.  */
> -            tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, l1);
> -            gen_goto_tb(dc, 1, dc->jmp_pc);
> -            gen_set_label(l1);
> -            gen_goto_tb(dc, 0, dc->pc);
> -            dc->base.is_jmp = DISAS_NORETURN;
> -            dc->jmp = JMP_NOJMP;
> -        } else if (dc->jmp == JMP_DIRECT) {
> -            cris_evaluate_flags(dc);
> -            gen_goto_tb(dc, 0, dc->jmp_pc);
> -            dc->base.is_jmp = DISAS_NORETURN;
> -            dc->jmp = JMP_NOJMP;
> -        } else {
> -            TCGv c = tcg_const_tl(dc->pc);
> -            t_gen_cc_jmp(env_btarget, c);
> -            tcg_temp_free(c);
> -            dc->base.is_jmp = DISAS_JUMP;
> -        }
> +    if (dc->base.is_jmp != DISAS_NEXT) {
> +        return;
>      }
>  
>      /* Force an update if the per-tb cpu state has changed.  */
> -    if (dc->base.is_jmp == DISAS_NEXT && dc->cpustate_changed) {
> +    if (dc->cpustate_changed) {
>          dc->base.is_jmp = DISAS_UPDATE_NEXT;
>          return;
>      }
> @@ -3281,8 +3255,7 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>       * If we can detect the length of the next insn easily, we should.
>       * In the meantime, simply stop when we do cross.
>       */
> -    if (dc->base.is_jmp == DISAS_NEXT
> -        && ((dc->pc ^ dc->base.pc_first) & TARGET_PAGE_MASK) != 0) {
> +    if ((dc->pc ^ dc->base.pc_first) & TARGET_PAGE_MASK) {
>          dc->base.is_jmp = DISAS_TOO_MANY;
>      }
>  }
> @@ -3312,6 +3285,49 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>  
>      cris_evaluate_flags(dc);
>  
> +    /* Evaluate delayed branch destination and fold to another is_jmp case. */
> +    if (is_jmp == DISAS_DBRANCH) {
> +        if (dc->base.tb->flags & 7) {
> +            t_gen_movi_env_TN(dslot, 0);
> +        }
> +
> +        switch (dc->jmp) {
> +        case JMP_DIRECT:
> +            npc = dc->jmp_pc;
> +            is_jmp = dc->cpustate_changed ? DISAS_UPDATE_NEXT : DISAS_TOO_MANY;
> +            break;
> +
> +        case JMP_DIRECT_CC:
> +            /*
> +             * Use a conditional branch if either taken or not-taken path
> +             * can use goto_tb.  If neither can, then treat it as indirect.
> +             */
> +            if (likely(!dc->base.singlestep_enabled)
> +                && likely(!dc->cpustate_changed)
> +                && (use_goto_tb(dc, dc->jmp_pc) || use_goto_tb(dc, npc))) {
> +                TCGLabel *not_taken = gen_new_label();
> +
> +                tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, not_taken);
> +                gen_goto_tb(dc, 1, dc->jmp_pc);
> +                gen_set_label(not_taken);
> +
> +                /* not-taken case handled below. */
> +                is_jmp = DISAS_TOO_MANY;
> +                break;
> +            }
> +            tcg_gen_movi_tl(env_btarget, dc->jmp_pc);
> +            /* fall through */
> +
> +        case JMP_INDIRECT:
> +            t_gen_cc_jmp(env_btarget, tcg_constant_tl(npc));
> +            is_jmp = dc->cpustate_changed ? DISAS_UPDATE : DISAS_JUMP;
> +            break;
> +
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
> +
>      if (unlikely(dc->base.singlestep_enabled)) {
>          switch (is_jmp) {
>          case DISAS_TOO_MANY:
> -- 
> 2.25.1
> 

