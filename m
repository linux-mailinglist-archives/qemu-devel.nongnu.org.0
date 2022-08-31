Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29335A7E50
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:11:07 +0200 (CEST)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNUo-0000NM-Tj
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNSS-00061B-KO; Wed, 31 Aug 2022 09:08:40 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:46028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNSQ-0004Mt-Rm; Wed, 31 Aug 2022 09:08:40 -0400
Received: by mail-lj1-x235.google.com with SMTP id b26so7647644ljk.12;
 Wed, 31 Aug 2022 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=T31IdmnajtaKqoKPNRjrb5IqCMx20iM6Frl3HKDnMso=;
 b=TvIOrV5pwHxOZNzyge8UVxpxIDkeT0aoL1LpvUCgGdKifZoGLVXh+yYpCdhl61OgPU
 uaSuWGcWCLUIG7JDL23WW7wRwg7H6c+ESHgilTd/2THKET/Iry9N6wYl9mZ5ddvCm+Md
 zAUoGo0lqLFukqM0cUcZ/Js/5nRXB/HmfD7sqZsvyuLxh1Tr0IAVd6yXb1u4NuSjR+6g
 edC6qYbN07Mzv8GzYI2ZhtnnCdsBZxvZYe9ycfqE78PqEQKXiWq3+wnndSaIXNdMslRu
 KKTxqbB14GtyyqJieVvdcGIEwwmu/ZvNylIs02Na+F+7iMA4UcxkOslApMxQp4aVZQqh
 kSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=T31IdmnajtaKqoKPNRjrb5IqCMx20iM6Frl3HKDnMso=;
 b=K1gOnDp6kn6Nxy3sGP04KzHnMJ9owzErVQf9uE/MNt9DJgJO2V6bThLxo+OCI0N0Sf
 SCgtwKo8eps4JCyoyB5aaF81NqEjF8uJhS4N6M9Sf+wApnZUmZnT0PE4BZ+lkYg3tzfS
 3yEV0z0aah26Dp4ATfQZUCRSE46/Z38eV4W9ZxfNOMlWShvvpFsTFePPo4dYoILEEn/V
 ukE8uuh0h+rJtMjP7joax9/AWSOIXsKFKUDatpCSHNXqI4OIzAPTCCiFpH4jjASgR7D9
 TYMYlniJ5qymk1IGYvz2hg9EKShedfXRDXwDtMvJcbRNX5YdtiDuTOz7q9jxZQaBNTPH
 efCg==
X-Gm-Message-State: ACgBeo1b2bUmD3wLjx2jyhhJcRL01kgE1vwssB7jJN2oDCk3gthum2E5
 fywLj9LOLossmt8o/+xqlG3oWFe2VM9wcaopmrI=
X-Google-Smtp-Source: AA6agR6TI6GkvIGyUFXO5WcNzijmJ8143MuDNVJ3R/qt8n9Z9tz6AK51B3X9b4wwom/oZxpq6ZqkYbmG9YFuaSFeacw=
X-Received: by 2002:a2e:9942:0:b0:265:e313:7fb7 with SMTP id
 r2-20020a2e9942000000b00265e3137fb7mr3591007ljj.449.1661951316749; Wed, 31
 Aug 2022 06:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-9-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-9-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:08:25 +0400
Message-ID: <CAJ+F1CKEg+h+=+-_kjOip_=PZ9f1dN4OcMBz1JAVtp_58VPA1w@mail.gmail.com>
Subject: Re: [PATCH 08/51] block/vvfat: Unify the mkdir() call
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000de72a805e78931f2"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000de72a805e78931f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 2:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> There is a difference in the mkdir() call for win32 and non-win32
> platforms, and currently is handled in the codes with #ifdefs.
>
> glib provides a portable g_mkdir_with_parents() API and we can use
> it to unify the codes without #ifdefs.
>

Why use the _with_parents() version?

You should replace with g_mkdir(), or explain the reasons.

thanks


>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  block/vvfat.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/block/vvfat.c b/block/vvfat.c
> index d6dd919683..9c389ce5ea 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -2726,13 +2726,9 @@ static int
> handle_renames_and_mkdirs(BDRVVVFATState* s)
>              mapping_t* mapping;
>              int j, parent_path_len;
>
> -#ifdef __MINGW32__
> -            if (mkdir(commit->path))
> +            if (g_mkdir_with_parents(commit->path, 0755)) {
>                  return -5;
> -#else
> -            if (mkdir(commit->path, 0755))
> -                return -5;
> -#endif
> +            }
>
>              mapping =3D insert_mapping(s, commit->param.mkdir.cluster,
>                      commit->param.mkdir.cluster + 1);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000de72a805e78931f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:20 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
There is a difference in the mkdir() call for win32 and non-win32<br>
platforms, and currently is handled in the codes with #ifdefs.<br>
<br>
glib provides a portable g_mkdir_with_parents() API and we can use<br>
it to unify the codes without #ifdefs.<br></blockquote><div><br></div><div>=
Why use the _with_parents() version?</div><div><br></div><div>You should re=
place with g_mkdir(), or explain the reasons.</div><div><br></div><div>than=
ks<br></div><div>=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0block/vvfat.c | 8 ++------<br>
=C2=A01 file changed, 2 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/block/vvfat.c b/block/vvfat.c<br>
index d6dd919683..9c389ce5ea 100644<br>
--- a/block/vvfat.c<br>
+++ b/block/vvfat.c<br>
@@ -2726,13 +2726,9 @@ static int handle_renames_and_mkdirs(BDRVVVFATState*=
 s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapping_t* mapping;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int j, parent_path_len;<br>
<br>
-#ifdef __MINGW32__<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mkdir(commit-&gt;path))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_mkdir_with_parents(commit-=
&gt;path, 0755)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -5;<br=
>
-#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mkdir(commit-&gt;path, 0755)=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -5;<br>
-#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapping =3D insert_mapping(=
s, commit-&gt;param.mkdir.cluster,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0commit-&gt;param.mkdir.cluster + 1);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000de72a805e78931f2--

