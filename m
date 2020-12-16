Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615CE2DC500
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:05:53 +0100 (CET)
Received: from localhost ([::1]:45354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaFM-0003B1-Du
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpa7Z-0003FD-ES
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:57:51 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpa7T-0003do-GM
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:57:47 -0500
Received: by mail-ej1-x631.google.com with SMTP id 6so19103338ejz.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4CI7aVdY59jBz0aC076TxIW0INxawkKVYL8KQkwaFsA=;
 b=cHVgdH7eKs6yDh2pWRb0++jhrJ5i7PwYE0+4IOni8s3rsxxB5rxV4ZdkhppUN+nkr3
 5CAmWiHnXyE34wQXi4PJcrYYgn+eaZ0qwUe4XWwfKQV+DGhqdrSNsP8HuKsNp8Yoa6sr
 XmlyHAKkGczZWGDQBuVRA+WZlWq05mYZNFoBCt2N1Y19A3HB+8vCBhxK7pzISgfk4xeY
 a3FH8TsQcBAbzXHchnCJKCM/GevoP9KEqIKwU54nue0juDr1mHDJZy77GEvNODb+4+ko
 d8UcrGV+QDmNNjhC8845UT46K2M/xMDNSsGOLHAiybjgdnGniH8WexpYJ/hO60POvdSp
 lNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4CI7aVdY59jBz0aC076TxIW0INxawkKVYL8KQkwaFsA=;
 b=Lfw8LgWZtS4K6Be9actRW/OBKtjsFwnzZC4+iu4omJU13EAb2i261+bZX27S8PwZ7s
 ShaX4YCNkCpp9ukkPQuDLAKD+PS5v0iLtS72OdM7OmRbt9xmCndlITxPVLC9vnT25bRJ
 77o2dZxRyx3Zd1F8iCriy9gzwAKLyeupULsb48Aec+mSE0g7yRkM7qr7hHslD6nnv3xu
 o3LV8aMjVDVMsy0WRAMyPNJGL3zGNyJ8jC+wu4qbfrcmZ3nHLE+PF7CpBAE9f09fz8gq
 RhazDx7+rMBABtWYoLvxG0hOhg4C3pV2SBB7fcL3+pyEm9bbM+B1DtBbFJzBa3wzlgoh
 5Raw==
X-Gm-Message-State: AOAM531z6Hyw0Qi1Hb+I6uC6h3eQL5qFZLSYhXoSXi5NahIi4kZGfU2Q
 BCxl2KUUQWEYQSu312GL8P5JGAjhnAjaBPRWansq6o8lHA7pDg==
X-Google-Smtp-Source: ABdhPJyuIGATHI+oVHeKU56HcCO4EagR0Q+ZbuJQkokJxvNmnnPuQI5Wu+63sQbkFnf1GmztKK2YSHZxJqcMQbMhQao=
X-Received: by 2002:a17:906:30d2:: with SMTP id
 b18mr31416902ejb.109.1608137862133; 
 Wed, 16 Dec 2020 08:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20201216162006.433850-1-pbonzini@redhat.com>
 <20201216162006.433850-7-pbonzini@redhat.com>
In-Reply-To: <20201216162006.433850-7-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Dec 2020 20:57:30 +0400
Message-ID: <CAJ+F1CLCaRG8Ugm1VS1NkeuYbfnOc447G8M76P-FRdT3Zpt3sA@mail.gmail.com>
Subject: Re: [PATCH 6/7] meson: use dependency to gate block modules
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000005bd9305b697c662"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x631.google.com
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

--00000000000005bd9305b697c662
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 8:26 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> This will allow converting the dependencies to meson options one by one,
> because moving the tests to meson.build will get rid of the symbols
> in config-host.mak.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  block/meson.build | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/block/meson.build b/block/meson.build
> index 5dcc1e5cce..b02cb14aad 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -70,14 +70,14 @@ block_modules =3D {}
>
>  modsrc =3D []
>  foreach m : [
> -  ['CONFIG_CURL', 'curl', [curl, glib], 'curl.c'],
> -  ['CONFIG_GLUSTERFS', 'gluster', glusterfs, 'gluster.c'],
> -  ['CONFIG_LIBISCSI', 'iscsi', libiscsi, 'iscsi.c'],
> -  ['CONFIG_LIBNFS', 'nfs', libnfs, 'nfs.c'],
> -  ['CONFIG_LIBSSH', 'ssh', libssh, 'ssh.c'],
> -  ['CONFIG_RBD', 'rbd', rbd, 'rbd.c'],
> +  [curl, 'curl', [curl, glib], 'curl.c'],
> +  [glusterfs, 'gluster', glusterfs, 'gluster.c'],
> +  [libiscsi, 'iscsi', libiscsi, 'iscsi.c'],
> +  [libnfs, 'nfs', libnfs, 'nfs.c'],
> +  [libssh, 'ssh', libssh, 'ssh.c'],
> +  [rbd, 'rbd', rbd, 'rbd.c'],
>  ]
> -  if config_host.has_key(m[0])
> +  if m[0].found()
>      if enable_modules
>        modsrc +=3D files(m[3])
>      endif
> @@ -90,10 +90,10 @@ endforeach
>  # those are not exactly regular block modules, so treat them apart
>  if 'CONFIG_DMG' in config_host
>    foreach m : [
> -    ['CONFIG_LZFSE', 'dmg-lzfse', liblzfse, 'dmg-lzfse.c'],
> -    ['CONFIG_BZIP2', 'dmg-bz2', [glib, libbzip2], 'dmg-bz2.c']
> +    [liblzfse, 'dmg-lzfse', liblzfse, 'dmg-lzfse.c'],
> +    [libbzip2, 'dmg-bz2', [glib, libbzip2], 'dmg-bz2.c']
>    ]
> -    if config_host.has_key(m[0])
> +    if m[0].found()
>        module_ss =3D ss.source_set()
>        module_ss.add(when: m[2], if_true: files(m[3]))
>        block_modules +=3D {m[1] : module_ss}
> --
> 2.29.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000005bd9305b697c662
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020 at 8:26 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This=
 will allow converting the dependencies to meson options one by one,<br>
because moving the tests to meson.build will get rid of the symbols<br>
in config-host.mak.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0block/meson.build | 20 ++++++++++----------<br>
=C2=A01 file changed, 10 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/block/meson.build b/block/meson.build<br>
index 5dcc1e5cce..b02cb14aad 100644<br>
--- a/block/meson.build<br>
+++ b/block/meson.build<br>
@@ -70,14 +70,14 @@ block_modules =3D {}<br>
<br>
=C2=A0modsrc =3D []<br>
=C2=A0foreach m : [<br>
-=C2=A0 [&#39;CONFIG_CURL&#39;, &#39;curl&#39;, [curl, glib], &#39;curl.c&#=
39;],<br>
-=C2=A0 [&#39;CONFIG_GLUSTERFS&#39;, &#39;gluster&#39;, glusterfs, &#39;glu=
ster.c&#39;],<br>
-=C2=A0 [&#39;CONFIG_LIBISCSI&#39;, &#39;iscsi&#39;, libiscsi, &#39;iscsi.c=
&#39;],<br>
-=C2=A0 [&#39;CONFIG_LIBNFS&#39;, &#39;nfs&#39;, libnfs, &#39;nfs.c&#39;],<=
br>
-=C2=A0 [&#39;CONFIG_LIBSSH&#39;, &#39;ssh&#39;, libssh, &#39;ssh.c&#39;],<=
br>
-=C2=A0 [&#39;CONFIG_RBD&#39;, &#39;rbd&#39;, rbd, &#39;rbd.c&#39;],<br>
+=C2=A0 [curl, &#39;curl&#39;, [curl, glib], &#39;curl.c&#39;],<br>
+=C2=A0 [glusterfs, &#39;gluster&#39;, glusterfs, &#39;gluster.c&#39;],<br>
+=C2=A0 [libiscsi, &#39;iscsi&#39;, libiscsi, &#39;iscsi.c&#39;],<br>
+=C2=A0 [libnfs, &#39;nfs&#39;, libnfs, &#39;nfs.c&#39;],<br>
+=C2=A0 [libssh, &#39;ssh&#39;, libssh, &#39;ssh.c&#39;],<br>
+=C2=A0 [rbd, &#39;rbd&#39;, rbd, &#39;rbd.c&#39;],<br>
=C2=A0]<br>
-=C2=A0 if config_host.has_key(m[0])<br>
+=C2=A0 if m[0].found()<br>
=C2=A0 =C2=A0 =C2=A0if enable_modules<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0modsrc +=3D files(m[3])<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
@@ -90,10 +90,10 @@ endforeach<br>
=C2=A0# those are not exactly regular block modules, so treat them apart<br=
>
=C2=A0if &#39;CONFIG_DMG&#39; in config_host<br>
=C2=A0 =C2=A0foreach m : [<br>
-=C2=A0 =C2=A0 [&#39;CONFIG_LZFSE&#39;, &#39;dmg-lzfse&#39;, liblzfse, &#39=
;dmg-lzfse.c&#39;],<br>
-=C2=A0 =C2=A0 [&#39;CONFIG_BZIP2&#39;, &#39;dmg-bz2&#39;, [glib, libbzip2]=
, &#39;dmg-bz2.c&#39;]<br>
+=C2=A0 =C2=A0 [liblzfse, &#39;dmg-lzfse&#39;, liblzfse, &#39;dmg-lzfse.c&#=
39;],<br>
+=C2=A0 =C2=A0 [libbzip2, &#39;dmg-bz2&#39;, [glib, libbzip2], &#39;dmg-bz2=
.c&#39;]<br>
=C2=A0 =C2=A0]<br>
-=C2=A0 =C2=A0 if config_host.has_key(m[0])<br>
+=C2=A0 =C2=A0 if m[0].found()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0module_ss =3D ss.source_set()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0module_ss.add(when: m[2], if_true: files(m[3]))<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0block_modules +=3D {m[1] : module_ss}<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000005bd9305b697c662--

