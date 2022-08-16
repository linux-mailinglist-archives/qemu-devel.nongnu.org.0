Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA487595BF1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:42:23 +0200 (CEST)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNvtm-00028b-RV
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oNvqY-0006wZ-Ju
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:39:02 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:42741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oNvqS-0003aZ-2e
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:39:02 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-32a17d3bba2so146757897b3.9
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=gicI4eDtIx0UqCl7xbyFu6UoubrlZRFHwbDgizUxrOs=;
 b=UNhcND34VeMHLsqeg//IRd2Woh85G8A0r7/4hpdlsmRDj+XIR4Be5l9Y2nzvoyCRiE
 ydulT/ybG7h+7R/s/fn1Al2KTpVNU6rf5V0wzw62ba2Pi1sA5IGf6qfKACfxoIqFSMbo
 H0VEtX3x3w7nir6TKucrZtjTfIqK4XIzV9dU3aUwqr5w3UD0gPEGm2ws95qIWiW7gWgY
 EOAl5xeYbuZ6Or0p7gfzQPAnWes32aNUfiR8MNYA+MmlgX+xGN8qtvCoppIuNmQYbkC8
 9d2niSgvXhkCy/ATt62dLO3oI07QnCjVb5+W6ZKrn39PgIzsMbX1o2PpBKfol/eEkzOY
 XpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=gicI4eDtIx0UqCl7xbyFu6UoubrlZRFHwbDgizUxrOs=;
 b=AGfHCewavXYp95QwW9XYTF9zJeHQMcVK08oSwGC7bq0tT6ngWScT2TOXQnnxncLSmt
 UyOYVOnzdsGp63UJ4FN+GJP3SfV+qVM05lzoiIJo2gZnxE4Elx11CI1j1r6pQJRuMTAS
 6CMverCVhfCzZ1MvpAjTKxQBlBndOhnjLoUK45O4WZbmee2Z5kV3n8Xjzxx5DeQWewnV
 XHrYK0GSEp1hr0ibhRlLnjjW3QsP7FaJK0oooonVAXS5Tcai8xxIkYq8pVg6RQPCh5Ma
 A/F+C94sZCn+LzuEWMAaRVOUFzS6281irQdQWzC6wQv0dPe0dsIyKKuU3pU+E1lV6DXF
 0HzQ==
X-Gm-Message-State: ACgBeo3sOopG7n/FP9CVGlHXVemBu80hi7AC1rCf1N62ydgneyAgSeBY
 TSYUfEVgGAsfBnxmlReWSNFiykxatVPf4uboutw=
X-Google-Smtp-Source: AA6agR5whRAOjG3S9p9RItLUgRDaQWZuvNBeSkdqqq4BPp1ezQMEVmLl5IQ3pNlDeKicOg6F5/dRcyWNWkTWjsjvolY=
X-Received: by 2002:a25:5086:0:b0:68f:ba5:dc9b with SMTP id
 e128-20020a255086000000b0068f0ba5dc9bmr770110ybb.87.1660653534922; Tue, 16
 Aug 2022 05:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <CADak6y6U=jBXWWBtPruGrPxkwYZZwk5GekSG2n8DsGOvpQMh_A@mail.gmail.com>
 <20220816060903-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220816060903-mutt-send-email-mst@kernel.org>
From: Paul Schlacter <wlfightup@gmail.com>
Date: Tue, 16 Aug 2022 20:38:43 +0800
Message-ID: <CADak6y5FsVx0h9R6Ccn74_-6_TFvyeRiieRk9Okz93RmTF3nQg@mail.gmail.com>
Subject: Re: [PATCH v2] xio3130_upstream: Add ACS (Access Control Services)
 capability
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: marcel.apfelbaum@gmail.com, fam@euphon.net, kwolf@redhat.com, 
 stefanha@redhat.com, k.jensen@samsung.com, f4bug@amsat.org, its@irrelevant.dk, 
 xypron.glpk@gmx.de, imammedo@redhat.com, qemu-devel@nongnu.org, 
 armbru@redhat.com, kbusch@kernel.org, hreitz@redhat.com, ani@anisinha.ca
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=wlfightup@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, Aug 16, 2022 at 6:11 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Aug 16, 2022 at 05:16:38PM +0800, Paul Schlacter wrote:
> > v1 -> v2:
> > - Allow ACS to be disabled.
> > - Suggested by Michael S. Tsirkin, use disable-acs to set property.
> >
> > v1:
> > - Add ACS (Access Control Services) capability.
>
> changelog generally after ---
>
> >
> > If it is a pcie device, check that all devices on the path from
>
>
> Hmm I don't see any checks on a path. what does this refer to?

pci_acs_path_enabled, this function in the Linux kernel,
it means that if the device is a PCIe device,
check the path from the device to the root complex. If ACS is all enabled,
the device will become an iommu_group.
acs determine whether it is a separate iommu_group.
>
> >
> > the device to the root complex have ACS enabled, and then the
> >
> > device will become an iommu_group.
> >
> > it will have the effect of isolation
> >
> >
> >
> > Signed-off-by: wangliang <wlfightup@gmail.com>
> >
> > Signed-off-by: wangliang <wangliang40@baidu.com>
> >
>
> why two signatures?
>
> >
> > ---
>
> >
> >  hw/pci-bridge/xio3130_upstream.c | 12 +++++++++++-
> >
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
>
> Patch has corrupted whitespace.
>
> >
> > diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/
> > xio3130_upstream.c
> >
> > index 2df952222b..5433d06fb3 100644
> >
> > --- a/hw/pci-bridge/xio3130_upstream.c
> >
> > +++ b/hw/pci-bridge/xio3130_upstream.c
> >
> > @@ -24,6 +24,7 @@
> >
> >  #include "hw/pci/msi.h"
> >
> >  #include "hw/pci/pcie.h"
> >
> >  #include "hw/pci/pcie_port.h"
> >
> > +#include "hw/qdev-properties.h"
> >
> >  #include "migration/vmstate.h"
> >
> >  #include "qemu/module.h"
> >
> >
> >
> > @@ -59,6 +60,7 @@ static void xio3130_upstream_reset(DeviceState *qdev)
> >
> >  static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
> >
> >  {
> >
> >      PCIEPort *p = PCIE_PORT(d);
> >
> > +    PCIESlot *s = PCIE_SLOT(d);
> >
> >      int rc;
> >
> >
> >
> >      pci_bridge_initfn(d, TYPE_PCIE_BUS);
> >
> > @@ -94,7 +96,9 @@ static void xio3130_upstream_realize(PCIDevice *d, Error
> > **errp)
> >
> >          goto err;
> >
> >      }
> >
> >
> >
> > -    pcie_acs_init(d, XIO3130_ACS_OFFSET);
> >
> > +    if (!s->disable_acs) {
> >
> > +        pcie_acs_init(d, XIO3130_ACS_OFFSET);
> >
> > +    }
> >
> >      return;
> >
> >
> >
> >  err:
> >
> > @@ -113,6 +117,11 @@ static void xio3130_upstream_exitfn(PCIDevice *d)
> >
> >      pci_bridge_exitfn(d);
> >
> >  }
> >
> >
> >
> > +static Property xio3130_upstream_props[] = {
> >
> > +    DEFINE_PROP_BOOL("disable-acs", PCIESlot, disable_acs, false),
> >
> > +    DEFINE_PROP_END_OF_LIST()
> >
> > +};
> >
> > +
>
> I'd say prefix the property with "x-".

Do you want me to change it to this?
DEFINE_PROP_BOOL("x-disable-acs", PCIESlot, disable_acs, false),

disable_acs is a field in PCIESlot, which is also used by other code.
It may not be good to modify this field
>
>
> >
> >  static const VMStateDescription vmstate_xio3130_upstream = {
> >
> >      .name = "xio3130-express-upstream-port",
> >
> >      .priority = MIG_PRI_PCI_BUS,
> >
> > @@ -142,6 +151,7 @@ static void xio3130_upstream_class_init(ObjectClass *klass,
> > void *data)
> >
> >      dc->desc = "TI X3130 Upstream Port of PCI Express Switch";
> >
> >      dc->reset = xio3130_upstream_reset;
> >
> >      dc->vmsd = &vmstate_xio3130_upstream;
> >
> > +    device_class_set_props(dc, xio3130_upstream_props);
> >
> >  }
> >
>
> Seems to lack compat machinety for existing machine types.

DEFINE_PROP_BOOL("x-disable-acs", PCIESlot, disable_acs, true),
If I change the default value to true, can I not add compat machine
>
>
> >
> >
> >  static const TypeInfo xio3130_upstream_info = {
> >
> > --
> >
> > 2.24.3 (Apple Git-128)
> >
>

