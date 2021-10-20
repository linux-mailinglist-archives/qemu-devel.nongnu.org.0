Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D75443441A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 06:21:09 +0200 (CEST)
Received: from localhost ([::1]:46660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md36C-0001ky-Dw
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 00:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md34j-0000rr-UU
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:19:37 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md34h-00017J-Pc
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:19:37 -0400
Received: by mail-pl1-x634.google.com with SMTP id y1so15202251plk.10
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 21:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fUYnKk3CRpI8oR0DSytt47s8BP/uliF0CG7c1l6fatU=;
 b=e7N7+JZ81IHIo8oyC+r1Fti0wOfMNHPeypo7JO3Gr7wU90HvpAVsn4LeTu8+0/dKbz
 fYN81QDX/VGeX3TMFAoO0eqJPev/IymP923RIcWW+Ll6xDyQ5zTMx1aYIN3BYw6/c89G
 wnYDedDQ8uHmJ2iy6WbzpTvBF44vnzGpIMriDQOhW1r8LsdRgYPFNh3druqqbdhbkp0T
 suPD0jDIkZnQH6GYFJ9vLO7r5iLRv9HSclwNiwmdRWULAFUoAFMwYB3OlA9oYKVHeYSM
 08pNdIXlpyyJ96930e3IMdsJB6y4HoAfoB579E59Ao7zqHd2hrvK2WYVSXDw9bAST4lj
 T05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fUYnKk3CRpI8oR0DSytt47s8BP/uliF0CG7c1l6fatU=;
 b=drszfF23t6qF2hL5hEdY3sNxRLJ5hclIBda1mhHKXwu851xcfRmdDf/M6JKeUvXOBl
 HIc7UjGfHad9Bavv6u42WalM29dKZEOmE9dz7v81zREQfbI+AnNpRA9jiRkOdwposr+W
 7xjHHbCPEmSK/2xmQrEBEjdgZUjJ06sLEDMIVfOVctm9wadrgFIol+45Yhe+mqTtUziX
 s5rekng2pPbArpz+Mxyq5kvDrbhwKASziUQLHS9C5uBDRsGUU+aXIFWWYGKuXyc0WlnN
 VH+XFwQ10TDU3TzztPwjzHx4Za/2nBLVQHO3OCexYPzx88gHtMWhNVZzM5pOXnlMbrxh
 zyfg==
X-Gm-Message-State: AOAM533oRTR9AX8PFYgr15ct1JNvuB3NDeHnmoZMk7OSgvCsHlTjYEjG
 n8B4Axy68smVyLDGN+eR+1Rucg==
X-Google-Smtp-Source: ABdhPJwmSxJjUsNx3jUXek9TtCjQk5sStGrkTFWpSw1umVOOyAjwrAGjzOiM6op+amJsp3maQfGgGw==
X-Received: by 2002:a17:903:228d:b0:13f:45d4:fa8b with SMTP id
 b13-20020a170903228d00b0013f45d4fa8bmr36493852plh.21.1634703574042; 
 Tue, 19 Oct 2021 21:19:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id nl18sm674914pjb.3.2021.10.19.21.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 21:19:33 -0700 (PDT)
Subject: Re: [PATCH 08/31] target/loongarch: Add tlb instruction support
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-9-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2b3f726-aa78-3be8-d85f-18f3bf98e7a3@linaro.org>
Date: Tue, 19 Oct 2021 21:19:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-9-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
> This includes:
> - TLBSRCH
> - TLBRD
> - TLBWR
> - TLBFILL
> - TLBCLR
> - TLBFLUSH
> - INVTLB
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c                   |  19 +
>   target/loongarch/helper.h                |   8 +
>   target/loongarch/insn_trans/trans_core.c |  54 +++
>   target/loongarch/insns.decode            |  14 +
>   target/loongarch/internals.h             |  18 +
>   target/loongarch/tlb_helper.c            | 468 +++++++++++++++++++++++
>   6 files changed, 581 insertions(+)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index f145afb603..afd186abac 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -118,6 +118,7 @@ static void set_loongarch_cpucfg(CPULoongArchState *env)
>   static void set_loongarch_csr(CPULoongArchState *env)
>   {
>       uint64_t t;
> +    CPUState *cs = env_cpu(env);
>   
>       t = FIELD_DP64(0, CSR_PRCFG1, SAVE_NUM, 8);
>       t = FIELD_DP64(t, CSR_PRCFG1, TIMER_BITS, 0x2f);
> @@ -145,6 +146,9 @@ static void set_loongarch_csr(CPULoongArchState *env)
>       env->CSR_RVACFG = 0x0;
>       env->CSR_ASID = 0xa0000;
>       env->CSR_ERA = env->pc;
> +    env->CSR_CPUID = (cs->cpu_index & 0x1ff);

Any reason to have a copy of cpu_index, as opposed to just using that field?  CSR_CPUID is 
read-only after all.

> +    env->CSR_EENTRY |= (uint64_t)0x80000000;
> +    env->CSR_TLBRENTRY |= (uint64_t)0x80000000;

Are there really a defined reset values?  The documentation doesn't say.  It would appear 
that the kernel must set these before enabling interrupts or turning on paging.

> +#ifndef CONFIG_USER_ONLY
> +    qemu_fprintf(f, "EUEN            0x%lx\n", env->CSR_EUEN);
> +    qemu_fprintf(f, "ESTAT           0x%lx\n", env->CSR_ESTAT);
> +    qemu_fprintf(f, "ERA             0x%lx\n", env->CSR_ERA);
> +    qemu_fprintf(f, "CRMD            0x%lx\n", env->CSR_CRMD);
> +    qemu_fprintf(f, "PRMD            0x%lx\n", env->CSR_PRMD);
> +    qemu_fprintf(f, "BadVAddr        0x%lx\n", env->CSR_BADV);
> +    qemu_fprintf(f, "TLB refill ERA  0x%lx\n", env->CSR_TLBRERA);
> +    qemu_fprintf(f, "TLB refill BadV 0x%lx\n", env->CSR_TLBRBADV);
> +    qemu_fprintf(f, "EENTRY            0x%lx\n", env->CSR_EENTRY);
> +    qemu_fprintf(f, "BadInstr        0x%lx\n", env->CSR_BADI);
> +    qemu_fprintf(f, "PRCFG1    0x%lx\nPRCFG2     0x%lx\nPRCFG3     0x%lx\n",
> +                 env->CSR_PRCFG1, env->CSR_PRCFG3, env->CSR_PRCFG3);
> +#endif

This probably belongs to a different patch?

> @@ -165,4 +172,51 @@ static bool trans_iocsrwr_d(DisasContext *ctx, arg_iocsrwr_d *a)
>       gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(oi));
>       return true;
>   }
> +
> +static bool trans_tlbsrch(DisasContext *ctx, arg_tlbsrch *a)
> +{
> +    gen_helper_tlbsrch(cpu_env);
> +    return true;
> +}

Missing priv check, all functions.

> +static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
> +{
> +    TCGv addr = gpr_src(ctx, a->addr, EXT_NONE);
> +    TCGv info = gpr_src(ctx, a->info, EXT_NONE);
> +    TCGv op = tcg_constant_tl(a->invop);
> +
> +    gen_helper_invtlb(cpu_env, addr, info, op);
> +    return true;
> +}

Decode op here -- there are only 7 defined opcodes.

Note that you'll need to end the TB after most TLB instructions, since the translation of 
PC could change between one insn and the next.


> +&fmt_invtlb         addr info invop
> +@fmt_invtlb          ...... ...... ..... ..... ..... .....    &fmt_invtlb         %addr %info %invop

Why are you using the names addr and info instead of rk and rj?

> diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
> index 1251e7f21c..916c675680 100644
> --- a/target/loongarch/internals.h
> +++ b/target/loongarch/internals.h
> @@ -76,6 +76,14 @@ struct CPULoongArchTLBContext {
>       int (*map_address)(struct CPULoongArchState *env, hwaddr *physical,
>                          int *prot, target_ulong address,
>                          MMUAccessType access_type);
> +    void (*helper_tlbwr)(struct CPULoongArchState *env);
> +    void (*helper_tlbfill)(struct CPULoongArchState *env);
> +    void (*helper_tlbsrch)(struct CPULoongArchState *env);
> +    void (*helper_tlbrd)(struct CPULoongArchState *env);
> +    void (*helper_tlbclr)(struct CPULoongArchState *env);
> +    void (*helper_tlbflush)(struct CPULoongArchState *env);
> +    void (*helper_invtlb)(struct CPULoongArchState *env, target_ulong addr,
> +                          target_ulong info, int op);

Again, function pointers are premature.

> +static uint64_t ls3a5k_pagesize_to_mask(int pagesize)
> +{
> +    /* 4KB - 1GB */
> +    if (pagesize < 12 && pagesize > 30) {
> +        qemu_log_mask(CPU_LOG_MMU, "unsupported page size %d\n", pagesize);
> +        exit(-1);

Do not call exit.  Make up something sensible that won't crash qemu.

> +/* return random value in [low, high] */
> +static uint32_t cpu_loongarch_get_random_ls3a5k_tlb(uint32_t low, uint32_t high)
> +{
> +    static uint32_t seed = 5;
> +    static uint32_t prev_idx;

No static variables like this, as they cannot be migrated, and are a race condition 
between multiple cpus.  That said...

> +    uint32_t idx;
> +    uint32_t nb_rand_tlb = high - low + 1;
> +
> +    do {
> +        seed = 1103515245 * seed + 12345;
> +        idx = (seed >> 16) % nb_rand_tlb + low;
> +    } while (idx == prev_idx);

... we have defined interfaces for getting random numbers.


r~

