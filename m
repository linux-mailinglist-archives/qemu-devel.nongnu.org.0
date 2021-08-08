Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D963E3925
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 08:04:59 +0200 (CEST)
Received: from localhost ([::1]:44150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCbve-0002PM-FP
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 02:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mCbua-0001ji-Qh
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 02:03:52 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:34519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mCbuX-0007dS-Ia
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 02:03:52 -0400
Received: by mail-qt1-x82d.google.com with SMTP id e15so7248416qtx.1
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8+Eh86D6RGz//IEZh1ZdBfe+/pmdblvgBIzQtDTsOE=;
 b=YrA6tlBKktpNYffasttTMdy79OYTLj5IhKLYPrUdB8VpImDaJR1mphdtwAB2nG/9eK
 nvwTinN9r7kg6fMiY2NFnztKqqAkMvhtYm7qhMDPfjUz6jH9dl3KW/3mVjR6bV6q63AB
 1LPwRKdqGwGz5oDCB4l4i0JQsV3j/SxJmm2jD3/aMQecKGke9zsYzuWHsd4QqcwIKbrj
 ZIcSmrHFqAfwUM0dLDZU6D1m6pbBNSX4fNzEpyDeTIt1IJDQ6yakvLMTaUO+vTkstngL
 z6Plioj2X/GUX6q8pauoTDjgZFXDO7TEpODx4s6jGgWFB9UDCBMeT4fdw+qP+X1m20NA
 O2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8+Eh86D6RGz//IEZh1ZdBfe+/pmdblvgBIzQtDTsOE=;
 b=lpldJex5jbb9sWRsQbW9cgEUChvMtTr94dypaE16jbytQizEsMxzZ9+L9hRMlb5qXf
 jm+Is0Oxx8kUJYV97qeWx5gneWoYgi64XMI+J9u6ck0paMaaQDE2NHkWjOx4MjLkwESn
 XQghysL5cKMBD5LtHpVQn5vzzqXZKDlPcnGn+w7n2G/hYgOU0Mj7wEO8jqjCP9goIAMc
 ttVUoMwUBELHdE4GPz6+ASv1Cd9Uook5ePmtOV8afkyDtymmfS1PEYiU2t1veIxJyhyH
 Sw44CoG/qDqTUwJiQ1S6ujiAwrC4kzbcsn3CzS5ukkgikyc14FzStQgs48+Ex+7dsC6I
 7rWA==
X-Gm-Message-State: AOAM533xfqFczZGaAkNwc+60Y85NT1DVZ2niI/+XFa+byRO9fONreJvY
 CQq1cAVtz1Fc2UXz7hu9wHVF74tfFApbXFHCEaYmaQ==
X-Google-Smtp-Source: ABdhPJy7E0wtaYBDz/QZN1ZOnYQBX8vWJywpdElRYPZKSTyb0lSBkDEJMxqr5xyq8l0USyl6nv8tS1GMceOjpmUFS9w=
X-Received: by 2002:ac8:4c8b:: with SMTP id j11mr7265374qtv.244.1628402627280; 
 Sat, 07 Aug 2021 23:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-23-imp@bsdimp.com>
 <2626ce17-c4cc-01e2-b9e7-703b2f60cde6@linaro.org>
In-Reply-To: <2626ce17-c4cc-01e2-b9e7-703b2f60cde6@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 8 Aug 2021 00:03:37 -0600
Message-ID: <CANCZdfpcLOKRr5-YDOjNJbJLUJmBCFq8Cxpi4tkEasxOnrLZcA@mail.gmail.com>
Subject: Re: [PATCH for 6.2 22/49] bsd-user: Move per-cpu code into
 target_arch_cpu.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000026941005c90608f0"
Received-SPF: none client-ip=2607:f8b0:4864:20::82d;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000026941005c90608f0
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 7, 2021 at 11:35 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > diff --git a/bsd-user/i386/target_arch_cpu.c
> b/bsd-user/i386/target_arch_cpu.c
> > index 7f2f755a11..71998e5ba5 100644
> > --- a/bsd-user/i386/target_arch_cpu.c
> > +++ b/bsd-user/i386/target_arch_cpu.c
> > @@ -1,6 +1,7 @@
> >   /*
> >    *  i386 cpu related code
> >    *
> > + * Copyright (c) 2013 Stacey Son <sson@FreeBSD.org>
> >    *
> >    *  This program is free software; you can redistribute it and/or
> modify
> >    *  it under the terms of the GNU General Public License as published
> by
>
> Should be in previous.
>

Gotcha.


> > +static inline void target_cpu_init(CPUX86State *env,
> > +        struct target_pt_regs *regs)
> > +{
> > +    uint64_t *gdt_table;
> > +
> > +    env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
> > +    env->hflags |= HF_PE_MASK | HF_CPL_MASK;
> > +    if (env->features[FEAT_1_EDX] & CPUID_SSE) {
> > +        env->cr[4] |= CR4_OSFXSR_MASK;
> > +        env->hflags |= HF_OSFXSR_MASK;
> > +    }
> > +
> > +    /* flags setup : we activate the IRQs by default as in user mode */
> > +    env->eflags |= IF_MASK;
> > +
> > +    /* register setup */
> > +    env->regs[R_EAX] = regs->eax;
> > +    env->regs[R_EBX] = regs->ebx;
> > +    env->regs[R_ECX] = regs->ecx;
> > +    env->regs[R_EDX] = regs->edx;
> > +    env->regs[R_ESI] = regs->esi;
> > +    env->regs[R_EDI] = regs->edi;
> > +    env->regs[R_EBP] = regs->ebp;
> > +    env->regs[R_ESP] = regs->esp;
> > +    env->eip = regs->eip;
> > +
> > +    /* interrupt setup */
> > +    env->idt.limit = 255;
> > +
> > +    env->idt.base = target_mmap(0, sizeof(uint64_t) * (env->idt.limit +
> 1),
> > +        PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> > +    bsd_i386_set_idt_base(env->idt.base);
> > +    bsd_i386_set_idt(0, 0);
> > +    bsd_i386_set_idt(1, 0);
> > +    bsd_i386_set_idt(2, 0);
> > +    bsd_i386_set_idt(3, 3);
> > +    bsd_i386_set_idt(4, 3);
> > +    bsd_i386_set_idt(5, 0);
> > +    bsd_i386_set_idt(6, 0);
> > +    bsd_i386_set_idt(7, 0);
> > +    bsd_i386_set_idt(8, 0);
> > +    bsd_i386_set_idt(9, 0);
> > +    bsd_i386_set_idt(10, 0);
> > +    bsd_i386_set_idt(11, 0);
> > +    bsd_i386_set_idt(12, 0);
> > +    bsd_i386_set_idt(13, 0);
> > +    bsd_i386_set_idt(14, 0);
> > +    bsd_i386_set_idt(15, 0);
> > +    bsd_i386_set_idt(16, 0);
> > +    bsd_i386_set_idt(17, 0);
> > +    bsd_i386_set_idt(18, 0);
> > +    bsd_i386_set_idt(19, 0);
> > +    bsd_i386_set_idt(0x80, 3);
> > +
> > +    /* segment setup */
> > +    env->gdt.base = target_mmap(0, sizeof(uint64_t) *
> TARGET_GDT_ENTRIES,
> > +            PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> > +    env->gdt.limit = sizeof(uint64_t) * TARGET_GDT_ENTRIES - 1;
> > +    gdt_table = g2h_untagged(env->gdt.base);
> > +
> > +    bsd_i386_write_dt(&gdt_table[__USER_CS >> 3], 0, 0xfffff,
> > +            DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
> > +            (3 << DESC_DPL_SHIFT) | (0xa << DESC_TYPE_SHIFT));
> > +
> > +    bsd_i386_write_dt(&gdt_table[__USER_DS >> 3], 0, 0xfffff,
> > +            DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
> > +            (3 << DESC_DPL_SHIFT) | (0x2 << DESC_TYPE_SHIFT));
> > +
> > +    cpu_x86_load_seg(env, R_CS, __USER_CS);
> > +    cpu_x86_load_seg(env, R_SS, __USER_DS);
> > +    cpu_x86_load_seg(env, R_DS, __USER_DS);
> > +    cpu_x86_load_seg(env, R_ES, __USER_DS);
> > +    cpu_x86_load_seg(env, R_FS, __USER_DS);
> > +    cpu_x86_load_seg(env, R_GS, __USER_DS);
> > +    /* This hack makes Wine work... */
> > +    env->segs[R_FS].selector = 0;
> > +}
> > +
> > +static inline void target_cpu_loop(CPUX86State *env)
> > +{
> > +    CPUState *cs = env_cpu(env);
> > +    int trapnr;
> > +    abi_ulong pc;
> > +    /* target_siginfo_t info; */
> > +
> > +    for (;;) {
> > +     cpu_exec_start(cs);
> > +        trapnr = cpu_exec(cs);
> > +     cpu_exec_end(cs);
> > +     process_queued_cpu_work(cs);
> > +
> > +        switch (trapnr) {
> > +        case 0x80:
> > +            /* syscall from int $0x80 */
> > +            if (bsd_type == target_freebsd) {
> > +                abi_ulong params = (abi_ulong) env->regs[R_ESP] +
> > +                    sizeof(int32_t);
> > +                int32_t syscall_nr = env->regs[R_EAX];
> > +                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
> > +
> > +                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> > +                    get_user_s32(syscall_nr, params);
> > +                    params += sizeof(int32_t);
> > +                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
> > +                    get_user_s32(syscall_nr, params);
> > +                    params += sizeof(int64_t);
> > +                }
> > +                get_user_s32(arg1, params);
> > +                params += sizeof(int32_t);
> > +                get_user_s32(arg2, params);
> > +                params += sizeof(int32_t);
> > +                get_user_s32(arg3, params);
> > +                params += sizeof(int32_t);
> > +                get_user_s32(arg4, params);
> > +                params += sizeof(int32_t);
> > +                get_user_s32(arg5, params);
> > +                params += sizeof(int32_t);
> > +                get_user_s32(arg6, params);
> > +                params += sizeof(int32_t);
> > +                get_user_s32(arg7, params);
> > +                params += sizeof(int32_t);
> > +                get_user_s32(arg8, params);
> > +                env->regs[R_EAX] = do_freebsd_syscall(env,
> > +                                                      syscall_nr,
> > +                                                      arg1,
> > +                                                      arg2,
> > +                                                      arg3,
> > +                                                      arg4,
> > +                                                      arg5,
> > +                                                      arg6,
> > +                                                      arg7,
> > +                                                      arg8);
> > +            } else { /* if (bsd_type == target_openbsd) */
> > +                env->regs[R_EAX] = do_openbsd_syscall(env,
> > +                                                      env->regs[R_EAX],
> > +                                                      env->regs[R_EBX],
> > +                                                      env->regs[R_ECX],
> > +                                                      env->regs[R_EDX],
> > +                                                      env->regs[R_ESI],
> > +                                                      env->regs[R_EDI],
> > +                                                      env->regs[R_EBP]);
> > +            }
> > +            if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
> > +                env->regs[R_EAX] = -env->regs[R_EAX];
> > +                env->eflags |= CC_C;
> > +            } else {
> > +                env->eflags &= ~CC_C;
> > +            }
> > +            break;
> > +
> > +#if 0
> > +        case EXCP0B_NOSEG:
> > +        case EXCP0C_STACK:
> > +            info.si_signo = TARGET_SIGBUS;
> > +            info.si_errno = 0;
> > +            info.si_code = TARGET_SI_KERNEL;
> > +            info._sifields._sigfault._addr = 0;
> > +            queue_signal(env, info.si_signo, &info);
> > +            break;
> > +
> > +        case EXCP0D_GPF:
> > +            /* XXX: potential problem if ABI32 */
> > +            if (env->eflags & VM_MASK) {
> > +                handle_vm86_fault(env);
> > +            } else {
> > +                info.si_signo = TARGET_SIGSEGV;
> > +                info.si_errno = 0;
> > +                info.si_code = TARGET_SI_KERNEL;
> > +                info._sifields._sigfault._addr = 0;
> > +                queue_signal(env, info.si_signo, &info);
> > +            }
> > +            break;
> > +
> > +        case EXCP0E_PAGE:
> > +            info.si_signo = TARGET_SIGSEGV;
> > +            info.si_errno = 0;
> > +            if (!(env->error_code & 1)) {
> > +                info.si_code = TARGET_SEGV_MAPERR;
> > +            } else {
> > +                info.si_code = TARGET_SEGV_ACCERR;
> > +            }
> > +            info._sifields._sigfault._addr = env->cr[2];
> > +            queue_signal(env, info.si_signo, &info);
> > +            break;
> > +
> > +        case EXCP00_DIVZ:
> > +            if (env->eflags & VM_MASK) {
> > +                handle_vm86_trap(env, trapnr);
> > +            } else {
> > +                /* division by zero */
> > +                info.si_signo = TARGET_SIGFPE;
> > +                info.si_errno = 0;
> > +                info.si_code = TARGET_FPE_INTDIV;
> > +                info._sifields._sigfault._addr = env->eip;
> > +                queue_signal(env, info.si_signo, &info);
> > +            }
> > +            break;
> > +
> > +        case EXCP01_DB:
> > +        case EXCP03_INT3:
> > +            if (env->eflags & VM_MASK) {
> > +                handle_vm86_trap(env, trapnr);
> > +            } else {
> > +                info.si_signo = TARGET_SIGTRAP;
> > +                info.si_errno = 0;
> > +                if (trapnr == EXCP01_DB) {
> > +                    info.si_code = TARGET_TRAP_BRKPT;
> > +                    info._sifields._sigfault._addr = env->eip;
> > +                } else {
> > +                    info.si_code = TARGET_SI_KERNEL;
> > +                    info._sifields._sigfault._addr = 0;
> > +                }
> > +                queue_signal(env, info.si_signo, &info);
> > +            }
> > +            break;
> > +
> > +        case EXCP04_INTO:
> > +        case EXCP05_BOUND:
> > +            if (env->eflags & VM_MASK) {
> > +                handle_vm86_trap(env, trapnr);
> > +            } else {
> > +                info.si_signo = TARGET_SIGSEGV;
> > +                info.si_errno = 0;
> > +                info.si_code = TARGET_SI_KERNEL;
> > +                info._sifields._sigfault._addr = 0;
> > +                queue_signal(env, info.si_signo, &info);
> > +            }
> > +            break;
> > +
> > +        case EXCP06_ILLOP:
> > +            info.si_signo = TARGET_SIGILL;
> > +            info.si_errno = 0;
> > +            info.si_code = TARGET_ILL_ILLOPN;
> > +            info._sifields._sigfault._addr = env->eip;
> > +            queue_signal(env, info.si_signo, &info);
> > +            break;
> > +#endif
> > +        case EXCP_INTERRUPT:
> > +            /* just indicate that signals should be handled asap */
> > +            break;
> > +#if 0
> > +        case EXCP_DEBUG:
> > +            {
> > +
> > +                info.si_signo = TARGET_SIGTRAP;
> > +                info.si_errno = 0;
> > +                info.si_code = TARGET_TRAP_BRKPT;
> > +                queue_signal(env, info.si_signo, &info);
> > +            }
> > +            break;
> > +#endif
> > +
> > +        case EXCP_ATOMIC:
> > +            cpu_exec_step_atomic(cs);
> > +            break;
> > +
> > +        default:
> > +            pc = env->segs[R_CS].base + env->eip;
> > +            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception
> 0x%x - "
> > +                    "aborting\n", (long)pc, trapnr);
> > +            abort();
> > +        }
> > +        process_pending_signals(env);
> > +    }
> > +}
>
> Those are some really big functions to want to inline.  Any reason for
> that?  At first
> glance they could live just fine in target_arch_cpu.c.
>

Mostly because that's how Stacey wrote it and we have half a dozen
implementations
already.  I'll see how hard it would be to transition to this structure. I
worried about
this being so different than linux-user, but at the same time I worried
about regressions
that may be introduced in the effort since our testing story isn't what I'd
like. I'm also
a bit worried because we have two branches: the tip that we're trying to
release from
and this effort which needs any changes also merged to that tip branch.

Having said that, I'll see what I can do.

Warner

--00000000000026941005c90608f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFNhdCwgQXVn
IDcsIDIwMjEgYXQgMTE6MzUgUE0gUmljaGFyZCBIZW5kZXJzb24gJmx0OzxhIGhyZWY9Im1haWx0
bzpyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIj5yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQg
cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5PbiA4LzcvMjEgMTE6NDIgQU0sIFdh
cm5lciBMb3NoIHdyb3RlOjxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2JzZC11c2VyL2kzODYvdGFy
Z2V0X2FyY2hfY3B1LmMgYi9ic2QtdXNlci9pMzg2L3RhcmdldF9hcmNoX2NwdS5jPGJyPg0KJmd0
OyBpbmRleCA3ZjJmNzU1YTExLi43MTk5OGU1YmE1IDEwMDY0NDxicj4NCiZndDsgLS0tIGEvYnNk
LXVzZXIvaTM4Ni90YXJnZXRfYXJjaF9jcHUuYzxicj4NCiZndDsgKysrIGIvYnNkLXVzZXIvaTM4
Ni90YXJnZXRfYXJjaF9jcHUuYzxicj4NCiZndDsgQEAgLTEsNiArMSw3IEBAPGJyPg0KJmd0O8Kg
IMKgLyo8YnI+DQomZ3Q7wqAgwqAgKsKgIGkzODYgY3B1IHJlbGF0ZWQgY29kZTxicj4NCiZndDvC
oCDCoCAqPGJyPg0KJmd0OyArICogQ29weXJpZ2h0IChjKSAyMDEzIFN0YWNleSBTb24gJmx0O3Nz
b25ARnJlZUJTRC5vcmcmZ3Q7PGJyPg0KJmd0O8KgIMKgICo8YnI+DQomZ3Q7wqAgwqAgKsKgIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IgbW9kaWZ5PGJyPg0KJmd0O8KgIMKgICrCoCBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieTxicj4NCjxicj4NClNob3Vs
ZCBiZSBpbiBwcmV2aW91cy48YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+R290
Y2hhLjxicj48L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCBy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KJmd0OyArc3RhdGljIGlubGluZSB2
b2lkIHRhcmdldF9jcHVfaW5pdChDUFVYODZTdGF0ZSAqZW52LDxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIHN0cnVjdCB0YXJnZXRfcHRfcmVncyAqcmVncyk8YnI+DQomZ3Q7ICt7PGJyPg0KJmd0OyAr
wqAgwqAgdWludDY0X3QgKmdkdF90YWJsZTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCBl
bnYtJmd0O2NyWzBdID0gQ1IwX1BHX01BU0sgfCBDUjBfV1BfTUFTSyB8IENSMF9QRV9NQVNLOzxi
cj4NCiZndDsgK8KgIMKgIGVudi0mZ3Q7aGZsYWdzIHw9IEhGX1BFX01BU0sgfCBIRl9DUExfTUFT
Szs8YnI+DQomZ3Q7ICvCoCDCoCBpZiAoZW52LSZndDtmZWF0dXJlc1tGRUFUXzFfRURYXSAmYW1w
OyBDUFVJRF9TU0UpIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCBlbnYtJmd0O2NyWzRdIHw9IENS
NF9PU0ZYU1JfTUFTSzs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCBlbnYtJmd0O2hmbGFncyB8PSBI
Rl9PU0ZYU1JfTUFTSzs8YnI+DQomZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0OyArPGJyPg0KJmd0OyAr
wqAgwqAgLyogZmxhZ3Mgc2V0dXAgOiB3ZSBhY3RpdmF0ZSB0aGUgSVJRcyBieSBkZWZhdWx0IGFz
IGluIHVzZXIgbW9kZSAqLzxicj4NCiZndDsgK8KgIMKgIGVudi0mZ3Q7ZWZsYWdzIHw9IElGX01B
U0s7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgLyogcmVnaXN0ZXIgc2V0dXAgKi88YnI+
DQomZ3Q7ICvCoCDCoCBlbnYtJmd0O3JlZ3NbUl9FQVhdID0gcmVncy0mZ3Q7ZWF4Ozxicj4NCiZn
dDsgK8KgIMKgIGVudi0mZ3Q7cmVnc1tSX0VCWF0gPSByZWdzLSZndDtlYng7PGJyPg0KJmd0OyAr
wqAgwqAgZW52LSZndDtyZWdzW1JfRUNYXSA9IHJlZ3MtJmd0O2VjeDs8YnI+DQomZ3Q7ICvCoCDC
oCBlbnYtJmd0O3JlZ3NbUl9FRFhdID0gcmVncy0mZ3Q7ZWR4Ozxicj4NCiZndDsgK8KgIMKgIGVu
di0mZ3Q7cmVnc1tSX0VTSV0gPSByZWdzLSZndDtlc2k7PGJyPg0KJmd0OyArwqAgwqAgZW52LSZn
dDtyZWdzW1JfRURJXSA9IHJlZ3MtJmd0O2VkaTs8YnI+DQomZ3Q7ICvCoCDCoCBlbnYtJmd0O3Jl
Z3NbUl9FQlBdID0gcmVncy0mZ3Q7ZWJwOzxicj4NCiZndDsgK8KgIMKgIGVudi0mZ3Q7cmVnc1tS
X0VTUF0gPSByZWdzLSZndDtlc3A7PGJyPg0KJmd0OyArwqAgwqAgZW52LSZndDtlaXAgPSByZWdz
LSZndDtlaXA7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgLyogaW50ZXJydXB0IHNldHVw
ICovPGJyPg0KJmd0OyArwqAgwqAgZW52LSZndDtpZHQubGltaXQgPSAyNTU7PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArwqAgwqAgZW52LSZndDtpZHQuYmFzZSA9IHRhcmdldF9tbWFwKDAsIHNpemVv
Zih1aW50NjRfdCkgKiAoZW52LSZndDtpZHQubGltaXQgKyAxKSw8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX0FOT05ZTU9VU3xNQVBfUFJJVkFURSwgLTEs
IDApOzxicj4NCiZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHRfYmFzZShlbnYtJmd0O2lkdC5i
YXNlKTs8YnI+DQomZ3Q7ICvCoCDCoCBic2RfaTM4Nl9zZXRfaWR0KDAsIDApOzxicj4NCiZndDsg
K8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMSwgMCk7PGJyPg0KJmd0OyArwqAgwqAgYnNkX2kzODZf
c2V0X2lkdCgyLCAwKTs8YnI+DQomZ3Q7ICvCoCDCoCBic2RfaTM4Nl9zZXRfaWR0KDMsIDMpOzxi
cj4NCiZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoNCwgMyk7PGJyPg0KJmd0OyArwqAgwqAg
YnNkX2kzODZfc2V0X2lkdCg1LCAwKTs8YnI+DQomZ3Q7ICvCoCDCoCBic2RfaTM4Nl9zZXRfaWR0
KDYsIDApOzxicj4NCiZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoNywgMCk7PGJyPg0KJmd0
OyArwqAgwqAgYnNkX2kzODZfc2V0X2lkdCg4LCAwKTs8YnI+DQomZ3Q7ICvCoCDCoCBic2RfaTM4
Nl9zZXRfaWR0KDksIDApOzxicj4NCiZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMTAsIDAp
Ozxicj4NCiZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMTEsIDApOzxicj4NCiZndDsgK8Kg
IMKgIGJzZF9pMzg2X3NldF9pZHQoMTIsIDApOzxicj4NCiZndDsgK8KgIMKgIGJzZF9pMzg2X3Nl
dF9pZHQoMTMsIDApOzxicj4NCiZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMTQsIDApOzxi
cj4NCiZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMTUsIDApOzxicj4NCiZndDsgK8KgIMKg
IGJzZF9pMzg2X3NldF9pZHQoMTYsIDApOzxicj4NCiZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9p
ZHQoMTcsIDApOzxicj4NCiZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMTgsIDApOzxicj4N
CiZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMTksIDApOzxicj4NCiZndDsgK8KgIMKgIGJz
ZF9pMzg2X3NldF9pZHQoMHg4MCwgMyk7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgLyog
c2VnbWVudCBzZXR1cCAqLzxicj4NCiZndDsgK8KgIMKgIGVudi0mZ3Q7Z2R0LmJhc2UgPSB0YXJn
ZXRfbW1hcCgwLCBzaXplb2YodWludDY0X3QpICogVEFSR0VUX0dEVF9FTlRSSUVTLDxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIFBST1RfUkVBRHxQUk9UX1dSSVRFLCBNQVBfQU5PTllNT1VT
fE1BUF9QUklWQVRFLCAtMSwgMCk7PGJyPg0KJmd0OyArwqAgwqAgZW52LSZndDtnZHQubGltaXQg
PSBzaXplb2YodWludDY0X3QpICogVEFSR0VUX0dEVF9FTlRSSUVTIC0gMTs8YnI+DQomZ3Q7ICvC
oCDCoCBnZHRfdGFibGUgPSBnMmhfdW50YWdnZWQoZW52LSZndDtnZHQuYmFzZSk7PGJyPg0KJmd0
OyArPGJyPg0KJmd0OyArwqAgwqAgYnNkX2kzODZfd3JpdGVfZHQoJmFtcDtnZHRfdGFibGVbX19V
U0VSX0NTICZndDsmZ3Q7IDNdLCAwLCAweGZmZmZmLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIERFU0NfR19NQVNLIHwgREVTQ19CX01BU0sgfCBERVNDX1BfTUFTSyB8IERFU0NfU19NQVNL
IHw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCAoMyAmbHQ7Jmx0OyBERVNDX0RQTF9TSElG
VCkgfCAoMHhhICZsdDsmbHQ7IERFU0NfVFlQRV9TSElGVCkpOzxicj4NCiZndDsgKzxicj4NCiZn
dDsgK8KgIMKgIGJzZF9pMzg2X3dyaXRlX2R0KCZhbXA7Z2R0X3RhYmxlW19fVVNFUl9EUyAmZ3Q7
Jmd0OyAzXSwgMCwgMHhmZmZmZiw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBERVNDX0df
TUFTSyB8IERFU0NfQl9NQVNLIHwgREVTQ19QX01BU0sgfCBERVNDX1NfTUFTSyB8PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgKDMgJmx0OyZsdDsgREVTQ19EUExfU0hJRlQpIHwgKDB4MiAm
bHQ7Jmx0OyBERVNDX1RZUEVfU0hJRlQpKTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCBj
cHVfeDg2X2xvYWRfc2VnKGVudiwgUl9DUywgX19VU0VSX0NTKTs8YnI+DQomZ3Q7ICvCoCDCoCBj
cHVfeDg2X2xvYWRfc2VnKGVudiwgUl9TUywgX19VU0VSX0RTKTs8YnI+DQomZ3Q7ICvCoCDCoCBj
cHVfeDg2X2xvYWRfc2VnKGVudiwgUl9EUywgX19VU0VSX0RTKTs8YnI+DQomZ3Q7ICvCoCDCoCBj
cHVfeDg2X2xvYWRfc2VnKGVudiwgUl9FUywgX19VU0VSX0RTKTs8YnI+DQomZ3Q7ICvCoCDCoCBj
cHVfeDg2X2xvYWRfc2VnKGVudiwgUl9GUywgX19VU0VSX0RTKTs8YnI+DQomZ3Q7ICvCoCDCoCBj
cHVfeDg2X2xvYWRfc2VnKGVudiwgUl9HUywgX19VU0VSX0RTKTs8YnI+DQomZ3Q7ICvCoCDCoCAv
KiBUaGlzIGhhY2sgbWFrZXMgV2luZSB3b3JrLi4uICovPGJyPg0KJmd0OyArwqAgwqAgZW52LSZn
dDtzZWdzW1JfRlNdLnNlbGVjdG9yID0gMDs8YnI+DQomZ3Q7ICt9PGJyPg0KJmd0OyArPGJyPg0K
Jmd0OyArc3RhdGljIGlubGluZSB2b2lkIHRhcmdldF9jcHVfbG9vcChDUFVYODZTdGF0ZSAqZW52
KTxicj4NCiZndDsgK3s8YnI+DQomZ3Q7ICvCoCDCoCBDUFVTdGF0ZSAqY3MgPSBlbnZfY3B1KGVu
dik7PGJyPg0KJmd0OyArwqAgwqAgaW50IHRyYXBucjs8YnI+DQomZ3Q7ICvCoCDCoCBhYmlfdWxv
bmcgcGM7PGJyPg0KJmd0OyArwqAgwqAgLyogdGFyZ2V0X3NpZ2luZm9fdCBpbmZvOyAqLzxicj4N
CiZndDsgKzxicj4NCiZndDsgK8KgIMKgIGZvciAoOzspIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoGNw
dV9leGVjX3N0YXJ0KGNzKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCB0cmFwbnIgPSBjcHVfZXhl
Yyhjcyk7PGJyPg0KJmd0OyArwqAgwqAgwqBjcHVfZXhlY19lbmQoY3MpOzxicj4NCiZndDsgK8Kg
IMKgIMKgcHJvY2Vzc19xdWV1ZWRfY3B1X3dvcmsoY3MpOzxicj4NCiZndDsgKzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIHN3aXRjaCAodHJhcG5yKSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgY2Fz
ZSAweDgwOjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIC8qIHN5c2NhbGwgZnJvbSBpbnQg
JDB4ODAgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoYnNkX3R5cGUgPT0gdGFy
Z2V0X2ZyZWVic2QpIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhYmlfdWxv
bmcgcGFyYW1zID0gKGFiaV91bG9uZykgZW52LSZndDtyZWdzW1JfRVNQXSArPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2l6ZW9mKGludDMyX3QpOzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGludDMyX3Qgc3lzY2FsbF9uciA9IGVudi0mZ3Q7cmVn
c1tSX0VBWF07PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50MzJfdCBhcmcx
LCBhcmcyLCBhcmczLCBhcmc0LCBhcmc1LCBhcmc2LCBhcmc3LCBhcmc4Ozxicj4NCiZndDsgKzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChzeXNjYWxsX25yID09IFRBUkdF
VF9GUkVFQlNEX05SX3N5c2NhbGwpIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBnZXRfdXNlcl9zMzIoc3lzY2FsbF9uciwgcGFyYW1zKTs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSBpZiAoc3lzY2FsbF9uciA9PSBU
QVJHRVRfRlJFRUJTRF9OUl9fX3N5c2NhbGwpIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBnZXRfdXNlcl9zMzIoc3lzY2FsbF9uciwgcGFyYW1zKTs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDY0X3Qp
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNlcl9zMzIoYXJnMSwgcGFyYW1zKTs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmcyLCBwYXJhbXMpOzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhcmFtcyArPSBzaXplb2YoaW50MzJf
dCk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFyZzMs
IHBhcmFtcyk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGFyYW1zICs9IHNp
emVvZihpbnQzMl90KTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNl
cl9zMzIoYXJnNCwgcGFyYW1zKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBw
YXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGdldF91c2VyX3MzMihhcmc1LCBwYXJhbXMpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHBhcmFtcyArPSBzaXplb2YoaW50MzJfdCk7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFyZzYsIHBhcmFtcyk7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcGFyYW1zICs9IHNpemVvZihpbnQzMl90KTs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNlcl9zMzIoYXJnNywgcGFyYW1zKTs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3Qp
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmc4LCBw
YXJhbXMpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1tS
X0VBWF0gPSBkb19mcmVlYnNkX3N5c2NhbGwoZW52LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHN5c2NhbGxfbnIsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
YXJnMSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcmcyLDxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzMsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgYXJnNCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcmc1LDxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzYsPGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgYXJnNyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBhcmc4KTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2UgeyAvKiBpZiAoYnNk
X3R5cGUgPT0gdGFyZ2V0X29wZW5ic2QpICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgZW52LSZndDtyZWdzW1JfRUFYXSA9IGRvX29wZW5ic2Rfc3lzY2FsbChlbnYsPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdzW1JfRUFYXSw8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbUl9FQlhdLDxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1tSX0VDWF0sPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdzW1JfRURYXSw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbUl9FU0ldLDxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1tSX0VESV0sPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdzW1JfRUJQXSk7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGlmICgoKGFi
aV91bG9uZyllbnYtJmd0O3JlZ3NbUl9FQVhdKSAmZ3Q7PSAoYWJpX3Vsb25nKSgtNTE1KSkgezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1tSX0VBWF0gPSAt
ZW52LSZndDtyZWdzW1JfRUFYXTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBl
bnYtJmd0O2VmbGFncyB8PSBDQ19DOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIH0gZWxz
ZSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtlZmxhZ3MgJmFt
cDs9IH5DQ19DOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsjaWYgMDxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIGNhc2UgRVhDUDBCX05PU0VHOjxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IGNhc2UgRVhDUDBDX1NUQUNLOjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGluZm8uc2lf
c2lnbm8gPSBUQVJHRVRfU0lHQlVTOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGluZm8u
c2lfZXJybm8gPSAwOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGluZm8uc2lfY29kZSA9
IFRBUkdFVF9TSV9LRVJORUw7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgaW5mby5fc2lm
aWVsZHMuX3NpZ2ZhdWx0Ll9hZGRyID0gMDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBx
dWV1ZV9zaWduYWwoZW52LCBpbmZvLnNpX3NpZ25vLCAmYW1wO2luZm8pOzxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IGNhc2UgRVhDUDBEX0dQRjo8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCAvKiBYWFg6IHBv
dGVudGlhbCBwcm9ibGVtIGlmIEFCSTMyICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
aWYgKGVudi0mZ3Q7ZWZsYWdzICZhbXA7IFZNX01BU0spIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBoYW5kbGVfdm04Nl9mYXVsdChlbnYpOzxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5m
by5zaV9zaWdubyA9IFRBUkdFVF9TSUdTRUdWOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGluZm8uc2lfZXJybm8gPSAwOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGluZm8uc2lfY29kZSA9IFRBUkdFVF9TSV9LRVJORUw7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaW5mby5fc2lmaWVsZHMuX3NpZ2ZhdWx0Ll9hZGRyID0gMDs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBxdWV1ZV9zaWduYWwoZW52LCBpbmZvLnNpX3Np
Z25vLCAmYW1wO2luZm8pOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCBjYXNlIEVYQ1AwRV9QQUdFOjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGluZm8u
c2lfc2lnbm8gPSBUQVJHRVRfU0lHU0VHVjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBp
bmZvLnNpX2Vycm5vID0gMDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoIShlbnYt
Jmd0O2Vycm9yX2NvZGUgJmFtcDsgMSkpIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBpbmZvLnNpX2NvZGUgPSBUQVJHRVRfU0VHVl9NQVBFUlI7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgfSBlbHNlIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBp
bmZvLnNpX2NvZGUgPSBUQVJHRVRfU0VHVl9BQ0NFUlI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgfTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGluZm8uX3NpZmllbGRzLl9zaWdm
YXVsdC5fYWRkciA9IGVudi0mZ3Q7Y3JbMl07PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
cXVldWVfc2lnbmFsKGVudiwgaW5mby5zaV9zaWdubywgJmFtcDtpbmZvKTs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCBjYXNlIEVYQ1AwMF9ESVZaOjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGlmIChlbnYt
Jmd0O2VmbGFncyAmYW1wOyBWTV9NQVNLKSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgaGFuZGxlX3ZtODZfdHJhcChlbnYsIHRyYXBucik7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgfSBlbHNlIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBk
aXZpc2lvbiBieSB6ZXJvICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5m
by5zaV9zaWdubyA9IFRBUkdFVF9TSUdGUEU7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgaW5mby5zaV9lcnJubyA9IDA7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgaW5mby5zaV9jb2RlID0gVEFSR0VUX0ZQRV9JTlRESVY7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaW5mby5fc2lmaWVsZHMuX3NpZ2ZhdWx0Ll9hZGRyID0gZW52LSZndDtl
aXA7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcXVldWVfc2lnbmFsKGVudiwg
aW5mby5zaV9zaWdubywgJmFtcDtpbmZvKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCB9
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KJmd0OyArPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgY2FzZSBFWENQMDFfREI6PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgY2Fz
ZSBFWENQMDNfSU5UMzo8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoZW52LSZndDtl
ZmxhZ3MgJmFtcDsgVk1fTUFTSykgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGhhbmRsZV92bTg2X3RyYXAoZW52LCB0cmFwbnIpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIH0gZWxzZSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5mby5zaV9z
aWdubyA9IFRBUkdFVF9TSUdUUkFQOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGluZm8uc2lfZXJybm8gPSAwOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlm
ICh0cmFwbnIgPT0gRVhDUDAxX0RCKSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaW5mby5zaV9jb2RlID0gVEFSR0VUX1RSQVBfQlJLUFQ7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5mby5fc2lmaWVsZHMuX3NpZ2ZhdWx0Ll9hZGRy
ID0gZW52LSZndDtlaXA7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNl
IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbmZvLnNpX2NvZGUg
PSBUQVJHRVRfU0lfS0VSTkVMOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGluZm8uX3NpZmllbGRzLl9zaWdmYXVsdC5fYWRkciA9IDA7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHF1
ZXVlX3NpZ25hbChlbnYsIGluZm8uc2lfc2lnbm8sICZhbXA7aW5mbyk7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgfTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4N
CiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIGNhc2UgRVhDUDA0X0lOVE86PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgY2FzZSBFWENQMDVfQk9VTkQ6PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgaWYgKGVudi0mZ3Q7ZWZsYWdzICZhbXA7IFZNX01BU0spIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBoYW5kbGVfdm04Nl90cmFwKGVudiwgdHJhcG5yKTs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2Ugezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGluZm8uc2lfc2lnbm8gPSBUQVJHRVRfU0lHU0VHVjs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBpbmZvLnNpX2Vycm5vID0gMDs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBpbmZvLnNpX2NvZGUgPSBUQVJHRVRfU0lfS0VSTkVMOzxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGluZm8uX3NpZmllbGRzLl9zaWdmYXVsdC5fYWRk
ciA9IDA7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcXVldWVfc2lnbmFsKGVu
diwgaW5mby5zaV9zaWdubywgJmFtcDtpbmZvKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCB9PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KJmd0OyArPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgY2FzZSBFWENQMDZfSUxMT1A6PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgaW5mby5zaV9zaWdubyA9IFRBUkdFVF9TSUdJTEw7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgaW5mby5zaV9lcnJubyA9IDA7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgaW5mby5zaV9jb2RlID0gVEFSR0VUX0lMTF9JTExPUE47PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgaW5mby5fc2lmaWVsZHMuX3NpZ2ZhdWx0Ll9hZGRyID0gZW52LSZndDtlaXA7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgcXVldWVfc2lnbmFsKGVudiwgaW5mby5zaV9zaWdu
bywgJmFtcDtpbmZvKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQom
Z3Q7ICsjZW5kaWY8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCBjYXNlIEVYQ1BfSU5URVJSVVBUOjxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIC8qIGp1c3QgaW5kaWNhdGUgdGhhdCBzaWduYWxz
IHNob3VsZCBiZSBoYW5kbGVkIGFzYXAgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBi
cmVhazs8YnI+DQomZ3Q7ICsjaWYgMDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIGNhc2UgRVhDUF9E
RUJVRzo8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCB7PGJyPg0KJmd0OyArPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5mby5zaV9zaWdubyA9IFRBUkdFVF9TSUdUUkFQ
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGluZm8uc2lfZXJybm8gPSAwOzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGluZm8uc2lfY29kZSA9IFRBUkdFVF9U
UkFQX0JSS1BUOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHF1ZXVlX3NpZ25h
bChlbnYsIGluZm8uc2lfc2lnbm8sICZhbXA7aW5mbyk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgfTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCiZndDsgKyNl
bmRpZjxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIGNhc2UgRVhDUF9BVE9NSUM6
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgY3B1X2V4ZWNfc3RlcF9hdG9taWMoY3MpOzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCiZndDsgKzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIGRlZmF1bHQ6PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgcGMgPSBl
bnYtJmd0O3NlZ3NbUl9DU10uYmFzZSArIGVudi0mZ3Q7ZWlwOzxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIGZwcmludGYoc3RkZXJyLCAmcXVvdDtxZW11OiAweCUwOGx4OiB1bmhhbmRsZWQg
Q1BVIGV4Y2VwdGlvbiAweCV4IC0gJnF1b3Q7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgJnF1b3Q7YWJvcnRpbmdcbiZxdW90OywgKGxvbmcpcGMsIHRyYXBucik7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgYWJvcnQoKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCB9PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgcHJvY2Vzc19wZW5kaW5nX3NpZ25hbHMoZW52KTs8
YnI+DQomZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0OyArfTxicj4NCjxicj4NClRob3NlIGFyZSBzb21l
IHJlYWxseSBiaWcgZnVuY3Rpb25zIHRvIHdhbnQgdG8gaW5saW5lLsKgIEFueSByZWFzb24gZm9y
IHRoYXQ/wqAgQXQgZmlyc3QgPGJyPg0KZ2xhbmNlIHRoZXkgY291bGQgbGl2ZSBqdXN0IGZpbmUg
aW4gdGFyZ2V0X2FyY2hfY3B1LmMuPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2
Pk1vc3RseSBiZWNhdXNlIHRoYXQmIzM5O3MgaG93IFN0YWNleSB3cm90ZSBpdCBhbmQgd2UgaGF2
ZSBoYWxmIGEgZG96ZW4gaW1wbGVtZW50YXRpb25zPC9kaXY+PGRpdj5hbHJlYWR5LsKgIEkmIzM5
O2xsIHNlZSBob3cgaGFyZCBpdCB3b3VsZCBiZSB0byB0cmFuc2l0aW9uIHRvIHRoaXMgc3RydWN0
dXJlLiBJIHdvcnJpZWQgYWJvdXQ8L2Rpdj48ZGl2PnRoaXMgYmVpbmcgc28gZGlmZmVyZW50IHRo
YW4gbGludXgtdXNlciwgYnV0IGF0IHRoZSBzYW1lIHRpbWUgSSB3b3JyaWVkIGFib3V0IHJlZ3Jl
c3Npb25zPC9kaXY+PGRpdj50aGF0IG1heSBiZSBpbnRyb2R1Y2VkIGluIHRoZSBlZmZvcnQgc2lu
Y2Ugb3VyIHRlc3Rpbmcgc3RvcnkgaXNuJiMzOTt0IHdoYXQgSSYjMzk7ZCBsaWtlLiBJJiMzOTtt
IGFsc288L2Rpdj48ZGl2PmEgYml0IHdvcnJpZWQgYmVjYXVzZSB3ZSBoYXZlIHR3byBicmFuY2hl
czogdGhlIHRpcCB0aGF0IHdlJiMzOTtyZSB0cnlpbmcgdG8gcmVsZWFzZSBmcm9tPC9kaXY+PGRp
dj5hbmQgdGhpcyBlZmZvcnQgd2hpY2ggbmVlZHMgYW55IGNoYW5nZXMgYWxzbyBtZXJnZWQgdG8g
dGhhdCB0aXAgYnJhbmNoLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkhhdmluZyBzYWlk
IHRoYXQsIEkmIzM5O2xsIHNlZSB3aGF0IEkgY2FuIGRvLjxicj48L2Rpdj48L2Rpdj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+PGRpdj48YnI+PC9kaXY+PGRpdj5XYXJuZXI8YnI+PC9kaXY+PC9k
aXY+PC9kaXY+DQo=
--00000000000026941005c90608f0--

