Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484BB496137
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 15:39:03 +0100 (CET)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAv49-0000Vh-F5
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 09:39:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nAuwe-0006G1-1f
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 09:31:16 -0500
Received: from [2607:f8b0:4864:20::a36] (port=38588
 helo=mail-vk1-xa36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nAuwX-0007PV-7Q
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 09:31:11 -0500
Received: by mail-vk1-xa36.google.com with SMTP id l196so2765976vki.5
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 06:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wGaONQ11fnIoCg8TMAyGGsfSgSg0XR6V1A0qbPv4jCw=;
 b=WYPGV4UMe7kGanyNs7sqLnj1aUvSiwnKvbWsaYbuAe2Aha/1Po6HG2Vme/rFgBxPvY
 2mAHHsTWvm3NhES2fqkvN47bpGHffhwUHu6c4FwTmDwq0czoOw/tXRp4UnwVsDjraB4F
 /jfDxItR3ZZlOKEvyQ1mr1n0/ASZoX+JE1fBlRCsz6washrCzgnzkbET4lyT91BWJf13
 XF8CKGYZbFvfmHnxDDXtXZB9t6hkKLOEAK0UEgzCpCGbPHb8PxGLe8SYrpn6E5HlzyY3
 hageTnrAFxpSx7VfiNE5R1lemdKWN7mz1TVxrAePZw9D/zmlAiQ6nusgQM8mo6MmZqTo
 2Umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGaONQ11fnIoCg8TMAyGGsfSgSg0XR6V1A0qbPv4jCw=;
 b=e60QAPcKybUlorv2P/F3WBM37BAPP8t22YB/by5hKbhRPdT/+n1JMLhhUjl5BINvMK
 KEEarYZ18nKMeTJY1p6nZmA/G0dNJNx+KC7k8/TZtHxvYGBD4rAEwrxrw2qwXY/5TyKi
 09ew6R/VPx5JzznX6mjFuUgmIv0anILJWT8wSSvY+4VpfqL20teJJWsyMANwNrRRkx8J
 KPbDuUDzWIWX/1z89kE/tJKLkExBRt2p7WPLyUPYgB1PUD8yKU78HoUf7W9dACxtBWgs
 /sUuBKjFBq6+JIB/x81AiQBjFg0lySQTdjMCDbqjjHwsu+T3boxmHjEjnN3OXVlVcAHR
 0Jyw==
X-Gm-Message-State: AOAM530AwJD736FzMkmNQzat91VsZbiRvBWbSN8mMhCtfiUmTbJQQ/Zo
 vmiKeU7YWjAIftdmyztD0lJDCkpie+DVeRA/00/ulA==
X-Google-Smtp-Source: ABdhPJxAxDNlmoPAh3rEK/IaqMLA8Y6Dhm6/TOLcKcFLV8lOZ1Z+1N3gpgp2WUaijcAY63vgp4eKe++lEQ085tOaCac=
X-Received: by 2002:a1f:211:: with SMTP id 17mr1625548vkc.40.1642775466698;
 Fri, 21 Jan 2022 06:31:06 -0800 (PST)
MIME-Version: 1.0
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-5-f4bug@amsat.org>
 <9d09394f-20b3-eb07-d962-9d723b0d3c3d@redhat.com>
 <YeqdROki4KJkT8RR@redhat.com>
In-Reply-To: <YeqdROki4KJkT8RR@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 21 Jan 2022 07:30:55 -0700
Message-ID: <CANCZdfoBYJ=G29YmoQ49GF8pVUveVZw6NyDB3KfQFpbyod3+ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] tests: Refresh lcitool submodule
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002381c905d61878b3"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a36;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002381c905d61878b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 21, 2022 at 4:47 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Fri, Jan 21, 2022 at 12:40:48PM +0100, Thomas Huth wrote:
> > On 21/01/2022 11.36, Philippe Mathieu-Daud=C3=A9 wrote:
> > > Refresh lcitool submodule and the generated files by running:
> > >
> > >    $ make lcitool-refresh
> > >
> > > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > ---
> > >   .gitlab-ci.d/cirrus/freebsd-12.vars           | 2 +-
> > >   .gitlab-ci.d/cirrus/freebsd-13.vars           | 2 +-
> > >   tests/docker/dockerfiles/alpine.docker        | 3 ++-
> > >   tests/docker/dockerfiles/centos8.docker       | 3 +--
> > >   tests/docker/dockerfiles/fedora.docker        | 3 +--
> > >   tests/docker/dockerfiles/opensuse-leap.docker | 2 +-
> > >   tests/docker/dockerfiles/ubuntu1804.docker    | 2 +-
> > >   tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
> > >   tests/lcitool/libvirt-ci                      | 2 +-
> > >   9 files changed, 10 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars
> b/.gitlab-ci.d/cirrus/freebsd-12.vars
> > > index 9c52266811f..bdcce578edf 100644
> > > --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> > > +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> > > @@ -11,6 +11,6 @@ MAKE=3D'/usr/local/bin/gmake'
> > >   NINJA=3D'/usr/local/bin/ninja'
> > >   PACKAGING_COMMAND=3D'pkg'
> > >   PIP3=3D'/usr/local/bin/pip-3.8'
> > > -PKGS=3D'alsa-lib bash bzip2 ca_root_nss capstone4 ccache
> cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git
> glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnf=
s
> libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses
> nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy
> py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv
> py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesserac=
t
> texinfo usbredir virglrenderer vte3 zstd'
> > > +PKGS=3D'alsa-lib bash bzip2 ca_root_nss capstone4 ccache
> cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3
> gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt
> libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-u=
st
> lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgco=
nf
> png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme
> py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy
> spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> >
> > Aren't the FreeBSD jobs currently failing due to lttng-ust not being
> > available anymore? ... I'd somehow expected that this update might fix
> this,
> > too, but I still see lttng-ust in the list here?
>
> I had prepped an update to drop it, but @bsdimp indicated that it ought
> to be a transient problem so I never applied it, hoping it would fix
> itself.
>
> https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/211
>
> It has been broken for ~2 weeks now though, and lttng-ust is not an
> especially critical feature so we should probably just go ahead and
> disable it regardless.
>

I agree. I got some back and forth from the FreeBSD community about whether
or not
it was coming back. I think we should drop the package until that back and
forth results
in it being available again.

Warner

--0000000000002381c905d61878b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 21, 2022 at 4:47 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, Jan 21, 2022 at 12:40:48PM +0100, Thomas Huth wrote:<br>
&gt; On 21/01/2022 11.36, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; &gt; Refresh lcitool submodule and the generated files by running:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 $ make lcitool-refresh<br>
&gt; &gt; <br>
&gt; &gt; Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berran=
ge@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:=
f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0.gitlab-ci.d/cirrus/freebsd-12.vars=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0.gitlab-ci.d/cirrus/freebsd-13.vars=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0tests/docker/dockerfiles/alpine.docker=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 3 ++-<br>
&gt; &gt;=C2=A0 =C2=A0tests/docker/dockerfiles/centos8.docker=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 3 +--<br>
&gt; &gt;=C2=A0 =C2=A0tests/docker/dockerfiles/fedora.docker=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 3 +--<br>
&gt; &gt;=C2=A0 =C2=A0tests/docker/dockerfiles/opensuse-leap.docker | 2 +-<=
br>
&gt; &gt;=C2=A0 =C2=A0tests/docker/dockerfiles/ubuntu1804.docker=C2=A0 =C2=
=A0 | 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0tests/docker/dockerfiles/ubuntu2004.docker=C2=A0 =C2=
=A0 | 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0tests/lcitool/libvirt-ci=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;=C2=A0 =C2=A09 files changed, 10 insertions(+), 11 deletions(-)<br=
>
&gt; &gt; <br>
&gt; &gt; diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/c=
irrus/freebsd-12.vars<br>
&gt; &gt; index 9c52266811f..bdcce578edf 100644<br>
&gt; &gt; --- a/.gitlab-ci.d/cirrus/freebsd-12.vars<br>
&gt; &gt; +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars<br>
&gt; &gt; @@ -11,6 +11,6 @@ MAKE=3D&#39;/usr/local/bin/gmake&#39;<br>
&gt; &gt;=C2=A0 =C2=A0NINJA=3D&#39;/usr/local/bin/ninja&#39;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGING_COMMAND=3D&#39;pkg&#39;<br>
&gt; &gt;=C2=A0 =C2=A0PIP3=3D&#39;/usr/local/bin/pip-3.8&#39;<br>
&gt; &gt; -PKGS=3D&#39;alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdr=
kit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib g=
make gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspi=
ce-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle =
ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillo=
w py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml pyth=
on3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbred=
ir virglrenderer vte3 zstd&#39;<br>
&gt; &gt; +PKGS=3D&#39;alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdr=
kit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gette=
xt git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo =
libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson nc=
urses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-num=
py py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv p=
y38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract t=
exinfo usbredir virglrenderer vte3 zstd&#39;<br>
&gt; <br>
&gt; Aren&#39;t the FreeBSD jobs currently failing due to lttng-ust not bei=
ng<br>
&gt; available anymore? ... I&#39;d somehow expected that this update might=
 fix this,<br>
&gt; too, but I still see lttng-ust in the list here?<br>
<br>
I had prepped an update to drop it, but @bsdimp indicated that it ought<br>
to be a transient problem so I never applied it, hoping it would fix<br>
itself.<br>
<br>
<a href=3D"https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/211" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/libvirt/libvirt-ci/-/m=
erge_requests/211</a><br>
<br>
It has been broken for ~2 weeks now though, and lttng-ust is not an<br>
especially critical feature so we should probably just go ahead and<br>
disable it regardless.<br></blockquote><div><br></div><div>I agree. I got s=
ome back and forth from the FreeBSD community about whether or not</div><di=
v>it was coming back. I think we should drop the package until that back an=
d forth results</div><div>in it being available again.</div><div><br></div>=
<div>Warner</div></div></div>

--0000000000002381c905d61878b3--

