Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7BA508DB4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:50:20 +0200 (CEST)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDX1-0000R1-55
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhDJK-0001Hl-8a
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:36:10 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:36577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhDJF-0002JZ-Sy
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:36:09 -0400
Received: by mail-qt1-x831.google.com with SMTP id bb21so1366162qtb.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H5Srh2hCox1q5XOOtyiC9mg50HuShKCHuyksqdYlTUQ=;
 b=cQG2KTnaeNY9eXycNBgW9GIVpNVppH1qkMoUG32Vjfgpr62NFdDnYnrpBBF+QworK+
 2gfyThZruCrydxPw6UMqnp18MD0o9PGYMPgqKrWIM4vet5TiqRe+luvIXh6SZXswPC5V
 ZYUiVBTFXLipVtUa5qKgmiB4C9JKjaH3Ha3UwNQhRYHSfqVGeWJBFFYO5wUfc2MaHhNP
 aZXtX+xnbF9R0UMTRbXaKF3jHQtflUEOrUZYGqlNAUAfw7jNd5m2cicx5Xx4D5uOt4yR
 7cWP+DOG2rN0r/oJemeJ5spUkrMwVAI7vZAlv/lkjRIk6dsCKWETdWuaGXtcnmspz+NN
 48VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H5Srh2hCox1q5XOOtyiC9mg50HuShKCHuyksqdYlTUQ=;
 b=IbnP3GjwtJvRTXa5IqBkpqZnDsykNhwQhN39vNAYkN0VkrpwSC9yONCi2OqCkaKl1u
 aDHpBxmCgWKa8yCsyv2l2ZTVSRKreqyf3IOe4snKJ37Qjdo+vBZm6M6W8zJ3ok+Q2Q8b
 7xnt8LaHCvck64WUV1tOl8yjBru+s7cOf03DMzd0EcgYYyH8seVIvpgQ+o7OAPpxvk2d
 n7We+ij3rax9cybN3P7Ruu2IjAk9FokSNEFpaOtwfp/sem00TYY9bCiCaxAi+uZliBnt
 v3BGRfPXYP+NuqMZ0wbby7YX23bbyLoneJvfzhTbRntmUysokwPCSqC7vWe2wyKc46Dh
 SB0g==
X-Gm-Message-State: AOAM533A/22LwUn1LeBBnGRaXiV7S/rCOBae0muAghsumZBWD862LneA
 HONgttBQdm2dVTIlpeWABl1mbwl5wqOj6JNS1f0=
X-Google-Smtp-Source: ABdhPJwb+3pR2OnAjrUvRcWrx+THS8CBb37Bz5a4CfeVqqwCddHp/rorHMtzWP2e0khhu8NXFc3p/0Mx4ofXsI/ou2A=
X-Received: by 2002:ac8:5a41:0:b0:2f1:f30e:c07f with SMTP id
 o1-20020ac85a41000000b002f1f30ec07fmr14157646qta.112.1650472564905; Wed, 20
 Apr 2022 09:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-11-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-11-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 20:35:53 +0400
Message-ID: <CAJ+F1CLBQ53eVsNuGcJwsfHuFtVkcNYOFteZcs-tVTtGeS8zBg@mail.gmail.com>
Subject: Re: [PATCH 10/34] meson, configure: move usbfs test to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f15c1e05dd189609"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x831.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f15c1e05dd189609
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:46 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure   | 28 ----------------------------
>  meson.build | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 28 deletions(-)
>
> diff --git a/configure b/configure
> index 1c74d2c5f2..d4d7c001f6 100755
> --- a/configure
> +++ b/configure
> @@ -2160,31 +2160,6 @@ case "$fdt" in
>      ;;
>  esac
>
> -##########################################
> -# check for usbfs
> -have_usbfs=3Dno
> -if test "$linux_user" =3D "yes"; then
> -  cat > $TMPC << EOF
> -#include <linux/usbdevice_fs.h>
> -
> -#ifndef USBDEVFS_GET_CAPABILITIES
> -#error "USBDEVFS_GET_CAPABILITIES undefined"
> -#endif
> -
> -#ifndef USBDEVFS_DISCONNECT_CLAIM
> -#error "USBDEVFS_DISCONNECT_CLAIM undefined"
> -#endif
> -
> -int main(void)
> -{
> -    return 0;
> -}
> -EOF
> -  if compile_prog "" ""; then
> -    have_usbfs=3Dyes
> -  fi
> -fi
> -
>  ##########################################
>  # capstone
>
> @@ -2641,9 +2616,6 @@ fi
>  if test "$module_upgrades" =3D "yes"; then
>    echo "CONFIG_MODULE_UPGRADES=3Dy" >> $config_host_mak
>  fi
> -if test "$have_usbfs" =3D "yes" ; then
> -  echo "CONFIG_USBFS=3Dy" >> $config_host_mak
> -fi
>  if test "$gio" =3D "yes" ; then
>      echo "CONFIG_GIO=3Dy" >> $config_host_mak
>      echo "GIO_CFLAGS=3D$gio_cflags" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index 066bb69174..c0b2838d2e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1938,6 +1938,19 @@ config_host_data.set('CONFIG_GETAUXVAL',
> cc.links(gnu_source_prefix + '''
>      return getauxval(AT_HWCAP) =3D=3D 0;
>    }'''))
>
> +config_host_data.set('CONFIG_USBFS', have_linux_user and cc.compiles('''
> +  #include <linux/usbdevice_fs.h>
> +
> +  #ifndef USBDEVFS_GET_CAPABILITIES
> +  #error "USBDEVFS_GET_CAPABILITIES undefined"
> +  #endif
> +
> +  #ifndef USBDEVFS_DISCONNECT_CLAIM
> +  #error "USBDEVFS_DISCONNECT_CLAIM undefined"
> +  #endif
> +
> +  int main(void) { return 0; }'''))
>


We could use cc.has_header_symbol(). Alternatively, drop the symbol checks?
They were added in Linux 3.6... (commit
0837e7e5270bd5547ba5763f11611dc43f677b3d &
19181bc50e1b8e92a7a3b3d78637c6dc5c0b5a1b)


> +
>  have_keyring =3D get_option('keyring') \
>    .require(targetos =3D=3D 'linux', error_message: 'keyring is only avai=
lable
> on Linux') \
>    .require(cc.compiles('''
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f15c1e05dd189609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:46 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0| 28 ----------------------------<br>
=C2=A0meson.build | 13 +++++++++++++<br>
=C2=A02 files changed, 13 insertions(+), 28 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 1c74d2c5f2..d4d7c001f6 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2160,31 +2160,6 @@ case &quot;$fdt&quot; in<br>
=C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0esac<br>
<br>
-##########################################<br>
-# check for usbfs<br>
-have_usbfs=3Dno<br>
-if test &quot;$linux_user&quot; =3D &quot;yes&quot;; then<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;linux/usbdevice_fs.h&gt;<br>
-<br>
-#ifndef USBDEVFS_GET_CAPABILITIES<br>
-#error &quot;USBDEVFS_GET_CAPABILITIES undefined&quot;<br>
-#endif<br>
-<br>
-#ifndef USBDEVFS_DISCONNECT_CLAIM<br>
-#error &quot;USBDEVFS_DISCONNECT_CLAIM undefined&quot;<br>
-#endif<br>
-<br>
-int main(void)<br>
-{<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-EOF<br>
-=C2=A0 if compile_prog &quot;&quot; &quot;&quot;; then<br>
-=C2=A0 =C2=A0 have_usbfs=3Dyes<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# capstone<br>
<br>
@@ -2641,9 +2616,6 @@ fi<br>
=C2=A0if test &quot;$module_upgrades&quot; =3D &quot;yes&quot;; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_MODULE_UPGRADES=3Dy&quot; &gt;&gt; $config_h=
ost_mak<br>
=C2=A0fi<br>
-if test &quot;$have_usbfs&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_USBFS=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
=C2=A0if test &quot;$gio&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;CONFIG_GIO=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;GIO_CFLAGS=3D$gio_cflags&quot; &gt;&gt; $con=
fig_host_mak<br>
diff --git a/meson.build b/meson.build<br>
index 066bb69174..c0b2838d2e 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1938,6 +1938,19 @@ config_host_data.set(&#39;CONFIG_GETAUXVAL&#39;, cc.=
links(gnu_source_prefix + &#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0return getauxval(AT_HWCAP) =3D=3D 0;<br>
=C2=A0 =C2=A0}&#39;&#39;&#39;))<br>
<br>
+config_host_data.set(&#39;CONFIG_USBFS&#39;, have_linux_user and cc.compil=
es(&#39;&#39;&#39;<br>
+=C2=A0 #include &lt;linux/usbdevice_fs.h&gt;<br>
+<br>
+=C2=A0 #ifndef USBDEVFS_GET_CAPABILITIES<br>
+=C2=A0 #error &quot;USBDEVFS_GET_CAPABILITIES undefined&quot;<br>
+=C2=A0 #endif<br>
+<br>
+=C2=A0 #ifndef USBDEVFS_DISCONNECT_CLAIM<br>
+=C2=A0 #error &quot;USBDEVFS_DISCONNECT_CLAIM undefined&quot;<br>
+=C2=A0 #endif<br>
+<br>
+=C2=A0 int main(void) { return 0; }&#39;&#39;&#39;))<br></blockquote><div>=
<br></div><div><br></div><div>We could use cc.has_header_symbol(). Alternat=
ively, drop the symbol checks? They were added in Linux 3.6... (commit 0837=
e7e5270bd5547ba5763f11611dc43f677b3d &amp; 19181bc50e1b8e92a7a3b3d78637c6dc=
5c0b5a1b)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+<br>
=C2=A0have_keyring =3D get_option(&#39;keyring&#39;) \<br>
=C2=A0 =C2=A0.require(targetos =3D=3D &#39;linux&#39;, error_message: &#39;=
keyring is only available on Linux&#39;) \<br>
=C2=A0 =C2=A0.require(cc.compiles(&#39;&#39;&#39;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f15c1e05dd189609--

