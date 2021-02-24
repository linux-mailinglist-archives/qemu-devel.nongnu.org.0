Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02283241B3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:19:01 +0100 (CET)
Received: from localhost ([::1]:42078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwsP-0007c8-1I
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <koalinux@gmail.com>)
 id 1lEwqk-00073Z-2R
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:17:18 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:45188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <koalinux@gmail.com>)
 id 1lEwqi-0002lL-BJ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:17:17 -0500
Received: by mail-io1-xd2d.google.com with SMTP id a7so2535284iok.12
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ORDQlo5Sw/FkXKCgRZ663lLNkgjKavNGACTLn73Hwx0=;
 b=s7+NXITrzeBLdyevjxP1EpllNhfj55u+BQvNBmn3Y6CdnNtAbxvs/wYJCdYAuNkpSI
 Uds8NaunSvmgN0lib62sgySZw8ifwBlWNTV1HNmchUMj3JKNMRpUMMwstI6bNk4nyLfI
 ZYjRJei2ZowX+uw7JTQ8iQ9Azg2sPGDPegJX24kQwShUw1/x/NV4horX2TSlEQP24uhm
 KRK8e7O1f85Aoifu+iGPrkOPhX1CN0heEsj5ZddGR5gK1cjEJqu3yePBhYELI6bEt+SX
 IZZlySBZcD8lv4XApCCelChclxBPHXAVdLbkGA/TgNDtN5+JHRir71Z1FCYvLkD5r+48
 6x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ORDQlo5Sw/FkXKCgRZ663lLNkgjKavNGACTLn73Hwx0=;
 b=JzCSKotOpmYfLt9rjZN/nZMRwQTdxTiNhp+CPLFskqy6+EtDB52fdFjNQYfdVJ7RUR
 uoBz9CzPUQ8dC/SfOMIZXKmoYcsFGYSEoRU7+DTGXqueWuFduEREMXWmbMUFY3cBql06
 Cb5V9pN9yYgdaMcYdFPAUgTSF+7SKSjD4J0TYGbsachkGpfH/oyJ95WgoCLcN+XLK6P4
 4HIf51kKpNOM8I2eV3IBCwmew1/PrhgKZ+uGZWygcWwzw/GjjNdVII9zB1kANH1Hwj8D
 VO0L2c8EShkkh0TN/Im+mmsM24yqNPpoFxjKzOaDuJLVIwVA5Pddn1w4cxXqwmQ6O3/X
 gloQ==
X-Gm-Message-State: AOAM531I9MZsYjem6qYzCtx7ZPhJ5Op5z+ucjK26mZ++jwDoP0/5hWXS
 mj0/jcUjBapyVFU5/GCKRTiOZqrqziUxJGh2ffY=
X-Google-Smtp-Source: ABdhPJzZPzXQA/lRRygvUAREvXC5ySmiL7s3mKyFIEAwRApFqvhzvEHU4biTJzxpWu9FD4RB/qpyp/oaVwDUyGENbsk=
X-Received: by 2002:a05:6638:1390:: with SMTP id
 w16mr5731813jad.83.1614183434066; 
 Wed, 24 Feb 2021 08:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20210224154901.23901-1-koalinux@gmail.com>
In-Reply-To: <20210224154901.23901-1-koalinux@gmail.com>
From: =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= <koalinux@gmail.com>
Date: Wed, 24 Feb 2021 18:16:58 +0200
Message-ID: <CANWZPgLxUNM3tPg6wxCt=v7Z-d+DN3J9EyTSV3dwv=uzWMnY0Q@mail.gmail.com>
Subject: Re: [PATCH] Autoconnect jack ports by default
To: kraxel@redhat.com
Content-Type: multipart/alternative; boundary="00000000000030a0b205bc175e8d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=koalinux@gmail.com; helo=mail-io1-xd2d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000030a0b205bc175e8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

    Hi,

    Adding qemu-devel.

    Best regards.

    Jos=C3=A9.

On Wed, 24 Feb 2021 at 17:49, Jos=C3=A9 Pekkarinen <koalinux@gmail.com> wro=
te:

> This patch provides a default value to connect
> jack ports when the user don't specify connect-ports.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1908832
>
> Signed-off-by: Jos=C3=A9 Pekkarinen <koalinux@gmail.com>
> ---
>  audio/jackaudio.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> index 3031c4e29b..a29b1ccba2 100644
> --- a/audio/jackaudio.c
> +++ b/audio/jackaudio.c
> @@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceIn *hw, void *buf,
> size_t len)
>
>  static void qjack_client_connect_ports(QJackClient *c)
>  {
> -    if (!c->connect_ports || !c->opt->connect_ports) {
> +    if (!c->connect_ports) {
>          return;
>      }
>
>      c->connect_ports =3D false;
>      const char **ports;
> -    ports =3D jack_get_ports(c->client, c->opt->connect_ports, NULL,
> -        c->out ? JackPortIsInput : JackPortIsOutput);
> +    if (c->out) {
> +        ports =3D jack_get_ports(c->client,
> +            c->opt->connect_ports ? "system:capture_.*"
> +                : c->opt->connect_ports,
> +            NULL, JackPortIsInput);
> +    } else {
> +        ports =3D jack_get_ports(c->client,
> +            c->opt->connect_ports ? "system:playback_.*"
> +                : c->opt->connect_ports,
> +            NULL, JackPortIsOutput);
> +    }
>
>      if (!ports) {
>          return;
> --
> 2.26.2
>
>

--00000000000030a0b205bc175e8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><div>=C2=A0 =C2=A0 Hi,</div><div><br>=
</div><div>=C2=A0 =C2=A0 Adding qemu-devel.</div><div><br></div><div>=C2=A0=
 =C2=A0 Best regards.</div><div><br></div><div>=C2=A0 =C2=A0 Jos=C3=A9.</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, 24 Feb 2021 at 17:49, Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:=
koalinux@gmail.com">koalinux@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">This patch provides a default value t=
o connect<br>
jack ports when the user don&#39;t specify connect-ports.<br>
<br>
Buglink: <a href=3D"https://bugs.launchpad.net/qemu/+bug/1908832" rel=3D"no=
referrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1908832</a=
><br>
<br>
Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:koalinux@gmail.co=
m" target=3D"_blank">koalinux@gmail.com</a>&gt;<br>
---<br>
=C2=A0audio/jackaudio.c | 15 ++++++++++++---<br>
=C2=A01 file changed, 12 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/audio/jackaudio.c b/audio/jackaudio.c<br>
index 3031c4e29b..a29b1ccba2 100644<br>
--- a/audio/jackaudio.c<br>
+++ b/audio/jackaudio.c<br>
@@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceIn *hw, void *buf, si=
ze_t len)<br>
<br>
=C2=A0static void qjack_client_connect_ports(QJackClient *c)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (!c-&gt;connect_ports || !c-&gt;opt-&gt;connect_ports) {<=
br>
+=C2=A0 =C2=A0 if (!c-&gt;connect_ports) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0c-&gt;connect_ports =3D false;<br>
=C2=A0 =C2=A0 =C2=A0const char **ports;<br>
-=C2=A0 =C2=A0 ports =3D jack_get_ports(c-&gt;client, c-&gt;opt-&gt;connect=
_ports, NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;out ? JackPortIsInput : JackPortIsOutput=
);<br>
+=C2=A0 =C2=A0 if (c-&gt;out) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports =3D jack_get_ports(c-&gt;client,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;opt-&gt;connect_ports ? &q=
uot;system:capture_.*&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : c-&gt;opt-&gt;co=
nnect_ports,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, JackPortIsInput);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports =3D jack_get_ports(c-&gt;client,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;opt-&gt;connect_ports ? &q=
uot;system:playback_.*&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : c-&gt;opt-&gt;co=
nnect_ports,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, JackPortIsOutput);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!ports) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div></div>

--00000000000030a0b205bc175e8d--

