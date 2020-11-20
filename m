Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128382BB168
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:30:10 +0100 (CET)
Received: from localhost ([::1]:43906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAEb-0007rJ-4H
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1kgADh-0007Fc-6c; Fri, 20 Nov 2020 12:29:13 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:44948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1kgADf-0001mm-Ls; Fri, 20 Nov 2020 12:29:12 -0500
Received: by mail-io1-xd31.google.com with SMTP id o11so10684174ioo.11;
 Fri, 20 Nov 2020 09:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9RZvWXlVz+1NpVbn62266BSYs/8NKhQu7/3HqMOcaIs=;
 b=cJyQpsuSrlfNHMHRPOMucojSIbQ6nCmuvlQWRKM3+Bhr/jRshvGtUNr9tOMCM0d6mF
 XNxlWKcOZY9CePbV9A33sqBBHtfDv3zxwtgB0NJRZZLh4Z021g29Uw9sf7AuhkOie/w+
 xKs5JHxlNtT3Nr88RhXHcmYWlXLAI4NsOFYh42vnCTTmKTNfEvRPGB+Bm2FzPKAzUmzU
 c5nGLGlMkF8JskOSpXnxHRqbgOEmGx8HBOK3sXhZ8q+NyINJYLjO7L9nk0MpfW9bq3df
 sbvKIUeHDFJ2Shvov8GbEKrYpCQXx18aM9n27EumZwglqyL49ch0Q0o4Px8BfBxd707q
 v4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9RZvWXlVz+1NpVbn62266BSYs/8NKhQu7/3HqMOcaIs=;
 b=TvLa+MxdYmK1uZqJcLOkDf3MOhqBWGF1sckd2dsh4bwhlPhVM9YlnE3LRptkMe1tm3
 Fz+bsqmmyE676Ef7khb7GnBGn9k+QMdpiSowE2OvLa4k2YSZggW22ZjHOzegtQBY+zjj
 E4inHsf1Fu085OvwBPQWE7oxehwsCWeA/rKlJsihun51r6q940JIKmxVgZ0ffIujwyOZ
 /i/gVjQg7/PrcjZ+JkvlZduNYaVSZEu6XWH4Iumr0X5Lz3CJ72C4U9wAqGJ9ABUh1uEO
 RnL0wripD8ibhyF+3Ao6VTojtiFPqg59QXkA3GfXi6PW6rWD0j68gfEqOk8Lthn2VLOr
 voDQ==
X-Gm-Message-State: AOAM532pcdMNfrp9ALUJdZgLnXYLtPeAb+6n/JYYZhzwUVZ2h8TMddBD
 RKaAkeVd1T8mH68Q6nPkz2sTx/7Ipu96aq+6EKI=
X-Google-Smtp-Source: ABdhPJzSef94ZOaE9wF7fZEzbQwJLHbuuYN95TfXrNOx3pAX1LdRh9VQBa9zBmJ2ADHZrHhmAKvfCKiQrKLyPeeWwXI=
X-Received: by 2002:a05:6638:10ef:: with SMTP id
 g15mr20228421jae.85.1605893349892; 
 Fri, 20 Nov 2020 09:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20201120154545.2504625-1-f4bug@amsat.org>
 <20201120154545.2504625-5-f4bug@amsat.org>
In-Reply-To: <20201120154545.2504625-5-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Fri, 20 Nov 2020 18:28:58 +0100
Message-ID: <CAPan3Wr0Dd3XnK9Sd8UM8yoq39VE4ZG_czeuooBTAFnUeCRuZw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 4/6] MAINTAINERS: Fix system/arm/orangepi.rst path
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000aae8e105b48d2e80"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aae8e105b48d2e80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Op vr 20 nov. 2020 16:46 schreef Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>:

> Fixes: 0553ef42571 ("docs: add Orange Pi PC document")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

---
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2623cf85f66..311a55317ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -559,7 +559,7 @@ S: Maintained
>  F: hw/*/allwinner-h3*
>  F: include/hw/*/allwinner-h3*
>  F: hw/arm/orangepi.c
> -F: docs/system/orangepi.rst
> +F: docs/system/arm/orangepi.rst
>
>  ARM PrimeCell and CMSDK devices
>  M: Peter Maydell <peter.maydell@linaro.org>
> --
> 2.26.2
>
>

--000000000000aae8e105b48d2e80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Op vr 20 nov. 2020 16:46 schreef Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Fixes: 0553ef42571 (&quot;docs: add Ora=
nge Pi PC document&quot;)<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br></bl=
ockquote></div></div><div dir=3D"auto">Reviewed-by: Niek Linnenbank &lt;<a =
href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
---<br>
Cc: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">nieklinnenbank@gmail.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 2623cf85f66..311a55317ce 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -559,7 +559,7 @@ S: Maintained<br>
=C2=A0F: hw/*/allwinner-h3*<br>
=C2=A0F: include/hw/*/allwinner-h3*<br>
=C2=A0F: hw/arm/orangepi.c<br>
-F: docs/system/orangepi.rst<br>
+F: docs/system/arm/orangepi.rst<br>
<br>
=C2=A0ARM PrimeCell and CMSDK devices<br>
=C2=A0M: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targ=
et=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt;<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div></div></div>

--000000000000aae8e105b48d2e80--

