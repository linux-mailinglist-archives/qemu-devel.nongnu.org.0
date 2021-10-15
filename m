Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F8E42FB16
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:34:23 +0200 (CEST)
Received: from localhost ([::1]:45998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbS2A-0001EM-FI
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRyj-0007FF-Gn
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:30:50 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:43742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRyf-0006ga-Hq
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:30:47 -0400
Received: by mail-ua1-x931.google.com with SMTP id i22so19776026ual.10
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yeUWeG5Qos125FvBXGjB7alUrvvgw4pJRYlVAbeecYo=;
 b=b/4n3H7oTkq9S/TyxU0Fsslcwjof52tcHVruHzcDcUtNkCsYI/8lgfBJdGRp11clmG
 nJtz/bk5Q7k3p/VmM79n+ZRoT9R4H5SbpAwp7gBTUY74rnTQQxloVLeTBOL2F8rAd1DQ
 871QJ5JBGxEz2r+gHX+lDqG9z3UprFcRxMdJWPmSRIiiXlciJeBDVJ6hNLcpE1wg5wAR
 qB7mRrLW7cTu9i/egBhNEzZF0EBxSH6cr9uqrfqT+h6N3U/kMMfmC4tBOYgR4rH86VOq
 jwJ8DFBWBhf0Qwj3MEqWc4paCqlaincli1MQJvwOQbjRRnst+G9rjY0XJP1/EtR5dVUC
 mFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yeUWeG5Qos125FvBXGjB7alUrvvgw4pJRYlVAbeecYo=;
 b=1POCaX22tm6r5uasZKKda5nrgX+NJ36rjaO61GFusBjfA/uSLCdx2thmcsrJiF9f2j
 NATpda6lMPMIDDTIHkLHmGzwbsyxfokEW90dq+AYym5kf0gW/ky6N9x7Q1NJCUneXIec
 r45WXVtLXElyqUyPI710vsd5gSRPzX24EKMHxXKoJVNuqqnCPonM1xEJ+dF2+zkdyzTj
 X4JnNZvmkUJvUqRiVJ6k7Sd2ZeqXVkKlyLxXwzoOkoetMjCaReLUtJVlWbLnMWn0IbGg
 YKLpcKkpG10+fNAKI2mqd8E2BWpCk5M9XT83YZDMMQZv5pKyTxjI3gjsB0WJFkqVX3Hk
 rwVg==
X-Gm-Message-State: AOAM530sR5aEmhn7seOmK6dJEduK49+h47JRQoCy0ekf0FlFt4wDZqaQ
 R2ioHSkydBLxMC9ltVJrn+uone6a6Fmby9AARqk1cQ==
X-Google-Smtp-Source: ABdhPJybm9oAvCp51Nj3thQOhNgnnj4TNuy4xHNu7XyA6uusdcqpr5lfHrZ/yDQVz0lQG9rjpVfoTazNKn5NfnmMadk=
X-Received: by 2002:ab0:7688:: with SMTP id v8mr14386482uaq.77.1634322643625; 
 Fri, 15 Oct 2021 11:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-12-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-12-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:30:32 -0600
Message-ID: <CANCZdfo6=pJZsQbR85Vde_Und5DqPYxZ42bjMz_7naE=35LivA@mail.gmail.com>
Subject: Re: [PATCH v5 11/67] linux-user/host/arm: Populate host_signal.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009f3b0405ce6864d6"
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009f3b0405ce6864d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Split host_signal_pc and host_signal_write out of user-exec.c.
> Drop the *BSD code, to be re-created under bsd-user/ later.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/arm/host-signal.h | 30 ++++++++++++++++++++-
>  accel/tcg/user-exec.c             | 45 +------------------------------
>  2 files changed, 30 insertions(+), 45 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/linux-user/host/arm/host-signal.h
> b/linux-user/host/arm/host-signal.h
> index f4b4d65031..6932224c1c 100644
> --- a/linux-user/host/arm/host-signal.h
> +++ b/linux-user/host/arm/host-signal.h
> @@ -1 +1,29 @@
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
> +#ifndef ARM_HOST_SIGNAL_H
> +#define ARM_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.arm_pc;
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    /*
> +     * In the FSR, bit 11 is WnR, assuming a v6 or
> +     * later processor.  On v5 we will always report
> +     * this as a read, which will fail later.
> +     */
> +    uint32_t fsr =3D uc->uc_mcontext.error_code;
> +    return extract32(fsr, 11, 1);
> +}
> +
> +#endif
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 17fe867aeb..5656c654e1 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -255,50 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong
> addr, int size,
>      return size ? g2h(env_cpu(env), addr) : NULL;
>  }
>
> -#if defined(__arm__)
> -
> -#if defined(__NetBSD__)
> -#include <ucontext.h>
> -#include <sys/siginfo.h>
> -#endif
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info =3D pinfo;
> -#if defined(__NetBSD__)
> -    ucontext_t *uc =3D puc;
> -    siginfo_t *si =3D pinfo;
> -#else
> -    ucontext_t *uc =3D puc;
> -#endif
> -    unsigned long pc;
> -    uint32_t fsr;
> -    int is_write;
> -
> -#if defined(__NetBSD__)
> -    pc =3D uc->uc_mcontext.__gregs[_REG_R15];
> -#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ =3D=3D 2 &&
> __GLIBC_MINOR__ <=3D 3))
> -    pc =3D uc->uc_mcontext.gregs[R15];
> -#else
> -    pc =3D uc->uc_mcontext.arm_pc;
> -#endif
> -
> -#ifdef __NetBSD__
> -    fsr =3D si->si_trap;
> -#else
> -    fsr =3D uc->uc_mcontext.error_code;
> -#endif
> -    /*
> -     * In the FSR, bit 11 is WnR, assuming a v6 or
> -     * later processor.  On v5 we will always report
> -     * this as a read, which will fail later.
> -     */
> -    is_write =3D extract32(fsr, 11, 1);
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -
> -#elif defined(__aarch64__)
> +#if defined(__aarch64__)
>
>  #if defined(__NetBSD__)
>
> --
> 2.25.1
>
>

--0000000000009f3b0405ce6864d6
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
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/host/arm/host-signal.h | 30 ++++++++++++++++++++-<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 45 +------------------------------<br>
=C2=A02 files changed, 30 insertions(+), 45 deletions(-)<br></blockquote><d=
iv><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com">imp@bsdimp.com</a>&gt;</div><br class=3D"gmail-Apple-interchange=
-newline"></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
diff --git a/linux-user/host/arm/host-signal.h b/linux-user/host/arm/host-s=
ignal.h<br>
index f4b4d65031..6932224c1c 100644<br>
--- a/linux-user/host/arm/host-signal.h<br>
+++ b/linux-user/host/arm/host-signal.h<br>
@@ -1 +1,29 @@<br>
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
+#ifndef ARM_HOST_SIGNAL_H<br>
+#define ARM_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.arm_pc;<br>
+}<br>
+<br>
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* In the FSR, bit 11 is WnR, assuming a v6 or<br>
+=C2=A0 =C2=A0 =C2=A0* later processor.=C2=A0 On v5 we will always report<b=
r>
+=C2=A0 =C2=A0 =C2=A0* this as a read, which will fail later.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 uint32_t fsr =3D uc-&gt;uc_mcontext.error_code;<br>
+=C2=A0 =C2=A0 return extract32(fsr, 11, 1);<br>
+}<br>
+<br>
+#endif<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 17fe867aeb..5656c654e1 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -255,50 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong add=
r, int size,<br>
=C2=A0 =C2=A0 =C2=A0return size ? g2h(env_cpu(env), addr) : NULL;<br>
=C2=A0}<br>
<br>
-#if defined(__arm__)<br>
-<br>
-#if defined(__NetBSD__)<br>
-#include &lt;ucontext.h&gt;<br>
-#include &lt;sys/siginfo.h&gt;<br>
-#endif<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-#if defined(__NetBSD__)<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 siginfo_t *si =3D pinfo;<br>
-#else<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#endif<br>
-=C2=A0 =C2=A0 unsigned long pc;<br>
-=C2=A0 =C2=A0 uint32_t fsr;<br>
-=C2=A0 =C2=A0 int is_write;<br>
-<br>
-#if defined(__NetBSD__)<br>
-=C2=A0 =C2=A0 pc =3D uc-&gt;uc_mcontext.__gregs[_REG_R15];<br>
-#elif defined(__GLIBC__) &amp;&amp; (__GLIBC__ &lt; 2 || (__GLIBC__ =3D=3D=
 2 &amp;&amp; __GLIBC_MINOR__ &lt;=3D 3))<br>
-=C2=A0 =C2=A0 pc =3D uc-&gt;uc_mcontext.gregs[R15];<br>
-#else<br>
-=C2=A0 =C2=A0 pc =3D uc-&gt;uc_mcontext.arm_pc;<br>
-#endif<br>
-<br>
-#ifdef __NetBSD__<br>
-=C2=A0 =C2=A0 fsr =3D si-&gt;si_trap;<br>
-#else<br>
-=C2=A0 =C2=A0 fsr =3D uc-&gt;uc_mcontext.error_code;<br>
-#endif<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* In the FSR, bit 11 is WnR, assuming a v6 or<br>
-=C2=A0 =C2=A0 =C2=A0* later processor.=C2=A0 On v5 we will always report<b=
r>
-=C2=A0 =C2=A0 =C2=A0* this as a read, which will fail later.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 is_write =3D extract32(fsr, 11, 1);<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-<br>
-#elif defined(__aarch64__)<br>
+#if defined(__aarch64__)<br>
<br>
=C2=A0#if defined(__NetBSD__)<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000009f3b0405ce6864d6--

