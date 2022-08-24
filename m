Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C259FF82
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 18:30:06 +0200 (CEST)
Received: from localhost ([::1]:40434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQtGW-0006yj-NQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 12:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQt47-0002u8-6t
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 12:17:15 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQt44-0007VZ-CC
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 12:17:14 -0400
Received: by mail-ed1-x52f.google.com with SMTP id e21so17866066edc.7
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=l/eZfRKeusYkqPy61H4UXhMFfLOQGGrQDajedOeJlJU=;
 b=SS6JCWa1GjCIKdVSp3jUnfJbCiy84kgLjaoeHNV+3z4+fJG67PNSIqbUsZYGgLfNcM
 pFIUEETsW6nfrzuC37P6wtg3afjFgQrFrdKZaC362P5ctrHonGV5VIUJ+XYcrN9Rx625
 2+aoATbIT7lb6HYQEVOsfSKye+cbBlZcFVvXWA4xjrXBKZ2TFzOlbDlfL6X5q2q70LET
 lRddxL8hrjNBLPpFJg0rTa4/Fn8Sqj7IACdlb/ov+7Nnfzq+heQedAsIMsufhBVvjE+F
 0K8aXFFSFy4x+TfDUIQ+15qAWmZ3s59w+5MkawB7A/mpMyQrK8yyhg8qEph5LVEQQexx
 27mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=l/eZfRKeusYkqPy61H4UXhMFfLOQGGrQDajedOeJlJU=;
 b=Viyo6PFBq1wacoRwBDkMwmJ9/ruoaCpz/HyULFiTXOeGP8eR+WN2zUNMrDAdojbkyN
 JthLdk7NWaSfhSya/+1OtQFmr4J/kaEK/2fUNC+k1kAIl8CnZS7gkBVNW0Wh5bVK3YtE
 hoPNbpMiqgHX211ZFe5FMrj4oCquDcsl9uTiaLgowIOaFPkq0tBADGrbeYgoHs8e9Kee
 GtP5bTk2mRgB25hkvJ9n5uF8NFe/Z3sPx7174lF+NtJM+n28x8l7Uw65AwqUW5mCma5G
 XOFKLGUzSeggbrhyhRemEO+u/AU+NrwZbGJyCbO6IoUTBSZ8tkuERKVIi88g8YNQWb5x
 D1FA==
X-Gm-Message-State: ACgBeo2hHyFLcj+wn++gqFPvPGZ5oztlLCnJ2c+eLy+X+uZnQ5nxfi6h
 cp4HNE8RnUezRE34iGsl9UoMi68wIc22Tl5KFnsvTQ==
X-Google-Smtp-Source: AA6agR7mkC6ja3YozzN8XcZzQrYTrt3kz/em6Qo0fx2PR2zj/My5Iz1LDo97ChRIHuLckxl0wkxwAHplK8jTKQ5BuFI=
X-Received: by 2002:a05:6402:4311:b0:446:d0b0:17f4 with SMTP id
 m17-20020a056402431100b00446d0b017f4mr8145035edc.194.1661357829793; Wed, 24
 Aug 2022 09:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220822090811.427029-1-ani@anisinha.ca>
 <20220822090811.427029-3-ani@anisinha.ca>
 <20220824172429.058281c4@redhat.com>
In-Reply-To: <20220824172429.058281c4@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 24 Aug 2022 21:46:58 +0530
Message-ID: <CAARzgwz8inPfcTLvQx1tEVHdoB39jN_Vie0uS5_soEYd_yUHOA@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/acpi: set ATS capability explicitly per pcie root
 port
To: Igor Mammedov <imammedo@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, jusual@redhat.com,
 kkostiuk@redhat.com, 
 qemu-devel@nongnu.org, ybendito@redhat.com, yvugenfi@redhat.com
Content-Type: multipart/alternative; boundary="0000000000004a3d0605e6ff037b"
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52f.google.com
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

--0000000000004a3d0605e6ff037b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 8:54 PM Igor Mammedov <imammedo@redhat.com> wrote:

> On Mon, 22 Aug 2022 14:38:09 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > Currently the bit 0 of the flags field of Root Port ATS capability
> reporting
> > structure sub-table under the DMAR table is set to 1. This indicates
> ALL_PORTS,
> > thus enabling ATS capability for all pcie roots without the ability to
> turn off
> > ATS for some ports and leaving ATS on for others.
> >
> > This change clears the bit 0 of the flags field of the above structure
> and
> > explicitly adds scopes for every pcie root port in the structure so tha=
t
> ATS
> > is enabled for all of them. In future, we might add new attribite to th=
e
> root
> > ports so that we can selectively enable ATS for some and leave ATS off
> for
> > others.
>
> Thanks, it was worth a try,
> unfortunately since we are shooting in dark this time it was a miss.


So I take it that even with this patch Windows still exhibited the issue?
Is it worth pushing the patch anyway?


>
>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > Suggested-by: Michael Tsirkin <mst@redhat.com>
> > ---
> >  hw/i386/acpi-build.c | 74 ++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 72 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 0355bd3dda..9c5a555536 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -60,6 +60,7 @@
> >  #include "hw/i386/fw_cfg.h"
> >  #include "hw/i386/ich9.h"
> >  #include "hw/pci/pci_bus.h"
> > +#include "hw/pci/pcie_port.h"
> >  #include "hw/pci-host/q35.h"
> >  #include "hw/i386/x86-iommu.h"
> >
> > @@ -2118,6 +2119,60 @@ dmar_host_bridges(Object *obj, void *opaque)
> >      return 0;
> >  }
> >
> > +/*
> > + * Insert DMAR scope for PCIE root ports
> > + */
> > +static void
> > +insert_pcie_root_port_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
> > +{
> > +    const size_t device_scope_size =3D 6 + 2;
> > +                                   /* device scope structure + 1 path
> entry */
> > +    GArray *scope_blob =3D opaque;
> > +
> > +    /*
> > +     * We are only interested in PCIE root ports. We can extend
> > +     * this to check for specific properties of PCIE root ports and
> based
> > +     * on that remove some ports from having ATS capability.
> > +     */
> > +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCIE_ROOT_PORT)) {
> > +        return;
> > +    }
> > +
> > +    /* Dmar Scope Type: 0x02 for all PCIE root ports */
> > +    build_append_int_noprefix(scope_blob, 0x02, 1);
> > +
> > +    /* length */
> > +    build_append_int_noprefix(scope_blob, device_scope_size, 1);
> > +    /* reserved */
> > +    build_append_int_noprefix(scope_blob, 0, 2);
> > +    /* enumeration_id */
> > +    build_append_int_noprefix(scope_blob, 0, 1);
> > +    /* bus */
> > +    build_append_int_noprefix(scope_blob, pci_bus_num(bus), 1);
> > +    /* device */
> > +    build_append_int_noprefix(scope_blob, PCI_SLOT(dev->devfn), 1);
> > +    /* function */
> > +    build_append_int_noprefix(scope_blob, PCI_FUNC(dev->devfn), 1);
> > +}
> > +
> > +/* For a given PCI host bridge, walk and insert DMAR scope */
> > +static int
> > +dmar_pcie_root_ports(Object *obj, void *opaque)
> > +{
> > +    GArray *scope_blob =3D opaque;
> > +
> > +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> > +        PCIBus *bus =3D PCI_HOST_BRIDGE(obj)->bus;
> > +
> > +        if (bus && !pci_bus_bypass_iommu(bus)) {
> > +            pci_for_each_device_under_bus(bus,
> insert_pcie_root_port_scope,
> > +                                          scope_blob);
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  /*
> >   * Intel =C2=AE Virtualization Technology for Directed I/O
> >   * Architecture Specification. Revision 3.3
> > @@ -2190,11 +2245,26 @@ build_dmar_q35(GArray *table_data, BIOSLinker
> *linker, const char *oem_id,
> >
> >      if (iommu->dt_supported) {
> >          /* 8.5 Root Port ATS Capability Reporting Structure */
> > +        /*
> > +         * A PCI bus walk, for each PCIE root port.
> > +         * Since we did not enable ALL_PORTS bit in the flags above, w=
e
> > +         * need to add the scope for each pcie root port explicitly
> > +         * that are attached to bus0 with iommu enabled.
> > +         */
> > +        scope_blob =3D g_array_new(false, true, 1);
> > +        object_child_foreach_recursive(object_get_root(),
> > +                                       dmar_pcie_root_ports,
> scope_blob);
> > +
> >          build_append_int_noprefix(table_data, 2, 2); /* Type */
> > -        build_append_int_noprefix(table_data, 8, 2); /* Length */
> > -        build_append_int_noprefix(table_data, 1 /* ALL_PORTS */, 1); /=
*
> Flags */
> > +        build_append_int_noprefix(table_data,
> > +                                  8 + scope_blob->len, 2); /* Length *=
/
> > +        build_append_int_noprefix(table_data, 0, 1); /* Flags */
> >          build_append_int_noprefix(table_data, 0, 1); /* Reserved */
> >          build_append_int_noprefix(table_data, 0, 2); /* Segment Number
> */
> > +
> > +        /* now add the scope to the sub-table */
> > +        g_array_append_vals(table_data, scope_blob->data,
> scope_blob->len);
> > +        g_array_free(scope_blob, true);
> >      }
> >
> >      acpi_table_end(linker, &table);
>
>

--0000000000004a3d0605e6ff037b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 24, 2022 at 8:54 PM Igor Mammedov &lt;<a href=
=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)">On Mon, 22 Aug 2022 14:38:09 +0530<br>
Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@anis=
inha.ca</a>&gt; wrote:<br>
<br>
&gt; Currently the bit 0 of the flags field of Root Port ATS capability rep=
orting<br>
&gt; structure sub-table under the DMAR table is set to 1. This indicates A=
LL_PORTS,<br>
&gt; thus enabling ATS capability for all pcie roots without the ability to=
 turn off<br>
&gt; ATS for some ports and leaving ATS on for others.<br>
&gt; <br>
&gt; This change clears the bit 0 of the flags field of the above structure=
 and<br>
&gt; explicitly adds scopes for every pcie root port in the structure so th=
at ATS<br>
&gt; is enabled for all of them. In future, we might add new attribite to t=
he root<br>
&gt; ports so that we can selectively enable ATS for some and leave ATS off=
 for<br>
&gt; others.<br>
<br>
Thanks, it was worth a try,<br>
unfortunately since we are shooting in dark this time it was a miss.</block=
quote><div dir=3D"auto"><br></div><div dir=3D"auto">So I take it that even =
with this patch Windows still exhibited the issue?</div><div dir=3D"auto">I=
s it worth pushing the patch anyway?=C2=A0</div><div dir=3D"auto"><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)" dir=3D"auto"><br>
<br>
<br>
&gt; Signed-off-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=
=3D"_blank">ani@anisinha.ca</a>&gt;<br>
&gt; Suggested-by: Michael Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" ta=
rget=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/i386/acpi-build.c | 74 ++++++++++++++++++++++++++++++++++++++=
++++--<br>
&gt;=C2=A0 1 file changed, 72 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c<br>
&gt; index 0355bd3dda..9c5a555536 100644<br>
&gt; --- a/hw/i386/acpi-build.c<br>
&gt; +++ b/hw/i386/acpi-build.c<br>
&gt; @@ -60,6 +60,7 @@<br>
&gt;=C2=A0 #include &quot;hw/i386/fw_cfg.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/i386/ich9.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/pci/pci_bus.h&quot;<br>
&gt; +#include &quot;hw/pci/pcie_port.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/pci-host/q35.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/i386/x86-iommu.h&quot;<br>
&gt;=C2=A0 <br>
&gt; @@ -2118,6 +2119,60 @@ dmar_host_bridges(Object *obj, void *opaque)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +/*<br>
&gt; + * Insert DMAR scope for PCIE root ports<br>
&gt; + */<br>
&gt; +static void<br>
&gt; +insert_pcie_root_port_scope(PCIBus *bus, PCIDevice *dev, void *opaque=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const size_t device_scope_size =3D 6 + 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* device scope str=
ucture + 1 path entry */<br>
&gt; +=C2=A0 =C2=A0 GArray *scope_blob =3D opaque;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* We are only interested in PCIE root ports. We c=
an extend<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* this to check for specific properties of PCIE r=
oot ports and based<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* on that remove some ports from having ATS capab=
ility.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (!object_dynamic_cast(OBJECT(dev), TYPE_PCIE_ROOT_PO=
RT)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Dmar Scope Type: 0x02 for all PCIE root ports */<br>
&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(scope_blob, 0x02, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* length */<br>
&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(scope_blob, device_scope_size=
, 1);<br>
&gt; +=C2=A0 =C2=A0 /* reserved */<br>
&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(scope_blob, 0, 2);<br>
&gt; +=C2=A0 =C2=A0 /* enumeration_id */<br>
&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(scope_blob, 0, 1);<br>
&gt; +=C2=A0 =C2=A0 /* bus */<br>
&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(scope_blob, pci_bus_num(bus),=
 1);<br>
&gt; +=C2=A0 =C2=A0 /* device */<br>
&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(scope_blob, PCI_SLOT(dev-&gt;=
devfn), 1);<br>
&gt; +=C2=A0 =C2=A0 /* function */<br>
&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(scope_blob, PCI_FUNC(dev-&gt;=
devfn), 1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* For a given PCI host bridge, walk and insert DMAR scope */<br>
&gt; +static int<br>
&gt; +dmar_pcie_root_ports(Object *obj, void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 GArray *scope_blob =3D opaque;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIBus *bus =3D PCI_HOST_BRIDGE(obj)-&gt;=
bus;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bus &amp;&amp; !pci_bus_bypass_iommu(=
bus)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_for_each_device_under_b=
us(bus, insert_pcie_root_port_scope,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 scope_blob);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Intel =C2=AE Virtualization Technology for Directed I/O<=
br>
&gt;=C2=A0 =C2=A0* Architecture Specification. Revision 3.3<br>
&gt; @@ -2190,11 +2245,26 @@ build_dmar_q35(GArray *table_data, BIOSLinker =
*linker, const char *oem_id,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (iommu-&gt;dt_supported) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 8.5 Root Port ATS Capability Repo=
rting Structure */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* A PCI bus walk, for each PCIE roo=
t port.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Since we did not enable ALL_PORTS=
 bit in the flags above, we<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* need to add the scope for each pc=
ie root port explicitly<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* that are attached to bus0 with io=
mmu enabled.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 scope_blob =3D g_array_new(false, true, 1=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_child_foreach_recursive(object_get=
_root(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmar_=
pcie_root_ports, scope_blob);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_append_int_noprefix(table_data=
, 2, 2); /* Type */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 build_append_int_noprefix(table_data, 8, =
2); /* Length */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 build_append_int_noprefix(table_data, 1 /=
* ALL_PORTS */, 1); /* Flags */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 build_append_int_noprefix(table_data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8 + scope_blob-&gt;len, 2=
); /* Length */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 build_append_int_noprefix(table_data, 0, =
1); /* Flags */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_append_int_noprefix(table_data=
, 0, 1); /* Reserved */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_append_int_noprefix(table_data=
, 0, 2); /* Segment Number */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* now add the scope to the sub-table */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_array_append_vals(table_data, scope_blo=
b-&gt;data, scope_blob-&gt;len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_array_free(scope_blob, true);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 acpi_table_end(linker, &amp;table);<br>
<br>
</blockquote></div></div>

--0000000000004a3d0605e6ff037b--

