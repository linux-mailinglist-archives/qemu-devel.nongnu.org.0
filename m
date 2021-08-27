Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D873F96B0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 11:12:47 +0200 (CEST)
Received: from localhost ([::1]:37338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJXuo-0006kD-56
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 05:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mJXsm-0005c9-5s
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 05:10:40 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mJXsj-0006wi-NK
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 05:10:39 -0400
Received: by mail-ed1-x52c.google.com with SMTP id g22so8899896edy.12
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0YNWCCSx/Dlih5oGnmhKK8xxLs+azTe7SM03hLxDWS8=;
 b=YQ3Ta+yf9Rquanqcf0xt8AuzPh6sMOspO+J02ejUormLkb8jIu53JZGFMZPaAJaR01
 or+EPFt4tKX9GeTBU+JQVOCNWxly1pv/+4KpNlhpSWkucRVLsEYOyxzY9hkiXTdD/QcD
 Z2WdJrsfPet/GUw8kzNY89PtqfWcHknciiNexOoIPGvneogbSkhcnBhda3JaYhX+uiMU
 +G44MgoDPzQAcDdLRI7x5MODo2cwDvanK0BZYVSx0UdnZqyROMrHXkjhFNx5hofzhzj/
 lQfRPV4NM7EanBUm4rXh9+QGd5MFg5zOreIgbHXrbA6m4o+1BkO2aX5xaf35+YPTw1so
 0K3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0YNWCCSx/Dlih5oGnmhKK8xxLs+azTe7SM03hLxDWS8=;
 b=b0rGoX3ZEJOaK0NGpnFUOuxaL155uA1fUuCQAb1bMNT/U9TrNDA4kkyqBtzE1aFgla
 IyDnt0eSIRTBmPQbBrI3ddVGXKfviae5jgPIq0nAC8RFKX1/TvzhCf0zjZMsHC0znPEY
 Opom25+QOH38T+GmbjExSDaTkaRlczxJ916R/t819Dd+b7UmrmUjqQAec3p1N2opvZHD
 W5A7wDMuvnm44zXxv+CbirgnQE0jSr8OSVs1aV5fLbUPj2Yx/gXEKvzD5dJDR59TwpvL
 iQpSaPfCPgfpC/ORfFqzrxWhHY472D44YCTBEA1pGyM6egJwWnH68xxFQG4W/VtGM8G3
 a7+w==
X-Gm-Message-State: AOAM533r/WwkgGVn9eGzWEDJByuej15VqnkomNEEjacLam1QNYe3nR+a
 7+oIGUzZCroAP3l6BC71FN0nsu4G5lMMLb1yD7c=
X-Google-Smtp-Source: ABdhPJxIARFTeVd7Iqxx7rg1XP6HGQVuik5/QPc6FrlTuSzKKFofOZH9l4EWZ807WKZYExA1TjbezCm+24C2o6TiUHc=
X-Received: by 2002:a50:ed09:: with SMTP id j9mr8807731eds.164.1630055433282; 
 Fri, 27 Aug 2021 02:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
 <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
 <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
 <YSiqAa0RBPoXpU8f@redhat.com>
In-Reply-To: <YSiqAa0RBPoXpU8f@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 27 Aug 2021 13:10:21 +0400
Message-ID: <CAJ+F1CJ_MHnipJazUry=PSvEdwsjAyRTr4Ck5VVXeYJuc7yePw@mail.gmail.com>
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000010a9ed05ca86db85"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000010a9ed05ca86db85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 27, 2021 at 1:03 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Aug 25, 2021 at 07:12:10PM +0100, Peter Maydell wrote:
> > On Wed, 25 Aug 2021 at 14:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
> wrote:
> > >
> > > On 8/25/21 2:43 PM, marcandre.lureau@redhat.com wrote:
> > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > >
> > > > DTC is widely available, we could consider to stop bundling it.
> > > >
> > > > curl -s 'https://repology.org/api/v1/project/dtc' |  \
> > > >    jq -r 'group_by(.repo) | .[] | "\(.[0].repo): \(map(.version))"'
> | \
> > > >    egrep -i
> 'ubuntu_18|debian_old|rhel|centos|bsd|suse_leap_15_2|sles|homebrew|pkgsrc=
'
> > > >
> > > > centos_8: ["1.6.0","1.6.0"]
> > > > debian_oldstable: ["1.4.7"]
> > > > freebsd: ["1.6.0"]
> > > > homebrew: ["1.6.1"]
> > > > openbsd: ["1.6.0"]
> > > > opensuse_leap_15_2: ["1.5.1","1.5.1"]
> > > > pkgsrc_current: ["1.4.7"]
> > > > ubuntu_18_04: ["1.4.5"]
> > > >
> > > > MinGW package on Fedora pending review.
> > > > (https://bugzilla.redhat.com/show_bug.cgi?id=3D1997511)
> > > >
> > > > Debian is lacking the MinGW package.
> > > >
> > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > > ---
> > > >  configure         | 22 +-------------------
> > > >  meson.build       | 53
> ++++++++---------------------------------------
> > > >  .gitmodules       |  3 ---
> > > >  dtc               |  1 -
> > > >  meson_options.txt |  3 ---
> > > >  5 files changed, 10 insertions(+), 72 deletions(-)
> > > >  delete mode 160000 dtc
> > >
> > > Does this fix https://gitlab.com/qemu-project/qemu/-/issues/255 ?
> > > "Build on sparc64 fails with "undefined reference to `fdt_check_full'=
"
> >
> > That bug sounds like it indicates that we can't use this patch:
> > a comment in the bug says that fdt_check_full() (which we use)
> > was only added in libfdt 1.5.1. So the libfdt version we need
> > is still not available in several of the distros we care about.
> >
> > I suspect the bug you link to may have been fixed -- certainly
> > meson.build appears to be specifically looking for fdt_check_full()
> > so we should never try to compile with a libfdt that doesn't have it.
>
> It is slightly more complicated - the fdt_check_full function exists
> in all the distros we target AFAICT, but libfdt's ELF symbols file
> never recorded its existance. So if you static link to libfdt you
> get fdt_check_full but if you dynamic link it is inaccessible :-(
>
>
I see, that's where the 1.5.1 version comes from then.

commit eac2ad495b29f15d78daa2a7226653f36515cd7a
Author: David Gibson <david@gibson.dropbear.id.au>
Date:   Mon Mar 25 14:52:47 2019 +1100

    Update version.lds again

git describe --contains eac2ad495b29f15d78daa2a7226653f36515cd7a
v1.5.1~40

Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000010a9ed05ca86db85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 27, 2021 at 1:03 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, Aug 25, 2021 at 07:12:10PM +0100, Peter Maydell wrote:<br>
&gt; On Wed, 25 Aug 2021 at 14:28, Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; On 8/25/21 2:43 PM, <a href=3D"mailto:marcandre.lureau@redhat.com=
" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; &gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; DTC is widely available, we could consider to stop bundling =
it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; curl -s &#39;<a href=3D"https://repology.org/api/v1/project/=
dtc" rel=3D"noreferrer" target=3D"_blank">https://repology.org/api/v1/proje=
ct/dtc</a>&#39; |=C2=A0 \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 jq -r &#39;group_by(.repo) | .[] | &quot;\(.[0]=
.repo): \(map(.version))&quot;&#39; | \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 egrep -i &#39;ubuntu_18|debian_old|rhel|centos|=
bsd|suse_leap_15_2|sles|homebrew|pkgsrc&#39;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; centos_8: [&quot;1.6.0&quot;,&quot;1.6.0&quot;]<br>
&gt; &gt; &gt; debian_oldstable: [&quot;1.4.7&quot;]<br>
&gt; &gt; &gt; freebsd: [&quot;1.6.0&quot;]<br>
&gt; &gt; &gt; homebrew: [&quot;1.6.1&quot;]<br>
&gt; &gt; &gt; openbsd: [&quot;1.6.0&quot;]<br>
&gt; &gt; &gt; opensuse_leap_15_2: [&quot;1.5.1&quot;,&quot;1.5.1&quot;]<br=
>
&gt; &gt; &gt; pkgsrc_current: [&quot;1.4.7&quot;]<br>
&gt; &gt; &gt; ubuntu_18_04: [&quot;1.4.5&quot;]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; MinGW package on Fedora pending review.<br>
&gt; &gt; &gt; (<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D19=
97511" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/sho=
w_bug.cgi?id=3D1997511</a>)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Debian is lacking the MinGW package.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com<=
/a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +-----=
--------------<br>
&gt; &gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 53 ++++++++---=
------------------------------------<br>
&gt; &gt; &gt;=C2=A0 .gitmodules=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ---<br=
>
&gt; &gt; &gt;=C2=A0 dtc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 -<br>
&gt; &gt; &gt;=C2=A0 meson_options.txt |=C2=A0 3 ---<br>
&gt; &gt; &gt;=C2=A0 5 files changed, 10 insertions(+), 72 deletions(-)<br>
&gt; &gt; &gt;=C2=A0 delete mode 160000 dtc<br>
&gt; &gt;<br>
&gt; &gt; Does this fix <a href=3D"https://gitlab.com/qemu-project/qemu/-/i=
ssues/255" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-pro=
ject/qemu/-/issues/255</a> ?<br>
&gt; &gt; &quot;Build on sparc64 fails with &quot;undefined reference to `f=
dt_check_full&#39;&quot;<br>
&gt; <br>
&gt; That bug sounds like it indicates that we can&#39;t use this patch:<br=
>
&gt; a comment in the bug says that fdt_check_full() (which we use)<br>
&gt; was only added in libfdt 1.5.1. So the libfdt version we need<br>
&gt; is still not available in several of the distros we care about.<br>
&gt; <br>
&gt; I suspect the bug you link to may have been fixed -- certainly<br>
&gt; meson.build appears to be specifically looking for fdt_check_full()<br=
>
&gt; so we should never try to compile with a libfdt that doesn&#39;t have =
it.<br>
<br>
It is slightly more complicated - the fdt_check_full function exists<br>
in all the distros we target AFAICT, but libfdt&#39;s ELF symbols file <br>
never recorded its existance. So if you static link to libfdt you <br>
get fdt_check_full but if you dynamic link it is inaccessible :-(<br>
<br></blockquote><div><br></div><div>I see, that&#39;s where the 1.5.1 vers=
ion comes from then.<br></div><div><br></div><div>commit eac2ad495b29f15d78=
daa2a7226653f36515cd7a<br>Author: David Gibson &lt;<a href=3D"mailto:david@=
gibson.dropbear.id.au">david@gibson.dropbear.id.au</a>&gt;<br>Date: =C2=A0 =
Mon Mar 25 14:52:47 2019 +1100<br><br>=C2=A0 =C2=A0 Update version.lds agai=
n</div><div><br></div><div>git describe --contains eac2ad495b29f15d78daa2a7=
226653f36515cd7a<br>v1.5.1~40</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000010a9ed05ca86db85--

