Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4243F607091
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:56:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollxP-0004hY-7W
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:56:39 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollui-0005PX-7s
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1olluY-0004rg-QP
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:53:43 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1olluW-0006kU-AV
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:53:41 -0400
Received: by mail-lf1-x12e.google.com with SMTP id d6so3460952lfs.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 23:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fHnKrbzCJXhSEw9TL8T2pniPx00Ev5WVNG+7WsKcxJA=;
 b=LtzxlXQGcV73/8S/TlvbkFVgd7bun6o1nqPdCzXvGPAfkzZf8/9C7m6kanIlwXFaSu
 Q5RZOgkHtaTR/Om1o1AqF+3zyBTFZ0tdSqjyigEsmau5dQp15twD3BZ50pbnt745ol1X
 apUff7eFp9DcuBHNu/RMCMQp7cQbHkQ17Hei6dpMX4lur33mgruwwij77GmW8SCB92ZT
 VUI5wWT2TGkC0hw1xiJM3DM8OD8L1q+BOan2vf5D37WpGFGF8EiXJwfCrG9eyB/Db9cO
 2fEFcNtZZGJGNEJmY/1azzlaaLPcSjSt7rcCU6Bkw6rp55HZHAsHoFkKh+/LwiVYSG6F
 dSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fHnKrbzCJXhSEw9TL8T2pniPx00Ev5WVNG+7WsKcxJA=;
 b=njKFQQzp/tAmImnIFud7Ffwi0mLNNpU2D2LUPNAPHw8w4RBQ/sEdpmI/Ns1A2ClExG
 txcaiV9rvURaM8o0IHSxnd67P5Kdd6giI7xXv7/bHTxMQPLTLKNPJk/zR2YBKHXm2lrT
 fhJoLoWlTl2mxTWFt+BgiOdlSnBd5Y8gt7HsKEHgzBYZQHzbOC5DybcKyq3lXDc7UAKY
 sHNKjDK4UKVeiRjggtmRUQr8YdNkBbHcGz/Wa7879LOwhGaOIEmZulDmXbA+wN/0NWmU
 08nD9aD2SFNJiTQWdS/zISe3nwBNoCAIsxqav17izwrkI/UupiOrWrIFynuoi4MxymTo
 Io/g==
X-Gm-Message-State: ACrzQf2AF2ZZYrRnk7myfJLSLWGucYhQwfOZNwZ3kOOMy4WYbxmqjXJ/
 kxQtyi55ZeYmzh73smMQOxzvlJLoyzQNzedMuMU=
X-Google-Smtp-Source: AMsMyM7NI756Iy/umPVW4i9V4MCNpCSQrTvWRkmN3wpuYGFUmuNMvytv6agKmWCA1RC0iiEjo1isiefqBsa8qTb7tZ8=
X-Received: by 2002:a05:6512:3d1d:b0:4a2:588b:d78 with SMTP id
 d29-20020a0565123d1d00b004a2588b0d78mr6868788lfv.375.1666335217969; Thu, 20
 Oct 2022 23:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221020220346.124381-1-bjorn.forsman@gmail.com>
In-Reply-To: <20221020220346.124381-1-bjorn.forsman@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 21 Oct 2022 10:53:26 +0400
Message-ID: <CAJ+F1CKhatwA0i-KUF0pkS+8GxaP7v0cox1rpEj6KCVCR9e9bg@mail.gmail.com>
Subject: Re: [PATCH] qga: add channel path to error messages
To: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="000000000000be71b605eb85e65e"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
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

--000000000000be71b605eb85e65e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Oct 21, 2022 at 2:31 AM Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com=
>
wrote:

> It's useful to know which device was used if/when it fails.
>
> channel-win32.c had this since 2015, with
> c69403fcd4a0cb89f838a212ab71e4a1a3464c95 ("qemu-ga: debug printouts to
> help troubleshoot installation"), this brings channel-posix.c up to
> speed.
>
> Signed-off-by: Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>
> ---
>  qga/channel-posix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qga/channel-posix.c b/qga/channel-posix.c
> index 6796a02cff..e6dce985ae 100644
> --- a/qga/channel-posix.c
> +++ b/qga/channel-posix.c
> @@ -138,7 +138,7 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
>              0
>          );
>          if (fd =3D=3D -1) {
> -            error_setg_errno(errp, errno, "error opening channel");
> +            error_setg_errno(errp, errno, "error opening channel '%s'",
> path);
>              return false;
>          }
>  #ifdef CONFIG_SOLARIS
> @@ -163,7 +163,7 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
>          assert(fd < 0);
>          fd =3D qga_open_cloexec(path, O_RDWR | O_NOCTTY | O_NONBLOCK, 0)=
;
>          if (fd =3D=3D -1) {
> -            error_setg_errno(errp, errno, "error opening channel");
> +            error_setg_errno(errp, errno, "error opening channel '%s'",
> path);
>              return false;
>          }
>          tcgetattr(fd, &tio);
> --
> 2.36.2
>
>
>
Wouldn't it be simpler to modify the g_critical() in ga_channel_new()
instead?

    if (!ga_channel_open(c, path, method, listen_fd, &err)) {
        g_critical("Failed to open %s: %s", path, error_get_pretty(err));
...

--=20
Marc-Andr=C3=A9 Lureau

--000000000000be71b605eb85e65e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 21, 2022 at 2:31 AM Bj=
=C3=B8rn Forsman &lt;<a href=3D"mailto:bjorn.forsman@gmail.com">bjorn.forsm=
an@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">It&#39;s useful to know which device was used if/when it fails.=
<br>
<br>
channel-win32.c had this since 2015, with<br>
c69403fcd4a0cb89f838a212ab71e4a1a3464c95 (&quot;qemu-ga: debug printouts to=
<br>
help troubleshoot installation&quot;), this brings channel-posix.c up to<br=
>
speed.<br>
<br>
Signed-off-by: Bj=C3=B8rn Forsman &lt;<a href=3D"mailto:bjorn.forsman@gmail=
.com" target=3D"_blank">bjorn.forsman@gmail.com</a>&gt;<br>
---<br>
=C2=A0qga/channel-posix.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qga/channel-posix.c b/qga/channel-posix.c<br>
index 6796a02cff..e6dce985ae 100644<br>
--- a/qga/channel-posix.c<br>
+++ b/qga/channel-posix.c<br>
@@ -138,7 +138,7 @@ static gboolean ga_channel_open(GAChannel *c, const gch=
ar *path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel &#39;%s&#39;&quot;, path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#ifdef CONFIG_SOLARIS<br>
@@ -163,7 +163,7 @@ static gboolean ga_channel_open(GAChannel *c, const gch=
ar *path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(fd &lt; 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D qga_open_cloexec(path, O_RDWR | O_=
NOCTTY | O_NONBLOCK, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel &#39;%s&#39;&quot;, path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcgetattr(fd, &amp;tio);<br>
-- <br>
2.36.2<br>
<br>
<br></blockquote><div><br></div><div>Wouldn&#39;t it be simpler to modify t=
he g_critical() in ga_channel_new() instead?</div><div>=C2=A0<br></div></di=
v>=C2=A0 =C2=A0 if (!ga_channel_open(c, path, method, listen_fd, &amp;err))=
 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;Failed to open %s: %s&qu=
ot;, path, error_get_pretty(err));<br>...<br clear=3D"all"><br>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--000000000000be71b605eb85e65e--

