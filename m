Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE930239C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 11:24:59 +0100 (CET)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3z3J-0002kQ-LN
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 05:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l3z1s-0002IN-FK; Mon, 25 Jan 2021 05:23:28 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:56935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l3z1p-0002xo-Rb; Mon, 25 Jan 2021 05:23:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 19C2D85B3362;
 Mon, 25 Jan 2021 11:23:14 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 25 Jan
 2021 11:23:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004179fca57-ac60-4f61-bf54-7f65ab55dd95,
 2B03A7D9F92416094216925AD9FC4D0FA042F6FA) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 25 Jan 2021 11:23:11 +0100
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH] spapr: Adjust firmware path of PCI devices
Message-ID: <20210125112311.254ba960@bahia.lan>
In-Reply-To: <4294d3b5-abf3-fd43-660b-d82caf791d4f@ozlabs.ru>
References: <20210122170157.246374-1-groug@kaod.org>
 <4294d3b5-abf3-fd43-660b-d82caf791d4f@ozlabs.ru>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: f3d6c5af-7cff-4eb5-8ae1-fe3f0324f4a9
X-Ovh-Tracer-Id: 11246051222743652832
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephedutddvteduhfevkedvuedtieejtdeitdfhgeejgfdtueefffekveejieeglefhnecuffhomhgrihhnpehophgvnhhsohhurhgtvgdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 23 Jan 2021 13:36:34 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> 
> 
> On 23/01/2021 04:01, Greg Kurz wrote:
> > It is currently not possible to perform a strict boot from USB storage:
> > 
> > $ qemu-system-ppc64 -accel kvm -nodefaults -nographic -serial stdio \
> > 	-boot strict=on \
> > 	-device qemu-xhci \
> > 	-device usb-storage,drive=disk,bootindex=0 \
> > 	-blockdev driver=file,node-name=disk,filename=fedora-ppc64le.qcow2
> > 
> > 
> > SLOF **********************************************************************
> > QEMU Starting
> >   Build Date = Jul 17 2020 11:15:24
> >   FW Version = git-e18ddad8516ff2cf
> >   Press "s" to enter Open Firmware.
> > 
> > Populating /vdevice methods
> > Populating /vdevice/vty@71000000
> > Populating /vdevice/nvram@71000001
> > Populating /pci@800000020000000
> >                       00 0000 (D) : 1b36 000d    serial bus [ usb-xhci ]
> > No NVRAM common partition, re-initializing...
> > Scanning USB
> >    XHCI: Initializing
> >      USB Storage
> >         SCSI: Looking for devices
> >            101000000000000 DISK     : "QEMU     QEMU HARDDISK    2.5+"
> > Using default console: /vdevice/vty@71000000
> > 
> >    Welcome to Open Firmware
> > 
> >    Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
> >    This program and the accompanying materials are made available
> >    under the terms of the BSD License available at
> >    http://www.opensource.org/licenses/bsd-license.php
> > 
> > 
> > Trying to load:  from: /pci@800000020000000/usb@0/storage@1/disk@101000000000000 ...
> > E3405: No such device
> > 
> > E3407: Load failed
> > 
> >    Type 'boot' and press return to continue booting the system.
> >    Type 'reset-all' and press return to reboot the system.
> > 
> > 
> > Ready!
> > 0 >
> > 
> > The device tree handed over by QEMU to SLOF indeed contains:
> > 
> > qemu,boot-list =
> > 	"/pci@800000020000000/usb@0/storage@1/disk@101000000000000 HALT";
> > 
> > but the device node is named usb-xhci@0, not usb@0.
> 
> 
> I'd expect it to be a return of qdev_fw_name() so in this case something 
> like "nec-usb-xhci" (which would still be broken) but seeing a plain 
> "usb" is a bit strange.
> 

The logic under get_boot_devices_list() is a bit hard to follow
because of the multiple indirections, but AFAICT it doesn't seem
to rely on qdev_fw_name() to get the names.

None of the XHCI devices seem to be setting DeviceClass::fw_name anyway:

$ git grep fw_name hw/usb/
hw/usb/bus.c:                     qdev_fw_name(qdev), nr);
hw/usb/dev-hub.c:    dc->fw_name = "hub";
hw/usb/dev-mtp.c:    dc->fw_name = "mtp";
hw/usb/dev-network.c:    dc->fw_name = "network";
hw/usb/dev-storage.c:    dc->fw_name = "storage";
hw/usb/dev-uas.c:    dc->fw_name = "storage";

The plain "usb" naming comes from PCI, which has its own naming
logic for PCI devices (which qemu-xhci happens to be) :

#0  0x0000000100319474 in pci_dev_fw_name (len=33, buf=0x7fffffffd4c8 "\020", dev=0x7fffc3320010) at ../../hw/pci/pci.c:2533
#1  0x0000000100319474 in pcibus_get_fw_dev_path (dev=0x7fffc3320010) at ../../hw/pci/pci.c:2550
#2  0x000000010053118c in bus_get_fw_dev_path (dev=0x7fffc3320010, bus=<optimized out>) at ../../hw/core/qdev-fw.c:38
#3  0x000000010053118c in qdev_get_fw_dev_path_helper (dev=0x7fffc3320010, p=0x7fffffffd728 "/pci@800000020000000/", size=128) at ../../hw/core/qdev-fw.c:72
#4  0x0000000100531064 in qdev_get_fw_dev_path_helper (dev=0x101c864a0, p=0x7fffffffd728 "/pci@800000020000000/", size=128) at ../../hw/core/qdev-fw.c:69
#5  0x0000000100531064 in qdev_get_fw_dev_path_helper (dev=0x1019f3560, p=0x7fffffffd728 "/pci@800000020000000/", size=128) at ../../hw/core/qdev-fw.c:69
#6  0x00000001005312f0 in qdev_get_fw_dev_path (dev=<optimized out>) at ../../hw/core/qdev-fw.c:91
#7  0x0000000100588a68 in get_boot_device_path (dev=<optimized out>, ignore_suffixes=<optimized out>, ignore_suffixes@entry=true, suffix=<optimized out>) at ../../softmmu/bootdevice.c:211
#8  0x0000000100589540 in get_boot_devices_list (size=0x7fffffffd990) at ../../softmmu/bootdevice.c:257
#9  0x0000000100606764 in spapr_dt_chosen (reset=true, fdt=0x7fffc26f0010, spapr=0x10149aef0) at ../../hw/ppc/spapr.c:1019


> While your patch works, I wonder if we should assign fw_name to all pci 
> nodes to avoid similar problems in the future? Thanks,
> 

Not sure to understand "assign fw_name to all pci nodes" ...

> 
> 
> 
> > 
> > This happens because the firmware names of PCI devices returned
> > by get_boot_devices_list() come from pcibus_get_fw_dev_path(),
> > while the sPAPR PHB code uses a different naming scheme for
> > device nodes. This inconsistency has always been there but it was
> > hidden for a long time because SLOF used to rename USB device
> > nodes, until this commit, merged in QEMU 4.2.0 :
> > 
> > commit 85164ad4ed9960cac842fa4cc067c6b6699b0994
> > Author: Alexey Kardashevskiy <aik@ozlabs.ru>
> > Date:   Wed Sep 11 16:24:32 2019 +1000
> > 
> >      pseries: Update SLOF firmware image
> > 
> >      This fixes USB host bus adapter name in the device tree to match QEMU's
> >      one.
> > 
> >      Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >      Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > 
> > Fortunately, sPAPR implements the firmware path provider interface.
> > This provides a way to override the default firmware paths.
> > 
> > Just factor out the sPAPR PHB naming logic from spapr_dt_pci_device()
> > to a helper, and use it in the sPAPR firmware path provider hook.
> > 
> > Fixes: 85164ad4ed99 ("pseries: Update SLOF firmware image")
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >   include/hw/pci-host/spapr.h |  2 ++
> >   hw/ppc/spapr.c              |  5 +++++
> >   hw/ppc/spapr_pci.c          | 33 ++++++++++++++++++---------------
> >   3 files changed, 25 insertions(+), 15 deletions(-)
> > 
> > diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
> > index bd014823a933..5b03a7b0eb3f 100644
> > --- a/include/hw/pci-host/spapr.h
> > +++ b/include/hw/pci-host/spapr.h
> > @@ -210,4 +210,6 @@ static inline unsigned spapr_phb_windows_supported(SpaprPhbState *sphb)
> >       return sphb->ddw_enabled ? SPAPR_PCI_DMA_MAX_WINDOWS : 1;
> >   }
> >   
> > +char *spapr_pci_fw_dev_name(PCIDevice *dev);
> > +
> >   #endif /* PCI_HOST_SPAPR_H */
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 6ab27ea269d5..632502c2ecf8 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -3048,6 +3048,7 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
> >       SCSIDevice *d = CAST(SCSIDevice,  dev, TYPE_SCSI_DEVICE);
> >       SpaprPhbState *phb = CAST(SpaprPhbState, dev, TYPE_SPAPR_PCI_HOST_BRIDGE);
> >       VHostSCSICommon *vsc = CAST(VHostSCSICommon, dev, TYPE_VHOST_SCSI_COMMON);
> > +    PCIDevice *pcidev = CAST(PCIDevice, dev, TYPE_PCI_DEVICE);
> >   
> >       if (d) {
> >           void *spapr = CAST(void, bus->parent, "spapr-vscsi");
> > @@ -3121,6 +3122,10 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
> >           return g_strdup_printf("pci@%x", PCI_SLOT(pcidev->devfn));
> >       }
> >   
> > +    if (pcidev) {
> > +        return spapr_pci_fw_dev_name(pcidev);
> > +    }
> > +
> >       return NULL;
> >   }
> >   
> > diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> > index 76d7c91e9c64..da6eb58724c8 100644
> > --- a/hw/ppc/spapr_pci.c
> > +++ b/hw/ppc/spapr_pci.c
> > @@ -1334,15 +1334,29 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, PCIBus *bus,
> >       return offset;
> >   }
> >   
> > +char *spapr_pci_fw_dev_name(PCIDevice *dev)
> > +{
> > +    const gchar *basename;
> > +    int slot = PCI_SLOT(dev->devfn);
> > +    int func = PCI_FUNC(dev->devfn);
> > +    uint32_t ccode = pci_default_read_config(dev, PCI_CLASS_PROG, 3);
> > +
> > +    basename = dt_name_from_class((ccode >> 16) & 0xff, (ccode >> 8) & 0xff,
> > +                                  ccode & 0xff);
> > +
> > +    if (func != 0) {
> > +        return g_strdup_printf("%s@%x,%x", basename, slot, func);
> > +    } else {
> > +        return g_strdup_printf("%s@%x", basename, slot);
> > +    }
> > +}
> > +
> >   /* create OF node for pci device and required OF DT properties */
> >   static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
> >                                  void *fdt, int parent_offset)
> >   {
> >       int offset;
> > -    const gchar *basename;
> > -    gchar *nodename;
> > -    int slot = PCI_SLOT(dev->devfn);
> > -    int func = PCI_FUNC(dev->devfn);
> > +    g_autofree gchar *nodename = spapr_pci_fw_dev_name(dev);
> >       PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
> >       ResourceProps rp;
> >       SpaprDrc *drc = drc_from_dev(sphb, dev);
> > @@ -1359,19 +1373,8 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
> >       uint32_t pci_status = pci_default_read_config(dev, PCI_STATUS, 2);
> >       gchar *loc_code;
> >   
> > -    basename = dt_name_from_class((ccode >> 16) & 0xff, (ccode >> 8) & 0xff,
> > -                                  ccode & 0xff);
> > -
> > -    if (func != 0) {
> > -        nodename = g_strdup_printf("%s@%x,%x", basename, slot, func);
> > -    } else {
> > -        nodename = g_strdup_printf("%s@%x", basename, slot);
> > -    }
> > -
> >       _FDT(offset = fdt_add_subnode(fdt, parent_offset, nodename));
> >   
> > -    g_free(nodename);
> > -
> >       /* in accordance with PAPR+ v2.7 13.6.3, Table 181 */
> >       _FDT(fdt_setprop_cell(fdt, offset, "vendor-id", vendor_id));
> >       _FDT(fdt_setprop_cell(fdt, offset, "device-id", device_id));
> > 
> 


