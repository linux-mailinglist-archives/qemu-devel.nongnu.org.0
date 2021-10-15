Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FD942FB1C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:38:12 +0200 (CEST)
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbS5r-0008E6-CT
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRz4-0007a9-Fr
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:31:10 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:46014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRz1-0006zk-SV
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:31:10 -0400
Received: by mail-vk1-xa31.google.com with SMTP id n201so5565825vkn.12
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fhtvbkg7vKKDZYd+D8GzBt+EBoAUotT/jc8l6SHJTUo=;
 b=2v84+aQ8QUWQUPlNFmjseqicVAe6G2KVQ5v+FTnw2DCGe8tSz4+jO1cRqfGNpwnqvr
 Gq7FXPoGPr9KoCihk3n7fgCTr7b0PZ52GrIpO1ReMLVZ9WZ1ey/9886Q23+3SuS2EPMm
 MSeiFlbB6tv2luwRaZVAWDgi0AjXOpAnwzmdl9BZEaTu2NRFXNExC78yS2/W0PaWabOK
 ZBUdqZ/AalKI9pFbkrCPT2wxycrjjlEPTsYCHucgj4XCTZCpk1rHxF4KUrfJqQjoMhwz
 Ek7ZIr51bDHsA68tWODk4GvnSZEodrvQmoiDj+VrSWk00xEJfsAvUmbruJkqNEUqIQf4
 HJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fhtvbkg7vKKDZYd+D8GzBt+EBoAUotT/jc8l6SHJTUo=;
 b=pHbsDhbq6mZimkYpcpq1Xg+J33g8Nm6C7cNmXirw2goM/35XF4MDD34SRZ0c3eJMRw
 uPhYpGFp0wa6nV60pu3EOOyR4Vig6iT/cGfENePZIyHQcgsP6Cy/R7dtrdUcf3qXuoat
 Etj5fliwnLZ5gUublzZi0+PJyP/PgKN2aQkb2H0iY6a2aTm4Tdf/K0kSnvNgXbQFr9ar
 KmsCXD81baeaSXDec9awCFno96kXVPOlFn0iw4RKsasxrKuk9/sq/a1UnCB9sXf8GHMD
 gTCCA6AO7NiEZ3Hl9nAL1I+TGLXjO4GqSaDVT+EQC4q8Hq8E9usyzU6xqnYuBp8K90sa
 +dZw==
X-Gm-Message-State: AOAM533Kzd2MmLrMGTCMbd3jrUWa6E0pXbG2p4Wl1nL7hA81jhU3Mhvw
 kMH6jOMEvG5PXYGKV1unifm+Xc83H9X11k4Ehr7fLg==
X-Google-Smtp-Source: ABdhPJw/zcmAyntzD5XYGwJPNm0kGtkRHTbux3msgUi+noi/Z8CnQPuL5zp5HNQbQRPHWGzZmizRN80h+QFWgKGXKi8=
X-Received: by 2002:a1f:2d83:: with SMTP id t125mr13897175vkt.23.1634322666888; 
 Fri, 15 Oct 2021 11:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-13-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-13-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:30:56 -0600
Message-ID: <CANCZdfroR3PQUxDZ9wC5VgdYD9D1ay-cZ7ke3Ts2f2Xg803LSQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/67] linux-user/host/aarch64: Populate host_signal.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000002319e05ce686665"
Received-SPF: none client-ip=2607:f8b0:4864:20::a31;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa31.google.com
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

--00000000000002319e05ce686665
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Split host_signal_pc and host_signal_write out of user-exec.c.
> Drop the *BSD code, to be re-created under bsd-user/ later.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/aarch64/host-signal.h | 74 ++++++++++++++++++++-
>  accel/tcg/user-exec.c                 | 94 +--------------------------
>  2 files changed, 74 insertions(+), 94 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/linux-user/host/aarch64/host-signal.h
> b/linux-user/host/aarch64/host-signal.h
> index f4b4d65031..02a55c3372 100644
> --- a/linux-user/host/aarch64/host-signal.h
> +++ b/linux-user/host/aarch64/host-signal.h
> @@ -1 +1,73 @@
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
> +#ifndef AARCH64_HOST_SIGNAL_H
> +#define AARCH64_HOST_SIGNAL_H
> +
> +/* Pre-3.16 kernel headers don't have these, so provide fallback
> definitions */
> +#ifndef ESR_MAGIC
> +#define ESR_MAGIC 0x45535201
> +struct esr_context {
> +    struct _aarch64_ctx head;
> +    uint64_t esr;
> +};
> +#endif
> +
> +static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)
> +{
> +    return (struct _aarch64_ctx *)&uc->uc_mcontext.__reserved;
> +}
> +
> +static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)
> +{
> +    return (struct _aarch64_ctx *)((char *)hdr + hdr->size);
> +}
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.pc;
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    struct _aarch64_ctx *hdr;
> +    uint32_t insn;
> +
> +    /* Find the esr_context, which has the WnR bit in it */
> +    for (hdr = first_ctx(uc); hdr->magic; hdr = next_ctx(hdr)) {
> +        if (hdr->magic == ESR_MAGIC) {
> +            struct esr_context const *ec = (struct esr_context const
> *)hdr;
> +            uint64_t esr = ec->esr;
> +
> +            /* For data aborts ESR.EC is 0b10010x: then bit 6 is the WnR
> bit */
> +            return extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1)
> == 1;
> +        }
> +    }
> +
> +    /*
> +     * Fall back to parsing instructions; will only be needed
> +     * for really ancient (pre-3.16) kernels.
> +     */
> +    insn = *(uint32_t *)host_signal_pc(uc);
> +
> +    return (insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
> +        || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
> +        || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
> +        || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
> +        || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
> +        || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
> +        || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit */
> +        /* Ignore bits 10, 11 & 21, controlling indexing.  */
> +        || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
> +        || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit */
> +        /* Ignore bits 23 & 24, controlling indexing.  */
> +        || (insn & 0x3a400000) == 0x28000000; /* C3.3.7,14-16 */
> +}
> +
> +#endif
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 5656c654e1..0915eb7f95 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -255,99 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong
> addr, int size,
>      return size ? g2h(env_cpu(env), addr) : NULL;
>  }
>
> -#if defined(__aarch64__)
> -
> -#if defined(__NetBSD__)
> -
> -#include <ucontext.h>
> -#include <sys/siginfo.h>
> -
> -int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
> -{
> -    ucontext_t *uc = puc;
> -    siginfo_t *si = pinfo;
> -    unsigned long pc;
> -    int is_write;
> -    uint32_t esr;
> -
> -    pc = uc->uc_mcontext.__gregs[_REG_PC];
> -    esr = si->si_trap;
> -
> -    /*
> -     * siginfo_t::si_trap is the ESR value, for data aborts ESR.EC
> -     * is 0b10010x: then bit 6 is the WnR bit
> -     */
> -    is_write = extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1) == 1;
> -    return handle_cpu_signal(pc, si, is_write, &uc->uc_sigmask);
> -}
> -
> -#else
> -
> -#ifndef ESR_MAGIC
> -/* Pre-3.16 kernel headers don't have these, so provide fallback
> definitions */
> -#define ESR_MAGIC 0x45535201
> -struct esr_context {
> -    struct _aarch64_ctx head;
> -    uint64_t esr;
> -};
> -#endif
> -
> -static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)
> -{
> -    return (struct _aarch64_ctx *)&uc->uc_mcontext.__reserved;
> -}
> -
> -static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)
> -{
> -    return (struct _aarch64_ctx *)((char *)hdr + hdr->size);
> -}
> -
> -int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    ucontext_t *uc = puc;
> -    uintptr_t pc = uc->uc_mcontext.pc;
> -    bool is_write;
> -    struct _aarch64_ctx *hdr;
> -    struct esr_context const *esrctx = NULL;
> -
> -    /* Find the esr_context, which has the WnR bit in it */
> -    for (hdr = first_ctx(uc); hdr->magic; hdr = next_ctx(hdr)) {
> -        if (hdr->magic == ESR_MAGIC) {
> -            esrctx = (struct esr_context const *)hdr;
> -            break;
> -        }
> -    }
> -
> -    if (esrctx) {
> -        /* For data aborts ESR.EC is 0b10010x: then bit 6 is the WnR bit
> */
> -        uint64_t esr = esrctx->esr;
> -        is_write = extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1)
> == 1;
> -    } else {
> -        /*
> -         * Fall back to parsing instructions; will only be needed
> -         * for really ancient (pre-3.16) kernels.
> -         */
> -        uint32_t insn = *(uint32_t *)pc;
> -
> -        is_write = ((insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
> -                    || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
> -                    || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
> -                    || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
> -                    || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
> -                    || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
> -                    || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit
> */
> -                    /* Ignore bits 10, 11 & 21, controlling indexing.  */
> -                    || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
> -                    || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit
> */
> -                    /* Ignore bits 23 & 24, controlling indexing.  */
> -                    || (insn & 0x3a400000) == 0x28000000); /*
> C3.3.7,14-16 */
> -    }
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -#endif
> -
> -#elif defined(__s390__)
> +#if defined(__s390__)
>
>  int cpu_signal_handler(int host_signum, void *pinfo,
>                         void *puc)
> --
> 2.25.1
>
>

--00000000000002319e05ce686665
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
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/host/aarch64/host-signal.h | 74 ++++++++++++++++++++-<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 94 +--------------------------<br>
=C2=A02 files changed, 74 insertions(+), 94 deletions(-)<br></blockquote><d=
iv><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com">imp@bsdimp.com</a>&gt;</div><br class=3D"gmail-Apple-interchange=
-newline"></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/host/aarch6=
4/host-signal.h<br>
index f4b4d65031..02a55c3372 100644<br>
--- a/linux-user/host/aarch64/host-signal.h<br>
+++ b/linux-user/host/aarch64/host-signal.h<br>
@@ -1 +1,73 @@<br>
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
+#ifndef AARCH64_HOST_SIGNAL_H<br>
+#define AARCH64_HOST_SIGNAL_H<br>
+<br>
+/* Pre-3.16 kernel headers don&#39;t have these, so provide fallback defin=
itions */<br>
+#ifndef ESR_MAGIC<br>
+#define ESR_MAGIC 0x45535201<br>
+struct esr_context {<br>
+=C2=A0 =C2=A0 struct _aarch64_ctx head;<br>
+=C2=A0 =C2=A0 uint64_t esr;<br>
+};<br>
+#endif<br>
+<br>
+static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return (struct _aarch64_ctx *)&amp;uc-&gt;uc_mcontext.__rese=
rved;<br>
+}<br>
+<br>
+static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)<br>
+{<br>
+=C2=A0 =C2=A0 return (struct _aarch64_ctx *)((char *)hdr + hdr-&gt;size);<=
br>
+}<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.pc;<br>
+}<br>
+<br>
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 struct _aarch64_ctx *hdr;<br>
+=C2=A0 =C2=A0 uint32_t insn;<br>
+<br>
+=C2=A0 =C2=A0 /* Find the esr_context, which has the WnR bit in it */<br>
+=C2=A0 =C2=A0 for (hdr =3D first_ctx(uc); hdr-&gt;magic; hdr =3D next_ctx(=
hdr)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hdr-&gt;magic =3D=3D ESR_MAGIC) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct esr_context const *ec =3D=
 (struct esr_context const *)hdr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t esr =3D ec-&gt;esr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* For data aborts <a href=3D"ht=
tp://ESR.EC" rel=3D"noreferrer" target=3D"_blank">ESR.EC</a> is 0b10010x: t=
hen bit 6 is the WnR bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return extract32(esr, 27, 5) =3D=
=3D 0x12 &amp;&amp; extract32(esr, 6, 1) =3D=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Fall back to parsing instructions; will only be need=
ed<br>
+=C2=A0 =C2=A0 =C2=A0* for really ancient (pre-3.16) kernels.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 insn =3D *(uint32_t *)host_signal_pc(uc);<br>
+<br>
+=C2=A0 =C2=A0 return (insn &amp; 0xbfff0000) =3D=3D 0x0c000000=C2=A0 =C2=
=A0/* C3.3.1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0xbfe00000) =3D=3D 0x0c800000=
=C2=A0 =C2=A0/* C3.3.2 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0xbfdf0000) =3D=3D 0x0d000000=
=C2=A0 =C2=A0/* C3.3.3 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0xbfc00000) =3D=3D 0x0d800000=
=C2=A0 =C2=A0/* C3.3.4 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3f400000) =3D=3D 0x08000000=
=C2=A0 =C2=A0/* C3.3.6 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3bc00000) =3D=3D 0x39000000=
=C2=A0 =C2=A0/* C3.3.13 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3fc00000) =3D=3D 0x3d800000=
=C2=A0 =C2=A0/* ... 128bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ignore bits 10, 11 &amp; 21, controlling in=
dexing.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3bc00000) =3D=3D 0x38000000=
=C2=A0 =C2=A0/* C3.3.8-12 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3fe00000) =3D=3D 0x3c800000=
=C2=A0 =C2=A0/* ... 128bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ignore bits 23 &amp; 24, controlling indexi=
ng.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3a400000) =3D=3D 0x28000000; =
/* C3.3.7,14-16 */<br>
+}<br>
+<br>
+#endif<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 5656c654e1..0915eb7f95 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -255,99 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong add=
r, int size,<br>
=C2=A0 =C2=A0 =C2=A0return size ? g2h(env_cpu(env), addr) : NULL;<br>
=C2=A0}<br>
<br>
-#if defined(__aarch64__)<br>
-<br>
-#if defined(__NetBSD__)<br>
-<br>
-#include &lt;ucontext.h&gt;<br>
-#include &lt;sys/siginfo.h&gt;<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo, void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 siginfo_t *si =3D pinfo;<br>
-=C2=A0 =C2=A0 unsigned long pc;<br>
-=C2=A0 =C2=A0 int is_write;<br>
-=C2=A0 =C2=A0 uint32_t esr;<br>
-<br>
-=C2=A0 =C2=A0 pc =3D uc-&gt;uc_mcontext.__gregs[_REG_PC];<br>
-=C2=A0 =C2=A0 esr =3D si-&gt;si_trap;<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* siginfo_t::si_trap is the ESR value, for data aborts=
 <a href=3D"http://ESR.EC" rel=3D"noreferrer" target=3D"_blank">ESR.EC</a><=
br>
-=C2=A0 =C2=A0 =C2=A0* is 0b10010x: then bit 6 is the WnR bit<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 is_write =3D extract32(esr, 27, 5) =3D=3D 0x12 &amp;&amp; ex=
tract32(esr, 6, 1) =3D=3D 1;<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, si, is_write, &amp;uc-&gt;uc_si=
gmask);<br>
-}<br>
-<br>
-#else<br>
-<br>
-#ifndef ESR_MAGIC<br>
-/* Pre-3.16 kernel headers don&#39;t have these, so provide fallback defin=
itions */<br>
-#define ESR_MAGIC 0x45535201<br>
-struct esr_context {<br>
-=C2=A0 =C2=A0 struct _aarch64_ctx head;<br>
-=C2=A0 =C2=A0 uint64_t esr;<br>
-};<br>
-#endif<br>
-<br>
-static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)<br>
-{<br>
-=C2=A0 =C2=A0 return (struct _aarch64_ctx *)&amp;uc-&gt;uc_mcontext.__rese=
rved;<br>
-}<br>
-<br>
-static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)<br>
-{<br>
-=C2=A0 =C2=A0 return (struct _aarch64_ctx *)((char *)hdr + hdr-&gt;size);<=
br>
-}<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo, void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 uintptr_t pc =3D uc-&gt;uc_mcontext.pc;<br>
-=C2=A0 =C2=A0 bool is_write;<br>
-=C2=A0 =C2=A0 struct _aarch64_ctx *hdr;<br>
-=C2=A0 =C2=A0 struct esr_context const *esrctx =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 /* Find the esr_context, which has the WnR bit in it */<br>
-=C2=A0 =C2=A0 for (hdr =3D first_ctx(uc); hdr-&gt;magic; hdr =3D next_ctx(=
hdr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hdr-&gt;magic =3D=3D ESR_MAGIC) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esrctx =3D (struct esr_context c=
onst *)hdr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (esrctx) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* For data aborts <a href=3D"http://ESR.EC" r=
el=3D"noreferrer" target=3D"_blank">ESR.EC</a> is 0b10010x: then bit 6 is t=
he WnR bit */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t esr =3D esrctx-&gt;esr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D extract32(esr, 27, 5) =3D=3D 0x12=
 &amp;&amp; extract32(esr, 6, 1) =3D=3D 1;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fall back to parsing instructions; wil=
l only be needed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for really ancient (pre-3.16) kernels.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t insn =3D *(uint32_t *)pc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D ((insn &amp; 0xbfff0000) =3D=3D 0=
x0c000000=C2=A0 =C2=A0/* C3.3.1 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0xbfe00000) =3D=3D 0x0c800000=C2=A0 =C2=A0/* C3.3.2 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0xbfdf0000) =3D=3D 0x0d000000=C2=A0 =C2=A0/* C3.3.3 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0xbfc00000) =3D=3D 0x0d800000=C2=A0 =C2=A0/* C3.3.4 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3f400000) =3D=3D 0x08000000=C2=A0 =C2=A0/* C3.3.6 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3bc00000) =3D=3D 0x39000000=C2=A0 =C2=A0/* C3.3.13 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3fc00000) =3D=3D 0x3d800000=C2=A0 =C2=A0/* ... 128bit */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* I=
gnore bits 10, 11 &amp; 21, controlling indexing.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3bc00000) =3D=3D 0x38000000=C2=A0 =C2=A0/* C3.3.8-12 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3fe00000) =3D=3D 0x3c800000=C2=A0 =C2=A0/* ... 128bit */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* I=
gnore bits 23 &amp; 24, controlling indexing.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3a400000) =3D=3D 0x28000000); /* C3.3.7,14-16 */<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-#endif<br>
-<br>
-#elif defined(__s390__)<br>
+#if defined(__s390__)<br>
<br>
=C2=A0int cpu_signal_handler(int host_signum, void *pinfo,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 void *puc)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000002319e05ce686665--

