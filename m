Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E759D356074
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 02:48:53 +0200 (CEST)
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTwNI-00025r-IG
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 20:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTwLz-0001PZ-Qd
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 20:47:31 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTwLx-0003U8-SE
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 20:47:31 -0400
Received: by mail-pl1-x62c.google.com with SMTP id ay2so8469334plb.3
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 17:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6GP4A6CS6rduBLbEHxveqUx9q0razU3Sl2h9NupMPh0=;
 b=L2vkXYPSpcfaoscLNwSVYz8r5JROHAuuHViMQc/bKmIzCVUG0SvTZueL5q0PW2GvNM
 iWwLiRCY0K98wANOxMD8LJiIO9n2ChIEQIwa9YpljnsL3kfE6nPy5i+1vIBQhdvp9z5O
 4WqgH8gLiRq5vXmVAgmwrIHaH0qtJmAOBRwVyoyLY1U2OgEWDKalMYyYGNsAnAMWkCl7
 5rAzAQ7qzdAY1ijxY0mJPYgqbGLUdAGSs33tPsuypa/ttYWCTu/RBPVaHwQx/fUbtXZ0
 2mYOAGFL1P/0Pls1pBDyv9dOTDmAu1KDmQv+pDB+RPNIo4mh4Yt4nfou+DQQQAJniQVT
 T77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6GP4A6CS6rduBLbEHxveqUx9q0razU3Sl2h9NupMPh0=;
 b=sKBqkJjXb+D7eVcf4VNucO7DUF/ashbQ3Uq6NDPGpkHZPNT5xfMdcm9xutadfFdhoN
 t5xzrvDrKAryitHaCWjVNISKQIhp/7+Y6jST+R0CuUgGqLhjO7XQqoMr+VlG4b4nZPfQ
 qm6lR9Q5iTqkv7loRT6XPHBTaJvaKLQPHS9BLhDvC4CHbaHcPBnr0wlJLzDWKZWyIoOp
 3Hnsj0HuLVa8Npgiox2WRjjfIhuk3rsGrWBzeOt0IIfCrTIVsLGPK9pt94egkPExORxA
 YSpt93yY130btSVW/wFR2ze80Gmf6MWlH+nUX2v28GyMvHpXM8dn/ywmdf7ifGTUBcXp
 kSaA==
X-Gm-Message-State: AOAM531p435EPHFb7ivwFbW/X/m93C0UgWwN8qLB4s2oxawSxdFzBDZc
 eP9trSy3XrHpz/DjjhZTecXagA==
X-Google-Smtp-Source: ABdhPJzIqsBh7bm9Tg7WxplVkNoRx5v+NOGxBcdpdpgGu5n/T7y2dtldL4wRFrxeXOoErGTn9wMd9w==
X-Received: by 2002:a17:902:c613:b029:e9:5291:2cff with SMTP id
 r19-20020a170902c613b02900e952912cffmr755989plr.43.1617756448223; 
 Tue, 06 Apr 2021 17:47:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t16sm53965pfc.94.2021.04.06.17.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 17:47:27 -0700 (PDT)
Subject: Re: [PATCH 01/27] arc: Add initial core cpu files
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-2-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e94289ec-924e-1c3b-f4f2-a267f14e4510@linaro.org>
Date: Tue, 6 Apr 2021 17:47:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-2-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> +    DEFINE_PROP_BOOL("byte-order", ARCCPU, cfg.byte_order, false),

"byte-order" makes no sense as a bool.
"little-endian" or "big-endian" would.

> +    info->endian = BFD_ENDIAN_LITTLE;

Not using the setting?

> +/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
> +/* vim: set ts=4 sw=4 et: */

Should be redundant with .editorconfig.

> +#define CPU_GP(env)     ((env)->r[26])
> +#define CPU_FP(env)     ((env)->r[27])
> +#define CPU_SP(env)     ((env)->r[28])
> +#define CPU_ILINK(env)  ((env)->r[29])
> +#define CPU_ILINK1(env) ((env)->r[29])
> +#define CPU_ILINK2(env) ((env)->r[30])
> +#define CPU_BLINK(env)  ((env)->r[31])
> +#define CPU_LP(env)     ((env)->r[60])
> +#define CPU_IMM(env)    ((env)->r[62])
> +#define CPU_PCL(env)    ((env)->r[63])

Surely this is better as a enum of regnos?

I'm not especially keen on lvalue macros like this, especially when you can't 
reuse the enum for e.g. the tcg globals.

> +/* Flags in pstate */
> +#define Hf_b  (0)
> +#define AEf_b (5)
> +#define Uf_b  (7)
> +#define Lf_b  (12)
> +#define DZf_b (13)
> +#define SCf_b (14)
> +#define ESf_b (15)
> +#define ADf_b (19)
> +#define USf_b (20)
> +
> +/* Flags with their on fields */
> +#define IEf_b   (31)
> +#define IEf_bS  (1)
> +
> +#define Ef_b    (1)
> +#define Ef_bS   (4)
> +
> +#define DEf_b   (6)
> +#define DEf_bS  (1)
> +
> +#define Vf_b    (8)
> +#define Vf_bS   (1)
> +#define Cf_b    (9)
> +#define Cf_bS   (1)
> +#define Nf_b    (10)
> +#define Nf_bS   (1)
> +#define Zf_b    (11)
> +#define Zf_bS   (1)
> +
> +#define RBf_b   (16)
> +#define RBf_bS  (3)

We have include/hw/registerfields.h that's a bit better at defining, 
extracting, and setting fields.

> +#define SET_STATUS_BIT(STAT, BIT, VALUE) { \
> +    STAT.pstate &= ~(1 << BIT##_b); \
> +    STAT.pstate |= (VALUE << BIT##_b); \
> +}

do {
     (STAT).pstate = deposit32((STAT).pstate, BIT, 1, VALUE);
} while (0)

> +typedef struct {
> +    target_ulong pstate;
> +
> +    target_ulong RBf;
> +    target_ulong Ef;     /* irq priority treshold. */
> +    target_ulong Vf;     /*  overflow                */
> +    target_ulong Cf;     /*  carry                   */
> +    target_ulong Nf;     /*  negative                */
> +    target_ulong Zf;     /*  zero                    */
> +    target_ulong DEf;
> +    target_ulong IEf;

I understand why the 4 arithmetic flags are split out, but why are the others? 
  Surely they are not nearly so performance sensitive.

> +/* ARC PIC interrupt bancked regs. */
> +typedef struct {
> +    target_ulong priority;
> +    target_ulong trigger;
> +    target_ulong pulse_cancel;
> +    target_ulong enable;
> +    target_ulong pending;
> +    target_ulong status;
> +} ARCIrq;

This is cpu.h.  The PIC is not the cpu, so this should be elsewhere.

> +typedef struct CPUARCState {
> +    target_ulong        r[64];
> +
> +    ARCStatus stat, stat_l1, stat_er;
> +
> +    struct {
> +        target_ulong    S2;
> +        target_ulong    S1;
> +        target_ulong    CS;
> +    } macmod;
> +
> +    target_ulong intvec;
> +
> +    target_ulong eret;
> +    target_ulong erbta;
> +    target_ulong ecr;
> +    target_ulong efa;
> +    target_ulong bta;
> +    target_ulong bta_l1;
> +    target_ulong bta_l2;
> +
> +    target_ulong pc;     /*  program counter         */

What is this and why is it different from PCL, aka r[63]?

> +    /* used for propagatinng "hostpc/return address" to sub-functions */
> +    uintptr_t host_pc;

Not a fan.  Subfunctions should have the retaddr passed down directly, so that 
it's obvious that the value is not stale.

> +static inline int cpu_mmu_index(const CPUARCState *env, bool ifetch)
> +{
> +    return GET_STATUS_BIT(env->stat, Uf) != 0 ? 1 : 0;
> +}

A very complicated way to just return GET_STATUS_BIT.
Or even GET_STATUS_BIT != 0, come to that.

> +
> +static inline void cpu_get_tb_cpu_state(CPUARCState *env, target_ulong *pc,
> +                                        target_ulong *cs_base,
> +                                        uint32_t *pflags)
> +{
> +    *pc = env->pc;
> +    *cs_base = 0;
> +#ifdef CONFIG_USER_ONLY
> +    assert(0); /* Not really supported at the moment. */

g_assert_not_reached() is our canonical "can't get here".
Though #error would be better in this instance.


r~

