Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDDA40102B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:26:18 +0200 (CEST)
Received: from localhost ([::1]:36142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMt69-00005c-4z
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mMt4r-0007s5-K4
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:24:57 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:38791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mMt4q-0002OV-6d
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:24:57 -0400
Received: by mail-ua1-x92d.google.com with SMTP id s4so2306935uar.5
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iMki1WzaAxIJV+tuRfGlAaQ7qzuCZHF4lXSuNzk/JY4=;
 b=CKvvUlWHHZ/yZZPJGq9W/UKfosoGuHkpmCd+9atYPTE28r2o+fG+VAfZHsI0wlcJ5r
 O47jN0xj1JyEMQxRDZ9LJ40hG3rY9v0jnIToD/xmvnk2rrNcHxSSyISzumIy75Wan47K
 SsubXZqna3+YHjgl7oOdS47lM8TuPEiGsEWpAn5uhfnN7FSea7InYm4U7WH7jCSJv47f
 PAx1Zd/DcuxL1qgI8j+xvl9OTPyvOLt5gFDbC7QwcZiVJJVFFZFUbu/75nKMWgGIm3mv
 gMpDbQkNEhOmpjexXV7DodiYhGIVnSjg7JE26ff9Ng+PotoAsOA4dyJNAtINvASRyDoO
 05pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMki1WzaAxIJV+tuRfGlAaQ7qzuCZHF4lXSuNzk/JY4=;
 b=dBJimQ9NVaAcNHclNdgJsrnG36V9vsFH9atYYhi8wBCPMS86sg7oASsMfX0bXLHOkT
 Krcx1eAaokXfrie8k25/cXfITPW4sJ6vMyU0ZEOyiWXBjZOjIe7FKud4eBYhpCo6rhry
 KWbSCIZAQpL/DJoMRVlbbufD64XVI20/2x+Vf1HpOP9PuLDV8k+h8xFl4mSq/y6QQ0KT
 +gf00kaoRCjY5qda8NQ9rsozIovBT9ofvdJWXgDvFuRYu2MspwJ7G0mXRF1+Mq8Xi89U
 43twZEqacT8gJSD0KqmF9ISB0UwXRLFsm2q5dDA4CRkyeLJDo7eT5nzQ6AH9dgKkjXEC
 jv1w==
X-Gm-Message-State: AOAM531lg8ZMlEEKvaDtAeqAKDJgQ9zIzPVvHhQkt/1J+mcwFzzpXPzv
 vPtk/WQ/J8EVhq/y6SYH0o14dlhnv95cHYMgpUm/MVVQy0my9w==
X-Google-Smtp-Source: ABdhPJxR0z7TlAd+ZtraRiLagXyNOFGm4SF6A5JqC/3BKqq1j4suVHcmQADpUVyAgKsMVQ/g2QHqXVvXCzqxfQCb2AM=
X-Received: by 2002:a9f:2a87:: with SMTP id z7mr3579923uai.11.1630851895046;
 Sun, 05 Sep 2021 07:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210904235542.1092641-1-f4bug@amsat.org>
 <20210904235542.1092641-2-f4bug@amsat.org>
In-Reply-To: <20210904235542.1092641-2-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 5 Sep 2021 08:24:44 -0600
Message-ID: <CANCZdfoMw04ODcSaNHsWQGkAHF=_9xE8EMAFu3xe3PwxeFDUjw@mail.gmail.com>
Subject: Re: [PATCH v2 01/24] target/avr: Remove pointless use of
 CONFIG_USER_ONLY definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000e2cc8005cb404bb3"
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e2cc8005cb404bb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 4, 2021 at 5:55 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Commit f1c671f96cb ("target/avr: Introduce basic CPU class object")
> added to target/avr/cpu.h:
>
>   #ifdef CONFIG_USER_ONLY
>   #error "AVR 8-bit does not support user mode"
>   #endif
>
> Remove the CONFIG_USER_ONLY definition introduced by mistake in
> commit 78271684719 ("cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
> pointer in CPUClass").
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/avr/cpu.c | 3 ---
>  1 file changed, 3 deletions(-)
>

Reviewed-By: Warner Losh <imp@bsdimp.com>



> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index ea14175ca55..5d70e34dd54 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -197,10 +197,7 @@ static const struct TCGCPUOps avr_tcg_ops =3D {
>      .synchronize_from_tb =3D avr_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D avr_cpu_exec_interrupt,
>      .tlb_fill =3D avr_cpu_tlb_fill,
> -
> -#ifndef CONFIG_USER_ONLY
>      .do_interrupt =3D avr_cpu_do_interrupt,
> -#endif /* !CONFIG_USER_ONLY */
>  };
>
>  static void avr_cpu_class_init(ObjectClass *oc, void *data)
> --
> 2.31.1
>
>

--000000000000e2cc8005cb404bb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 4, 2021 at 5:55 PM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Commit f1c671f96cb (&quot;target/avr: Introduce basic CPU class object&quo=
t;)<br>
added to target/avr/cpu.h:<br>
<br>
=C2=A0 #ifdef CONFIG_USER_ONLY<br>
=C2=A0 #error &quot;AVR 8-bit does not support user mode&quot;<br>
=C2=A0 #endif<br>
<br>
Remove the CONFIG_USER_ONLY definition introduced by mistake in<br>
commit 78271684719 (&quot;cpu: tcg_ops: move to tcg-cpu-ops.h, keep a<br>
pointer in CPUClass&quot;).<br>
<br>
Reported-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/avr/cpu.c | 3 ---<br>
=C2=A01 file changed, 3 deletions(-)<br></blockquote><div><br></div><div><d=
iv>Reviewed-By: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdim=
p.com</a>&gt;</div><div><br></div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
diff --git a/target/avr/cpu.c b/target/avr/cpu.c<br>
index ea14175ca55..5d70e34dd54 100644<br>
--- a/target/avr/cpu.c<br>
+++ b/target/avr/cpu.c<br>
@@ -197,10 +197,7 @@ static const struct TCGCPUOps avr_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D avr_cpu_synchronize_from_tb,<b=
r>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_interrupt =3D avr_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D avr_cpu_tlb_fill,<br>
-<br>
-#ifndef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D avr_cpu_do_interrupt,<br>
-#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
<br>
=C2=A0static void avr_cpu_class_init(ObjectClass *oc, void *data)<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000e2cc8005cb404bb3--

