Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C3934447E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:03:59 +0100 (CET)
Received: from localhost ([::1]:50630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKDu-0002Qc-JL
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lOHrV-0005dl-QF
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:32:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lOHrS-0007hB-TJ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:32:41 -0400
Received: by mail-ej1-x62a.google.com with SMTP id kt15so10859347ejb.12
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WJcAxKoLOyu7tVpNhfyDAr5e2Be97fRA4Y0qjbOKOP0=;
 b=UmQlQ3xtNw4Z8A91jgUkDZ1rvJKGXXMdI5P6t3qYSqq4KaTZUVNxFeDI4KWD3jGBVb
 XmdFIctZ8ZKG9d3dhnJyNyho+e37Owam5gusM3UOvxvBSlvCAkVIM+r2MVMW0OPJxMYN
 O+w4dcvhQg24VwDyLhOjSt/lnM3dUZQJxGes+1vf8MVq1ewxVPK//VunkcqNVGoO30Ih
 8vg73EwOVY5ilLXSpMGe+lxs7TxUqoVn8sP36kFACa+ss1PXg9Ps2/05tCMaCPSNy8gf
 qs+ePBLEQKUMMNN0//Av3CqHIXVyN92+66zrD7DjDjXN19/9gRx5C4dvBRAOaFA/R05o
 LMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WJcAxKoLOyu7tVpNhfyDAr5e2Be97fRA4Y0qjbOKOP0=;
 b=fGdh0r2F9RQR0xCzZMSgqMSeo0hsX0cp9Ft+I3iDLZjyAm3fbBSyAkNbFh1wk38wd9
 j4XyBZCaD5aLcaITT53Ibw90VB16P7HvBPqeVzrI/PT4LK4QUAliAMPpPhwD+A4v8wKX
 C71ACzKNhTz4UQMxy/9e7a7xKIC3AaaQHFDMjixCGEtCuEb+LMDMUtdEOnK2CwlFuqg5
 j544BIcZTplToQVrF+icIkA6iniv9/3MzOwYoRh83gqwChF9Urxw3vDr/WmKB9DTe150
 VIgHbMwyRdai69xUA2fXaSRFdb2yyLmjJc0wxjdzEbeyLjetp7RgCJWT5J0EbxXj3Fpt
 njsQ==
X-Gm-Message-State: AOAM531xU2jX/yYCDVKidPMhG0KJwD+lLA/s271Hf/cKnitsW/MRnLbv
 hCrjyOpfx46whEz/GB1T33vryQ06ipxuGWC46ozWWA==
X-Google-Smtp-Source: ABdhPJyy9wcASOFNBzNfIqnXG1Xcxb+23i2/dZP+LUgptpts31BFp7wPDqBPs1YY9fpryyJa6uuVURtCc0ovlui3prQ=
X-Received: by 2002:a17:906:7d82:: with SMTP id
 v2mr18624834ejo.524.1616409155268; 
 Mon, 22 Mar 2021 03:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616368879.git.lukasstraub2@web.de>
 <a378d9426980c97a5cbbf2e72815f366c158ef71.1616368879.git.lukasstraub2@web.de>
In-Reply-To: <a378d9426980c97a5cbbf2e72815f366c158ef71.1616368879.git.lukasstraub2@web.de>
From: Li Zhang <li.zhang@ionos.com>
Date: Mon, 22 Mar 2021 11:32:24 +0100
Message-ID: <CAEM4iGEgkrVXvywDZ47C0sTP4wT_uk+5vfVA-XqmKNT0bjZ0rw@mail.gmail.com>
Subject: Re: [PATCH 4/5] chardev/char.c: Always pass id to chardev_new
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="00000000000083027505be1d9584"
Received-SPF: permerror client-ip=2a00:1450:4864:20::62a;
 envelope-from=li.zhang@ionos.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Mar 2021 09:01:22 -0400
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Li Zhang <zhlcindy@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000083027505be1d9584
Content-Type: text/plain; charset="UTF-8"

Looks good to me. I have tested this series, it works well.
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>

Thanks
Li

On Mon, Mar 22, 2021 at 12:35 AM Lukas Straub <lukasstraub2@web.de> wrote:

> Always pass the id to chardev_new, since it is needed to register
> the yank instance for the chardev. Also, after checking that
> nothing calls chardev_new with id=NULL, assert() that id!=NULL.
>
> This fixes a crash when using chardev-change to change a chardev
> to chardev-socket, which attempts to register a yank instance.
> This in turn tries to dereference the NULL-pointer.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  chardev/char.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 1584865027..ad416c0714 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -964,6 +964,7 @@ static Chardev *chardev_new(const char *id, const char
> *typename,
>      bool be_opened = true;
>
>      assert(g_str_has_prefix(typename, "chardev-"));
> +    assert(id);
>
>      obj = object_new(typename);
>      chr = CHARDEV(obj);
> @@ -1092,12 +1093,11 @@ ChardevReturn *qmp_chardev_change(const char *id,
> ChardevBackend *backend,
>          return NULL;
>      }
>
> -    chr_new = chardev_new(NULL, object_class_get_name(OBJECT_CLASS(cc)),
> +    chr_new = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
>                            backend, chr->gcontext, errp);
>      if (!chr_new) {
>          return NULL;
>      }
> -    chr_new->label = g_strdup(id);
>
>      if (chr->be_open && !chr_new->be_open) {
>          qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
> --
> 2.30.2
>
>

--00000000000083027505be1d9584
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>Looks good to me. I have tested this series, it w=
orks well.=C2=A0</div><div>Tested-by: Li Zhang &lt;<a href=3D"mailto:li.zha=
ng@cloud.ionos.com">li.zhang@cloud.ionos.com</a>&gt;=C2=A0</div><div><br></=
div><div>Thanks</div><div>Li</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 2021 at 12:35 AM Lukas St=
raub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web.de</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Always p=
ass the id to chardev_new, since it is needed to register<br>
the yank instance for the chardev. Also, after checking that<br>
nothing calls chardev_new with id=3DNULL, assert() that id!=3DNULL.<br>
<br>
This fixes a crash when using chardev-change to change a chardev<br>
to chardev-socket, which attempts to register a yank instance.<br>
This in turn tries to dereference the NULL-pointer.<br>
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
---<br>
=C2=A0chardev/char.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index 1584865027..ad416c0714 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -964,6 +964,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,<br>
=C2=A0 =C2=A0 =C2=A0bool be_opened =3D true;<br>
<br>
=C2=A0 =C2=A0 =C2=A0assert(g_str_has_prefix(typename, &quot;chardev-&quot;)=
);<br>
+=C2=A0 =C2=A0 assert(id);<br>
<br>
=C2=A0 =C2=A0 =C2=A0obj =3D object_new(typename);<br>
=C2=A0 =C2=A0 =C2=A0chr =3D CHARDEV(obj);<br>
@@ -1092,12 +1093,11 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
hardevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_C=
LASS(cc)),<br>
+=C2=A0 =C2=A0 chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLA=
SS(cc)),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0backend, chr-&gt;gcontext, errp);<br>
=C2=A0 =C2=A0 =C2=A0if (!chr_new) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 chr_new-&gt;label =3D g_strdup(id);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (chr-&gt;be_open &amp;&amp; !chr_new-&gt;be_open) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_be_event(chr, CHR_EVENT_CLOSED);=
<br>
--<br>
2.30.2<br>
<br>
</blockquote></div>

--00000000000083027505be1d9584--

