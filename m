Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B72DCF85
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:32:48 +0100 (CET)
Received: from localhost ([::1]:49648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqaV-00013r-9o
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpqYx-0000Xb-Ty
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:31:11 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpqYs-0000Gs-Jn
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:31:10 -0500
Received: by mail-ej1-x62a.google.com with SMTP id lt17so37119535ejb.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 02:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SvPRDfWVsoXssuOAIwPTbzDq4LOw2aUKY9vd6OQd7bc=;
 b=G2SDzxSkbrit/RUpc9t6JvC4Sy8E1Ya0JuZ7sAXNn7ukXCtwI3JgfXrA092NvJMyTY
 P3VLUlUD6M5jzJiSVR47M2BHEvdeAmyXxktE/jJCPdGNzDzlVapogmUozBcJC732nTl7
 xc+OKfTOSoJWKxEFTAv7GOj+Dwjm9/cCg1vAcxlw6rtrzxG58EWGglAbwukWXV1xEE7q
 GtCsNnKUALeKhi5ZecjfodlnynxQ/WZlQUyx0tSvzHdM3nbYvJyukJ0GufCvDutr33tw
 wELJJEqna8lpZ/3FWQnYw338E8wTXeg3rTkqekZPdqrKfCeNEQnGHzVPdZJTGa8bzaFB
 ZInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SvPRDfWVsoXssuOAIwPTbzDq4LOw2aUKY9vd6OQd7bc=;
 b=OikVWh2foJhANT9mQB2iIEzIuAT4MGIro98WexHTXT5ADQh38Vsr+eimrDju+hZFfu
 paBq6Yk0oOjjresD+6Sv8m0CwOW5pxfEULuSiVeoa5jWpWsHezTMDViW/Qmml6Uomh85
 Ss93rF8jqzaZ7ra2xy6JWqkvLVn91lvSanL0Bkin5xcGhKikkOjiNQPcS+edUS2hl4nB
 uDSKmcdKTQo4141S7iMuvq7W7w97bdrGKJLuIxzv0GllYyWBvsVl7ob9xr6bw2yBW/5k
 x8CwqSO5blhqAbq1hT+QlCNDtoqJrMbVs0ZFIJLvYbqzhJWOLeLlaKERbp4CSmb5jiYF
 S7eA==
X-Gm-Message-State: AOAM531RCyqmIdt6bEOfs3VTsqiVWd9U73mC1YeSuRtLxH4PLQsHuvrU
 sJV/h3VMhxb6wdpudqI9ESFkhaiEjZaWU/30SVA=
X-Google-Smtp-Source: ABdhPJzAveOJ+uT2/KG39w1eAaTT5Ts1BVMa8wuU0m3sLL0TSD5RwlF4Yx11J9KKqHo0vkpZWlapigDRchIVlMrYwpk=
X-Received: by 2002:a17:906:30d2:: with SMTP id
 b18mr34330040ejb.109.1608201063584; 
 Thu, 17 Dec 2020 02:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20201217085005.10644-1-pbonzini@redhat.com>
 <20201217085005.10644-5-pbonzini@redhat.com>
In-Reply-To: <20201217085005.10644-5-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 17 Dec 2020 14:30:51 +0400
Message-ID: <CAJ+F1CK-gP_Cc_+TVXipAKRsFtD=KBCykh9w70uDhUj_9Y_vKw@mail.gmail.com>
Subject: Re: [PATCH 4/4] configure: remove CONFIG_FILEVERSION and
 CONFIG_PRODUCTVERSION
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001f570b05b6a67d49"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62a.google.com
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

--0000000000001f570b05b6a67d49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:50 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> version.rc can just use existing preprocessor symbols.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure  | 9 ---------
>  version.rc | 4 ++--
>  2 files changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/configure b/configure
> index 568818e72d..74eebfd692 100755
> --- a/configure
> +++ b/configure
> @@ -5929,15 +5929,6 @@ if test "$bigendian" =3D "yes" ; then
>  fi
>  if test "$mingw32" =3D "yes" ; then
>    echo "CONFIG_WIN32=3Dy" >> $config_host_mak
> -  rc_version=3D$(cat $source_path/VERSION)
> -  version_major=3D${rc_version%%.*}
> -  rc_version=3D${rc_version#*.}
> -  version_minor=3D${rc_version%%.*}
> -  rc_version=3D${rc_version#*.}
> -  version_subminor=3D${rc_version%%.*}
> -  version_micro=3D0
> -  echo
> "CONFIG_FILEVERSION=3D$version_major,$version_minor,$version_subminor,$ve=
rsion_micro"
> >> $config_host_mak
> -  echo
> "CONFIG_PRODUCTVERSION=3D$version_major,$version_minor,$version_subminor,=
$version_micro"
> >> $config_host_mak
>    if test "$guest_agent_with_vss" =3D "yes" ; then
>      echo "CONFIG_QGA_VSS=3Dy" >> $config_host_mak
>      echo "QGA_VSS_PROVIDER=3D$qga_vss_provider" >> $config_host_mak
> diff --git a/version.rc b/version.rc
> index d8e1569991..0daadbf981 100644
> --- a/version.rc
> +++ b/version.rc
> @@ -2,8 +2,8 @@
>  #include "config-host.h"
>
>  VS_VERSION_INFO VERSIONINFO
> -FILEVERSION CONFIG_FILEVERSION
> -PRODUCTVERSION CONFIG_PRODUCTVERSION
> +FILEVERSION QEMU_VERSION_MAJOR,QEMU_VERSION_MINOR,QEMU_VERSION_MICRO,0
> +PRODUCTVERSION QEMU_VERSION_MAJOR,QEMU_VERSION_MINOR,QEMU_VERSION_MICRO,=
0
>  FILEFLAGSMASK VS_FFI_FILEFLAGSMASK
>  FILEOS VOS_NT_WINDOWS32
>  FILETYPE VFT_APP
> --
> 2.29.2
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001f570b05b6a67d49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 12:50 PM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">ver=
sion.rc can just use existing preprocessor symbols.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 | 9 ---------<br>
=C2=A0version.rc | 4 ++--<br>
=C2=A02 files changed, 2 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 568818e72d..74eebfd692 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -5929,15 +5929,6 @@ if test &quot;$bigendian&quot; =3D &quot;yes&quot; ;=
 then<br>
=C2=A0fi<br>
=C2=A0if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_WIN32=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-=C2=A0 rc_version=3D$(cat $source_path/VERSION)<br>
-=C2=A0 version_major=3D${rc_version%%.*}<br>
-=C2=A0 rc_version=3D${rc_version#*.}<br>
-=C2=A0 version_minor=3D${rc_version%%.*}<br>
-=C2=A0 rc_version=3D${rc_version#*.}<br>
-=C2=A0 version_subminor=3D${rc_version%%.*}<br>
-=C2=A0 version_micro=3D0<br>
-=C2=A0 echo &quot;CONFIG_FILEVERSION=3D$version_major,$version_minor,$vers=
ion_subminor,$version_micro&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;CONFIG_PRODUCTVERSION=3D$version_major,$version_minor,$v=
ersion_subminor,$version_micro&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0if test &quot;$guest_agent_with_vss&quot; =3D &quot;yes&quot; =
; then<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;CONFIG_QGA_VSS=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;QGA_VSS_PROVIDER=3D$qga_vss_provider&quot; &=
gt;&gt; $config_host_mak<br>
diff --git a/version.rc b/version.rc<br>
index d8e1569991..0daadbf981 100644<br>
--- a/version.rc<br>
+++ b/version.rc<br>
@@ -2,8 +2,8 @@<br>
=C2=A0#include &quot;config-host.h&quot;<br>
<br>
=C2=A0VS_VERSION_INFO VERSIONINFO<br>
-FILEVERSION CONFIG_FILEVERSION<br>
-PRODUCTVERSION CONFIG_PRODUCTVERSION<br>
+FILEVERSION QEMU_VERSION_MAJOR,QEMU_VERSION_MINOR,QEMU_VERSION_MICRO,0<br>
+PRODUCTVERSION QEMU_VERSION_MAJOR,QEMU_VERSION_MINOR,QEMU_VERSION_MICRO,0<=
br>
=C2=A0FILEFLAGSMASK VS_FFI_FILEFLAGSMASK<br>
=C2=A0FILEOS VOS_NT_WINDOWS32<br>
=C2=A0FILETYPE VFT_APP<br>
-- <br>
2.29.2<br>
</blockquote></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Ma=
rc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001f570b05b6a67d49--

