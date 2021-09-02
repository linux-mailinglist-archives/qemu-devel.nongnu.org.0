Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A788C3FF4B5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:15:55 +0200 (CEST)
Received: from localhost ([::1]:47934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLt7p-0001Mm-Lm
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt6Q-0000VE-P6
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:14:26 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:40758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt6O-00056l-C5
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:14:26 -0400
Received: by mail-vs1-xe33.google.com with SMTP id d6so2604947vsr.7
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRrg+j6QaFlPIv+nFHKyzv4EuLGFfWoBrJtJQBerUOA=;
 b=AQ62zMGIe0eE2x9iMkuvuKHFOefq6RmwWI8gw6Rit0WZdZH8vaR8nRpso9sONHN1I7
 0QfL7Pm66TsAEVldPgg7gKqPFLVJujYS8mMQUgI93n2/hhQKbaMfHO0Qv4DC58bMPR0L
 vHMaa4HC1v3TBtpMIFGT3vwja3jjFlb6MQPn6toNqTxfJz5QT5z2hSaGC9Y981JCy0Ey
 NX/R/9jW2mz9df4sYY/sntqKpkQK8nS/X8U1Ng2zue4s6hcs4VQ4hrGaoOoP1gVfnoJb
 4jnYteac2ABpAfR8VEEgzCCNoYtpjSYsAPjYc6olmuUOr7HX9v66wuIYp5BZvgaueOnc
 d8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRrg+j6QaFlPIv+nFHKyzv4EuLGFfWoBrJtJQBerUOA=;
 b=t0M6Qm9jOURs7UHgsmBTFY3ldpFzoyqAv3M9c+Q8egUhPk/zKf6AeciqZBAAMjPOmW
 CBEv3Bk1AK6XdiLAglxRvr0B/F3vG04Is99NFLARtx0o9yDA89pjw39I9IKdVefaNrk0
 p/QrQEFIBXMfrUZ6dzW3Sx1sgcr6gw3AjCEVnYrpOgEdcGGaB1p389D1wK/ciZr+tgs/
 EQUO7GaolV8JRH3xMkx+urohjMBrU5VzSuu+TYjeT+BaBBSk0eMb5PrFmM8KJqD8FoE2
 UgOxXUTA8NMEEXmSmDlv1eTkf4v5gyQLU7I6/d4xv1tF2OBFe5HWyydmO7mVPy+y1CIz
 X1+w==
X-Gm-Message-State: AOAM53109JYKBsFEMLNp7VnR6/rU7SA6SvVrt9ncRG9wi3LOCsNd5MKU
 6Uwewcx2M5AaXL0yN55H+x1X/i6CXMFTwd+bMrbvLg==
X-Google-Smtp-Source: ABdhPJzpyp+gpw72fkLM9kt0rIbF/Cz6NAcQKxVp7RqCOFmso+/X1D1IE/faNY4Iwh3WeF7zQifQbp/0I9r63BMyrkQ=
X-Received: by 2002:a67:2dc6:: with SMTP id t189mr3875399vst.49.1630613663130; 
 Thu, 02 Sep 2021 13:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-5-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-5-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:14:12 -0600
Message-ID: <CANCZdfqatDMjqzy86AmvZSd9WEqDuXuiapcj1kJxWgfifKo-SQ@mail.gmail.com>
Subject: Re: [RFC PATCH 04/24] accel/tcg: Rename user-mode do_interrupt hack
 as fake_user_exception
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000002839f105cb08d4b4"
Received-SPF: none client-ip=2607:f8b0:4864:20::e33;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002839f105cb08d4b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> do_interrupt() is sysemu specific. However due to some X86
> specific hack, it is also used in user-mode emulation, which
> is why it couldn't be restricted to CONFIG_SOFTMMU (see the
> comment around added in commit 78271684719: "cpu: tcg_ops:
> move to tcg-cpu-ops.h, keep a pointer in CPUClass").
> Keep the hack but rename the handler as fake_user_exception()
> and restrict do_interrupt() to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> RFC: Any better name / idea here?
>

Maybe user_mode_exception()? but I'm not sure that's better...


> ---
>  include/hw/core/tcg-cpu-ops.h | 22 ++++++++++++++--------
>  accel/tcg/cpu-exec.c          |  4 ++--
>  target/i386/tcg/tcg-cpu.c     |  6 ++++--
>  3 files changed, 20 insertions(+), 12 deletions(-)
>


Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.=
h
> index eab27d0c030..600f0349659 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -37,14 +37,6 @@ struct TCGCPUOps {
>      void (*cpu_exec_exit)(CPUState *cpu);
>      /** @cpu_exec_interrupt: Callback for processing interrupts in
> cpu_exec */
>      bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
> -    /**
> -     * @do_interrupt: Callback for interrupt handling.
> -     *
> -     * note that this is in general SOFTMMU only, but it actually isn't
> -     * because of an x86 hack (accel/tcg/cpu-exec.c), so we cannot put i=
t
> -     * in the SOFTMMU section in general.
> -     */
> -    void (*do_interrupt)(CPUState *cpu);
>      /**
>       * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
>       *
> @@ -61,6 +53,20 @@ struct TCGCPUOps {
>      void (*debug_excp_handler)(CPUState *cpu);
>
>  #ifdef NEED_CPU_H
> +#if defined(CONFIG_USER_ONLY) && defined(TARGET_I386)
> +    /**
> +     * @fake_user_exception: Callback for 'fake exception' handling.
> +     *
> +     * Simulate 'fake exception' which will be handled outside the
> +     * cpu execution loop (hack for x86 user mode).
> +     */
> +    void (*fake_user_exception)(CPUState *cpu);
> +#else
> +    /**
> +     * @do_interrupt: Callback for interrupt handling.
> +     */
> +    void (*do_interrupt)(CPUState *cpu);
> +#endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
>  #ifdef CONFIG_SOFTMMU
>      /**
>       * @do_transaction_failed: Callback for handling failed memory
> transactions
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index e5c0ccd1a2a..3e387c944c5 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -651,8 +651,8 @@ static inline bool cpu_handle_exception(CPUState *cpu=
,
> int *ret)
>             loop */
>  #if defined(TARGET_I386)
>          CPUClass *cc =3D CPU_GET_CLASS(cpu);
> -        cc->tcg_ops->do_interrupt(cpu);
> -#endif
> +        cc->tcg_ops->fake_user_exception(cpu);
> +#endif /* TARGET_I386 */
>          *ret =3D cpu->exception_index;
>          cpu->exception_index =3D -1;
>          return true;
> diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
> index 93a79a57415..dce800a8953 100644
> --- a/target/i386/tcg/tcg-cpu.c
> +++ b/target/i386/tcg/tcg-cpu.c
> @@ -73,9 +73,11 @@ static const struct TCGCPUOps x86_tcg_ops =3D {
>      .cpu_exec_enter =3D x86_cpu_exec_enter,
>      .cpu_exec_exit =3D x86_cpu_exec_exit,
>      .cpu_exec_interrupt =3D x86_cpu_exec_interrupt,
> -    .do_interrupt =3D x86_cpu_do_interrupt,
>      .tlb_fill =3D x86_cpu_tlb_fill,
> -#ifndef CONFIG_USER_ONLY
> +#ifdef CONFIG_USER_ONLY
> +    .fake_user_exception =3D x86_cpu_do_interrupt,
> +#else
> +    .do_interrupt =3D x86_cpu_do_interrupt,
>      .debug_excp_handler =3D breakpoint_handler,
>      .debug_check_breakpoint =3D x86_debug_check_breakpoint,
>  #endif /* !CONFIG_USER_ONLY */
> --
> 2.31.1
>
>

--0000000000002839f105cb08d4b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:17 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>do_interrupt() is sysemu specific. However due to some X86<br>
specific hack, it is also used in user-mode emulation, which<br>
is why it couldn&#39;t be restricted to CONFIG_SOFTMMU (see the<br>
comment around added in commit 78271684719: &quot;cpu: tcg_ops:<br>
move to tcg-cpu-ops.h, keep a pointer in CPUClass&quot;).<br>
Keep the hack but rename the handler as fake_user_exception()<br>
and restrict do_interrupt() to sysemu.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
RFC: Any better name / idea here?<br></blockquote><div><br></div><div>Maybe=
 user_mode_exception()? but I&#39;m not sure that&#39;s better...</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/hw/core/tcg-cpu-ops.h | 22 ++++++++++++++--------<br>
=C2=A0accel/tcg/cpu-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--=
<br>
=C2=A0target/i386/tcg/tcg-cpu.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++--<br>
=C2=A03 files changed, 20 insertions(+), 12 deletions(-)<br></blockquote><d=
iv><br></div><div><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=
=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><d=
iv class=3D"gmail-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;w=
idth:22px;margin:2px 0px 0px"><br class=3D"gmail-Apple-interchange-newline"=
></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h<=
br>
index eab27d0c030..600f0349659 100644<br>
--- a/include/hw/core/tcg-cpu-ops.h<br>
+++ b/include/hw/core/tcg-cpu-ops.h<br>
@@ -37,14 +37,6 @@ struct TCGCPUOps {<br>
=C2=A0 =C2=A0 =C2=A0void (*cpu_exec_exit)(CPUState *cpu);<br>
=C2=A0 =C2=A0 =C2=A0/** @cpu_exec_interrupt: Callback for processing interr=
upts in cpu_exec */<br>
=C2=A0 =C2=A0 =C2=A0bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt=
_request);<br>
-=C2=A0 =C2=A0 /**<br>
-=C2=A0 =C2=A0 =C2=A0* @do_interrupt: Callback for interrupt handling.<br>
-=C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0* note that this is in general SOFTMMU only, but it ac=
tually isn&#39;t<br>
-=C2=A0 =C2=A0 =C2=A0* because of an x86 hack (accel/tcg/cpu-exec.c), so we=
 cannot put it<br>
-=C2=A0 =C2=A0 =C2=A0* in the SOFTMMU section in general.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 void (*do_interrupt)(CPUState *cpu);<br>
=C2=A0 =C2=A0 =C2=A0/**<br>
=C2=A0 =C2=A0 =C2=A0 * @tlb_fill: Handle a softmmu tlb miss or user-only ad=
dress fault<br>
=C2=A0 =C2=A0 =C2=A0 *<br>
@@ -61,6 +53,20 @@ struct TCGCPUOps {<br>
=C2=A0 =C2=A0 =C2=A0void (*debug_excp_handler)(CPUState *cpu);<br>
<br>
=C2=A0#ifdef NEED_CPU_H<br>
+#if defined(CONFIG_USER_ONLY) &amp;&amp; defined(TARGET_I386)<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* @fake_user_exception: Callback for &#39;fake excepti=
on&#39; handling.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* Simulate &#39;fake exception&#39; which will be hand=
led outside the<br>
+=C2=A0 =C2=A0 =C2=A0* cpu execution loop (hack for x86 user mode).<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 void (*fake_user_exception)(CPUState *cpu);<br>
+#else<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* @do_interrupt: Callback for interrupt handling.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 void (*do_interrupt)(CPUState *cpu);<br>
+#endif /* !CONFIG_USER_ONLY || !TARGET_I386 */<br>
=C2=A0#ifdef CONFIG_SOFTMMU<br>
=C2=A0 =C2=A0 =C2=A0/**<br>
=C2=A0 =C2=A0 =C2=A0 * @do_transaction_failed: Callback for handling failed=
 memory transactions<br>
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c<br>
index e5c0ccd1a2a..3e387c944c5 100644<br>
--- a/accel/tcg/cpu-exec.c<br>
+++ b/accel/tcg/cpu-exec.c<br>
@@ -651,8 +651,8 @@ static inline bool cpu_handle_exception(CPUState *cpu, =
int *ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loop */<br>
=C2=A0#if defined(TARGET_I386)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPUClass *cc =3D CPU_GET_CLASS(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cc-&gt;tcg_ops-&gt;do_interrupt(cpu);<br>
-#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cc-&gt;tcg_ops-&gt;fake_user_exception(cpu);<b=
r>
+#endif /* TARGET_I386 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ret =3D cpu-&gt;exception_index;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;exception_index =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c<br>
index 93a79a57415..dce800a8953 100644<br>
--- a/target/i386/tcg/tcg-cpu.c<br>
+++ b/target/i386/tcg/tcg-cpu.c<br>
@@ -73,9 +73,11 @@ static const struct TCGCPUOps x86_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_enter =3D x86_cpu_exec_enter,<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_exit =3D x86_cpu_exec_exit,<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_interrupt =3D x86_cpu_exec_interrupt,<br>
-=C2=A0 =C2=A0 .do_interrupt =3D x86_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D x86_cpu_tlb_fill,<br>
-#ifndef CONFIG_USER_ONLY<br>
+#ifdef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .fake_user_exception =3D x86_cpu_do_interrupt,<br>
+#else<br>
+=C2=A0 =C2=A0 .do_interrupt =3D x86_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.debug_excp_handler =3D breakpoint_handler,<br>
=C2=A0 =C2=A0 =C2=A0.debug_check_breakpoint =3D x86_debug_check_breakpoint,=
<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000002839f105cb08d4b4--

