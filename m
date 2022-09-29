Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D45EF4EC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:04:39 +0200 (CEST)
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsHM-0001JP-Tx
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odriw-0006Jy-Bg
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:29:02 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odriu-0007JX-JT
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:29:02 -0400
Received: by mail-lj1-x230.google.com with SMTP id s10so1200939ljp.5
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=c1ZMfJ9WhaZKbGxPGPYAkSYo4uP/grXYwB4jdOavt9Q=;
 b=k4Ku3caqgpozPilxDbxNhQHUpNDWTyRMe916LgcwYP/n/zM+l7XlQklNZKnMPSwnCJ
 IkPRloEwfnmIgAYwOP7U9cg3VsLnCwT2LB48tn1/iIfYUnBvRS3+CSWYeiwzSxctsrcO
 e8p0C5YaMwOOR6MoLxnRXyq3cdKf7WAx6ZX1TodAn91VoLyiSs5WKOurqxEyPt7StFbE
 nmJTzMbsqcvh41pqsaAHpDXkufkaiQ+42QAQRQuHz+4RYkSqBZGq8HKdEJJJlgWf4wJd
 SzFgtT5yY4OS4JQ+UgHaOfETV+7Nlhs5w4en4rJ2BHUP42M2soYog32/gAdTK/UjSjSU
 O7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=c1ZMfJ9WhaZKbGxPGPYAkSYo4uP/grXYwB4jdOavt9Q=;
 b=4EwAQ0f/Donjb2bgIE14qY8IraaeFoOoesQSWFEJNYZjFyvreCV7ZuOIrMIkgWsBDe
 BFzMVNpzX7JGYN1kS6LbHAey5FZd0BGnTqZhWS84SJeedTNrAAVFMdErLTzEzn2/+vdE
 WEMmQaPpd5cse8yB/3RKw+Dg9n0lrJ07mj8Cv6Y9cRYvMnqeFcFM6NYS3CnlF4gHBCIy
 2YMpIWQcUKgB3DZYNTv/TpnHZXlIeg9F/jf+yCVSGXjGWR39jZ+vZcrEaknV3F2fUPLx
 U8mJP/jRIpO2Fupmu5W7NMiIqGWnEWiVJFJ/LfoSc7v5bCJZkRVVY3Y7a60jylH4PsdA
 DRTg==
X-Gm-Message-State: ACrzQf0UGRE5leOGsD/7KFg2N2N3FAli4tPCZmV9BgKFn+D/lF8sSpVg
 wNCMIL1y2UUKD/YPGJU8i8Ec4arkiPk0Hen21o8=
X-Google-Smtp-Source: AMsMyM4ToZa7EQVUo2iMOxPn4P24AB9z6PDzgHSIQsnbkAg15P6lVfBcbYEw8IBieymXNlSxLpjmaJjmXAyewhXMFYo=
X-Received: by 2002:a2e:9b17:0:b0:26c:4ede:512c with SMTP id
 u23-20020a2e9b17000000b0026c4ede512cmr994780lji.529.1664450939058; Thu, 29
 Sep 2022 04:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
 <20220929075239.1675374-8-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220929075239.1675374-8-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 29 Sep 2022 15:28:46 +0400
Message-ID: <CAJ+F1C+TcDY9eJBNMnkNNk9-_+cOOZkNVs65sY1k86aGqkGEBA@mail.gmail.com>
Subject: Re: [PATCH 7/7] qga: Add HW address getting for FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="000000000000f7fd9805e9cf2eed"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
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

--000000000000f7fd9805e9cf2eed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 29, 2022 at 11:54 AM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Replace a dumb function in commands-bsd.c by the code of HW address
> getting.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  qga/commands-bsd.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
> index ca81114171..f9997ee1ec 100644
> --- a/qga/commands-bsd.c
> +++ b/qga/commands-bsd.c
> @@ -20,6 +20,8 @@
>  #include <sys/param.h>
>  #include <sys/ucred.h>
>  #include <sys/mount.h>
> +#include <net/if_dl.h>
> +#include <net/ethernet.h>
>  #include <paths.h>
>
>  #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
> @@ -178,10 +180,15 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error
> **errp)
>   */
>  int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error
> **errp)
>  {
> -    /*
> -     * We can't get the hw addr of this interface,
> -     * but that's not a fatal error.
> -     */
> -    return 0;
> +    struct sockaddr_dl *sdp;
> +
> +    if (ifa->ifa_addr->sa_family !=3D AF_LINK) {
> +        /* We can get HW address only for AF_LINK family */
> +        g_debug("failed to get MAC address of %s", ifa->ifa_name);
> +        return 0;
> +    }
> +    sdp =3D (struct sockaddr_dl *)ifa->ifa_addr;
> +    memcpy(buf, sdp->sdl_data + sdp->sdl_nlen, ETHER_ADDR_LEN);
> +    return 1;
>  }
>  #endif /* HAVE_GETIFADDRS */
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f7fd9805e9cf2eed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 11:54 AM Al=
exander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com" target=
=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Replace a dumb function in comman=
ds-bsd.c by the code of HW address<br>
getting.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br></bl=
ockquote><div><br></div><div>lgtm</div><div>Reviewed-by: Marc-Andr=C3=A9 Lu=
reau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">m=
arcandre.lureau@redhat.com</a>&gt;<br><br>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
---<br>
=C2=A0qga/commands-bsd.c | 17 ++++++++++++-----<br>
=C2=A01 file changed, 12 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c<br>
index ca81114171..f9997ee1ec 100644<br>
--- a/qga/commands-bsd.c<br>
+++ b/qga/commands-bsd.c<br>
@@ -20,6 +20,8 @@<br>
=C2=A0#include &lt;sys/param.h&gt;<br>
=C2=A0#include &lt;sys/ucred.h&gt;<br>
=C2=A0#include &lt;sys/mount.h&gt;<br>
+#include &lt;net/if_dl.h&gt;<br>
+#include &lt;net/ethernet.h&gt;<br>
=C2=A0#include &lt;paths.h&gt;<br>
<br>
=C2=A0#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
@@ -178,10 +180,15 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **err=
p)<br>
=C2=A0 */<br>
=C2=A0int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error =
**errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* We can&#39;t get the hw addr of this interface,<br>
-=C2=A0 =C2=A0 =C2=A0* but that&#39;s not a fatal error.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 struct sockaddr_dl *sdp;<br>
+<br>
+=C2=A0 =C2=A0 if (ifa-&gt;ifa_addr-&gt;sa_family !=3D AF_LINK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We can get HW address only for AF_LINK fami=
ly */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to get MAC address of %s&=
quot;, ifa-&gt;ifa_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 sdp =3D (struct sockaddr_dl *)ifa-&gt;ifa_addr;<br>
+=C2=A0 =C2=A0 memcpy(buf, sdp-&gt;sdl_data + sdp-&gt;sdl_nlen, ETHER_ADDR_=
LEN);<br>
+=C2=A0 =C2=A0 return 1;<br>
=C2=A0}<br>
=C2=A0#endif /* HAVE_GETIFADDRS */<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000f7fd9805e9cf2eed--

