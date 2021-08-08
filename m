Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9713E391B
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:36:23 +0200 (CEST)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCbTz-00047U-14
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbSt-0003RF-0r
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:35:15 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbSr-0000CY-56
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:35:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so25932145pji.5
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x4YC3BcZirtqHojTiHlZYcS7ZLtf/gK1yNIeGLBRA54=;
 b=f2OlmKH4clxXs7x1ETpz0hVfLAYdAtPCP+m+8/mWmkcC1mnDpuXS5kweZZSoZ/T5Jy
 Z514+/vAph027EaFtxF68wemqYO9cVxTGWNCnJCsNjS4mRmfYUoDEwBtuH3fqYYMEqBH
 Dn4uaVBTPo1jcTLadcL0t2Idl6AZLvGBam4UjrQN/k0ficNeS0BkYdlc5pywf+rf7+eI
 BaW+g1wqWUOCb6jKX7Z+QAB1JzmCRgAQQv7632BKwe4H0himh0nKvw/yc1/BoI2Bj2Yx
 FhXlBof/44ESR0Kg1/b6j+0pnIvauAok4Da8gOjt8smLmE2GNxT33RqGRWsZXKFK7maI
 uLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x4YC3BcZirtqHojTiHlZYcS7ZLtf/gK1yNIeGLBRA54=;
 b=OpIQf4J8NSDWok9jCFJ15Ri120WrdqWS5rbTJHSOLn1ObzImV0hHmXl1YTHYl/ufws
 XgwjuCUYApwpdiWdHoow3StbWFF0ESxz7OzXww2A6hqEXRw+dkZL7Q8oTe+XqQjWPnoX
 5Xck+4omRryHIizE5L7uK/KMF4UGrlLeocWIbw1hAOu6Gs5tB4ku85Hqyus3mO3uq/F5
 8+zdUtROm9VqoOG7CIBMzLunxEbx9x2MOyXkD/uFYWHqWDS4EXlMt5DVuMS3xE4uf/C5
 hhtFulHWKo+N5LISrkbOhH7NU8NrjQ23PlqCdz6c8BBOPNhmS+6gEyHfzBrzUvdsCYa6
 POXQ==
X-Gm-Message-State: AOAM531URg2LJ7CnDDXpyMAZI+eS/dh5CgT1Xt9KrLfh46/DHuP/0r8h
 Dm0Wv/t1n6NGQpoD2EMQKH0XJQ==
X-Google-Smtp-Source: ABdhPJwzc5tx0mJSljrUbKffYLsZ9PkD0q/NaJ2XEv411ed9iALEsUIdLw5swCCSkncfwp1BBLeXow==
X-Received: by 2002:a62:3891:0:b029:3c7:66d2:53cf with SMTP id
 f139-20020a6238910000b02903c766d253cfmr12455029pfa.34.1628400911311; 
 Sat, 07 Aug 2021 22:35:11 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id b17sm17489653pgl.61.2021.08.07.22.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 22:35:10 -0700 (PDT)
Subject: Re: [PATCH for 6.2 22/49] bsd-user: Move per-cpu code into
 target_arch_cpu.h
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-23-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2626ce17-c4cc-01e2-b9e7-703b2f60cde6@linaro.org>
Date: Sat, 7 Aug 2021 19:35:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-23-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> diff --git a/bsd-user/i386/target_arch_cpu.c b/bsd-user/i386/target_arch_cpu.c
> index 7f2f755a11..71998e5ba5 100644
> --- a/bsd-user/i386/target_arch_cpu.c
> +++ b/bsd-user/i386/target_arch_cpu.c
> @@ -1,6 +1,7 @@
>   /*
>    *  i386 cpu related code
>    *
> + * Copyright (c) 2013 Stacey Son <sson@FreeBSD.org>
>    *
>    *  This program is free software; you can redistribute it and/or modify
>    *  it under the terms of the GNU General Public License as published by

Should be in previous.

> +static inline void target_cpu_init(CPUX86State *env,
> +        struct target_pt_regs *regs)
> +{
> +    uint64_t *gdt_table;
> +
> +    env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
> +    env->hflags |= HF_PE_MASK | HF_CPL_MASK;
> +    if (env->features[FEAT_1_EDX] & CPUID_SSE) {
> +        env->cr[4] |= CR4_OSFXSR_MASK;
> +        env->hflags |= HF_OSFXSR_MASK;
> +    }
> +
> +    /* flags setup : we activate the IRQs by default as in user mode */
> +    env->eflags |= IF_MASK;
> +
> +    /* register setup */
> +    env->regs[R_EAX] = regs->eax;
> +    env->regs[R_EBX] = regs->ebx;
> +    env->regs[R_ECX] = regs->ecx;
> +    env->regs[R_EDX] = regs->edx;
> +    env->regs[R_ESI] = regs->esi;
> +    env->regs[R_EDI] = regs->edi;
> +    env->regs[R_EBP] = regs->ebp;
> +    env->regs[R_ESP] = regs->esp;
> +    env->eip = regs->eip;
> +
> +    /* interrupt setup */
> +    env->idt.limit = 255;
> +
> +    env->idt.base = target_mmap(0, sizeof(uint64_t) * (env->idt.limit + 1),
> +        PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> +    bsd_i386_set_idt_base(env->idt.base);
> +    bsd_i386_set_idt(0, 0);
> +    bsd_i386_set_idt(1, 0);
> +    bsd_i386_set_idt(2, 0);
> +    bsd_i386_set_idt(3, 3);
> +    bsd_i386_set_idt(4, 3);
> +    bsd_i386_set_idt(5, 0);
> +    bsd_i386_set_idt(6, 0);
> +    bsd_i386_set_idt(7, 0);
> +    bsd_i386_set_idt(8, 0);
> +    bsd_i386_set_idt(9, 0);
> +    bsd_i386_set_idt(10, 0);
> +    bsd_i386_set_idt(11, 0);
> +    bsd_i386_set_idt(12, 0);
> +    bsd_i386_set_idt(13, 0);
> +    bsd_i386_set_idt(14, 0);
> +    bsd_i386_set_idt(15, 0);
> +    bsd_i386_set_idt(16, 0);
> +    bsd_i386_set_idt(17, 0);
> +    bsd_i386_set_idt(18, 0);
> +    bsd_i386_set_idt(19, 0);
> +    bsd_i386_set_idt(0x80, 3);
> +
> +    /* segment setup */
> +    env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
> +            PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> +    env->gdt.limit = sizeof(uint64_t) * TARGET_GDT_ENTRIES - 1;
> +    gdt_table = g2h_untagged(env->gdt.base);
> +
> +    bsd_i386_write_dt(&gdt_table[__USER_CS >> 3], 0, 0xfffff,
> +            DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
> +            (3 << DESC_DPL_SHIFT) | (0xa << DESC_TYPE_SHIFT));
> +
> +    bsd_i386_write_dt(&gdt_table[__USER_DS >> 3], 0, 0xfffff,
> +            DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
> +            (3 << DESC_DPL_SHIFT) | (0x2 << DESC_TYPE_SHIFT));
> +
> +    cpu_x86_load_seg(env, R_CS, __USER_CS);
> +    cpu_x86_load_seg(env, R_SS, __USER_DS);
> +    cpu_x86_load_seg(env, R_DS, __USER_DS);
> +    cpu_x86_load_seg(env, R_ES, __USER_DS);
> +    cpu_x86_load_seg(env, R_FS, __USER_DS);
> +    cpu_x86_load_seg(env, R_GS, __USER_DS);
> +    /* This hack makes Wine work... */
> +    env->segs[R_FS].selector = 0;
> +}
> +
> +static inline void target_cpu_loop(CPUX86State *env)
> +{
> +    CPUState *cs = env_cpu(env);
> +    int trapnr;
> +    abi_ulong pc;
> +    /* target_siginfo_t info; */
> +
> +    for (;;) {
> +	cpu_exec_start(cs);
> +        trapnr = cpu_exec(cs);
> +	cpu_exec_end(cs);
> +	process_queued_cpu_work(cs);
> +
> +        switch (trapnr) {
> +        case 0x80:
> +            /* syscall from int $0x80 */
> +            if (bsd_type == target_freebsd) {
> +                abi_ulong params = (abi_ulong) env->regs[R_ESP] +
> +                    sizeof(int32_t);
> +                int32_t syscall_nr = env->regs[R_EAX];
> +                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
> +
> +                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> +                    get_user_s32(syscall_nr, params);
> +                    params += sizeof(int32_t);
> +                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
> +                    get_user_s32(syscall_nr, params);
> +                    params += sizeof(int64_t);
> +                }
> +                get_user_s32(arg1, params);
> +                params += sizeof(int32_t);
> +                get_user_s32(arg2, params);
> +                params += sizeof(int32_t);
> +                get_user_s32(arg3, params);
> +                params += sizeof(int32_t);
> +                get_user_s32(arg4, params);
> +                params += sizeof(int32_t);
> +                get_user_s32(arg5, params);
> +                params += sizeof(int32_t);
> +                get_user_s32(arg6, params);
> +                params += sizeof(int32_t);
> +                get_user_s32(arg7, params);
> +                params += sizeof(int32_t);
> +                get_user_s32(arg8, params);
> +                env->regs[R_EAX] = do_freebsd_syscall(env,
> +                                                      syscall_nr,
> +                                                      arg1,
> +                                                      arg2,
> +                                                      arg3,
> +                                                      arg4,
> +                                                      arg5,
> +                                                      arg6,
> +                                                      arg7,
> +                                                      arg8);
> +            } else { /* if (bsd_type == target_openbsd) */
> +                env->regs[R_EAX] = do_openbsd_syscall(env,
> +                                                      env->regs[R_EAX],
> +                                                      env->regs[R_EBX],
> +                                                      env->regs[R_ECX],
> +                                                      env->regs[R_EDX],
> +                                                      env->regs[R_ESI],
> +                                                      env->regs[R_EDI],
> +                                                      env->regs[R_EBP]);
> +            }
> +            if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
> +                env->regs[R_EAX] = -env->regs[R_EAX];
> +                env->eflags |= CC_C;
> +            } else {
> +                env->eflags &= ~CC_C;
> +            }
> +            break;
> +
> +#if 0
> +        case EXCP0B_NOSEG:
> +        case EXCP0C_STACK:
> +            info.si_signo = TARGET_SIGBUS;
> +            info.si_errno = 0;
> +            info.si_code = TARGET_SI_KERNEL;
> +            info._sifields._sigfault._addr = 0;
> +            queue_signal(env, info.si_signo, &info);
> +            break;
> +
> +        case EXCP0D_GPF:
> +            /* XXX: potential problem if ABI32 */
> +            if (env->eflags & VM_MASK) {
> +                handle_vm86_fault(env);
> +            } else {
> +                info.si_signo = TARGET_SIGSEGV;
> +                info.si_errno = 0;
> +                info.si_code = TARGET_SI_KERNEL;
> +                info._sifields._sigfault._addr = 0;
> +                queue_signal(env, info.si_signo, &info);
> +            }
> +            break;
> +
> +        case EXCP0E_PAGE:
> +            info.si_signo = TARGET_SIGSEGV;
> +            info.si_errno = 0;
> +            if (!(env->error_code & 1)) {
> +                info.si_code = TARGET_SEGV_MAPERR;
> +            } else {
> +                info.si_code = TARGET_SEGV_ACCERR;
> +            }
> +            info._sifields._sigfault._addr = env->cr[2];
> +            queue_signal(env, info.si_signo, &info);
> +            break;
> +
> +        case EXCP00_DIVZ:
> +            if (env->eflags & VM_MASK) {
> +                handle_vm86_trap(env, trapnr);
> +            } else {
> +                /* division by zero */
> +                info.si_signo = TARGET_SIGFPE;
> +                info.si_errno = 0;
> +                info.si_code = TARGET_FPE_INTDIV;
> +                info._sifields._sigfault._addr = env->eip;
> +                queue_signal(env, info.si_signo, &info);
> +            }
> +            break;
> +
> +        case EXCP01_DB:
> +        case EXCP03_INT3:
> +            if (env->eflags & VM_MASK) {
> +                handle_vm86_trap(env, trapnr);
> +            } else {
> +                info.si_signo = TARGET_SIGTRAP;
> +                info.si_errno = 0;
> +                if (trapnr == EXCP01_DB) {
> +                    info.si_code = TARGET_TRAP_BRKPT;
> +                    info._sifields._sigfault._addr = env->eip;
> +                } else {
> +                    info.si_code = TARGET_SI_KERNEL;
> +                    info._sifields._sigfault._addr = 0;
> +                }
> +                queue_signal(env, info.si_signo, &info);
> +            }
> +            break;
> +
> +        case EXCP04_INTO:
> +        case EXCP05_BOUND:
> +            if (env->eflags & VM_MASK) {
> +                handle_vm86_trap(env, trapnr);
> +            } else {
> +                info.si_signo = TARGET_SIGSEGV;
> +                info.si_errno = 0;
> +                info.si_code = TARGET_SI_KERNEL;
> +                info._sifields._sigfault._addr = 0;
> +                queue_signal(env, info.si_signo, &info);
> +            }
> +            break;
> +
> +        case EXCP06_ILLOP:
> +            info.si_signo = TARGET_SIGILL;
> +            info.si_errno = 0;
> +            info.si_code = TARGET_ILL_ILLOPN;
> +            info._sifields._sigfault._addr = env->eip;
> +            queue_signal(env, info.si_signo, &info);
> +            break;
> +#endif
> +        case EXCP_INTERRUPT:
> +            /* just indicate that signals should be handled asap */
> +            break;
> +#if 0
> +        case EXCP_DEBUG:
> +            {
> +
> +                info.si_signo = TARGET_SIGTRAP;
> +                info.si_errno = 0;
> +                info.si_code = TARGET_TRAP_BRKPT;
> +                queue_signal(env, info.si_signo, &info);
> +            }
> +            break;
> +#endif
> +
> +        case EXCP_ATOMIC:
> +            cpu_exec_step_atomic(cs);
> +            break;
> +
> +        default:
> +            pc = env->segs[R_CS].base + env->eip;
> +            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception 0x%x - "
> +                    "aborting\n", (long)pc, trapnr);
> +            abort();
> +        }
> +        process_pending_signals(env);
> +    }
> +}

Those are some really big functions to want to inline.  Any reason for that?  At first 
glance they could live just fine in target_arch_cpu.c.

r~

