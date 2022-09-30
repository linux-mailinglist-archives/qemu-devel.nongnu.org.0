Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2485C5F0627
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 10:02:44 +0200 (CEST)
Received: from localhost ([::1]:57176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeAyp-0002rB-8S
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 04:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oeAw2-0007o3-Kt
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:59:50 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:35603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oeAw0-00017Z-LL
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:59:50 -0400
Received: by mail-lf1-x12c.google.com with SMTP id z4so5690314lft.2
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 00:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=lYWIoKtmttIyM1o60e6pC6x6TPcNlFTYZwBQ34XEi2o=;
 b=ggeyhfct9uUGoDMPRyiOiayECSrdlE5WUJ3cNOWChsde+dXBhkHG2O3qTPp9+JSpZh
 XEAME7rufAEKIZvaI2HTJeaDmj2OOSJkT+i/W0sBTHTK1yvqL3Utf/RuLtHcatnnWm18
 KtUYcnmUfG+x7c129FTiArHK8AkqlwT6n59aOPJWmZq75oTTnYHpZnGGgIgW6/4Ff78t
 GRAgs3pl/XU44m6mG5DPAmCyihlmDPSB7vqLs7hsvZ+UFmJ+IEe41qU/XJPe2+zCLD7u
 yem8Wflf+Cn+lA/RpMSrZ/hSxkH2FLASGaHm5gwv94NQc6Sr358do0+bo0HPsTRhh5Bk
 eNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=lYWIoKtmttIyM1o60e6pC6x6TPcNlFTYZwBQ34XEi2o=;
 b=CQIIPFB7UMV6qxwtjubUJB4zUJVPiooDOtIqG7k9G1YqyS5Vu/OMYZFVDf6nPSGTjm
 8a8nXv2yC6iJ89eR+uwbMPdgaLJZQzpF81ad2VFk3v1RrSg8ivxnhldAEevz+Kh1WP2l
 JeVhq2ZKG+2Zsu4VdpRLaVaH9c2/YWlPA3HAMeMEsIk33CLO86pmgYKT9At3Yg7EZkBH
 /PFDnKOxkCf6eq/f6a4L2pXNwzAQYHBGQoJXknFZdPdYmtQ3ehw1OSgaRddducrIR0Rs
 i7lcjCv0tFkdMBU1Q9hTsGCnciwqTtTNYsADtfvqrV1rjqvAjvVXPCwKBi7I9LZoIeAs
 VbxA==
X-Gm-Message-State: ACrzQf3oHiI8fbeQJEhH7M3edjqqGYr+Lwi/bFd10KJufI7EeWOLBE1e
 /HvV1n/lsbqIBssBZtEiFuo2qqSI0Q+Cs31oxnc=
X-Google-Smtp-Source: AMsMyM51+7ARG5H9dn4X+CLNgdfnbGEabHtS67cMBq6+KYyvb3Wl8KP3tHxEJMhGplj9nUkCGlMEQnYvOeUp/jlXTqg=
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id
 cf13-20020a056512280d00b00498fd4051d4mr3238037lfb.167.1664524786208; Fri, 30
 Sep 2022 00:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220930075324.13550-1-pbonzini@redhat.com>
In-Reply-To: <20220930075324.13550-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Sep 2022 11:59:34 +0400
Message-ID: <CAJ+F1CKWo5ati_Kj=X9-Vp-GCSqncTP1eP=4bn5WdC+6F387HA@mail.gmail.com>
Subject: Re: [PATCH] meson: -display dbus and CFI are incompatible
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: multipart/alternative; boundary="0000000000009a142f05e9e060d2"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000009a142f05e9e060d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Sep 30, 2022 at 11:53 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> The generated skeletons for DBus call the finalize method of the parent
> type using code like
>
>     G_OBJECT_CLASS
> (qemu_dbus_display1_chardev_skeleton_parent_class)->finalize (object);
>
> However, the finalize method is defined in a shared library that is not
> compiled with CFI.  Do not enable anything that uses gdbus-codegen if
> --enable-cfi was specified.
>

I had the same analysis. But what if gdbus (or other dependencies) is
compiled with CFI ? Note: I have no idea if CFI is meant to be usable in
production or just for developers.


> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  meson.build | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index f6962834a3..6106daf267 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -515,6 +515,7 @@ meson.override_dependency('glib-2.0', glib)
>
>  gio =3D not_found
>  gdbus_codegen =3D not_found
> +gdbus_codegen_error =3D '@0@ requires gdbus-codegen, please install libg=
io'
>  if not get_option('gio').auto() or have_system
>    gio =3D dependency('gio-2.0', required: get_option('gio'),
>                     method: 'pkg-config', kwargs: static_kwargs)
> @@ -539,6 +540,10 @@ if not get_option('gio').auto() or have_system
>                               version: gio.version())
>    endif
>  endif
> +if gdbus_codegen.found() and get_option('cfi')
> +  gdbus_codegen =3D not_found
> +  gdbus_codegen_error =3D '@0@ uses gdbus-codegen, which does not suppor=
t
> control flow integrity')
> +endif
>
>  lttng =3D not_found
>  if 'ust' in get_option('trace_backends')
> @@ -1697,7 +1702,7 @@ dbus_display =3D get_option('dbus_display') \
>    .require(gio.version().version_compare('>=3D2.64'),
>             error_message: '-display dbus requires glib>=3D2.64') \
>    .require(gdbus_codegen.found(),
> -           error_message: '-display dbus requires gdbus-codegen') \
> +           error_message: gdbus_codegen_error.format('-display dbus')) \
>    .require(opengl.found() and gbm.found(),
>             error_message: '-display dbus requires epoxy/egl and gbm') \
>    .allowed()
> --
> 2.37.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009a142f05e9e060d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 30, 2022 at 11:53 AM Pa=
olo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
he generated skeletons for DBus call the finalize method of the parent<br>
type using code like<br>
<br>
=C2=A0 =C2=A0 G_OBJECT_CLASS (qemu_dbus_display1_chardev_skeleton_parent_cl=
ass)-&gt;finalize (object);<br>
<br>
However, the finalize method is defined in a shared library that is not<br>
compiled with CFI.=C2=A0 Do not enable anything that uses gdbus-codegen if<=
br>
--enable-cfi was specified.<br></blockquote><div><br></div><div>I had the s=
ame analysis. But what if gdbus (or other dependencies) is compiled with CF=
I ? Note: I have no idea if CFI is meant to be usable in production or just=
 for developers.<br></div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meson.build | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index f6962834a3..6106daf267 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -515,6 +515,7 @@ meson.override_dependency(&#39;glib-2.0&#39;, glib)<br>
<br>
=C2=A0gio =3D not_found<br>
=C2=A0gdbus_codegen =3D not_found<br>
+gdbus_codegen_error =3D &#39;@0@ requires gdbus-codegen, please install li=
bgio&#39;<br>
=C2=A0if not get_option(&#39;gio&#39;).auto() or have_system<br>
=C2=A0 =C2=A0gio =3D dependency(&#39;gio-2.0&#39;, required: get_option(&#3=
9;gio&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 metho=
d: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
@@ -539,6 +540,10 @@ if not get_option(&#39;gio&#39;).auto() or have_system=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version: gio.version())<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
+if gdbus_codegen.found() and get_option(&#39;cfi&#39;)<br>
+=C2=A0 gdbus_codegen =3D not_found<br>
+=C2=A0 gdbus_codegen_error =3D &#39;@0@ uses gdbus-codegen, which does not=
 support control flow integrity&#39;)<br>
+endif<br>
<br>
=C2=A0lttng =3D not_found<br>
=C2=A0if &#39;ust&#39; in get_option(&#39;trace_backends&#39;)<br>
@@ -1697,7 +1702,7 @@ dbus_display =3D get_option(&#39;dbus_display&#39;) \=
<br>
=C2=A0 =C2=A0.require(gio.version().version_compare(&#39;&gt;=3D2.64&#39;),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;-display dbus=
 requires glib&gt;=3D2.64&#39;) \<br>
=C2=A0 =C2=A0.require(gdbus_codegen.found(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;-display dbus=
 requires gdbus-codegen&#39;) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: gdbus_codegen_erro=
r.format(&#39;-display dbus&#39;)) \<br>
=C2=A0 =C2=A0.require(opengl.found() and gbm.found(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;-display dbus=
 requires epoxy/egl and gbm&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
-- <br>
2.37.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009a142f05e9e060d2--

