Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A441EE6D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 15:21:12 +0200 (CEST)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWITP-0001VL-CO
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 09:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mWIQK-000887-AV
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:18:00 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mWIQI-0003wu-7V
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:18:00 -0400
Received: by mail-ed1-x52d.google.com with SMTP id v18so33932579edc.11
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uMN2/GbwrskolvwwoxfhjRcyfZ/HpAbbYr+FiT5kuVo=;
 b=nEtz+Sa3crlXw0TU2cX3cdEUTH7u6v5l90+DOqu3YU5frcB+XMAx8MxQejijsjxDdu
 PK1+/LrqEG2Zoo7JTkOjFMclRNjqx0uW8mH5PANVzOKIhBkbrLqHg9m7Mh3lkDHT2JKR
 5wL+jR/JHiFuYSkXfcLf7RguwoK77i8B3EvsL8WholzhBi4T19shQdVqBY2AvGomGkKF
 vCgboVuQgX/mMICFgOh8liKkn06AtlSE8ZB8Q20sPg/IKyAHz3m6vmgVtXmyZAmOh9ZZ
 0BWL6lWIchuHGidQ0c8BTu0w5/JPaLSgs/WIgbRF8tV9Kyg+xC8NzJNkiWkw7jtaQgzM
 6Pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uMN2/GbwrskolvwwoxfhjRcyfZ/HpAbbYr+FiT5kuVo=;
 b=FaoR5ena8n/BHalIIFXS/qo5JvAYfn9tLbPk6ZbBIDbucLuhWXM4kbEGWlRo/G65nU
 fJJkLzF95EkY7AOM425lvy5hLJ9ZzFCN71F1iDPe4QYSOicbiQ4hUdGzEWLqMKZOjdAv
 HILOD6Zryrz500xVOT2+DPpRdeOGKkg+FQAqDD/ZnhWKSsbXzhO8nOdnHKZt/5VVtgKV
 NTo4lAXLneYE2jvm3Dt+8ZfBtDA58ZDmUbJtzX6HwdzBSZ7pKsw2QGGTHz070/21x4Lq
 Actq103kBQ3dWxQoZ+AJo/DHzyM6HZG95WheH1iTiBVe37vlLo+FxpnJB5zUY1ggFh3n
 aNPQ==
X-Gm-Message-State: AOAM533mBGEADNhjh+l4Vj8kdVYqpPMC3RSk1ribtLfxJRQEeQ+bBAEZ
 zNJsUsYguTOHYwOaqstHBn1Mmzbng2UHk3OGnGDJ1w==
X-Google-Smtp-Source: ABdhPJxoZUGoF+i/z/0Q4bNEIg4NGkhT3Q4MukXpuavLRe4ffhbEdTIlOVv+wWehptIaLOFG04BCkVV7+lIbdov7Oaw=
X-Received: by 2002:a17:906:4cc1:: with SMTP id
 q1mr5937345ejt.415.1633094273575; 
 Fri, 01 Oct 2021 06:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211001082502.1342878-1-lvivier@redhat.com>
 <20211001104514.46bhlpenx4rz2qnm@sirius.home.kraxel.org>
 <0eeefb15-1b41-076c-7dd4-ca5fc78eefa9@redhat.com>
 <20211001124935.qal55li6aozocan3@sirius.home.kraxel.org>
In-Reply-To: <20211001124935.qal55li6aozocan3@sirius.home.kraxel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 1 Oct 2021 18:47:42 +0530
Message-ID: <CAARzgwxxuZ=cdqJfd_x_ot-NsqefVdH5g_oM8wKs17bLZWzo+Q@mail.gmail.com>
Subject: Re: [PATCH v3] failover: fix unplug pending detection
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000fc4b505cd4a64ea"
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52d.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000fc4b505cd4a64ea
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 18:19 Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > > So, in case the first time didn't work (for example due to the guest
> not
> > > listening because grub just doesn't do that), you can try a second time
> > > once the linux kernel is up'n'running.
> > >
> > > I suspect this patch will break that (didn't actually test though).
> >
> > I think the solution to this problem is to not check for
> > pending_deleted_event value in qmp_device_del().
> >
> > But this has been explicitly added by:
> >
> > commit cce8944cc9efab47d4bf29cfffb3470371c3541b
> > Author: Julia Suvorova <jusual@redhat.com>
> > Date:   Thu Feb 20 17:55:56 2020 +0100
> >
> >     qdev-monitor: Forbid repeated device_del
> >
> >     [ ... ]
> >
> > So do you mean ACPI differs from PCIe Native hotplug in this case?
>
> Yes.
>
> It's one of the issues I'm trying to address with the
>
>   https://gitlab.com/kraxel/qemu/-/commits/sirius/pcie-hotplug
>
> series.  See this commit:
>
>
> https://gitlab.com/kraxel/qemu/-/commit/675d9257d794c9d59ea7c80f48fe176a2aa3f8ba


I think the scope of this patch is limited to making the acpi hotplug path
identical to PCIE native path wrt failover. If there are issues with the
existing approach, it should be looked into separately using subsequent
patches.

<https://gitlab.com/kraxel/qemu/-/commit/675d9257d794c9d59ea7c80f48fe176a2aa3f8ba>
>
> So, yes, I think acpi and pcie hotplug should show consistent behavior
> here.  And I think we need some way to recover in case the guest didn't
> respond to an unplug event.  Just allowing to send device_del multiple
> times looks like a sensible approach to me, and given OpenStack already
> does that it looks like the most sensible way forward.
>
> take care,
>   Gerd
>
>

--0000000000000fc4b505cd4a64ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 1, 2021 at 18:19 Gerd Hoffmann &lt;<a href=3D"m=
ailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">=C2=A0 Hi,<br>
<br>
&gt; &gt; So, in case the first time didn&#39;t work (for example due to th=
e guest not<br>
&gt; &gt; listening because grub just doesn&#39;t do that), you can try a s=
econd time<br>
&gt; &gt; once the linux kernel is up&#39;n&#39;running.<br>
&gt; &gt; <br>
&gt; &gt; I suspect this patch will break that (didn&#39;t actually test th=
ough).<br>
&gt; <br>
&gt; I think the solution to this problem is to not check for<br>
&gt; pending_deleted_event value in qmp_device_del().<br>
&gt; <br>
&gt; But this has been explicitly added by:<br>
&gt; <br>
&gt; commit cce8944cc9efab47d4bf29cfffb3470371c3541b<br>
&gt; Author: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" target=
=3D"_blank">jusual@redhat.com</a>&gt;<br>
&gt; Date:=C2=A0 =C2=A0Thu Feb 20 17:55:56 2020 +0100<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0qdev-monitor: Forbid repeated device_del<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[ ... ]<br>
&gt; <br>
&gt; So do you mean ACPI differs from PCIe Native hotplug in this case?<br>
<br>
Yes.<br>
<br>
It&#39;s one of the issues I&#39;m trying to address with the<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/kraxel/qemu/-/commits/sirius/pcie-hotp=
lug" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/kraxel/qemu/-/=
commits/sirius/pcie-hotplug</a><br>
<br>
series.=C2=A0 See this commit:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/kraxel/qemu/-/commit/675d9257d794c9d59=
ea7c80f48fe176a2aa3f8ba" rel=3D"noreferrer" target=3D"_blank">https://gitla=
b.com/kraxel/qemu/-/commit/675d9257d794c9d59ea7c80f48fe176a2aa3f8ba</a></bl=
ockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think the scope of=
 this patch is limited to making the acpi hotplug path identical to PCIE na=
tive path wrt failover. If there are issues with the existing approach, it =
should be looked into separately using subsequent patches.</div><div dir=3D=
"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)" dir=3D"auto"><a href=3D"https://gitlab.co=
m/kraxel/qemu/-/commit/675d9257d794c9d59ea7c80f48fe176a2aa3f8ba" rel=3D"nor=
eferrer" target=3D"_blank"></a><br>
<br>
So, yes, I think acpi and pcie hotplug should show consistent behavior<br>
here.=C2=A0 And I think we need some way to recover in case the guest didn&=
#39;t<br>
respond to an unplug event.=C2=A0 Just allowing to send device_del multiple=
<br>
times looks like a sensible approach to me, and given OpenStack already<br>
does that it looks like the most sensible way forward.<br>
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--0000000000000fc4b505cd4a64ea--

