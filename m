Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65FF2CAB69
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:07:57 +0100 (CET)
Received: from localhost ([::1]:35716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkB0G-0003Oa-Gc
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkAz3-0002os-VA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:06:42 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkAz1-0000eV-K6
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:06:41 -0500
Received: by mail-ot1-x344.google.com with SMTP id k3so2708831otp.12
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r+UErRzoJ6ZGNvaAOVTdlR5DC0hWGcYcMXks4/SCFXs=;
 b=N7+5deoqHGeN9P4rIMxl4DXwvsjdqQg715qGmbkxhz00VlV4XJ1aM5Atd+RQ4EER34
 yU8KASU2OGYsnM8tzvjC+vaArjj/qclu8jYYwZ1vO1q6Z1vEU0/FWURBcuroo4/Q7dr2
 ILbh41M2odLd63NXw4ECeOKZVBo17TtmVtZ5npuDN2xh34gKBNaF+PWmj/U/W1OE48xB
 z85ABzL1azpSeoJdJQkKbD9sRc3qo/qncvdWF9wrhB1KLEgODvYAR7Of5+0t/uFooQal
 vmeUDYVEGqV/irNGFYNraSqQtFJQWM7jpFctJkUFi8HKzN+uAqrtWbFwrk6nSmKtCRR/
 0Cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r+UErRzoJ6ZGNvaAOVTdlR5DC0hWGcYcMXks4/SCFXs=;
 b=Omi+cBlb2HScM01eJLFx3UOtctrZRKACOfvFfJgFzsa5KOGxCT3dx/zklerYMTpnCQ
 R+juUReAu5OCiHix2gPs5qNylbtiXpymokP9QZ4k44c1OPsMsRqi/eqCsziBFKytYyfx
 mGO/W9gYGsHheZ+2hoDMBvyUlunlvU/XuCko9YadehwbNLxP+EKIjysP+YcwlQ5Patnl
 PsiQIhZG3NG96xueIxpsDofvHzy2/oKjh2s9V19IR8AtqpweRbaxsqYvA30ikrDnn/++
 tU2/26kHDfeMxajLCxgoY4ZCycYkqozWwyLbx7KhiTpR2dmhFzP6h7JtLOvNLEBjwunw
 nMEw==
X-Gm-Message-State: AOAM533wLegfowbDTcpfUQPZNyTZy6Fo6llyj74g3S5LIefLcJrITGc2
 NYashsWQDT/zvdPH1JsY24Y88Q==
X-Google-Smtp-Source: ABdhPJwX467oACWom5xXYXyWrYjyRVSEj8zp2p/vfuZT1QrGeYPsZWlhVZuYeDmSh8vSwURB3UHxNQ==
X-Received: by 2002:a9d:69d2:: with SMTP id v18mr3097697oto.165.1606849597657; 
 Tue, 01 Dec 2020 11:06:37 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id s28sm155446otd.2.2020.12.01.11.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 11:06:36 -0800 (PST)
Subject: Re: [PATCH 01/15] arc: Add initial core cpu files
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-2-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30837fbb-0328-c2e8-7832-a6c62c0eb5d1@linaro.org>
Date: Tue, 1 Dec 2020 13:06:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111161758.9636-2-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 10:17 AM, cupertinomiranda@gmail.com wrote:
> +enum arc_cpu_family {
> +  ARC_OPCODE_NONE    = 0,
> +  ARC_OPCODE_DEFAULT = 1 << 0,
> +  ARC_OPCODE_ARC600  = 1 << 1,
> +  ARC_OPCODE_ARC700  = 1 << 2,
> +  ARC_OPCODE_ARCv2EM = 1 << 3,
> +  ARC_OPCODE_ARCv2HS = 1 << 4
> +};

Indentation is off.

> +/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
> +/* vim: set ts=4 sw=4 et: */

This ought to be covered by the top-level .editorconfig.

> +static void arc_cpu_set_pc(CPUState *cs, vaddr value)
> +{
> +  ARCCPU *cpu = ARC_CPU(cs);
> +
> +  CPU_PCL(&cpu->env) = value & 0xfffffffc;
> +  cpu->env.pc = value;
> +}

Indentation is off all through cpu.c.

> +#ifndef CPU_ARC_H
> +#define CPU_ARC_H
> +
> +#include "cpu-qom.h"
> +#include "exec/cpu-defs.h"
> +#include "fpu/softfloat.h"

You probably only need softfloat-types.h in cpu.h.

> +#define MMU_IDX       0

What's this?

> +#define PHYS_BASE_RAM 0x00000000
> +#define VIRT_BASE_RAM 0x00000000

This seems like board stuff, not cpu stuff.

> +enum gdb_regs {
> +    GDB_REG_0 = 0,
> +    GDB_REG_1,
> +    GDB_REG_2,
> +    GDB_REG_3,
> +    GDB_REG_4,
> +    GDB_REG_5,
> +    GDB_REG_6,
> +    GDB_REG_7,
> +    GDB_REG_8,
> +    GDB_REG_9,
> +    GDB_REG_10,
> +    GDB_REG_11,
> +    GDB_REG_12,
> +    GDB_REG_13,
> +    GDB_REG_14,
> +    GDB_REG_15,
> +    GDB_REG_16,
> +    GDB_REG_17,
> +    GDB_REG_18,
> +    GDB_REG_19,
> +    GDB_REG_20,
> +    GDB_REG_21,
> +    GDB_REG_22,
> +    GDB_REG_23,
> +    GDB_REG_24,
> +    GDB_REG_25,
> +    GDB_REG_26,         /* GP                         */
> +    GDB_REG_27,         /* FP                         */
> +    GDB_REG_28,         /* SP                         */
> +    GDB_REG_29,         /* ILINK                      */
> +    GDB_REG_30,         /* R30                        */
> +    GDB_REG_31,         /* BLINK                      */
> +    GDB_REG_58,         /* little_endian? ACCL : ACCH */
> +    GDB_REG_59,         /* little_endian? ACCH : ACCL */
> +    GDB_REG_60,         /* LP                         */
> +    GDB_REG_63,         /* Immediate                  */
> +    GDB_REG_LAST
> +};

Why is this in cpu.h and not gdbstub.c?

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

Does it make more sense to define these in terms of numbers than lvalue macros?

> +typedef struct status_register {
> +    uint32_t Hf;     /* halt                    */
> +    uint32_t Ef;     /* irq priority treshold. */
> +    uint32_t AEf;
> +    uint32_t DEf;
> +    uint32_t Uf;
> +    uint32_t Vf;     /*  overflow                */
> +    uint32_t Cf;     /*  carry                   */
> +    uint32_t Nf;     /*  negative                */
> +    uint32_t Zf;     /*  zero                    */
> +    uint32_t Lf;
> +    uint32_t DZf;
> +    uint32_t SCf;
> +    uint32_t ESf;
> +    uint32_t RBf;
> +    uint32_t ADf;
> +    uint32_t USf;
> +    uint32_t IEf;
> +
> +    /* Reserved bits */
> +
> +    /* Next instruction is a delayslot instruction */
> +    uint32_t is_delay_slot_instruction;
> +} status_t;

"status_t" is much too general a name, and is not unlikely to conflict with
something from somewhere else.

Why are you exploding all of the bits of status anyway?  I would think that
only VCNZ should be handled specially, and only for the current context.

You should be using CamelCase as per CODING_STYLE, and probably using a prefix
of Arc or ARC for *everything*.

> +
> +/* ARC processor timer module. */
> +typedef struct {
> +    /*
> +     * TODO: This volatile is needed to pass RTC tests. We need to
> +     * verify why.
> +     */
> +    volatile uint32_t T_Cntrl;
> +    volatile uint32_t T_Limit;
> +    volatile uint64_t last_clk;

That is a serious bug, probably incorrect usage of locks.

> +typedef struct CPUARCState {
> +    uint32_t        r[64];
> +
> +    status_t stat, stat_l1, stat_er;



> +
> +    struct {
> +        uint32_t    S2;
> +        uint32_t    S1;
> +        uint32_t    CS;
> +    } macmod;
> +
> +    uint32_t intvec;
> +
> +    uint32_t eret;
> +    uint32_t erbta;
> +    uint32_t ecr;
> +    uint32_t efa;
> +    uint32_t bta;
> +    uint32_t bta_l1;
> +    uint32_t bta_l2;
> +
> +    uint32_t pc;     /*  program counter         */

Why is this here?  Surely it's redundant with r[63].

> +    struct {
> +        uint32_t LD;     /*  load pending bit        */
> +        uint32_t SH;     /*  self halt               */
> +        uint32_t BH;     /*  breakpoint halt         */
> +        uint32_t UB;     /*  user mode break enabled */
> +        uint32_t ZZ;     /*  sleep mode              */
> +        uint32_t RA;     /*  reset applied           */
> +        uint32_t IS;     /*  single instruction step */
> +        uint32_t FH;     /*  force halt              */
> +        uint32_t SS;     /*  single step             */
> +    } debug;

Why are these bits expanded to words?

> +    /* used for propagatinng "hostpc/return address" to sub-functions */
> +    uintptr_t host_pc;

This is a bad idea, IMO.

> +    /* Fields after this point are preserved across CPU reset. */
> +    uint64_t features;
> +    uint32_t family;

Usually such fields belong in ArchCPU (ArcCPU) and not CPUArchState.

> +  /* ARC Configuration Settings. */
> +  struct {
> +    uint32_t addr_size;
> +    bool     aps_feature;
> +    bool     byte_order;
> +    bool     bitscan_option;
> +    uint32_t br_bc_entries;

Please sort the fields by size/alignment.  This ordering is wasteful.

> +/* are we in user mode? */
> +static inline bool is_user_mode(const CPUARCState *env)
> +{
> +    return env->stat.Uf != false;
> +}

Well, ignoring for the moment that stat should not be expanded to words, this
is a silly way to return a bool.  Better as just

    return env->stat.Uf.

> +static inline int arc_feature(const CPUARCState *env, int feature)

Return bool.

> +static inline void  arc_set_feature(CPUARCState *env, int feature)

extra space.

> +static inline int cpu_mmu_index(const CPUARCState *env, bool ifetch)
> +{
> +    return env->stat.Uf != 0 ? 1 : 0;
> +}

That's a silly way to write Uf != 0.

> +    *pc = env->pc;
> +    *cs_base = 0;
> +#ifdef CONFIG_USER_ONLY
> +    *pflags = TB_FLAGS_FP_ENABLE;
> +#else
> +    *pflags = cpu_mmu_index(env, 0);
> +#endif

Why does !CONFIG_USER_ONLY never set TB_FLAGS_FP_ENABLE?

> +static inline int cpu_interrupts_enabled(const CPUARCState *env)
> +{
> +    return env->stat.IEf;
> +}

This is not used.  Copy and paste from some other target?

> +/* these are the helper functions used both by translation and gdbstub */
> +target_ulong helper_lr(CPUARCState *env, uint32_t aux);
> +void helper_sr(CPUARCState *env, uint32_t val, uint32_t aux);

Don't declare these twice, just include "exec/helper-proto.h" in gdbstub.c.


r~

