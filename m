Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFBF343BE1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 09:37:11 +0100 (CET)
Received: from localhost ([::1]:45768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOG3i-00011f-L2
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 04:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOFzx-0007xq-FG
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:33:17 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOFzu-0006OD-JE
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:33:16 -0400
Received: by mail-ed1-x529.google.com with SMTP id x21so18217086eds.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TuFbhq2XhRCZF5k4ejdf6JptcX/KbhUdNrfDfxa79Wo=;
 b=QeXftW8sKi8x/J0p2z4UBvspvU+5Vo6hkoy38b4tnhqU5qi9H/ttsGP+SSlIa0TOfN
 E+JTcNiZnU3/Ao2yzPe00e6Y55gty4wr/EpTEs9x2dpCOGo6riZ2pdJzs86cg8NXVtLx
 NeB++69xbxYzDIbcpOoVszpx8iR/xCiChjWuegyY9Zd2ZSHafFeCCOlWFCURB0l+gnqM
 K5QfBsbd8FhxIfzE1Tv6J+ITDTg9Lp+3JfwjtTXOTfIgN6rURMUgPcB+PnqXPreoaKFt
 Rd9YupXGzg6CeGXdYFVyzEH+I+C86qRGzEYEXOdh/t6eLxUB0iudB28jggPYy81N5NHq
 nuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TuFbhq2XhRCZF5k4ejdf6JptcX/KbhUdNrfDfxa79Wo=;
 b=t2rqDV2CBLLzrUKDTgopp3Y1Y+1+FebQwdDFQvMyjMw3oftXvneNBktt6O/gcv1keL
 4/Rwsf9yTuvl1YCeSibZG9RJgtNclTb36g/xKi1k/go3yx+ukOAawSJI91h3m9TAVo66
 /ZHCy0mjZ148BFlWwrIjJ5hMvlaeGGJe9z2c6bKSHAAxcvu4Gx2NvI/KKG25JevqF2sR
 sJHd5safjZ8IUGAgeYB8sAQP+deKeM7Lp1cpOnJmORiuYatUIJ3VUYrquQWM0pc/07oA
 4IPdLhrFfg3qL9siwiVG1lkx5VOccIGtPD2Cp4wIziDo65gu5F7pCpaXObkGYwLF/cMt
 syQw==
X-Gm-Message-State: AOAM530Wyuk1Y6fWjkYxySnryybtp4nIYGPeTWCejrhEgw1slFBGwkY7
 rvom+CBef6q5HpGVojO68NgCpNbLRzq2L/jotNo=
X-Google-Smtp-Source: ABdhPJylja6RTPJP3Uhh0FtqPErLRb1cn6C+4DdpacpB8vOzq2xVq7UOJVcUKXbd41MEhNrO0G9b0IDW2l2rQ6XqN+o=
X-Received: by 2002:aa7:dbd3:: with SMTP id v19mr24057276edt.314.1616401992908; 
 Mon, 22 Mar 2021 01:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616368879.git.lukasstraub2@web.de>
 <a378d9426980c97a5cbbf2e72815f366c158ef71.1616368879.git.lukasstraub2@web.de>
In-Reply-To: <a378d9426980c97a5cbbf2e72815f366c158ef71.1616368879.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 22 Mar 2021 12:33:01 +0400
Message-ID: <CAJ+F1CK81Se080SJSm2O11TxMzTzuOVOHqgphW3D615y-6rvjw@mail.gmail.com>
Subject: Re: [PATCH 4/5] chardev/char.c: Always pass id to chardev_new
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="0000000000009a01c405be1beaa2"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x529.google.com
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

--0000000000009a01c405be1beaa2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 3:31 AM Lukas Straub <lukasstraub2@web.de> wrote:

> Always pass the id to chardev_new, since it is needed to register
> the yank instance for the chardev. Also, after checking that
> nothing calls chardev_new with id=3DNULL, assert() that id!=3DNULL.
>
> This fixes a crash when using chardev-change to change a chardev
> to chardev-socket, which attempts to register a yank instance.
> This in turn tries to dereference the NULL-pointer.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/char.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 1584865027..ad416c0714 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -964,6 +964,7 @@ static Chardev *chardev_new(const char *id, const cha=
r
> *typename,
>      bool be_opened =3D true;
>
>      assert(g_str_has_prefix(typename, "chardev-"));
> +    assert(id);
>
>      obj =3D object_new(typename);
>      chr =3D CHARDEV(obj);
> @@ -1092,12 +1093,11 @@ ChardevReturn *qmp_chardev_change(const char *id,
> ChardevBackend *backend,
>          return NULL;
>      }
>
> -    chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_CLASS(cc)=
),
> +    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
>                            backend, chr->gcontext, errp);
>      if (!chr_new) {
>          return NULL;
>      }
> -    chr_new->label =3D g_strdup(id);
>
>      if (chr->be_open && !chr_new->be_open) {
>          qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
> --
> 2.30.2
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009a01c405be1beaa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 2021 at 3:31 AM Lukas=
 Straub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web.de</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Alway=
s pass the id to chardev_new, since it is needed to register<br>
the yank instance for the chardev. Also, after checking that<br>
nothing calls chardev_new with id=3DNULL, assert() that id!=3DNULL.<br>
<br>
This fixes a crash when using chardev-change to change a chardev<br>
to chardev-socket, which attempts to register a yank instance.<br>
This in turn tries to dereference the NULL-pointer.<br>
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br></blockquote><div><br></div><d=
iv>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009a01c405be1beaa2--

