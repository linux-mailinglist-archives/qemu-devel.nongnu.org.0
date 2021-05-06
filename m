Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482BF37598C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:42:02 +0200 (CEST)
Received: from localhost ([::1]:43554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lei0f-0007Br-5O
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lehuN-0004Eh-7Z
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:35:31 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lehuC-0004yf-1V
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:35:30 -0400
Received: by mail-qv1-xf31.google.com with SMTP id r13so3475312qvm.7
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2+DjL+cT44WSr4FAAD5u41dJzyCCdwWqdFKHFtwUIVI=;
 b=p5PnNque480vImexhoGXTlI3fr3tKWxeIP12AnYlhumXO76ndrxhRJCEGE6SZVJMB5
 pPAXW3dGAyWph9CBYauD/t+UtgMo6yCK2qQd3fqMqgjtEwrs7QP94lH5XZAJtp7yn43Z
 VtcPxVIaRci4Jo7GqnalMN5JhCJPCaPhPnRKKct8WnR4OpNzSJUOxXERlFnhQCm9ptBb
 Fw9TMOd7n2fr7aj1/1I0WBgsM7GvFqWqpatxT2YijHo0J+8l561aaI95OwRAbcX0H7Vn
 JSKN06FMfJTcM4psxHzYYlW8iFXRedn2sPbYuO/Lexgm+4DI8uDGJK/122FTzziuKoiM
 aBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2+DjL+cT44WSr4FAAD5u41dJzyCCdwWqdFKHFtwUIVI=;
 b=Vc2jAa0rIeLyhmSeslovJJTUpFz0wQKbcXkr08AvDb5hMhKAUbC1jxVElw3D+bW5i/
 JPCxq1fZaMRBHLY6X7eqUcCMmzJc8Chf+CLu2Qd+hlQlfj5nmL3j9Xl+S9mv45QjBRpW
 hovd/+9evO5M777e+RmAJmDwefmn1GmolIsmScLzgZkDr0dLh16/apbsz8q3c2DLi8mR
 RLG0qpH+jFsMIx8DgPYoS/Gs8aMG1Ji5XRJyrCmJX8uPnPWYbeBsf0/2poRSGY4wOf1H
 iTwIrtmhq8kxVQi0LUWdbtqFZs4LUKpzCZ+YPBsUlmpjuSF0D1P32vdaJXScjM0kHL7X
 lQ1A==
X-Gm-Message-State: AOAM532O0TW0EKjRw5JSFxcZrh3jo/mSvBhTI8NReAUkdQX7cucJSsT0
 EJ0h7hffcZKAiN/8DPYDjR9SmeT8PjKvfioy2D6FqSScmAFVMg==
X-Google-Smtp-Source: ABdhPJxb8W6ixmbkYcj+Dym73BDEjeF8xpaxHQ8fhJ2rJHy2D6WA/rGBEAsHHNC7cqyDK8qVicPoVHt9bRS3gF+J/c4=
X-Received: by 2002:a05:6214:51:: with SMTP id
 c17mr5847061qvr.29.1620322518065; 
 Thu, 06 May 2021 10:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210506164250.72433-1-imp@bsdimp.com>
In-Reply-To: <20210506164250.72433-1-imp@bsdimp.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 11:35:06 -0600
Message-ID: <CANCZdfr624Vk1eXLhWsxwYuh7Tmjw0aYFzP+4tzh9URJjU8YMA@mail.gmail.com>
Subject: Re: [PATCH] tcg: Use correct trap number for page faults on *BSD
 systems
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000001c7ffc05c1acbc6d"
Received-SPF: none client-ip=2607:f8b0:4864:20::f31;
 envelope-from=wlosh@bsdimp.com; helo=mail-qv1-xf31.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Johnston <markj@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Juergen Lock <nox@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001c7ffc05c1acbc6d
Content-Type: text/plain; charset="UTF-8"

On Thu, May 6, 2021 at 10:43 AM Warner Losh <imp@bsdimp.com> wrote:

> The trap number for a page fault on BSD systems is T_PAGEFLT not 0xe. 0xe
> is
> used by Linux and represents the intel hardware trap vector. The BSD
> kernels,
> however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14, etc
> fault
> handlers. This is true for i386 and x86_64, though the name of the trap
> hanlder
> can very on the flavor of BSD. As far as I can tell, Linux doesn't provide
> a
>

I've been burned by git's # comments in the commit message. This is missing
a line:

#define for this value. Invent a new one and use it instead to


> avoid uglier #ifdefs.
>

I'll amend and resend.


> Signed-off-by: Mark Johnston <markj@FreeBSD.org>
> Signed-off-by: Juergen Lock <nox@FreeBSD.org>
> [ Rework to avoid ifdefs and expand it to i386 ]
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  accel/tcg/user-exec.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 0d8cc27b21..959fec1257 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -260,6 +260,7 @@ void *probe_access(CPUArchState *env, target_ulong
> addr, int size,
>  #define TRAP_sig(context)    ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
>  #define ERROR_sig(context)   ((context)->uc_mcontext.__gregs[_REG_ERR])
>  #define MASK_sig(context)    ((context)->uc_sigmask)
> +#define PAGE_FAULT_TRAP      T_PAGEFLT
>  #elif defined(__FreeBSD__) || defined(__DragonFly__)
>  #include <ucontext.h>
>
> @@ -267,16 +268,19 @@ void *probe_access(CPUArchState *env, target_ulong
> addr, int size,
>  #define TRAP_sig(context)    ((context)->uc_mcontext.mc_trapno)
>  #define ERROR_sig(context)   ((context)->uc_mcontext.mc_err)
>  #define MASK_sig(context)    ((context)->uc_sigmask)
> +#define PAGE_FAULT_TRAP      T_PAGEFLT
>  #elif defined(__OpenBSD__)
>  #define EIP_sig(context)     ((context)->sc_eip)
>  #define TRAP_sig(context)    ((context)->sc_trapno)
>  #define ERROR_sig(context)   ((context)->sc_err)
>  #define MASK_sig(context)    ((context)->sc_mask)
> +#define PAGE_FAULT_TRAP      T_PAGEFLT
>  #else
>  #define EIP_sig(context)     ((context)->uc_mcontext.gregs[REG_EIP])
>  #define TRAP_sig(context)    ((context)->uc_mcontext.gregs[REG_TRAPNO])
>  #define ERROR_sig(context)   ((context)->uc_mcontext.gregs[REG_ERR])
>  #define MASK_sig(context)    ((context)->uc_sigmask)
> +#define PAGE_FAULT_TRAP      0xe
>  #endif
>
>  int cpu_signal_handler(int host_signum, void *pinfo,
> @@ -302,7 +306,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>      pc = EIP_sig(uc);
>      trapno = TRAP_sig(uc);
>      return handle_cpu_signal(pc, info,
> -                             trapno == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
> +                             trapno == PAGE_FAULT_TRAP ?
> +                             (ERROR_sig(uc) >> 1) & 1 : 0,
>                               &MASK_sig(uc));
>  }
>
> @@ -313,11 +318,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>  #define TRAP_sig(context)
>  ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
>  #define ERROR_sig(context)    ((context)->uc_mcontext.__gregs[_REG_ERR])
>  #define MASK_sig(context)     ((context)->uc_sigmask)
> +#define PAGE_FAULT_TRAP       T_PAGEFLT
>  #elif defined(__OpenBSD__)
>  #define PC_sig(context)       ((context)->sc_rip)
>  #define TRAP_sig(context)     ((context)->sc_trapno)
>  #define ERROR_sig(context)    ((context)->sc_err)
>  #define MASK_sig(context)     ((context)->sc_mask)
> +#define PAGE_FAULT_TRAP       T_PAGEFLT
>  #elif defined(__FreeBSD__) || defined(__DragonFly__)
>  #include <ucontext.h>
>
> @@ -325,11 +332,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>  #define TRAP_sig(context)     ((context)->uc_mcontext.mc_trapno)
>  #define ERROR_sig(context)    ((context)->uc_mcontext.mc_err)
>  #define MASK_sig(context)     ((context)->uc_sigmask)
> +#define PAGE_FAULT_TRAP       T_PAGEFLT
>  #else
>  #define PC_sig(context)       ((context)->uc_mcontext.gregs[REG_RIP])
>  #define TRAP_sig(context)     ((context)->uc_mcontext.gregs[REG_TRAPNO])
>  #define ERROR_sig(context)    ((context)->uc_mcontext.gregs[REG_ERR])
>  #define MASK_sig(context)     ((context)->uc_sigmask)
> +#define PAGE_FAULT_TRAP       0xe
>  #endif
>
>  int cpu_signal_handler(int host_signum, void *pinfo,
> @@ -347,7 +356,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>
>      pc = PC_sig(uc);
>      return handle_cpu_signal(pc, info,
> -                             TRAP_sig(uc) == 0xe ? (ERROR_sig(uc) >> 1) &
> 1 : 0,
> +                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
> +                             (ERROR_sig(uc) >> 1) & 1 : 0,
>                               &MASK_sig(uc));
>  }
>
> --
> 2.22.1
>
>

--0000000000001c7ffc05c1acbc6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 10:43 AM Warne=
r Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">The trap number =
for a page fault on BSD systems is T_PAGEFLT not 0xe. 0xe is<br>
used by Linux and represents the intel hardware trap vector. The BSD kernel=
s,<br>
however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14, etc =
fault<br>
handlers. This is true for i386 and x86_64, though the name of the trap han=
lder<br>
can very on the flavor of BSD. As far as I can tell, Linux doesn&#39;t prov=
ide a<br></blockquote><div><br></div><div>I&#39;ve been burned by git&#39;s=
 # comments in the commit message. This is missing a line:</div><div><br></=
div><div>#define for this value. Invent a new one and use it instead to</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
avoid uglier #ifdefs.<br></blockquote><div><br></div><div>I&#39;ll amend an=
d resend.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
Signed-off-by: Mark Johnston &lt;markj@FreeBSD.org&gt;<br>
Signed-off-by: Juergen Lock &lt;nox@FreeBSD.org&gt;<br>
[ Rework to avoid ifdefs and expand it to i386 ]<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
---<br>
=C2=A0accel/tcg/user-exec.c | 14 ++++++++++++--<br>
=C2=A01 file changed, 12 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 0d8cc27b21..959fec1257 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -260,6 +260,7 @@ void *probe_access(CPUArchState *env, target_ulong addr=
, int size,<br>
=C2=A0#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.__g=
regs[_REG_TRAPNO])<br>
=C2=A0#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;uc_mcontext.__g=
regs[_REG_ERR])<br>
=C2=A0#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_sigmask)<br>
+#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 T_PAGEFLT<br>
=C2=A0#elif defined(__FreeBSD__) || defined(__DragonFly__)<br>
=C2=A0#include &lt;ucontext.h&gt;<br>
<br>
@@ -267,16 +268,19 @@ void *probe_access(CPUArchState *env, target_ulong ad=
dr, int size,<br>
=C2=A0#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.mc_=
trapno)<br>
=C2=A0#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;uc_mcontext.mc_=
err)<br>
=C2=A0#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_sigmask)<br>
+#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 T_PAGEFLT<br>
=C2=A0#elif defined(__OpenBSD__)<br>
=C2=A0#define EIP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_eip)<br=
>
=C2=A0#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;sc_trapno)<br>
=C2=A0#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;sc_err)<br>
=C2=A0#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;sc_mask)<br>
+#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 T_PAGEFLT<br>
=C2=A0#else<br>
=C2=A0#define EIP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontex=
t.gregs[REG_EIP])<br>
=C2=A0#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.gre=
gs[REG_TRAPNO])<br>
=C2=A0#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;uc_mcontext.gre=
gs[REG_ERR])<br>
=C2=A0#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_sigmask)<br>
+#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 0xe<br>
=C2=A0#endif<br>
<br>
=C2=A0int cpu_signal_handler(int host_signum, void *pinfo,<br>
@@ -302,7 +306,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,<br=
>
=C2=A0 =C2=A0 =C2=A0pc =3D EIP_sig(uc);<br>
=C2=A0 =C2=A0 =C2=A0trapno =3D TRAP_sig(uc);<br>
=C2=A0 =C2=A0 =C2=A0return handle_cpu_signal(pc, info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trapno =3D=3D 0xe ? (ERROR_sig(uc) &gt;&gt; =
1) &amp; 1 : 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trapno =3D=3D PAGE_FAULT_TRAP ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ERROR_sig(uc) &gt;&gt; 1) &amp; 1 : 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;MASK_sig(uc));<br>
=C2=A0}<br>
<br>
@@ -313,11 +318,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,<=
br>
=C2=A0#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mconte=
xt.__gregs[_REG_TRAPNO])<br>
=C2=A0#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.__=
gregs[_REG_ERR])<br>
=C2=A0#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_sigmas=
k)<br>
+#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A0T_PAGEFLT<br>
=C2=A0#elif defined(__OpenBSD__)<br>
=C2=A0#define PC_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_r=
ip)<br>
=C2=A0#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_trapno=
)<br>
=C2=A0#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;sc_err)<br>
=C2=A0#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_mask)<=
br>
+#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A0T_PAGEFLT<br>
=C2=A0#elif defined(__FreeBSD__) || defined(__DragonFly__)<br>
=C2=A0#include &lt;ucontext.h&gt;<br>
<br>
@@ -325,11 +332,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,<=
br>
=C2=A0#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mconte=
xt.mc_trapno)<br>
=C2=A0#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.mc=
_err)<br>
=C2=A0#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_sigmas=
k)<br>
+#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A0T_PAGEFLT<br>
=C2=A0#else<br>
=C2=A0#define PC_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_m=
context.gregs[REG_RIP])<br>
=C2=A0#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mconte=
xt.gregs[REG_TRAPNO])<br>
=C2=A0#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.gr=
egs[REG_ERR])<br>
=C2=A0#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_sigmas=
k)<br>
+#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A00xe<br>
=C2=A0#endif<br>
<br>
=C2=A0int cpu_signal_handler(int host_signum, void *pinfo,<br>
@@ -347,7 +356,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0pc =3D PC_sig(uc);<br>
=C2=A0 =C2=A0 =C2=A0return handle_cpu_signal(pc, info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TRAP_sig(uc) =3D=3D 0xe ? (ERROR_sig(uc) &gt=
;&gt; 1) &amp; 1 : 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TRAP_sig(uc) =3D=3D PAGE_FAULT_TRAP ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ERROR_sig(uc) &gt;&gt; 1) &amp; 1 : 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;MASK_sig(uc));<br>
=C2=A0}<br>
<br>
-- <br>
2.22.1<br>
<br>
</blockquote></div></div>

--0000000000001c7ffc05c1acbc6d--

