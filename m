Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AE542FAE3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:22:21 +0200 (CEST)
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbRqW-0003jk-0Y
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRoL-00015j-4j
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:20:05 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:36450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRoI-0004ME-JO
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:20:04 -0400
Received: by mail-vk1-xa34.google.com with SMTP id f126so5588627vke.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=px0TlkdwYFwjSNrfxOt9Z5cfmPZ3YjZFVZgrTsefUag=;
 b=dxZxkckmMAHyeZMwPTNqXkJxWfus2N5SGKq3xMk/gtW6KcSYUZmMsExbNzv4WDmD5i
 I52490ybJazuH9xdw+1czICjOhIKWIgLwpSOYUmwOetLknTf3YXlWDSXBUFVep6+YfB3
 az7lfXJl2s+W6wsL3NBczHM9aT1EmtJKF7bpxXi1Y0QEyqlfBHif24rgyYuWfJN8cer0
 xL7bPAFmi73gw3zR4ZrwuqPMr5LEIcsem0Tj5mCiWmd3+zvYlkAXrVJRqvvjMfnJMOX0
 2a4AGVYRveTQc3ZrfvVfgYp8pi6igZuaH39Nv0G345o+TvtW3LCUM70+KWg3NE8h+H7H
 EVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=px0TlkdwYFwjSNrfxOt9Z5cfmPZ3YjZFVZgrTsefUag=;
 b=H6GKaW1Kgf0hG1C9ckwNtzwEB3AICRM7hdyAOEDeX3LFpdgtL5j8Z3opxyTBTluREk
 TtNtqlWsTWHxX0NUKAoZTdiz5Hj3QB2pdfKYl5tUFJCRJUucPu7rJflf4rJx1I6tgf1i
 GAOxTuUxMoSLZmqoL9bLeNk58tKfFHU8rHibnS1ZvNyvGAw4OV/pmJb02VcbYWas0eZw
 VvFzHI2N8XsiuG1M/gerPDD40JgQTgkgH6qy8iWGpOt6qxohisDzChG6jcBRLVFV6ZaX
 Gw3RtX83uPXF20D26rPe6ToAdEbbr8OXl1wzR+u0CvhQLUIYS2+9SYgTq+IC8PGpHGL3
 QJ9Q==
X-Gm-Message-State: AOAM530pWcOAP/ohSXsOXJZ/jSzm/zD/TbszTTyhWyJ+c4oB7rkIp4X/
 rB4hUq2su3aPuI0Qpcyh5iBGwY1el2PN3A12fRMmtw==
X-Google-Smtp-Source: ABdhPJxqB6JWB1puTt42pju3nfDQ+J/dIKSUp9Na8guy8r5S8Tidk7jnHodkFuZbgDAZjS+EwKivl7TkiV0ifmnKM60=
X-Received: by 2002:a1f:2006:: with SMTP id g6mr13966579vkg.22.1634322001242; 
 Fri, 15 Oct 2021 11:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-4-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-4-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:19:50 -0600
Message-ID: <CANCZdfpB6pkLWDSzfp9WCCZxLMKvqyqxAiQTsLLSYgTQnBsT2g@mail.gmail.com>
Subject: Re: [PATCH v5 03/67] accel/tcg: Split out handle_sigsegv_accerr_write
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000555dcb05ce683ee5"
Received-SPF: none client-ip=2607:f8b0:4864:20::a34;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa34.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000555dcb05ce683ee5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:10 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> This is the major portion of handle_cpu_signal which is specific
> to tcg, handling the page protections for the translations.
> Most of the rest will migrate to linux-user/ shortly.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Pass guest address to handle_sigsegv_accerr_write.
> ---
>  include/exec/exec-all.h |  12 +++++
>  accel/tcg/user-exec.c   | 103 ++++++++++++++++++++++++----------------
>  2 files changed, 74 insertions(+), 41 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index e54f8e5d65..5f94d799aa 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -673,6 +673,18 @@ static inline tb_page_addr_t
> get_page_addr_code_hostp(CPUArchState *env,
>   */
>  MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
>
> +/**
> + * handle_sigsegv_accerr_write:
> + * @cpu: the cpu context
> + * @old_set: the sigset_t from the signal ucontext_t
> + * @host_pc: the host pc, adjusted for the signal
> + * @host_addr: the host address of the fault
> + *
> + * Return true if the write fault has been handled, and should be
> re-tried.
> + */
> +bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
> +                                 uintptr_t host_pc, abi_ptr guest_addr);
> +
>  /**
>   * cpu_signal_handler
>   * @signum: host signal number
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 3f3e793b7b..cb63e528c5 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -114,6 +114,54 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool
> is_write)
>      return is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;
>  }
>
> +/**
> + * handle_sigsegv_accerr_write:
> + * @cpu: the cpu context
> + * @old_set: the sigset_t from the signal ucontext_t
> + * @host_pc: the host pc, adjusted for the signal
> + * @guest_addr: the guest address of the fault
> + *
> + * Return true if the write fault has been handled, and should be
> re-tried.
> + *
> + * Note that it is important that we don't call page_unprotect() unless
> + * this is really a "write to nonwriteable page" fault, because
> + * page_unprotect() assumes that if it is called for an access to
> + * a page that's writeable this means we had two threads racing and
> + * another thread got there first and already made the page writeable;
> + * so we will retry the access. If we were to call page_unprotect()
> + * for some other kind of fault that should really be passed to the
> + * guest, we'd end up in an infinite loop of retrying the faulting acces=
s.
> + */
> +bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
> +                                 uintptr_t host_pc, abi_ptr guest_addr)
> +{
> +    switch (page_unprotect(guest_addr, host_pc)) {
> +    case 0:
> +        /*
> +         * Fault not caused by a page marked unwritable to protect
> +         * cached translations, must be the guest binary's problem.
> +         */
> +        return false;
> +    case 1:
> +        /*
> +         * Fault caused by protection of cached translation; TBs
> +         * invalidated, so resume execution.  Retain helper_retaddr
> +         * for a possible second fault.
> +         */
> +        return true;
> +    case 2:
> +        /*
> +         * Fault caused by protection of cached translation, and the
> +         * currently executing TB was modified and must be exited
> +         * immediately.  Clear helper_retaddr for next execution.
> +         */
> +        cpu_exit_tb_from_sighandler(cpu, old_set);
> +        /* NORETURN */
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  /*
>   * 'pc' is the host PC at which the exception was raised.
>   * 'address' is the effective address of the memory exception.
> @@ -125,8 +173,9 @@ static inline int handle_cpu_signal(uintptr_t pc,
> siginfo_t *info,
>  {
>      CPUState *cpu =3D current_cpu;
>      CPUClass *cc;
> -    unsigned long address =3D (unsigned long)info->si_addr;
> +    unsigned long host_addr =3D (unsigned long)info->si_addr;
>      MMUAccessType access_type =3D adjust_signal_pc(&pc, is_write);
> +    abi_ptr guest_addr;
>
>      /* For synchronous signals we expect to be coming from the vCPU
>       * thread (so current_cpu should be valid) and either from running
> @@ -143,49 +192,21 @@ static inline int handle_cpu_signal(uintptr_t pc,
> siginfo_t *info,
>
>  #if defined(DEBUG_SIGNAL)
>      printf("qemu: SIGSEGV pc=3D0x%08lx address=3D%08lx w=3D%d oldset=3D0=
x%08lx\n",
> -           pc, address, is_write, *(unsigned long *)old_set);
> +           pc, host_addr, is_write, *(unsigned long *)old_set);
>  #endif
> -    /* XXX: locking issue */
> -    /* Note that it is important that we don't call page_unprotect()
> unless
> -     * this is really a "write to nonwriteable page" fault, because
> -     * page_unprotect() assumes that if it is called for an access to
> -     * a page that's writeable this means we had two threads racing and
> -     * another thread got there first and already made the page writeabl=
e;
> -     * so we will retry the access. If we were to call page_unprotect()
> -     * for some other kind of fault that should really be passed to the
> -     * guest, we'd end up in an infinite loop of retrying the faulting
> -     * access.
> -     */
> -    if (is_write && info->si_signo =3D=3D SIGSEGV && info->si_code =3D=
=3D
> SEGV_ACCERR &&
> -        h2g_valid(address)) {
> -        switch (page_unprotect(h2g(address), pc)) {
> -        case 0:
> -            /* Fault not caused by a page marked unwritable to protect
> -             * cached translations, must be the guest binary's problem.
> -             */
> -            break;
> -        case 1:
> -            /* Fault caused by protection of cached translation; TBs
> -             * invalidated, so resume execution.  Retain helper_retaddr
> -             * for a possible second fault.
> -             */
> -            return 1;
> -        case 2:
> -            /* Fault caused by protection of cached translation, and the
> -             * currently executing TB was modified and must be exited
> -             * immediately.  Clear helper_retaddr for next execution.
> -             */
> -            cpu_exit_tb_from_sighandler(cpu, old_set);
> -            /* NORETURN */
> -
> -        default:
> -            g_assert_not_reached();
> -        }
> -    }
>
>      /* Convert forcefully to guest address space, invalid addresses
>         are still valid segv ones */
> -    address =3D h2g_nocheck(address);
> +    guest_addr =3D h2g_nocheck(host_addr);
> +
> +    /* XXX: locking issue */
> +    if (is_write &&
> +        info->si_signo =3D=3D SIGSEGV &&
> +        info->si_code =3D=3D SEGV_ACCERR &&
> +        h2g_valid(host_addr) &&
> +        handle_sigsegv_accerr_write(cpu, old_set, pc, guest_addr)) {
> +        return 1;
> +    }
>
>      /*
>       * There is no way the target can handle this other than raising
> @@ -194,7 +215,7 @@ static inline int handle_cpu_signal(uintptr_t pc,
> siginfo_t *info,
>      sigprocmask(SIG_SETMASK, old_set, NULL);
>
>      cc =3D CPU_GET_CLASS(cpu);
> -    cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
> +    cc->tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
>                            MMU_USER_IDX, false, pc);
>      g_assert_not_reached();
>  }
> --
> 2.25.1
>
>

--000000000000555dcb05ce683ee5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:10 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">This is the major portion of handle_cpu_signal which is =
specific<br>
to tcg, handling the page protections for the translations.<br>
Most of the rest will migrate to linux-user/ shortly.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
v2: Pass guest address to handle_sigsegv_accerr_write.<br>
---<br>
=C2=A0include/exec/exec-all.h |=C2=A0 12 +++++<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 =C2=A0| 103 ++++++++++++++++++++++++-----=
-----------<br>
=C2=A02 files changed, 74 insertions(+), 41 deletions(-)<br></blockquote><d=
iv><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com">imp@bsdimp.com</a>&gt;</div></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h<br>
index e54f8e5d65..5f94d799aa 100644<br>
--- a/include/exec/exec-all.h<br>
+++ b/include/exec/exec-all.h<br>
@@ -673,6 +673,18 @@ static inline tb_page_addr_t get_page_addr_code_hostp(=
CPUArchState *env,<br>
=C2=A0 */<br>
=C2=A0MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);<br>
<br>
+/**<br>
+ * handle_sigsegv_accerr_write:<br>
+ * @cpu: the cpu context<br>
+ * @old_set: the sigset_t from the signal ucontext_t<br>
+ * @host_pc: the host pc, adjusted for the signal<br>
+ * @host_addr: the host address of the fault<br>
+ *<br>
+ * Return true if the write fault has been handled, and should be re-tried=
.<br>
+ */<br>
+bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t host_pc, abi_ptr gue=
st_addr);<br>
+<br>
=C2=A0/**<br>
=C2=A0 * cpu_signal_handler<br>
=C2=A0 * @signum: host signal number<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 3f3e793b7b..cb63e528c5 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -114,6 +114,54 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_=
write)<br>
=C2=A0 =C2=A0 =C2=A0return is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;<br>
=C2=A0}<br>
<br>
+/**<br>
+ * handle_sigsegv_accerr_write:<br>
+ * @cpu: the cpu context<br>
+ * @old_set: the sigset_t from the signal ucontext_t<br>
+ * @host_pc: the host pc, adjusted for the signal<br>
+ * @guest_addr: the guest address of the fault<br>
+ *<br>
+ * Return true if the write fault has been handled, and should be re-tried=
.<br>
+ *<br>
+ * Note that it is important that we don&#39;t call page_unprotect() unles=
s<br>
+ * this is really a &quot;write to nonwriteable page&quot; fault, because<=
br>
+ * page_unprotect() assumes that if it is called for an access to<br>
+ * a page that&#39;s writeable this means we had two threads racing and<br=
>
+ * another thread got there first and already made the page writeable;<br>
+ * so we will retry the access. If we were to call page_unprotect()<br>
+ * for some other kind of fault that should really be passed to the<br>
+ * guest, we&#39;d end up in an infinite loop of retrying the faulting acc=
ess.<br>
+ */<br>
+bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t host_pc, abi_ptr gue=
st_addr)<br>
+{<br>
+=C2=A0 =C2=A0 switch (page_unprotect(guest_addr, host_pc)) {<br>
+=C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fault not caused by a page marked unwr=
itable to protect<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* cached translations, must be the guest=
 binary&#39;s problem.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fault caused by protection of cached t=
ranslation; TBs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* invalidated, so resume execution.=C2=
=A0 Retain helper_retaddr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for a possible second fault.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fault caused by protection of cached t=
ranslation, and the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* currently executing TB was modified an=
d must be exited<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* immediately.=C2=A0 Clear helper_retadd=
r for next execution.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_exit_tb_from_sighandler(cpu, old_set);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* NORETURN */<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0/*<br>
=C2=A0 * &#39;pc&#39; is the host PC at which the exception was raised.<br>
=C2=A0 * &#39;address&#39; is the effective address of the memory exception=
.<br>
@@ -125,8 +173,9 @@ static inline int handle_cpu_signal(uintptr_t pc, sigin=
fo_t *info,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D current_cpu;<br>
=C2=A0 =C2=A0 =C2=A0CPUClass *cc;<br>
-=C2=A0 =C2=A0 unsigned long address =3D (unsigned long)info-&gt;si_addr;<b=
r>
+=C2=A0 =C2=A0 unsigned long host_addr =3D (unsigned long)info-&gt;si_addr;=
<br>
=C2=A0 =C2=A0 =C2=A0MMUAccessType access_type =3D adjust_signal_pc(&amp;pc,=
 is_write);<br>
+=C2=A0 =C2=A0 abi_ptr guest_addr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* For synchronous signals we expect to be coming from =
the vCPU<br>
=C2=A0 =C2=A0 =C2=A0 * thread (so current_cpu should be valid) and either f=
rom running<br>
@@ -143,49 +192,21 @@ static inline int handle_cpu_signal(uintptr_t pc, sig=
info_t *info,<br>
<br>
=C2=A0#if defined(DEBUG_SIGNAL)<br>
=C2=A0 =C2=A0 =C2=A0printf(&quot;qemu: SIGSEGV pc=3D0x%08lx address=3D%08lx=
 w=3D%d oldset=3D0x%08lx\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pc, address, is_write, *(unsigned=
 long *)old_set);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pc, host_addr, is_write, *(unsign=
ed long *)old_set);<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 /* XXX: locking issue */<br>
-=C2=A0 =C2=A0 /* Note that it is important that we don&#39;t call page_unp=
rotect() unless<br>
-=C2=A0 =C2=A0 =C2=A0* this is really a &quot;write to nonwriteable page&qu=
ot; fault, because<br>
-=C2=A0 =C2=A0 =C2=A0* page_unprotect() assumes that if it is called for an=
 access to<br>
-=C2=A0 =C2=A0 =C2=A0* a page that&#39;s writeable this means we had two th=
reads racing and<br>
-=C2=A0 =C2=A0 =C2=A0* another thread got there first and already made the =
page writeable;<br>
-=C2=A0 =C2=A0 =C2=A0* so we will retry the access. If we were to call page=
_unprotect()<br>
-=C2=A0 =C2=A0 =C2=A0* for some other kind of fault that should really be p=
assed to the<br>
-=C2=A0 =C2=A0 =C2=A0* guest, we&#39;d end up in an infinite loop of retryi=
ng the faulting<br>
-=C2=A0 =C2=A0 =C2=A0* access.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 if (is_write &amp;&amp; info-&gt;si_signo =3D=3D SIGSEGV &am=
p;&amp; info-&gt;si_code =3D=3D SEGV_ACCERR &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 h2g_valid(address)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (page_unprotect(h2g(address), pc)) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Fault not caused by a page ma=
rked unwritable to protect<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* cached translations, mus=
t be the guest binary&#39;s problem.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Fault caused by protection of=
 cached translation; TBs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* invalidated, so resume e=
xecution.=C2=A0 Retain helper_retaddr<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for a possible second fa=
ult.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Fault caused by protection of=
 cached translation, and the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* currently executing TB w=
as modified and must be exited<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* immediately.=C2=A0 Clear=
 helper_retaddr for next execution.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_exit_tb_from_sighandler(cpu,=
 old_set);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* NORETURN */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Convert forcefully to guest address space, invalid a=
ddresses<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 are still valid segv ones */<br>
-=C2=A0 =C2=A0 address =3D h2g_nocheck(address);<br>
+=C2=A0 =C2=A0 guest_addr =3D h2g_nocheck(host_addr);<br>
+<br>
+=C2=A0 =C2=A0 /* XXX: locking issue */<br>
+=C2=A0 =C2=A0 if (is_write &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;si_signo =3D=3D SIGSEGV &amp;&amp;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;si_code =3D=3D SEGV_ACCERR &amp;&amp;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h2g_valid(host_addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 handle_sigsegv_accerr_write(cpu, old_set, pc, =
guest_addr)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * There is no way the target can handle this other tha=
n raising<br>
@@ -194,7 +215,7 @@ static inline int handle_cpu_signal(uintptr_t pc, sigin=
fo_t *info,<br>
=C2=A0 =C2=A0 =C2=A0sigprocmask(SIG_SETMASK, old_set, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cc =3D CPU_GET_CLASS(cpu);<br>
-=C2=A0 =C2=A0 cc-&gt;tcg_ops-&gt;tlb_fill(cpu, address, 0, access_type,<br=
>
+=C2=A0 =C2=A0 cc-&gt;tcg_ops-&gt;tlb_fill(cpu, guest_addr, 0, access_type,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0MMU_USER_IDX, false, pc);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000555dcb05ce683ee5--

