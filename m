Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89A301252
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 03:37:39 +0100 (CET)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l38ny-0006gz-HO
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 21:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1l38n8-0006Dw-8n
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 21:36:46 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1l38n4-0008Qp-UC
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 21:36:46 -0500
Received: by mail-pl1-x635.google.com with SMTP id q4so4331206plr.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 18:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QcyS7nkb6EdEfEPfCYPy4DBB+mNCS207p6SG8NfHDYI=;
 b=ZFQV3Zydu4f98ld64SiQp0A+ekA0pHcHUsneeeSEFICQ4D9e7HBye8/4ebQqUovJxl
 2/y+o0dwHay6X2Rs+Gz73o3Qud9SruRCZ/dS6Wo53nuSJgPI91K1izQCY/r/ATHL1Pgo
 N7Gw6gjemeB1QA+q2ZIDPo1LTo9Q/8AfrTxYvEsRcOwsd1bsDm2jobq5htPKrRLYtqNT
 KhnqEd0xnmkrpMAkTZHSEMjYzf4heoCLs/CJzXMCxFK6vyP/t2PSb3Ln+bZfkLraUmaN
 CzoT///dK4Y+imiz5iubxYL33Ve9dvX11iddYL7YZbnZsZF7zbNEdarNyA38r15GN4Wf
 SXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QcyS7nkb6EdEfEPfCYPy4DBB+mNCS207p6SG8NfHDYI=;
 b=iUmQC8+Qk8uG+DcIl00PmIOH07vPC758r3V3knpnm5yaMWV6H5DSw0RooC85W86REv
 hBibajLh5qmtCRkaO93JFA52SnuXcZhFGpduA2j+1zxd1UiP4o/llG0Cce7d4emNLKCx
 HpssRZiUqYWshrAXj3pgbZz6c6R5iLpNW7DNcAYdK+BVuee8XMlrzK2yNXtmPiT0j2Jv
 KrFkVLaB6HYVe0ikSB3oJBBHWQWiqgxDm1oZXgfkZFdTpLJxbx2lwNeGU/4zlEKFsYRI
 b5cxlfCyyQyPxYwuxRkAri5UuuEX9k/n9mnlPVqxkp2pDsZwhb5ak0mZq6DIjxTteXun
 aGEQ==
X-Gm-Message-State: AOAM531PnTrlRwhUV1PzxC0WvDNp9MK+5CzyViNRvoYaKp7nd151gUW9
 fqAyLG2hYT9jmoYfaoERtGvxGA==
X-Google-Smtp-Source: ABdhPJz9Pcv3Ryd9zysC1m3N/L2zwuzbnhlzzeS2MaRIgTUABtRaQK8Jezz+REFiDG3LJlss8494dw==
X-Received: by 2002:a17:902:c195:b029:de:30af:7d84 with SMTP id
 d21-20020a170902c195b02900de30af7d84mr8040920pld.15.1611369399014; 
 Fri, 22 Jan 2021 18:36:39 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id u1sm10397597pjr.51.2021.01.22.18.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 18:36:38 -0800 (PST)
Subject: Re: [PATCH] spapr: Adjust firmware path of PCI devices
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210122170157.246374-1-groug@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <4294d3b5-abf3-fd43-660b-d82caf791d4f@ozlabs.ru>
Date: Sat, 23 Jan 2021 13:36:34 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210122170157.246374-1-groug@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 23/01/2021 04:01, Greg Kurz wrote:
> It is currently not possible to perform a strict boot from USB storage:
> 
> $ qemu-system-ppc64 -accel kvm -nodefaults -nographic -serial stdio \
> 	-boot strict=on \
> 	-device qemu-xhci \
> 	-device usb-storage,drive=disk,bootindex=0 \
> 	-blockdev driver=file,node-name=disk,filename=fedora-ppc64le.qcow2
> 
> 
> SLOF **********************************************************************
> QEMU Starting
>   Build Date = Jul 17 2020 11:15:24
>   FW Version = git-e18ddad8516ff2cf
>   Press "s" to enter Open Firmware.
> 
> Populating /vdevice methods
> Populating /vdevice/vty@71000000
> Populating /vdevice/nvram@71000001
> Populating /pci@800000020000000
>                       00 0000 (D) : 1b36 000d    serial bus [ usb-xhci ]
> No NVRAM common partition, re-initializing...
> Scanning USB
>    XHCI: Initializing
>      USB Storage
>         SCSI: Looking for devices
>            101000000000000 DISK     : "QEMU     QEMU HARDDISK    2.5+"
> Using default console: /vdevice/vty@71000000
> 
>    Welcome to Open Firmware
> 
>    Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
>    This program and the accompanying materials are made available
>    under the terms of the BSD License available at
>    http://www.opensource.org/licenses/bsd-license.php
> 
> 
> Trying to load:  from: /pci@800000020000000/usb@0/storage@1/disk@101000000000000 ...
> E3405: No such device
> 
> E3407: Load failed
> 
>    Type 'boot' and press return to continue booting the system.
>    Type 'reset-all' and press return to reboot the system.
> 
> 
> Ready!
> 0 >
> 
> The device tree handed over by QEMU to SLOF indeed contains:
> 
> qemu,boot-list =
> 	"/pci@800000020000000/usb@0/storage@1/disk@101000000000000 HALT";
> 
> but the device node is named usb-xhci@0, not usb@0.


I'd expect it to be a return of qdev_fw_name() so in this case something 
like "nec-usb-xhci" (which would still be broken) but seeing a plain 
"usb" is a bit strange.

While your patch works, I wonder if we should assign fw_name to all pci 
nodes to avoid similar problems in the future? Thanks,




> 
> This happens because the firmware names of PCI devices returned
> by get_boot_devices_list() come from pcibus_get_fw_dev_path(),
> while the sPAPR PHB code uses a different naming scheme for
> device nodes. This inconsistency has always been there but it was
> hidden for a long time because SLOF used to rename USB device
> nodes, until this commit, merged in QEMU 4.2.0 :
> 
> commit 85164ad4ed9960cac842fa4cc067c6b6699b0994
> Author: Alexey Kardashevskiy <aik@ozlabs.ru>
> Date:   Wed Sep 11 16:24:32 2019 +1000
> 
>      pseries: Update SLOF firmware image
> 
>      This fixes USB host bus adapter name in the device tree to match QEMU's
>      one.
> 
>      Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>      Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> 
> Fortunately, sPAPR implements the firmware path provider interface.
> This provides a way to override the default firmware paths.
> 
> Just factor out the sPAPR PHB naming logic from spapr_dt_pci_device()
> to a helper, and use it in the sPAPR firmware path provider hook.
> 
> Fixes: 85164ad4ed99 ("pseries: Update SLOF firmware image")
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   include/hw/pci-host/spapr.h |  2 ++
>   hw/ppc/spapr.c              |  5 +++++
>   hw/ppc/spapr_pci.c          | 33 ++++++++++++++++++---------------
>   3 files changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
> index bd014823a933..5b03a7b0eb3f 100644
> --- a/include/hw/pci-host/spapr.h
> +++ b/include/hw/pci-host/spapr.h
> @@ -210,4 +210,6 @@ static inline unsigned spapr_phb_windows_supported(SpaprPhbState *sphb)
>       return sphb->ddw_enabled ? SPAPR_PCI_DMA_MAX_WINDOWS : 1;
>   }
>   
> +char *spapr_pci_fw_dev_name(PCIDevice *dev);
> +
>   #endif /* PCI_HOST_SPAPR_H */
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 6ab27ea269d5..632502c2ecf8 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3048,6 +3048,7 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
>       SCSIDevice *d = CAST(SCSIDevice,  dev, TYPE_SCSI_DEVICE);
>       SpaprPhbState *phb = CAST(SpaprPhbState, dev, TYPE_SPAPR_PCI_HOST_BRIDGE);
>       VHostSCSICommon *vsc = CAST(VHostSCSICommon, dev, TYPE_VHOST_SCSI_COMMON);
> +    PCIDevice *pcidev = CAST(PCIDevice, dev, TYPE_PCI_DEVICE);
>   
>       if (d) {
>           void *spapr = CAST(void, bus->parent, "spapr-vscsi");
> @@ -3121,6 +3122,10 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
>           return g_strdup_printf("pci@%x", PCI_SLOT(pcidev->devfn));
>       }
>   
> +    if (pcidev) {
> +        return spapr_pci_fw_dev_name(pcidev);
> +    }
> +
>       return NULL;
>   }
>   
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 76d7c91e9c64..da6eb58724c8 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1334,15 +1334,29 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, PCIBus *bus,
>       return offset;
>   }
>   
> +char *spapr_pci_fw_dev_name(PCIDevice *dev)
> +{
> +    const gchar *basename;
> +    int slot = PCI_SLOT(dev->devfn);
> +    int func = PCI_FUNC(dev->devfn);
> +    uint32_t ccode = pci_default_read_config(dev, PCI_CLASS_PROG, 3);
> +
> +    basename = dt_name_from_class((ccode >> 16) & 0xff, (ccode >> 8) & 0xff,
> +                                  ccode & 0xff);
> +
> +    if (func != 0) {
> +        return g_strdup_printf("%s@%x,%x", basename, slot, func);
> +    } else {
> +        return g_strdup_printf("%s@%x", basename, slot);
> +    }
> +}
> +
>   /* create OF node for pci device and required OF DT properties */
>   static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
>                                  void *fdt, int parent_offset)
>   {
>       int offset;
> -    const gchar *basename;
> -    gchar *nodename;
> -    int slot = PCI_SLOT(dev->devfn);
> -    int func = PCI_FUNC(dev->devfn);
> +    g_autofree gchar *nodename = spapr_pci_fw_dev_name(dev);
>       PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
>       ResourceProps rp;
>       SpaprDrc *drc = drc_from_dev(sphb, dev);
> @@ -1359,19 +1373,8 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
>       uint32_t pci_status = pci_default_read_config(dev, PCI_STATUS, 2);
>       gchar *loc_code;
>   
> -    basename = dt_name_from_class((ccode >> 16) & 0xff, (ccode >> 8) & 0xff,
> -                                  ccode & 0xff);
> -
> -    if (func != 0) {
> -        nodename = g_strdup_printf("%s@%x,%x", basename, slot, func);
> -    } else {
> -        nodename = g_strdup_printf("%s@%x", basename, slot);
> -    }
> -
>       _FDT(offset = fdt_add_subnode(fdt, parent_offset, nodename));
>   
> -    g_free(nodename);
> -
>       /* in accordance with PAPR+ v2.7 13.6.3, Table 181 */
>       _FDT(fdt_setprop_cell(fdt, offset, "vendor-id", vendor_id));
>       _FDT(fdt_setprop_cell(fdt, offset, "device-id", device_id));
> 

-- 
Alexey

