Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F0142FB2A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:41:03 +0200 (CEST)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbS8d-0003IM-2b
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbS0T-0001Js-JW
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:32:37 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:37807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbS0Q-0008Nz-99
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:32:37 -0400
Received: by mail-ua1-x934.google.com with SMTP id f4so19839905uad.4
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5nCBxkrUfpocJEkT3jL+H1mrHj96Ptmud0cwKoIiNd8=;
 b=cIXSjaxDT+5ft3JOb+QyqeFScp3hKHoGFGoODAM9v+z4Oxe8R848z/NnEyFS3zLITQ
 XKWCMNd8r5ncOm7F/R+jUrlXUUENFRZ4GCTKhYut0pHRMvts1SZmsSsWV+4vy3EoPsG0
 7SKfuaDPjxzWLPce3XnyUNc9ISUZQYKEroWfyTeh0x0DL3cwFfDeKFLzLPhmPabUBK+M
 5Wt7+s3iKeD+6C0ftx+tIHBpLx3xbiSNBLpYjcKHs+QY7vpj3S883Sl9TGDmDShzRpR7
 3o3YahKd8ZmJBGS569hqLykGkJgHeNMOpnzpfSn3HXqFn6MTaFkaB7CMea4mC/hJ8uEi
 8zFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5nCBxkrUfpocJEkT3jL+H1mrHj96Ptmud0cwKoIiNd8=;
 b=Q9/aQP2x5m4fNcwZ/dZQS/NdtMN7cp+iCS2m4pNyOvm6O8aXoSDFNK1a0YK6lOWfN/
 wR5yOyMBLWHcS21M3llg5gSaUqNKMT3YbQfWGBqxlHtZxIV/RIPwp6Zta13E850Yl6Qm
 IhKqFSq1DwkbxjIjk8A1MxpPArEfE90I+vBehyGr/K/YpOm3NCHwxElPhTAKJUDQJUCP
 rmUFJZn9AukvvFWxXqnQDprelV1jt712I6KNaIQPC1+eCuRjHWa+DDm1mvrjYI9Yha8X
 vE5bYcGl3RSHWO0VKz+jcwah0qZ1oIkXyGcE8R9zrrSDaytDxrd/lCffXJarGXB5cXah
 MRJw==
X-Gm-Message-State: AOAM530BvpVR1IDDQKHen6HJ8SNTlh9n0FZU2x+wkgp9I76g5xGddhPS
 u+exjCZZA4Ecb3jTsaimKDvGmm4wOUOxEk4eD1Cu2A==
X-Google-Smtp-Source: ABdhPJxjgF9k8KF/S5+WL18jtZounFAba4OctZ/GFzUGFzXv4CZsmyfnIi9fEbB7KIgeUIVcai3S/x4ah1GKfmRbf68=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr16141946vsh.30.1634322753313; 
 Fri, 15 Oct 2021 11:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-16-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-16-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:32:22 -0600
Message-ID: <CANCZdfozwanXWtbAzbiOcY5r7f-oXRp8ZxTdG2Dh_1kuXqNb9A@mail.gmail.com>
Subject: Re: [PATCH v5 15/67] linux-user/host/riscv: Populate host_signal.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000028eea805ce686b75"
Received-SPF: none client-ip=2607:f8b0:4864:20::934;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x934.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000028eea805ce686b75
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Split host_signal_pc and host_signal_write out of user-exec.c.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/riscv/host-signal.h |  85 +++++++++++++++++-
>  accel/tcg/user-exec.c               | 134 ----------------------------
>  2 files changed, 84 insertions(+), 135 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/host/riscv/host-signal.h
> b/linux-user/host/riscv/host-signal.h
> index f4b4d65031..5860dce7d7 100644
> --- a/linux-user/host/riscv/host-signal.h
> +++ b/linux-user/host/riscv/host-signal.h
> @@ -1 +1,84 @@
> -#define HOST_SIGNAL_PLACEHOLDER
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef RISCV_HOST_SIGNAL_H
> +#define RISCV_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.__gregs[REG_PC];
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
> +
> +    /*
> +     * Detect store by reading the instruction at the program
> +     * counter. Note: we currently only generate 32-bit
> +     * instructions so we thus only detect 32-bit stores
> +     */
> +    switch (((insn >> 0) & 0b11)) {
> +    case 3:
> +        switch (((insn >> 2) & 0b11111)) {
> +        case 8:
> +            switch (((insn >> 12) & 0b111)) {
> +            case 0: /* sb */
> +            case 1: /* sh */
> +            case 2: /* sw */
> +            case 3: /* sd */
> +            case 4: /* sq */
> +                return true;
> +            default:
> +                break;
> +            }
> +            break;
> +        case 9:
> +            switch (((insn >> 12) & 0b111)) {
> +            case 2: /* fsw */
> +            case 3: /* fsd */
> +            case 4: /* fsq */
> +                return true;
> +            default:
> +                break;
> +            }
> +            break;
> +        default:
> +            break;
> +        }
> +    }
> +
> +    /* Check for compressed instructions */
> +    switch (((insn >> 13) & 0b111)) {
> +    case 7:
> +        switch (insn & 0b11) {
> +        case 0: /*c.sd */
> +        case 2: /* c.sdsp */
> +            return true;
> +        default:
> +            break;
> +        }
> +        break;
> +    case 6:
> +        switch (insn & 0b11) {
> +        case 0: /* c.sw */
> +        case 3: /* c.swsp */
> +            return true;
> +        default:
> +            break;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return false;
> +}
> +
> +#endif
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 287f03dac5..2d9ab0a8b8 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -139,64 +139,6 @@ bool handle_sigsegv_accerr_write(CPUState *cpu,
> sigset_t *old_set,
>      }
>  }
>
> -/*
> - * 'pc' is the host PC at which the exception was raised.
> - * 'address' is the effective address of the memory exception.
> - * 'is_write' is 1 if a write caused the exception and otherwise 0.
> - * 'old_set' is the signal set which should be restored.
> - */
> -static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
> -                                    int is_write, sigset_t *old_set)
> -{
> -    CPUState *cpu = current_cpu;
> -    CPUClass *cc;
> -    unsigned long host_addr = (unsigned long)info->si_addr;
> -    MMUAccessType access_type = adjust_signal_pc(&pc, is_write);
> -    abi_ptr guest_addr;
> -
> -    /* For synchronous signals we expect to be coming from the vCPU
> -     * thread (so current_cpu should be valid) and either from running
> -     * code or during translation which can fault as we cross pages.
> -     *
> -     * If neither is true then something has gone wrong and we should
> -     * abort rather than try and restart the vCPU execution.
> -     */
> -    if (!cpu || !cpu->running) {
> -        printf("qemu:%s received signal outside vCPU context @ pc=0x%"
> -               PRIxPTR "\n",  __func__, pc);
> -        abort();
> -    }
> -
> -#if defined(DEBUG_SIGNAL)
> -    printf("qemu: SIGSEGV pc=0x%08lx address=%08lx w=%d oldset=0x%08lx\n",
> -           pc, host_addr, is_write, *(unsigned long *)old_set);
> -#endif
> -
> -    /* Convert forcefully to guest address space, invalid addresses
> -       are still valid segv ones */
> -    guest_addr = h2g_nocheck(host_addr);
> -
> -    /* XXX: locking issue */
> -    if (is_write &&
> -        info->si_signo == SIGSEGV &&
> -        info->si_code == SEGV_ACCERR &&
> -        h2g_valid(host_addr) &&
> -        handle_sigsegv_accerr_write(cpu, old_set, pc, guest_addr)) {
> -        return 1;
> -    }
> -
> -    /*
> -     * There is no way the target can handle this other than raising
> -     * an exception.  Undo signal and retaddr state prior to longjmp.
> -     */
> -    sigprocmask(SIG_SETMASK, old_set, NULL);
> -
> -    cc = CPU_GET_CLASS(cpu);
> -    cc->tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
> -                          MMU_USER_IDX, false, pc);
> -    g_assert_not_reached();
> -}
> -
>  static int probe_access_internal(CPUArchState *env, target_ulong addr,
>                                   int fault_size, MMUAccessType
> access_type,
>                                   bool nonfault, uintptr_t ra)
> @@ -255,82 +197,6 @@ void *probe_access(CPUArchState *env, target_ulong
> addr, int size,
>      return size ? g2h(env_cpu(env), addr) : NULL;
>  }
>
> -#if defined(__riscv)
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    ucontext_t *uc = puc;
> -    greg_t pc = uc->uc_mcontext.__gregs[REG_PC];
> -    uint32_t insn = *(uint32_t *)pc;
> -    int is_write = 0;
> -
> -    /* Detect store by reading the instruction at the program
> -       counter. Note: we currently only generate 32-bit
> -       instructions so we thus only detect 32-bit stores */
> -    switch (((insn >> 0) & 0b11)) {
> -    case 3:
> -        switch (((insn >> 2) & 0b11111)) {
> -        case 8:
> -            switch (((insn >> 12) & 0b111)) {
> -            case 0: /* sb */
> -            case 1: /* sh */
> -            case 2: /* sw */
> -            case 3: /* sd */
> -            case 4: /* sq */
> -                is_write = 1;
> -                break;
> -            default:
> -                break;
> -            }
> -            break;
> -        case 9:
> -            switch (((insn >> 12) & 0b111)) {
> -            case 2: /* fsw */
> -            case 3: /* fsd */
> -            case 4: /* fsq */
> -                is_write = 1;
> -                break;
> -            default:
> -                break;
> -            }
> -            break;
> -        default:
> -            break;
> -        }
> -    }
> -
> -    /* Check for compressed instructions */
> -    switch (((insn >> 13) & 0b111)) {
> -    case 7:
> -        switch (insn & 0b11) {
> -        case 0: /*c.sd */
> -        case 2: /* c.sdsp */
> -            is_write = 1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    case 6:
> -        switch (insn & 0b11) {
> -        case 0: /* c.sw */
> -        case 3: /* c.swsp */
> -            is_write = 1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    default:
> -        break;
> -    }
> -
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -#endif
> -
>  /* The softmmu versions of these helpers are in cputlb.c.  */
>
>  /*
> --
> 2.25.1
>
>

--00000000000028eea805ce686b75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:11 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Split host_signal_pc and host_signal_write out of user-e=
xec.c.<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/host/riscv/host-signal.h |=C2=A0 85 +++++++++++++++++-<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 134 ----------------------------<br>
=C2=A02 files changed, 84 insertions(+), 135 deletions(-)<br></blockquote><=
div><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@=
bsdimp.com">imp@bsdimp.com</a>&gt;</div></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/ho=
st-signal.h<br>
index f4b4d65031..5860dce7d7 100644<br>
--- a/linux-user/host/riscv/host-signal.h<br>
+++ b/linux-user/host/riscv/host-signal.h<br>
@@ -1 +1,84 @@<br>
-#define HOST_SIGNAL_PLACEHOLDER<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef RISCV_HOST_SIGNAL_H<br>
+#define RISCV_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.__gregs[REG_PC];<br>
+}<br>
+<br>
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t insn =3D *(uint32_t *)host_signal_pc(uc);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Detect store by reading the instruction at the progr=
am<br>
+=C2=A0 =C2=A0 =C2=A0* counter. Note: we currently only generate 32-bit<br>
+=C2=A0 =C2=A0 =C2=A0* instructions so we thus only detect 32-bit stores<br=
>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 switch (((insn &gt;&gt; 0) &amp; 0b11)) {<br>
+=C2=A0 =C2=A0 case 3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (((insn &gt;&gt; 2) &amp; 0b11111)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (((insn &gt;&gt; 12) &amp=
; 0b111)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /* sb */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1: /* sh */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* sw */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3: /* sd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 4: /* sq */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 9:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (((insn &gt;&gt; 12) &amp=
; 0b111)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* fsw */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3: /* fsd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 4: /* fsq */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Check for compressed instructions */<br>
+=C2=A0 =C2=A0 switch (((insn &gt;&gt; 13) &amp; 0b111)) {<br>
+=C2=A0 =C2=A0 case 7:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (insn &amp; 0b11) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /*<a href=3D"http://c.sd" rel=3D"noref=
errer" target=3D"_blank">c.sd</a> */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* c.sdsp */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 6:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (insn &amp; 0b11) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /* c.sw */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3: /* c.swsp */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+#endif<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 287f03dac5..2d9ab0a8b8 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -139,64 +139,6 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset=
_t *old_set,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-/*<br>
- * &#39;pc&#39; is the host PC at which the exception was raised.<br>
- * &#39;address&#39; is the effective address of the memory exception.<br>
- * &#39;is_write&#39; is 1 if a write caused the exception and otherwise 0=
.<br>
- * &#39;old_set&#39; is the signal set which should be restored.<br>
- */<br>
-static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int is_write, sigset_t=
 *old_set)<br>
-{<br>
-=C2=A0 =C2=A0 CPUState *cpu =3D current_cpu;<br>
-=C2=A0 =C2=A0 CPUClass *cc;<br>
-=C2=A0 =C2=A0 unsigned long host_addr =3D (unsigned long)info-&gt;si_addr;=
<br>
-=C2=A0 =C2=A0 MMUAccessType access_type =3D adjust_signal_pc(&amp;pc, is_w=
rite);<br>
-=C2=A0 =C2=A0 abi_ptr guest_addr;<br>
-<br>
-=C2=A0 =C2=A0 /* For synchronous signals we expect to be coming from the v=
CPU<br>
-=C2=A0 =C2=A0 =C2=A0* thread (so current_cpu should be valid) and either f=
rom running<br>
-=C2=A0 =C2=A0 =C2=A0* code or during translation which can fault as we cro=
ss pages.<br>
-=C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0* If neither is true then something has gone wrong and=
 we should<br>
-=C2=A0 =C2=A0 =C2=A0* abort rather than try and restart the vCPU execution=
.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 if (!cpu || !cpu-&gt;running) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;qemu:%s received signal outside v=
CPU context @ pc=3D0x%&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PRIxPTR &quot;\n&qu=
ot;,=C2=A0 __func__, pc);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-#if defined(DEBUG_SIGNAL)<br>
-=C2=A0 =C2=A0 printf(&quot;qemu: SIGSEGV pc=3D0x%08lx address=3D%08lx w=3D=
%d oldset=3D0x%08lx\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pc, host_addr, is_write, *(unsign=
ed long *)old_set);<br>
-#endif<br>
-<br>
-=C2=A0 =C2=A0 /* Convert forcefully to guest address space, invalid addres=
ses<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0are still valid segv ones */<br>
-=C2=A0 =C2=A0 guest_addr =3D h2g_nocheck(host_addr);<br>
-<br>
-=C2=A0 =C2=A0 /* XXX: locking issue */<br>
-=C2=A0 =C2=A0 if (is_write &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;si_signo =3D=3D SIGSEGV &amp;&amp;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;si_code =3D=3D SEGV_ACCERR &amp;&amp;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 h2g_valid(host_addr) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 handle_sigsegv_accerr_write(cpu, old_set, pc, =
guest_addr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* There is no way the target can handle this other tha=
n raising<br>
-=C2=A0 =C2=A0 =C2=A0* an exception.=C2=A0 Undo signal and retaddr state pr=
ior to longjmp.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 sigprocmask(SIG_SETMASK, old_set, NULL);<br>
-<br>
-=C2=A0 =C2=A0 cc =3D CPU_GET_CLASS(cpu);<br>
-=C2=A0 =C2=A0 cc-&gt;tcg_ops-&gt;tlb_fill(cpu, guest_addr, 0, access_type,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MMU_USER_IDX, false, pc);<br>
-=C2=A0 =C2=A0 g_assert_not_reached();<br>
-}<br>
-<br>
=C2=A0static int probe_access_internal(CPUArchState *env, target_ulong addr=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int fault_size, MMUAccessType=
 access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool nonfault, uintptr_t ra)<=
br>
@@ -255,82 +197,6 @@ void *probe_access(CPUArchState *env, target_ulong add=
r, int size,<br>
=C2=A0 =C2=A0 =C2=A0return size ? g2h(env_cpu(env), addr) : NULL;<br>
=C2=A0}<br>
<br>
-#if defined(__riscv)<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 greg_t pc =3D uc-&gt;uc_mcontext.__gregs[REG_PC];<br>
-=C2=A0 =C2=A0 uint32_t insn =3D *(uint32_t *)pc;<br>
-=C2=A0 =C2=A0 int is_write =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 /* Detect store by reading the instruction at the program<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0counter. Note: we currently only generate 32-bi=
t<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0instructions so we thus only detect 32-bit stor=
es */<br>
-=C2=A0 =C2=A0 switch (((insn &gt;&gt; 0) &amp; 0b11)) {<br>
-=C2=A0 =C2=A0 case 3:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (((insn &gt;&gt; 2) &amp; 0b11111)) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 8:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (((insn &gt;&gt; 12) &amp=
; 0b111)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /* sb */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1: /* sh */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* sw */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3: /* sd */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 4: /* sq */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 9:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (((insn &gt;&gt; 12) &amp=
; 0b111)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* fsw */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3: /* fsd */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 4: /* fsq */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* Check for compressed instructions */<br>
-=C2=A0 =C2=A0 switch (((insn &gt;&gt; 13) &amp; 0b111)) {<br>
-=C2=A0 =C2=A0 case 7:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (insn &amp; 0b11) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /*<a href=3D"http://c.sd" rel=3D"noref=
errer" target=3D"_blank">c.sd</a> */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* c.sdsp */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case 6:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (insn &amp; 0b11) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /* c.sw */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3: /* c.swsp */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-#endif<br>
-<br>
=C2=A0/* The softmmu versions of these helpers are in cputlb.c.=C2=A0 */<br=
>
<br>
=C2=A0/*<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000028eea805ce686b75--

