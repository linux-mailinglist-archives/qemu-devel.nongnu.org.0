Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A665102A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 17:19:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IrW-0006NW-Qv; Mon, 19 Dec 2022 11:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1p7IrT-0006Ln-JZ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:19:31 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1p7IrR-0005yp-4t
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:19:31 -0500
Received: by mail-ej1-x631.google.com with SMTP id u19so22726200ejm.8
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 08:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iQvFs6PkycKTf3Svdkh7oCyKGR9vUPvyK3BOvHendY8=;
 b=NAREb39kuilPQGc6SqkDlgPHnM9OLi1qVNI5p3HRtNJiccDaRiqsqPn0+uqCoABiZl
 53zH/IZNSGkWX1jiXL26kcs+eMI7gCOSChKFKPgagUjKe5CPqAyvs7sLOQN4YHRjS2Lm
 R0Vk8Ew6ZKkfaZuGZyRLWAOb8uayZsRONHiO+irGDp+KqNaENzYsCy+9/fXzEBX2eBCb
 Ghsgf8Xr8Eg0riTAc1rhA7hCsKT9vh4qwgDOw0xy/luS+vShiqvmD276OzPbFUXD12b7
 KsF2ovbJxq/mJSv9AJdTCc1xmzkryAygqdCtu3sGB3sWBbwcn+JCAbmLIxWyO7qcNO6+
 kLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iQvFs6PkycKTf3Svdkh7oCyKGR9vUPvyK3BOvHendY8=;
 b=BcYsqdkb47vZZjHHPjmEKA3EAO9HcCS3mkyoN3ARcKaNO5tzNvzSl6gMPdY+0jChZo
 nLxZykPZb0ES/CHooug7CheCOT504v9J/jMgMsOrKQH84lt8GYfFZbIBTMAulk5FdWHy
 Efqo3Qti2IowGCBu1IawY72o0pj8NDijEU6kTubSnf8mGviHtWnvwxBBbC02JXjmhwc5
 hfiGaojhgxQ7bSFuZ9LiKlbIwq8r9hNQFcOVS0oIolRPjiP1ZygLnKQBqJI9wvq+AWTs
 Q6Jy8bHd8rtDtyOJN1oiLgYesOiIvSZI8qbuwExTLR7DpNfc2LKmmeV/cmncXprVgtS9
 hj5A==
X-Gm-Message-State: ANoB5pkfunAcaT2Xuf6tkYCoa2Lz7610mMj3g4P28edxazikTPA3p9TY
 1nSXsh72CeTBqmHo3k9yHn+j4ypunWBb/Yl6tJsrcw==
X-Google-Smtp-Source: AA0mqf6LPUK8fA47C6x4wSJ33yS7liya+YqSalmZ7fQ4z6tKKXPy8s3bO4X6ndQir75j56fSjfUtnvmJmqFQXmvaBb4=
X-Received: by 2002:a17:907:a481:b0:7bc:2ad:fae with SMTP id
 vp1-20020a170907a48100b007bc02ad0faemr2280140ejc.724.1671466767239; Mon, 19
 Dec 2022 08:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20221219121914.851488-1-alex.bennee@linaro.org>
 <20221219121914.851488-4-alex.bennee@linaro.org>
In-Reply-To: <20221219121914.851488-4-alex.bennee@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 19 Dec 2022 08:19:16 -0800
Message-ID: <CAAeLtUDA8cPpkKNKf_M5Da5ePNkSyGq19eDt495fifFGwS3Aig@mail.gmail.com>
Subject: Re: [PATCH 03/11] contrib/gitdm: Add VRULL to the domain map
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ea610205f030aefb"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x631.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_OBFUSCATE_10_20=0.093, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000ea610205f030aefb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon 19. Dec 2022 at 04:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

> Philipp I assume I'm correct that the QEMU work should be shown as a
> corporate contribution?


Indeed.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>


Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>


> ---
>  contrib/gitdm/domain-map | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index da51c44ccb..7ff511d5c6 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -40,6 +40,7 @@ sifive.com      SiFive
>  suse.com        SUSE
>  suse.de         SUSE
>  virtuozzo.com   Virtuozzo
> +vrull.eu        VRULL
>  wdc.com         Western Digital
>  windriver.com   Wind River
>  xilinx.com      Xilinx
> --
> 2.34.1
>

--000000000000ea610205f030aefb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon 19. Dec 2022 at 04:19, Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Philipp I assume I&#39;m correct that=
 the QEMU work should be shown as a<br>
corporate contribution?</blockquote><div dir=3D"auto"><br></div><div dir=3D=
"auto">Indeed.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex" dir=3D"auto">
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Philipp Tomsich &lt;<a href=3D"mailto:philipp.tomsich@vrull.eu" target=
=3D"_blank">philipp.tomsich@vrull.eu</a>&gt;</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">Reviewed-by: Philipp Tomsich &lt;<a href=3D"mai=
lto:philipp.tomsich@vrull.eu">philipp.tomsich@vrull.eu</a>&gt;</div><div di=
r=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
---<br>
=C2=A0contrib/gitdm/domain-map | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map<br>
index da51c44ccb..7ff511d5c6 100644<br>
--- a/contrib/gitdm/domain-map<br>
+++ b/contrib/gitdm/domain-map<br>
@@ -40,6 +40,7 @@ <a href=3D"http://sifive.com" rel=3D"noreferrer" target=
=3D"_blank">sifive.com</a>=C2=A0 =C2=A0 =C2=A0 SiFive<br>
=C2=A0<a href=3D"http://suse.com" rel=3D"noreferrer" target=3D"_blank">suse=
.com</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 SUSE<br>
=C2=A0<a href=3D"http://suse.de" rel=3D"noreferrer" target=3D"_blank">suse.=
de</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUSE<br>
=C2=A0<a href=3D"http://virtuozzo.com" rel=3D"noreferrer" target=3D"_blank"=
>virtuozzo.com</a>=C2=A0 =C2=A0Virtuozzo<br>
+<a href=3D"http://vrull.eu" rel=3D"noreferrer" target=3D"_blank">vrull.eu<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 VRULL<br>
=C2=A0<a href=3D"http://wdc.com" rel=3D"noreferrer" target=3D"_blank">wdc.c=
om</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Western Digital<br>
=C2=A0<a href=3D"http://windriver.com" rel=3D"noreferrer" target=3D"_blank"=
>windriver.com</a>=C2=A0 =C2=A0Wind River<br>
=C2=A0<a href=3D"http://xilinx.com" rel=3D"noreferrer" target=3D"_blank">xi=
linx.com</a>=C2=A0 =C2=A0 =C2=A0 Xilinx<br>
-- <br>
2.34.1<br>
</blockquote></div></div>

--000000000000ea610205f030aefb--

