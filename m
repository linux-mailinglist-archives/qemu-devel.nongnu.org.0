Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E421042FB17
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:34:54 +0200 (CEST)
Received: from localhost ([::1]:47474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbS2g-0002Eu-0H
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRyC-0007Br-2Q
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:30:17 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:34478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRy9-0006D6-Ck
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:30:15 -0400
Received: by mail-ua1-x931.google.com with SMTP id h4so19881355uaw.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vxbURIMvR+GA8W4dXnfyTO5nyoCdZQv+IBd4s1NJRMY=;
 b=gHZSf6avEePO67EKOotb7VtHNz3L+U3Fj984cCk/E0DRRtPQsvRrrH/f1y1PSKBTvS
 5oNlq65j38eNeH2y19m/OcSdKh0VMGDSDrFjnv8gdlz2fW3701hDu2BWnCDJuTUQyHA2
 fGVA7D/6XO+rhQ5fCqUhvroZK1qe3ROC+6hkfBM4O7HCwBdFbee1GB9NRBOJ4zs+bYiO
 6f63njE/QgrQthssdd/LDzz1PV9z72LCKitRw4tWmZi8Yt1MBC6CeKWyMREzusJFF4xc
 +Mr6/VwyO7Ye8FITqI3lthqIljyjaz+RIT6JwZ9oD6deFGhYqQ2UhKJcJi8HRo5BtH6r
 quQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vxbURIMvR+GA8W4dXnfyTO5nyoCdZQv+IBd4s1NJRMY=;
 b=RQHLYGwSAFejiuoU8b3hHjZw7m0XsCqy6oUt4d7/PdlPALeA7wlxmr9+QnxihUwO1P
 TcxrpKTqqj0cqzUzTCAXhiTiaNYwFZeC44nEA+ldI/X+uiHKhXju0bBRBIaCgkLfNuqc
 l30AnB5tK7IdnyuDZrHKa35JHeSbimmue/1lTFVESzXcFb9gaPzLsWJwHC82O1f6qf/9
 HV1Vk61h4qQLXc7Fw9ryDeYed0VSc1z29zcuhhJC+HenVQirYRWQzcBAzyTQ2gB5HXQK
 7CTsXw/lA3v/rO/2SGroXUAzOJcANy4W24P+gXpOVpTOdW0XRCYinUk4vmS2cDC/DxeH
 4iOw==
X-Gm-Message-State: AOAM531Hzq+ptDzBtzYnc6A0NXM605rbOWkHwW0Fas2zEnxkBIV7bhr0
 J7OroGTs5TcBI/Pefn13lB6Z46ap6Crgai1B1kmoIQ==
X-Google-Smtp-Source: ABdhPJwxH5tYl8OysESNDnk4WViAv4vj/DIyKx3v4qn6Ictm7hxnQKXB0eOS/hug/mWixG5vT6WdhfcaTJFuDJ6l9IU=
X-Received: by 2002:a67:c903:: with SMTP id w3mr15952215vsk.6.1634322612206;
 Fri, 15 Oct 2021 11:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-11-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-11-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:30:01 -0600
Message-ID: <CANCZdfqzBnpdeyJ1CYVrtDX=e1zQCumaOfoAeS-AXTmt27E+7A@mail.gmail.com>
Subject: Re: [PATCH v5 10/67] linux-user/host/sparc: Populate host_signal.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bfd0b705ce68622d"
Received-SPF: none client-ip=2607:f8b0:4864:20::931;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x931.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bfd0b705ce68622d
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Split host_signal_pc and host_signal_write out of user-exec.c.
> Drop the *BSD code, to be re-created under bsd-user/ later.
> Drop the Solaris code as completely unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/sparc/host-signal.h   | 54 ++++++++++++++++++++++-
>  linux-user/host/sparc64/host-signal.h |  2 +-
>  accel/tcg/user-exec.c                 | 62 +--------------------------
>  3 files changed, 55 insertions(+), 63 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

FreeBSD has dropped sparc64, but NetBSD/OpenBSD have not. There's
a number of issues with bsd-user on {Net,Open}BSD which this does
exacerbate,
but just noting it should suffice since those issues are much bigger deals.

Warner


> diff --git a/linux-user/host/sparc/host-signal.h
> b/linux-user/host/sparc/host-signal.h
> index f4b4d65031..232943a1db 100644
> --- a/linux-user/host/sparc/host-signal.h
> +++ b/linux-user/host/sparc/host-signal.h
> @@ -1 +1,53 @@
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
> +#ifndef SPARC_HOST_SIGNAL_H
> +#define SPARC_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +#ifdef __arch64__
> +    return uc->uc_mcontext.mc_gregs[MC_PC];
> +#else
> +    return uc->uc_mcontext.gregs[REG_PC];
> +#endif
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
> +
> +    if ((insn >> 30) == 3) {
> +        switch ((insn >> 19) & 0x3f) {
> +        case 0x05: /* stb */
> +        case 0x15: /* stba */
> +        case 0x06: /* sth */
> +        case 0x16: /* stha */
> +        case 0x04: /* st */
> +        case 0x14: /* sta */
> +        case 0x07: /* std */
> +        case 0x17: /* stda */
> +        case 0x0e: /* stx */
> +        case 0x1e: /* stxa */
> +        case 0x24: /* stf */
> +        case 0x34: /* stfa */
> +        case 0x27: /* stdf */
> +        case 0x37: /* stdfa */
> +        case 0x26: /* stqf */
> +        case 0x36: /* stqfa */
> +        case 0x25: /* stfsr */
> +        case 0x3c: /* casa */
> +        case 0x3e: /* casxa */
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +#endif
> diff --git a/linux-user/host/sparc64/host-signal.h
> b/linux-user/host/sparc64/host-signal.h
> index f4b4d65031..1191fe2d40 100644
> --- a/linux-user/host/sparc64/host-signal.h
> +++ b/linux-user/host/sparc64/host-signal.h
> @@ -1 +1 @@
> -#define HOST_SIGNAL_PLACEHOLDER
> +#include "../sparc/host-signal.h"
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 0db3c5cf3c..17fe867aeb 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -255,67 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong
> addr, int size,
>      return size ? g2h(env_cpu(env), addr) : NULL;
>  }
>
> -#if defined(__sparc__)
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    int is_write;
> -    uint32_t insn;
> -#if !defined(__arch64__) || defined(CONFIG_SOLARIS)
> -    uint32_t *regs = (uint32_t *)(info + 1);
> -    void *sigmask = (regs + 20);
> -    /* XXX: is there a standard glibc define ? */
> -    unsigned long pc = regs[1];
> -#else
> -#ifdef __linux__
> -    struct sigcontext *sc = puc;
> -    unsigned long pc = sc->sigc_regs.tpc;
> -    void *sigmask = (void *)sc->sigc_mask;
> -#elif defined(__OpenBSD__)
> -    struct sigcontext *uc = puc;
> -    unsigned long pc = uc->sc_pc;
> -    void *sigmask = (void *)(long)uc->sc_mask;
> -#elif defined(__NetBSD__)
> -    ucontext_t *uc = puc;
> -    unsigned long pc = _UC_MACHINE_PC(uc);
> -    void *sigmask = (void *)&uc->uc_sigmask;
> -#endif
> -#endif
> -
> -    /* XXX: need kernel patch to get write flag faster */
> -    is_write = 0;
> -    insn = *(uint32_t *)pc;
> -    if ((insn >> 30) == 3) {
> -        switch ((insn >> 19) & 0x3f) {
> -        case 0x05: /* stb */
> -        case 0x15: /* stba */
> -        case 0x06: /* sth */
> -        case 0x16: /* stha */
> -        case 0x04: /* st */
> -        case 0x14: /* sta */
> -        case 0x07: /* std */
> -        case 0x17: /* stda */
> -        case 0x0e: /* stx */
> -        case 0x1e: /* stxa */
> -        case 0x24: /* stf */
> -        case 0x34: /* stfa */
> -        case 0x27: /* stdf */
> -        case 0x37: /* stdfa */
> -        case 0x26: /* stqf */
> -        case 0x36: /* stqfa */
> -        case 0x25: /* stfsr */
> -        case 0x3c: /* casa */
> -        case 0x3e: /* casxa */
> -            is_write = 1;
> -            break;
> -        }
> -    }
> -    return handle_cpu_signal(pc, info, is_write, sigmask);
> -}
> -
> -#elif defined(__arm__)
> +#if defined(__arm__)
>
>  #if defined(__NetBSD__)
>  #include <ucontext.h>
> --
> 2.25.1
>
>

--000000000000bfd0b705ce68622d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:11 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Split host_signal_pc and host_signal_write out of user-e=
xec.c.<br>
Drop the *BSD code, to be re-created under bsd-user/ later.<br>
Drop the Solaris code as completely unused.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/host/sparc/host-signal.h=C2=A0 =C2=A0| 54 ++++++++++++++++=
++++++-<br>
=C2=A0linux-user/host/sparc64/host-signal.h |=C2=A0 2 +-<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 62 +--------------------------<br>
=C2=A03 files changed, 55 insertions(+), 63 deletions(-)<br></blockquote><d=
iv><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com">imp@bsdimp.com</a>&gt;</div><br class=3D"gmail-Apple-interchange=
-newline"></div><div>FreeBSD has dropped sparc64, but NetBSD/OpenBSD have n=
ot. There&#39;s</div><div>a number of issues with bsd-user on {Net,Open}BSD=
 which this does exacerbate,</div><div>but just noting it should suffice si=
nce those issues are much bigger deals.</div><div><br></div><div>Warner</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/host/sparc/ho=
st-signal.h<br>
index f4b4d65031..232943a1db 100644<br>
--- a/linux-user/host/sparc/host-signal.h<br>
+++ b/linux-user/host/sparc/host-signal.h<br>
@@ -1 +1,53 @@<br>
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
+#ifndef SPARC_HOST_SIGNAL_H<br>
+#define SPARC_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+#ifdef __arch64__<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.mc_gregs[MC_PC];<br>
+#else<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[REG_PC];<br>
+#endif<br>
+}<br>
+<br>
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t insn =3D *(uint32_t *)host_signal_pc(uc);<br>
+<br>
+=C2=A0 =C2=A0 if ((insn &gt;&gt; 30) =3D=3D 3) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch ((insn &gt;&gt; 19) &amp; 0x3f) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x05: /* stb */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x15: /* stba */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x06: /* sth */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x16: /* stha */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x04: /* st */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x14: /* sta */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x07: /* std */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x17: /* stda */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x0e: /* stx */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x1e: /* stxa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x24: /* stf */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x34: /* stfa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x27: /* stdf */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x37: /* stdfa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x26: /* stqf */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x36: /* stqfa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x25: /* stfsr */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3c: /* casa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3e: /* casxa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/sparc64/host-signal.h b/linux-user/host/sparc6=
4/host-signal.h<br>
index f4b4d65031..1191fe2d40 100644<br>
--- a/linux-user/host/sparc64/host-signal.h<br>
+++ b/linux-user/host/sparc64/host-signal.h<br>
@@ -1 +1 @@<br>
-#define HOST_SIGNAL_PLACEHOLDER<br>
+#include &quot;../sparc/host-signal.h&quot;<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 0db3c5cf3c..17fe867aeb 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -255,67 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong add=
r, int size,<br>
=C2=A0 =C2=A0 =C2=A0return size ? g2h(env_cpu(env), addr) : NULL;<br>
=C2=A0}<br>
<br>
-#if defined(__sparc__)<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 int is_write;<br>
-=C2=A0 =C2=A0 uint32_t insn;<br>
-#if !defined(__arch64__) || defined(CONFIG_SOLARIS)<br>
-=C2=A0 =C2=A0 uint32_t *regs =3D (uint32_t *)(info + 1);<br>
-=C2=A0 =C2=A0 void *sigmask =3D (regs + 20);<br>
-=C2=A0 =C2=A0 /* XXX: is there a standard glibc define ? */<br>
-=C2=A0 =C2=A0 unsigned long pc =3D regs[1];<br>
-#else<br>
-#ifdef __linux__<br>
-=C2=A0 =C2=A0 struct sigcontext *sc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long pc =3D sc-&gt;sigc_regs.tpc;<br>
-=C2=A0 =C2=A0 void *sigmask =3D (void *)sc-&gt;sigc_mask;<br>
-#elif defined(__OpenBSD__)<br>
-=C2=A0 =C2=A0 struct sigcontext *uc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long pc =3D uc-&gt;sc_pc;<br>
-=C2=A0 =C2=A0 void *sigmask =3D (void *)(long)uc-&gt;sc_mask;<br>
-#elif defined(__NetBSD__)<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long pc =3D _UC_MACHINE_PC(uc);<br>
-=C2=A0 =C2=A0 void *sigmask =3D (void *)&amp;uc-&gt;uc_sigmask;<br>
-#endif<br>
-#endif<br>
-<br>
-=C2=A0 =C2=A0 /* XXX: need kernel patch to get write flag faster */<br>
-=C2=A0 =C2=A0 is_write =3D 0;<br>
-=C2=A0 =C2=A0 insn =3D *(uint32_t *)pc;<br>
-=C2=A0 =C2=A0 if ((insn &gt;&gt; 30) =3D=3D 3) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch ((insn &gt;&gt; 19) &amp; 0x3f) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x05: /* stb */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x15: /* stba */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x06: /* sth */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x16: /* stha */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x04: /* st */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x14: /* sta */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x07: /* std */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x17: /* stda */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x0e: /* stx */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x1e: /* stxa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x24: /* stf */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x34: /* stfa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x27: /* stdf */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x37: /* stdfa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x26: /* stqf */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x36: /* stqfa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x25: /* stfsr */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3c: /* casa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3e: /* casxa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, sigmask);<br>
-}<br>
-<br>
-#elif defined(__arm__)<br>
+#if defined(__arm__)<br>
<br>
=C2=A0#if defined(__NetBSD__)<br>
=C2=A0#include &lt;ucontext.h&gt;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000bfd0b705ce68622d--

