Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCEE41C64E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:07:01 +0200 (CEST)
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaEe-0007lV-AR
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1mVa3d-0000OV-Pd
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1mVa3Z-0005Zo-AA
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632923728;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KiCDPW/zNUgsLC5EWY1Lx1+c9h/nuyk3gn5/ejYZG1I=;
 b=aj33UThnOLI5+YS/AkbefOVWuD1cf7ViBVUFGFU92L/YXQ2O1bLeXk3qNNgdo9pfT1YqJH
 e+XRttxgXEQmjjQuriKEhDnD4WgUU6p0aUQM2koO59sLCx1HwXNZ5DjdjQoiywvVKeENFB
 K1/zqjDEda+zsjbi+NVXIZeNpKpftuw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-1rqSAqPHNoqzVT8O9bC4rw-1; Wed, 29 Sep 2021 09:55:22 -0400
X-MC-Unique: 1rqSAqPHNoqzVT8O9bC4rw-1
Received: by mail-ed1-f70.google.com with SMTP id
 ec14-20020a0564020d4e00b003cf5630c190so2531838edb.3
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=KiCDPW/zNUgsLC5EWY1Lx1+c9h/nuyk3gn5/ejYZG1I=;
 b=HIZr8k6bdoUMNTTDIANjcnhZ4dTcns6lfBjKcJMz+2t0c8x1bH0tkCnw0Ojo2C4bWS
 5YghUmtA+XIZZBu/NqK1E4/lZIxAq46bnmiD43vlUvLDsEot+DP0lSfu4XQtm2TdY4Gr
 dnR+1XYL1y3HYPmlxgyPFEV++gS1WS6osZGwPDVSExmcXpCIGEHHEwPjEZ4htu1REdZz
 lehx43yCiF8lfzurJ96f3i4ElesRVRCYhKreS4D9rdkW23eg+X9sVqL/OaKWtWEUZvPx
 oVch9k+MpBjQLxFFw4Sh19bUkkigBxcrLVLP2cN6Bo37ALxtfNN0WDjRgXP1N4ReCWIH
 z1hA==
X-Gm-Message-State: AOAM5307ARL8379h16cDlGMk26MAcvVgEQsal5Ew9RuH8no7wHoluvEW
 sAo+zp3FuOPzUIO2Psksow48AWN7DozUt88ScvmfD77yR8JT+d28Uv3kMaOkA5/G2Od4YRL/R6G
 uH1p29N+IPZYVmFbjDoAJvfrEK9UhrCg=
X-Received: by 2002:aa7:df9a:: with SMTP id b26mr42530edy.368.1632923721798;
 Wed, 29 Sep 2021 06:55:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnjSGDJ8AIoaq+bukG8h4cwztB5HGCNt4N+NS/0lMEtVyfKHB2z0p2fQt0e0yShLwMoN3jrBtJNslvryUrU3U=
X-Received: by 2002:aa7:df9a:: with SMTP id b26mr42509edy.368.1632923721603;
 Wed, 29 Sep 2021 06:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210803205043.165034-1-mst@redhat.com>
 <20210803205043.165034-2-mst@redhat.com>
 <YVGP9vdTtu5sRVpl@redhat.com> <20210927053932-mutt-send-email-mst@kernel.org>
 <YVQsR898/knP1y3M@redhat.com>
In-Reply-To: <YVQsR898/knP1y3M@redhat.com>
From: Marcel Apfelbaum <mapfelba@redhat.com>
Date: Wed, 29 Sep 2021 16:55:10 +0300
Message-ID: <CA+aaKfAb3ms37is0hpmbw14BvHKkZei+JAy0nsTUmENvPD0Rhw@mail.gmail.com>
Subject: Re: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mapfelba@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005f312e05cd22ae70"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mapfelba@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: marcel@redhat.com
Cc: Marcel Apfelbaum <marcel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005f312e05cd22ae70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, Sep 29, 2021 at 12:05 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> On Mon, Sep 27, 2021 at 05:49:15AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrote:
> > > > From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > > >
> > > > Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> > > > As opposed to native PCIe hotplug, guests like Fedora 34
> > > > will not assign IO range to pcie-root-ports not supporting
> > > > native hotplug, resulting into a regression.
> > > >
> > > > Reproduce by:
> > > >     qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -monitor stdio
> > > >     device_add e1000,bus=3Dp1
> > > > In the Guest OS the respective pcie-root-port will have the IO rang=
e
> > > > disabled.
> > > >
> > > > Fix it by setting the "reserve-io" hint capability of the
> > > > pcie-root-ports so the firmware will allocate the IO range instead.
> > > >
> > > > Acked-by: Igor Mammedov <imammedo@redhat.com>
> > > > Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> > > > Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
> > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > >
> > > This change, when combined with the switch to ACPI based hotplug by
> > > default, is responsible for a significant regression in QEMU 6.1.0
> > >
> > > It is no longer possible to have more than 15 pcie-root-port devices
> > > added to a q35 VM in 6.1.0.  Before this I've had as many as 80+
> devices
> > > present before I stopped trying to add more.
> > >
> > >   https://gitlab.com/qemu-project/qemu/-/issues/641
> > >
> > > This regression is significant, because it has broken the out of the
> > > box default configuration that OpenStack uses for booting all VMs.
> > > They add 16 pcie-root-ports by defalt to allow empty slots for device
> > > hotplug under q35 [1].
>


That's bad!


> >
> >
> > Indeed, oops. Thanks for the report!
> >
> > Going back and looking at seabios code, didn't we get confused?
> > Shouldn't we have reserved memory and not IO?
> >
> > I see:
> >             int resource_optional =3D pcie_cap && (type =3D=3D
> PCI_REGION_TYPE_IO);
> >             if (!sum && hotplug_support && !resource_optional)
> >                 sum =3D align; /* reserve min size for hot-plug */
> >
> >
> > generally maybe we should just add an ACPI-hotplug capability and
> > teach seabios about it?
>
> Looking at the commit message example:
>
>    qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -monitor stdio
>    device_add e1000,bus=3Dp1
>
> IIUC, that is plugging a PCI device into the PCIe root port.
>
> docs/pcie.txt says that IO space is not allocated by SeaBIOS
> or OVMF for pcie-root-port, if
>
>     (1) the port is empty, or
>     (2) the device behind the port has no IO BARs.
>
> Point (2) is satisified if you only ever plug PCIe devces into
> the pcie-root-port. The docs/pcie.txt recommends exactly that,
> with any PCI device to be placed downstream of a pcie-pci-bridge
> and pci-pci-bridge pair.
>
> IOW that example from the commit message should have been
>
>   qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -monitor stdio \
>        -device pcie-pci-bridge,id=3Dbr1,bus=3Dpcie.0] \
>        -device pci-bridge,id=3Dbr2,bus=3Dbr1,chassis_nr=3D1
>   device-add e1000,bus=3Dbr2
>
> So why did we need IO space for the pcie-root-port at all ?
>

We don't... we need it for the pci-bridge.
The patch addressed a regression seen in Fedora 33/34 hosts.
PCIe hot-plug for pcie-root ports allowed legacy PCI devices to be
hot-plugged,
while the ACPI based hotplug didn't.

The patch tried to fix the problem by pre-allocating IO space at SeaBIOS
level,
but it seems it is not the optimal solution.

That means it was the Guest OS that allocated the IO range when necessary,
making the decision at firmware level is wrong.

I confirm we have to find a better solution.

Thanks,
marcel


> The example given as the reason just looks like user error
> per the docs/pcie.txt
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000005f312e05cd22ae70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 29, 2021 at 12:05 P=
M Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berran=
ge@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Mon, Sep 27, 2021 at 05:49:15AM -0400, Michael S. Tsirkin w=
rote:<br>
&gt; On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrang=C3=A9 wrot=
e:<br>
&gt; &gt; On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrot=
e:<br>
&gt; &gt; &gt; From: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbau=
m@gmail.com" target=3D"_blank">marcel.apfelbaum@gmail.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Q35 has now ACPI hotplug enabled by default for PCI(e) devic=
es.<br>
&gt; &gt; &gt; As opposed to native PCIe hotplug, guests like Fedora 34<br>
&gt; &gt; &gt; will not assign IO range to pcie-root-ports not supporting<b=
r>
&gt; &gt; &gt; native hotplug, resulting into a regression.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Reproduce by:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0qemu-bin -M q35 -device pcie-root-port,id=
=3Dp1 -monitor stdio<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0device_add e1000,bus=3Dp1<br>
&gt; &gt; &gt; In the Guest OS the respective pcie-root-port will have the =
IO range<br>
&gt; &gt; &gt; disabled.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Fix it by setting the &quot;reserve-io&quot; hint capability=
 of the<br>
&gt; &gt; &gt; pcie-root-ports so the firmware will allocate the IO range i=
nstead.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Acked-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redha=
t.com" target=3D"_blank">imammedo@redhat.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel=
@redhat.com" target=3D"_blank">marcel@redhat.com</a>&gt;<br>
&gt; &gt; &gt; Message-Id: &lt;<a href=3D"mailto:20210802090057.1709775-1-m=
arcel@redhat.com" target=3D"_blank">20210802090057.1709775-1-marcel@redhat.=
com</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@re=
dhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@=
redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 hw/pci-bridge/gen_pcie_root_port.c | 5 +++++<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; This change, when combined with the switch to ACPI based hotplug =
by<br>
&gt; &gt; default, is responsible for a significant regression in QEMU 6.1.=
0<br>
&gt; &gt; <br>
&gt; &gt; It is no longer possible to have more than 15 pcie-root-port devi=
ces<br>
&gt; &gt; added to a q35 VM in 6.1.0.=C2=A0 Before this I&#39;ve had as man=
y as 80+ devices<br>
&gt; &gt; present before I stopped trying to add more.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/qemu-project/qemu/-/iss=
ues/641" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-proje=
ct/qemu/-/issues/641</a><br>
&gt; &gt; <br>
&gt; &gt; This regression is significant, because it has broken the out of =
the<br>
&gt; &gt; box default configuration that OpenStack uses for booting all VMs=
.<br>
&gt; &gt; They add 16 pcie-root-ports by defalt to allow empty slots for de=
vice<br>
&gt; &gt; hotplug under q35 [1].<br></blockquote><div><br></div><div><br></=
div><div>That&#39;s bad!</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
&gt; <br>
&gt; <br>
&gt; Indeed, oops. Thanks for the report!<br>
&gt; <br>
&gt; Going back and looking at seabios code, didn&#39;t we get confused?<br=
>
&gt; Shouldn&#39;t we have reserved memory and not IO?<br>
&gt; <br>
&gt; I see:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int resource_optional =
=3D pcie_cap &amp;&amp; (type =3D=3D PCI_REGION_TYPE_IO);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sum &amp;&amp; hot=
plug_support &amp;&amp; !resource_optional)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sum =3D a=
lign; /* reserve min size for hot-plug */<br>
&gt; <br>
&gt; <br>
&gt; generally maybe we should just add an ACPI-hotplug capability and<br>
&gt; teach seabios about it?<br>
<br>
Looking at the commit message example:<br>
<br>
=C2=A0 =C2=A0qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -monitor stdio<=
br>
=C2=A0 =C2=A0device_add e1000,bus=3Dp1<br>
<br>
IIUC, that is plugging a PCI device into the PCIe root port.<br>
<br>
docs/pcie.txt says that IO space is not allocated by SeaBIOS<br>
or OVMF for pcie-root-port, if<br>
<br>
=C2=A0 =C2=A0 (1) the port is empty, or<br>
=C2=A0 =C2=A0 (2) the device behind the port has no IO BARs.<br>
<br>
Point (2) is satisified if you only ever plug PCIe devces into<br>
the pcie-root-port. The docs/pcie.txt recommends exactly that,<br>
with any PCI device to be placed downstream of a pcie-pci-bridge<br>
and pci-pci-bridge pair.<br>
<br>
IOW that example from the commit message should have been <br>
<br>
=C2=A0 qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -monitor stdio \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0-device pcie-pci-bridge,id=3Dbr1,bus=3Dpcie.0] \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0-device pci-bridge,id=3Dbr2,bus=3Dbr1,chassis_nr=
=3D1<br>
=C2=A0 device-add e1000,bus=3Dbr2<br>
<br>
So why did we need IO space for the pcie-root-port at all ?<br></blockquote=
><div><br></div><div>We don&#39;t... we need it for the pci-bridge.</div><d=
iv>The patch addressed a regression seen in Fedora 33/34 hosts.</div><div>P=
CIe hot-plug for pcie-root ports allowed legacy PCI devices to be hot-plugg=
ed,</div><div>while the ACPI based hotplug didn&#39;t.</div><div><br></div>=
<div>The patch tried to fix the problem by pre-allocating IO space at SeaBI=
OS level,</div><div>but it seems it is not the optimal solution.</div><div>=
<br></div><div>That means it was the Guest OS that allocated the IO range w=
hen necessary,</div><div>making the decision at firmware level is wrong.</d=
iv><div><br></div><div>I confirm we have to find a better solution.</div><d=
iv><br></div><div>Thanks,</div><div>marcel</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
The example given as the reason just looks like user error<br>
per the docs/pcie.txt<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--0000000000005f312e05cd22ae70--


