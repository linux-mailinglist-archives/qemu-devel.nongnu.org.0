Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A90D3F7CE6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 21:58:07 +0200 (CEST)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIz2E-0004Ke-Ho
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 15:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mIz08-0000Fm-TL
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:55:56 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mIz06-0000it-Tj
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:55:56 -0400
Received: by mail-ej1-x62f.google.com with SMTP id ia27so819265ejc.10
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 12:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jay67oN9EY6xdSVao3FIFwEC/wTmTyUBX2O11dGh8iY=;
 b=m3yWKEMekJPKIgNTLM0WBeHMtRUek/wT8aB3b4KcwtVjrvDXuPCInnL+qQ/bZk7m6y
 cO49A6XFFy25IuSVewT8vYMDfAcn4uAZnQT1hpuTXXH57uIvFvMd8zbF9tVPwLQ2mH/T
 /pIQoOOcULvJcrkmM4sfmJQsq1l7B7R5qzFy4WrKYlgpD0dNbAaqs0n9WeptSjEmLgl8
 /LAw1dx4Od6RPUKOkb0Z85bjfBxPQFVifIjzT41IQeOTrAeSjB8ofLEljlplzdbbaTbA
 MnGlU2EqBT+RL6VmfBm7fX3z58Iutlfxt0u4oZPnMXLmcZqFuEWQAkk0x/4fKwRZJ1FM
 B3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jay67oN9EY6xdSVao3FIFwEC/wTmTyUBX2O11dGh8iY=;
 b=XBGTwYe/jm4EByKphYgEApBgoJ8yLC7x8f6hOsPbk1LUeCi37zeN4+HqgmKy8gRFp9
 mPSe4Av874TWJvRiowmuJP54aPW0AZQVhHlHMaey8Y9mk/QInIWWjK2pAs9DzO6kFGqK
 OEjSNDu+NWtYc83fWZ7KX/QnASdVlO3fh1UR97uoGM49A535B8xiNF0sJITueIkPRoGO
 c+ib9RKz8foNYwzhcfk67cekIqfvKfaPx1klk8xsDvz01NSCsEbcyoitTD63oPVZitRJ
 hVm298IMDFm1e4uFLKjjyaOXG5Ij4GoJvJ/1t1xu8KJ/IlJ4df98w34em6frRZvKRHxf
 JQFw==
X-Gm-Message-State: AOAM530RCejv3UTLzEu7qgeKTHtkRL41w7lxKHilplSRLcs7OK7JJZmD
 Mk+ACkgcLvSXxr6iQzpY8mz9iMiGlir9YtBrjnA=
X-Google-Smtp-Source: ABdhPJw4uxe5cO7hZLyFL6Kdlxl2ZoCi2xM0gN+G9pGHfRTzUcQM37GMnc/2mECYxsMO4RwbuxX/bRYsRTzbQd9XaQw=
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr346658ejy.532.1629921352800; 
 Wed, 25 Aug 2021 12:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
 <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
 <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 25 Aug 2021 23:55:40 +0400
Message-ID: <CAJ+F1CKx=24Hssrz=yz+D8Q2nTXcgaLeMFdB5tfHfdWRAZ-p+g@mail.gmail.com>
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003ee29b05ca67a30d"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003ee29b05ca67a30d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 25, 2021 at 10:13 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 25 Aug 2021 at 14:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
> wrote:
> >
> > On 8/25/21 2:43 PM, marcandre.lureau@redhat.com wrote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > DTC is widely available, we could consider to stop bundling it.
> > >
> > > curl -s 'https://repology.org/api/v1/project/dtc' |  \
> > >    jq -r 'group_by(.repo) | .[] | "\(.[0].repo): \(map(.version))"' |=
 \
> > >    egrep -i
> 'ubuntu_18|debian_old|rhel|centos|bsd|suse_leap_15_2|sles|homebrew|pkgsrc=
'
> > >
> > > centos_8: ["1.6.0","1.6.0"]
> > > debian_oldstable: ["1.4.7"]
> > > freebsd: ["1.6.0"]
> > > homebrew: ["1.6.1"]
> > > openbsd: ["1.6.0"]
> > > opensuse_leap_15_2: ["1.5.1","1.5.1"]
> > > pkgsrc_current: ["1.4.7"]
> > > ubuntu_18_04: ["1.4.5"]
> > >
> > > MinGW package on Fedora pending review.
> > > (https://bugzilla.redhat.com/show_bug.cgi?id=3D1997511)
> > >
> > > Debian is lacking the MinGW package.
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  configure         | 22 +-------------------
> > >  meson.build       | 53 ++++++++-------------------------------------=
--
> > >  .gitmodules       |  3 ---
> > >  dtc               |  1 -
> > >  meson_options.txt |  3 ---
> > >  5 files changed, 10 insertions(+), 72 deletions(-)
> > >  delete mode 160000 dtc
> >
> > Does this fix https://gitlab.com/qemu-project/qemu/-/issues/255 ?
> > "Build on sparc64 fails with "undefined reference to `fdt_check_full'"
>
> That bug sounds like it indicates that we can't use this patch:
> a comment in the bug says that fdt_check_full() (which we use)
> was only added in libfdt 1.5.1. So the libfdt version we need
> is still not available in several of the distros we care about.
>
> I suspect the bug you link to may have been fixed -- certainly
> meson.build appears to be specifically looking for fdt_check_full()
> so we should never try to compile with a libfdt that doesn't have it.
>
>
Right, the patch is a bit old actually and I didn't update it correctly
(specifically the check and the version requirement error)

fdt_check_full was added in 1.4.7:
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv1.4.7

Only ubuntu appears to be lagging a bit behind. I wonder if they would
consider an update.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003ee29b05ca67a30d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 25, 2021 at 10:13 PM Pe=
ter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@l=
inaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, 25 Aug 2021 at 14:28, Philippe Mathieu-Daud=C3=A9 &lt;<a=
 href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt; =
wrote:<br>
&gt;<br>
&gt; On 8/25/21 2:43 PM, <a href=3D"mailto:marcandre.lureau@redhat.com" tar=
get=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; DTC is widely available, we could consider to stop bundling it.<b=
r>
&gt; &gt;<br>
&gt; &gt; curl -s &#39;<a href=3D"https://repology.org/api/v1/project/dtc" =
rel=3D"noreferrer" target=3D"_blank">https://repology.org/api/v1/project/dt=
c</a>&#39; |=C2=A0 \<br>
&gt; &gt;=C2=A0 =C2=A0 jq -r &#39;group_by(.repo) | .[] | &quot;\(.[0].repo=
): \(map(.version))&quot;&#39; | \<br>
&gt; &gt;=C2=A0 =C2=A0 egrep -i &#39;ubuntu_18|debian_old|rhel|centos|bsd|s=
use_leap_15_2|sles|homebrew|pkgsrc&#39;<br>
&gt; &gt;<br>
&gt; &gt; centos_8: [&quot;1.6.0&quot;,&quot;1.6.0&quot;]<br>
&gt; &gt; debian_oldstable: [&quot;1.4.7&quot;]<br>
&gt; &gt; freebsd: [&quot;1.6.0&quot;]<br>
&gt; &gt; homebrew: [&quot;1.6.1&quot;]<br>
&gt; &gt; openbsd: [&quot;1.6.0&quot;]<br>
&gt; &gt; opensuse_leap_15_2: [&quot;1.5.1&quot;,&quot;1.5.1&quot;]<br>
&gt; &gt; pkgsrc_current: [&quot;1.4.7&quot;]<br>
&gt; &gt; ubuntu_18_04: [&quot;1.4.5&quot;]<br>
&gt; &gt;<br>
&gt; &gt; MinGW package on Fedora pending review.<br>
&gt; &gt; (<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1997511=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug=
.cgi?id=3D1997511</a>)<br>
&gt; &gt;<br>
&gt; &gt; Debian is lacking the MinGW package.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marca=
ndre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&g=
t;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +----------=
---------<br>
&gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 53 ++++++++--------=
-------------------------------<br>
&gt; &gt;=C2=A0 .gitmodules=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ---<br>
&gt; &gt;=C2=A0 dtc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 -<br>
&gt; &gt;=C2=A0 meson_options.txt |=C2=A0 3 ---<br>
&gt; &gt;=C2=A0 5 files changed, 10 insertions(+), 72 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 160000 dtc<br>
&gt;<br>
&gt; Does this fix <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues=
/255" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/=
qemu/-/issues/255</a> ?<br>
&gt; &quot;Build on sparc64 fails with &quot;undefined reference to `fdt_ch=
eck_full&#39;&quot;<br>
<br>
That bug sounds like it indicates that we can&#39;t use this patch:<br>
a comment in the bug says that fdt_check_full() (which we use)<br>
was only added in libfdt 1.5.1. So the libfdt version we need<br>
is still not available in several of the distros we care about.<br>
<br>
I suspect the bug you link to may have been fixed -- certainly<br>
meson.build appears to be specifically looking for fdt_check_full()<br>
so we should never try to compile with a libfdt that doesn&#39;t have it.<b=
r clear=3D"all"><br></blockquote><div><br></div><div>Right, the patch is a =
bit old actually and I didn&#39;t update it correctly (specifically the che=
ck and the version requirement error)</div><div><br></div><div>fdt_check_fu=
ll was added in 1.4.7:<br></div><div><a href=3D"https://git.kernel.org/pub/=
scm/utils/dtc/dtc.git/tag/?h=3Dv1.4.7">https://git.kernel.org/pub/scm/utils=
/dtc/dtc.git/tag/?h=3Dv1.4.7</a></div><div>=C2=A0</div></div><div>Only ubun=
tu appears to be lagging a bit behind. I wonder if they would consider an u=
pdate.<br></div><div><br></div><div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--0000000000003ee29b05ca67a30d--

