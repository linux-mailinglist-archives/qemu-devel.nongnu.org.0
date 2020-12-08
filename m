Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874D02D2B29
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:36:38 +0100 (CET)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcEP-0002JV-KD
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmc4f-00028K-6q
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:26:34 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:39040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmc4b-0006wR-V6
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:26:31 -0500
Received: by mail-ej1-x643.google.com with SMTP id n26so24296519eju.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HcUeWQDfhqgwPmk9UoYoXuWQ7boS7OoO2ua5xOfKLKE=;
 b=EOE+FjL0EwIlWRO+SJq/sWGmK4/qwZ4LzLZ7Ktwshyp8cQGC6AZRimVcTbazdYTLIr
 XT2v5AvSzAKd35s2kEgPprba58PrDlhdlf9Dn/Rq6paK82HTZPU2YAwGIDLFYkYw/GhZ
 kBHthh7g9jt9YrSb2q/Yqa+1Aak8geIaWk8+8x1Y00UxQVjNqE91htfZaAAw1yqkY4yn
 39U/S5CF+a0bMs+hR5PgmhWKEA4iU5iwn5KAQUUTU9qdcQ8zWt5Tt0JsYohT55GKWrTf
 81PmxcZcbS3ooMNpsmLQmiH5G996CFsJbolRcTVLFcW3G8zOr40SpKHDLqshu3rBiG5P
 DQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HcUeWQDfhqgwPmk9UoYoXuWQ7boS7OoO2ua5xOfKLKE=;
 b=XPEKkYtu7GLI1vjFVmAaGEHoHw4BpVH8vSFlPJp49EGhT3TlKpNyc+C8ZymOo1BYcQ
 5JPJKt6lRAFw+yd5tpSK6sPYVx0oSGc21gfxP3mKXSQcAT7l4HHyQ+ksdHLuVjGj3sjH
 4d3kKYyQGkDizdOY7hKIwYCMgad2MyeZFb7GM06g3EsdE6HdLucLttkxYdOeeokXQbIW
 B65KaPnL1sb33wzpin0YpxQ8cRE5502rsE2aA+0aSWmLTOM+w0ZNfkxj9eGRLBby9shN
 fhR9e5K94OTBq7A3SHTHLm4h31Fr/CW/XA7gHH5d7t5cWD6F3GzcKqF2/FP068/B6Kyf
 wqCw==
X-Gm-Message-State: AOAM533fSRNUUZihf1x4F/pHFxqnzQMDtGyW/7ba0CUm734kE/XsA+gt
 kNT4CAhGKjiEbogNPiPdrgmM+ryHRvM2CWLijYQ=
X-Google-Smtp-Source: ABdhPJx4C+YEOTTvjckGPHelTdwSzLct55akt/eUnVsqdYhYXZXeDox40MIBQEalhH4W5JOV/Piei6NB83PpAMcqE1c=
X-Received: by 2002:a17:906:30d2:: with SMTP id
 b18mr1757098ejb.109.1607430388177; 
 Tue, 08 Dec 2020 04:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20201208115737.18581-1-kraxel@redhat.com>
 <20201208115737.18581-3-kraxel@redhat.com>
In-Reply-To: <20201208115737.18581-3-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Dec 2020 16:26:15 +0400
Message-ID: <CAJ+F1C+WNBuF7jf2vVhbLpUUqcgOXtRf5dCHmOP7nT=MDJnQnw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] console: allow con==NULL in dpy_{get, set}_ui_info
 and dpy_ui_info_supported
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000049dff005b5f30da2"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x643.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000049dff005b5f30da2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 8, 2020 at 3:59 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Use active_console in that case like we do in many other places.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

 Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/console.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index f995639e45f6..30e70be555db 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1544,19 +1544,27 @@ static void dpy_set_ui_info_timer(void *opaque)
>
>  bool dpy_ui_info_supported(QemuConsole *con)
>  {
> +    if (con =3D=3D NULL) {
> +        con =3D active_console;
> +    }
> +
>      return con->hw_ops->ui_info !=3D NULL;
>  }
>
>  const QemuUIInfo *dpy_get_ui_info(const QemuConsole *con)
>  {
> -    assert(con !=3D NULL);
> +    if (con =3D=3D NULL) {
> +        con =3D active_console;
> +    }
>
>      return &con->ui_info;
>  }
>
>  int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info)
>  {
> -    assert(con !=3D NULL);
> +    if (con =3D=3D NULL) {
> +        con =3D active_console;
> +    }
>
>      if (!dpy_ui_info_supported(con)) {
>          return -1;
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000049dff005b5f30da2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 8, 2020 at 3:59 PM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Use active_console in that case like we do in many other places.=
<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div>=C2=A0</div><di=
v>=C2=A0Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; <br></div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/console.c | 12 ++++++++++--<br>
=C2=A01 file changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index f995639e45f6..30e70be555db 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -1544,19 +1544,27 @@ static void dpy_set_ui_info_timer(void *opaque)<br>
<br>
=C2=A0bool dpy_ui_info_supported(QemuConsole *con)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 if (con =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 con =3D active_console;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return con-&gt;hw_ops-&gt;ui_info !=3D NULL;<br>
=C2=A0}<br>
<br>
=C2=A0const QemuUIInfo *dpy_get_ui_info(const QemuConsole *con)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 assert(con !=3D NULL);<br>
+=C2=A0 =C2=A0 if (con =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 con =3D active_console;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0return &amp;con-&gt;ui_info;<br>
=C2=A0}<br>
<br>
=C2=A0int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 assert(con !=3D NULL);<br>
+=C2=A0 =C2=A0 if (con =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 con =3D active_console;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!dpy_ui_info_supported(con)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000049dff005b5f30da2--

