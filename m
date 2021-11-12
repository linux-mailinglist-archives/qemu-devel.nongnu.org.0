Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1132844E354
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 09:36:26 +0100 (CET)
Received: from localhost ([::1]:48724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlS2q-0008Lo-Ul
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 03:36:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mlS0p-0005Ll-FB; Fri, 12 Nov 2021 03:34:19 -0500
Received: from [2a00:1450:4864:20::333] (port=40703
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mlS0n-0003Oa-Tv; Fri, 12 Nov 2021 03:34:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so8507564wmb.5; 
 Fri, 12 Nov 2021 00:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kbcCaDblm/o93W5Pe7Y7frx6YvthUznZiClzVudIK44=;
 b=mopJ3rqkIVAbOi+UlNSUw+L5r4Oyw44HcV5qjpn7LkCFKqwdQKktRwUYU68yVoRTAy
 fEJ0F6L6TSVvWU0+nbZG8e+lDO2zTNl5udmvgnp8oxeQN6HFMwPct+mRbzAidZy6CpeM
 Ciwm+gHjaM/G082gy+zkIVwEpIZNBtMZkDJ8w+ULnbjtvFymGSnZh1SBiUZ77CVQpQbD
 OvhiS2D21+xYDOjQvcucFWpI/ouLEXg0/MFWlg3ihtb1UwnBy7kXJqtGkk4CparMNEei
 V2UxAdU/LkRgcnU+ughz/j1H5B7yGNkd0jI0XmPJCWD6FkSyleX52t5EN+J0FK/DkNoI
 Rhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kbcCaDblm/o93W5Pe7Y7frx6YvthUznZiClzVudIK44=;
 b=KHw6bBb5fLzHDPk/ysXVhJKFvTTWRncU4P3Dx188uQAGEF/EbA1tEnmg6uqx1UnAEV
 WRTZeXDPPBUr6BD9AlM8ufVjhjxZXjB8lVp0y+k6aKBRWWZmM0lSeblAScOj35/M3H38
 /+AZsRVYg9BCkLKoByJ2If/tZzRt+LD7oSQ2ykAMfc/1DeRK4twEYmWCbDHIkJDGnPIk
 KY/ey5gF97xgyDwQLQEKlKARBdf6ftKoW5P2dq7G0vIEw/wponrfyYJmfGXl2VboTP1k
 umnuB6Nk36ID3x99YLjBohA1vmKPmnRgtSuRBmPQcMAMIkk0WNAQm65cyPUKJMA3/1uu
 cCsQ==
X-Gm-Message-State: AOAM5310pP0j+W3ityY/nMjr39FUeraHIhfl8GcRTXvmQUfqVtxVbgdW
 I3nxBxxOwpvkTN7sZ7cprNTXJKbtdFPiWBIzH9GAFMKS
X-Google-Smtp-Source: ABdhPJx25zNL6/PqhB3khhWBjBRK3a8soLsByP2WOgiABfKqEVfXTroPLxWEp0stiTTjuXwWzF0PE7LV5kk9m3OovAI=
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr31556007wmh.15.1636705634025; 
 Fri, 12 Nov 2021 00:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-3-rvkagan@yandex-team.ru>
In-Reply-To: <20211111153354.18807-3-rvkagan@yandex-team.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 12 Nov 2021 12:27:02 +0400
Message-ID: <CAJ+F1C+Yf8L9WZE=rnmcwUti-_pF0bSdw-96MA=fS6SCnyUxcA@mail.gmail.com>
Subject: Re: [PATCH 02/10] chardev/char-socket: tcp_chr_recv: don't clobber
 errno
To: Roman Kagan <rvkagan@yandex-team.ru>
Content-Type: multipart/alternative; boundary="000000000000eb051b05d0933999"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eb051b05d0933999
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 7:38 PM Roman Kagan <rvkagan@yandex-team.ru> wrote:

> tcp_chr_recv communicates the specific error condition to the caller via
> errno.  However, after setting it, it may call into some system calls or
> library functions which can clobber the errno.
>
> Avoid this by moving the errno assignment to the end of the function.
>
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/char-socket.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 836cfa0bc2..90054ce58c 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -346,13 +346,6 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf,
> size_t len)
>                                       NULL);
>      }
>
> -    if (ret =3D=3D QIO_CHANNEL_ERR_BLOCK) {
> -        errno =3D EAGAIN;
> -        ret =3D -1;
> -    } else if (ret =3D=3D -1) {
> -        errno =3D EIO;
> -    }
> -
>      if (msgfds_num) {
>          /* close and clean read_msgfds */
>          for (i =3D 0; i < s->read_msgfds_num; i++) {
> @@ -381,6 +374,13 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf,
> size_t len)
>  #endif
>      }
>
> +    if (ret =3D=3D QIO_CHANNEL_ERR_BLOCK) {
> +        errno =3D EAGAIN;
> +        ret =3D -1;
> +    } else if (ret =3D=3D -1) {
> +        errno =3D EIO;
> +    }
> +
>      return ret;
>  }
>
> --
> 2.33.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000eb051b05d0933999
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 11, 2021 at 7:38 PM Roman=
 Kagan &lt;<a href=3D"mailto:rvkagan@yandex-team.ru">rvkagan@yandex-team.ru=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
tcp_chr_recv communicates the specific error condition to the caller via<br=
>
errno.=C2=A0 However, after setting it, it may call into some system calls =
or<br>
library functions which can clobber the errno.<br>
<br>
Avoid this by moving the errno assignment to the end of the function.<br>
<br>
Signed-off-by: Roman Kagan &lt;<a href=3D"mailto:rvkagan@yandex-team.ru" ta=
rget=3D"_blank">rvkagan@yandex-team.ru</a>&gt;<br></blockquote><div><br></d=
iv><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char-socket.c | 14 +++++++-------<br>
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index 836cfa0bc2..90054ce58c 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -346,13 +346,6 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, s=
ize_t len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (ret =3D=3D QIO_CHANNEL_ERR_BLOCK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EAGAIN;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -1;<br>
-=C2=A0 =C2=A0 } else if (ret =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EIO;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0if (msgfds_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* close and clean read_msgfds */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; s-&gt;read_msgfds_nu=
m; i++) {<br>
@@ -381,6 +374,13 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, s=
ize_t len)<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (ret =3D=3D QIO_CHANNEL_ERR_BLOCK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EAGAIN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -1;<br>
+=C2=A0 =C2=A0 } else if (ret =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EIO;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
-- <br>
2.33.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000eb051b05d0933999--

