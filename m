Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554463D104E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:56:48 +0200 (CEST)
Received: from localhost ([::1]:47420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CiN-0003r9-Df
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m6Chb-000370-6b
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:55:59 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m6ChZ-0001EA-IK
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:55:58 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ga14so3393174ejc.6
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MPEE8U/LRxFyg6W4R+pwkJwSfg0oy9x0hW+QATSwp9E=;
 b=WQMMRLZGDKLlRv9qyKgLqHEvfjTDFCion5GKZy5Zbd6epwRuJbgJvBtyZRkKsb5s4U
 w0C9OVmRfvTeQZpp1BZryU8C0weLOOUaOUrOaV/dgqx0Pc/UrhDTHvktLrJXrd/PUdfc
 UU9VoR4d+PiOJRiqaDCikHWYjgMZazWJclCkDXnWjzcg0k1Sa8iSqxmw6hEMrPHkQsqv
 kpRo1LJoblVKJk8JwfD9zW+mere5NoWBO0czY2d3JCV/OAcxOgcWL9aYger5Lkkx6N3V
 erEName3T6PLYk1VufTIpRxb9d1E6Zi3rup7CfARz/DagPkntrZTYNMbhjNzTMcNNQSz
 TeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPEE8U/LRxFyg6W4R+pwkJwSfg0oy9x0hW+QATSwp9E=;
 b=hF4BnTfgi5KY8G+5xfyYSAmSRkNLBzQGBpzrO5cK2LChNnuGtgpJd6JmiowDBvepvu
 +PCWbVG8TXqGWAx3YZna6lYNVrjIAIyhH9276R+Segn2HkOAUcTDfSOL8h9z0t1Cqdx2
 iIhR1yKUfFjVkapo9K6vCi4MQ0g9x9lamj63KlSzaU9Cy2SOGb7imN6UGh2k2+oFD7bJ
 ZMroz1dRYh47V5oXQ/rtE5FlerT+6+EPYSmPjUyD1rur/bUVcUuRdj0R44q4jOsKpUpo
 CBHqac2y8g7NZQxXQh40GGx9dfQIP9Gtjo7519AQ/gg22OGE0QdaIwvZRLcXG0Suku49
 txig==
X-Gm-Message-State: AOAM532iaFuo03KMkBYSgGV6XuEyRHDSbaKm9Yh/kYnGXrbq7bLfjs0R
 zGeB1gKnMawngJKjY8ToAyw5I0EkNqcBgA8fzgY=
X-Google-Smtp-Source: ABdhPJy8/yYibE18ZnORsO1PFUmNpdETtM0m4Kc+WLNYkejxTCHgHHalDmgjgagEPRTv8FmD+iOrQvgTtTnIIy3JMd8=
X-Received: by 2002:a17:906:7629:: with SMTP id
 c9mr8033141ejn.527.1626875755720; 
 Wed, 21 Jul 2021 06:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210721084446.26377-1-zhuguanghong@uniontech.com>
In-Reply-To: <20210721084446.26377-1-zhuguanghong@uniontech.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 21 Jul 2021 17:55:44 +0400
Message-ID: <CAJ+F1CKkgfp8nDqHZD1Y8xAiY4_+eRmQBddE8W8bgV22BKoEQA@mail.gmail.com>
Subject: Re: [PATCH] qom/object.c 'if (type_table == NULL)' statement is
 redundant , delete it.
To: zhuguanghong <zhuguanghong@uniontech.com>
Content-Type: multipart/alternative; boundary="000000000000837f4505c7a287cf"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000837f4505c7a287cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 21, 2021 at 5:22 PM zhuguanghong <zhuguanghong@uniontech.com>
wrote:

> Signed-off-by: zhuguanghong <zhuguanghong@uniontech.com>
> ---
>  qom/object.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/qom/object.c b/qom/object.c
> index 6a01d56546..c8f5481afe 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -78,9 +78,7 @@ static GHashTable *type_table_get(void)
>  {
>      static GHashTable *type_table;
>
> -    if (type_table =3D=3D NULL) {
> -        type_table =3D g_hash_table_new(g_str_hash, g_str_equal);
> -    }
> +    type_table =3D g_hash_table_new(g_str_hash, g_str_equal);
>
>
nack.It's not redundant, it does a one-time initialization.

We may want to replace it with a more explicit and thread-safe version
though:
https://developer.gnome.org/glib/stable/glib-Threads.html#g-once-init-enter

     return type_table;
>  }
> --
> 2.20.1
>
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000837f4505c7a287cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 21, 2021 at 5:22 PM zhu=
guanghong &lt;<a href=3D"mailto:zhuguanghong@uniontech.com">zhuguanghong@un=
iontech.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: zhuguanghong &lt;<a href=3D"mailto:zhuguanghong@u=
niontech.com" target=3D"_blank">zhuguanghong@uniontech.com</a>&gt;<br>
---<br>
=C2=A0qom/object.c | 4 +---<br>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/qom/object.c b/qom/object.c<br>
index 6a01d56546..c8f5481afe 100644<br>
--- a/qom/object.c<br>
+++ b/qom/object.c<br>
@@ -78,9 +78,7 @@ static GHashTable *type_table_get(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0static GHashTable *type_table;<br>
<br>
-=C2=A0 =C2=A0 if (type_table =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 type_table =3D g_hash_table_new(g_str_hash, g_=
str_equal);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 type_table =3D g_hash_table_new(g_str_hash, g_str_equal);<br=
>
<br></blockquote><div><br></div><div>nack.It&#39;s not redundant, it does a=
 one-time initialization.</div><div><br></div><div>We may want to replace i=
t with a more explicit and thread-safe version though: <a href=3D"https://d=
eveloper.gnome.org/glib/stable/glib-Threads.html#g-once-init-enter">https:/=
/developer.gnome.org/glib/stable/glib-Threads.html#g-once-init-enter</a></d=
iv><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0return type_table;<br>
=C2=A0}<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000837f4505c7a287cf--

