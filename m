Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A90D32F7D0
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 03:29:52 +0100 (CET)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIMhS-0004Fj-Nw
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 21:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1lIMg9-0003hB-0m; Fri, 05 Mar 2021 21:28:29 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:43347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1lIMg6-0002Vs-Ut; Fri, 05 Mar 2021 21:28:28 -0500
Received: by mail-qt1-x82e.google.com with SMTP id l14so612766qtr.10;
 Fri, 05 Mar 2021 18:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KMdov+KB7wodRmkgxBvzhWhvl8ODSBkWHlqpUczeEY4=;
 b=qUQh5TGHHGm/zaoOlU9Abv+60igfPpj/JwNMxWShI9Lg6gnM6EXD/x4H4f97SdpltT
 1vtzBi6nQCrkYQOxRGcbN5hXKPuh5xhHJlr18V6N5/Op6XPg7zARPMC2v17+WdegucoZ
 fcY3fD7jkrzDT6V+NnyNBrImLdbhOluROuQtF7H11WU2lpzt7uaUQsBQSjXhf7efLeU3
 IpwHXPo+iRw5ZC+aDTZRCreAzaLAaAEhvqGcQhTgajX10Zon7e0Cmd+uzd8mTc+JqRDB
 +2LwZPbeqhYBgVEku5ReJRn2k48ZV+XIHvfpI9h+g7vCff/uDR2yMfIu4VfFbbILrmiC
 bVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KMdov+KB7wodRmkgxBvzhWhvl8ODSBkWHlqpUczeEY4=;
 b=h7Zq+H+2elezefKMK3CkVki+og3Ddw4JiNypYoQfgT+Au+uRx5Sf4p2//zEqY4AH7l
 +aGoGxFnonOB9yeFN+PXj91q1A6Cvn13S7mkw7Xyqlvco/o/nHNVRc+6LZRPUSkQEzqZ
 XZlcYaJ5iZKRF955v5tTYRoXw80aD7U2H6MC5SNBRC0A5fbxLl3+OgHpMARa5Tus0n0h
 OXaUeFWp1RvdBlucuwE5D7T2zcnYuXg90UnmHsHOyCdlqYTsIAtm3Cb+pbQp9s/RjkNx
 CQjylar/Ys3rEQ5egYDx3kD38WkXqdxuqry4VexWu4lU4O0CX1NB5X5LUbHlZFr5Mu4X
 2oNA==
X-Gm-Message-State: AOAM5327BHDWSz7UgDsdLH4kUNss+nZzOod1Ze0flsE1O+tOulTdAMj2
 gr6jWXyT4OGvcVSYZrk9LR2Lz8xJyMatux28Euw=
X-Google-Smtp-Source: ABdhPJw/TzFB9ABQFTWLsPsVUw/uUMzpL8HPhBEj9iRT+JAxbQkcP3Bqo0UEMnmxBt/Gl1DAnW3HDQJI1vXRDhRaD9A=
X-Received: by 2002:aed:20cb:: with SMTP id 69mr11885044qtb.267.1614997704570; 
 Fri, 05 Mar 2021 18:28:24 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_W0AhNYs7+9hn1H6B2DL+UnSdhrj2JsBS4vCZ6fEd_pw@mail.gmail.com>
 <20210225053606.385884-1-schspa@gmail.com>
 <CAFEAcA_8EDULp2aZoJb=i4EFHEuy29L9QpJMd6nCzKLmuEAhHw@mail.gmail.com>
In-Reply-To: <CAFEAcA_8EDULp2aZoJb=i4EFHEuy29L9QpJMd6nCzKLmuEAhHw@mail.gmail.com>
From: Shi Schspa <schspa@gmail.com>
Date: Sat, 6 Mar 2021 10:28:13 +0800
Message-ID: <CAMA88TqZ+8XLzHxtvqV6TiqmXR1-9Gnk-1cCsoO6Y3x5R5FFnw@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-mmio: improve virtio-mmio get_dev_path alog
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007e7a2a05bcd4f400"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=schspa@gmail.com; helo=mail-qt1-x82e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007e7a2a05bcd4f400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you very much.

Best regards.


Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B43=E6=9C=885=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=887:57=E5=86=99=E9=81=93=EF=BC=
=9A

> On Thu, 25 Feb 2021 at 05:36, schspa <schspa@gmail.com> wrote:
> >
> > At the moment the following QEMU command line triggers an assertion
> > failure On xlnx-versal SOC:
> >   qemu-system-aarch64 \
> >       -machine xlnx-versal-virt -nographic -smp 2 -m 128 \
> >       -fsdev local,id=3Dshareid,path=3D${HOME}/work,security_model=3Dno=
ne \
> >       -device virtio-9p-device,fsdev=3Dshareid,mount_tag=3Dshare \
> >       -fsdev local,id=3Dshareid1,path=3D${HOME}/Music,security_model=3D=
none \
> >       -device virtio-9p-device,fsdev=3Dshareid1,mount_tag=3Dshare1
> >
> >   qemu-system-aarch64: ../migration/savevm.c:860:
> >   vmstate_register_with_alias_id:
> >   Assertion `!se->compat || se->instance_id =3D=3D 0' failed.
> >
> > This problem was fixed on arm virt platform in commit f58b39d2d5b
> > ("virtio-mmio: format transport base address in BusClass.get_dev_path")
> >
> > It works perfectly on arm virt platform. but there is still there on
> > xlnx-versal SOC.
> >
> > The main difference between arm virt and xlnx-versal is they use
> > different way to create virtio-mmio qdev. on arm virt, it calls
> > sysbus_create_simple("virtio-mmio", base, pic[irq]); which will call
> > sysbus_mmio_map internally and assign base address to subsys device
> > mmio correctly. but xlnx-versal's implements won't do this.
> >
> > However, xlnx-versal can't switch to sysbus_create_simple() to create
> > virtio-mmio device. It's because xlnx-versal's cpu use
> > VersalVirt.soc.fpd.apu.mr as it's memory. which is subregion of
> > system_memory. sysbus_create_simple will add virtio to system_memory,
> > which can't be accessed by cpu.
> >
> > Besides, xlnx-versal can't add sysbus_mmio_map api call too, because
> > this will add memory region to system_memory, and it can't be added
> > to VersalVirt.soc.fpd.apu.mr again.
> >
> > We can solve this by assign correct base address offset on dev_path.
> >
> > This path was test on aarch64 virt & xlnx-versal platform.
> >
> > Signed-off-by: schspa <schspa@gmail.com>
> > ---
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Applied to target-arm.next, thanks (unless MST would rather it
> go in via another route).
>
> -- PMM
>

--0000000000007e7a2a05bcd4f400
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you very much.<div><br></div><div>Best=C2=A0regards.=
</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Peter Maydell &lt;<a href=3D"mailto:peter.maydell@lina=
ro.org">peter.maydell@linaro.org</a>&gt; =E4=BA=8E2021=E5=B9=B43=E6=9C=885=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=887:57=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 25 F=
eb 2021 at 05:36, schspa &lt;<a href=3D"mailto:schspa@gmail.com" target=3D"=
_blank">schspa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; At the moment the following QEMU command line triggers an assertion<br=
>
&gt; failure On xlnx-versal SOC:<br>
&gt;=C2=A0 =C2=A0qemu-system-aarch64 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-machine xlnx-versal-virt -nographic -smp 2 =
-m 128 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-fsdev local,id=3Dshareid,path=3D${HOME}/wor=
k,security_model=3Dnone \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-device virtio-9p-device,fsdev=3Dshareid,mou=
nt_tag=3Dshare \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-fsdev local,id=3Dshareid1,path=3D${HOME}/Mu=
sic,security_model=3Dnone \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-device virtio-9p-device,fsdev=3Dshareid1,mo=
unt_tag=3Dshare1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0qemu-system-aarch64: ../migration/savevm.c:860:<br>
&gt;=C2=A0 =C2=A0vmstate_register_with_alias_id:<br>
&gt;=C2=A0 =C2=A0Assertion `!se-&gt;compat || se-&gt;instance_id =3D=3D 0&#=
39; failed.<br>
&gt;<br>
&gt; This problem was fixed on arm virt platform in commit f58b39d2d5b<br>
&gt; (&quot;virtio-mmio: format transport base address in BusClass.get_dev_=
path&quot;)<br>
&gt;<br>
&gt; It works perfectly on arm virt platform. but there is still there on<b=
r>
&gt; xlnx-versal SOC.<br>
&gt;<br>
&gt; The main difference between arm virt and xlnx-versal is they use<br>
&gt; different way to create virtio-mmio qdev. on arm virt, it calls<br>
&gt; sysbus_create_simple(&quot;virtio-mmio&quot;, base, pic[irq]); which w=
ill call<br>
&gt; sysbus_mmio_map internally and assign base address to subsys device<br=
>
&gt; mmio correctly. but xlnx-versal&#39;s implements won&#39;t do this.<br=
>
&gt;<br>
&gt; However, xlnx-versal can&#39;t switch to sysbus_create_simple() to cre=
ate<br>
&gt; virtio-mmio device. It&#39;s because xlnx-versal&#39;s cpu use<br>
&gt; <a href=3D"http://VersalVirt.soc.fpd.apu.mr" rel=3D"noreferrer" target=
=3D"_blank">VersalVirt.soc.fpd.apu.mr</a> as it&#39;s memory. which is subr=
egion of<br>
&gt; system_memory. sysbus_create_simple will add virtio to system_memory,<=
br>
&gt; which can&#39;t be accessed by cpu.<br>
&gt;<br>
&gt; Besides, xlnx-versal can&#39;t add sysbus_mmio_map api call too, becau=
se<br>
&gt; this will add memory region to system_memory, and it can&#39;t be adde=
d<br>
&gt; to <a href=3D"http://VersalVirt.soc.fpd.apu.mr" rel=3D"noreferrer" tar=
get=3D"_blank">VersalVirt.soc.fpd.apu.mr</a> again.<br>
&gt;<br>
&gt; We can solve this by assign correct base address offset on dev_path.<b=
r>
&gt;<br>
&gt; This path was test on aarch64 virt &amp; xlnx-versal platform.<br>
&gt;<br>
&gt; Signed-off-by: schspa &lt;<a href=3D"mailto:schspa@gmail.com" target=
=3D"_blank">schspa@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
Applied to target-arm.next, thanks (unless MST would rather it<br>
go in via another route).<br>
<br>
-- PMM<br>
</blockquote></div>

--0000000000007e7a2a05bcd4f400--

