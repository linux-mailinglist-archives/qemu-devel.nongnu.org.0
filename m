Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE606EB529
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:46:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzWZ-0006BD-Cd; Fri, 21 Apr 2023 18:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ppzWU-000698-Cm
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:46:34 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ppzWS-0002FV-4w
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:46:33 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-94f3cd32799so378893666b.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20221208.gappssmtp.com; s=20221208; t=1682117190; x=1684709190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9nqWbz8PJfGqTsw6O27RybQynGgZwtgSjHCt3ObhHwI=;
 b=XHJkJPEDHaU/qhVSOtwBQMqw/GFwrmqLh5RcKVsMXRfcOU+wSaxfZBtTCec3ntaDyk
 +cW6yddollUaouF+6oFN1AnreErDLxxQiIhlw+tVY09zERGttIGlmyH5U/ruu+imIF7E
 hwOEZUzzWN8Ua1FpWNDb17dZZNvFQ+9sz6COn5eDG6B3Rb7G/RsrRqS0gIIA72N4FdHj
 qESwC8Af+6Rsh5pD4hufj4iFeyI+FXuPn8ioXMN7gFvqaatzpstpcPwT2Z8Wyrdi3Kbw
 gdHSZo2SzpRxb0+SLuJ/2IJeS+6wNXCgbr8dPbkJJp3Ul3YKsXpXm+CrhrsGwyfuwZBa
 GHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682117190; x=1684709190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9nqWbz8PJfGqTsw6O27RybQynGgZwtgSjHCt3ObhHwI=;
 b=agRrv8HYfPf6ahrePZplxefCnqAoGdXmxrOQ8/Inn7cra8qTA1bjkaIRJE9wO9g9Qw
 N7vBdUNnVUXT0ySoqKSk26QwZfUPCFHotUXJCtLYPVlKQEIFk4vWZ1cMLG7PgG/Gk5LP
 fVtPeywMs7QVU1RWn8c6F+FTPsBF9MgvSn5L+1uqfAKJnCvxYXOJovM4ycn+tLULWzI/
 UTjHI8F1vikJ5zXJqTJDmPH+m6smdVgY7303CWppTnRbWLvwYBIduLSRbwRMDC/8gmwT
 kUdYhNHZKHEgxnBgGkdM2iE+1Dl+YNAaHDUTsc0tbNumogmDqDQAWBKGksLdwmiNOJjC
 s9pA==
X-Gm-Message-State: AAQBX9dRYI/ST97MQJNdFXriQJACjlyNvFX9Tg9qvuZ7xQqWhvmDHo8Z
 pZfi0qZw2PhRfP5bboUU79qm9q5DyQ5zpWKSK3q7xoRZfoBQGU9d
X-Google-Smtp-Source: AKy350aAVtqNgj6u5uQHiOuBpC+hXB05AljEy0iZU9Txnk59qim9V3zi3PCmxi+MiUGct+mBz7p2nwma3wmxH9LfPAA=
X-Received: by 2002:a17:907:c001:b0:948:d1af:3a11 with SMTP id
 ss1-20020a170907c00100b00948d1af3a11mr4316923ejc.50.1682117190580; Fri, 21
 Apr 2023 15:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
 <20230421165351.3177-12-kariem.taha2.7@gmail.com>
In-Reply-To: <20230421165351.3177-12-kariem.taha2.7@gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 21 Apr 2023 16:46:19 -0600
Message-ID: <CANCZdfoy_V10Ug2q6tF0LyAZQv0KFN_ERyaxnmRoSCh5PZDq0g@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] Signed-off-by: Karim Taha
 <kariem.taha2.7@gmail.com>
To: Karim Taha <kariem.taha2.7@gmail.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000009d8f0d05f9e06dc3"
Received-SPF: none client-ip=2a00:1450:4864:20::635;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000009d8f0d05f9e06dc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh, I see you've uploaded an improved version of the patches, with the
fixes I'd
recommended. I'll queue that series instead.

Warner

On Fri, Apr 21, 2023 at 10:58=E2=80=AFAM Karim Taha <kariem.taha2.7@gmail.c=
om>
wrote:

> From: Warner Losh <imp@bsdimp.com>
>
> Add the dispatching code of bind(2),connect(2), accpet(2), getpeername(2)=
.
>
> Add the bind(2), connect(2), accept(2), getpeername(2) syscalls case
> statements to freebsd_syscall function defined in
> bsd-user/freebsd/os-syscall.c
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
> ---
>  bsd-user/freebsd/os-syscall.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.=
c
> index c8f998ecec..7f29196a05 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -44,6 +44,8 @@
>  #include "signal-common.h"
>  #include "user/syscall-trace.h"
>
> +/* BSD independent syscall shims */
> +#include "bsd-socket.h"
>  #include "bsd-file.h"
>  #include "bsd-proc.h"
>
> @@ -508,6 +510,25 @@ static abi_long freebsd_syscall(void *cpu_env, int
> num, abi_long arg1,
>          ret =3D do_freebsd_sysarch(cpu_env, arg1, arg2);
>          break;
>
> +        /*
> +         * socket related system calls
> +         */
> +    case TARGET_FREEBSD_NR_accept: /* accept(2) */
> +        ret =3D do_bsd_accept(arg1, arg2, arg3);
> +        break;
> +
> +    case TARGET_FREEBSD_NR_bind: /* bind(2) */
> +        ret =3D do_bsd_bind(arg1, arg2, arg3);
> +        break;
> +
> +    case TARGET_FREEBSD_NR_connect: /* connect(2) */
> +        ret =3D do_bsd_connect(arg1, arg2, arg3);
> +        break;
> +
> +    case TARGET_FREEBSD_NR_getpeername: /* getpeername(2) */
> +        ret =3D do_bsd_getpeername(arg1, arg2, arg3);
> +        break;
> +
>      default:
>          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
>          ret =3D -TARGET_ENOSYS;
> --
> 2.40.0
>
>

--0000000000009d8f0d05f9e06dc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh, I see you&#39;ve uploaded an improved=C2=A0version of =
the patches, with the fixes I&#39;d<div>recommended. I&#39;ll queue that se=
ries instead.</div><div><br></div><div>Warner</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 21, 2023 at =
10:58=E2=80=AFAM Karim Taha &lt;<a href=3D"mailto:kariem.taha2.7@gmail.com"=
>kariem.taha2.7@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp=
.com" target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
<br>
Add the dispatching code of bind(2),connect(2), accpet(2), getpeername(2).<=
br>
<br>
Add the bind(2), connect(2), accept(2), getpeername(2) syscalls case<br>
statements to freebsd_syscall function defined in bsd-user/freebsd/os-sysca=
ll.c<br>
<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
Signed-off-by: Karim Taha &lt;<a href=3D"mailto:kariem.taha2.7@gmail.com" t=
arget=3D"_blank">kariem.taha2.7@gmail.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/freebsd/os-syscall.c | 21 +++++++++++++++++++++<br>
=C2=A01 file changed, 21 insertions(+)<br>
<br>
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c<=
br>
index c8f998ecec..7f29196a05 100644<br>
--- a/bsd-user/freebsd/os-syscall.c<br>
+++ b/bsd-user/freebsd/os-syscall.c<br>
@@ -44,6 +44,8 @@<br>
=C2=A0#include &quot;signal-common.h&quot;<br>
=C2=A0#include &quot;user/syscall-trace.h&quot;<br>
<br>
+/* BSD independent syscall shims */<br>
+#include &quot;bsd-socket.h&quot;<br>
=C2=A0#include &quot;bsd-file.h&quot;<br>
=C2=A0#include &quot;bsd-proc.h&quot;<br>
<br>
@@ -508,6 +510,25 @@ static abi_long freebsd_syscall(void *cpu_env, int num=
, abi_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D do_freebsd_sysarch(cpu_env, arg1,=
 arg2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* socket related system calls<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 case TARGET_FREEBSD_NR_accept: /* accept(2) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_bsd_accept(arg1, arg2, arg3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case TARGET_FREEBSD_NR_bind: /* bind(2) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_bsd_bind(arg1, arg2, arg3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case TARGET_FREEBSD_NR_connect: /* connect(2) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_bsd_connect(arg1, arg2, arg3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case TARGET_FREEBSD_NR_getpeername: /* getpeername(2) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_bsd_getpeername(arg1, arg2, arg3);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot;Unsupporte=
d syscall: %d\n&quot;, num);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -TARGET_ENOSYS;<br>
-- <br>
2.40.0<br>
<br>
</blockquote></div>

--0000000000009d8f0d05f9e06dc3--

