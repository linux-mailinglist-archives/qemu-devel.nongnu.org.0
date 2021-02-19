Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0795531FCF1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:16:38 +0100 (CET)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8SL-00074R-1T
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lD8KZ-0008Ml-Nm
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:08:35 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:35412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lD8KW-0004Uy-L7
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:08:35 -0500
Received: by mail-qk1-x736.google.com with SMTP id x14so6009347qkm.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 08:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mD6HBq/stT5yMnTZtFIqhMi71T/KDXTbdG2oSedVas4=;
 b=LMc1iyIiD7Gdp7Mm+IiOAx2jXpa0/6XL9zZ4vvuK2mMd+YrdZSSMDJa0+b7EU3/wkx
 NKGzDIcVMBmQfQgkUIA8jGidS+UrzZ3E26ZsWmHuNqi0jbfTyPjKsbBumMipRbZG5jU0
 uGyu/M4G6otZMX7PSQM6Kb0v0TI/8opJcj2U3E53+KkuWwqzNc6SucX3t6EdvSsmwv4w
 H6Ah+TNz9jRv9BqaZHSa6BF9xUkzc7CWTfFhr4pHnR3aNaNJ3ykrNUOGFpbHhyXsV92t
 3Ddz2Eo3aafCvgZUGGAQ+2pwKMlt8X+rVx3SqdAKghVcF3XqtyRc1POd5tgdbiHl88Ia
 xZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mD6HBq/stT5yMnTZtFIqhMi71T/KDXTbdG2oSedVas4=;
 b=DESnyBNFXYMwfXDwflhtw3lvnqOBSIEMupOYVcKPXZ+ZOsSMbiK8r+z4BfyxnHy7fH
 N47tbJExSaFuD94bPv6T7CfjqGilNeTTcIiUlDDpqjEBPI3pHDrq4Ztf3tfxRUc5Praz
 AYh+UJYd52NqxOdoJhX4bVHZDvPnogIP74lupx/ab1OiWjk0/7QufleMuYcPYuduap6Z
 0EQGMGAMBkD1+rYPtR9G9FgpJpxJVhSspP0XJlCfOhqmMm+R1gjXo4Sn6yJhWQM2EDzh
 Uk1rBvpumJYjIP299ao/3Ow/gAYlP+KLf6GTtTZYaW+Uvr42j+tJzxtz3CuqtBwg/a3f
 BWtw==
X-Gm-Message-State: AOAM533kecOkEH556VErDwIKAN6392rOhbqLrO0imILMVig4EZazm/GL
 3grjG5G53H2/RobdVLJyFo3XDOhxzYtJxfJmY3I1hQ==
X-Google-Smtp-Source: ABdhPJwK8aFG91M9RfZA8abW2WsBOOxlboZJy+j6Wh9PnlIXsTIqMhJ/kzf8wLrkLINVkoZEcdX4AJpmLicJeuN1qZQ=
X-Received: by 2002:a37:6cc6:: with SMTP id
 h189mr10412009qkc.195.1613750908914; 
 Fri, 19 Feb 2021 08:08:28 -0800 (PST)
MIME-Version: 1.0
References: <8735xss5q3.fsf@linaro.org>
 <CAFEAcA_24bo+9CjeoVL8Ke5PzCwmBw_z4H8nbOQbOGg=1HxUxA@mail.gmail.com>
 <20210219152408.34ibwagyqzgye4yd@sirius.home.kraxel.org>
In-Reply-To: <20210219152408.34ibwagyqzgye4yd@sirius.home.kraxel.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 19 Feb 2021 09:08:18 -0700
Message-ID: <CANCZdfqx+kCTkkw3jbDUwJB77DH0Qm3q8BpOY6-YJzKdY1eJeQ@mail.gmail.com>
Subject: Re: FreeBSD build regressions
To: Gerd Hoffmann <gerd@kraxel.org>
Content-Type: multipart/alternative; boundary="000000000000aea3d605bbb2a905"
Received-SPF: none client-ip=2607:f8b0:4864:20::736;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aea3d605bbb2a905
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

First off, sorry for the hassles this caused... The problem is a failure to
upgrade for reasons explained below... While the reasons make sense, it's
still a bit of a hassle, for which I apologize.

On Fri, Feb 19, 2021 at 8:51 AM Gerd Hoffmann <gerd@kraxel.org> wrote:

> On Fri, Feb 19, 2021 at 10:41:44AM +0000, Peter Maydell wrote:
> > On Fri, 19 Feb 2021 at 10:39, Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
> > >
> > >
> > > Hi,
> > >
> > > It looks like the build has been broken on Cirrus since at least
> 7b2c4c:
> > >
> > >   https://cirrus-ci.com/github/qemu/qemu
> > >
> > > I did attempt to have a look but "vm-build-freebsd" seems to be faili=
ng
> > > with a different error
> >
> > FWIW the vm-build-freebsd build-and-test works for me, as I
> > continue to run it as part of the merge tests. Is this something
> > to do with whether you already have a freebsd image cached
> > as opposed to it getting re-built from scratch (perhaps with
> > a newer FreeBSD)?
>
> The base image should be the same no matter what (updating that needs a
> tests/vm/freebsd update which in turn triggers a rebuild).  The addon
> package versions may differ though, so in case a broken package enters
> the freebsd package repos it may happen that old, existing vm images
> continue to work whereas newly created images don't ...
>
> Trying to rebuild the freebsd image here results in this:
>
> [ ... ]
> ### Installing packages ...
> Bootstrapping pkg from pkg+
> http://pkg.FreeBSD.org/FreeBSD:12:amd64/quarterly, please wait...
> Verifying signature with trusted certificate pkg.freebsd.org.2013102301..=
.
> done
> Installing pkg-1.16.1...
> Newer FreeBSD version for package pkg:
> To ignore this error set IGNORE_OSVERSION=3Dyes
> - package: 1202000                          <- freebsd 12.2 expected ?
> - running kernel: 1201000                   <- freebsd 12.1 running ?
> Ignore the mismatch and continue? [y/N]:
>
> So it seems the freebsd 12.1 images tries to fetch 12.2 packages when
> running "pkg install -y <list>", which would explain why they don't
> work.
>

FreeBSD 12.1 images fetch the FreeBSD 12 packages. This works until FreeBSD
12.1 hits end of life and the packages are built on newer versions. There's
no long-term support for releases once a new minor release happens. The
economics of this quickly get out of hand as the testing matrix explodes
and the number of machines needed to support all old versions (even on
supported branches) would be prohibitively expensive.


> Switching to freebsd 12.2 should solve this, at least until 12.3 is
> released, but I'm wondering why the freebsd pkg utility fetches
> incompatible packages in the first place and whenever there is any
> way to avoid this ...
>

FreeBSD builds packages on the oldest supported version in the stable
branch. Due to forward compatibility, that means all supported versions of
FreeBSD 12.x will work. Recently, FreeBSD 12.1 became unsupported, so the
build machines clicked forward to 12.2. Since there's no 'forward
compatibility' guarantees, this problem was hit. While you can run binaries
compiled on old versions of the software on new versions of the system, you
can't necessarily do the inverse because new symbols are introduced (in
this case close_range).

The base FreeBSD image should be rolled when new versions are released to
avoid this issue. tests/vm/freebsd should be updated. I have a full
morning, but if nobody has beat me to it, I'll submit a patch this
afternoon to fix this and add it to my list of things to do when FreeBSD
creates a new release.

Warner

--000000000000aea3d605bbb2a905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>First off, sorry for the hassles this caused... The p=
roblem is a failure to upgrade for reasons explained below... While the rea=
sons make sense, it&#39;s still a bit of a hassle, for which I apologize.</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, Feb 19, 2021 at 8:51 AM Gerd Hoffmann &lt;<a href=3D"mailto:gerd@krax=
el.org">gerd@kraxel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Fri, Feb 19, 2021 at 10:41:44AM +0000, Peter Mayd=
ell wrote:<br>
&gt; On Fri, 19 Feb 2021 at 10:39, Alex Benn=C3=A9e &lt;<a href=3D"mailto:a=
lex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wro=
te:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; It looks like the build has been broken on Cirrus since at least =
7b2c4c:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://cirrus-ci.com/github/qemu/qemu" re=
l=3D"noreferrer" target=3D"_blank">https://cirrus-ci.com/github/qemu/qemu</=
a><br>
&gt; &gt;<br>
&gt; &gt; I did attempt to have a look but &quot;vm-build-freebsd&quot; see=
ms to be failing<br>
&gt; &gt; with a different error<br>
&gt; <br>
&gt; FWIW the vm-build-freebsd build-and-test works for me, as I<br>
&gt; continue to run it as part of the merge tests. Is this something<br>
&gt; to do with whether you already have a freebsd image cached<br>
&gt; as opposed to it getting re-built from scratch (perhaps with<br>
&gt; a newer FreeBSD)?<br>
<br>
The base image should be the same no matter what (updating that needs a<br>
tests/vm/freebsd update which in turn triggers a rebuild).=C2=A0 The addon<=
br>
package versions may differ though, so in case a broken package enters<br>
the freebsd package repos it may happen that old, existing vm images<br>
continue to work whereas newly created images don&#39;t ...<br>
<br>
Trying to rebuild the freebsd image here results in this:<br>
<br>
[ ... ]<br>
### Installing packages ...<br>
Bootstrapping pkg from pkg+<a href=3D"http://pkg.FreeBSD.org/FreeBSD:12:amd=
64/quarterly" rel=3D"noreferrer" target=3D"_blank">http://pkg.FreeBSD.org/F=
reeBSD:12:amd64/quarterly</a>, please wait...<br>
Verifying signature with trusted certificate pkg.freebsd.org.2013102301... =
done<br>
Installing pkg-1.16.1...<br>
Newer FreeBSD version for package pkg:<br>
To ignore this error set IGNORE_OSVERSION=3Dyes<br>
- package: 1202000=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- freebsd 12.2 expected ?<br>
- running kernel: 1201000=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&lt;- freebsd 12.1 running ?<br>
Ignore the mismatch and continue? [y/N]: <br>
<br>
So it seems the freebsd 12.1 images tries to fetch 12.2 packages when<br>
running &quot;pkg install -y &lt;list&gt;&quot;, which would explain why th=
ey don&#39;t<br>
work.<br></blockquote><div><br></div><div>FreeBSD 12.1 images fetch the Fre=
eBSD 12 packages. This works until FreeBSD 12.1 hits end of life and the pa=
ckages are built on newer versions. There&#39;s no long-term support for re=
leases once a new minor release happens. The economics of this quickly get =
out of hand as the testing matrix explodes and the number of machines neede=
d to support all old versions (even on supported branches) would be prohibi=
tively expensive.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
Switching to freebsd 12.2 should solve this, at least until 12.3 is<br>
released, but I&#39;m wondering why the freebsd pkg utility fetches<br>
incompatible packages in the first place and whenever there is any<br>
way to avoid this ...<br></blockquote><div><br></div><div>FreeBSD builds pa=
ckages on the oldest supported version in the stable branch. Due to forward=
 compatibility, that means all supported versions of FreeBSD 12.x will work=
. Recently, FreeBSD 12.1 became unsupported, so the build machines clicked =
forward to 12.2. Since there&#39;s no &#39;forward compatibility&#39; guara=
ntees, this problem was hit. While you can run binaries compiled on old ver=
sions of the software on new versions of the system, you can&#39;t necessar=
ily do the inverse because new symbols are introduced (in this case close_r=
ange).</div><div><br></div><div>The base FreeBSD image should be rolled whe=
n new versions are released to avoid this issue. tests/vm/freebsd should be=
 updated. I have a full morning, but if nobody has beat me to it, I&#39;ll =
submit a patch this afternoon to fix this and add it to my list of things t=
o do when FreeBSD creates a new release.</div><div><br></div><div>Warner</d=
iv></div></div>

--000000000000aea3d605bbb2a905--

