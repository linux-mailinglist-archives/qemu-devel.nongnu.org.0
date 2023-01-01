Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3E765A96A
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 10:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBuJS-0008G0-Lt; Sun, 01 Jan 2023 04:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1pBuJR-0008Fl-5c
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 04:07:25 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1pBuJO-0008Pt-UP
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 04:07:24 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-476e643d1d5so239471987b3.1
 for <qemu-devel@nongnu.org>; Sun, 01 Jan 2023 01:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKZIoCX+gVg3Lq4TLXLNvogNQiZ6lukM2xBQYN9Ttsw=;
 b=n3E9sNUZntSVdh3a0f6gOoGRS1U+lQap1qB3wInA8QukOUQwqRT2nwpYWVdWbx6q1X
 QYIowPull9BI8LTeHfn+uUIaUHRSgPl3LcK4kXqhvept2lSigHYNGdYMl+DPqlHT61HX
 /KoP6crlB25EUr56JRpdaL1SLPzkO3/A0SehWpevOeqpTMD1DMiHhb+ilNPQnthUry1E
 DLw2zfsGXfNebhU2TE2Lo/RBAaO/PP27b1NUzIF1OrVJCuzCaWQmRLf/Qnk0mu0jlBoF
 8V8Mh5yEHmpWtyEGmQyFvPHKVBRmj6/IhPs92cP3wWckiUFLoPyMmqqApJtf9oDqP/yy
 RPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YKZIoCX+gVg3Lq4TLXLNvogNQiZ6lukM2xBQYN9Ttsw=;
 b=tu5jFVxMsYEvLbnX0tEY3QUaAWPYGzJf6F4WhG+qP51Dd83tL3MvYWjFDd/LIg0+gn
 OEVctaRoqUFrDKVfEHpr0sabF4q61IjeTnwub2/RFLUDgnqf1knTY4Qzf0PKKHo9QGCH
 Rlt474kvzm7jXr1w3C/bPOn6NZ3hYYeg7q48YhUNPA24uX3EoMvRJAUBAgxB7u4OXFWe
 L9TTlS1E9XmeAssg3DBrVEvi0E/naPx1zi6hPALO8OMADcRAnCKA/DCu1ekxy+qjC0cX
 jHbGaDL0bSwFW/Qciit1eZWrEKYGt4EZXykdGfG/FLNdXcsWcmocScWCFKRKUlhVuRRg
 m4NQ==
X-Gm-Message-State: AFqh2kqhNHX0e7TnNEZRJZmuiyr0f13o7iTLP9aumoM6WVuvPD0lD8mp
 OHLKCeDrlsLZ+v7bTQZGW0oZmF06INSnMdaisbk=
X-Google-Smtp-Source: AMrXdXs3Dj2mn1BXM/ZNHFiWIZqdjrs12xXX41DO+W5riP3d1eLkPUb+izeZ6qsKnC2jnC1A2QRuitRG05oDbJb3jsc=
X-Received: by 2002:a81:a4b:0:b0:487:b6b9:ff61 with SMTP id
 72-20020a810a4b000000b00487b6b9ff61mr1541054ywk.284.1672564041516; Sun, 01
 Jan 2023 01:07:21 -0800 (PST)
MIME-Version: 1.0
References: <6A02B617-F7E4-4C8A-9770-9B9131BAF670@gmail.com>
 <CADak6y5Ui4d1yccguzT24AMD4m-xC1RUgEd7B9MdzJtLPt4dJA@mail.gmail.com>
 <CADak6y6heJwQGZG363AcSNABs+dzgMqgvMqK9gjfHYc+1C_tLA@mail.gmail.com>
In-Reply-To: <CADak6y6heJwQGZG363AcSNABs+dzgMqgvMqK9gjfHYc+1C_tLA@mail.gmail.com>
From: Paul Schlacter <wlfightup@gmail.com>
Date: Sun, 1 Jan 2023 17:07:09 +0800
Message-ID: <CADak6y5UVY6BD8m2dMHa7pu+DB-NSi+Z5unBzK-3i4RCjrLKKQ@mail.gmail.com>
Subject: Re: [PATCH v3] xio3130_upstream: Add ACS (Access Control Services)
 capability
To: "Michael S. Tsirkin" <mst@redhat.com>, marcel.apfelbaum@gmail.com,
 fam@euphon.net, 
 kwolf@redhat.com, stefanha@redhat.com, k.jensen@samsung.com, f4bug@amsat.org, 
 its@irrelevant.dk, xypron.glpk@gmx.de, imammedo@redhat.com, 
 qemu-devel@nongnu.org, armbru@redhat.com, kbusch@kernel.org, 
 hreitz@redhat.com, ani@anisinha.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=wlfightup@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The upstream and downstream of the physical machine also have acs capabilit=
y.
The virtual machine should at least have a way to see the acs

On Sun, Jan 1, 2023 at 5:03 PM Paul Schlacter <wlfightup@gmail.com> wrote:
>
> Please help review and merge the code into the master.  Thank you very mu=
ch.
>
> ping
>
> On Sat, Aug 20, 2022 at 7:31 AM Paul Schlacter <wlfightup@gmail.com> wrot=
e:
> >
> > ping
> >
> > On Thu, Aug 18, 2022 at 10:25 PM Paul Schlacter <wlfightup@gmail.com> w=
rote:
> > >
> > > If it is a pcie device, check that all devices on the path from
> > > the device to the root complex have ACS enabled, and then the
> > > device will become an iommu_group.
> > >
> > > pci_acs_path_enabled, this function in the Linux kernel, it means
> > > that if the device is a PCIe device, check the path from the
> > > device to the root complex. If ACS is all enabled, the device will
> > > become an iommu_group.
> > >
> > > acs determine whether it is a separate iommu_group.
> > >
> > > Signed-off-by: wlfightup <wlfightup@gmail.com>
> > > =E2=80=94
> > > v3:
> > > - Suggested by Michael S. Tsirkin, use x-disable-acs, and set the
> > > default value to true, Compatible with previous defaults
> > >
> > > v2:
> > > - Allow ACS to be disabled.
> > > - Suggested by Michael S. Tsirkin, use disable-acs to set property.
> > >
> > > hw/pci-bridge/xio3130_upstream.c | 13 +++++++++++++
> > > 1 file changed, 13 insertions(+)
> > >
> > > diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130=
_upstream.c
> > > index 5ff46ef050..f918113d76 100644
> > > --- a/hw/pci-bridge/xio3130_upstream.c
> > > +++ b/hw/pci-bridge/xio3130_upstream.c
> > > @@ -24,6 +24,7 @@
> > > #include "hw/pci/msi.h"
> > > #include "hw/pci/pcie.h"
> > > #include "hw/pci/pcie_port.h"
> > > +#include "hw/qdev-properties.h"
> > > #include "migration/vmstate.h"
> > > #include "qemu/module.h"
> > >
> > > @@ -37,6 +38,8 @@
> > > #define XIO3130_SSVID_SSID              0
> > > #define XIO3130_EXP_OFFSET              0x90
> > > #define XIO3130_AER_OFFSET              0x100
> > > +#define XIO3130_ACS_OFFSET \
> > > +        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
> > >
> > > static void xio3130_upstream_write_config(PCIDevice *d, uint32_t addr=
ess,
> > >                                         uint32_t val, int len)
> > > @@ -57,6 +60,7 @@ static void xio3130_upstream_reset(DeviceState *qde=
v)
> > > static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
> > > {
> > >   PCIEPort *p =3D PCIE_PORT(d);
> > > +    PCIESlot *s =3D PCIE_SLOT(d);
> > >   int rc;
> > >
> > >   pci_bridge_initfn(d, TYPE_PCIE_BUS);
> > > @@ -92,6 +96,9 @@ static void xio3130_upstream_realize(PCIDevice *d, =
Error **errp)
> > >       goto err;
> > >   }
> > >
> > > +    if (!s->disable_acs) {
> > > +        pcie_acs_init(d, XIO3130_ACS_OFFSET);
> > > +    }
> > >   return;
> > >
> > > err:
> > > @@ -110,6 +117,11 @@ static void xio3130_upstream_exitfn(PCIDevice *d=
)
> > >   pci_bridge_exitfn(d);
> > > }
> > >
> > > +static Property xio3130_upstream_props[] =3D {
> > > +    DEFINE_PROP_BOOL("x-disable-acs", PCIESlot, disable_acs, true),
> > > +    DEFINE_PROP_END_OF_LIST()
> > > +};
> > > +
> > > static const VMStateDescription vmstate_xio3130_upstream =3D {
> > >   .name =3D "xio3130-express-upstream-port",
> > >   .priority =3D MIG_PRI_PCI_BUS,
> > > @@ -139,6 +151,7 @@ static void xio3130_upstream_class_init(ObjectCla=
ss *klass, void *data)
> > >   dc->desc =3D "TI X3130 Upstream Port of PCI Express Switch";
> > >   dc->reset =3D xio3130_upstream_reset;
> > >   dc->vmsd =3D &vmstate_xio3130_upstream;
> > > +    device_class_set_props(dc, xio3130_upstream_props);
> > > }
> > >
> > > static const TypeInfo xio3130_upstream_info =3D {
> > > --
> > > 2.24.3 (Apple Git-128)
> > >
> > >

