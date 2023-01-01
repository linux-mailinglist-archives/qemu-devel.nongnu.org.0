Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C1165A969
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 10:04:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBuFU-0007NS-JP; Sun, 01 Jan 2023 04:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1pBuFS-0007Lm-0k
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 04:03:18 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1pBuFQ-0005k4-BV
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 04:03:17 -0500
Received: by mail-yb1-xb31.google.com with SMTP id 203so27601193yby.10
 for <qemu-devel@nongnu.org>; Sun, 01 Jan 2023 01:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKGT/GhxIHkIwTl1tmS0m6Rm3csgNCcbJnsCiYd4RYE=;
 b=Fr0bsLInMjuSVIBGKzTnhDoMRsL6lJfcUZ4OQveYAFMLRByz/xVs8gq9QexuZvU4N5
 Tz+EEPLwUT4EzESyzedmHREgC6KESc4SLHhh/hW7XHiPFO2ZpjGV2CdfA90kaF8nLR5Z
 wUE8KpfIYB/azmvcimnInOpsL2APZf5RRM+04NqemFcMErjTmgoBh3f0e26sO5RB4h39
 WB2jx+SpBb+/+u8lLxlzpE6RjXgH9wn1AbDVSiC5dSyJdG8bDjDFJtcOzRdW011Q1yP9
 vbAnGFpgHoL21RSoxkTC2sTxXKwUVxDfxp8LWoOlG/tII4/iPcIAq1/RVd4PvDOrZxxL
 0bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tKGT/GhxIHkIwTl1tmS0m6Rm3csgNCcbJnsCiYd4RYE=;
 b=U4axDA/IKHDHjY4NYF4OYlvk12sCpYEE4ZtQmBhgDuWl0r93Q4uUrpBdO1Q31IaRga
 AAne0IORbCH/jb3Dui9fGGMU/hDhD/bYuwcswCxsbEIW+hx4+z+dULCkj6jbEfhOFtxS
 Av7sc6WqxYMH6PgHjpRLICZBtA70x99H7BOCd3RFg4c0Jr88393jOWz6czZLWdbntqRU
 rDjY/vSfj12c2wDtvhXdl7Oifc76tLSnEjBEMZ9lGqR3/a3g5ynWdPWoXxSneD1FktTR
 zRUpY3ZmW3EudhtqjD0KWrVaS4gANBFbaTWV9g7r+0GSWCjVUyiB+HcNB4ROkauidVXH
 KnEw==
X-Gm-Message-State: AFqh2kq2NVud3a0wPg+s3KO1BJBbytgteltpUg4H7cezdT/+K+4+UoUQ
 Pwer8mAEvwyTd2RX2KxXLvldSkLixSRQnnLBdm8=
X-Google-Smtp-Source: AMrXdXsTeXLJ3Wguts3vrjgtehNDgiwM1BgQJfhpW/7UXX/yDkkR51VCJ5OUep9zEJ1Qct12gOh2vv6DWBQBUKb2lWQ=
X-Received: by 2002:a25:cb54:0:b0:6fb:ef1e:bb0d with SMTP id
 b81-20020a25cb54000000b006fbef1ebb0dmr4166381ybg.635.1672563794934; Sun, 01
 Jan 2023 01:03:14 -0800 (PST)
MIME-Version: 1.0
References: <6A02B617-F7E4-4C8A-9770-9B9131BAF670@gmail.com>
 <CADak6y5Ui4d1yccguzT24AMD4m-xC1RUgEd7B9MdzJtLPt4dJA@mail.gmail.com>
In-Reply-To: <CADak6y5Ui4d1yccguzT24AMD4m-xC1RUgEd7B9MdzJtLPt4dJA@mail.gmail.com>
From: Paul Schlacter <wlfightup@gmail.com>
Date: Sun, 1 Jan 2023 17:03:03 +0800
Message-ID: <CADak6y6heJwQGZG363AcSNABs+dzgMqgvMqK9gjfHYc+1C_tLA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=wlfightup@gmail.com; helo=mail-yb1-xb31.google.com
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

Please help review and merge the code into the master.  Thank you very much=
.

ping

On Sat, Aug 20, 2022 at 7:31 AM Paul Schlacter <wlfightup@gmail.com> wrote:
>
> ping
>
> On Thu, Aug 18, 2022 at 10:25 PM Paul Schlacter <wlfightup@gmail.com> wro=
te:
> >
> > If it is a pcie device, check that all devices on the path from
> > the device to the root complex have ACS enabled, and then the
> > device will become an iommu_group.
> >
> > pci_acs_path_enabled, this function in the Linux kernel, it means
> > that if the device is a PCIe device, check the path from the
> > device to the root complex. If ACS is all enabled, the device will
> > become an iommu_group.
> >
> > acs determine whether it is a separate iommu_group.
> >
> > Signed-off-by: wlfightup <wlfightup@gmail.com>
> > =E2=80=94
> > v3:
> > - Suggested by Michael S. Tsirkin, use x-disable-acs, and set the
> > default value to true, Compatible with previous defaults
> >
> > v2:
> > - Allow ACS to be disabled.
> > - Suggested by Michael S. Tsirkin, use disable-acs to set property.
> >
> > hw/pci-bridge/xio3130_upstream.c | 13 +++++++++++++
> > 1 file changed, 13 insertions(+)
> >
> > diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_u=
pstream.c
> > index 5ff46ef050..f918113d76 100644
> > --- a/hw/pci-bridge/xio3130_upstream.c
> > +++ b/hw/pci-bridge/xio3130_upstream.c
> > @@ -24,6 +24,7 @@
> > #include "hw/pci/msi.h"
> > #include "hw/pci/pcie.h"
> > #include "hw/pci/pcie_port.h"
> > +#include "hw/qdev-properties.h"
> > #include "migration/vmstate.h"
> > #include "qemu/module.h"
> >
> > @@ -37,6 +38,8 @@
> > #define XIO3130_SSVID_SSID              0
> > #define XIO3130_EXP_OFFSET              0x90
> > #define XIO3130_AER_OFFSET              0x100
> > +#define XIO3130_ACS_OFFSET \
> > +        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
> >
> > static void xio3130_upstream_write_config(PCIDevice *d, uint32_t addres=
s,
> >                                         uint32_t val, int len)
> > @@ -57,6 +60,7 @@ static void xio3130_upstream_reset(DeviceState *qdev)
> > static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
> > {
> >   PCIEPort *p =3D PCIE_PORT(d);
> > +    PCIESlot *s =3D PCIE_SLOT(d);
> >   int rc;
> >
> >   pci_bridge_initfn(d, TYPE_PCIE_BUS);
> > @@ -92,6 +96,9 @@ static void xio3130_upstream_realize(PCIDevice *d, Er=
ror **errp)
> >       goto err;
> >   }
> >
> > +    if (!s->disable_acs) {
> > +        pcie_acs_init(d, XIO3130_ACS_OFFSET);
> > +    }
> >   return;
> >
> > err:
> > @@ -110,6 +117,11 @@ static void xio3130_upstream_exitfn(PCIDevice *d)
> >   pci_bridge_exitfn(d);
> > }
> >
> > +static Property xio3130_upstream_props[] =3D {
> > +    DEFINE_PROP_BOOL("x-disable-acs", PCIESlot, disable_acs, true),
> > +    DEFINE_PROP_END_OF_LIST()
> > +};
> > +
> > static const VMStateDescription vmstate_xio3130_upstream =3D {
> >   .name =3D "xio3130-express-upstream-port",
> >   .priority =3D MIG_PRI_PCI_BUS,
> > @@ -139,6 +151,7 @@ static void xio3130_upstream_class_init(ObjectClass=
 *klass, void *data)
> >   dc->desc =3D "TI X3130 Upstream Port of PCI Express Switch";
> >   dc->reset =3D xio3130_upstream_reset;
> >   dc->vmsd =3D &vmstate_xio3130_upstream;
> > +    device_class_set_props(dc, xio3130_upstream_props);
> > }
> >
> > static const TypeInfo xio3130_upstream_info =3D {
> > --
> > 2.24.3 (Apple Git-128)
> >
> >

