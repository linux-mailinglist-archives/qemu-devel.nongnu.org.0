Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979902CC15D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:54:30 +0100 (CET)
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUSb-0002y7-KN
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kkUQG-00015M-Az; Wed, 02 Dec 2020 10:52:04 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:38287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kkUQE-0007Tt-MP; Wed, 02 Dec 2020 10:52:04 -0500
Received: by mail-ej1-x643.google.com with SMTP id a16so5081366ejj.5;
 Wed, 02 Dec 2020 07:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AbuIUg60f59Y70VOAgLclTFbtP0jHqU3DUyNKMiw50M=;
 b=FNbzuly/Sk1d5PAq0oCUBQQGJwZ+sF2Pha+v/a8e/TMF5DbTDinaCkPLMy+NIhb1GD
 i8L/LMnjcIlUjgIfGa5Y/Kf3UEvYaXR/9cSmL69DstksqAMjR6VB59OHHXHvIW/nJf2h
 E1EjR6487dCEezv9cfuwDYvLerJ2jM3l3ieENwL4HxdBnLUkHE1rvGiaA+zsXP+dO8MW
 OhDC4hIY6ft1klvGj2ZU4C1tbvMeVKqKHx8D5NMFNHrDNqSJ8IPVx68RaZhgyK8zKxiU
 9H8i/PPPBuNS8HZenAmsWTs+sfVIjUQv3Qa6q7jM4m4RbLQR7t+/Yat4PRkUjEHjOXR1
 4CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AbuIUg60f59Y70VOAgLclTFbtP0jHqU3DUyNKMiw50M=;
 b=kRH3v5gh4WNiGxjNfV6IHhCExmQYutjXmiVOI37Pd824joU6Ix+yI8n0fRo9Mi+NVa
 lBE48NJQU/p8A2d5JEzX4vmPKYFrffeBYjaornPpK8klg/l8bCzHbLIBHnr+lx7hgGJg
 ixQ8QdlOatKOhw4eEnlUK/VZsctCDKtSmthah29ql+0ZsgdKvbwGfMP1FYEMHP+1/Cpq
 HryrunOq+ezp9NRllKNsEZLWRV4lOywOXwBvB0sw7f/dGgZ6H/7sPWi6a5QUgInnQN11
 n0Wr++pE9OWF/qc637auEjcBO3yapRNdHeFkS8GNwww6dzHlOsFqHe/kS67Jq+qagFvQ
 DbKQ==
X-Gm-Message-State: AOAM530l4wAEgpjTqTkPfDJh295FNU0TZ+MfTab2BAxs87yxZHo7MijT
 Ym3kJoJGXXp7CjbiPYYIlnUzNwv9kykiNQlPi88=
X-Google-Smtp-Source: ABdhPJw3YkmDp74Nu/pdwR62wnTbPB5/0QUmTywhU0dFHsao7FnmqiPIs1VQPBpGA0LaQNrwaLV6wrU63q0SoZwmdlY=
X-Received: by 2002:a17:906:aacd:: with SMTP id
 kt13mr334599ejb.527.1606924320967; 
 Wed, 02 Dec 2020 07:52:00 -0800 (PST)
MIME-Version: 1.0
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-4-stefanha@redhat.com>
In-Reply-To: <20201202152611.677753-4-stefanha@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 2 Dec 2020 19:51:49 +0400
Message-ID: <CAJ+F1C+O-tQDhKvaYnqwHzkWH1Sj+RyVXA0R64Ykga6LPorU7g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] contrib/vhost-user-input: avoid g_return_val_if()
 input validation
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000055109105b57d390a"
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000055109105b57d390a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 7:27 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Do not validate input with g_return_val_if(). This API is intended for
> checking programming errors and is compiled out with -DG_DISABLE_CHECKS.
>
> Use an explicit if statement for input validation so it cannot
> accidentally be compiled out.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  contrib/vhost-user-input/main.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/vhost-user-input/main.c
> b/contrib/vhost-user-input/main.c
> index 6020c6f33a..1d79c61200 100644
> --- a/contrib/vhost-user-input/main.c
> +++ b/contrib/vhost-user-input/main.c
> @@ -212,7 +212,11 @@ static int vi_get_config(VuDev *dev, uint8_t *config=
,
> uint32_t len)
>  {
>      VuInput *vi =3D container_of(dev, VuInput, dev.parent);
>
> -    g_return_val_if_fail(len <=3D sizeof(*vi->sel_config), -1);
> +    if (len > sizeof(*vi->sel_config)) {
> +        g_critical("%s: len %u is larger than %zu",
> +                   __func__, len, sizeof(*vi->sel_config));
> +        return -1;
>

g_critical() already has __FILE__ __LINE__ and G_STRFUNC.

otherwise looks good:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> +    }
>
>      if (vi->sel_config) {
>          memcpy(config, vi->sel_config, len);
> --
> 2.28.0
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000055109105b57d390a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 7:27 PM Stefan=
 Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Do =
not validate input with g_return_val_if(). This API is intended for<br>
checking programming errors and is compiled out with -DG_DISABLE_CHECKS.<br=
>
<br>
Use an explicit if statement for input validation so it cannot<br>
accidentally be compiled out.<br>
<br>
Suggested-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" ta=
rget=3D"_blank">armbru@redhat.com</a>&gt;<br>
Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" t=
arget=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0contrib/vhost-user-input/main.c | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/mai=
n.c<br>
index 6020c6f33a..1d79c61200 100644<br>
--- a/contrib/vhost-user-input/main.c<br>
+++ b/contrib/vhost-user-input/main.c<br>
@@ -212,7 +212,11 @@ static int vi_get_config(VuDev *dev, uint8_t *config, =
uint32_t len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VuInput *vi =3D container_of(dev, VuInput, dev.parent);=
<br>
<br>
-=C2=A0 =C2=A0 g_return_val_if_fail(len &lt;=3D sizeof(*vi-&gt;sel_config),=
 -1);<br>
+=C2=A0 =C2=A0 if (len &gt; sizeof(*vi-&gt;sel_config)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;%s: len %u is larger than %zu=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__fun=
c__, len, sizeof(*vi-&gt;sel_config));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br></blockquote><div><br></div><div=
><div>g_critical() already has __FILE__ __LINE__ and G_STRFUNC.</div><div><=
br></div><div>otherwise looks good:</div><div>Reviewed-by: Marc-Andr=C3=A9 =
Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@=
redhat.com</a>&gt; <br></div><div><br></div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (vi-&gt;sel_config) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(config, vi-&gt;sel_config, len);<b=
r>
-- <br>
2.28.0<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000055109105b57d390a--

