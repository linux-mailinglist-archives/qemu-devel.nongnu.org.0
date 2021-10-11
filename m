Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F534291D5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 16:31:14 +0200 (CEST)
Received: from localhost ([::1]:56544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZwKe-0001y0-Uq
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 10:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mZwIN-0000dk-L5
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 10:28:52 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:40460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mZwIJ-0000QF-Di
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 10:28:50 -0400
Received: by mail-ua1-x929.google.com with SMTP id i8so13153578uae.7
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IZCmHyRFbrMNNefMgCD5HnaqWh0fIRVdm6DuPCqQGd4=;
 b=JyCsiOj/XpM5luuVUBXykng/KnGov585bqffpVbWWd3CnARW1jobMrmdhUgmmMz90l
 DzjG0SbygyvH7ohNaRbHVeLGGnPBr9L3yL6pYpFYD2fZlC6lFAND18Lfe1CCD5esbh79
 FJn9FbeRLq12z6grxtM0/zrZi7p9sjApc0QI5Tda5oAkJDaZI9hw1/Vk09T/zMGwVFlV
 +zwz6fAVoC3fjaRhdbCuG8ri6jp+oEopN4TSr/MEcUqpd+GNJIYDZodHtXLHaB8y63Uy
 6BeV7CaHN0WcsHiXrDFLnJLXCh+G+gSxgcifzi3nqxaHS3vYyVsZCQkDobeBrnt0Fonv
 O+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IZCmHyRFbrMNNefMgCD5HnaqWh0fIRVdm6DuPCqQGd4=;
 b=kCerk4TG1ksr+OfYQDVHBjwq42rf2iN+5kfcMiRHaqiZNa36+tRA4FLZtUrfnGCeWp
 8alFaurQoCCvLshedTlA/pKnRPgej4P+4Wyi66QpQDxvq0YqgTv1QyxKprY+DfS1w4pB
 RSn/wlc4iXljoO1/Afol+dLC5iYn3QqgQqGnb1lTCeRcE+oo4yXeXE57chWZ1xVOfLhv
 yXr//emNu2FL2hHbPExw2pgFqroFyNDHkCSiVGBKn/Hmt0XLVTm78oulnmTgGwYtkjJk
 1bzzmWHHvQTztq4W7pv8Xqlm7mZhs1/2cIPI0ialLMUD6EoN6N3PYs0NytNSuxv7F4LW
 jP8Q==
X-Gm-Message-State: AOAM532u9NT9TtnhyswwqBefq8UKto3TtTECLPeThjUqA/VqVVNTfIXO
 eWGf9W8o/Aod+aYbBCPRLxwWVL9n62DgFQFcpBDTjg==
X-Google-Smtp-Source: ABdhPJz08MZuoa2ctPiz8mi26Vd8Y3ffF1Dde1rAhKYGw2he0Mhs1RSN/SaIQVfSwrcanR7cX880sWL1gJZvUn1hagA=
X-Received: by 2002:a9f:23d0:: with SMTP id 74mr14867727uao.69.1633962525213; 
 Mon, 11 Oct 2021 07:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <769a612c-9a78-6fc8-0893-43ce2c173957@amsat.org>
 <YVrC4niegCWq+1kM@stefanha-x1.localdomain>
 <163337608907.347510.4401699281486806089@amd.com>
 <YVxTHAMCVncGvbFi@stefanha-x1.localdomain>
 <20211011072130.i3vemilk23o4djdz@sirius.home.kraxel.org>
 <YWQY1CQ/qUsMBnoD@stefanha-x1.localdomain>
In-Reply-To: <YWQY1CQ/qUsMBnoD@stefanha-x1.localdomain>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Oct 2021 08:28:34 -0600
Message-ID: <CANCZdfpsHTr0=Lc8TB0L846ZbfjFS0sNDyna_74HQaXdcuWSYw@mail.gmail.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e45d0505ce148b6d"
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e45d0505ce148b6d
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 11, 2021 at 4:59 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Mon, Oct 11, 2021 at 09:21:30AM +0200, Gerd Hoffmann wrote:
> >   Hi,
> >
> > > > I guess the main question is who is using the ROM/BIOS sources in the
> > > > tarballs, and would this 2-step process work for those users? If
> there
> > > > are distros relying on them then maybe there are some more logistics
> to
> > > > consider since the make-release downloads are both time-consuming and
> > > > prone to network errors/stalls since it relies on the availability
> of a
> > > > good number of different hosts.
> > >
> > > Great, maybe Gerd can comment on splitting out firmware.
> >
> > I think the binaries are mostly a convenience feature for developers.
> > Distros typically build from source anyway, and typically they build
> > from upstream source instead of qemu submodule.
> >
> > The idea to split them out to a separate repo is exists for quite a
> > while.  I have an old qemu-firmware repo laying around on my disk, which
> > basically moves roms/ + submodules and the binaries built from it over.
> >
> > I think with the switch to gitlab it doesn't make sense any more to
> > commit pre-built firmware binaries to a git repo.  Instead we should
> > build the firmware in gitlab ci, i.e. effectively move the build rules
> > we have right now in roms/Makefile to .gitlab-ci.d/, then publish the
> > firmware binaries as build artifacts or gitlab pages.
> >
> > When done just remove the pre-build binaries from git and add a helper
> > script to fetch firmware binaries from gitlab instead.
> >
> > > QEMU mirrors firmware sources on GitLab too. We're able to provide the
> > > same level of download availability on our mirror firmware repos as for
> > > the main qemu.git repo.
> >
> > I think enabling CI for the firmware mirrors should work given that it
> > is possible to specify a custom CI/CD configuration file, i.e. use
> > something like
> >
> >     /qemu-project/qemu/.gitlab-ci.d/firmware/seabios.yml
> >
> > or
> >
> >     /qemu-project/qemu-firmware/seabios.yml
> >
> > as config file for the
> >
> >     /qemu-project/seabios/
> >
> > mirror.  Then we can publish binaries using gitlab pages at
> >
> >     https://qemu-project.gitlab.io/seabios/
> >
> > That way we also don't need the roms/ submodules any more, i.e. we
> > can remove both sources and binaries for the firmware from the
> > release tarballs.
>
> Thanks!
>
> For developer convenience it would be nice to avoid manual steps after
> git clone qemu.git. Maybe ./configure should check for firmware blobs
> and automatically download them. There could be a ./configure
> --disable-firmware-download option that distros can use to skip the
> download when building everything from source.
>

One thing to keep in mind about the downstream consumers: Many
of them have two phases to their build process that run asynchronously
to each other. There is a fetch phase that grabs everything, and a build
phase that builds the binaries. The second phase may not have access
to the internet for a variety of reasons (these days being a security
measure, for good or ill). Please make sure that any such plans
allow for this model.

Today, that's all dealt with by grabbing tarballs from github which
is how the submodules are dealt with. So long as the images
had well known names, and could be fetched with the normal
wget/cgit/fetch programs, that would suffice. Requiring use of
some weird bespoke script would cause friction for the downstreams
using qemu.

So while I'm all for making things a little more independent,
let's not do it in a way that makes life difficult for downstreams.
There are more there than just a couple of big distro builders.

Warner

--000000000000e45d0505ce148b6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 11, 2021 at 4:59 AM Stefa=
n Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Mon, Oct 11, 2021 at 09:21:30AM +0200, Gerd Hoffmann wrote:<br>
&gt;=C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt; &gt; &gt; I guess the main question is who is using the ROM/BIOS sourc=
es in the<br>
&gt; &gt; &gt; tarballs, and would this 2-step process work for those users=
? If there<br>
&gt; &gt; &gt; are distros relying on them then maybe there are some more l=
ogistics to<br>
&gt; &gt; &gt; consider since the make-release downloads are both time-cons=
uming and<br>
&gt; &gt; &gt; prone to network errors/stalls since it relies on the availa=
bility of a<br>
&gt; &gt; &gt; good number of different hosts.<br>
&gt; &gt; <br>
&gt; &gt; Great, maybe Gerd can comment on splitting out firmware.<br>
&gt; <br>
&gt; I think the binaries are mostly a convenience feature for developers.<=
br>
&gt; Distros typically build from source anyway, and typically they build<b=
r>
&gt; from upstream source instead of qemu submodule.<br>
&gt; <br>
&gt; The idea to split them out to a separate repo is exists for quite a<br=
>
&gt; while.=C2=A0 I have an old qemu-firmware repo laying around on my disk=
, which<br>
&gt; basically moves roms/ + submodules and the binaries built from it over=
.<br>
&gt; <br>
&gt; I think with the switch to gitlab it doesn&#39;t make sense any more t=
o<br>
&gt; commit pre-built firmware binaries to a git repo.=C2=A0 Instead we sho=
uld<br>
&gt; build the firmware in gitlab ci, i.e. effectively move the build rules=
<br>
&gt; we have right now in roms/Makefile to .gitlab-ci.d/, then publish the<=
br>
&gt; firmware binaries as build artifacts or gitlab pages.<br>
&gt; <br>
&gt; When done just remove the pre-build binaries from git and add a helper=
<br>
&gt; script to fetch firmware binaries from gitlab instead.<br>
&gt; <br>
&gt; &gt; QEMU mirrors firmware sources on GitLab too. We&#39;re able to pr=
ovide the<br>
&gt; &gt; same level of download availability on our mirror firmware repos =
as for<br>
&gt; &gt; the main qemu.git repo.<br>
&gt; <br>
&gt; I think enabling CI for the firmware mirrors should work given that it=
<br>
&gt; is possible to specify a custom CI/CD configuration file, i.e. use<br>
&gt; something like<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/qemu-project/qemu/.gitlab-ci.d/firmware/seabios.ym=
l<br>
&gt; <br>
&gt; or<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/qemu-project/qemu-firmware/seabios.yml<br>
&gt; <br>
&gt; as config file for the <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/qemu-project/seabios/<br>
&gt; <br>
&gt; mirror.=C2=A0 Then we can publish binaries using gitlab pages at<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://qemu-project.gitlab.io/seabios/"=
 rel=3D"noreferrer" target=3D"_blank">https://qemu-project.gitlab.io/seabio=
s/</a><br>
&gt; <br>
&gt; That way we also don&#39;t need the roms/ submodules any more, i.e. we=
<br>
&gt; can remove both sources and binaries for the firmware from the<br>
&gt; release tarballs.<br>
<br>
Thanks!<br>
<br>
For developer convenience it would be nice to avoid manual steps after<br>
git clone qemu.git. Maybe ./configure should check for firmware blobs<br>
and automatically download them. There could be a ./configure<br>
--disable-firmware-download option that distros can use to skip the<br>
download when building everything from source.<br></blockquote><div><br></d=
iv><div>One thing to keep in mind about the downstream consumers: Many</div=
><div>of them have two phases to their build process that run asynchronousl=
y</div><div>to each other. There is a fetch phase that grabs everything, an=
d a build</div><div>phase that builds the binaries. The second phase may no=
t have access</div><div>to the internet for a variety of reasons (these day=
s being a security</div><div>measure, for good or ill). Please make sure th=
at any such plans</div><div>allow for this model.</div><div><br></div><div>=
Today, that&#39;s all dealt with by grabbing tarballs from github which</di=
v><div>is how the submodules are dealt with. So long as the images</div><di=
v>had well known names, and could be fetched with the normal</div><div>wget=
/cgit/fetch programs, that would suffice. Requiring use of</div><div>some w=
eird bespoke script would cause friction for the downstreams</div><div>usin=
g qemu.</div><div><br></div><div>So while I&#39;m all for making things a l=
ittle more independent,</div><div>let&#39;s not do it in a way that makes l=
ife difficult for downstreams.</div><div>There are more there than just a c=
ouple of big distro builders.</div><div><br></div><div>Warner</div><div><br=
></div></div></div>

--000000000000e45d0505ce148b6d--

