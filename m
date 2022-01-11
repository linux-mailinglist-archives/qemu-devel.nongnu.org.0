Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433E448BA75
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 23:05:42 +0100 (CET)
Received: from localhost ([::1]:40168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7PGu-0000H1-Rd
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 17:05:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7PEP-0007wM-PB
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 17:03:06 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37692
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7PEK-0001sQ-3N
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 17:03:03 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so7924807pjj.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 14:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4xwKh6iP4t0veOHU5bNziIUtQpkNv9SXQrmNqCWv240=;
 b=CR8Zr6CKBRan79zqy7gEdp6aD1IGRP1NILetexyePQucxC1pzU/LiQBmrnftrYOtPz
 nbInmhLp/ey487IXdcx6vHcFtHkLY/S2guJI5PKRhn/JHjpzqzTFz1EO9l8N7oVQs0oI
 Kd92dNI4fdCuE1YWmaL56dqm+bIg+EVDv7wjHVVkNQWJs7SpbgDKwr72KjCLnGpFNb9l
 +pkJRHjhDPdpdW+Vl1gOj58hQlFDFjZRs+531EgNR0OBIuzxfvWiYZ9WLjND/+G459Vo
 ywrpDA9+kLSe5xvRssNHvcE61g1jXdswywE5BWI82kCX2+qGzmu/5x2bf6RqBTBvDuLr
 lxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4xwKh6iP4t0veOHU5bNziIUtQpkNv9SXQrmNqCWv240=;
 b=AwdI8gDwJTUQk7Jr2ME5azU83WNumnjFJH+tyeXR6WGmUK3+vMLDVKoQz2fRxodTGw
 Q77uq8rdv3eI3CNgy3hnShMdKp4sEx47PR5kbaInzmbrBXw9PWh/xBOBkwQHbnovmU5K
 +dnANu4b7hVIRLwhsDpSWQ7wZkIZ5Hovd+oOrQVINTz9FMZmB4eO/druizGB7Lo6rlEo
 Szt6EFTVBuW7RAgbWvozZu5uWcgrM+VivJyD+BCpTsnZnqE5TD40fnn0gG3qTQ90ekLb
 CRIJEn883Em0k7ciN4XsoeFbSDoDX/Od4R3TeoCS2IhXE4W6KLTkbJPwioWG14gKbLd7
 fj6Q==
X-Gm-Message-State: AOAM5329tHG4p1sQjfknCzwTf3mMekVviPZN8tZOIDTMPcp37E+ru5tb
 FHOqOBij3H1R5FHWIlgu7w96ApS0OBeexDNeKx8=
X-Google-Smtp-Source: ABdhPJzMcU8aXd3mH4MTL6VuLxY+JPuyPbeyD9SLLPHwT3Gd7EQWv+QEqfYk7yw6MQeuqkFoqomWOxtxvPTZTYUGfvg=
X-Received: by 2002:a05:6a00:b90:b0:4ba:b715:8fe7 with SMTP id
 g16-20020a056a000b9000b004bab7158fe7mr6383440pfj.77.1641938578820; Tue, 11
 Jan 2022 14:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20220110034000.20221-1-jasowang@redhat.com>
 <CAFEAcA8qJM1ekUTBQ3eyBCBi6Avk1H=MqP0vMmFdJo-MgoEUAQ@mail.gmail.com>
 <CACGkMEvdFJCY7GBu+0cMBVVfdDN+9+H14QvF9R0LZyo74ZDSag@mail.gmail.com>
In-Reply-To: <CACGkMEvdFJCY7GBu+0cMBVVfdDN+9+H14QvF9R0LZyo74ZDSag@mail.gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Wed, 12 Jan 2022 01:02:47 +0300
Message-ID: <CADO9X9Q745CTFWA+spCfzvaC03+xYR63mbSnARUEP6xYaAefJA@mail.gmail.com>
Subject: Re: [PULL 00/13] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bbd30605d5559dd1"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bbd30605d5559dd1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 11 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3., 5:10 AM Jason Wang <jaso=
wang@redhat.com>:

> On Tue, Jan 11, 2022 at 12:49 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Mon, 10 Jan 2022 at 03:40, Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > The following changes since commit
> df722e33d5da26ea8604500ca8f509245a0ea524:
> > >
> > >   Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu
> into staging (2022-01-08 09:37:59 -0800)
> > >
> > > are available in the git repository at:
> > >
> > >   https://github.com/jasowang/qemu.git tags/net-pull-request
> > >
> > > for you to fetch changes up to
> 5136cc6d3b8b74f4fa572f0874656947a401330e:
> > >
> > >   net/vmnet: update MAINTAINERS list (2022-01-10 11:30:55 +0800)
> > >
> > > ----------------------------------------------------------------
> > >
> > > ----------------------------------------------------------------
> >
> > Fails to build on OSX Catalina:
> >
> > ../../net/vmnet-common.m:165:10: error: use of undeclared identifier
> > 'VMNET_SHARING_SERVICE_BUSY'
> >     case VMNET_SHARING_SERVICE_BUSY:
> >          ^
> >
> > This constant only got added in macOS 11.0. I guess that technically
> > our supported-platforms policy only requires us to support 11 (Big Sur)
> > and 12 (Monterey) at this point, but it would be nice to still be able
> > to build on Catalina (10.15).
>
Yes, it was only supported by the vmnet framework starting from
> Catalyst according to
> https://developer.apple.com/documentation/vmnet?language=3Dobjc.
>
>
Yes, there are some symbols from macOS >=3D 11.0 new backend
uses, not only this one, ex. vmnet_enable_isolation_key:
https://developer.apple.com/documentation/vmnet/vmnet_enable_isolation_key

>
> > (Personally I would like Catalina still to work at least for a little
> > while, because my x86 Mac is old enough that it is not supported by
> > Big Sur. I'll have to dump it once Apple stops doing security support
> > for Catalina, but they haven't done that quite yet.)
>
>
Sure, broken builds on old macOSes are bad. For this case I think
it's enough to disable vmnet for macOS < 11.0 with a probe while
configure build step. Especially given that Apple supports ~three
latest macOS versions, support for Catalina is expected to end
in 2022, when QEMU releases 7.0.

If this workaround is not suitable and it's required to support vmnet
in Catalina 10.15 with a subset of available features, it can be done.
But I'll be ready to handle this in approximately two-three weeks only.


> Sure, Vladislav please fix this and send a new version.
>
>
Quick fix as described above is available in v10:
https://patchew.org/QEMU/20220111211422.21789-1-yaroshchuk2000@gmail.com/

> Thanks
>
> >
> > -- PMM
> >
>
>
>

--=20
Best Regards,

Vladislav Yaroshchuk

--000000000000bbd30605d5559dd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><br><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 11 =D1=8F=D0=BD=D0=B2. 2022 =
=D0=B3., 5:10 AM Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" targ=
et=3D"_blank">jasowang@redhat.com</a>&gt;:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Tue, Jan 11, 2022 at 12:49 AM Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org" rel=3D"noreferrer" target=3D"_blank">peter.mayd=
ell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 10 Jan 2022 at 03:40, Jason Wang &lt;<a href=3D"mailto:jasowan=
g@redhat.com" rel=3D"noreferrer" target=3D"_blank">jasowang@redhat.com</a>&=
gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The following changes since commit df722e33d5da26ea8604500ca8f509=
245a0ea524:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Merge tag &#39;bsd-user-arm-pull-request&#39; of gitl=
ab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)<br>
&gt; &gt;<br>
&gt; &gt; are available in the git repository at:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://github.com/jasowang/qemu.git" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/jasowang/qe=
mu.git</a> tags/net-pull-request<br>
&gt; &gt;<br>
&gt; &gt; for you to fetch changes up to 5136cc6d3b8b74f4fa572f0874656947a4=
01330e:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0net/vmnet: update MAINTAINERS list (2022-01-10 11:30:=
55 +0800)<br>
&gt; &gt;<br>
&gt; &gt; ----------------------------------------------------------------<=
br>
&gt; &gt;<br>
&gt; &gt; ----------------------------------------------------------------<=
br>
&gt;<br>
&gt; Fails to build on OSX Catalina:<br>
&gt;<br>
&gt; ../../net/vmnet-common.m:165:10: error: use of undeclared identifier<b=
r>
&gt; &#39;VMNET_SHARING_SERVICE_BUSY&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0case VMNET_SHARING_SERVICE_BUSY:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt;<br>
&gt; This constant only got added in macOS 11.0. I guess that technically<b=
r>
&gt; our supported-platforms policy only requires us to support 11 (Big Sur=
)<br>
&gt; and 12 (Monterey) at this point, but it would be nice to still be able=
<br>
&gt; to build on Catalina (10.15).=C2=A0<br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
Yes, it was only supported by the vmnet framework starting from<br>
Catalyst according to<br>
<a href=3D"https://developer.apple.com/documentation/vmnet?language=3Dobjc"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://developer.apple.co=
m/documentation/vmnet?language=3Dobjc</a>.<br>
<br></blockquote><div><br></div><div>Yes, there are some symbols from macOS=
 &gt;=3D 11.0 new backend</div><div>uses, not only this one, ex. vmnet_enab=
le_isolation_key:<br><a href=3D"https://developer.apple.com/documentation/v=
mnet/vmnet_enable_isolation_key">https://developer.apple.com/documentation/=
vmnet/vmnet_enable_isolation_key</a><br></div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
&gt;<br>
&gt; (Personally I would like Catalina still to work at least for a little<=
br>
&gt; while, because my x86 Mac is old enough that it is not supported by<br=
>
&gt; Big Sur. I&#39;ll have to dump it once Apple stops doing security supp=
ort<br>
&gt; for Catalina, but they haven&#39;t done that quite yet.)<br>
<br></blockquote><div><br></div><div>Sure, broken builds on old macOSes are=
 bad. For this case I think=C2=A0</div><div>it&#39;s enough to disable vmne=
t for macOS &lt; 11.0 with a probe while=C2=A0</div><div>configure build st=
ep. Especially given that Apple supports ~three=C2=A0</div><div>latest macO=
S versions, support for Catalina is expected to end=C2=A0</div><div>in 2022=
, when QEMU releases 7.0.</div><div><br></div><div>If this workaround is no=
t suitable and it&#39;s required to support vmnet</div><div>in Catalina 10.=
15 with a subset of available features, it can be done.</div><div>But I&#39=
;ll be ready to handle this in approximately two-three weeks only.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
Sure, Vladislav please fix this and send a new version.<br>
<br></blockquote><div><br></div><div>Quick fix as described above is availa=
ble in v10:<br><a href=3D"https://patchew.org/QEMU/20220111211422.21789-1-y=
aroshchuk2000@gmail.com/">https://patchew.org/QEMU/20220111211422.21789-1-y=
aroshchuk2000@gmail.com/</a></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks<br>
<br>
&gt;<br>
&gt; -- PMM<br>
&gt;<br>
<br><br></blockquote><div><br></div></div></div><div><br></div>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div><=
/div></div></div>

--000000000000bbd30605d5559dd1--

