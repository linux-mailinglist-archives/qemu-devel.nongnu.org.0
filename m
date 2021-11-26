Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638DE45ECA1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 12:28:48 +0100 (CET)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZPK-0003N8-M2
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 06:28:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mqZMa-0001PY-54
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:25:59 -0500
Received: from [2a00:1450:4864:20::435] (port=46634
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mqZMV-0003JC-LA
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:25:54 -0500
Received: by mail-wr1-x435.google.com with SMTP id u1so17864431wru.13
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 03:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hQ3scX0EVY1Vn7ArySsY6WW2BycDOb0gkp9IlD/3+DM=;
 b=pMR/qkD/8wWUL1OOQcuA63a3LqIKW7p6txyc3EQUYE3+9lSGUZJwYQOLDXrfmgyEgN
 kjhH1Hb+/FrvBxOYTfVr+Xa5MmNZ0Knvi1JKbm1/R5SpgvWJ1WtTUPeopvDqGRKLDyUD
 MrmGY/qomrksswU6KloV/aNUvxvWfL9QhDow7dhi1+7QR6q2ZAKmc0F4BX5QIzgfEa4I
 IVCowJ6pJqhyp569qg+Zp0JJhiCWT/O8QsiL1qO1f2Rv3ttNXPwJjO7EtHdJFgv2Pebs
 xl88DbrGRGdNmLmoHUO2tMtjqcvMrvTenjE+Jw3NGGyRr2RyjDxmd5in0tzswUMY8Ucb
 vbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hQ3scX0EVY1Vn7ArySsY6WW2BycDOb0gkp9IlD/3+DM=;
 b=QzX7M7PgHYDNeL+Svqzeg2c4S5Pg3dIaE553iprt8NsMHdEf112RDyyM0XNidy5tKD
 CYGAiJfZCycr1inUEC8858NOrr4a6wZFDMSLQuQq9vWZvBJJqAfUj8cXnA0D6I6Sxv/E
 RPQQ7fCOtRclmP97tZ0k5UZS/X6FOKNVfbEpnU5yqrEMGyWX4pLR6DPpIQPl/p97Gxm2
 TIucUOmNQnBlDTGg4dOOPZ65S530pIE8utMkHq6KICUckyj40hdDWgL0yq6LVjPppktE
 Ell9ZWoh4R2nXrVmNMQbGOFfiT3mr4g00AQqBkLYX7ZUMdMe/DfK5qrKnFiEM0jJpZO6
 sGMg==
X-Gm-Message-State: AOAM5312G30ChsllK1Mj8WHUHYMHgM1lbC6vsW0yacj6ajrcg6S4WMes
 rAWog/zvngI1rzWtO4ARO5f2Aa9nGVpT4uBS+b0=
X-Google-Smtp-Source: ABdhPJxsNgB0RnznxdRDPRZwrIIbiH3ekxTRqCMp15Nn9tFqqW9JAh9ZMXSw3rJPjTGDokcNNfm2DNAJ7z+lSwnxfso=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr13997847wrt.122.1637925944968; 
 Fri, 26 Nov 2021 03:25:44 -0800 (PST)
MIME-Version: 1.0
References: <1637908114-29133-1-git-send-email-priyankar.jain@nutanix.com>
In-Reply-To: <1637908114-29133-1-git-send-email-priyankar.jain@nutanix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Nov 2021 15:25:31 +0400
Message-ID: <CAJ+F1CJsJuDfExMM2fOCzXgqXmTZCSvLBG6EWR6v8jkO-8dn6A@mail.gmail.com>
Subject: Re: [PATCH] dbus-vmstate: Restrict error checks to registered proxies
 in dbus_get_proxies
To: Priyankar Jain <priyankar.jain@nutanix.com>
Content-Type: multipart/alternative; boundary="0000000000001e49f205d1af5a62"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001e49f205d1af5a62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Nov 26, 2021 at 10:49 AM Priyankar Jain <priyankar.jain@nutanix.com=
>
wrote:

> The purpose of dbus_get_proxies to construct the proxies corresponding to
> the
> IDs registered to dbus-vmstate.
>
> Currenty, this function returns an error in case there is any failure
> while instantiating proxy for "all" the names on dbus.
>
> Ideally this function should error out only if it is not able to find and
> validate the proxies registered to the backend otherwise any offending
> process(for eg: the process purposefully may not export its Id property o=
n
> the dbus) may connect to the dbus and can lead to migration failures.
>

ok


> This commit ensures that dbus_get_proxies returns an error if it is not
> able to find and validate the proxies of interest(the IDs registered
> during the dbus-vmstate instantiation).
>
> Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
> ---
>  backends/dbus-vmstate.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
> index 9cfd758c42..ec86b5bac2 100644
> --- a/backends/dbus-vmstate.c
> +++ b/backends/dbus-vmstate.c
> @@ -114,14 +114,13 @@ dbus_get_proxies(DBusVMState *self, GError **err)
>                      "org.qemu.VMState1",
>                      NULL, err);
>          if (!proxy) {
> -            return NULL;
>

This would leak "err", you would need to pass NULL instead. Imho we need to
report a warning anyway with "err".


> +            continue;
>          }
>
>          result =3D g_dbus_proxy_get_cached_property(proxy, "Id");
>          if (!result) {
> -            g_set_error_literal(err, G_IO_ERROR, G_IO_ERROR_FAILED,
> -                                "VMState Id property is missing.");
> -            return NULL;
>

Similarly, report a warning.


> +            g_clear_object(&proxy);
> +            continue;
>          }
>
>          id =3D g_variant_dup_string(result, &size);
> --
> 2.30.1 (Apple Git-130)
>
>
>
thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001e49f205d1af5a62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 26, 2021 at 10:49 AM Pr=
iyankar Jain &lt;<a href=3D"mailto:priyankar.jain@nutanix.com">priyankar.ja=
in@nutanix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">The purpose of dbus_get_proxies to construct the proxies corr=
esponding to the<br>
IDs registered to dbus-vmstate.<br>
<br>
Currenty, this function returns an error in case there is any failure<br>
while instantiating proxy for &quot;all&quot; the names on dbus.<br>
<br>
Ideally this function should error out only if it is not able to find and<b=
r>
validate the proxies registered to the backend otherwise any offending<br>
process(for eg: the process purposefully may not export its Id property on<=
br>
the dbus) may connect to the dbus and can lead to migration failures.<br></=
blockquote><div><br></div><div>ok</div><div> <br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
This commit ensures that dbus_get_proxies returns an error if it is not<br>
able to find and validate the proxies of interest(the IDs registered<br>
during the dbus-vmstate instantiation).<br>
<br>
Signed-off-by: Priyankar Jain &lt;<a href=3D"mailto:priyankar.jain@nutanix.=
com" target=3D"_blank">priyankar.jain@nutanix.com</a>&gt;<br>
---<br>
=C2=A0backends/dbus-vmstate.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c<br>
index 9cfd758c42..ec86b5bac2 100644<br>
--- a/backends/dbus-vmstate.c<br>
+++ b/backends/dbus-vmstate.c<br>
@@ -114,14 +114,13 @@ dbus_get_proxies(DBusVMState *self, GError **err)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;org.qemu.VMState1&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0NULL, err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!proxy) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
</blockquote><div><br></div><div>This would leak &quot;err&quot;, you would=
 need to pass NULL instead. Imho we need to report a warning anyway with &q=
uot;err&quot;.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D g_dbus_proxy_get_cached_proper=
ty(proxy, &quot;Id&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!result) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_set_error_literal(err, G_IO_ER=
ROR, G_IO_ERROR_FAILED,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;VMState Id property is missing=
.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
</blockquote><div><br></div><div>Similarly, report a warning.<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_object(&amp;proxy);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D g_variant_dup_string(result, &amp;=
size);<br>
-- <br>
2.30.1 (Apple Git-130)<br>
<br>
<br>
</blockquote></div><div><br></div><div>thanks<br></div><br>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001e49f205d1af5a62--

