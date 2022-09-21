Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B55C00F1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:18:50 +0200 (CEST)
Received: from localhost ([::1]:50726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1Uu-0000Mi-Dr
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ob0mf-0005Ah-0g
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:33:05 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:39597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ob0mc-0001bM-GV
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:33:04 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id t26so3274909vkk.6
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=TjBLR4HOR4dxzbKsjNMwcJxJp1X9H/Gyq76Qg6lk8lU=;
 b=3FHoimCicyjc+q0iEuD/XfQ6B/VCXcm3SlCtNc7hQt40SfyCrDmXHnXDk1czNSjyc6
 5cD9fisXypRpGJXyIS1xGx8j1UsvFgCgZllIcM4yh8X+WyPqHV+LmjhSHDrTj5mbn8EU
 vNYp3LJt8TmQLndBAFS4wWQmsGB1e82G2IIqXvDsVX6TFCAnaXR9gXqAGqV5aJxJO5tG
 q9BkWwHUc2caAZsKJZoyrY5W9EmnsBaASeYeqiP3sw8g9OEtDnSekThmZiaRBMv/eazs
 5WfsUaCnVEFGqaRi8Hx0kbNE8ASG/posoXfZWcKQC2HOlS16XJnYex0ud7taDOXP1654
 vyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=TjBLR4HOR4dxzbKsjNMwcJxJp1X9H/Gyq76Qg6lk8lU=;
 b=4iUxGaKlvSeXOGt4LZSAyXQxq8X9RdFEmuNPwp+x169FRn0dn/tHpxHkeF1ke+ER6D
 mnAFZn419mzgC/Li0aGckay8j/aR0RAqywDywf0kkXWRQwJO7sdEn3z3qAxwWGGknolD
 7OvufydtoIr3eBP4E6dMcJ05W/IoAVj6zHDIH04twn4c1GgtIzmtgiKgUyKymnqjeb2p
 v18KoC9WjFnQ6/cO+u0BdwpvK3UBTH3WYLoDoCp+NZEKkyUGziOTcLs22sO29TeLrTvv
 GUrwFKQCRcUG0Xq3KZZkvC6n1prkS4ysW8Oik8edinKUvBomeoP+/Kscn45uJQQ5iNca
 a5Mg==
X-Gm-Message-State: ACrzQf0PjePY+eQRuUOKJqCFml9ARh2dVYN7CCm27kWK85FwhtIv99Pg
 790zpa2hAiZoVn+r7vtQVU29wTkM8FFYh5nLIAbKWQ==
X-Google-Smtp-Source: AMsMyM7pAWGrlRoIxsWzF2CZLMVApTUMVmpkv7EgXLhELk20mHa3OMzradB2O8OJE+4oEQ5WrN3BkwmGcwnPwlz63I4=
X-Received: by 2002:a1f:20d0:0:b0:39e:befa:fb4b with SMTP id
 g199-20020a1f20d0000000b0039ebefafb4bmr10217122vkg.7.1663770770967; Wed, 21
 Sep 2022 07:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <b403c8e4-3788-7ba1-a038-3a71fa0bc7c6@redhat.com>
 <Yyl4EO0L5h02HOLN@redhat.com>
 <ed402176-df96-dff2-869b-a3326e6314ea@redhat.com>
 <Yyl5yRMxGAEA7K05@redhat.com>
 <CANCZdfr6HWx8M8YzWDv2sqi96z+HyLMSGtzTUnTF_XbfNzcs4g@mail.gmail.com>
 <Yyq5mhBi10bEw+g+@redhat.com>
In-Reply-To: <Yyq5mhBi10bEw+g+@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 21 Sep 2022 08:32:39 -0600
Message-ID: <CANCZdfrKyWgeVXV2KzngaRA3otierjzGzcDy2bg_GmkqR_QTkQ@mail.gmail.com>
Subject: Re: QEMU's FreeBSD 13 CI job is failing
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Brad Smith <brad@comstyle.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d0b37705e930d190"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d0b37705e930d190
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2022 at 1:13 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Tue, Sep 20, 2022 at 02:21:46PM -0600, Warner Losh wrote:
> > On Tue, Sep 20, 2022 at 2:57 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> > > On Tue, Sep 20, 2022 at 10:23:56AM +0200, Thomas Huth wrote:
> > > > On 20/09/2022 10.21, Daniel P. Berrang=C3=A9 wrote:
> > > > > On Tue, Sep 20, 2022 at 08:44:27AM +0200, Thomas Huth wrote:
> > > > > >
> > > > > > Seen here for example:
> > > > > >
> > > > > > https://gitlab.com/qemu-project/qemu/-/jobs/3050165356#L2543
> > > > > >
> > > > > > ld-elf.so.1: /lib/libc.so.7: version FBSD_1.7 required by
> > > > > > /usr/local/lib/libpython3.9.so.1.0 not found
> > > > > > ERROR: Cannot use '/usr/local/bin/python3', Python >=3D 3.6 is
> > > required.
> > > > > >
> > > > > > ... looks like the Python binary is not working anymore? Does
> > > anybody know
> > > > > > what happened here?
> > > > >
> > > > > FreeBSD ports is only guaranteed to work with latest minor releas=
e
> > > > > base image. The python binary recently started relying on symbols
> > > > > in the 13.1 base image, and we're using 13.0.
> > > > >
> > > > > I updated lcitool last week to pick 13.1, so we just need a refre=
sh
> > > > > on the QEMU side to pick this up.
> > > >
> > > > OK ... Alex, IIRC you have a patch queued to update the files that
> are
> > > > refreshed by lcitool ... does that already contain the update for
> > > FreeBSD,
> > > > too?
> > >
> > > Oh actually, I'm forgetting that QEMU doesn't use the 'lcitool
> manifest'
> > > command for auto-generating the gitlab-ci.yml file. In QEMU's case ju=
st
> > > manually edit .gitlab-ci.d/cirrus.yml to change
> > >
> > >     CIRRUS_VM_IMAGE_NAME: freebsd-13-0
> > >
> >
> > FreeBSD's support policy is that we EOL minor dot releases a few months
> > after
> > the next minor release is final. Part of that process involves moving t=
he
> > build
> > of packages to that new minor version (which is what's not guaranteed t=
o
> > work
> > on older versions... only old binaries on new versions is guaranteed)..=
.
> > And that's
> > the problem that was hit here.
>
> It would be nice if something in the ports tool / packages was
> able to report the incompatibility at time of install, rather
> than leaving a later runtime failed.
>

Indeed. I've suggested it to the authors...  There's some technical issues
around this and the package format they need to work out.


> > I'll try to submit changes after the next minor release in that 'few
> month'
> > window
> > to update this in the future. In general, doing so would be the best fi=
t
> > with FreeBSD's
> > support model...  It's one of those things I didn't think of at the tim=
e,
> > but is obvious in
> > hindsight.
>
> Note, we're reliant on Cirrus CI actually publishing the new images
> for use. I've not previously checked before how quickly they publish
> them after FreeBSD does the upstream release, but anyway I go by what
> they list here:
>
>   https://cirrus-ci.org/guide/FreeBSD/


 Yea. They have been pretty good in the past about getting new images up
quickly after the release.

Warner

--000000000000d0b37705e930d190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 21, 2022 at 1:13 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, Sep 20, 2022 at 02:21:46PM -0600, Warner Losh wrote:<br>
&gt; On Tue, Sep 20, 2022 at 2:57 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Tue, Sep 20, 2022 at 10:23:56AM +0200, Thomas Huth wrote:<br>
&gt; &gt; &gt; On 20/09/2022 10.21, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; &gt; &gt; &gt; On Tue, Sep 20, 2022 at 08:44:27AM +0200, Thomas Huth w=
rote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Seen here for example:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/=
jobs/3050165356#L2543" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
com/qemu-project/qemu/-/jobs/3050165356#L2543</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; ld-elf.so.1: /lib/libc.so.7: version FBSD_1.7 requ=
ired by<br>
&gt; &gt; &gt; &gt; &gt; /usr/local/lib/libpython3.9.so.1.0 not found<br>
&gt; &gt; &gt; &gt; &gt; ERROR: Cannot use &#39;/usr/local/bin/python3&#39;=
, Python &gt;=3D 3.6 is<br>
&gt; &gt; required.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; ... looks like the Python binary is not working an=
ymore? Does<br>
&gt; &gt; anybody know<br>
&gt; &gt; &gt; &gt; &gt; what happened here?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; FreeBSD ports is only guaranteed to work with latest mi=
nor release<br>
&gt; &gt; &gt; &gt; base image. The python binary recently started relying =
on symbols<br>
&gt; &gt; &gt; &gt; in the 13.1 base image, and we&#39;re using 13.0.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I updated lcitool last week to pick 13.1, so we just ne=
ed a refresh<br>
&gt; &gt; &gt; &gt; on the QEMU side to pick this up.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; OK ... Alex, IIRC you have a patch queued to update the file=
s that are<br>
&gt; &gt; &gt; refreshed by lcitool ... does that already contain the updat=
e for<br>
&gt; &gt; FreeBSD,<br>
&gt; &gt; &gt; too?<br>
&gt; &gt;<br>
&gt; &gt; Oh actually, I&#39;m forgetting that QEMU doesn&#39;t use the &#3=
9;lcitool manifest&#39;<br>
&gt; &gt; command for auto-generating the gitlab-ci.yml file. In QEMU&#39;s=
 case just<br>
&gt; &gt; manually edit .gitlab-ci.d/cirrus.yml to change<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0CIRRUS_VM_IMAGE_NAME: freebsd-13-0<br>
&gt; &gt;<br>
&gt; <br>
&gt; FreeBSD&#39;s support policy is that we EOL minor dot releases a few m=
onths<br>
&gt; after<br>
&gt; the next minor release is final. Part of that process involves moving =
the<br>
&gt; build<br>
&gt; of packages to that new minor version (which is what&#39;s not guarant=
eed to<br>
&gt; work<br>
&gt; on older versions... only old binaries on new versions is guaranteed).=
..<br>
&gt; And that&#39;s<br>
&gt; the problem that was hit here.<br>
<br>
It would be nice if something in the ports tool / packages was<br>
able to report the incompatibility at time of install, rather<br>
than leaving a later runtime failed.<br></blockquote><div><br></div><div>In=
deed. I&#39;ve suggested it to the authors...=C2=A0 There&#39;s some techni=
cal issues</div><div>around this and the package format they need to work o=
ut.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt; I&#39;ll try to submit changes after the next minor release in that &#=
39;few month&#39;<br>
&gt; window<br>
&gt; to update this in the future. In general, doing so would be the best f=
it<br>
&gt; with FreeBSD&#39;s<br>
&gt; support model...=C2=A0 It&#39;s one of those things I didn&#39;t think=
 of at the time,<br>
&gt; but is obvious in<br>
&gt; hindsight.<br>
<br>
Note, we&#39;re reliant on Cirrus CI actually publishing the new images<br>
for use. I&#39;ve not previously checked before how quickly they publish<br=
>
them after FreeBSD does the upstream release, but anyway I go by what<br>
they list here:<br>
<br>
=C2=A0 <a href=3D"https://cirrus-ci.org/guide/FreeBSD/" rel=3D"noreferrer" =
target=3D"_blank">https://cirrus-ci.org/guide/FreeBSD/</a></blockquote><div=
><br></div><div>=C2=A0Yea. They have been pretty good in the past about get=
ting new images up</div><div>quickly after the release.</div><div><br></div=
><div>Warner</div></div></div>

--000000000000d0b37705e930d190--

