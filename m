Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4973009A3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:28:10 +0100 (CET)
Received: from localhost ([::1]:55986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30ED-00035s-I3
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l30Cx-00024f-QT; Fri, 22 Jan 2021 12:26:51 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:35579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l30Cq-0005MB-Pi; Fri, 22 Jan 2021 12:26:51 -0500
Received: by mail-qt1-x836.google.com with SMTP id t17so4684112qtq.2;
 Fri, 22 Jan 2021 09:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DrMbX8wf3kRZI+K+L0Oo71+13kEb1ilkzAmW6LHMaLM=;
 b=GJvRvc8H9joTQGw0e3106E+TJOGxim9MlC68EzocM8yGUFyzKRjGdVd+WssN5IFLkp
 97f1xNkhJB5vpOqVag+HGqBHEpuAF0bYFxrj0gz45+5YoyIUWmkQ5cNrdsjhF7mMYTRp
 UFoIQi5GSchAoF97p8Jtn5AOPSgNmthHLn2bipZNKZs3Of7UBm6+vpJP+/jA5Y5ZUqmq
 LIavU3H9A6Kbmj06lN6dHnUXMGxLtnPaLhY1xWsAP3m6JiSk6Fsy6xd+9lr2Fl/J5EF8
 eSwpuW3obS7i1v4/6ARXs9340XL1PhTFgno/RXRMrrWuU4S0Wm4oJdykdcoWSb4fAwym
 Y8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DrMbX8wf3kRZI+K+L0Oo71+13kEb1ilkzAmW6LHMaLM=;
 b=ObGHmYpqhdkLNMIPNV/dD2qo6kF2TroFunomLHdlPWKzvRVDIhsRtXuVkyNdMBSOft
 1tBUhl5gCaOU6oR67nt8ctf7gk4t9KBKUqjCabEtjTVmu/WHvs4TXlBbdwPRoe7j63FI
 +QQpe3Z4Tly+8DQUjM/8xrfhm6eeP+3Ee5ZrCsSb3C/1DgfiNjbdYZ8ia/CxCmGpoiqj
 AflAqjPFh8ZhTJWNVgHN0cxvHDha55BxSkY+UYHJHxZmeiYO2PkaH9f4GLSYt0vPYW1o
 o0n3ZfmhgY5SYcJ4V+peVcVinOO1E5ARfKE3ZwA1yqrsyNEFQMTr8VTQgHU6QJkFHKuM
 VDlg==
X-Gm-Message-State: AOAM530jAYyz98zpq7MepmQN+BtBr7OM2WfF1MaccNEyc5btPYa2lVvZ
 oq7O+HVSKDfnhl2sQ48xhUqOWI+DTF0=
X-Google-Smtp-Source: ABdhPJwOJoPTqogy5TERId+DSMXhVmdEeAoYT1KcSeSr4ZtR9ivN2sc81dA115VwQNzKEOtKj2WSeg==
X-Received: by 2002:ac8:c8c:: with SMTP id n12mr985881qti.339.1611336399026;
 Fri, 22 Jan 2021 09:26:39 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:a75a:cb34:ba60:6de6:be1d?
 ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id b7sm6399754qtp.54.2021.01.22.09.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 09:26:38 -0800 (PST)
Subject: Re: [PATCH] spapr: Adjust firmware path of PCI devices
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210122170157.246374-1-groug@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <ba52dbe6-688f-ce9e-3803-294764ab3c38@gmail.com>
Date: Fri, 22 Jan 2021 14:26:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122170157.246374-1-groug@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.221,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/22/21 2:01 PM, Greg Kurz wrote:
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

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

