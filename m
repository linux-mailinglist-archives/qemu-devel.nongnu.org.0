Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D2B3FE0E8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:07:56 +0200 (CEST)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTiN-0000mX-Hq
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mLTQl-00033G-MF
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:49:43 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mLTQk-0002qP-6W
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:49:43 -0400
Received: by mail-ej1-x62b.google.com with SMTP id a25so441846ejv.6
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tniQsuWvjWmT/Cf2kDzOpnpZxV9NhsEDOJjBQpP6F1U=;
 b=J/lU5WCJADSO0a/Oba9+xF1TPCxbZ5DbH1DkG0N2Jem9UVTrCugaDGNellEYT8b7Er
 FvqdF4yYqs3cIhCauVCZy9TY5LSSnTgb/ixpaNYZZEXyWbbgU1nuW3W0Rq7VziUkGYnY
 0hVy5Q+UvAVG7e7pwg4rStFsQIk0xRfgitGi6cbj/xQ1gTcIyHtHkdrMObcJAunukHWo
 0hkNFpILCkuzR26NqDCAufM+dehA93Zv1kfJ61DqhKPVpFExznqqSmiuEG+nog+xmr4z
 wN867uOg/hWGfskYiihxcTKKxZqntqyGvqmtYUx0CrwdAxhpgkSEBO8tXPKmMNupU9EK
 KS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tniQsuWvjWmT/Cf2kDzOpnpZxV9NhsEDOJjBQpP6F1U=;
 b=eGnN2Nxvbz7oSNZOb0+COePam/tI6vE0JQtpsNKBEEtAyIvE6SWnJ9YXtoHRlzu8vx
 txiZJgQ4Dn3g34ZgJpMRgbeU/c3f29RZKzdfirEE9sIxQk/bdqUw6foifgDqhHStdzDq
 Jfpn3AdIhh/By8Qe6QUlaunLRsowtshNh/6MZ75MBTJc+I3Ym1PUToDwiPUUdmvjXSq3
 PbWsE8SGysAcO30vD6W2PHNBt2z56Jm+hyweiKeOnGKUC+2esLAvWH1MwPAD5Qr6rRRD
 bbBa1rW4io2HocRGgr03hnjDvPBi6g9wpdgrBmF0GeoasjF1obz/nG0SQICQMGtbQ7H2
 4c7A==
X-Gm-Message-State: AOAM533KQICR39pPUQwaws7TBcU4lZz1an71eLUlaK+vn1jRZAagmNDg
 j7suXDhTlyaA/WhTXBYEiXH8fnFQKHQgG+ABX9f8xEeWBfk=
X-Google-Smtp-Source: ABdhPJwamgiE3hc1EFEgOOvzDZvc9EP1hQawOTrar11ym3lcp1YH79tPBGECP0HpJ4AXCLqHgD7t55NvkX0d11oYI3s=
X-Received: by 2002:a17:907:7252:: with SMTP id
 ds18mr389973ejc.105.1630514980634; 
 Wed, 01 Sep 2021 09:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210901152713.25701-1-peter.maydell@linaro.org>
In-Reply-To: <20210901152713.25701-1-peter.maydell@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 1 Sep 2021 20:49:29 +0400
Message-ID: <CAJ+F1C+dT8=WHwUEAMZHVd6QhLvXieYaFvFiJ22Nrn-epp_YZg@mail.gmail.com>
Subject: Re: [PATCH] tests/vhost-user-bridge.c: Fix typo in help message
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000038c27e05caf1da5a"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000038c27e05caf1da5a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 1, 2021 at 8:13 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Fix a typo in the help message printed by vhost-user-bridge.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  tests/vhost-user-bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> index cb009545fa5..35088dd67f7 100644
> --- a/tests/vhost-user-bridge.c
> +++ b/tests/vhost-user-bridge.c
> @@ -831,7 +831,7 @@ main(int argc, char *argv[])
>  out:
>      fprintf(stderr, "Usage: %s ", argv[0]);
>      fprintf(stderr, "[-c] [-H] [-u ud_socket_path] [-l lhost:lport] [-r
> rhost:rport]\n");
> -    fprintf(stderr, "\t-u path to unix doman socket. default: %s\n",
> +    fprintf(stderr, "\t-u path to unix domain socket. default: %s\n",
>              DEFAULT_UD_SOCKET);
>      fprintf(stderr, "\t-l local host and port. default: %s:%s\n",
>              DEFAULT_LHOST, DEFAULT_LPORT);
> --
> 2.20.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000038c27e05caf1da5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 1, 2021 at 8:13 PM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Fix a typo in the help message printed by vhost-user-bridge.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/vhost-user-bridge.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c<br>
index cb009545fa5..35088dd67f7 100644<br>
--- a/tests/vhost-user-bridge.c<br>
+++ b/tests/vhost-user-bridge.c<br>
@@ -831,7 +831,7 @@ main(int argc, char *argv[])<br>
=C2=A0out:<br>
=C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Usage: %s &quot;, argv[0]);<br>
=C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;[-c] [-H] [-u ud_socket_path] [-l=
 lhost:lport] [-r rhost:rport]\n&quot;);<br>
-=C2=A0 =C2=A0 fprintf(stderr, &quot;\t-u path to unix doman socket. defaul=
t: %s\n&quot;,<br>
+=C2=A0 =C2=A0 fprintf(stderr, &quot;\t-u path to unix domain socket. defau=
lt: %s\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEFAULT_UD_SOCKET);<br>
=C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;\t-l local host and port. default=
: %s:%s\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEFAULT_LHOST, DEFAULT_LPOR=
T);<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000038c27e05caf1da5a--

