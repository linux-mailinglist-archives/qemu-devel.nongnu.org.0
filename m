Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8370C453B60
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 22:01:03 +0100 (CET)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn5Ze-0003iY-53
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 16:01:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mn5XX-0002R1-Cn
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 15:58:51 -0500
Received: from [2607:f8b0:4864:20::936] (port=36644
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mn5XU-0007EV-Mv
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 15:58:51 -0500
Received: by mail-ua1-x936.google.com with SMTP id r15so1078246uao.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 12:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EVIPl/o2ZzzC45FM3XI4WWf+r74DTvYYZAQLJHeYgk8=;
 b=oC4wym4Ixxld2efkKBYQfTsXQjQYcRhp17vIsS3A5ZH5pKg5UMGE80Lq3wuSWSuC0+
 6kCix2jN/XxdbUvelP5mopWrHM/CK7vjVxduu3dxkevewEfS8Pf0nq3IKB40eXAm3P6N
 8A9qFuJF5MLoJ+tu+Q8YBMnb1V78ncwDKxtl9DwajO/8QkMBqGQkrBdu40hcg0QRc9Jr
 bTtALI/b68I1PXXLPwo44UQOvZAidoIZ577AmESSPemexIQwMOlxv7aUQX02oBNaeD1u
 Tpvrni/n45L0wU9ir/ozyBt8Y1UCUvMapfqdQ5sqLYa7nMn3FGluabp8XvHkS620KC3D
 fkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EVIPl/o2ZzzC45FM3XI4WWf+r74DTvYYZAQLJHeYgk8=;
 b=4b3BToESysS2QrT9+3AlUdHSIIvK7iyIxW3JVU7lpt+Xck/pS74dsYWeyd+Ve65wx/
 R3x6kvNZX35cfI0tuswPrUVZSaAIO7N/Z7SHf/VtqcLNSmCwVif/eMIdym1gAbd+Kmyl
 Vmhvqr7j1DSaMnQ6dHPSWxyN0BMFnZHgUKch3He1t3KGz4uC68LKDXt4S7uJxpcWP0W3
 vXCkfkEU4lGhJodwFwrQHPrispIh8oOEcPRs6xUYog04P7YZYFImWcxwBnY2VnFwXOOs
 a1h0DerxY/qBdqb08VZkY1U1ps0hf5iOHxSZaKCSiRm2Z38RPqVjPvVFoyY+b8xPy2Jr
 nh0w==
X-Gm-Message-State: AOAM531/rJjuGzapCvHFaca4smCfTZiSS9McqgO5LdlYF5G25A3iZIHg
 dUKLwWU+JPPzPgLZrOAccKyblwSPo73YDte641fl1riJXbM=
X-Google-Smtp-Source: ABdhPJy10RewctH4ULOT9Cq2kI15Qn10Yf8VjE9IujTZyw7iSBQ/9M4+t6cEdzsF8+kRY7Klhn40LDWMGUtXJv4PEEw=
X-Received: by 2002:a67:fdc3:: with SMTP id l3mr58955831vsq.42.1637096326950; 
 Tue, 16 Nov 2021 12:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-9-richard.henderson@linaro.org>
In-Reply-To: <20211116110256.365484-9-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 16 Nov 2021 13:58:36 -0700
Message-ID: <CANCZdfrVjYazmNBLhVMnKsOqcbnYA1=mP2MhrhumEcVwdJnwKQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] common-user: Adjust system call return on FreeBSD
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000808c605d0ee3147"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000808c605d0ee3147
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 16, 2021 at 4:03 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> From: Warner Losh <imp@bsdimp.com>
>
> FreeBSD system calls return positive errno.  On the 4 hosts for
> which we have support, error is indicated by the C bit set or clear.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> [rth: Rebase on new safe_syscall_base api; add #error check.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  common-user/host/aarch64/safe-syscall.inc.S | 12 +++++++++++-
>  common-user/host/arm/safe-syscall.inc.S     | 11 +++++++++++
>  common-user/host/i386/safe-syscall.inc.S    | 10 ++++++++++
>  common-user/host/x86_64/safe-syscall.inc.S  | 10 ++++++++++
>  4 files changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/common-user/host/aarch64/safe-syscall.inc.S
> b/common-user/host/aarch64/safe-syscall.inc.S
> index 95c60d8609..d3f065cdef 100644
> --- a/common-user/host/aarch64/safe-syscall.inc.S
> +++ b/common-user/host/aarch64/safe-syscall.inc.S
> @@ -65,12 +65,22 @@ safe_syscall_start:
>  safe_syscall_end:
>
>         /* code path for having successfully executed the syscall */
> -       cmn     x0, #4095
> +#if defined(__linux__)
> +       /* Linux kernel returns (small) negative errno. */
> +       cmn     x0, #4096
> +       b.hi    0f
> +#elif defined(__FreeBSD__)
> +       /* FreeBSD kernel returns positive errno and C bit set. */
>         b.cs    1f
> +#else
> +#error "unsupported os"
> +#endif
>         ret
>
>         /* code path setting errno */
> +#ifdef __linux__
>  0:     neg     w0, w0                  /* create positive errno */
> +#endif
>  1:     str     w0, [x11]               /* store errno */
>         mov     x0, #-1
>         ret
> diff --git a/common-user/host/arm/safe-syscall.inc.S
> b/common-user/host/arm/safe-syscall.inc.S
> index 17839c6486..328299021d 100644
> --- a/common-user/host/arm/safe-syscall.inc.S
> +++ b/common-user/host/arm/safe-syscall.inc.S
> @@ -82,12 +82,23 @@ safe_syscall_start:
>  safe_syscall_end:
>
>         /* code path for having successfully executed the syscall */
> +#if defined(__linux__)
> +       /* Linux kernel returns (small) negative errno. */
>         cmp     r0, #-4096
>         bhi     0f
> +#elif defined(__FreeBSD__)
> +       /* FreeBSD kernel returns positive errno and C bit set. */
> +       bcs     1f
> +#else
> +#error "unsupported os"
> +#endif
> +
>  9:     pop     { r4, r5, r6, r7, r8, r9, r10, pc }
>
>         /* code path setting errno */
> +#ifdef __linux__
>  0:     neg     r0, r0          /* create positive errno */
> +#endif
>  1:     str     r0, [r9]        /* store errno */
>         mov     r0, #-1
>         b       9b
> diff --git a/common-user/host/i386/safe-syscall.inc.S
> b/common-user/host/i386/safe-syscall.inc.S
> index ad89521783..a9382f777e 100644
> --- a/common-user/host/i386/safe-syscall.inc.S
> +++ b/common-user/host/i386/safe-syscall.inc.S
> @@ -76,8 +76,16 @@ safe_syscall_start:
>  safe_syscall_end:
>
>         /* code path for having successfully executed the syscall */
> +#if defined(__linux__)
> +       /* Linux kernel returns (small) negative errno. */
>         cmp     $-4095, %eax
>         jae     0f
> +#elif defined(__FreeBSD__)
> +       /* FreeBSD kernel returns positive errno and C bit set. */
> +       jcs     1f
>

I needed to change this to 'jc' and that's all google found for Intel.

+#else
> +#error "unsupported os"
> +#endif
>
>  9:     pop     %ebx
>         .cfi_remember_state
> @@ -97,7 +105,9 @@ safe_syscall_end:
>         .cfi_restore_state
>
>         /* code path setting errno */
> +#ifdef __linux__
>  0:     neg     %eax                    /* create positive errno */
> +#endif
>  1:     mov     8+16(%esp), %ebx        /* load errno pointer */
>         mov     %eax, (%ebx)            /* store errno */
>         mov     $-1, %eax
> diff --git a/common-user/host/x86_64/safe-syscall.inc.S
> b/common-user/host/x86_64/safe-syscall.inc.S
> index 9a0c4c93b4..36b7efe2ca 100644
> --- a/common-user/host/x86_64/safe-syscall.inc.S
> +++ b/common-user/host/x86_64/safe-syscall.inc.S
> @@ -75,8 +75,16 @@ safe_syscall_start:
>  safe_syscall_end:
>
>          /* code path for having successfully executed the syscall */
> +#if defined(__linux__)
> +       /* Linux kernel returns (small) negative errno. */
>          cmp    $-4095, %rax
>          jae    0f
> +#elif defined(__FreeBSD__)
> +       /* FreeBSD kernel returns positive errno and C bit set. */
> +       jcs     1f
>

Likewise.


> +#else
> +#error "unsupported os"
> +#endif
>
>  9:      pop     %rbp
>          .cfi_remember_state
> @@ -86,7 +94,9 @@ safe_syscall_end:
>          .cfi_restore_state
>
>          /* code path setting errno */
> +#ifdef __linux__
>  0:      neg    %eax                    /* create positive errno */
> +#endif
>  1:      mov    %eax, (%rbp)            /* store errno */
>          mov    $-1, %rax
>          jmp    9b
>

I've not yet tested this on my arm/aarch64 systems, but I think it will
work there.

Warner

--0000000000000808c605d0ee3147
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 16, 2021 at 4:03 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" t=
arget=3D"_blank">imp@bsdimp.com</a>&gt;<br>
<br>
FreeBSD system calls return positive errno.=C2=A0 On the 4 hosts for<br>
which we have support, error is indicated by the C bit set or clear.<br>
<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
[rth: Rebase on new safe_syscall_base api; add #error check.]<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0common-user/host/aarch64/safe-syscall.inc.S | 12 +++++++++++-<br>
=C2=A0common-user/host/arm/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0| 11 +++++=
++++++<br>
=C2=A0common-user/host/i386/safe-syscall.inc.S=C2=A0 =C2=A0 | 10 ++++++++++=
<br>
=C2=A0common-user/host/x86_64/safe-syscall.inc.S=C2=A0 | 10 ++++++++++<br>
=C2=A04 files changed, 42 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host=
/aarch64/safe-syscall.inc.S<br>
index 95c60d8609..d3f065cdef 100644<br>
--- a/common-user/host/aarch64/safe-syscall.inc.S<br>
+++ b/common-user/host/aarch64/safe-syscall.inc.S<br>
@@ -65,12 +65,22 @@ safe_syscall_start:<br>
=C2=A0safe_syscall_end:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path for having successfully executed t=
he syscall */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmn=C2=A0 =C2=A0 =C2=A0x0, #4095<br>
+#if defined(__linux__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux kernel returns (small) negative errno.=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmn=C2=A0 =C2=A0 =C2=A0x0, #4096<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b.hi=C2=A0 =C2=A0 0f<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FreeBSD kernel returns positive errno and C =
bit set. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b.cs=C2=A0 =C2=A0 1f<br>
+#else<br>
+#error &quot;unsupported os&quot;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+#ifdef __linux__<br>
=C2=A00:=C2=A0 =C2=A0 =C2=A0neg=C2=A0 =C2=A0 =C2=A0w0, w0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* create positive errno */<b=
r>
+#endif<br>
=C2=A01:=C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0 =C2=A0w0, [x11]=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* store errno */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0x0, #-1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm=
/safe-syscall.inc.S<br>
index 17839c6486..328299021d 100644<br>
--- a/common-user/host/arm/safe-syscall.inc.S<br>
+++ b/common-user/host/arm/safe-syscall.inc.S<br>
@@ -82,12 +82,23 @@ safe_syscall_start:<br>
=C2=A0safe_syscall_end:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path for having successfully executed t=
he syscall */<br>
+#if defined(__linux__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux kernel returns (small) negative errno.=
 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp=C2=A0 =C2=A0 =C2=A0r0, #-4096<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bhi=C2=A0 =C2=A0 =C2=A00f<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FreeBSD kernel returns positive errno and C =
bit set. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bcs=C2=A0 =C2=A0 =C2=A01f<br>
+#else<br>
+#error &quot;unsupported os&quot;<br>
+#endif<br>
+<br>
=C2=A09:=C2=A0 =C2=A0 =C2=A0pop=C2=A0 =C2=A0 =C2=A0{ r4, r5, r6, r7, r8, r9=
, r10, pc }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+#ifdef __linux__<br>
=C2=A00:=C2=A0 =C2=A0 =C2=A0neg=C2=A0 =C2=A0 =C2=A0r0, r0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* create positive errno */<br>
+#endif<br>
=C2=A01:=C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0 =C2=A0r0, [r9]=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* store errno */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0r0, #-1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 =C2=A09b<br>
diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i3=
86/safe-syscall.inc.S<br>
index ad89521783..a9382f777e 100644<br>
--- a/common-user/host/i386/safe-syscall.inc.S<br>
+++ b/common-user/host/i386/safe-syscall.inc.S<br>
@@ -76,8 +76,16 @@ safe_syscall_start:<br>
=C2=A0safe_syscall_end:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path for having successfully executed t=
he syscall */<br>
+#if defined(__linux__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux kernel returns (small) negative errno.=
 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp=C2=A0 =C2=A0 =C2=A0$-4095, %eax<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 jae=C2=A0 =C2=A0 =C2=A00f<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FreeBSD kernel returns positive errno and C =
bit set. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jcs=C2=A0 =C2=A0 =C2=A01f<br></blockquote><div>=
<br></div><div>I needed to change this to &#39;jc&#39; and that&#39;s all g=
oogle found for Intel.</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+#else<br>
+#error &quot;unsupported os&quot;<br>
+#endif<br>
<br>
=C2=A09:=C2=A0 =C2=A0 =C2=A0pop=C2=A0 =C2=A0 =C2=A0%ebx<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_remember_state<br>
@@ -97,7 +105,9 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore_state<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+#ifdef __linux__<br>
=C2=A00:=C2=A0 =C2=A0 =C2=A0neg=C2=A0 =C2=A0 =C2=A0%eax=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* create positive errno =
*/<br>
+#endif<br>
=C2=A01:=C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 =C2=A08+16(%esp), %ebx=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* load errno pointer */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0%eax, (%ebx)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* store errno */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0$-1, %eax<br>
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/=
x86_64/safe-syscall.inc.S<br>
index 9a0c4c93b4..36b7efe2ca 100644<br>
--- a/common-user/host/x86_64/safe-syscall.inc.S<br>
+++ b/common-user/host/x86_64/safe-syscall.inc.S<br>
@@ -75,8 +75,16 @@ safe_syscall_start:<br>
=C2=A0safe_syscall_end:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully exec=
uted the syscall */<br>
+#if defined(__linux__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux kernel returns (small) negative errno.=
 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp=C2=A0 =C2=A0 $-4095, %rax<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jae=C2=A0 =C2=A0 0f<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FreeBSD kernel returns positive errno and C =
bit set. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jcs=C2=A0 =C2=A0 =C2=A01f<br></blockquote><div>=
<br></div><div>Likewise.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
+#else<br>
+#error &quot;unsupported os&quot;<br>
+#endif<br>
<br>
=C2=A09:=C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =C2=A0%rbp<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_remember_state<br>
@@ -86,7 +94,9 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_restore_state<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path setting errno */<br>
+#ifdef __linux__<br>
=C2=A00:=C2=A0 =C2=A0 =C2=A0 neg=C2=A0 =C2=A0 %eax=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* create positive errno */<b=
r>
+#endif<br>
=C2=A01:=C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %eax, (%rbp)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* store errno */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 $-1, %rax<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jmp=C2=A0 =C2=A0 9b<br></blockquote><div>=
<br></div><div>I&#39;ve not yet tested this on my arm/aarch64 systems, but =
I think it will work there.</div><div><br></div><div>Warner=C2=A0</div></di=
v></div>

--0000000000000808c605d0ee3147--

