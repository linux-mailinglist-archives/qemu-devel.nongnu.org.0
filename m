Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1948382A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 22:01:56 +0100 (CET)
Received: from localhost ([::1]:47690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4USp-0003P1-UX
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 16:01:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n4UQC-0008Sn-Ej
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:59:12 -0500
Received: from [2607:f8b0:4864:20::936] (port=44897
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n4UQA-00037s-H0
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:59:12 -0500
Received: by mail-ua1-x936.google.com with SMTP id e19so13855693uaa.11
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 12:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8RupxwKib+TUcDyw2uYQkc6dgyVxq/udEaEcZpPHUDE=;
 b=jcw5urnyjxHKf8aF8tRWNLaBw2PLljMXRzYftw3vLZIFeJFsyG5hqfmB31rfjTrKPT
 +wRoHqKXT2G+qeRg+bgZT7/chvZllwq56UuETvBk0B1boBVaEQ/+LlKQN5HzyElyGlct
 WMyEdJfKQ7tnrwyV+U944aNPc+RlvA+2jbMw1eFCKGp6bv0weV5E39g+1Dj7718mScCn
 Odra0fvhSA8OEc4XOIZwYn+e0r3DzOwmXYXPZeNZ3QZFIzTM30URDLrHAusey9UGjQ3R
 W7AA0HJ2TLWgBhRQIIMslmpIS9wkNgr6KAY0e+emUC8uelNUwRVgnzXMzoBHxRREkDkm
 g+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8RupxwKib+TUcDyw2uYQkc6dgyVxq/udEaEcZpPHUDE=;
 b=znEaFpObHKzMMuioBlpe+IV5izQRbN4H6dSj+hLZWvdqQQBDuFBNysw0javFL3Fwj/
 ShR5FZ8urfOMr88I2qjDj8qLkroa+OneDbeiJ1zWDGK77ehbptg1SBq6w82MtkH8A2nb
 lFwZMFEpQocOSz12VhR71dRyGmZu+Y43GKPyu7ctdrs3h7Bq8MxlPQPDPhx1xs2Rl/pU
 /XHTaX0S3Iys0DDtN1+LzuDuMyzZ89TQjnxh1fuPuit9h8f9BNCGpBlcRF/Jr7FffBwp
 EY0Nu4lVop3oIWkCnM/e3uUOePyBTmmW9aBy3tX9XhHSZaVujLpqnuG5jVLvvZ84wv76
 VfUw==
X-Gm-Message-State: AOAM530g0++LD3nHtau7bjVESXAF9QI+bxMsjLmYuopMt+NLzHBs+Mti
 TUK5ZkoAv0VsH/x5AbfAwK3S/wvb7492l9TTGcCbwA==
X-Google-Smtp-Source: ABdhPJxs3OHRJ0LXljhPZc0Y4BUsZYeeWud36IewvSC1GJrXpyP8uFncBLztoEJBUdlqhQD0OcdN7d3gmegcAg+zHWE=
X-Received: by 2002:ab0:13c3:: with SMTP id n3mr12681144uae.39.1641243549558; 
 Mon, 03 Jan 2022 12:59:09 -0800 (PST)
MIME-Version: 1.0
References: <YdNgg/FI6LdYmDJ5@humpty.home.comstyle.com>
 <ca12e6d4-f439-4ee7-b4b2-6e72bd4922db@amsat.org>
In-Reply-To: <ca12e6d4-f439-4ee7-b4b2-6e72bd4922db@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 3 Jan 2022 13:58:58 -0700
Message-ID: <CANCZdfruxF_pauLHjn6Jz0MqD_qkwxouUb7oZWUhuydow6qYVQ@mail.gmail.com>
Subject: Re: [PATCH] FreeBSD: Upgrade to 12.3 release
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000c2fd2305d4b3cade"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Alex Benn_e <alex.bennee@linaro.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c2fd2305d4b3cade
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 3, 2022 at 1:57 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> On 3/1/22 21:45, Brad Smith wrote:
> > FreeBSD: Upgrade to 12.3 release
>
> Maybe some mention like:
>
> '''
> Note, since libasn1 got fixed in 12.3 [*], this commit re-enables GNUTLS.
>
> [*]
> https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> '''
>

Agreed.


> > Signed-off-by: Brad Smith <brad@comstyle.com>
> > Tested-by: Thomas Huth <thuth@redhat.com>
> > ---
> >   .gitlab-ci.d/cirrus.yml | 5 +----
> >   tests/vm/freebsd        | 8 +++-----
> >   2 files changed, 4 insertions(+), 9 deletions(-)
> >
> > diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> > index d273a9e713..18ded37c77 100644
> > --- a/.gitlab-ci.d/cirrus.yml
> > +++ b/.gitlab-ci.d/cirrus.yml
> > @@ -52,14 +52,11 @@ x64-freebsd-12-build:
> >       NAME: freebsd-12
> >       CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
> >       CIRRUS_VM_IMAGE_SELECTOR: image_family
> > -    CIRRUS_VM_IMAGE_NAME: freebsd-12-2
> > +    CIRRUS_VM_IMAGE_NAME: freebsd-12-3
> >       CIRRUS_VM_CPUS: 8
> >       CIRRUS_VM_RAM: 8G
> >       UPDATE_COMMAND: pkg update
> >       INSTALL_COMMAND: pkg install -y
> > -    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> > -    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> > -    CONFIGURE_ARGS: --disable-gnutls
> >       TEST_TARGETS: check
> >
> >   x64-freebsd-13-build:
> > diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> > index 6e20e84322..805db759d6 100755
> > --- a/tests/vm/freebsd
> > +++ b/tests/vm/freebsd
> > @@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):
> >       name =3D "freebsd"
> >       arch =3D "x86_64"
> >   https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> > -    link =3D "
> https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.2/FreeBSD-12.2-RE=
LEASE-amd64-disc1.iso.xz
> "
> > -    csum =3D
> "a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd070278cbdf63f3a6f803ecae"
> > +    link =3D "
> https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RE=
LEASE-amd64-disc1.iso.xz
> "
> > +    csum =3D
> "36dd0de50f1fe5f0a88e181e94657656de26fb64254412f74e80e128e8b938b4"
> >       size =3D "20G"
> >       pkgs =3D [
> >           # build tools
> > @@ -65,8 +65,6 @@ class FreeBSDVM(basevm.BaseVM):
> >           "zstd",
> >       ]
> >
> > -    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> > -    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> >       BUILD_SCRIPT =3D """
> >           set -e;
> >           rm -rf /home/qemu/qemu-test.*
> > @@ -74,7 +72,7 @@ class FreeBSDVM(basevm.BaseVM):
> >           mkdir src build; cd src;
> >           tar -xf /dev/vtbd1;
> >           cd ../build
> > -        ../src/configure --python=3Dpython3.7 --disable-gnutls
> {configure_opts};
> > +        ../src/configure --python=3Dpython3.7 {configure_opts};
> >           gmake --output-sync -j{jobs} {target} {verbose};
> >       """
> >
>
>
>

--000000000000c2fd2305d4b3cade
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 3, 2022 at 1:57 PM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 3/1/22 21:45, Brad Smith wrote:<br>
&gt; FreeBSD: Upgrade to 12.3 release<br>
<br>
Maybe some mention like:<br>
<br>
&#39;&#39;&#39;<br>
Note, since libasn1 got fixed in 12.3 [*], this commit re-enables GNUTLS.<b=
r>
<br>
[*]<br>
<a href=3D"https://gitlab.com/gnutls/libtasn1/-/merge_requests/71" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/gnutls/libtasn1/-/merge_req=
uests/71</a><br>
&#39;&#39;&#39;<br></blockquote><div><br></div><div>Agreed.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Signed-off-by: Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com" tar=
get=3D"_blank">brad@comstyle.com</a>&gt;<br>
&gt; Tested-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.gitlab-ci.d/cirrus.yml | 5 +----<br>
&gt;=C2=A0 =C2=A0tests/vm/freebsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 +++-----<b=
r>
&gt;=C2=A0 =C2=A02 files changed, 4 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml<br>
&gt; index d273a9e713..18ded37c77 100644<br>
&gt; --- a/.gitlab-ci.d/cirrus.yml<br>
&gt; +++ b/.gitlab-ci.d/cirrus.yml<br>
&gt; @@ -52,14 +52,11 @@ x64-freebsd-12-build:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NAME: freebsd-12<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CIRRUS_VM_INSTANCE_TYPE: freebsd_instance<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CIRRUS_VM_IMAGE_SELECTOR: image_family<br>
&gt; -=C2=A0 =C2=A0 CIRRUS_VM_IMAGE_NAME: freebsd-12-2<br>
&gt; +=C2=A0 =C2=A0 CIRRUS_VM_IMAGE_NAME: freebsd-12-3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CIRRUS_VM_CPUS: 8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CIRRUS_VM_RAM: 8G<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0UPDATE_COMMAND: pkg update<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALL_COMMAND: pkg install -y<br>
&gt; -=C2=A0 =C2=A0 # TODO: Enable gnutls again once FreeBSD&#39;s libtasn1=
 got fixed<br>
&gt; -=C2=A0 =C2=A0 # See: <a href=3D"https://gitlab.com/gnutls/libtasn1/-/=
merge_requests/71" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/=
gnutls/libtasn1/-/merge_requests/71</a><br>
&gt; -=C2=A0 =C2=A0 CONFIGURE_ARGS: --disable-gnutls<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST_TARGETS: check<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0x64-freebsd-13-build:<br>
&gt; diff --git a/tests/vm/freebsd b/tests/vm/freebsd<br>
&gt; index 6e20e84322..805db759d6 100755<br>
&gt; --- a/tests/vm/freebsd<br>
&gt; +++ b/tests/vm/freebsd<br>
&gt; @@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D &quot;freebsd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0arch =3D &quot;x86_64&quot;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/gnutls/libtasn1/-/merge_requ=
ests/71" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/gnutls/lib=
tasn1/-/merge_requests/71</a><br>
&gt; -=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://download.freebsd.org/=
ftp/releases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz" rel=
=3D"noreferrer" target=3D"_blank">https://download.freebsd.org/ftp/releases=
/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz</a>&quot;<br>
&gt; -=C2=A0 =C2=A0 csum =3D &quot;a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd=
070278cbdf63f3a6f803ecae&quot;<br>
&gt; +=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://download.freebsd.org/=
ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz" rel=
=3D"noreferrer" target=3D"_blank">https://download.freebsd.org/ftp/releases=
/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz</a>&quot;<br>
&gt; +=C2=A0 =C2=A0 csum =3D &quot;36dd0de50f1fe5f0a88e181e94657656de26fb64=
254412f74e80e128e8b938b4&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D &quot;20G&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pkgs =3D [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build tools<br>
&gt; @@ -65,8 +65,6 @@ class FreeBSDVM(basevm.BaseVM):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;zstd&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 # TODO: Enable gnutls again once FreeBSD&#39;s libtasn1=
 got fixed<br>
&gt; -=C2=A0 =C2=A0 # See: <a href=3D"https://gitlab.com/gnutls/libtasn1/-/=
merge_requests/71" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/=
gnutls/libtasn1/-/merge_requests/71</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_SCRIPT =3D &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set -e;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf /home/qemu/qemu-test.*<=
br>
&gt; @@ -74,7 +72,7 @@ class FreeBSDVM(basevm.BaseVM):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir src build; cd src;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -xf /dev/vtbd1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ../build<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../src/configure --python=3Dpython3.7 --d=
isable-gnutls {configure_opts};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../src/configure --python=3Dpython3.7 {co=
nfigure_opts};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gmake --output-sync -j{jobs} {=
target} {verbose};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
<br>
<br>
</blockquote></div></div>

--000000000000c2fd2305d4b3cade--

