Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9222D329C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:28:17 +0100 (CET)
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiem-00085N-BM
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kmi6u-0001mI-6E
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:53:16 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kmi6r-0004Ak-JL
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:53:15 -0500
Received: by mail-pf1-x441.google.com with SMTP id b26so14751679pfi.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbGwFDutkBMauRi37RrK0uOYcdaoRlHi3R0B+Ghuz3o=;
 b=RMtvNsbXk1L/WE0I0r2b2EwMdkSMpiKbJ436swpMtvndHg2OWYD4Hc5hmxoa2sr8pv
 6iHOAMd6fVkQndZZVHFnykouW1+SeHGOM9m0nxbCDM50PFnl0HchThhPW7cg5AhL6hbl
 BK3bD5z3PtiEsD6q90tiac0l7DLHMI3sHf84uO/95W4juk07tbo2PNCEa8DCIOJnlJ7/
 yKSiHIh3KfzWPdqvWn0+8ghREAa9MoQYH99OZLrjlFxAWAN4hnPVog1gE5hXRvWixS6Y
 CfV00BJiTqtD/k/hHqiwvTC7yYZg+EOuqjtSg5lQfpjuCqhwRCmcy7OqP6Hjua7BQEmW
 pq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbGwFDutkBMauRi37RrK0uOYcdaoRlHi3R0B+Ghuz3o=;
 b=f7aFrk2IFuF5LnHDvUjlqsmBXPW4IpheUDcomkY7n9tPGhvwx33sSQ+5Oo+shirSoK
 +xAJS+4+3lYte9FN0+pS5xJoxwr+0tiQpWR/GfYjxYUBCBVAco9QPChMVyxEd5dP0ixW
 KLsPXmgvQzMYpIo9KbN1DWvTsZnULX0UjPiH118HHHe/tKaU4pCALOIc4YhWG5Ti6ytN
 snCY882K9z2UKntgdQKen1gaX6YLgVjUh6xX2nAmyE3BDwObElXwyu3ushWs/TS+U8OP
 PmZrIGk2X4F5mjUC6vKnIr3/0HixiC5R0256ljfrEPh/ellYpQMgaEq0bZ/Aee0p4CFo
 wYJg==
X-Gm-Message-State: AOAM5303KFNXFOuRHdix8A2KQW5hW2XjNRwgVhQbGsEr9fsr99HOj5bR
 JvILi9hJ7y4M6ke1+FRV8k2EfVEO3bCqcLa/YRVlRg==
X-Google-Smtp-Source: ABdhPJyxtqmx99ZVvgebC1NRTGzmomc+6e3KlT96EhRYdtN/0BJI/gx17dh/VR0qBktnzk9plgfyUpF2AADMEuS3MKk=
X-Received: by 2002:a17:90a:73c2:: with SMTP id
 n2mr5661034pjk.37.1607453588516; 
 Tue, 08 Dec 2020 10:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20201203110713.204938-1-andrew@daynix.com>
 <20201203110713.204938-3-andrew@daynix.com>
 <20201208133524-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201208133524-mutt-send-email-mst@kernel.org>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Tue, 8 Dec 2020 21:25:46 +0200
Message-ID: <CABcq3pEe3aNuKXOtQNxjupEMHr3YAu+evM9hjZF97kAh19gb9g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hw/virtio-pci Added AER capability.
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000023055c05b5f8745a"
Received-SPF: none client-ip=2607:f8b0:4864:20::441;
 envelope-from=andrew@daynix.com; helo=mail-pf1-x441.google.com
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000023055c05b5f8745a
Content-Type: text/plain; charset="UTF-8"

Good point.
I'll add checks during initialization.


On Tue, Dec 8, 2020 at 8:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Thu, Dec 03, 2020 at 01:07:13PM +0200, andrew@daynix.com wrote:
> > From: Andrew <andrew@daynix.com>
> >
> > Added AER capability for virtio-pci devices.
> > Also added property for devices, by default AER is disabled.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  hw/virtio/virtio-pci.c | 16 ++++++++++++++++
> >  hw/virtio/virtio-pci.h |  4 ++++
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index ceaa233129..f863f69ede 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -1817,6 +1817,12 @@ static void virtio_pci_realize(PCIDevice
> *pci_dev, Error **errp)
> >           */
> >          pci_set_word(pci_dev->config + pos + PCI_PM_PMC, 0x3);
> >
> > +        if (proxy->flags & VIRTIO_PCI_FLAG_AER) {
> > +            pcie_aer_init(pci_dev, PCI_ERR_VER, last_pcie_cap_offset,
> > +                          PCI_ERR_SIZEOF, NULL);
> > +            last_pcie_cap_offset += PCI_ERR_SIZEOF;
> > +        }
> > +
> >          if (proxy->flags & VIRTIO_PCI_FLAG_INIT_DEVERR) {
> >              /* Init error enabling flags */
> >              pcie_cap_deverr_init(pci_dev);
>
> My only issue here is that if requested for a non express device,
> it will assert instead of a graceful failure.
> Can be fixed as a patch on top though.
>
> > @@ -1858,7 +1864,15 @@ static void virtio_pci_realize(PCIDevice
> *pci_dev, Error **errp)
> >
> >  static void virtio_pci_exit(PCIDevice *pci_dev)
> >  {
> > +    VirtIOPCIProxy *proxy = VIRTIO_PCI(pci_dev);
> > +    bool pcie_port = pci_bus_is_express(pci_get_bus(pci_dev)) &&
> > +                     !pci_bus_is_root(pci_get_bus(pci_dev));
> > +
> >      msix_uninit_exclusive_bar(pci_dev);
> > +    if (proxy->flags & VIRTIO_PCI_FLAG_AER && pcie_port &&
> > +        pci_is_express(pci_dev)) {
> > +        pcie_aer_exit(pci_dev);
> > +    }
> >  }
> >
> >  static void virtio_pci_reset(DeviceState *qdev)
> > @@ -1911,6 +1925,8 @@ static Property virtio_pci_properties[] = {
> >                      VIRTIO_PCI_FLAG_INIT_PM_BIT, true),
> >      DEFINE_PROP_BIT("x-pcie-flr-init", VirtIOPCIProxy, flags,
> >                      VIRTIO_PCI_FLAG_INIT_FLR_BIT, true),
> > +    DEFINE_PROP_BIT("aer", VirtIOPCIProxy, flags,
> > +                    VIRTIO_PCI_FLAG_AER_BIT, false),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> > index 06e2af12de..d7d5d403a9 100644
> > --- a/hw/virtio/virtio-pci.h
> > +++ b/hw/virtio/virtio-pci.h
> > @@ -41,6 +41,7 @@ enum {
> >      VIRTIO_PCI_FLAG_INIT_LNKCTL_BIT,
> >      VIRTIO_PCI_FLAG_INIT_PM_BIT,
> >      VIRTIO_PCI_FLAG_INIT_FLR_BIT,
> > +    VIRTIO_PCI_FLAG_AER_BIT,
> >  };
> >
> >  /* Need to activate work-arounds for buggy guests at vmstate load. */
> > @@ -80,6 +81,9 @@ enum {
> >  /* Init Function Level Reset capability */
> >  #define VIRTIO_PCI_FLAG_INIT_FLR (1 << VIRTIO_PCI_FLAG_INIT_FLR_BIT)
> >
> > +/* Advanced Error Reporting capability */
> > +#define VIRTIO_PCI_FLAG_AER (1 << VIRTIO_PCI_FLAG_AER_BIT)
> > +
> >  typedef struct {
> >      MSIMessage msg;
> >      int virq;
> > --
> > 2.29.2
>
>

--00000000000023055c05b5f8745a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Good point. <br></div><div>I&#39;ll add checks during=
 initialization.<br></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Dec 8, 2020 at 8:37 PM Michael S. Tsi=
rkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Dec 03, 20=
20 at 01:07:13PM +0200, <a href=3D"mailto:andrew@daynix.com" target=3D"_bla=
nk">andrew@daynix.com</a> wrote:<br>
&gt; From: Andrew &lt;<a href=3D"mailto:andrew@daynix.com" target=3D"_blank=
">andrew@daynix.com</a>&gt;<br>
&gt; <br>
&gt; Added AER capability for virtio-pci devices.<br>
&gt; Also added property for devices, by default AER is disabled.<br>
&gt; <br>
&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.=
com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/virtio/virtio-pci.c | 16 ++++++++++++++++<br>
&gt;=C2=A0 hw/virtio/virtio-pci.h |=C2=A0 4 ++++<br>
&gt;=C2=A0 2 files changed, 20 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c<br>
&gt; index ceaa233129..f863f69ede 100644<br>
&gt; --- a/hw/virtio/virtio-pci.c<br>
&gt; +++ b/hw/virtio/virtio-pci.c<br>
&gt; @@ -1817,6 +1817,12 @@ static void virtio_pci_realize(PCIDevice *pci_d=
ev, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_set_word(pci_dev-&gt;config + po=
s + PCI_PM_PMC, 0x3);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (proxy-&gt;flags &amp; VIRTIO_PCI_FLAG=
_AER) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pcie_aer_init(pci_dev, PCI_=
ERR_VER, last_pcie_cap_offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 PCI_ERR_SIZEOF, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_pcie_cap_offset +=3D P=
CI_ERR_SIZEOF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (proxy-&gt;flags &amp; VIRTIO_PCI=
_FLAG_INIT_DEVERR) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Init error enabling=
 flags */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pcie_cap_deverr_init(p=
ci_dev);<br>
<br>
My only issue here is that if requested for a non express device,<br>
it will assert instead of a graceful failure.<br>
Can be fixed as a patch on top though.<br>
<br>
&gt; @@ -1858,7 +1864,15 @@ static void virtio_pci_realize(PCIDevice *pci_d=
ev, Error **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void virtio_pci_exit(PCIDevice *pci_dev)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 VirtIOPCIProxy *proxy =3D VIRTIO_PCI(pci_dev);<br>
&gt; +=C2=A0 =C2=A0 bool pcie_port =3D pci_bus_is_express(pci_get_bus(pci_d=
ev)) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0!pci_bus_is_root(pci_get_bus(pci_dev));<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 msix_uninit_exclusive_bar(pci_dev);<br>
&gt; +=C2=A0 =C2=A0 if (proxy-&gt;flags &amp; VIRTIO_PCI_FLAG_AER &amp;&amp=
; pcie_port &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_is_express(pci_dev)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pcie_aer_exit(pci_dev);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void virtio_pci_reset(DeviceState *qdev)<br>
&gt; @@ -1911,6 +1925,8 @@ static Property virtio_pci_properties[] =3D {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 VIRTIO_PCI_FLAG_INIT_PM_BIT, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BIT(&quot;x-pcie-flr-init&quot;, VirtI=
OPCIProxy, flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 VIRTIO_PCI_FLAG_INIT_FLR_BIT, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BIT(&quot;aer&quot;, VirtIOPCIProxy, flags,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 VIRTIO_PCI_FLAG_AER_BIT, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h<br>
&gt; index 06e2af12de..d7d5d403a9 100644<br>
&gt; --- a/hw/virtio/virtio-pci.h<br>
&gt; +++ b/hw/virtio/virtio-pci.h<br>
&gt; @@ -41,6 +41,7 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VIRTIO_PCI_FLAG_INIT_LNKCTL_BIT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VIRTIO_PCI_FLAG_INIT_PM_BIT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VIRTIO_PCI_FLAG_INIT_FLR_BIT,<br>
&gt; +=C2=A0 =C2=A0 VIRTIO_PCI_FLAG_AER_BIT,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* Need to activate work-arounds for buggy guests at vmstate loa=
d. */<br>
&gt; @@ -80,6 +81,9 @@ enum {<br>
&gt;=C2=A0 /* Init Function Level Reset capability */<br>
&gt;=C2=A0 #define VIRTIO_PCI_FLAG_INIT_FLR (1 &lt;&lt; VIRTIO_PCI_FLAG_INI=
T_FLR_BIT)<br>
&gt;=C2=A0 <br>
&gt; +/* Advanced Error Reporting capability */<br>
&gt; +#define VIRTIO_PCI_FLAG_AER (1 &lt;&lt; VIRTIO_PCI_FLAG_AER_BIT)<br>
&gt; +<br>
&gt;=C2=A0 typedef struct {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MSIMessage msg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int virq;<br>
&gt; -- <br>
&gt; 2.29.2<br>
<br>
</blockquote></div>

--00000000000023055c05b5f8745a--

