Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B8E483826
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 21:59:48 +0100 (CET)
Received: from localhost ([::1]:43250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4UQl-0000Ii-QM
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 15:59:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n4UPi-0007No-FZ
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:58:42 -0500
Received: from [2607:f8b0:4864:20::931] (port=35785
 helo=mail-ua1-x931.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n4UPg-00034B-Eo
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:58:42 -0500
Received: by mail-ua1-x931.google.com with SMTP id v14so42108589uau.2
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 12:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XyKH1cBYno8BAEAbNxbch7E1AZASLfOLfz0PRtVm8j0=;
 b=Ww5IzTW7REiyEh3SzkG2PH1mcgoI7yhAICiEWZqo3In29mwh1y7s0Wk5gb7F69WyqW
 SHMnoVglnM/4ZraekLbk4c3FUx43tSpJCnbYxUknFfqJg1jBm3Mhpf5ZzNdZH7d/+DYS
 VkHpRHQHwoybmDZ4IGYuFOwcCSv5TVn1ULkZ6ykHDKiqOacA/QbteCajnv0b8K139Ye+
 /dA8IINtEDqCLdGn3OtJEsxn1DzA4sNTz8KG9ehR84s0SAl0vXi2a7y3azVrPTj+L5sF
 5gPzX/Jy6AElMaNXlQihP1JVn5J65ClMrNxpnsn9GQ6IRmeNksWlHiHFbXX0czZ3KeFX
 pdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XyKH1cBYno8BAEAbNxbch7E1AZASLfOLfz0PRtVm8j0=;
 b=06uZcdL/47on+Ts9ykPizN9xPaQEtR2C9LW7Qdp8wFUdb0IKPNX5bnFjCpkEhXxQ1E
 xFrRA2w9yFAPB5KhN+xEbJnH634f16EigpUd4XE37712TSmIvbOCDZShcpCVGbw04daF
 I5sr4XUtmkVzZVYX/NCxcWPTIfTKqIs1L3c8zKvnF7LEXha5J0wSbv18O2ZKHD0gOmro
 CTHa4fXLu1qe+tjxEqSSpbQFjA5r5lWZ/1vpBU3GqwBe7ZOiYhRM0uVd67aE8APPMWLr
 fBz/HoGOH9FydZjta4qxeTyzW5yGX3R456D+3rvZJJps2DoB1LKz/056PYYOwA7sbAyz
 yutQ==
X-Gm-Message-State: AOAM5322/noQ7uxIG9nM9yxTHaaDriLB4p0THFiLyK0rHzUbne3jGFKZ
 J6mLgURRqvU9PsLW4uWxmBErfc2WaP85p794y3Q5ITwDzOo=
X-Google-Smtp-Source: ABdhPJweV6ZbQSzK83yq3T3BiuG+V20r+tNAmCGJjbCRIc6A6b39i3WsPD4fcTP8uAAJA80yiQb7NA5DkVYdJTkwJd0=
X-Received: by 2002:a67:f8cb:: with SMTP id c11mr14306337vsp.13.1641243518923; 
 Mon, 03 Jan 2022 12:58:38 -0800 (PST)
MIME-Version: 1.0
References: <YdNgg/FI6LdYmDJ5@humpty.home.comstyle.com>
In-Reply-To: <YdNgg/FI6LdYmDJ5@humpty.home.comstyle.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 3 Jan 2022 13:58:28 -0700
Message-ID: <CANCZdfr6pU+xc+Luw0CQ5oC+JU8LYPihY-3u3vkT_rqwXOqydA@mail.gmail.com>
Subject: Re: [PATCH] FreeBSD: Upgrade to 12.3 release
To: Brad Smith <brad@comstyle.com>
Content-Type: multipart/alternative; boundary="000000000000ef89a505d4b3c857"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::931
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::931;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: WainerdosSantosMoschetta@humpty.home.comstyle.com,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Alex Benn_e <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ef89a505d4b3c857
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 3, 2022 at 1:47 PM Brad Smith <brad@comstyle.com> wrote:

> FreeBSD: Upgrade to 12.3 release
>
> Signed-off-by: Brad Smith <brad@comstyle.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/cirrus.yml | 5 +----
>  tests/vm/freebsd        | 8 +++-----
>  2 files changed, 4 insertions(+), 9 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index d273a9e713..18ded37c77 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -52,14 +52,11 @@ x64-freebsd-12-build:
>      NAME: freebsd-12
>      CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
>      CIRRUS_VM_IMAGE_SELECTOR: image_family
> -    CIRRUS_VM_IMAGE_NAME: freebsd-12-2
> +    CIRRUS_VM_IMAGE_NAME: freebsd-12-3
>      CIRRUS_VM_CPUS: 8
>      CIRRUS_VM_RAM: 8G
>      UPDATE_COMMAND: pkg update
>      INSTALL_COMMAND: pkg install -y
> -    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> -    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> -    CONFIGURE_ARGS: --disable-gnutls
>      TEST_TARGETS: check
>
>  x64-freebsd-13-build:
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 6e20e84322..805db759d6 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):
>      name = "freebsd"
>      arch = "x86_64"
>
> -    link = "
> https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz
> "
> -    csum =
> "a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd070278cbdf63f3a6f803ecae"
> +    link = "
> https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz
> "
> +    csum =
> "36dd0de50f1fe5f0a88e181e94657656de26fb64254412f74e80e128e8b938b4"
>      size = "20G"
>      pkgs = [
>          # build tools
> @@ -65,8 +65,6 @@ class FreeBSDVM(basevm.BaseVM):
>          "zstd",
>      ]
>
> -    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> -    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
>      BUILD_SCRIPT = """
>          set -e;
>          rm -rf /home/qemu/qemu-test.*
> @@ -74,7 +72,7 @@ class FreeBSDVM(basevm.BaseVM):
>          mkdir src build; cd src;
>          tar -xf /dev/vtbd1;
>          cd ../build
> -        ../src/configure --python=python3.7 --disable-gnutls
> {configure_opts};
> +        ../src/configure --python=python3.7 {configure_opts};
>          gmake --output-sync -j{jobs} {target} {verbose};
>      """
>
> --
> 2.34.1
>
>
>

--000000000000ef89a505d4b3c857
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 3, 2022 at 1:47 PM Brad S=
mith &lt;<a href=3D"mailto:brad@comstyle.com">brad@comstyle.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">FreeBSD: Upg=
rade to 12.3 release<br>
<br>
Signed-off-by: Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com" target=
=3D"_blank">brad@comstyle.com</a>&gt;<br>
Tested-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_b=
lank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0.gitlab-ci.d/cirrus.yml | 5 +----<br>
=C2=A0tests/vm/freebsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 +++-----<br>
=C2=A02 files changed, 4 insertions(+), 9 deletions(-)<br></blockquote><div=
><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml<br>
index d273a9e713..18ded37c77 100644<br>
--- a/.gitlab-ci.d/cirrus.yml<br>
+++ b/.gitlab-ci.d/cirrus.yml<br>
@@ -52,14 +52,11 @@ x64-freebsd-12-build:<br>
=C2=A0 =C2=A0 =C2=A0NAME: freebsd-12<br>
=C2=A0 =C2=A0 =C2=A0CIRRUS_VM_INSTANCE_TYPE: freebsd_instance<br>
=C2=A0 =C2=A0 =C2=A0CIRRUS_VM_IMAGE_SELECTOR: image_family<br>
-=C2=A0 =C2=A0 CIRRUS_VM_IMAGE_NAME: freebsd-12-2<br>
+=C2=A0 =C2=A0 CIRRUS_VM_IMAGE_NAME: freebsd-12-3<br>
=C2=A0 =C2=A0 =C2=A0CIRRUS_VM_CPUS: 8<br>
=C2=A0 =C2=A0 =C2=A0CIRRUS_VM_RAM: 8G<br>
=C2=A0 =C2=A0 =C2=A0UPDATE_COMMAND: pkg update<br>
=C2=A0 =C2=A0 =C2=A0INSTALL_COMMAND: pkg install -y<br>
-=C2=A0 =C2=A0 # TODO: Enable gnutls again once FreeBSD&#39;s libtasn1 got =
fixed<br>
-=C2=A0 =C2=A0 # See: <a href=3D"https://gitlab.com/gnutls/libtasn1/-/merge=
_requests/71" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/gnutl=
s/libtasn1/-/merge_requests/71</a><br>
-=C2=A0 =C2=A0 CONFIGURE_ARGS: --disable-gnutls<br>
=C2=A0 =C2=A0 =C2=A0TEST_TARGETS: check<br>
<br>
=C2=A0x64-freebsd-13-build:<br>
diff --git a/tests/vm/freebsd b/tests/vm/freebsd<br>
index 6e20e84322..805db759d6 100755<br>
--- a/tests/vm/freebsd<br>
+++ b/tests/vm/freebsd<br>
@@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0name =3D &quot;freebsd&quot;<br>
=C2=A0 =C2=A0 =C2=A0arch =3D &quot;x86_64&quot;<br>
<br>
-=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://download.freebsd.org/ftp/r=
eleases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz" rel=3D"nor=
eferrer" target=3D"_blank">https://download.freebsd.org/ftp/releases/ISO-IM=
AGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz</a>&quot;<br>
-=C2=A0 =C2=A0 csum =3D &quot;a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd07027=
8cbdf63f3a6f803ecae&quot;<br>
+=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://download.freebsd.org/ftp/r=
eleases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz" rel=3D"nor=
eferrer" target=3D"_blank">https://download.freebsd.org/ftp/releases/ISO-IM=
AGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz</a>&quot;<br>
+=C2=A0 =C2=A0 csum =3D &quot;36dd0de50f1fe5f0a88e181e94657656de26fb6425441=
2f74e80e128e8b938b4&quot;<br>
=C2=A0 =C2=A0 =C2=A0size =3D &quot;20G&quot;<br>
=C2=A0 =C2=A0 =C2=A0pkgs =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build tools<br>
@@ -65,8 +65,6 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;zstd&quot;,<br>
=C2=A0 =C2=A0 =C2=A0]<br>
<br>
-=C2=A0 =C2=A0 # TODO: Enable gnutls again once FreeBSD&#39;s libtasn1 got =
fixed<br>
-=C2=A0 =C2=A0 # See: <a href=3D"https://gitlab.com/gnutls/libtasn1/-/merge=
_requests/71" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/gnutl=
s/libtasn1/-/merge_requests/71</a><br>
=C2=A0 =C2=A0 =C2=A0BUILD_SCRIPT =3D &quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set -e;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf /home/qemu/qemu-test.*<br>
@@ -74,7 +72,7 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir src build; cd src;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -xf /dev/vtbd1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ../build<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../src/configure --python=3Dpython3.7 --disabl=
e-gnutls {configure_opts};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../src/configure --python=3Dpython3.7 {configu=
re_opts};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gmake --output-sync -j{jobs} {target} {ve=
rbose};<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000ef89a505d4b3c857--

