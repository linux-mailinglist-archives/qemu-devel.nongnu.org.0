Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D002DC52E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:19:03 +0100 (CET)
Received: from localhost ([::1]:55814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaS6-0004Tb-Te
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpa6V-0001ks-Lp
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:56:43 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpa6U-0003Tl-1p
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:56:43 -0500
Received: by mail-ed1-x534.google.com with SMTP id h16so25577680edt.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uCPnZCGtCXDHkFi3NAyUb041BTR1b6MLjnoro1X66LI=;
 b=NQv2HnMqh5I4x1I/cy5yeZMHQYooDi9sObDPCpqlTF+eN+ydXo7IP8e1sZvPNdFBUi
 2laC+no98ijQ0qEVjhBR0Y1fUNhq6zyg6QV/IsaIDKVjFpSJobJ1F1FNxVwfz5ASlbvQ
 8Q5Q/XuWuquVlvmsioKQ4XqCn4654pDnAW7/QEtjJzhgPgER28efk6fm3LHyt61sU2yB
 WrXNb7GwPTihuCHf6L3Iq58pZSXxhFFzrsnVuLBvJSc9MHxZcykzvNU3ogaGfMLyxBQ9
 HOTvoOmRKQMTpg5BTbfYSzhebxriEUWeADm/lwdVR2X7VGQypC+dEYtq0mA9c1Yddzjd
 YXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uCPnZCGtCXDHkFi3NAyUb041BTR1b6MLjnoro1X66LI=;
 b=tGim1zJfBjM1D4PSxHo3c9a0gmFfCI6NkKIOy7wYn/v0ck90jwcHfq7YDUKaeiTCBA
 FHQxqe1Jz9FE9OuPYXNOMsOxVVEroC5Uz0U2l0upBWky4vPvD+GQXTXjS0vwjL66C6gK
 /bXvsGedxGozdS4t5d9Vqj2mhZOFsJ+wUwgneTw6XNBStT8kiQQTxewi0PYeY3lIpZE3
 cP5lvd7dAaCtTC8UZpDNM8EgN2Gp/gQpvcIqriQKhJhKCbZmlUoEZZy8IEH8lRt9U74j
 TchiFaUocgrU9g426H0fZmsfF5gxX3aCEUh/BAzLmJc9fUWRkAZtV1uWJDeBrjgBjZmF
 cTnQ==
X-Gm-Message-State: AOAM532NF34mkBcMKvVXCd9t6JhgJ3cHlJcCjP2yw8wdHq0yY5NcCoLW
 QyIvyrDO7IArHl83is/qqAgpG5xwdDjvgYbxGqFfy9nt+Wc=
X-Google-Smtp-Source: ABdhPJwSLEFcCYOT9Z+QzpNEQEWVFHcF3s+bJWyaiWipGppr/2ylsU9SbtN8iNjVvUByIYsWIw5/9ynp3jtuXBYtJjM=
X-Received: by 2002:a50:a6de:: with SMTP id f30mr7726965edc.30.1608137800650; 
 Wed, 16 Dec 2020 08:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20201216162006.433850-1-pbonzini@redhat.com>
 <20201216162006.433850-6-pbonzini@redhat.com>
In-Reply-To: <20201216162006.433850-6-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Dec 2020 20:56:29 +0400
Message-ID: <CAJ+F1CJTE3qCEN+S4Kn_Tec27Fjej2tSCXuDfL8ixE7XibLNxA@mail.gmail.com>
Subject: Re: [PATCH 5/7] meson: use pkg-config method for libudev
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005b93ee05b697c217"
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b93ee05b697c217
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 8:28 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Do not bother asking CMake, this is a pkg-config dependency.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

What was the problem with the default behaviour? Do we need to set
pkg-config explicitly on all dependencies?

---
>  meson.build | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meson.build b/meson.build
> index ab622ae8bd..0b36fb38f1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -399,6 +399,7 @@ endif
>  libudev =3D not_found
>  if targetos =3D=3D 'linux' and (have_system or have_tools)
>    libudev =3D dependency('libudev',
> +                       method: 'pkg-config',
>                         required: get_option('libudev'),
>                         static: enable_static)
>  endif
> --
> 2.29.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005b93ee05b697c217
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020 at 8:28 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Do n=
ot bother asking CMake, this is a pkg-config dependency.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>What was the problem with the default behaviour? Do we need to set pkg-=
config explicitly on all dependencies?<br></div><div> <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meson.build | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index ab622ae8bd..0b36fb38f1 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -399,6 +399,7 @@ endif<br>
=C2=A0libudev =3D not_found<br>
=C2=A0if targetos =3D=3D &#39;linux&#39; and (have_system or have_tools)<br=
>
=C2=A0 =C2=A0libudev =3D dependency(&#39;libudev&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0method: &#39;pkg-config&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 required: get_option(&#39;libudev&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 static: enable_static)<br>
=C2=A0endif<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005b93ee05b697c217--

