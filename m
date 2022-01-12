Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71648BE87
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 07:21:09 +0100 (CET)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7X0N-0006XY-NA
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 01:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7Wyv-0005pv-5S
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 01:19:37 -0500
Received: from [2607:f8b0:4864:20::102c] (port=44973
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7Wys-0000US-Um
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 01:19:36 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so2782060pji.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 22:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XaLraLMXGarbXtzLej7Jh5+dbXUsOWKt1g6tjE1Dqeo=;
 b=B1KDZtgrvxBvPJ4IE4rsfXMYGi3R4QOuOAhxFpNwVm0AVVbXt+ifezZ8sOJ4d4qK+0
 6eY7p9EydRl/gFcWeOgWEekTDeUQaX4W6CIsYH4773dnj1Y3YOTn9ijTxSQ7twZ4rPeM
 bYQ2ni6+oOY+qX1TEw5OEDx4w9bMvyEQ7JjnXN5BloDH5tLj4YMGHu1PTi9Ro3Rc+pot
 kG4OMramSJ6lewcmXx0UOMcMk4CJ/CAufN1bqBxOf4zvxI/T09KPwGcu5LHSSQ24QURx
 6NbLDU7L8Y3zZW8VfXRanTPdsjYVWVB+O8vMJxZZV6vu2rMgV+yaE2OXC4b2p6m5fZqd
 wEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XaLraLMXGarbXtzLej7Jh5+dbXUsOWKt1g6tjE1Dqeo=;
 b=d+HpGyGbP2/beF5FKLvPjsp6zohaNsoo3GulaiMcBVU9u3Ri4YF1Grz5gsDrDsWs0c
 Th/Q4KIB8RpFjHLhCrfYeIbdQHq3SnZLhqPDF7GJ1G+6RALpM9d7LEJwEyYLF6mFbwyE
 u3kF++1WRnVg/xj+Xpn+ReLVqP8eRpqpElL6JGbiY/cPjV7x0xN+VmiNk53H1f8otGgU
 PE7Pj7zha/A0m1cDMbqUOUvuNurNy60RlOzE0G6f3GUkkLTn3XHj8myGv/+/jnAVHxxj
 EbcLEKF6NlKAbwCCrHv3azaKPhHXCtfN5CAV9nl9teZWp/3AVwiBOpu475ialXRkKDyc
 Tlcw==
X-Gm-Message-State: AOAM531J2I2KmUpnyV18wPrpQe5ChL2EzNv383Olpjt2vk+sPPExipR0
 ElZSzL6a5iDUvECV26MC7NMRKxhjvafnVnZ4+zw=
X-Google-Smtp-Source: ABdhPJynAWDt9+Y6/QfOOVr2xYXyVH5Lhc+FBSgV/h5u0JTFuCMos9WlzjyK2FdphSXkq5n8SwLc577ewYGeRQFolnw=
X-Received: by 2002:a17:902:da8c:b0:148:a2e8:2c11 with SMTP id
 j12-20020a170902da8c00b00148a2e82c11mr7676087plx.96.1641968373272; Tue, 11
 Jan 2022 22:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20220110034000.20221-1-jasowang@redhat.com>
 <CAFEAcA8qJM1ekUTBQ3eyBCBi6Avk1H=MqP0vMmFdJo-MgoEUAQ@mail.gmail.com>
 <CACGkMEvdFJCY7GBu+0cMBVVfdDN+9+H14QvF9R0LZyo74ZDSag@mail.gmail.com>
 <CADO9X9Q745CTFWA+spCfzvaC03+xYR63mbSnARUEP6xYaAefJA@mail.gmail.com>
 <0a747f8c-6839-9265-e0a4-dfa42cb05d03@redhat.com>
In-Reply-To: <0a747f8c-6839-9265-e0a4-dfa42cb05d03@redhat.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Wed, 12 Jan 2022 09:19:20 +0300
Message-ID: <CADO9X9TQq1W+NXm3qEnc06v7mRK8TJefMS7M+T=S5uhdSvfVSg@mail.gmail.com>
Subject: Re: [PULL 00/13] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009f15f705d55c8de7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pj1-x102c.google.com
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

--0000000000009f15f705d55c8de7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 12 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3., 8:39 AM Jason Wang <jaso=
wang@redhat.com>:

>
> =E5=9C=A8 2022/1/12 =E4=B8=8A=E5=8D=886:02, Vladislav Yaroshchuk =E5=86=
=99=E9=81=93:
> >
> >
> > =D0=B2=D1=82, 11 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3., 5:10 AM Jason Wang <=
jasowang@redhat.com>:
> >
> >     On Tue, Jan 11, 2022 at 12:49 AM Peter Maydell
> >     <peter.maydell@linaro.org> wrote:
> >     >
> >     > On Mon, 10 Jan 2022 at 03:40, Jason Wang <jasowang@redhat.com>
> >     wrote:
> >     > >
> >     > > The following changes since commit
> >     df722e33d5da26ea8604500ca8f509245a0ea524:
> >     > >
> >     > >   Merge tag 'bsd-user-arm-pull-request' of
> >     gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)
> >     > >
> >     > > are available in the git repository at:
> >     > >
> >     > > https://github.com/jasowang/qemu.git tags/net-pull-request
> >     > >
> >     > > for you to fetch changes up to
> >     5136cc6d3b8b74f4fa572f0874656947a401330e:
> >     > >
> >     > >   net/vmnet: update MAINTAINERS list (2022-01-10 11:30:55 +0800=
)
> >     > >
> >     > > ---------------------------------------------------------------=
-
> >     > >
> >     > > ---------------------------------------------------------------=
-
> >     >
> >     > Fails to build on OSX Catalina:
> >     >
> >     > ../../net/vmnet-common.m:165:10: error: use of undeclared
> identifier
> >     > 'VMNET_SHARING_SERVICE_BUSY'
> >     >     case VMNET_SHARING_SERVICE_BUSY:
> >     >          ^
> >     >
> >     > This constant only got added in macOS 11.0. I guess that
> technically
> >     > our supported-platforms policy only requires us to support 11
> >     (Big Sur)
> >     > and 12 (Monterey) at this point, but it would be nice to still
> >     be able
> >     > to build on Catalina (10.15).
> >
> >     Yes, it was only supported by the vmnet framework starting from
> >     Catalyst according to
> >     https://developer.apple.com/documentation/vmnet?language=3Dobjc.
> >
> >
> > Yes, there are some symbols from macOS >=3D 11.0 new backend
> > uses, not only this one, ex. vmnet_enable_isolation_key:
> >
> https://developer.apple.com/documentation/vmnet/vmnet_enable_isolation_ke=
y
> >
> >     >
> >     > (Personally I would like Catalina still to work at least for a
> >     little
> >     > while, because my x86 Mac is old enough that it is not supported =
by
> >     > Big Sur. I'll have to dump it once Apple stops doing security
> >     support
> >     > for Catalina, but they haven't done that quite yet.)
> >
> >
> > Sure, broken builds on old macOSes are bad. For this case I think
> > it's enough to disable vmnet for macOS < 11.0 with a probe while
> > configure build step. Especially given that Apple supports ~three
> > latest macOS versions, support for Catalina is expected to end
> > in 2022, when QEMU releases 7.0.
>
>
> That should be fine.
>
>
> >
> > If this workaround is not suitable and it's required to support vmnet
> > in Catalina 10.15 with a subset of available features, it can be done.
> > But I'll be ready to handle this in approximately two-three weeks only.
> >
> >     Sure, Vladislav please fix this and send a new version.
> >
> >
> > Quick fix as described above is available in v10:
> >
> https://patchew.org/QEMU/20220111211422.21789-1-yaroshchuk2000@gmail.com/
>
>
> Have you got chance to test that for macOS < 11.0?
>

Yes, tested on Catalina 10.15.Works as expected.

Thanks
>
>
> >     Thanks
> >
> >     >
> >     > -- PMM
> >     >
> >
> >
> >
> >
> > --
> > Best Regards,
> >
> > Vladislav Yaroshchuk


>
>

--0000000000009f15f705d55c8de7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=81=D1=80, 12 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3., 8:3=
9 AM Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.=
com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=E5=9C=A8 2022/1/12 =E4=B8=8A=E5=8D=886:02, Vladislav Yaroshchuk =E5=86=99=
=E9=81=93:<br>
&gt;<br>
&gt;<br>
&gt; =D0=B2=D1=82, 11 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3., 5:10 AM Jason Wang =
&lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank" rel=3D"norefer=
rer">jasowang@redhat.com</a>&gt;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, Jan 11, 2022 at 12:49 AM Peter Maydell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:peter.maydell@linaro.org" tar=
get=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; wrote:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Mon, 10 Jan 2022 at 03:40, Jason Wang &lt;<=
a href=3D"mailto:jasowang@redhat.com" target=3D"_blank" rel=3D"noreferrer">=
jasowang@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; The following changes since commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0df722e33d5da26ea8604500ca8f509245a0ea524:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0Merge tag &#39;bsd-user-arm-p=
ull-request&#39; of<br>
&gt;=C2=A0 =C2=A0 =C2=A0gitlab.com:bsdimp/qemu into staging (2022-01-08 09:=
37:59 -0800)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; are available in the git repository at:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; <a href=3D"https://github.com/jasowang/qe=
mu.git" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/=
jasowang/qemu.git</a> tags/net-pull-request<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; for you to fetch changes up to<br>
&gt;=C2=A0 =C2=A0 =C2=A05136cc6d3b8b74f4fa572f0874656947a401330e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0net/vmnet: update MAINTAINERS=
 list (2022-01-10 11:30:55 +0800)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; -----------------------------------------=
-----------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; -----------------------------------------=
-----------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Fails to build on OSX Catalina:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ../../net/vmnet-common.m:165:10: error: use of=
 undeclared identifier<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &#39;VMNET_SHARING_SERVICE_BUSY&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0case VMNET_SHARING_SERVICE_=
BUSY:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This constant only got added in macOS 11.0. I =
guess that technically<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; our supported-platforms policy only requires u=
s to support 11<br>
&gt;=C2=A0 =C2=A0 =C2=A0(Big Sur)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; and 12 (Monterey) at this point, but it would =
be nice to still<br>
&gt;=C2=A0 =C2=A0 =C2=A0be able<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; to build on Catalina (10.15).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes, it was only supported by the vmnet framework s=
tarting from<br>
&gt;=C2=A0 =C2=A0 =C2=A0Catalyst according to<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://developer.apple.com/documentatio=
n/vmnet?language=3Dobjc" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://developer.apple.com/documentation/vmnet?language=3Dobjc</a>.<br>
&gt;<br>
&gt;<br>
&gt; Yes, there are some symbols from macOS &gt;=3D 11.0 new backend<br>
&gt; uses, not only this one, ex. vmnet_enable_isolation_key:<br>
&gt; <a href=3D"https://developer.apple.com/documentation/vmnet/vmnet_enabl=
e_isolation_key" rel=3D"noreferrer noreferrer" target=3D"_blank">https://de=
veloper.apple.com/documentation/vmnet/vmnet_enable_isolation_key</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; (Personally I would like Catalina still to wor=
k at least for a<br>
&gt;=C2=A0 =C2=A0 =C2=A0little<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; while, because my x86 Mac is old enough that i=
t is not supported by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Big Sur. I&#39;ll have to dump it once Apple s=
tops doing security<br>
&gt;=C2=A0 =C2=A0 =C2=A0support<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; for Catalina, but they haven&#39;t done that q=
uite yet.)<br>
&gt;<br>
&gt;<br>
&gt; Sure, broken builds on old macOSes are bad. For this case I think<br>
&gt; it&#39;s enough to disable vmnet for macOS &lt; 11.0 with a probe whil=
e<br>
&gt; configure build step. Especially given that Apple supports ~three<br>
&gt; latest macOS versions, support for Catalina is expected to end<br>
&gt; in 2022, when QEMU releases 7.0.<br>
<br>
<br>
That should be fine.<br>
<br>
<br>
&gt;<br>
&gt; If this workaround is not suitable and it&#39;s required to support vm=
net<br>
&gt; in Catalina 10.15 with a subset of available features, it can be done.=
<br>
&gt; But I&#39;ll be ready to handle this in approximately two-three weeks =
only.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Sure, Vladislav please fix this and send a new vers=
ion.<br>
&gt;<br>
&gt;<br>
&gt; Quick fix as described above is available in v10:<br>
&gt; <a href=3D"https://patchew.org/QEMU/20220111211422.21789-1-yaroshchuk2=
000@gmail.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://pat=
chew.org/QEMU/20220111211422.21789-1-yaroshchuk2000@gmail.com/</a><br>
<br>
<br>
Have you got chance to test that for macOS &lt; 11.0?<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, tested on Catalin=
a 10.15.Works as expected.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -- PMM<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt; Best Regards,<br>
&gt;<br>
&gt; Vladislav Yaroshchuk</blockquote><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br></=
blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br></blockquote></div></div></di=
v>

--0000000000009f15f705d55c8de7--

