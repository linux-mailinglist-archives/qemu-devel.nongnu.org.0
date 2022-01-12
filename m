Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692BC48C56D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:03:40 +0100 (CET)
Received: from localhost ([::1]:46114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eDz-0005TZ-5a
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:03:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7dUQ-0002B1-0O
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:16:36 -0500
Received: from [2607:f8b0:4864:20::102f] (port=39502
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7dUJ-0003jY-DJ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:16:32 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso11975637pjm.4
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yj4qvB3fTxEPiJygxWoEt8ATLcsuWldNnvOhfPkfjSk=;
 b=hpsM4qRYCjzgkbkp7YALb4wcYFOEuwzQIiSTsCeK1W7mktjQlgwqjt7fAtzDnfNBTi
 ijN75nEYDT3c7MDxenycmxBr48rI7tSJ+hCamFOpHa+GJmdkz29wafE87DJozYVuvcCX
 jZ7HsZhGcqFgmIXVjK7NaJHy9GudftpIguOlcPTNDqkbAYaJTdUikoO/C915CePq7k1o
 WnRbx3j3v+6WiLJ52aB3QsvW2oyh56MUXEv/+829vG8EMtUuTvW37kWHWLdPAfoUgVxL
 Pw3zeII1yOkS/+u0ZvmU4MSrIWUOQcrty4VAFxACgglLBxMSZqI9kIA7xt6mIxof/QPy
 ygIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yj4qvB3fTxEPiJygxWoEt8ATLcsuWldNnvOhfPkfjSk=;
 b=JVbVC4oOwn+BHp8r5GfDig/Q89U3XW8e/8fpxTMhtd4h+6VMBuTJVnRW4UTeImnSKZ
 xTZYET9VUqpvR2VA9m9EHgpTV2hGeJ+CmCoC6K/YJE+CntOnBM+IcQzezQT2SsI8NkR6
 LAX0apkwclRu8bUwuml7vqeZ93F22ANjmPv6ey8kxo7Ys13UCyCGvbq58DozKtmNPY2F
 BIuvrm9fOZAzeFnyJvifgj/is/gQJqAey4bSc06g9TfcErjZtAoZPqhqxho8VQPQQTAX
 thbb3GIdLn1g34IziOwQLnehxOsaUowl4m46PAX32pFkiFcei5Oj2e0MQNkp39gtZ+hv
 9XWA==
X-Gm-Message-State: AOAM530Z6ldjeSrZnOtxOMbXEZv0vYMHq2w/8Au0V0HlXTr3WaddctM+
 hlXchYDRSApHQf4oXooJSHgDc8ZnJE5+rKDsmB8=
X-Google-Smtp-Source: ABdhPJzjiETWGMobxQoo0X7EKIVKPT8zerg7mh0C4WkE7xzyfhzxDc8fV87i71Pu8e/Pfc99kQJBQ3+FUqDz2poJXSg=
X-Received: by 2002:a17:902:e8c2:b0:149:fdf8:270 with SMTP id
 v2-20020a170902e8c200b00149fdf80270mr9636107plg.167.1641993385800; Wed, 12
 Jan 2022 05:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20220110034000.20221-1-jasowang@redhat.com>
 <CAFEAcA8qJM1ekUTBQ3eyBCBi6Avk1H=MqP0vMmFdJo-MgoEUAQ@mail.gmail.com>
 <CACGkMEvdFJCY7GBu+0cMBVVfdDN+9+H14QvF9R0LZyo74ZDSag@mail.gmail.com>
 <CADO9X9Q745CTFWA+spCfzvaC03+xYR63mbSnARUEP6xYaAefJA@mail.gmail.com>
 <0a747f8c-6839-9265-e0a4-dfa42cb05d03@redhat.com>
 <Yd5+7P0Hazp+FvSt@roolebo.dev>
 <CACGkMEs7XxPRgiMFk_-gTWfPUwTMLy72MqEL7RMNfh3Cr39b3A@mail.gmail.com>
In-Reply-To: <CACGkMEs7XxPRgiMFk_-gTWfPUwTMLy72MqEL7RMNfh3Cr39b3A@mail.gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Wed, 12 Jan 2022 16:16:14 +0300
Message-ID: <CADO9X9T=i7bQBB8rNB92+CBA_93_J9KWZCmtQnSZXQwggzOKjQ@mail.gmail.com>
Subject: Re: [PULL 00/13] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007bf9f605d562608c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pj1-x102f.google.com
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
Cc: Roman Bolshakov <roman@roolebo.dev>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007bf9f605d562608c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 12 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 10:51, Jason Wang =
<jasowang@redhat.com>:

> On Wed, Jan 12, 2022 at 3:10 PM Roman Bolshakov <roman@roolebo.dev> wrote=
:
> >
> > On Wed, Jan 12, 2022 at 01:39:28PM +0800, Jason Wang wrote:
> > >
> > > =E5=9C=A8 2022/1/12 =E4=B8=8A=E5=8D=886:02, Vladislav Yaroshchuk =E5=
=86=99=E9=81=93:
> > > >
> > > >
> > > > =D0=B2=D1=82, 11 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3., 5:10 AM Jason Wa=
ng <jasowang@redhat.com>:
> > > >
> > > >     On Tue, Jan 11, 2022 at 12:49 AM Peter Maydell
> > > >     <peter.maydell@linaro.org> wrote:
> > > >     >
> > > >     > On Mon, 10 Jan 2022 at 03:40, Jason Wang <jasowang@redhat.com=
>
> > > >     wrote:
> > > >     > >
> > > >     > > The following changes since commit
> > > >     df722e33d5da26ea8604500ca8f509245a0ea524:
> > > >     > >
> > > >     > >   Merge tag 'bsd-user-arm-pull-request' of
> > > >     gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)
> > > >     > >
> > > >     > > are available in the git repository at:
> > > >     > >
> > > >     > > https://github.com/jasowang/qemu.git tags/net-pull-request
> > > >     > >
> > > >     > > for you to fetch changes up to
> > > >     5136cc6d3b8b74f4fa572f0874656947a401330e:
> > > >     > >
> > > >     > >   net/vmnet: update MAINTAINERS list (2022-01-10 11:30:55
> +0800)
> > > >     > >
> > > >     > >
> ----------------------------------------------------------------
> > > >     > >
> > > >     > >
> ----------------------------------------------------------------
> > > >     >
> > > >     > Fails to build on OSX Catalina:
> > > >     >
> > > >     > ../../net/vmnet-common.m:165:10: error: use of undeclared
> identifier
> > > >     > 'VMNET_SHARING_SERVICE_BUSY'
> > > >     >     case VMNET_SHARING_SERVICE_BUSY:
> > > >     >          ^
> > > >     >
> > > >     > This constant only got added in macOS 11.0. I guess that
> technically
> > > >     > our supported-platforms policy only requires us to support 11
> > > >     (Big Sur)
> > > >     > and 12 (Monterey) at this point, but it would be nice to stil=
l
> > > >     be able
> > > >     > to build on Catalina (10.15).
> > > >
> > > >     Yes, it was only supported by the vmnet framework starting from
> > > >     Catalyst according to
> > > >     https://developer.apple.com/documentation/vmnet?language=3Dobjc=
.
> > > >
> > > >
> > > > Yes, there are some symbols from macOS >=3D 11.0 new backend
> > > > uses, not only this one, ex. vmnet_enable_isolation_key:
> > > >
> https://developer.apple.com/documentation/vmnet/vmnet_enable_isolation_ke=
y
> > > >
> > > >     >
> > > >     > (Personally I would like Catalina still to work at least for =
a
> > > >     little
> > > >     > while, because my x86 Mac is old enough that it is not
> supported by
> > > >     > Big Sur. I'll have to dump it once Apple stops doing security
> > > >     support
> > > >     > for Catalina, but they haven't done that quite yet.)
> > > >
> > > >
> > > > Sure, broken builds on old macOSes are bad. For this case I think
> > > > it's enough to disable vmnet for macOS < 11.0 with a probe while
> > > > configure build step. Especially given that Apple supports ~three
> > > > latest macOS versions, support for Catalina is expected to end
> > > > in 2022, when QEMU releases 7.0.
> > >
> > >
> > > That should be fine.
> > >
> >
> > I agree with Peter on this,
> >
> > There's a lot of hardware running with Catalina. I think it's useful to
> > support it a little longer.
>
> Right and Vladislav have disabled vmnet on the old versions.
>
> Thanks
>
>
Roman requested vmnet support for Catalina (10.15) also:
https://patchew.org/QEMU/20220111211422.21789-1-yaroshchuk2000@gmail.com/

After some thought I also found it important to support 10.15.
I've found a free hour to update patches and submit as v11
(still not displayed on Patchew for some reason).

Tested on Catalina 10.15 and Big Sur 11.5.
Built with no errors under Ubuntu 20.04 5.4.0-94-generic.

>
> > Regards,
> > Roman
> >
> > >
> > > >
> > > > If this workaround is not suitable and it's required to support vmn=
et
> > > > in Catalina 10.15 with a subset of available features, it can be
> done.
> > > > But I'll be ready to handle this in approximately two-three weeks
> only.
> > > >
> > > >     Sure, Vladislav please fix this and send a new version.
> > > >
> > > >
> > > > Quick fix as described above is available in v10:
> > > >
> https://patchew.org/QEMU/20220111211422.21789-1-yaroshchuk2000@gmail.com/
> > >
> > >
> > > Have you got chance to test that for macOS < 11.0?
> > >
> > > Thanks
> > >
> > >
> > > >     Thanks
> > > >
> > > >     >
> > > >     > -- PMM
> > > >     >
> > > >
> > > >
> > > >
> > > >
> > > > --
> > > > Best Regards,
> > > >
> > > > Vladislav Yaroshchuk
> > >
> > >
> >
>
>

--=20
Best Regards,

Vladislav Yaroshchuk

--0000000000007bf9f605d562608c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 12 =D1=8F=D0=BD=D0=B2. 2022=
 =D0=B3. =D0=B2 10:51, Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com=
">jasowang@redhat.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Wed, Jan 12, 2022 at 3:10 PM Roman Bolshakov &lt;<a href=
=3D"mailto:roman@roolebo.dev" target=3D"_blank">roman@roolebo.dev</a>&gt; w=
rote:<br>
&gt;<br>
&gt; On Wed, Jan 12, 2022 at 01:39:28PM +0800, Jason Wang wrote:<br>
&gt; &gt;<br>
&gt; &gt; =E5=9C=A8 2022/1/12 =E4=B8=8A=E5=8D=886:02, Vladislav Yaroshchuk =
=E5=86=99=E9=81=93:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =D0=B2=D1=82, 11 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3., 5:10 AM J=
ason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jaso=
wang@redhat.com</a>&gt;:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0On Tue, Jan 11, 2022 at 12:49 AM Peter Ma=
ydell<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; On Mon, 10 Jan 2022 at 03:40, Jason =
Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang@=
redhat.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; The following changes since com=
mit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0df722e33d5da26ea8604500ca8f509245a0ea524:=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0Merge tag &#39;bsd-=
user-arm-pull-request&#39; of<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0gitlab.com:bsdimp/qemu into staging (2022=
-01-08 09:37:59 -0800)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; are available in the git reposi=
tory at:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; <a href=3D"https://github.com/j=
asowang/qemu.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/j=
asowang/qemu.git</a> tags/net-pull-request<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; for you to fetch changes up to<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05136cc6d3b8b74f4fa572f0874656947a401330e:=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0net/vmnet: update M=
AINTAINERS list (2022-01-10 11:30:55 +0800)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; -------------------------------=
---------------------------------<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; -------------------------------=
---------------------------------<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Fails to build on OSX Catalina:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; ../../net/vmnet-common.m:165:10: err=
or: use of undeclared identifier<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; &#39;VMNET_SHARING_SERVICE_BUSY&#39;=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0case VMNET_SHARIN=
G_SERVICE_BUSY:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; This constant only got added in macO=
S 11.0. I guess that technically<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; our supported-platforms policy only =
requires us to support 11<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0(Big Sur)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; and 12 (Monterey) at this point, but=
 it would be nice to still<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be able<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; to build on Catalina (10.15).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Yes, it was only supported by the vmnet f=
ramework starting from<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Catalyst according to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://developer.apple.com/do=
cumentation/vmnet?language=3Dobjc" rel=3D"noreferrer" target=3D"_blank">htt=
ps://developer.apple.com/documentation/vmnet?language=3Dobjc</a>.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yes, there are some symbols from macOS &gt;=3D 11.0 new back=
end<br>
&gt; &gt; &gt; uses, not only this one, ex. vmnet_enable_isolation_key:<br>
&gt; &gt; &gt; <a href=3D"https://developer.apple.com/documentation/vmnet/v=
mnet_enable_isolation_key" rel=3D"noreferrer" target=3D"_blank">https://dev=
eloper.apple.com/documentation/vmnet/vmnet_enable_isolation_key</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; (Personally I would like Catalina st=
ill to work at least for a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0little<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; while, because my x86 Mac is old eno=
ugh that it is not supported by<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Big Sur. I&#39;ll have to dump it on=
ce Apple stops doing security<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; for Catalina, but they haven&#39;t d=
one that quite yet.)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sure, broken builds on old macOSes are bad. For this case I =
think<br>
&gt; &gt; &gt; it&#39;s enough to disable vmnet for macOS &lt; 11.0 with a =
probe while<br>
&gt; &gt; &gt; configure build step. Especially given that Apple supports ~=
three<br>
&gt; &gt; &gt; latest macOS versions, support for Catalina is expected to e=
nd<br>
&gt; &gt; &gt; in 2022, when QEMU releases 7.0.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; That should be fine.<br>
&gt; &gt;<br>
&gt;<br>
&gt; I agree with Peter on this,<br>
&gt;<br>
&gt; There&#39;s a lot of hardware running with Catalina. I think it&#39;s =
useful to<br>
&gt; support it a little longer.<br>
<br>
Right and Vladislav have disabled vmnet on the old versions.<br>
<br>
Thanks<br>
<br></blockquote><div><br></div><div>Roman requested vmnet support for Cata=
lina (10.15) also:</div><div><a href=3D"https://patchew.org/QEMU/2022011121=
1422.21789-1-yaroshchuk2000@gmail.com/">https://patchew.org/QEMU/2022011121=
1422.21789-1-yaroshchuk2000@gmail.com/</a></div><div><br></div><div>After s=
ome thought I also found it important to support 10.15.</div><div>I&#39;ve =
found a free hour to update patches and submit=C2=A0as v11</div><div>(still=
 not displayed on Patchew=C2=A0for some reason).</div><div><br></div><div>T=
ested on Catalina 10.15 and Big Sur 11.5.</div><div>Built with no errors un=
der Ubuntu 20.04 5.4.0-94-generic.</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt;<br>
&gt; Regards,<br>
&gt; Roman<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If this workaround is not suitable and it&#39;s required to =
support vmnet<br>
&gt; &gt; &gt; in Catalina 10.15 with a subset of available features, it ca=
n be done.<br>
&gt; &gt; &gt; But I&#39;ll be ready to handle this in approximately two-th=
ree weeks only.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Sure, Vladislav please fix this and send =
a new version.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Quick fix as described above is available in v10:<br>
&gt; &gt; &gt; <a href=3D"https://patchew.org/QEMU/20220111211422.21789-1-y=
aroshchuk2000@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://patc=
hew.org/QEMU/20220111211422.21789-1-yaroshchuk2000@gmail.com/</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Have you got chance to test that for macOS &lt; 11.0?<br>
&gt; &gt;<br>
&gt; &gt; Thanks<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; -- PMM<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Best Regards,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Vladislav Yaroshchuk<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></div></div>=
</div>

--0000000000007bf9f605d562608c--

