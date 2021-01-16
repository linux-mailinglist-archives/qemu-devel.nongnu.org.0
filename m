Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4367D2F8DB0
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 17:30:25 +0100 (CET)
Received: from localhost ([::1]:34248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0oT1-0008QM-Rj
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 11:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l0oRk-0007vA-Ti
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 11:29:05 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:41159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l0oRh-0007tu-W9
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 11:29:04 -0500
Received: by mail-qt1-x834.google.com with SMTP id j26so8334510qtq.8
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 08:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9vkaKqpFog4RJaXK06vFucVy6NaXyIRoCFanRKsv9UY=;
 b=nTvJX/hJ0W2GnVAQEyF85c1V7l20NwfxJzTENzyvasAOCrwnjoCAKJTVNbfsTUJXtz
 4lnf3X7qjksnfQ13KSCmg4whpJDsjnYMYtQNpXWaV5xbnnPetDw/FG+KP+kVfi1WUk4C
 CgWRlQzlSdbSnKfMpTkUBVbIZEUFbHp5P9EluSkRN8f8nM6ShN3GOC49+GIlU3AAS/ks
 2qAf8WYMhutBNCT9iEi332b1/VZpJs8QyB+4FSV7w0uoMnFGKmz6gE+3YziGZ/Jzwebc
 A4Zgpf3CO8Ma9lqnCWN7ODcxCmvO6/LUuxwUQEZnLGto+Lz+EpmYK6VFrv76+2vuttwc
 y60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9vkaKqpFog4RJaXK06vFucVy6NaXyIRoCFanRKsv9UY=;
 b=sMWlwIRExICq7DEwpjHHBdVB3/Dod1WmoCTC3zG4YfWgzfb3vcbDCR++vRVf+5dW7X
 Cl6XIYc1g738ht+6kZiAu7ghw3q8LccmjE0WSdOS2Btk5dvTGy6JS/brZW63LwxHCV9g
 x+rQwIjB/rCFJvIWU4MhQdicrGNv1T64P2MbzIE1O5tpux5dxwoR5ZeWMrOEvelhp6rQ
 c8ZEcm3bVdYC6os6eM1pkfZv+vShvRF/3ekR/R7K8YAnqTjKTUEnEah0HHBjT4T0VgcC
 crO7QcFqK3UOJPrMGsYxGle08/z96bWwIWB6FPsSYeJxVC/tleU3WYLu3axhcSRVeTwp
 epoA==
X-Gm-Message-State: AOAM530uytm86JaHZ5R3Wk2/TGtSJ+IPpPEkqLggB5osLPd+WeRzjIJn
 Ys4GTBdGs0FWunCbizuo/qp7s+pmAXLcPtVlPjDE+g==
X-Google-Smtp-Source: ABdhPJwyJoR9EfBTynvvmFmahAEGAe5jhGlODcjl/g7iH6r7e9niX51UpkpxperKWXSRk2ZflalwVdYgI8k+RTb0sNM=
X-Received: by 2002:a05:622a:303:: with SMTP id
 q3mr16114033qtw.235.1610814538072; 
 Sat, 16 Jan 2021 08:28:58 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-9-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-9-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 16 Jan 2021 09:28:47 -0700
Message-ID: <CANCZdfpZ3S+chhSfM-1wNgz5b7Xkc8GNYmo3Sooe72qn9iH6Zw@mail.gmail.com>
Subject: Re: [PATCH v3 08/21] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000057592a05b906fcc0"
Received-SPF: none client-ip=2607:f8b0:4864:20::834;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000057592a05b906fcc0
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 15, 2021 at 3:56 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> These constants are only ever used with access_ok, and friends.
> Rather than translating them to PAGE_* bits, let them equal
> the PAGE_* bits to begin.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>

This looks OK to me.

Reviewed-by: Warner Losh <imp@bsdimp.com>


> ---
>  bsd-user/qemu.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index f8bb1e5459..4076adabd0 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -218,13 +218,12 @@ extern unsigned long x86_stack_size;
>
>  /* user access */
>
> -#define VERIFY_READ 0
> -#define VERIFY_WRITE 1 /* implies read access */
> +#define VERIFY_READ  PAGE_READ
> +#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
>
> -static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
> +static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
>  {
> -    return page_check_range((target_ulong)addr, size,
> -                            (type == VERIFY_READ) ? PAGE_READ :
> (PAGE_READ | PAGE_WRITE)) == 0;
> +    return page_check_range((target_ulong)addr, size, type) == 0;
>  }
>
>  /* NOTE __get_user and __put_user use host pointers and don't check
> access. */
> --
>

--00000000000057592a05b906fcc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 15, 2021 at 3:56 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">These constants are only ever used with access_ok, and fr=
iends.<br>
Rather than translating them to PAGE_* bits, let them equal<br>
the PAGE_* bits to begin.<br>
<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></block=
quote><div><br></div><div>This looks OK to me.</div><div><br></div><div>Rev=
iewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com<=
/a>&gt;</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0bsd-user/qemu.h | 9 ++++-----<br>
=C2=A01 file changed, 4 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
index f8bb1e5459..4076adabd0 100644<br>
--- a/bsd-user/qemu.h<br>
+++ b/bsd-user/qemu.h<br>
@@ -218,13 +218,12 @@ extern unsigned long x86_stack_size;<br>
<br>
=C2=A0/* user access */<br>
<br>
-#define VERIFY_READ 0<br>
-#define VERIFY_WRITE 1 /* implies read access */<br>
+#define VERIFY_READ=C2=A0 PAGE_READ<br>
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)<br>
<br>
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)<br>
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return page_check_range((target_ulong)addr, size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (type =3D=3D VERIFY_READ) ? PAGE_READ : (PAGE_READ=
 | PAGE_WRITE)) =3D=3D 0;<br>
+=C2=A0 =C2=A0 return page_check_range((target_ulong)addr, size, type) =3D=
=3D 0;<br>
=C2=A0}<br>
<br>
=C2=A0/* NOTE __get_user and __put_user use host pointers and don&#39;t che=
ck access. */<br>
-- <br></blockquote><div><br></div><div><br></div><div>=C2=A0</div></div></=
div>

--00000000000057592a05b906fcc0--

