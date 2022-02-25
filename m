Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF07F4C464B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:28:31 +0100 (CET)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNae7-0006B7-0E
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:28:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNaF7-0001BR-L5
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNaF3-0001rY-Fu
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645794155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhkHFzKhxPF8OJFjSTFEttWCyzKN8nBNWFsIOSnGdWo=;
 b=QXq8HJahWE1XRIB1ERB/LtgP4zBlj56UtXvFvdnb4WyVlZDbbUv0ArgM6Qtb8oqrXzj/mb
 3dXrEkWGJc/VTrYsno9P8REgrT9hQUjLezAKgSvd/LjJHjaBTkNCjJwCsT7NdXF9pbRUxl
 /xUSUu1yEv097KpVrZijXzW5N163Mi8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-qCZuyb8-PiuOdfU-UMWe1g-1; Fri, 25 Feb 2022 08:02:34 -0500
X-MC-Unique: qCZuyb8-PiuOdfU-UMWe1g-1
Received: by mail-ej1-f72.google.com with SMTP id
 k21-20020a1709063e1500b006d0777c06d6so2659008eji.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 05:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZhkHFzKhxPF8OJFjSTFEttWCyzKN8nBNWFsIOSnGdWo=;
 b=dNvIfacn2Lx3mLayAThEvbopaevJKqNQs5aQyRsX4v7jyXg1+QNQ3TY9uImjyo3ErG
 612xg5fvU/ePDgmZ/GRWxHwdnpJVyqJ0wgjp72IUpCZCvO27AlShIe2V0uOLBcIG1Kzt
 nOCaKCfDCqRyraN9BPCUTXOObXCY6YodK/Jt4xALji+I549Y/udZDmXbOCsKeh7P9m/W
 NHNCmZ84ASM5a0UDrKyeFcQ2eW1v7qFGfjQiogHUDL0rSYwbPa/v6rYcXELo/G7RTcl1
 T8VuqPeHFz87NlMdoapZFfL6SklpL9PJW0TucR1bEy6vg5MRAadzmAbqaPmf5RUS2v+g
 imYw==
X-Gm-Message-State: AOAM531k040BZZBDyEqZe4hytLO/Fm45JEtLHE0t+kxLlQZoC+owK1XB
 sTuq2BzZGIORsyRRAOpPq4xR8iujWivvovDFhLiZDyDZ39nk+/3/xryze7nBxfe5Y7hCVk1jdAN
 AXIKDTchXfd6cUJE=
X-Received: by 2002:a50:e693:0:b0:413:7889:8050 with SMTP id
 z19-20020a50e693000000b0041378898050mr1972519edm.294.1645794153516; 
 Fri, 25 Feb 2022 05:02:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxa+CikDDQx2XlcCcVaLtHIuq0PDiAZuTXDOv6nLHI2Xscey2eKrPamp1RuDz7WeY/dCpqp0w==
X-Received: by 2002:a50:e693:0:b0:413:7889:8050 with SMTP id
 z19-20020a50e693000000b0041378898050mr1972498edm.294.1645794153286; 
 Fri, 25 Feb 2022 05:02:33 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa7c38c000000b00413458d2981sm1285185edq.54.2022.02.25.05.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 05:02:32 -0800 (PST)
Date: Fri, 25 Feb 2022 14:02:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power
 control is enabled
Message-ID: <20220225140231.16c13306@redhat.com>
In-Reply-To: <20220225101259.begp7wy5o3jlafcf@sirius.home.kraxel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
 <20220225101259.begp7wy5o3jlafcf@sirius.home.kraxel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 11:12:59 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> >    pcie_cap_slot_post_load()  
> >        -> pcie_cap_update_power()
> >            -> pcie_set_power_device()
> >                -> pci_set_power()
> >                    -> pci_update_mappings()  
> 
> > Fix it by honoring PCI_EXP_SLTCAP_PCP and updating power status
> > only if capability is enabled.  
> 
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index d7d73a31e4..2339729a7c 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -383,10 +383,9 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
> >  
> >      if (sltcap & PCI_EXP_SLTCAP_PCP) {
> >          power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
> > +        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > +                            pcie_set_power_device, &power);
> >      }
> > -
> > -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > -                        pcie_set_power_device, &power);
> >  }  
> 
> The change makes sense, although I don't see how that changes qemu
> behavior.

looks like I need to fix commit message

> 
> 'power' defaults to true, so when SLTCAP_PCP is off it should never
> ever try to power off the devices.  And pci_set_power() should figure
> the state didn't change and instantly return without touching the
> device.


SLTCAP_PCP is on by default as well, so empty slot ends up with
power disabled PCC state [1]:

  sltctl & SLTCTL_PCC == 0x400

by the time machine is initialized.

Then ACPI pcihp callbacks override native hotplug ones
so PCC remains stuck in this state since all power control
is out of picture in case of ACPI based hotplug. Guest OS
doesn't use/or ignore native PCC.

After device hotplug, the device stays in has_power=on default
state as pci_qdev_realize() initialized it. [2]

However when migrated SLTCTL_PCC is also migrated, and kick in
as described in commit message and turns power off [3]

> 
> take care,
>   Gerd
> 

1)
pci_qdev_realize
pci_set_power: extra_root0, d->has_power: 0,  new power state: 1
pci_set_power: extra_root0, set has_power to: 1
pcie_cap_slot_reset
pcie_cap_update_power(extra_root0): sltcap & PCI_EXP_SLTCAP_PCP: 2,  sltctl & SLTCTL_PCC: 400
pcie_cap_update_power(extra_root0): updated power: 0  <== has no effect on children since there is none

2)
pci_qdev_realize
pci_set_power: nic, d->has_power: 0,  new power state: 1
pci_set_power: nic, set has_power to: 1


3)
pci_qdev_realize
pci_set_power: extra_root0, d->has_power: 0,  new power state: 1
pci_set_power: extra_root0, set has_power to: 1
pci_qdev_realize
pci_set_power: nic, d->has_power: 0,  new power state: 1
pci_set_power: nic, set has_power to: 1
pcie_cap_slot_reset
pcie_cap_update_power(extra_root0): sltcap & PCI_EXP_SLTCAP_PCP: 2,  sltctl & SLTCTL_PCC: 0
pcie_cap_update_power(extra_root0): updated power: 1
pci_set_power: nic, d->has_power: 1,  new power state: 1
pcie_cap_slot_post_load(extra_root0)
pcie_cap_update_power(extra_root0): sltcap & PCI_EXP_SLTCAP_PCP: 2,  sltctl & SLTCTL_PCC: 400
pcie_cap_update_power(extra_root0): updated power: 0
pci_set_power: nic, d->has_power: 1,  new power state: 0
pci_set_power: nic, set has_power to: 0


