Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7C95B55A6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 10:00:35 +0200 (CEST)
Received: from localhost ([::1]:50560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXeMs-0006WS-3J
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 04:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXeKc-00053X-FN
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 03:58:14 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXeKa-0002hh-Co
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 03:58:14 -0400
Received: by mail-pl1-x631.google.com with SMTP id c2so7827510plo.3
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 00:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=D0AVriCgjsIW8lFazBOSKB+/mKNPggRZ0l5tfNJA0T4=;
 b=iy7GCwq0MEOOxsMcQzBK1/QFCE2MwCyjyf4IwILTT9fcOiNJR7Y3cAR+2syEcS24iL
 gzFW3w3FRyghEHSGXB6s/VFgQ00nNzsXOFVyls7VBoQ8EdMuCYIMQUpRvtFCtCRUocxL
 xddZiiaq/8zxXJ5MTkOwSQ/kNoiy3GTB2lB43/Hu+qfKk3yO87q9EOoVeE8Ea5zJHME9
 jrotchbxa6GpCZwVNibktpXG1i7WVFg+4zRUM53kbzBQsSYHpMGfJiGvgx1YzWSAPreZ
 5TWw/nRk1R8raZzmeox5YaJ38BF6w9oMxitaKcMaas/Fov66HTeWG5PA5nXGpOYKv6iO
 kl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=D0AVriCgjsIW8lFazBOSKB+/mKNPggRZ0l5tfNJA0T4=;
 b=f6RLO7kO0aaQGgMnbbX972mXoTWDMvc1/BVA+95o+IwmSh//k8soGuRhM2o0BdiOds
 hqvpd45jyC5LCFsTf1zjt2jl+sKjC6ENTHuwDbo+0/xrVV1w8CvzRFx0sWl9rb+GvaNM
 mQIIMoqXGlumkJ630IliXROfrFekehBC/TeRjhPixEkyoTbushCzm5h5KLyEbysPOOZR
 v40y6S+CFpnCFYwS0pxIxFHNOvoR6XZwkLNGNhTAcyeNdst3Pf/x1c7zlQ+4RI+CRWA7
 hiJmqIg2yWS1QxSWNezmX3v6D6ud8dH1CQNA7U0r1jmrnrHiNRE8yO50D+M2pGhGZU2y
 fvLQ==
X-Gm-Message-State: ACgBeo02ceBBcMeDw28yz5FAcECewDeKkWPsZOUonHBMCZqdqcUSXMLP
 So1UMtorzV9f90DycIBnSGv5rA==
X-Google-Smtp-Source: AA6agR5yQBFxB2Ik/rEmXf5uH6UfQpx3WM8Y9kHEet5U9xJZgPRdGVDCklWiWHVzmphuPKakevsweA==
X-Received: by 2002:a17:902:e851:b0:178:2989:e26e with SMTP id
 t17-20020a170902e85100b001782989e26emr6331280plg.83.1662969490225; 
 Mon, 12 Sep 2022 00:58:10 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.8.181])
 by smtp.gmail.com with ESMTPSA id
 w187-20020a6282c4000000b0053e156e9475sm4649651pfd.182.2022.09.12.00.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 00:58:09 -0700 (PDT)
Message-ID: <91fe80d5-724b-6adc-ef74-60655c8a25cf@linaro.org>
Date: Mon, 12 Sep 2022 08:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] target/i386: fix cmpxchg with 32-bit register
 destination
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911222630.338330-1-pbonzini@redhat.com>
 <20220911222630.338330-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911222630.338330-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/11/22 23:26, Paolo Bonzini wrote:
> +/* Compute the result of writing t0 to the OT-sized register REG.
> + *
> + * If DEST is NULL, store the result into the register and return the
> + * register's TCGv.
> + *
> + * If DEST is not NULL, store the result into DEST and return the
> + * register's TCGv.
> + */

/*
  * Compute...

Why bother passing NULL, and fixing it up at each use...

> +static void gen_op_mov_reg_v(DisasContext *s, MemOp ot, int reg, TCGv t0)
> +{
> +    gen_op_deposit_reg_v(s, ot, reg, NULL, t0);
>   }

... when you can just as easily pass in the register here?

>   
>   static inline
> @@ -5495,26 +5514,36 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                                             s->mem_index, ot | MO_LE);
>                   gen_op_mov_reg_v(s, ot, R_EAX, oldv);
>               } else {
> +                gen_extu(ot, cmpv);
>                   if (mod == 3) {
> +                    TCGv dest;
>                       rm = (modrm & 7) | REX_B(s);
>                       gen_op_mov_v_reg(s, ot, oldv, rm);
> +                    gen_extu(ot, oldv);
> +
> +                    /*
> +                     * Unlike the memory case, where "the destination operand receives
> +                     * a write cycle without regard to the result of the comparison",
> +                     * rm must not be touched altogether if the write fails, including
> +                     * not zero-extending it on 64-bit processors.  So, precompute
> +                     * the result of a successful writeback and perform the movcond
> +                     * directly on cpu_regs.  Also need to write accumulator first, in
> +                     * case rm is part of RAX too.
> +                     */
> +                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> +                    dest = gen_op_deposit_reg_v(s, ot, rm, newv, newv);
> +                    tcg_gen_movcond_tl(TCG_COND_EQ, dest, oldv, cmpv, newv, dest);
>                   } else {
>                       gen_lea_modrm(env, s, modrm);
>                       gen_op_ld_v(s, ot, oldv, s->A0);
> -                    rm = 0; /* avoid warning */
> -                }
> -                gen_extu(ot, oldv);
> -                gen_extu(ot, cmpv);
> -                /* store value = (old == cmp ? new : old);  */
> -                tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
> -                if (mod == 3) {
> -                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> -                    gen_op_mov_reg_v(s, ot, rm, newv);
> -                } else {
> -                    /* Perform an unconditional store cycle like physical cpu;
> -                       must be before changing accumulator to ensure
> -                       idempotency if the store faults and the instruction
> -                       is restarted */
> +
> +                    /*
> +                     * Perform an unconditional store cycle like physical cpu;
> +                     * must be before changing accumulator to ensure
> +                     * idempotency if the store faults and the instruction
> +                     * is restarted
> +                     */
> +                    tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
>                       gen_op_st_v(s, ot, newv, s->A0);
>                       gen_op_mov_reg_v(s, ot, R_EAX, oldv);
>                   }

We have an outstanding bug report that suggests that the move to eax must use the deposit 
in both cases:

https://gitlab.com/qemu-project/qemu/-/issues/508


r~

