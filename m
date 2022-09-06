Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8BA5AEB6D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:23:53 +0200 (CEST)
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZUW-0002yh-1M
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVYcj-0003jc-5n
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:28:20 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVYcg-0008J5-ND
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:28:16 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b16so15173699edd.4
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZEESWRQBJGRz8zkPxL+H2JcpRMbqLYLwP/7cDiPw07E=;
 b=MIPWc4wuJwS2k6GSwUunUVKY09okYQOOSTQqmAtMXwkefeTaEwbcMud9Sq/wIg6YiG
 CHxV4fzp3hh5FCeWrujSljHY2M9VpVwRXlftX3DeZ07mPETxdJdMVUzDdaNeRt7tB3Wd
 UQyT2gzl4gnDRFDdlDXzl9ZqoaVR8XHocaWXHjlhgObL51j31QsbrdiQoBcWXICuylL1
 U23S1w0ouHJAej5etl0vDjmf00NjJ1823Mb9rv0RPkHXFwMl5TXO/QsyTG1jPvhpxf3D
 Biv7QocF/vU2Wzu/T7cxMY5poLz2PWU5ElcUscfc6T7cTvjCKu/jri8VhsdGoFjHpf4p
 D7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZEESWRQBJGRz8zkPxL+H2JcpRMbqLYLwP/7cDiPw07E=;
 b=lH5SoJchlZBNFvmbynvCalaJpHG5pc5cTWqBBIvSRWSkc2+wDDntt7si3qpSwDupbH
 fIsX4rhI9RwCLOPe7a+n/hGNyy2MFeE7MukBSqWq+6Yb8u4seaIPUyb2CIn7K/Mhjnym
 lp16AYcyHy+0uz0y8QBUO0kCFKaHQvsUWJRU9ocmk66Lo/zJYxn5x8WIyuG/aMLWXRpZ
 fK75C+2Fg7KdvsxKqHuL2rsWmMcr2ikiCDva06enpNVfZT/FLk8air4dThLwgHGv6YVU
 AAtK4zJfGmX0w0ML05Ve0/tEDpu6fkwp1+DodWgIw6yyl6F7ZjW7ZNGAMjFgQuLHaxls
 B/xg==
X-Gm-Message-State: ACgBeo0qVvFdwz56uOvKwocs9Q7byjJmwGlDIG969akJ7am3rx/IVKz1
 dHm2lljzaZ4JPLyLmN3GAbxItNJZYMECovhpdh+OLA==
X-Google-Smtp-Source: AA6agR7G+U32VJxL90ooXebYJsrhaKQwbBnh2gYLD8wlOgBnaKLfznEKQl3ui/YtjRR75fA4QVl8zCKJvcPDgZ+49yw=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr47850073edb.133.1662470892837; Tue, 06
 Sep 2022 06:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220711044032-mutt-send-email-mst@kernel.org>
 <CAFEAcA_KUh_Hmozw2KthwNoM2L9rnA18ttrk9GHHnJZ-X_M4yQ@mail.gmail.com>
 <YxdH/c9jx+3oVs9m@redhat.com>
In-Reply-To: <YxdH/c9jx+3oVs9m@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 6 Sep 2022 18:58:02 +0530
Message-ID: <CAARzgwz7XzNHik3zxJUNXOuO8HN59zhd8nZgMMt+OL22AiVXjw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Introduce new acpi/smbios python tests using
 biosbits
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, imammedo@redhat.com, 
 jsnow@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org, 
 thuth@redhat.com
Content-Type: multipart/alternative; boundary="000000000000047eec05e8022bc3"
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000047eec05e8022bc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 6, 2022 at 18:45 Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:

> On Thu, Jul 14, 2022 at 02:24:18PM +0100, Peter Maydell wrote:
> > On Mon, 11 Jul 2022 at 10:34, Michael S. Tsirkin <mst@redhat.com> wrote=
:
> > >
> > > On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:
> > > > Changelog:
> > > > v2:
> > > >  - a new class of python based tests introduced that is separate
> from avocado
> > > >    tests or qtests. Can be run by using "make check-pytest".
> > > >  - acpi biosbits tests are the first tests to use pytest environmen=
t.
> > > >  - bios bits tests now download the bits binary archives from a
> remote
> > > >    repository if they are not found locally. The test skips if
> download
> > > >    fails.
> > > >  - A new environment variable is introduced that can be passed by
> the tester
> > > >    to specify the location of the bits archives locally. test skips
> if the
> > > >    bits binaries are not found in that location.
> > > >  - if pip install of python module fails for whatever reaoson, the
> test skips.
> > > >  - misc code fixes including spell check of the README doc. README
> has been
> > > >    updated as well.
> > > >  - addition of SPDX license headers to bits test files.
> > > >  - update MAINTAINERS to reflect the new pytest test class.
> > > >
> > > > For biosbits repo:
> > > >  - added Dockerfile and build script. Made bios bits build on gcc 1=
1.
> > > >
> https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
> > > >
> https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.=
sh
> > > >    The build script generates the zip archive and tarball used by
> the test.
> > >
> > > So far so good, I think it's ok for a start. It's probably a good ide=
a
> > > to host the source on qemu.org. Peter - any objection to this?
> >
> > Dan was looking at v1 from the point of view of how we handle the
> > guest binary blobs for these tests -- I'd rather defer to him rather
> > than taking the time to get up to speed on the issue myself.
>
> Storing the *source* git repo for biosbits on gitlab.com/qemu-project
> is sensible, as that's what we've done for other 3rd party bits that
> we bundle/depend on git repo access for.


Great. Can you or Peter please create a git repo cloned from the official
bios bits repo please? You don=E2=80=99t have to clone mine. Please provide=
 me with
push access so that I can push fixes that I have made in order to build it.

>
>
> The above git repo, however, has extra branches that also store the
> binary builds, and I'm not convinced that is a good idea.
>
> I feel like the source git repo should have a .gitlab-ci.yml file
> that builds the binary and publishes it as an CI artifact. This
> lets us keep the binary outside of GIT, have a CI job that periodically
> refreshes the binary (eg so when the Ubuntu version that Dockerfile
> uses goes EOL we can use something else). The test can access the CI
> artifact directly.


I can look into this incrementally. There is already a dockerfile for the
build. I can look into pushing the yaml file as well.

As for the binaries yes we need to decide where to keep thrm. But one step
at a time .

As for your other complaints like making the test opt-in, I=E2=80=99ll look=
 into
addressing them in v3.

--000000000000047eec05e8022bc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 6, 2022 at 18:45 Daniel P. Berrang=C3=A9 &lt;<a=
 href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Thu, Jul 14, 2022 at 02:24:18PM +01=
00, Peter Maydell wrote:<br>
&gt; On Mon, 11 Jul 2022 at 10:34, Michael S. Tsirkin &lt;<a href=3D"mailto=
:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:<br>
&gt; &gt; &gt; Changelog:<br>
&gt; &gt; &gt; v2:<br>
&gt; &gt; &gt;=C2=A0 - a new class of python based tests introduced that is=
 separate from avocado<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 tests or qtests. Can be run by using &quot;make=
 check-pytest&quot;.<br>
&gt; &gt; &gt;=C2=A0 - acpi biosbits tests are the first tests to use pytes=
t environment.<br>
&gt; &gt; &gt;=C2=A0 - bios bits tests now download the bits binary archive=
s from a remote<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 repository if they are not found locally. The t=
est skips if download<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 fails.<br>
&gt; &gt; &gt;=C2=A0 - A new environment variable is introduced that can be=
 passed by the tester<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 to specify the location of the bits archives lo=
cally. test skips if the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 bits binaries are not found in that location.<b=
r>
&gt; &gt; &gt;=C2=A0 - if pip install of python module fails for whatever r=
eaoson, the test skips.<br>
&gt; &gt; &gt;=C2=A0 - misc code fixes including spell check of the README =
doc. README has been<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 updated as well.<br>
&gt; &gt; &gt;=C2=A0 - addition of SPDX license headers to bits test files.=
<br>
&gt; &gt; &gt;=C2=A0 - update MAINTAINERS to reflect the new pytest test cl=
ass.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For biosbits repo:<br>
&gt; &gt; &gt;=C2=A0 - added Dockerfile and build script. Made bios bits bu=
ild on gcc 11.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/ani-sinha/bits/bl=
ob/bits-qemu-logging/Dockerfile" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/ani-sinha/bits/bl=
ob/bits-qemu-logging/build-artifacts.sh" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts=
.sh</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 The build script generates the zip archive and =
tarball used by the test.<br>
&gt; &gt;<br>
&gt; &gt; So far so good, I think it&#39;s ok for a start. It&#39;s probabl=
y a good idea<br>
&gt; &gt; to host the source on <a href=3D"http://qemu.org" rel=3D"noreferr=
er" target=3D"_blank">qemu.org</a>. Peter - any objection to this?<br>
&gt; <br>
&gt; Dan was looking at v1 from the point of view of how we handle the<br>
&gt; guest binary blobs for these tests -- I&#39;d rather defer to him rath=
er<br>
&gt; than taking the time to get up to speed on the issue myself.<br>
<br>
Storing the *source* git repo for biosbits on <a href=3D"http://gitlab.com/=
qemu-project" rel=3D"noreferrer" target=3D"_blank">gitlab.com/qemu-project<=
/a><br>
is sensible, as that&#39;s what we&#39;ve done for other 3rd party bits tha=
t<br>
we bundle/depend on git repo access for.</blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Great. Can you or Peter please create a git repo cl=
oned from the official bios bits repo please? You don=E2=80=99t have to clo=
ne mine. Please provide me with push access so that I can push fixes that I=
 have made in order to build it.</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D=
"auto"><br>
<br>
The above git repo, however, has extra branches that also store the<br>
binary builds, and I&#39;m not convinced that is a good idea.<br>
<br>
I feel like the source git repo should have a .gitlab-ci.yml file<br>
that builds the binary and publishes it as an CI artifact. This<br>
lets us keep the binary outside of GIT, have a CI job that periodically<br>
refreshes the binary (eg so when the Ubuntu version that Dockerfile<br>
uses goes EOL we can use something else). The test can access the CI<br>
artifact directly.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">I can look into this incrementally. There is already a dockerfile for the=
 build. I can look into pushing the yaml file as well.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">As for the binaries yes we need to decide wh=
ere to keep thrm. But one step at a time .</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">As for your other complaints like making the test opt-in=
, I=E2=80=99ll look into addressing them in v3.=C2=A0</div><div dir=3D"auto=
"><br></div></div></div>

--000000000000047eec05e8022bc3--

