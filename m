Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82AC2DCF70
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:24:51 +0100 (CET)
Received: from localhost ([::1]:45478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqSo-0007Bn-TR
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpqRU-0006Vb-BL
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:23:28 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpqRF-0005aV-2F
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:23:28 -0500
Received: by mail-ej1-x62d.google.com with SMTP id 6so22429021ejz.5
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YTyO4c8d396MPTUPg1KsFhH/Ajl5Pkdvof5IhNI1tTw=;
 b=bWYHZnePgy8KJ8smRTJ8/iTuRvQvGgb+RG8HzsvOQUqYRmRT5Uaatznq7eEtQWH0MZ
 4HHQQB4lDwQ/mdh7FwJgxF1jXgaExNeG89/ZemYUn+AafLNnIVfoly3YI3I17FwQA2C1
 MdWD0I27f9l+gF3Z8osib6Rgi/InbJOGwRPHlLZZqhEi6z0+0d8/rh3BjR3IDGpYK7cH
 QVvpicpwP4sGv8P3cLeNFLkxW6jzEP1YwAMwUdPsUDrATvB6WCnes56wsbB/rhpqjDlW
 d5GY9KkC2P9TzC+Qu2L4sn0OdgQuLILteu/buorglkI6VvrF4qCNl0Q7Phwszcm7N6fz
 hvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YTyO4c8d396MPTUPg1KsFhH/Ajl5Pkdvof5IhNI1tTw=;
 b=mAuKSrA/S+T0qSGKsOMtdRETBcGgbv+eVcEDnDD7XVv53Q710VgFj79Qlc7+kwFSnf
 Napl8/dzuqKFITLkYxQjyEHNT1Rzw0XPkDZ8p6/DfJdgebn1ke7bFt1wLEFcxqeYZCkB
 ibvqfCEjaEOn1U3VySR8wlIca5f85Ho5uB2TkBQ5LWrnnaZKf7MTGNK64AjnVvmb65FA
 u7gcLfbDi3A4clleFPjsWM47T4wmL5pKtuMEwZ1Wau+5evG6RGOCif6UQjF388dJCsaR
 IuSE7fQLuHHOTEtxBra7zBZzdrsznDBm5Hr9ttLQ3UXcqQhrfBJdnWYmJfUFbK1bVuTQ
 aCYQ==
X-Gm-Message-State: AOAM531ZMEsHtE3jfERPaLq0I6D6QFSaXvz+Vz/+6d8jsrVp9o00z8Uu
 WOMLWro40ZcnET5Zr3utSKkP7qinQdXMl8NtIQYNNH6iu8p2Vw==
X-Google-Smtp-Source: ABdhPJzHirbKQ3VRnZXW8ZNy37o5phqNOFWfsBuu6lCXTbwxOMWQXLwPzwzFN2d4g3VraSliyTuRWBR1c8NV1T17sMs=
X-Received: by 2002:a17:906:8587:: with SMTP id
 v7mr33770928ejx.381.1608200591651; 
 Thu, 17 Dec 2020 02:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20201217085005.10644-1-pbonzini@redhat.com>
 <20201217085005.10644-4-pbonzini@redhat.com>
In-Reply-To: <20201217085005.10644-4-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 17 Dec 2020 14:22:59 +0400
Message-ID: <CAJ+F1CLOz2jHnfhJMOHdGef2P1P=Pe4KrOwYq+x2wZwkJB1rnQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] configure: accept --enable-slirp
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fe37b905b6a660d5"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--000000000000fe37b905b6a660d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:52 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Meson understands -Dslirp=3Denabled, so there is no reason not to
> accept the configure option as well.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/configure b/configure
> index 18af8207d9..568818e72d 100755
> --- a/configure
> +++ b/configure
> @@ -1083,6 +1083,8 @@ for opt do
>    ;;
>    --disable-slirp) slirp=3D"disabled"
>    ;;
> +  --enable-slirp) slirp=3D"enabled"
> +  ;;
>    --enable-slirp=3Dgit) slirp=3D"internal"
>    ;;
>    --enable-slirp=3Dsystem) slirp=3D"system"
> --
> 2.29.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fe37b905b6a660d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 12:52 PM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Mes=
on understands -Dslirp=3Denabled, so there is no reason not to<br>
accept the configure option as well.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/configure b/configure<br>
index 18af8207d9..568818e72d 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -1083,6 +1083,8 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-slirp) slirp=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
+=C2=A0 --enable-slirp) slirp=3D&quot;enabled&quot;<br>
+=C2=A0 ;;<br>
=C2=A0 =C2=A0--enable-slirp=3Dgit) slirp=3D&quot;internal&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-slirp=3Dsystem) slirp=3D&quot;system&quot;<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000fe37b905b6a660d5--

