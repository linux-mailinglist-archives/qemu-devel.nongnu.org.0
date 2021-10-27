Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA1343D201
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:59:59 +0200 (CEST)
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfp5a-0006AY-LL
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mforU-0004Jp-AT
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:45:24 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:44897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mforR-00025U-5H
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:45:23 -0400
Received: by mail-lj1-x234.google.com with SMTP id s19so6541726ljj.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 12:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kaQ7DmmtGuVnBB4w0ix2N9uODjONOrN3GfV2Yiw74Gc=;
 b=YVeO3UG1u+dSve/EAyzpUBaehRvdFnJpS+c1xlD0uf3ZwNs5PIKKAhCudgyOInVRwW
 5Y1uB6lYxFqANm4/homCD6iAXJzY53y11tiLcOG/K98v7cvuKCjK0RhqfzVUMZSi+mCj
 OW0AKnoepDDvla8i5iDKcjeVa2OdkOErbWObxgWoj+D4S3J1+fwUkmkk7MQz3PTES6TL
 XqJ3hiN65Ra7FJ8lf3Bd6QaFrbVIIJunRj28HxFu+2Iz6WTZSm13E8YNgCwe897ufoCC
 bMlw30/DkWXSHh+rUjv74/qAxpPI2o8Tt0EKJ9M7GZZJJZEY54lVRz6h8s5zPtBUWDQb
 cJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kaQ7DmmtGuVnBB4w0ix2N9uODjONOrN3GfV2Yiw74Gc=;
 b=LrsNT7Aiy6NO7LKC1+lA9R/3Ux6vXIPYmj/zm4RJx4KXN1xDoQRtNTBwEylgvcIQjB
 DzoFKbgQhbLhMB+e/q9qAQHuYKHTrcjK8HdlclSb/stPcthk8ALH4I4cEXuPjUsR36fy
 CXyJjRYbPzmwWnetdHqsAKjD+Om+fMdPJvomuX5zR7vn5YoTwW+bUQDdiTE3CrBgLwWn
 NUUBzoyZRrjb9q7eRhjSPRlQa881qv78FDcVRulD6pslMBQrd/znBq0ywnntF0MrZOQC
 CImiSbzyOnJV7LCVtXwbelgFJwZz+TjShN5gW0GIGFixNmmRDpA+XdUJxvgo5Dc26/hY
 Z0Cw==
X-Gm-Message-State: AOAM531u9+4tU3st2b2TZBgNpIzkaGGj24o4Em7qGA2IQ8l/CDjZiZM8
 Rq1UTeRbLvh+mrdmqvtP7Og/huZ+WYGbeuwsa+vtcQ==
X-Google-Smtp-Source: ABdhPJyc/nLik1rHaghOuYZ6M5wEVcfr0Rowp8NbJxNnO73yr+I44Z6gzwzRtHzxmTVfmU049SZREiSBnpySLUTMMag=
X-Received: by 2002:a2e:b88c:: with SMTP id r12mr36021417ljp.114.1635363917941; 
 Wed, 27 Oct 2021 12:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013010120.96851-6-sjg@chromium.org>
 <CAHFG_=UDFn9MQfJz6oTAg15PiR2nt6QkoZS58+gsOMMVo31AXQ@mail.gmail.com>
 <87v91iwmoc.fsf@linaro.org> <20211027145653.GB8284@bill-the-cat>
 <CAPnjgZ1sKULC6wKuEWsdjzFsmDK3ECVUTiE7kjp18psgACREVQ@mail.gmail.com>
 <20211027183910.GH8284@bill-the-cat>
In-Reply-To: <20211027183910.GH8284@bill-the-cat>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Wed, 27 Oct 2021 20:45:04 +0100
Message-ID: <CAHDbmO3yYEd_R=1xkDC+u2ZZ2Y4xqoj+m6-JhEHcSkqbp=MuNw@mail.gmail.com>
Subject: Re: [PATCH 05/16] arm: qemu: Add a devicetree file for qemu_arm64
To: Tom Rini <trini@konsulko.com>
Content-Type: multipart/alternative; boundary="000000000000685ce605cf5ad5ee"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Heiko Schocher <hs@denx.de>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Rick Chen <rick@andestech.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Fabio Estevam <festevam@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000685ce605cf5ad5ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There are QEMU targets that have fixed hardware which do rely on the
firmware to have a fixed view of the hardware. sbsa-ref is one such board
although there will be some versioning required for later levels.

On Wed, 27 Oct 2021, 19:39 Tom Rini, <trini@konsulko.com> wrote:

> On Wed, Oct 27, 2021 at 12:34:26PM -0600, Simon Glass wrote:
> > Hi all,
> >
> > On Wed, 27 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Wed, Oct 27, 2021 at 03:44:08PM +0100, Alex Benn=C3=A9e wrote:
> > > >
> > > > Fran=C3=A7ois Ozog <francois.ozog@linaro.org> writes:
> > > >
> > > > > Hi Simon
> > > > >
> > > > > The only place I could agree with this file presence is in the
> documentation directory, not in dts. It creates a mental picture  for the
> reader
> > > > > an entirely bad mind scheme around Qemu and DT.
> > > > >
> > > > > And even in a documentation directory I would place a bug warning=
:
> don=E2=80=99t use this with any kernel , Qemu generates a DT dynamically
> > > > > based on cpu, memory and devices specified at the command line.
> > > >
> > > > Certainly for the arm, aarch64 and riscv "virt" machines you should
> > > > always use the QEMU generated DTB. I'm not entirely clear what a
> > > > qemu_arm and qemu_arm64 def targets are meant to be in this context=
.
> > >
> > > Agreed.  We cannot include random device trees in U-Boot for devices
> > > that generate their own at run time or otherwise have the source of
> > > truth elsewhere.
> >
> > Until we have a way of bringing in the u-boot.dtsi that people in QEMU
> > can agree on, I don't see an alternative. I will send a series for the
> > bloblist handoff next week and I think you will all see what I mean.
>
> I think the alternative is that QEMU in U-Boot just can't be used for
> certain features.  Which is annoying in that it would be good to use it
> to test certain feature, yes.  It's generating a good and valid enough
> dtb for Linux, so it should be good enough for us in general.
>
> --
> Tom
>

--000000000000685ce605cf5ad5ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There are QEMU targets that have fixed hardware which do =
rely on the firmware to have a fixed view of the hardware. sbsa-ref is one =
such board although there will be some versioning required for later levels=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, 27 Oct 2021, 19:39 Tom Rini, &lt;<a href=3D"mailto:trini@konsulko.=
com">trini@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">On Wed, Oct 27, 2021 at 12:34:26PM -0600, Simon Glass wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; On Wed, 27 Oct 2021 at 08:56, Tom Rini &lt;<a href=3D"mailto:trini@kon=
sulko.com" target=3D"_blank" rel=3D"noreferrer">trini@konsulko.com</a>&gt; =
wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Oct 27, 2021 at 03:44:08PM +0100, Alex Benn=C3=A9e wrote:=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:francois.ozog@linar=
o.org" target=3D"_blank" rel=3D"noreferrer">francois.ozog@linaro.org</a>&gt=
; writes:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Simon<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The only place I could agree with this file presence is=
 in the documentation directory, not in dts. It creates a mental picture=C2=
=A0 for the reader<br>
&gt; &gt; &gt; &gt; an entirely bad mind scheme around Qemu and DT.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; And even in a documentation directory I would place a b=
ug warning: don=E2=80=99t use this with any kernel , Qemu generates a DT dy=
namically<br>
&gt; &gt; &gt; &gt; based on cpu, memory and devices specified at the comma=
nd line.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Certainly for the arm, aarch64 and riscv &quot;virt&quot; ma=
chines you should<br>
&gt; &gt; &gt; always use the QEMU generated DTB. I&#39;m not entirely clea=
r what a<br>
&gt; &gt; &gt; qemu_arm and qemu_arm64 def targets are meant to be in this =
context.<br>
&gt; &gt;<br>
&gt; &gt; Agreed.=C2=A0 We cannot include random device trees in U-Boot for=
 devices<br>
&gt; &gt; that generate their own at run time or otherwise have the source =
of<br>
&gt; &gt; truth elsewhere.<br>
&gt; <br>
&gt; Until we have a way of bringing in the u-boot.dtsi that people in QEMU=
<br>
&gt; can agree on, I don&#39;t see an alternative. I will send a series for=
 the<br>
&gt; bloblist handoff next week and I think you will all see what I mean.<b=
r>
<br>
I think the alternative is that QEMU in U-Boot just can&#39;t be used for<b=
r>
certain features.=C2=A0 Which is annoying in that it would be good to use i=
t<br>
to test certain feature, yes.=C2=A0 It&#39;s generating a good and valid en=
ough<br>
dtb for Linux, so it should be good enough for us in general.<br>
<br>
-- <br>
Tom<br>
</blockquote></div>

--000000000000685ce605cf5ad5ee--

