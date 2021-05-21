Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F82338BCDA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 05:06:37 +0200 (CEST)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljvUi-0002Kj-Ms
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 23:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sendtozouxu@gmail.com>)
 id 1ljvT2-0000Ew-7E
 for qemu-devel@nongnu.org; Thu, 20 May 2021 23:04:53 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:38897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sendtozouxu@gmail.com>)
 id 1ljvSx-00079x-0b
 for qemu-devel@nongnu.org; Thu, 20 May 2021 23:04:51 -0400
Received: by mail-lj1-x22b.google.com with SMTP id a4so7437293ljd.5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 20:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=2RkPk10Iq+iNQnlQc6OL5escwaKFVWJzKbv0NQLUGOg=;
 b=tN7m8leRULskegI6lDDZoDduelOzCuW19Gjga41pV3amSKaMt3qzedwYDYpbfHRUrN
 vcetJJTIlk919uJVIq3zoGRzkWLVwB70qAm1rGW+ZHYIM3AKz+n/kE2mTteiXjdboqii
 iIbl2S+6hVw4cBagyN12TEBotd1+V1agZisbq/G+/NDUIh1VBJgUM6NiAvyYJvYG78Tc
 5oo8gjYG9KqzIByGQoFKwyz60Ii9LC8Dg0pePB6cwYoxAolCxC4hl4A62SAMduE+YlvY
 P3ezmkGYiqYnQf084MQuSgPz8iLsxFWzfcp+yqko7wBJryST8UFfMszXEeSgWT+RboMm
 uBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=2RkPk10Iq+iNQnlQc6OL5escwaKFVWJzKbv0NQLUGOg=;
 b=qFJMfmwi0YGPypNzucG2txBRUXN91OVP+VmpGmDP95it3VihqGgDumA5/ZweYXimJL
 k3J1uAWnTMbkK5nf5fUC5uXK55IfeqGXx2H2w9GIuCjhPRNa7amTqyQueqN4jCgFW9TC
 LzSnx/dwoxmSTOdDoAJwHFGlwwHb3AfIYSt4g8W6ZI55IdMBCivRsZFItoVceYLcC6sR
 aHqXIHBsVy0TDBHo9alVrNzlw1IOB1YZWn20afYYyB85Oc2Fgph2Ipv5CPyiP8XQVtuK
 idcDmqzpXS/ZH8JNZ+YJKudU69d8K/QG66uFl9h6fuLOgF5jgJbvIVdRsWIkSdeFdnvP
 I54Q==
X-Gm-Message-State: AOAM532wi2fOdOWN779VyQ2Rm4Do8+3pAKPloxzrRqu2fZQAF6sYPc2G
 QsLwWiqYe4WC8SwCg7D9dZgwX2LuKvCWdMH7ctx30DHJ
X-Google-Smtp-Source: ABdhPJzaqrd+n/2O8jW3zMqVu5/5OFSEHdH/MnCo44vv1r8/uZyLtWfuklkx7kKWhkcV121jnnZOcycksTWYfflAiM4=
X-Received: by 2002:a2e:9d90:: with SMTP id c16mr5248780ljj.193.1621566260127; 
 Thu, 20 May 2021 20:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8YQrXoOJNwfoutvh7BkYmqfdMtZ6eAQQ+uAjL27FuOK28cvg@mail.gmail.com>
In-Reply-To: <CAK8YQrXoOJNwfoutvh7BkYmqfdMtZ6eAQQ+uAjL27FuOK28cvg@mail.gmail.com>
From: =?UTF-8?B?6YK55pet?= <sendtozouxu@gmail.com>
Date: Fri, 21 May 2021 11:04:07 +0800
Message-ID: <CAK8YQrUHyV5FPZiRviN5amHurJ-gCP8_jb-DSB-XRit3WUfUeg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Handle EXCP10_COPR properly for i386
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ea2b2205c2ce50d8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=sendtozouxu@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ea2b2205c2ce50d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

=E9=82=B9=E6=97=AD <sendtozouxu@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=88=
14=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=885:23=E5=86=99=E9=81=93=EF=
=BC=9A

> From e805b793f7d4b3e8c37d540b7d6cc0c6ac682311 Mon Sep 17 00:00:00 2001
> From: Xu Zou <sendtozouxu@gmail.com>
> Date: Fri, 14 May 2021 15:55:07 +0800
> Subject: [PATCH] linux-user: Handle EXCP10_COPR properly for i386
>
> Handle EXCP10_COPR properly for i386 in cpu loop.
>
> NE flag is set to select native mode for handling floating-point
> exceptions. FWAIT instruction can raise EXCP10_COPR exception by using
> fpu_raise_exception() function.
>
> The code is based on kernel's function fpu__exception_code() in
> arch/x86/kernel/fpu/core.c.
>
> Signed-off-by: Xu Zou <sendtozouxu@gmail.com>
> ---
>  linux-user/i386/cpu_loop.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index f813e87294..e1f2911554 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -199,6 +199,8 @@ void cpu_loop(CPUX86State *env)
>  {
>      CPUState *cs =3D env_cpu(env);
>      int trapnr;
> +    int si_code;
> +    uint8_t status;
>      abi_ulong pc;
>      abi_ulong ret;
>
> @@ -315,6 +317,28 @@ void cpu_loop(CPUX86State *env)
>          case EXCP_ATOMIC:
>              cpu_exec_step_atomic(cs);
>              break;
> +        case EXCP10_COPR:
> +            si_code =3D 0;
> +            status =3D env->fp_status.float_exception_flags;
> +            if (status & float_flag_invalid) {
> +                si_code =3D TARGET_FPE_FLTINV;
> +            }
> +            if (status & float_flag_divbyzero) {
> +                si_code =3D TARGET_FPE_FLTDIV;
> +            }
> +            if (status & float_flag_overflow) {
> +                si_code =3D TARGET_FPE_FLTOVF;
> +            }
> +            if ((status & float_flag_underflow) ||
> +                (status & float_flag_input_denormal) ||
> +                (status & float_flag_output_denormal)) {
> +                si_code =3D TARGET_FPE_FLTUND;
> +            }
> +            if (status & float_flag_inexact) {
> +                si_code =3D TARGET_FPE_FLTRES;
> +            }
> +            gen_signal(env, TARGET_SIGFPE, si_code, env->eip);
> +            break;
>          default:
>              pc =3D env->segs[R_CS].base + env->eip;
>              EXCP_DUMP(env, "qemu: 0x%08lx: unhandled CPU exception 0x%x =
-
> aborting\n",
> @@ -327,7 +351,7 @@ void cpu_loop(CPUX86State *env)
>
>  void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs=
)
>  {
> -    env->cr[0] =3D CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
> +    env->cr[0] =3D CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK | CR0_NE_MASK=
;
>      env->hflags |=3D HF_PE_MASK | HF_CPL_MASK;
>      if (env->features[FEAT_1_EDX] & CPUID_SSE) {
>          env->cr[4] |=3D CR4_OSFXSR_MASK;
> --
> 2.25.1
>
>

--000000000000ea2b2205c2ce50d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=E9=82=B9=E6=97=AD &lt;<a href=3D"mailto:sendtozouxu@g=
mail.com">sendtozouxu@gmail.com</a>&gt; =E4=BA=8E2021=E5=B9=B45=E6=9C=8814=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=885:23=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr">From e805b793f7d4b3e8c37d540b7d6cc0c6ac682311 Mon Sep 17 00:00:00 2001=
<br>From: Xu Zou &lt;<a href=3D"mailto:sendtozouxu@gmail.com" target=3D"_bl=
ank">sendtozouxu@gmail.com</a>&gt;<br>Date: Fri, 14 May 2021 15:55:07 +0800=
<br>Subject: [PATCH] linux-user: Handle EXCP10_COPR properly for i386<br><b=
r>Handle EXCP10_COPR properly for i386 in cpu loop.<br><br>NE flag is set t=
o select native mode for handling floating-point<br>exceptions. FWAIT instr=
uction can raise EXCP10_COPR exception by using<br>fpu_raise_exception() fu=
nction.<br><br>The code is based on kernel&#39;s function fpu__exception_co=
de() in<br>arch/x86/kernel/fpu/core.c.<br><br>Signed-off-by: Xu Zou &lt;<a =
href=3D"mailto:sendtozouxu@gmail.com" target=3D"_blank">sendtozouxu@gmail.c=
om</a>&gt;<br>---<br>=C2=A0linux-user/i386/cpu_loop.c | 26 ++++++++++++++++=
+++++++++-<br>=C2=A01 file changed, 25 insertions(+), 1 deletion(-)<br><br>=
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c<br>ind=
ex f813e87294..e1f2911554 100644<br>--- a/linux-user/i386/cpu_loop.c<br>+++=
 b/linux-user/i386/cpu_loop.c<br>@@ -199,6 +199,8 @@ void cpu_loop(CPUX86St=
ate *env)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<=
br>=C2=A0 =C2=A0 =C2=A0int trapnr;<br>+ =C2=A0 =C2=A0int si_code;<br>+ =C2=
=A0 =C2=A0uint8_t status;<br>=C2=A0 =C2=A0 =C2=A0abi_ulong pc;<br>=C2=A0 =
=C2=A0 =C2=A0abi_ulong ret;<br>=C2=A0<br>@@ -315,6 +317,28 @@ void cpu_loop=
(CPUX86State *env)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_ATOMIC:<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_exec_step_atomic(cs);=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0case EXCP10_COPR:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0si_code =3D 0;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =
=3D env-&gt;fp_status.float_exception_flags;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (status &amp; float_flag_invalid) {<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D TARGET_FPE_FLTINV;<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (status &amp; float_flag_divbyzero) {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D TARGET_FPE_FLTDIV;=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (status &amp; float_flag_overflow) {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D TARGET_FPE_FLTOVF;=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if ((status &amp; float_flag_underflow) ||<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status &amp; float_flag_in=
put_denormal) ||<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(status &amp; float_flag_output_denormal)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D TARGET_FPE_FLTUND;<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (status &amp; float_flag_inexact) {<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D TARGET_FPE_FLTRES;<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0gen_signal(env, TARGET_SIGFPE, si_code, env-&gt;eip);<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0default:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pc =
=3D env-&gt;segs[R_CS].base + env-&gt;eip;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0EXCP_DUMP(env, &quot;qemu: 0x%08lx: unhandled CPU excep=
tion 0x%x - aborting\n&quot;,<br>@@ -327,7 +351,7 @@ void cpu_loop(CPUX86St=
ate *env)<br>=C2=A0<br>=C2=A0void target_cpu_copy_regs(CPUArchState *env, s=
truct target_pt_regs *regs)<br>=C2=A0{<br>- =C2=A0 =C2=A0env-&gt;cr[0] =3D =
CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;<br>+ =C2=A0 =C2=A0env-&gt;cr[0] =
=3D CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK | CR0_NE_MASK;<br>=C2=A0 =C2=A0=
 =C2=A0env-&gt;hflags |=3D HF_PE_MASK | HF_CPL_MASK;<br>=C2=A0 =C2=A0 =C2=
=A0if (env-&gt;features[FEAT_1_EDX] &amp; CPUID_SSE) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0env-&gt;cr[4] |=3D CR4_OSFXSR_MASK;<br>-- <br>2.25.1<br><b=
r></div>
</blockquote></div>

--000000000000ea2b2205c2ce50d8--

