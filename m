Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E75D5E7590
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 10:18:59 +0200 (CEST)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obdth-0006VJ-KO
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 04:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obdoI-0002lx-PM
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 04:13:22 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:46606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obdoD-0004o0-KJ
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 04:13:19 -0400
Received: by mail-lj1-x22f.google.com with SMTP id p5so13714894ljc.13
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 01:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BG/lcjgO0B0XtqLMX/BMhExNhK8+BcMKYENvj6MFrGc=;
 b=SQaqIlfHo4ZdGil5Qo8ZmQ7dzh6HLORSy30fO1wrU053XZtM6KPIKL2y0P5czr0LD9
 9LphrJpbqphBHL/nNKpAPFJQzrex4sNJ3lDhpvvYXga1yu3y2FBZhmuPJXdlQo7dlkUi
 4XVfvZMPyU4QV2lFEymoc9Jx8xvdolXXuJaqeQLjl0RNYXmAdY2UsTje9yBNeIfpD6v7
 8D2PdIx5WEMBAemzVdC8PLF0fFc2CEOyn18BRCXPFmY07gISUkhRC8dOj2SIfp8Jot8O
 UtQNnbfsPkT6/qinLHcJ1j7pdgWZc+xq0h1dcfx2PMF33XA3ZtBVi/JKkcHmU3tqbply
 a7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BG/lcjgO0B0XtqLMX/BMhExNhK8+BcMKYENvj6MFrGc=;
 b=lXiSDi2tUpQ27bxuGxiWj7d7PW54KhSdN06RPf3uYGiUnCYsD1DaTqa+RCfDSRvEH1
 DbRXRUVhQWfnRA7KPrqYSM1HJ6obFPGG0nms8ikpLuFT8NevgaFEwWpRuIenpRD2nd32
 IMdt//wNBy48m6XLfetqbv+zBUuEBPq5JX/mF7E7Q3dxTuQHwuNv2hRvQQOnawmq6WFu
 Knzt00QSeFfycUvrvOnaEJLja5kSn7XqSvWGfTeCJIQcqgX4Mut8TFLGrOI34P1iN1Av
 6lUSXs1Oe8DGBi0U1vn51d0YlWATqREnQeO3cxmeEjsgs8Mb0mKO9Jdqij2VOCtHW5pR
 7upw==
X-Gm-Message-State: ACrzQf1UAzgR8LbiXz3wz/nRAI7z2oj51rcdKVbfpP01U6Ye4UkgrRQe
 nkJcyQqrclSXQSAHNmaEArzHFMublw3JWMnaiu0=
X-Google-Smtp-Source: AMsMyM7uMCNrLvT3nAejPplDXBrAn6FDXykXe0XLC/16xqsY21SJnCuMqH7Q2B3sz1xWSwMKFDRVrCM4cMZtvKY8EHs=
X-Received: by 2002:a2e:9b17:0:b0:26c:4ede:512c with SMTP id
 u23-20020a2e9b17000000b0026c4ede512cmr2381469lji.529.1663920795764; Fri, 23
 Sep 2022 01:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
 <20220922132001.940334-5-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220922132001.940334-5-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 23 Sep 2022 10:13:04 +0200
Message-ID: <CAJ+F1C+mnADMfejJPuqr04F5J+Gh4h-A=LpneS=_e+G5OQ2TdQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] qga: Add shutdown/halt/reboot support for FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="000000000000f74df605e953bfcb"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f74df605e953bfcb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 22, 2022 at 3:51 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Add appropriate shutdown command arguments in qmp_guest_shutdown()
> for FreeBSD.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  qga/commands-posix.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 3a1055d5c3..60cc673f25 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -242,6 +242,10 @@ void qmp_guest_shutdown(bool has_mode, const char
> *mode, Error **errp)
>      const char *powerdown_flag =3D "-i5";
>      const char *halt_flag =3D "-i0";
>      const char *reboot_flag =3D "-i6";
> +#elifdef CONFIG_BSD
>

It might be the first time I see a patch with "#elifdef" :) this is C2X, so
please use "#elif defined(..)" instead


> +    const char *powerdown_flag =3D "-p";
> +    const char *halt_flag =3D "-h";
> +    const char *reboot_flag =3D "-r";
>  #else
>      const char *powerdown_flag =3D "-P";
>      const char *halt_flag =3D "-H";
> @@ -272,6 +276,9 @@ void qmp_guest_shutdown(bool has_mode, const char
> *mode, Error **errp)
>  #ifdef CONFIG_SOLARIS
>          execl("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
>                "hypervisor initiated shutdown", (char *)NULL);
> +#elifdef CONFIG_BSD
> +        execl("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
> +               "hypervisor initiated shutdown", (char *)NULL);
>  #else
>          execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
>                 "hypervisor initiated shutdown", (char *)NULL);
> --
> 2.34.1
>
>
>
lgtm otherwise

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f74df605e953bfcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22, 2022 at 3:51 P=
M Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com">al=
exander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Add appropriate shutdown command arguments in q=
mp_guest_shutdown()<br>
for FreeBSD.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 3a1055d5c3..60cc673f25 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -242,6 +242,10 @@ void qmp_guest_shutdown(bool has_mode, const char *mod=
e, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0const char *powerdown_flag =3D &quot;-i5&quot;;<br>
=C2=A0 =C2=A0 =C2=A0const char *halt_flag =3D &quot;-i0&quot;;<br>
=C2=A0 =C2=A0 =C2=A0const char *reboot_flag =3D &quot;-i6&quot;;<br>
+#elifdef CONFIG_BSD<br></blockquote><div><br></div><div>It might be the fi=
rst time I see a patch with &quot;#elifdef&quot; :) this is C2X, so please =
use &quot;#elif defined(..)&quot; instead<br></div><div>=C2=A0 <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 const char *powerdown_flag =3D &quot;-p&quot;;<br>
+=C2=A0 =C2=A0 const char *halt_flag =3D &quot;-h&quot;;<br>
+=C2=A0 =C2=A0 const char *reboot_flag =3D &quot;-r&quot;;<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0const char *powerdown_flag =3D &quot;-P&quot;;<br>
=C2=A0 =C2=A0 =C2=A0const char *halt_flag =3D &quot;-H&quot;;<br>
@@ -272,6 +276,9 @@ void qmp_guest_shutdown(bool has_mode, const char *mode=
, Error **errp)<br>
=C2=A0#ifdef CONFIG_SOLARIS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(&quot;/sbin/shutdown&quot;, &quot;s=
hutdown&quot;, shutdown_flag, &quot;-g0&quot;, &quot;-y&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hypervisor ini=
tiated shutdown&quot;, (char *)NULL);<br>
+#elifdef CONFIG_BSD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(&quot;/sbin/shutdown&quot;, &quot;shutdo=
wn&quot;, shutdown_flag, &quot;+0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hypervisor in=
itiated shutdown&quot;, (char *)NULL);<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(&quot;/sbin/shutdown&quot;, &quot;s=
hutdown&quot;, &quot;-h&quot;, shutdown_flag, &quot;+0&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hypervisor in=
itiated shutdown&quot;, (char *)NULL);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"></div><div>lgtm otherwise</div><div><b=
r></div><div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div></div>

--000000000000f74df605e953bfcb--

