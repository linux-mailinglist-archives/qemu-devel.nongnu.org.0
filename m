Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC4C343C06
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 09:46:35 +0100 (CET)
Received: from localhost ([::1]:50564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOGCo-0003Ux-VB
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 04:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOG9T-0002ZX-OB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:43:07 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOG9K-00038O-7H
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:43:05 -0400
Received: by mail-ej1-x635.google.com with SMTP id r12so19837727ejr.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 01:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5LIb+nSyUMRLCe0UYPFicVum6PzgaKbR6qIbqZPwRQg=;
 b=VLRcuPkHKWgSm/XL7jzGtl/x/Bbi7pvc1wafbXpH6iV1NayQHKQhg8bNDcMOki4MIB
 w8oOrzXkxB8UPDNW7UPqDu49Xt4KDfksnZ/HqGmUNxA7gUkbvtgMrOXiPorW3GRaMHCg
 +fmXbTdJcgHo7JPBNQxV+Dy9tstSQ8BLauqw3q165qOhhkeeGxNFJaap2VmTdtIAW+aY
 22RGI8J8qXXe5gayZ6sBmn1D6VF2/iR1QW8CCEk88NjwDPS7FUFznCGojJP6zRUdQEoa
 6jybxvMJFOHURdEt2tyESp6rBvOJi7CaIuyeQPcibi/fv/ogUlUHTChmnQgbp0+Muent
 obdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5LIb+nSyUMRLCe0UYPFicVum6PzgaKbR6qIbqZPwRQg=;
 b=OGKhSHvClr6PXm23Kzd9qKAi2exN/aNnLQc0DfJXrueH9IrTibQVNnbJO4Txae6VPV
 PEnFgGgXkC1vT4/F2CIc4kWXG7D2CLOlKGlyPl8t0HX/NXL61PS0Unm/yW4pp4RhLIL/
 eHnrCxE0YyF6tevqPHRFV+KA4hp+5DStww/aqdS2auL/83Ebv2a+r27VH185N7hr9bnB
 xyFKqIF7R6fhZULe+6djXQ0ZQ8JR/TzvyhcCEYkNiHM7YieesTzXceQGxBbO+yIpZ52i
 sJKnMnAY0cLPfkFohvYORdBmMVSUNYIHz1pJX4LPbzQJUPdYur3DzhA2+n+eTWS27lkx
 V+6A==
X-Gm-Message-State: AOAM531XqH4YKv2gMRXFbhegzHjeG+EPPvGXJSpNijeU3PDZ1dR7ZRkI
 rUXb/tpgt5Mx881CwN8/mUfevdByWI0wkYZ2wPs=
X-Google-Smtp-Source: ABdhPJx23axXR7ptg7+Wgfz5RiSwx0z4pYzUJK+bKtjUTD2gAMLx8Ukupc//hWXS5nYxBcN0lm8TVH2nvJVJK76Nrms=
X-Received: by 2002:a17:906:a1c8:: with SMTP id
 bx8mr17642817ejb.381.1616402576610; 
 Mon, 22 Mar 2021 01:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616368879.git.lukasstraub2@web.de>
 <4d61f31f4c2ba1e768d91b2d8f946ea49b3a36fe.1616368879.git.lukasstraub2@web.de>
In-Reply-To: <4d61f31f4c2ba1e768d91b2d8f946ea49b3a36fe.1616368879.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 22 Mar 2021 12:42:45 +0400
Message-ID: <CAJ+F1CLdvOA2P1fJdsmju+=UcUsJCASpD=DfSNBzHCt0N8N-vg@mail.gmail.com>
Subject: Re: [PATCH 3/5] chardev/char.c: Move object_property_try_add_child
 out of chardev_new
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="00000000000064982a05be1c0dc5"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Li Zhang <zhlcindy@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000064982a05be1c0dc5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 22, 2021 at 3:31 AM Lukas Straub <lukasstraub2@web.de> wrote:

> Move object_property_try_add_child out of chardev_new into it's
> callers. This is a preparation for the next patches to fix yank
> with the chardev-change case.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  chardev/char.c | 42 ++++++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 18 deletions(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 97cafd6849..1584865027 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -972,7 +972,9 @@ static Chardev *chardev_new(const char *id, const cha=
r
> *typename,
>
>      qemu_char_open(chr, backend, &be_opened, &local_err);
>      if (local_err) {
> -        goto end;
> +        error_propagate(errp, local_err);
> +        object_unref(obj);
> +        return NULL;
>      }
>
>      if (!chr->filename) {
> @@ -982,22 +984,6 @@ static Chardev *chardev_new(const char *id, const
> char *typename,
>          qemu_chr_be_event(chr, CHR_EVENT_OPENED);
>      }
>
> -    if (id) {
> -        object_property_try_add_child(get_chardevs_root(), id, obj,
> -                                      &local_err);
> -        if (local_err) {
> -            goto end;
> -        }
> -        object_unref(obj);
> -    }
> -
> -end:
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        object_unref(obj);
> -        return NULL;
> -    }
> -
>      return chr;
>  }
>
> @@ -1006,6 +992,7 @@ Chardev *qemu_chardev_new(const char *id, const char
> *typename,
>                            GMainContext *gcontext,
>                            Error **errp)
>  {
> +    Chardev *chr;
>      g_autofree char *genid =3D NULL;
>
>      if (!id) {
> @@ -1013,7 +1000,19 @@ Chardev *qemu_chardev_new(const char *id, const
> char *typename,
>          id =3D genid;
>      }
>
> -    return chardev_new(id, typename, backend, gcontext, errp);
> +    chr =3D chardev_new(id, typename, backend, gcontext, errp);
>

You could have added a "register" argument to avoid duplication of code
imho. But since there are only 2 callers, I guess it's fine to inline it.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

+    if (!chr) {
> +        return NULL;
> +    }
> +
> +    if (!object_property_try_add_child(get_chardevs_root(), id,
> OBJECT(chr),
> +                                       errp)) {
> +        object_unref(OBJECT(chr));
> +        return NULL;
> +    }
> +    object_unref(OBJECT(chr));
> +
> +    return chr;
>  }
>
>  ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
> @@ -1034,6 +1033,13 @@ ChardevReturn *qmp_chardev_add(const char *id,
> ChardevBackend *backend,
>          return NULL;
>      }
>
> +    if (!object_property_try_add_child(get_chardevs_root(), id,
> OBJECT(chr),
> +                                       errp)) {
> +        object_unref(OBJECT(chr));
> +        return NULL;
> +    }
> +    object_unref(OBJECT(chr));
> +
>      ret =3D g_new0(ChardevReturn, 1);
>      if (CHARDEV_IS_PTY(chr)) {
>          ret->pty =3D g_strdup(chr->filename + 4);
> --
> 2.30.2
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000064982a05be1c0dc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 2021 at 3:31 AM Lukas Straub =
&lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web.de</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Move object_p=
roperty_try_add_child out of chardev_new into it&#39;s<br>
callers. This is a preparation for the next patches to fix yank<br>
with the chardev-change case.<br>
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
---<br>
=C2=A0chardev/char.c | 42 ++++++++++++++++++++++++------------------<br>
=C2=A01 file changed, 24 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index 97cafd6849..1584865027 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -972,7 +972,9 @@ static Chardev *chardev_new(const char *id, const char =
*typename,<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_char_open(chr, backend, &amp;be_opened, &amp;local=
_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(obj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!chr-&gt;filename) {<br>
@@ -982,22 +984,6 @@ static Chardev *chardev_new(const char *id, const char=
 *typename,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_be_event(chr, CHR_EVENT_OPENED);=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (id) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_try_add_child(get_chardevs_roo=
t(), id, obj,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;local_err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(obj);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-end:<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(obj);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0return chr;<br>
=C2=A0}<br>
<br>
@@ -1006,6 +992,7 @@ Chardev *qemu_chardev_new(const char *id, const char *=
typename,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GMainContext *gcontext,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 Chardev *chr;<br>
=C2=A0 =C2=A0 =C2=A0g_autofree char *genid =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!id) {<br>
@@ -1013,7 +1000,19 @@ Chardev *qemu_chardev_new(const char *id, const char=
 *typename,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D genid;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 return chardev_new(id, typename, backend, gcontext, errp);<b=
r>
+=C2=A0 =C2=A0 chr =3D chardev_new(id, typename, backend, gcontext, errp);<=
br></blockquote><div><br></div><div>You could have added a &quot;register&q=
uot; argument to avoid duplication of code imho. But since there are only 2=
 callers, I guess it&#39;s fine to inline it.</div><div><br></div><div>Revi=
ewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redh=
at.com">marcandre.lureau@redhat.com</a>&gt; <br></div><div><br> </div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 if (!chr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!object_property_try_add_child(get_chardevs_root(), id, =
OBJECT(chr),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errp)) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(OBJECT(chr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 object_unref(OBJECT(chr));<br>
+<br>
+=C2=A0 =C2=A0 return chr;<br>
=C2=A0}<br>
<br>
=C2=A0ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backen=
d,<br>
@@ -1034,6 +1033,13 @@ ChardevReturn *qmp_chardev_add(const char *id, Chard=
evBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (!object_property_try_add_child(get_chardevs_root(), id, =
OBJECT(chr),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errp)) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(OBJECT(chr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 object_unref(OBJECT(chr));<br>
+<br>
=C2=A0 =C2=A0 =C2=A0ret =3D g_new0(ChardevReturn, 1);<br>
=C2=A0 =C2=A0 =C2=A0if (CHARDEV_IS_PTY(chr)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret-&gt;pty =3D g_strdup(chr-&gt;filename=
 + 4);<br>
--<br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000064982a05be1c0dc5--

