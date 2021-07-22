Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396363D2CED
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 21:48:04 +0200 (CEST)
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6efq-0003tv-S0
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 15:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m6eev-0003D5-R2
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:47:05 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m6eeu-0003S7-DL
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:47:05 -0400
Received: by mail-ed1-x534.google.com with SMTP id ca14so8265083edb.2
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yA3sCafLbUneBfxWcw13Szq4lXRngx5nd05Ozbxa8CI=;
 b=RImSM1tzs72Q68j0Ai9tc5NekdW/MhezHgryaO5SVtL32TuW+pEWm0HFEMoDGfMlsI
 f7f92EPileAl9GUoOGLIvYEZHLJIRivK4UHgX+7zENxwb0W19DYCExDq77hw2SHkPdLv
 SkbkiLpxaJFcPpJjWtOk0UYOzr4TG5SWwic95Res8LWSOkICrf0hJ7XwJwbLWMXe+Rd8
 YmRpDLL+9e1q240XKwMikZgJiv5sYiGh+h9FTYzhoXbrXBXeauOVLmiFCY874ZARVjKU
 wGC9IYPGc8DhMmGXg1FqQCvp5GcpBd+CtJhETHaU/Rckm2P24xXYrs0NOah6R08mukQ9
 0/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yA3sCafLbUneBfxWcw13Szq4lXRngx5nd05Ozbxa8CI=;
 b=m2GzjZKXWVyyH3etG4nSoJP6NY11I/+Xpgm7GgMrImj4i/CbXxGJlPTcjxTzWHudfE
 zO6l74gt5rXoK+JAWnnfjhzrKo1gA/TBSwltuNOBzj5uHe50Nx3mRF8AxoN14pcnGM+H
 dGQ1jPWMjOwIZl7UcMqE1LyTrY2tAEbPZ+39WNRw+hATJPkLQi7aK3qyU3FXpGxJVxPX
 OBoRxBOuUQtThF2/Jn48+IkwlIQtYTFlRrKajXo2t1MiWieSvRgimgfc283BgEEUOv9G
 NJqKN9rnWGQ6B3zQSCnA7F7Oeh5rd7TlWqyvJiL/ZWRKbLwBGOWxi3O7MVSfrK/xM6nw
 gc7w==
X-Gm-Message-State: AOAM533pOexafKBkQbtcdgevEP08iCirR/EQ0aiygnf4hEYrT9xJyUeG
 NbS9A5+f40USQRPlN1JdiqSa9PZbOEvtdCrwuT4=
X-Google-Smtp-Source: ABdhPJz5iEwvXtlKetkzi6WG2RWkoMNNkxMmLdbzS60K0Bsj04gUOkQuiWsbVnLXKNs+8o6f68kdEs42jmDcUtGVeZo=
X-Received: by 2002:a05:6402:34cc:: with SMTP id
 w12mr1413406edc.314.1626983222362; 
 Thu, 22 Jul 2021 12:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210722192016.24915-1-peter.maydell@linaro.org>
In-Reply-To: <20210722192016.24915-1-peter.maydell@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Jul 2021 23:46:50 +0400
Message-ID: <CAJ+F1CLCxowk=sMxh6siOBvRa82FH4uckOA6HBqQ1F4p=ynnXw@mail.gmail.com>
Subject: Re: [PATCH for-6.1 0/2] docs license footer followon cleanups
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000006481c05c7bb8d08"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000006481c05c7bb8d08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 11:23 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> This patchset makes a couple of followon cleanups now that
> commits 13f934e79fa and 3a50c8f3067aaf are in master and our HTML
> documentation has a footer to all pages stating the QEMU license
> and version:
>  * it removes the TODO comments, because we've now done them
>  * three .rst files were rendering their own copyright or
>    license information into the user-visible HTML, which is
>    a bit confusing now that we also do this in the page footer;
>    patch 2 brings those files into line with the others by having
>    the comment/license only in a rST comment
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   docs: Remove stale TODO comments about license and version
>   docs: Move licence/copyright from HTML output to rST comments
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>  docs/interop/qemu-ga-ref.rst                 |  9 ---------
>  docs/interop/qemu-qmp-ref.rst                |  9 ---------
>  docs/interop/qemu-storage-daemon-qmp-ref.rst |  9 ---------
>  docs/interop/vhost-user-gpu.rst              |  7 ++++---
>  docs/interop/vhost-user.rst                  | 12 +++++++-----
>  docs/system/generic-loader.rst               |  4 ++--
>  6 files changed, 13 insertions(+), 37 deletions(-)
>
> --
> 2.20.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000006481c05c7bb8d08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 22, 2021 at 11:23 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">This patchset makes a couple of followon cleanups now that<br>
commits 13f934e79fa and 3a50c8f3067aaf are in master and our HTML<br>
documentation has a footer to all pages stating the QEMU license<br>
and version:<br>
=C2=A0* it removes the TODO comments, because we&#39;ve now done them<br>
=C2=A0* three .rst files were rendering their own copyright or<br>
=C2=A0 =C2=A0license information into the user-visible HTML, which is<br>
=C2=A0 =C2=A0a bit confusing now that we also do this in the page footer;<b=
r>
=C2=A0 =C2=A0patch 2 brings those files into line with the others by having=
<br>
=C2=A0 =C2=A0the comment/license only in a rST comment<br>
<br>
thanks<br>
-- PMM<br>
<br>
Peter Maydell (2):<br>
=C2=A0 docs: Remove stale TODO comments about license and version<br>
=C2=A0 docs: Move licence/copyright from HTML output to rST comments<br></b=
lockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hr=
ef=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&g=
t;</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0docs/interop/qemu-ga-ref.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ---------<br>
=C2=A0docs/interop/qemu-qmp-ref.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 9 ---------<br>
=C2=A0docs/interop/qemu-storage-daemon-qmp-ref.rst |=C2=A0 9 ---------<br>
=C2=A0docs/interop/vhost-user-gpu.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 7 ++++---<br>
=C2=A0docs/interop/vhost-user.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 12 +++++++-----<br>
=C2=A0docs/system/generic-loader.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A06 files changed, 13 insertions(+), 37 deletions(-)<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000006481c05c7bb8d08--

