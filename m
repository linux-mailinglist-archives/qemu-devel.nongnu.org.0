Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2673EA30B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 12:42:42 +0200 (CEST)
Received: from localhost ([::1]:58250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8Ab-0007ow-Jf
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 06:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mE89b-0006j8-4X
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:41:39 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mE89Z-0006oF-G3
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:41:38 -0400
Received: by mail-ej1-x632.google.com with SMTP id w5so10665389ejq.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 03:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bPIYhIZTDw97/EmRxMGxssCrzr5fg1xgDsOnHjgDLEU=;
 b=Q3grNmEdmCnTGrcUuXEdk4Ijq1O+5HHSHO7ZZX1k2nEB5qmgbpR5bcQP2cRRQVsra4
 3Edljf2xlsab15dNwu8cBI/1iYiKIP3ikSvdCLKbhUQpnmuHK0sHB/GPMD0+GQEJNFBE
 rs6OXv+RQDezNhc6q0unCd1fsG9CVUvOZSiAvJ3nQ5vSy9wbqfAYwLfOSv2JHU8kj/H3
 RZXhU++mCJqN8eIYkW4GdX6c0Yg3ZmYPtNsHrj2O7Wlveh/5WLKHZjSAd+mpNqXYdzfC
 u48B+d1h5V/pdnC0V0pMobp5uuhGj8+UW98rU+yL83qV1vnx7lK5paCYairtDzE1mUvN
 Ieug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bPIYhIZTDw97/EmRxMGxssCrzr5fg1xgDsOnHjgDLEU=;
 b=OLm3QgeW536hCAAFM8j2PJsj1C1ONQk6LkjnIg82hr+f7tRBm4628YGi6GUfoGPZ23
 bPeOUuYrqKf2anPqr2GenPwlxO4sOqoq2mOB/uz9+criJv/id4NydKU0Gs+F6o1DP3wI
 r7IbbIQVQSGd0ByNCJ7ADYKDPgDY44/UUpiN0WFxtQk6VsrpqXOaX4TCfcIPLofgJxtw
 GZOBqQXI7NWHcNQ7KMYREdF3HCyoAo79QNgKdob6hmSQ2cN56rwZKnXqRMx+vawflBYN
 eFaoKKQlrOYN7wjD3WBAw2rDXDDD9Aeu7gjeBiXuXMhrXI++rS/nYqAYnxQpj7lA5zHA
 b8OA==
X-Gm-Message-State: AOAM533Ix5oW6A1vfYTqi7CuxD9QdDWFEXczbBziW0Z4J7Ksi312FxMT
 4LxEjGemVXObB8NsLprecltelOPsoF0QcHtvyUI=
X-Google-Smtp-Source: ABdhPJztFDnc4l4D/xARYA0jd1B5nc3Q79bKavRmmpi67FSl3xvPqdAjblcOGUf9XSYVERztXWm/AzlJsx63LNXDCVg=
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr3051515ejy.532.1628764895946; 
 Thu, 12 Aug 2021 03:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210812102427.4036399-1-berrange@redhat.com>
In-Reply-To: <20210812102427.4036399-1-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 12 Aug 2021 14:41:24 +0400
Message-ID: <CAJ+F1C+kSatLLOdzP7dL=JSGakONF2wci84k2hdzM7aK+yN-Bg@mail.gmail.com>
Subject: Re: [PATCH v3] docs: make sphinx-build be quiet by default
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000bad1605c95a615e"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
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

--0000000000000bad1605c95a615e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 12, 2021 at 2:25 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> The sphinx-build is fairly verbose spitting out pages of output to the
> console, which causes errors from other build commands to be scrolled
> off the top of the terminal. This can leave the mistaken impression that
> the build passed, when in fact there was a failure.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

much welcome
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>
> In v3:
>
>  - Just set -q flag once in common arg list
>
>  docs/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/meson.build b/docs/meson.build
> index 300b134329..cffe1ecf1d 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -9,7 +9,7 @@ endif
>  # Check if tools are available to build documentation.
>  build_docs =3D false
>  if sphinx_build.found()
> -  SPHINX_ARGS =3D ['env', 'CONFDIR=3D' + qemu_confdir, sphinx_build]
> +  SPHINX_ARGS =3D ['env', 'CONFDIR=3D' + qemu_confdir, sphinx_build, '-q=
']
>    # If we're making warnings fatal, apply this to Sphinx runs as well
>    if get_option('werror')
>      SPHINX_ARGS +=3D [ '-W' ]
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000bad1605c95a615e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 12, 2021 at 2:25 PM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The sphinx-build is fairly verbose spitting out pages of output to th=
e<br>
console, which causes errors from other build commands to be scrolled<br>
off the top of the terminal. This can leave the mistaken impression that<br=
>
the build passed, when in fact there was a failure.<br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>much welcome</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt;</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
---<br>
<br>
In v3:<br>
<br>
=C2=A0- Just set -q flag once in common arg list<br>
<br>
=C2=A0docs/meson.build | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/docs/meson.build b/docs/meson.build<br>
index 300b134329..cffe1ecf1d 100644<br>
--- a/docs/meson.build<br>
+++ b/docs/meson.build<br>
@@ -9,7 +9,7 @@ endif<br>
=C2=A0# Check if tools are available to build documentation.<br>
=C2=A0build_docs =3D false<br>
=C2=A0if sphinx_build.found()<br>
-=C2=A0 SPHINX_ARGS =3D [&#39;env&#39;, &#39;CONFDIR=3D&#39; + qemu_confdir=
, sphinx_build]<br>
+=C2=A0 SPHINX_ARGS =3D [&#39;env&#39;, &#39;CONFDIR=3D&#39; + qemu_confdir=
, sphinx_build, &#39;-q&#39;]<br>
=C2=A0 =C2=A0# If we&#39;re making warnings fatal, apply this to Sphinx run=
s as well<br>
=C2=A0 =C2=A0if get_option(&#39;werror&#39;)<br>
=C2=A0 =C2=A0 =C2=A0SPHINX_ARGS +=3D [ &#39;-W&#39; ]<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000bad1605c95a615e--

