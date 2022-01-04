Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D370A484721
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 18:41:58 +0100 (CET)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4nop-0006nO-E5
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 12:41:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n4nmu-0004oG-37
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:39:56 -0500
Received: from [2607:f8b0:4864:20::92d] (port=43934
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n4nmr-00076t-Q9
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:39:55 -0500
Received: by mail-ua1-x92d.google.com with SMTP id i5so49454007uaq.10
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PjDOKUvm2P6W576M8ZAU2rBHORpIL81PfJTfD7CpP8E=;
 b=0XBjaMIuvgKyaP4iQWcdL9d4DQ3XBVMAmVQ4Ppt4d7gCoM5VmjkpfTL0PI1PJbM5Sz
 NXaUd2MVM57XjbFyD7jRHmPmssW7/4tOlyIaGavIpkOIqfdXKdxCOlydXBBeK3beiafo
 DYBHHE3fqys9+V9X79ZGqDGwsvraPqda0LWLtJKaLz97g3h7Yg/6ToZ+HaWsiQ3DlUju
 Rx29G/1T30eSfXYzI7+apAPTGbEhISwxIDXnRtz2on73TFPEApKBuw93BNV5KDVru4l4
 oe5OhiebmZPKb8PqR8P6Ug4enKk6puOW0XcyUkKNyCbLMPurH1r0mb+jr2XaVk2AZWQx
 4v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PjDOKUvm2P6W576M8ZAU2rBHORpIL81PfJTfD7CpP8E=;
 b=5OtoFTSOotaf9mAoBQCGzCZTI5AOdMFX6qIDC9FqdbLnemH6F3mrX/Ex0EH86u39Y+
 COe7dNKzvI82Rvdl7hiiipB7RQ8Ol+Sq046vy2JQhkAS8j7fx0PWpo3WUaxgqT4Hebx5
 GspKly/6HbOm1VY2ayZY3hH5EosgbcMqWdIaKb0m81Ve+xdRknmmNPph9/gojB8bsfUG
 pHuufqHPoGVx+eC14x8gMft5ZGLcXSSdv1KYvufAzVmhVVsEr0XfChyDY5lwkiEMLThb
 WWomFgC4HcqdKwDqbldqY8922NJCLmjb8fr2/zgGiq2Dm3lG4t4jryjizwywfc3/g3nz
 8wcw==
X-Gm-Message-State: AOAM533SEkTTmpiGn6zHlgqPuELCugnzTh5E8RUfHfMX9ZwhC3HySySB
 5hteAxFOJFQNFzNmUuJ9MbnIXvrp763mDmwsDD4M1A==
X-Google-Smtp-Source: ABdhPJzIlDo6kNxQTIuCNQeNjEe5QZba4sBzWNirC0deDPyIe1x1T9KMvF1G0a03sx1pJzFowHtsrpxdY5nKSV+uCGw=
X-Received: by 2002:a05:6102:ec2:: with SMTP id
 m2mr16058785vst.6.1641317992628; 
 Tue, 04 Jan 2022 09:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20211127201846.64187-1-imp@bsdimp.com>
 <CANCZdfpUYJZHfSZCZrk05U3K=gUM8gudFDEHjm3xhZU5bX0ztw@mail.gmail.com>
 <87k0ffl8mh.fsf@linaro.org>
In-Reply-To: <87k0ffl8mh.fsf@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 4 Jan 2022 10:39:41 -0700
Message-ID: <CANCZdfo1Ls187QmaK21Uj5R8x5cU=jojG3v8XzuNJGjCabjT3A@mail.gmail.com>
Subject: Re: [PATCH for 7.0 0/5] bsd-user-smoke: A simple smoke test for
 bsd-user
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ea15ef05d4c51f7e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92d.google.com
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
Cc: Gleb Popov <arrowd@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Konrad Witaszczyk <def@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ea15ef05d4c51f7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 4, 2022 at 10:21 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Warner Losh <imp@bsdimp.com> writes:
>
> > PING!
> >
> > If anybody (especially the BSD reviewers) could look at these, that
> would be great!
> >
> > It's been suggested I rename bsd-user-smoke to just be bsd-user and we
> put our tests there until we can switch to the more generic tcg
> > tests, so I'll do that and resend in a few days.
>
> That seems reasonable. I'm curious how much of check-tcg runs on BSD at
> the moment?
>

About 1/3-1/2 on x86 (due to lack of signal support, the x86 stuff is
pretty basic since it's
really never evolved past it's early Blue Swirl origin phase). On other
platforms, you
need a 'sysroot' to build with the cross compiler specified. FreeBSD has
the compiler
built to build for any target by default, but not the sysroot needed and we
don't
currently have a good sysroot package that would easily drop into
automation. The
smoke test is carefully crafted to not need this. To be honest, I've not
yet tested other
architectures due to this issue with check-tcg, but will do so now that I'm
back from
the holidays. There's some other issues with bsd-user I need to focus on
first (more
changes to sys/user.h breaking the build leading to much downstream angst).

Warner


> >
> > Warner
> >
> > On Sat, Nov 27, 2021 at 1:19 PM Warner Losh <imp@bsdimp.com> wrote:
> >
> >  This series adds a number of simple binaries that FreeBSD's clang can
> build on
> >  any system. I've kept it simple so that there's no extra binaries that
> need to
> >  be installed. Given the current state of bsd-user in the project's
> repo, this
> >  likely is as extensive a set of tests that should be done right now. W=
e
> can load
> >  static binaries only (so these are static binaries) and hello world is
> the
> >  canonical test. I have binaries for all the supported FreeBSD targets,
> but have
> >  included only the ones that are in upstream (or in review) at this tim=
e.
> >
> >  In the future, I'll integreate with the tcg tests when there's more in
> upstream
> >  they can test.  Since that requires putting together FreeBSD sysroots
> for all
> >  the supported architectures for multiple versions, I'm going to delay
> that for a
> >  while. I'll also integrate FreeBSD's 5k system tests when we're much
> further
> >  along with the upstreaming.
> >
> >  The purpose of this is to give others doing changes in this area a
> standardized
> >  way to ensure their changes don't fundamentally break bsd-user. This
> approach
> >  will work for all setups that do a 'make check' to do their testing.
> >
> >  Based-on: 20211108035136.43687-1-imp@bsdimp.com
> >
> >  Warner Losh (5):
> >    h.armv7: Simple hello-world test for armv7
> >    h.i386: Simple hello-world test for i386
> >    h.amd64: Simple hello-world test for x86_64
> >    smoke-bsd-user: A test script to run all the FreeBSD binaries
> >    bsd-user-smoke: Add to build
> >
> >   tests/bsd-user-smoke/h.amd64.S      | 28 +++++++++++++++++++++
> >   tests/bsd-user-smoke/h.armv7.S      | 37 +++++++++++++++++++++++++++
> >   tests/bsd-user-smoke/h.i386.S       | 39 ++++++++++++++++++++++++++++=
+
> >   tests/bsd-user-smoke/meson.build    | 31 +++++++++++++++++++++++
> >   tests/bsd-user-smoke/smoke-bsd-user | 22 ++++++++++++++++
> >   tests/meson.build                   |  1 +
> >   6 files changed, 158 insertions(+)
> >   create mode 100644 tests/bsd-user-smoke/h.amd64.S
> >   create mode 100644 tests/bsd-user-smoke/h.armv7.S
> >   create mode 100644 tests/bsd-user-smoke/h.i386.S
> >   create mode 100644 tests/bsd-user-smoke/meson.build
> >   create mode 100644 tests/bsd-user-smoke/smoke-bsd-user
> >
> >  --
> >  2.33.0
>
>
> --
> Alex Benn=C3=A9e
>

--000000000000ea15ef05d4c51f7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 4, 2022 at 10:21 AM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsd=
imp.com</a>&gt; writes:<br>
<br>
&gt; PING!<br>
&gt;<br>
&gt; If anybody (especially the BSD reviewers) could look at these, that wo=
uld be great!<br>
&gt;<br>
&gt; It&#39;s been suggested I rename bsd-user-smoke to just be bsd-user an=
d we put our tests there until we can switch to the more generic tcg<br>
&gt; tests, so I&#39;ll do that and resend in a few days.<br>
<br>
That seems reasonable. I&#39;m curious how much of check-tcg runs on BSD at=
<br>
the moment?<br></blockquote><div><br></div><div>About 1/3-1/2 on x86 (due t=
o lack of signal support, the x86 stuff is pretty basic since it&#39;s</div=
><div>really never evolved past it&#39;s early Blue Swirl origin phase). On=
 other platforms, you</div><div>need a &#39;sysroot&#39; to build with the =
cross compiler specified. FreeBSD has the compiler</div><div>built to build=
 for any target by default, but not the sysroot needed and we don&#39;t</di=
v><div>currently have a good sysroot package that would easily drop into au=
tomation. The</div><div>smoke test is carefully crafted to not need this. T=
o be honest, I&#39;ve not yet tested other</div><div>architectures due to t=
his issue with check-tcg, but will do so now that I&#39;m back from</div><d=
iv>the holidays. There&#39;s some other issues with bsd-user I need to focu=
s on first (more</div><div>changes to sys/user.h breaking the build leading=
 to much downstream angst).</div><div><br></div><div>Warner</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Warner<br>
&gt;<br>
&gt; On Sat, Nov 27, 2021 at 1:19 PM Warner Losh &lt;<a href=3D"mailto:imp@=
bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 This series adds a number of simple binaries that FreeBSD&#39;s =
clang can build on<br>
&gt;=C2=A0 any system. I&#39;ve kept it simple so that there&#39;s no extra=
 binaries that need to<br>
&gt;=C2=A0 be installed. Given the current state of bsd-user in the project=
&#39;s repo, this<br>
&gt;=C2=A0 likely is as extensive a set of tests that should be done right =
now. We can load<br>
&gt;=C2=A0 static binaries only (so these are static binaries) and hello wo=
rld is the<br>
&gt;=C2=A0 canonical test. I have binaries for all the supported FreeBSD ta=
rgets, but have<br>
&gt;=C2=A0 included only the ones that are in upstream (or in review) at th=
is time.<br>
&gt;<br>
&gt;=C2=A0 In the future, I&#39;ll integreate with the tcg tests when there=
&#39;s more in upstream<br>
&gt;=C2=A0 they can test.=C2=A0 Since that requires putting together FreeBS=
D sysroots for all<br>
&gt;=C2=A0 the supported architectures for multiple versions, I&#39;m going=
 to delay that for a<br>
&gt;=C2=A0 while. I&#39;ll also integrate FreeBSD&#39;s 5k system tests whe=
n we&#39;re much further<br>
&gt;=C2=A0 along with the upstreaming.<br>
&gt;<br>
&gt;=C2=A0 The purpose of this is to give others doing changes in this area=
 a standardized<br>
&gt;=C2=A0 way to ensure their changes don&#39;t fundamentally break bsd-us=
er. This approach<br>
&gt;=C2=A0 will work for all setups that do a &#39;make check&#39; to do th=
eir testing.<br>
&gt;<br>
&gt;=C2=A0 Based-on: <a href=3D"mailto:20211108035136.43687-1-imp@bsdimp.co=
m" target=3D"_blank">20211108035136.43687-1-imp@bsdimp.com</a><br>
&gt;<br>
&gt;=C2=A0 Warner Losh (5):<br>
&gt;=C2=A0 =C2=A0 h.armv7: Simple hello-world test for armv7<br>
&gt;=C2=A0 =C2=A0 h.i386: Simple hello-world test for i386<br>
&gt;=C2=A0 =C2=A0 h.amd64: Simple hello-world test for x86_64<br>
&gt;=C2=A0 =C2=A0 smoke-bsd-user: A test script to run all the FreeBSD bina=
ries<br>
&gt;=C2=A0 =C2=A0 bsd-user-smoke: Add to build<br>
&gt;<br>
&gt;=C2=A0 =C2=A0tests/bsd-user-smoke/h.amd64.S=C2=A0 =C2=A0 =C2=A0 | 28 ++=
+++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0tests/bsd-user-smoke/h.armv7.S=C2=A0 =C2=A0 =C2=A0 | 37 ++=
+++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0tests/bsd-user-smoke/h.i386.S=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
39 +++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0tests/bsd-user-smoke/meson.build=C2=A0 =C2=A0 | 31 +++++++=
++++++++++++++++<br>
&gt;=C2=A0 =C2=A0tests/bsd-user-smoke/smoke-bsd-user | 22 ++++++++++++++++<=
br>
&gt;=C2=A0 =C2=A0tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A06 files changed, 158 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 tests/bsd-user-smoke/h.amd64.S<br>
&gt;=C2=A0 =C2=A0create mode 100644 tests/bsd-user-smoke/h.armv7.S<br>
&gt;=C2=A0 =C2=A0create mode 100644 tests/bsd-user-smoke/h.i386.S<br>
&gt;=C2=A0 =C2=A0create mode 100644 tests/bsd-user-smoke/meson.build<br>
&gt;=C2=A0 =C2=A0create mode 100644 tests/bsd-user-smoke/smoke-bsd-user<br>
&gt;<br>
&gt;=C2=A0 -- <br>
&gt;=C2=A0 2.33.0<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--000000000000ea15ef05d4c51f7e--

