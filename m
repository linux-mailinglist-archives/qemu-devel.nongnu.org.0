Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F05A56A897
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:50:56 +0200 (CEST)
Received: from localhost ([::1]:35362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9UiN-0006wk-D7
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o9Ub7-0005Th-2u
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:43:25 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:37580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o9Ub5-0007z2-4Z
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:43:24 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id h132so2762317ybb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iYtewbd1Vvt+V4zRkj14OS1LqLPem7n2eniC2qLjCl0=;
 b=YSsgc4O+sV4FJEOo7V1VVXDPz7fJZ18qq5Eavjb/E/ymOaccguJzEkz7HYSBmtre2g
 rDb0CdP1p74wHVfeXRDLaOQdq3kvxf9F6TxL2uQPQE4xCErgSj0sK5C1v5k62ekX1XuK
 6tIIayomRMICNMWe/bUrtsz3KgonftDyw5ImauY2kgWMCnmYX5KDQuJuxCRecSMnqpGm
 TsoHhnwJ3jXmkQBX87w/49YtoxOjaLBn3XsPhdrr+bsgSCv6ArDZcGa++eKs8wU6jFF1
 PLdcJHeXS/Ov8gwOb33+2mxb1ZvrhAMU1A7zouWhNJdGiuzcY688QniznYKHsj5/MVvg
 UZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iYtewbd1Vvt+V4zRkj14OS1LqLPem7n2eniC2qLjCl0=;
 b=1Gd/TXtyVttQjMY0HX5g5l1Prr1h9v0rtXECpfwx7WUUkYq+Lnxu1oJw8pzCUPDCTb
 OpWZfjJ9bzx+9Kf82ot2oS8RZ4UFanoBx0GjhswAhPsTDC/SZwjP577DtjvgAztCo3GY
 HIghR/ncZCwupl/QyAVZDkmi4HtO3pu83wT9RCnsomBeoms8tX3aXMJL0f2KjnZ5AhfO
 5bowQOwHhxSWmyibEyXPtxHWLka5U2nT60tethsKw7foTUh5wMJjVgafOm4IoDbePu/f
 BHf8bxLdAZ/bJlHkvMpkSy5QXkZh+B7VyMizH+tWfUOduR9MGHGas5DPel+JkcB2sXB5
 UjVg==
X-Gm-Message-State: AJIora9nLmEEJHiJ8wm1T+3J+wp3tcE8rOt3UETKgqchUEMkQXWTgzPq
 0avPKrJlspw8K3u8S7Y5DlF12mK6Xxj8da5NmR8=
X-Google-Smtp-Source: AGRyM1um1ZcRShREx1+UYiwV+9Xg2c4/3JIWtWiitdrETB7RPc4l21p4myCuBOJuOzS8XShqjICX9xZa+Zq7XxxaUkA=
X-Received: by 2002:a5b:bc2:0:b0:66e:4a75:e5ff with SMTP id
 c2-20020a5b0bc2000000b0066e4a75e5ffmr25168515ybr.642.1657212202045; Thu, 07
 Jul 2022 09:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <Yo5V19zE82hWFuSJ@stefanha-x1.localdomain> <87fsjdjayh.fsf@linaro.org>
 <CAJSP0QVDEKn9MHu431q8Qdy+z73MSoGR5DCRMir9xEndZZqnQA@mail.gmail.com>
 <87zghlhri7.fsf@linaro.org>
In-Reply-To: <87zghlhri7.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 7 Jul 2022 18:43:08 +0200
Message-ID: <CAJSP0QXW_KaNCaLJFEWYumZ_eQP=Ca+aEkOZzi+RdxuQrNO9zg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] virtio-gpio and various virtio cleanups
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, viresh.kumar@linaro.org
Content-Type: multipart/alternative; boundary="0000000000009ed37f05e339c8ba"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000009ed37f05e339c8ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2022, 17:28 Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

>
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
> > On Thu, 7 Jul 2022 at 14:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >>
> >> Stefan Hajnoczi <stefanha@redhat.com> writes:
> >>
> >> > [[PGP Signed Part:Undecided]]
> >> > On Tue, May 24, 2022 at 04:40:41PM +0100, Alex Benn=C3=A9e wrote:
> >> >> Hi,
> >> >>
> >> >> This series ostensibly adds virtio-user-gpio stubs to the build for
> >> >> use with an external vhost-user daemon. We've been testing it with
> our
> >> >> rust daemons from:
> >> >>
> >> >>   https://github.com/rust-vmm/vhost-device
> >> >>
> >> >> Getting the test enabled took some doing most likely because the ne=
ed
> >> >> for CONFIG support exercised additional paths in the code that were
> >> >> not used for the simpler virtio-net tests. As a result the series h=
as
> >> >> a number of cleanup and documentation patches.
> >> >>
> >> >> The final thing that needed fixing was the ensuring that
> >> >> VHOST_USER_F_PROTOCOL_FEATURES didn't get squashed in the negotiati=
on
> >> >> process. This was the hardest thing to track down as we store the
> >> >> feature bits in several places variously as:
> >> >>
> >> >>   in VirtIODevice as:
> >> >>     uint64_t guest_features;
> >> >>     uint64_t host_features;
> >> >>     uint64_t backend_features;
> >> >
> >> > None of these know about VHOST_USER_F_PROTOCOL_FEATURES and
> vhost-user's
> >> > unfiltered feature bits should never be passed to VirtIODevice.
> >> >
> >> >>
> >> >>  in vhost_dev as:
> >> >>     uint64_t features;
> >> >>     uint64_t acked_features;
> >> >>     uint64_t backend_features;
> >> >
> >> > I don't think these should know about VHOST_USER_F_PROTOCOL_FEATURES
> >> > either. AFAIK vhost_dev deals with VIRTIO feature bits, not raw
> >> > vhost-user GET_FEATURES.
> >>
> >> So where does VHOST_USER_F_PROTOCOL_FEATURES get set before it's set
> >> with the VHOST_USER_SET_FEATURES message? Currently it's fed via:
> >>
> >>     uint64_t features =3D vhost_dev->acked_features;
> >>
> >> in vhost_dev_set_features() which does apply a few extra bits
> >> (VHOST_F_LOG_ALL/VIRTIO_F_IOMMU_PLATFORM). Maybe it should be adding
> >> VHOST_USER_F_PROTOCOL_FEATURES here? How should it be signalled by the
> >> vhost-user backend that this should be done? Overload the function?
> >
> > A modern vhost-user server replies to VHOST_USER_GET_FEATURES with
> > VHOST_USER_F_PROTOCOL_FEATURES set. That's when the vhost-user client
> > encounters this bit.
> >
> > The vhost-user client should then filter out
> > VHOST_USER_F_PROTOCOL_FEATURES because it belongs to the vhost-user
> > protocol and isn't a real VIRTIO feature bit. The client uses the
> > filtered VIRTIO feature bits and it now knows whether the vhost-user
> > server supports the VHOST_USER_GET_PROTOCOL_FEATURES and
> > VHOST_USER_SET_PROTOCOL_FEATURES messages.
> >
> > I think vhost_user_set_features() should set
> > VHOST_USER_F_PROTOCOL_FEATURES if the server returned it from
> > VHOST_USER_GET_FEATURES. At the moment vhost_user_backend_init()
> > stores VHOST_USER_F_PROTOCOL_FEATURES in struct
> > vhost_dev->backend_features, which only seems to be used by vhost-net
> > code.
>
> I can clean-up the documentation for this. I wonder if the VirtIODevice
> backend_features is a duplication that should be removed?
>

I don't know the code well enough to say, but it's possible that it can be
simplified.

Stefan

--0000000000009ed37f05e339c8ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Jul 7, 2022, 17:28 Alex Benn=C3=A9e &lt;<a hre=
f=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br>
Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">stefanha@gmail.com</a>&gt; writes:<br>
<br>
&gt; On Thu, 7 Jul 2022 at 14:42, Alex Benn=C3=A9e &lt;<a href=3D"mailto:al=
ex.bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@lina=
ro.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">stefanha@redhat.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; [[PGP Signed Part:Undecided]]<br>
&gt;&gt; &gt; On Tue, May 24, 2022 at 04:40:41PM +0100, Alex Benn=C3=A9e wr=
ote:<br>
&gt;&gt; &gt;&gt; Hi,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; This series ostensibly adds virtio-user-gpio stubs to the=
 build for<br>
&gt;&gt; &gt;&gt; use with an external vhost-user daemon. We&#39;ve been te=
sting it with our<br>
&gt;&gt; &gt;&gt; rust daemons from:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/rust-vmm/vhost-=
device" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/=
rust-vmm/vhost-device</a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Getting the test enabled took some doing most likely beca=
use the need<br>
&gt;&gt; &gt;&gt; for CONFIG support exercised additional paths in the code=
 that were<br>
&gt;&gt; &gt;&gt; not used for the simpler virtio-net tests. As a result th=
e series has<br>
&gt;&gt; &gt;&gt; a number of cleanup and documentation patches.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The final thing that needed fixing was the ensuring that<=
br>
&gt;&gt; &gt;&gt; VHOST_USER_F_PROTOCOL_FEATURES didn&#39;t get squashed in=
 the negotiation<br>
&gt;&gt; &gt;&gt; process. This was the hardest thing to track down as we s=
tore the<br>
&gt;&gt; &gt;&gt; feature bits in several places variously as:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0in VirtIODevice as:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0uint64_t guest_features;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0uint64_t host_features;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0uint64_t backend_features;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; None of these know about VHOST_USER_F_PROTOCOL_FEATURES and v=
host-user&#39;s<br>
&gt;&gt; &gt; unfiltered feature bits should never be passed to VirtIODevic=
e.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 in vhost_dev as:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0uint64_t features;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0uint64_t acked_features;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0uint64_t backend_features;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I don&#39;t think these should know about VHOST_USER_F_PROTOC=
OL_FEATURES<br>
&gt;&gt; &gt; either. AFAIK vhost_dev deals with VIRTIO feature bits, not r=
aw<br>
&gt;&gt; &gt; vhost-user GET_FEATURES.<br>
&gt;&gt;<br>
&gt;&gt; So where does VHOST_USER_F_PROTOCOL_FEATURES get set before it&#39=
;s set<br>
&gt;&gt; with the VHOST_USER_SET_FEATURES message? Currently it&#39;s fed v=
ia:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0uint64_t features =3D vhost_dev-&gt;acked_featu=
res;<br>
&gt;&gt;<br>
&gt;&gt; in vhost_dev_set_features() which does apply a few extra bits<br>
&gt;&gt; (VHOST_F_LOG_ALL/VIRTIO_F_IOMMU_PLATFORM). Maybe it should be addi=
ng<br>
&gt;&gt; VHOST_USER_F_PROTOCOL_FEATURES here? How should it be signalled by=
 the<br>
&gt;&gt; vhost-user backend that this should be done? Overload the function=
?<br>
&gt;<br>
&gt; A modern vhost-user server replies to VHOST_USER_GET_FEATURES with<br>
&gt; VHOST_USER_F_PROTOCOL_FEATURES set. That&#39;s when the vhost-user cli=
ent<br>
&gt; encounters this bit.<br>
&gt;<br>
&gt; The vhost-user client should then filter out<br>
&gt; VHOST_USER_F_PROTOCOL_FEATURES because it belongs to the vhost-user<br=
>
&gt; protocol and isn&#39;t a real VIRTIO feature bit. The client uses the<=
br>
&gt; filtered VIRTIO feature bits and it now knows whether the vhost-user<b=
r>
&gt; server supports the VHOST_USER_GET_PROTOCOL_FEATURES and<br>
&gt; VHOST_USER_SET_PROTOCOL_FEATURES messages.<br>
&gt;<br>
&gt; I think vhost_user_set_features() should set<br>
&gt; VHOST_USER_F_PROTOCOL_FEATURES if the server returned it from<br>
&gt; VHOST_USER_GET_FEATURES. At the moment vhost_user_backend_init()<br>
&gt; stores VHOST_USER_F_PROTOCOL_FEATURES in struct<br>
&gt; vhost_dev-&gt;backend_features, which only seems to be used by vhost-n=
et<br>
&gt; code.<br>
<br>
I can clean-up the documentation for this. I wonder if the VirtIODevice<br>
backend_features is a duplication that should be removed?<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t know t=
he code well enough to say, but it&#39;s possible that it can be simplified=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Stefan</div></div>

--0000000000009ed37f05e339c8ba--

