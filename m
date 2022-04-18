Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ACA504DB3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 10:22:09 +0200 (CEST)
Received: from localhost ([::1]:33086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngMe6-0008OV-Sy
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 04:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ngMY8-0004ho-J4
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 04:15:57 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:46646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ngMY5-0003sS-9q
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 04:15:55 -0400
Received: by mail-oi1-x22b.google.com with SMTP id b188so14067058oia.13
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NQZw53XIs3Ia0/xIqqp5V7BHxDZAb5WVPCVwKWEmNVc=;
 b=Jh4aXNzB2ePRPAKqODUPpDwCTR3vYfSH+SYNMa9UrxGqGTkxGIcGcIGzsdKkC6qzya
 UCAD2e9LPnK2ZhaPzd/wrsTwOaAZJal3bHis7gote2P8Ty4y6viYB2CC7bJlwMTHDm8x
 44u+ypo24hREJtNbUB5hTEqBjBitvKwSbs57zgAdh8HwJaraLabVHG0CMVX0utCkmgdy
 Hk2BNE8DLTvO+km9Hsz9xcSGS0JrginKC2fk4QILDq3zuw8Hbkf1B0dVPFUhggGIReQF
 CBJRlHovgeoDU+uag9Cuq3CYZrw608doJ1D5t8P9wihvwu95nyZNPfNfydI5xjGIWy9V
 PxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NQZw53XIs3Ia0/xIqqp5V7BHxDZAb5WVPCVwKWEmNVc=;
 b=JQxknBxMQ5Rm9SpzvW8QVBR/fotKXSxFjz94iB+wXHD30CI36ozwx/u2sdpznXDfvR
 3mX+/TkTHTLoXvlzdGtAVCR5srsEjho+ZwHpZLCTWXIw9WUXbKcfOGG0swT0PqCXLAId
 UyuL77+GnzdGkKTGwLqX46hwc4Nhql+4cHkLykL1KsdH8l6iN1bHVlF1j9aU5Fpo9NtB
 TBQ+GSmJqKeNOZvg/ZWdQwQEGQN0FVjdbklY7FfNSKtln4ZI2nHOe5yE75dLYMGaf2GI
 vfmIGv9jYy5xH6sgwzz7IzhtW1hAcNGTXVymzeMgC4Ij9gCr06cVgz+XCxqvIy9IySX3
 JlLQ==
X-Gm-Message-State: AOAM530+jqyA/uWfemJe4Dur1w0mavgc7gP3QZmZbrOOrI6PIqYCsh0U
 I5RrCJ5uWEwD28Ng6N+K+N9Sx6WNc8TThAPZG6o=
X-Google-Smtp-Source: ABdhPJyGC5Xt7FrLO+mdcNuJV6XPKAWv/gsa2WYV9TjJyOaDPx4Lu9krESJemfDWYvK4rkAl4BQVJeOtfxW2JjZtxPo=
X-Received: by 2002:aca:f1d5:0:b0:2ec:eaab:eb9b with SMTP id
 p204-20020acaf1d5000000b002eceaabeb9bmr4365199oih.228.1650269751782; Mon, 18
 Apr 2022 01:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <fb9c4633-27af-a01d-3cca-79ed20519727@zapateado.de>
In-Reply-To: <fb9c4633-27af-a01d-3cca-79ed20519727@zapateado.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 18 Apr 2022 12:15:40 +0400
Message-ID: <CAJ+F1CLuCGTequPCD8ZK08bu3zdo6rdN1UBNX7AXO-s16fVQog@mail.gmail.com>
Subject: Re: [PATCH] qga/vss-win32: enable qga-vss.tlb generation with widl
To: Helge Konetzka <hk@zapateado.de>
Content-Type: multipart/alternative; boundary="00000000000056b3e205dce95efb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-oi1-x22b.google.com
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
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000056b3e205dce95efb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Helge

On Sun, Apr 17, 2022 at 6:51 PM Helge Konetzka <hk@zapateado.de> wrote:

> Generation with widl needs to be triggered explicitly and requires
> library and include directories containing referenced *.idl and *.tlb
> as parameters.
>

Ok, that's different issues, it would help to split the patch.


>
> Signed-off-by: Helge Konetzka <hk@zapateado.de>
> ---
>
> For tested Msys2 build all referenced resources reside in /<usr>/include.
> Msys2 provides its flavours in different /<usr> bases.
>
> This patch derives the missing include directory path from widl path.
> Assuming the given widl path is /<usr>/bin/widl, it determines /<usr>
> as base and appends /<usr>/include as include and library directories
> to widl command. This way the directory is correct for any Msys2
> flavour.
> It makes sure, only existing directories are appended as parameter.
>

I would file a bug to msys2 instead for widl to use the default include
directory. Otherwise, every widl user out there needs to be adjusted.
(I think it would need a special --with-widl-includedir=3DDIR, given how
msys2 remaps directory)


> ---
>   qga/vss-win32/meson.build | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> index 71c50d0866..51539a582c 100644
> --- a/qga/vss-win32/meson.build
> +++ b/qga/vss-win32/meson.build
> @@ -30,9 +30,16 @@ if midl.found()
>                             input: 'qga-vss.idl',
>                             output: 'qga-vss.tlb',
>                             command: [midl, '@INPUT@', '/tlb', '@OUTPUT@
> '])
> -else
> +elif widl.found()
> +  widl_cmd =3D [widl, '-t', '@INPUT@', '-o', '@OUTPUT@']
> +  usr_include =3D fs.parent(fs.parent(widl.full_path()))/'include'
> +  if fs.is_dir(usr_include)
> +    widl_cmd +=3D ['-L', usr_include]
> +    widl_cmd +=3D ['-I', usr_include]
> +  endif
>     gen_tlb =3D custom_target('gen-tlb',
>                             input: 'qga-vss.idl',
>                             output: 'qga-vss.tlb',
> -                          command: [widl, '-t', '@INPUT@', '-o',
> '@OUTPUT@'])
> +                          build_by_default: true,
>

I would make qga_vss depend on gen_tlb instead (so the tlb is always built
with the dll)

thanks

--=20
Marc-Andr=C3=A9 Lureau

--00000000000056b3e205dce95efb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Helge<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 17, 2022 at 6:51 =
PM Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de">hk@zapateado.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Gen=
eration with widl needs to be triggered explicitly and requires<br>
library and include directories containing referenced *.idl and *.tlb<br>
as parameters.<br></blockquote><div><br></div><div>Ok, that&#39;s different=
 issues, it would help to split the patch.</div><div>=C2=A0<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de" target=
=3D"_blank">hk@zapateado.de</a>&gt;<br>
---<br>
<br>
For tested Msys2 build all referenced resources reside in /&lt;usr&gt;/incl=
ude.<br>
Msys2 provides its flavours in different /&lt;usr&gt; bases.<br>
<br>
This patch derives the missing include directory path from widl path.<br>
Assuming the given widl path is /&lt;usr&gt;/bin/widl, it determines /&lt;u=
sr&gt;<br>
as base and appends /&lt;usr&gt;/include as include and library directories=
<br>
to widl command. This way the directory is correct for any Msys2<br>
flavour.<br>
It makes sure, only existing directories are appended as parameter.<br></bl=
ockquote><div><br></div><div>I would file a bug to msys2 instead for widl t=
o use the default include directory. Otherwise, every widl user out there n=
eeds to be adjusted.<br></div><div>(I think it would need a special --with-=
widl-includedir=3DDIR, given how msys2 remaps directory)</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
---<br>
=C2=A0 qga/vss-win32/meson.build | 11 +++++++++--<br>
=C2=A0 1 file changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
index 71c50d0866..51539a582c 100644<br>
--- a/qga/vss-win32/meson.build<br>
+++ b/qga/vss-win32/meson.build<br>
@@ -30,9 +30,16 @@ if midl.found()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 input: &#39;qga-vss.idl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 output: &#39;qga-vss.tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 command: [midl, &#39;@INPUT@&#39;, &#39;/tlb&#39;,=
 &#39;@OUTPUT@&#39;])<br>
-else<br>
+elif widl.found()<br>
+=C2=A0 widl_cmd =3D [widl, &#39;-t&#39;, &#39;@INPUT@&#39;, &#39;-o&#39;, =
&#39;@OUTPUT@&#39;]<br>
+=C2=A0 usr_include =3D fs.parent(fs.parent(widl.full_path()))/&#39;include=
&#39;<br>
+=C2=A0 if fs.is_dir(usr_include)<br>
+=C2=A0 =C2=A0 widl_cmd +=3D [&#39;-L&#39;, usr_include]<br>
+=C2=A0 =C2=A0 widl_cmd +=3D [&#39;-I&#39;, usr_include]<br>
+=C2=A0 endif<br>
=C2=A0 =C2=A0 gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 input: &#39;qga-vss.idl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 output: &#39;qga-vss.tlb&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 command: [widl, &#39;-t&#39;, &#39;@INPUT@&#39;, &#39;-o&=
#39;, <br>
&#39;@OUTPUT@&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 build_by_default: true,<br></blockquote><div><br></div><d=
iv>I would make qga_vss depend on gen_tlb instead (so the tlb is always bui=
lt with the dll)<br></div></div><div><br></div><div>thanks<br></div><br>-- =
<br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></=
div></div>

--00000000000056b3e205dce95efb--

