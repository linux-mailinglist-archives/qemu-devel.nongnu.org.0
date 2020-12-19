Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B142DF216
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 00:24:20 +0100 (CET)
Received: from localhost ([::1]:52466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqlaF-00044f-S0
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 18:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kqlZ3-0003Vm-KA
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 18:23:05 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:38393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kqlZ0-0004Yg-2t
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 18:23:04 -0500
Received: by mail-lf1-x134.google.com with SMTP id h205so14907946lfd.5
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 15:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=3VJtByOFUU5J+PC9Od54d+K/yIGnIdW3oEVmsDgkrAk=;
 b=o9HAfoP62utohjn7wAvovB2Skgr7KTrgb+vr3nRsUumzZpLLnc5KZo16j1v4T0PgGx
 Dy8HOmWe+wgh4mqMBndpd7HjZRxNPcOHeu6V3bBDxHPDakKm38JEdHNp8B0CeJ58pyWr
 39hk8eaRM2E8SRcFXIJq+qWnwihPbcretDRz3Vzov3mOtQPRmQV//MqxX3pn8ydoW+El
 AnmZ+P7qo/FwuQkSv7hDV39yjr8BhsaM+V8of6SgJhocjaLATy7YDStleUtR//oWKtqx
 v8jGGCjT7Ce8RCRztcMlNfFG1kj77X+nnAdh/uI1sxghT6pfCXI8CtJWMtCYeeCIdct4
 7qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=3VJtByOFUU5J+PC9Od54d+K/yIGnIdW3oEVmsDgkrAk=;
 b=CqZhkECQ8eYLo6r6T7kT/WfHw3G69mVU2OeAYWdQpj0NOY0syzE/88oMJfz4DyJod6
 1LW11eMlxb8/rLRVRVs7k9BVOX1hfjHfQcb91nJZE12OIHh78Q6uTZieVTpLxaEX85t7
 YuEE91T9ayxXlEryXCkE9mesDpF6Pg2P7LCL7suLj9+tAplhFh2hdH5bcwJZopd8HTmx
 VVuDECdcb4yidujcZl4xtdfJRfbHkzfEU+fIpe8qg/8fRca74mDh1CQrEWY5Kad1ypNI
 QSrzVl+/UPrf7uP8Hnxlhkpy8EKoMjUx0HGrBnicbbA50Fd/Q90ADJemiMLEAc7o8AY7
 Oodw==
X-Gm-Message-State: AOAM532PsSPr9ba7mIcuxXRZ63hJ42tjBWwIYjmHQjvQiKRwhuZhWwuJ
 Raf4Jsf+Cr8revqO5CV9PwWKpb/P+8GeuS6Sm/xUne37jRgGHg==
X-Google-Smtp-Source: ABdhPJznHwkg520GHkgG+yHR3SV7cKpAwBh1EDCUNlPFzNz8RkPP7483svED9SPFi5V57+B8NLxCe6Cd6frQnD47QbY=
X-Received: by 2002:a19:8c04:: with SMTP id o4mr3805755lfd.333.1608420179728; 
 Sat, 19 Dec 2020 15:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20201218205250.86382-1-imp@freebsd.org>
 <20201218205250.86382-3-imp@freebsd.org>
In-Reply-To: <20201218205250.86382-3-imp@freebsd.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 19 Dec 2020 16:22:52 -0700
Message-ID: <CANCZdfpW_aC1vMRztEFPCCZ2Ka2fUuQPGGM=MxbgGunxyOFF7g@mail.gmail.com>
Subject: Re: [PATCH 2/4] tcg: Additional Trap type for FreeBSD
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000076727705b6d98160"
Received-SPF: none client-ip=2a00:1450:4864:20::134;
 envelope-from=wlosh@bsdimp.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

--00000000000076727705b6d98160
Content-Type: text/plain; charset="UTF-8"

Again, this turns out to be bogus, for reasons I enumerated the first time
it sent...

Warner

On Sat, Dec 19, 2020 at 1:54 PM <imp@freebsd.org> wrote:

> From: Sean Bruno <sbruno@freebsd.org>
>
> FreeBSD can generate a trap 0xc as well as 0xe when writing to a
> read-only page.
>
> Signed-off-by: Juergen Lock <nox@FreeBSD.org>
> [imp rewored commit message for clarity]
> Signed-off-by: Warner Losh <imp@FreeBSD.org>
> ---
>  accel/tcg/user-exec.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 4ebe25461a..1f5befa9f9 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -343,7 +343,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>
>      pc = PC_sig(uc);
>      return handle_cpu_signal(pc, info,
> -                             TRAP_sig(uc) == 0xe ? (ERROR_sig(uc) >> 1) &
> 1 : 0,
> +#if defined(__FreeBSD__) || defined(__DragonFly__)
> +                             (TRAP_sig(uc) == 0xe ||
> +                              TRAP_sig(uc) == 0xc) ?
> +#else
> +                             TRAP_sig(uc) == 0xe ?
> +#endif
> +                             (ERROR_sig(uc) >> 1) & 1 : 0,
>                               &MASK_sig(uc));
>  }
>
> --
> 2.22.1
>
>
>

--00000000000076727705b6d98160
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Again, this turns out to be bogus, for reasons I enumerate=
d the first time it sent...<div><br></div><div>Warner</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 19, =
2020 at 1:54 PM &lt;<a href=3D"mailto:imp@freebsd.org">imp@freebsd.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Sean Bruno &lt;<a href=3D"mailto:sbruno@freebsd.org" target=3D"_blank">sbr=
uno@freebsd.org</a>&gt;<br>
<br>
FreeBSD can generate a trap 0xc as well as 0xe when writing to a<br>
read-only page.<br>
<br>
Signed-off-by: Juergen Lock &lt;nox@FreeBSD.org&gt;<br>
[imp rewored commit message for clarity]<br>
Signed-off-by: Warner Losh &lt;imp@FreeBSD.org&gt;<br>
---<br>
=C2=A0accel/tcg/user-exec.c | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 4ebe25461a..1f5befa9f9 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -343,7 +343,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0pc =3D PC_sig(uc);<br>
=C2=A0 =C2=A0 =C2=A0return handle_cpu_signal(pc, info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TRAP_sig(uc) =3D=3D 0xe ? (ERROR_sig(uc) &gt=
;&gt; 1) &amp; 1 : 0,<br>
+#if defined(__FreeBSD__) || defined(__DragonFly__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(TRAP_sig(uc) =3D=3D 0xe ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TRAP_sig(uc) =3D=3D 0xc) ?<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TRAP_sig(uc) =3D=3D 0xe ?<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ERROR_sig(uc) &gt;&gt; 1) &amp; 1 : 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;MASK_sig(uc));<br>
=C2=A0}<br>
<br>
-- <br>
2.22.1<br>
<br>
<br>
</blockquote></div>

--00000000000076727705b6d98160--

