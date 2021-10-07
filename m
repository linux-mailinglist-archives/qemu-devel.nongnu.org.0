Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F55425DC5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:43:41 +0200 (CEST)
Received: from localhost ([::1]:58288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaEu-0006D9-9Q
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaCj-0003h8-AU
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaCh-0005QF-LX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id e12so22861093wra.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idblPIVjaiPxDXeTCVYxIziZM+g3JICadjIwL0eHqCk=;
 b=GqClCa74RbKayWAkPYSiA9/YEml1GFjwhl8sAjg5RIJQ6LZjlJFld0Mpyfrsuw3m8b
 Ka4CJnO8Ul9oRfNPRjWWX2KHr40h2aQfVpFSo+ddR1RsfxMid0SbLbj0AsCSC1jF+kr5
 ATzEcISEJNLA/RPPfiGdgsvkPVa5zcXbLYVBg41dUkmJue5bV2EQlv/3AmAdXANFdvP0
 ueP3K3OeqoqAUXu+vCurTxNoSSLMBdlLVFTfEe25+zUzaxQkO89WsiysFYDomHny8tfF
 9SacRM4gdyBMVJeJWUQmqtFbGVWvIbvWPmEhVjFMelJnJknTm0NuLmS4UN1Wes8R/5GY
 R1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idblPIVjaiPxDXeTCVYxIziZM+g3JICadjIwL0eHqCk=;
 b=0MAM6Yg9a2pbZm9Nzn61IyyaRiH0Q7HCiptvrR0SGmTqF75fXrlYSEZpfOVim/Lt3K
 CcyFYl9SNSHWeUelzKimevxpP7tuswGLnMB5CLorcAd9EpdQCYgOc2VCCtu6Pm+/NvkA
 7EZwzVXkz7QCNuaAyyG7XgpVMpfbo9QVYkDTth2MGKssxipYjo3zDVCPvNBMLITPkPQQ
 /9Z2n+TRK8cVl+938hKW4LA/orQHcb/c/VCDoqKtId31LHg+9ryG2eyy/AYzjwI2FAsj
 pyDDX+4L0KpfWSjqnxbOBirqUQBEi/o8jpuP28GkWX3us/a5CmYW+ZrTfjjfNviPYPhX
 4oMg==
X-Gm-Message-State: AOAM532SPXSALPaq9HTB9EMi+cEf9CBBO0mO+84rsiqp7jgQcYe/aWc0
 pUKg3GoxRYh0tJQTvBzeo6Ss3GcuCuU2KOIdLpvdSPpS
X-Google-Smtp-Source: ABdhPJwOliWi64ru2HU/jUGI4atM5v2NODPNt8MTr23PyFfKgYGsGUUngeCi2XeyVqmbN3MjsBUBp15m1UPqVa68jQI=
X-Received: by 2002:a05:600c:17ca:: with SMTP id
 y10mr18375926wmo.15.1633639282401; 
 Thu, 07 Oct 2021 13:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-17-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-17-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:10 +0400
Message-ID: <CAJ+F1C++QZ-a6N03HH6TORUpiuHdPxJGLWKz8xt5enH6bOc0nw@mail.gmail.com>
Subject: Re: [PATCH 22/24] configure: accept "internal" for
 --enable-capstone/slirp/fdt
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001e652d05cdc94923"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x431.google.com
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

--0000000000001e652d05cdc94923
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:25 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Options such as "--enable-capstone=3Dgit" do not make much sense when
> building
> from a tarball.  Accept "internal" for consistency with the meson options=
.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/configure b/configure
> index d00ba0cbd2..d2f754d5d1 100755
> --- a/configure
> +++ b/configure
> @@ -1019,7 +1019,7 @@ for opt do
>    ;;
>    --enable-slirp=3Dgit) slirp=3D"internal"
>    ;;
> -  --enable-slirp=3Dsystem) slirp=3D"system"
> +  --enable-slirp=3D*) slirp=3D"$optarg"
>    ;;
>    --disable-vde) vde=3D"disabled"
>    ;;
> @@ -1193,7 +1193,7 @@ for opt do
>    ;;
>    --enable-fdt=3Dgit) fdt=3D"internal"
>    ;;
> -  --enable-fdt=3Dsystem) fdt=3D"system"
> +  --enable-fdt=3D*) fdt=3D"$optarg"
>    ;;
>    --disable-linux-aio) linux_aio=3D"disabled"
>    ;;
> @@ -1479,7 +1479,7 @@ for opt do
>    ;;
>    --enable-capstone=3Dgit) capstone=3D"internal"
>    ;;
> -  --enable-capstone=3Dsystem) capstone=3D"system"
> +  --enable-capstone=3D*) capstone=3D"$optarg"
>    ;;
>    --with-git=3D*) git=3D"$optarg"
>    ;;
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001e652d05cdc94923
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:25 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Options such as &quot;--enable-capstone=3Dgit&quot; do not mak=
e much sense when building<br>
from a tarball.=C2=A0 Accept &quot;internal&quot; for consistency with the =
meson options.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index d00ba0cbd2..d2f754d5d1 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -1019,7 +1019,7 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-slirp=3Dgit) slirp=3D&quot;internal&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-slirp=3Dsystem) slirp=3D&quot;system&quot;<br>
+=C2=A0 --enable-slirp=3D*) slirp=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-vde) vde=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -1193,7 +1193,7 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-fdt=3Dgit) fdt=3D&quot;internal&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-fdt=3Dsystem) fdt=3D&quot;system&quot;<br>
+=C2=A0 --enable-fdt=3D*) fdt=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-linux-aio) linux_aio=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -1479,7 +1479,7 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-capstone=3Dgit) capstone=3D&quot;internal&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-capstone=3Dsystem) capstone=3D&quot;system&quot;<br>
+=C2=A0 --enable-capstone=3D*) capstone=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--with-git=3D*) git=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000001e652d05cdc94923--

