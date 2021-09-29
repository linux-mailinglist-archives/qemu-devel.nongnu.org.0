Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4C441C61F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:55:44 +0200 (CEST)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVa3j-0007Jl-TD
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1mVZqp-0006rP-DP
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1mVZqh-0004u4-OX
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632922931;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YpUrQqkJ2CpsyyvVXGbCevnliZa4jDGwOOUYVHT4aiQ=;
 b=B/Ysz6zm7rLTdNQnA97fY5Qb8uxJP0Ny5sK1aYiH0XyyJUbuCE9n7dM7GrzbamKxEoTp4d
 fsKW3d+beVIiwNgEdK3SfwWI7FqpRWIafLFl3zBPNEmCWDuHic+R69vbRSY1VqNtt1yR2K
 9KP7LsMI4Cm5cjUzpycVfxw7jhZK+jM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-BlACr_iKOCOp3h0S8NnzJw-1; Wed, 29 Sep 2021 09:42:02 -0400
X-MC-Unique: BlACr_iKOCOp3h0S8NnzJw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z62-20020a509e44000000b003da839b9821so2424338ede.15
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=YpUrQqkJ2CpsyyvVXGbCevnliZa4jDGwOOUYVHT4aiQ=;
 b=JH5eIZd1I887cIT24vW3VaQuJJBu6JtPlK0b+sY/tuxjApkrUw2JrpWvLJK6073NBw
 Ka2RCK7y3oqaz9O/jVTxihv2zB1Cag3jyWa0yj3shHEZ7TyI78te2XtBZe5p6o2fsTBb
 Vvb0c7ziWEcBqNpAYe9FBl2zOK5s8oYVUzNa14EQRkYxGuyTjX6sCeOwnRlZ/8AoaRhI
 Ie5o+FHRA2166bdLjhys10MxJWFjHIqZmzQjSreugMfyCUAQ7h7aDlFh9QUFiKM43Clj
 iHb6Gfxj7HwOp1cwmQXb32mgO0/AnNapFHrPPZsYu+qr8xugWxehNBffxEhvPrbdhM04
 bvLw==
X-Gm-Message-State: AOAM533Wv0anBv0hj2vYB6ing0eovVw1h8zoUk8FIek8PQ+9dPy5CkNm
 jMGWOIWbS9X2k2asHcGuspib6iqPQ3NWJJxABxTSh/zGsjSXoB3YoHKGWmsBPnn5+kSH6Ym40Rn
 Ip64BqBTF9dR02j0CHiDKToL2xnduaEs=
X-Received: by 2002:a17:907:7f8e:: with SMTP id
 qk14mr13589036ejc.91.1632922921014; 
 Wed, 29 Sep 2021 06:42:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu3Eh8t+IzQq8exuCnEzV5Qi4Nyyb9Lqi3DtTO2jjcdh2wQ/CK5FN2zin7yS4IWb7tXNiWPRBHAYbYVD+e/RM=
X-Received: by 2002:a17:907:7f8e:: with SMTP id
 qk14mr13589011ejc.91.1632922920807; 
 Wed, 29 Sep 2021 06:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210803205043.165034-1-mst@redhat.com>
 <20210803205043.165034-2-mst@redhat.com>
 <YVGP9vdTtu5sRVpl@redhat.com> <20210927053932-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210927053932-mutt-send-email-mst@kernel.org>
From: Marcel Apfelbaum <mapfelba@redhat.com>
Date: Wed, 29 Sep 2021 16:41:49 +0300
Message-ID: <CA+aaKfDO_KRZYova9fGkPAr0vgh=YygATZ87iwrfqeV=CyN=tg@mail.gmail.com>
Subject: Re: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mapfelba@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a4039905cd227e36"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mapfelba@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a4039905cd227e36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, Sep 27, 2021 at 12:49 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrote:
> > > From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > >
> > > Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> > > As opposed to native PCIe hotplug, guests like Fedora 34
> > > will not assign IO range to pcie-root-ports not supporting
> > > native hotplug, resulting into a regression.
> > >
> > > Reproduce by:
> > >     qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -monitor stdio
> > >     device_add e1000,bus=3Dp1
> > > In the Guest OS the respective pcie-root-port will have the IO range
> > > disabled.
> > >
> > > Fix it by setting the "reserve-io" hint capability of the
> > > pcie-root-ports so the firmware will allocate the IO range instead.
> > >
> > > Acked-by: Igor Mammedov <imammedo@redhat.com>
> > > Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> > > Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> >
> > This change, when combined with the switch to ACPI based hotplug by
> > default, is responsible for a significant regression in QEMU 6.1.0
> >
> > It is no longer possible to have more than 15 pcie-root-port devices
> > added to a q35 VM in 6.1.0.  Before this I've had as many as 80+ device=
s
> > present before I stopped trying to add more.
> >
> >   https://gitlab.com/qemu-project/qemu/-/issues/641
> >
> > This regression is significant, because it has broken the out of the
> > box default configuration that OpenStack uses for booting all VMs.
> > They add 16 pcie-root-ports by defalt to allow empty slots for device
> > hotplug under q35 [1].
>
>
> Indeed, oops. Thanks for the report!
>
> Going back and looking at seabios code, didn't we get confused?
> Shouldn't we have reserved memory and not IO?
>

We need the IO space for the legacy PCI bridges, otherwise an empty PCI
bridge will become unusable.


>
> I see:
>             int resource_optional =3D pcie_cap && (type =3D=3D
> PCI_REGION_TYPE_IO);
>             if (!sum && hotplug_support && !resource_optional)
>                 sum =3D align; /* reserve min size for hot-plug */
>
>
> generally maybe we should just add an ACPI-hotplug capability and
> teach seabios about it?
>

I suppose it is possible.

Thanks,
Marcel


>
> Marcel?
>
> > > diff --git a/hw/pci-bridge/gen_pcie_root_port.c
> b/hw/pci-bridge/gen_pcie_root_port.c
> > > index ec9907917e..20099a8ae3 100644
> > > --- a/hw/pci-bridge/gen_pcie_root_port.c
> > > +++ b/hw/pci-bridge/gen_pcie_root_port.c
> > > @@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort,
> GEN_PCIE_ROOT_PORT)
> > >          (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
> > >
> > >  #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR       1
> > > +#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE          4096
> > >
> > >  struct GenPCIERootPort {
> > >      /*< private >*/
> > > @@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaque,
> int version_id)
> > >  static void gen_rp_realize(DeviceState *dev, Error **errp)
> > >  {
> > >      PCIDevice *d =3D PCI_DEVICE(dev);
> > > +    PCIESlot *s =3D PCIE_SLOT(d);
> > >      GenPCIERootPort *grp =3D GEN_PCIE_ROOT_PORT(d);
> > >      PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_GET_CLASS(d);
> > >      Error *local_err =3D NULL;
> > > @@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Error
> **errp)
> > >          return;
> > >      }
> > >
> > > +    if (grp->res_reserve.io =3D=3D -1 && s->hotplug &&
> !s->native_hotplug) {
> > > +        grp->res_reserve.io =3D GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
> > > +    }
> > >      int rc =3D pci_bridge_qemu_reserve_cap_init(d, 0,
> > >                                                grp->res_reserve, errp=
);
> > >
> > > --
> > > MST
> > >
> > >
> >
> > Regards,
> > Daniel
> >
> > [1]
> https://github.com/openstack/tripleo-heat-templates/blob/7a6cd0640ec390a3=
30f5699d8ed60f71b2a9f514/deployment/nova/nova-compute-container-puppet.yaml=
#L462-L472
> > --
> > |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--000000000000a4039905cd227e36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Michael,</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 27, 2021 at 1=
2:49 PM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrang=C3=A9 wrote=
:<br>
&gt; On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrote:<br=
>
&gt; &gt; From: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbaum@gma=
il.com" target=3D"_blank">marcel.apfelbaum@gmail.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Q35 has now ACPI hotplug enabled by default for PCI(e) devices.<b=
r>
&gt; &gt; As opposed to native PCIe hotplug, guests like Fedora 34<br>
&gt; &gt; will not assign IO range to pcie-root-ports not supporting<br>
&gt; &gt; native hotplug, resulting into a regression.<br>
&gt; &gt; <br>
&gt; &gt; Reproduce by:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0qemu-bin -M q35 -device pcie-root-port,id=3Dp1=
 -monitor stdio<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0device_add e1000,bus=3Dp1<br>
&gt; &gt; In the Guest OS the respective pcie-root-port will have the IO ra=
nge<br>
&gt; &gt; disabled.<br>
&gt; &gt; <br>
&gt; &gt; Fix it by setting the &quot;reserve-io&quot; hint capability of t=
he<br>
&gt; &gt; pcie-root-ports so the firmware will allocate the IO range instea=
d.<br>
&gt; &gt; <br>
&gt; &gt; Acked-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com=
" target=3D"_blank">imammedo@redhat.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel@redh=
at.com" target=3D"_blank">marcel@redhat.com</a>&gt;<br>
&gt; &gt; Message-Id: &lt;<a href=3D"mailto:20210802090057.1709775-1-marcel=
@redhat.com" target=3D"_blank">20210802090057.1709775-1-marcel@redhat.com</=
a>&gt;<br>
&gt; &gt; Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.=
com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redha=
t.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 hw/pci-bridge/gen_pcie_root_port.c | 5 +++++<br>
&gt; &gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; This change, when combined with the switch to ACPI based hotplug by<br=
>
&gt; default, is responsible for a significant regression in QEMU 6.1.0<br>
&gt; <br>
&gt; It is no longer possible to have more than 15 pcie-root-port devices<b=
r>
&gt; added to a q35 VM in 6.1.0.=C2=A0 Before this I&#39;ve had as many as =
80+ devices<br>
&gt; present before I stopped trying to add more.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/6=
41" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qe=
mu/-/issues/641</a><br>
&gt; <br>
&gt; This regression is significant, because it has broken the out of the<b=
r>
&gt; box default configuration that OpenStack uses for booting all VMs.<br>
&gt; They add 16 pcie-root-ports by defalt to allow empty slots for device<=
br>
&gt; hotplug under q35 [1].<br>
<br>
<br>
Indeed, oops. Thanks for the report!<br>
<br>
Going back and looking at seabios code, didn&#39;t we get confused?<br>
Shouldn&#39;t we have reserved memory and not IO?<br></blockquote><div><br>=
</div><div>We need the IO space for the legacy PCI bridges, otherwise an em=
pty PCI bridge will become unusable.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
I see:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int resource_optional =3D pcie_ca=
p &amp;&amp; (type =3D=3D PCI_REGION_TYPE_IO);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sum &amp;&amp; hotplug_suppo=
rt &amp;&amp; !resource_optional)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D align; /* r=
eserve min size for hot-plug */<br>
<br>
<br>
generally maybe we should just add an ACPI-hotplug capability and<br>
teach seabios about it?<br></blockquote><div><br></div><div>I suppose it is=
 possible.</div><div><br></div><div>Thanks,</div><div>Marcel</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Marcel?<br>
<br>
&gt; &gt; diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/g=
en_pcie_root_port.c<br>
&gt; &gt; index ec9907917e..20099a8ae3 100644<br>
&gt; &gt; --- a/hw/pci-bridge/gen_pcie_root_port.c<br>
&gt; &gt; +++ b/hw/pci-bridge/gen_pcie_root_port.c<br>
&gt; &gt; @@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort, GEN=
_PCIE_ROOT_PORT)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (GEN_PCIE_ROOT_PORT_AER_OFFSET =
+ PCI_ERR_SIZEOF)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR=C2=A0 =C2=A0 =C2=
=A0 =C2=A01<br>
&gt; &gt; +#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 4096<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 struct GenPCIERootPort {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt; &gt; @@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaq=
ue, int version_id)<br>
&gt; &gt;=C2=A0 static void gen_rp_realize(DeviceState *dev, Error **errp)<=
br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 PCIDevice *d =3D PCI_DEVICE(dev);<br>
&gt; &gt; +=C2=A0 =C2=A0 PCIESlot *s =3D PCIE_SLOT(d);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 GenPCIERootPort *grp =3D GEN_PCIE_ROOT_PORT(d=
);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_GET=
_CLASS(d);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt; &gt; @@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Er=
ror **errp)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; +=C2=A0 =C2=A0 if (grp-&gt;<a href=3D"http://res_reserve.io" rel=
=3D"noreferrer" target=3D"_blank">res_reserve.io</a> =3D=3D -1 &amp;&amp; s=
-&gt;hotplug &amp;&amp; !s-&gt;native_hotplug) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grp-&gt;<a href=3D"http://res_reserv=
e.io" rel=3D"noreferrer" target=3D"_blank">res_reserve.io</a> =3D GEN_PCIE_=
ROOT_DEFAULT_IO_RANGE;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int rc =3D pci_bridge_qemu_reserve_cap_init(d=
, 0,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 grp-&gt;res_reserve, errp);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -- <br>
&gt; &gt; MST<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; Regards,<br>
&gt; Daniel<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/openstack/tripleo-heat-templates/blo=
b/7a6cd0640ec390a330f5699d8ed60f71b2a9f514/deployment/nova/nova-compute-con=
tainer-puppet.yaml#L462-L472" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/openstack/tripleo-heat-templates/blob/7a6cd0640ec390a330f5699d8e=
d60f71b2a9f514/deployment/nova/nova-compute-container-puppet.yaml#L462-L472=
</a><br>
&gt; -- <br>
&gt; |: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blan=
k">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_bla=
nk">https://www.flickr.com/photos/dberrange</a> :|<br>
&gt; |: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank=
">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=
=3D"noreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
&gt; |: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D=
"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a hr=
ef=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--000000000000a4039905cd227e36--


