Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA8C5FEB5C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 11:11:11 +0200 (CEST)
Received: from localhost ([::1]:33704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojGij-00028p-UX
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 05:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGgJ-000866-Pi; Fri, 14 Oct 2022 05:08:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGgI-0003ii-4Q; Fri, 14 Oct 2022 05:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tNpjWxI/KZTYPvSWKP9dbopKA6p49CKfNQSUlLQGtrg=; b=RzVrYlCcUZY50lQbeT3FPMZaF2
 wHyapMo+ksZjiYSNgNoCa4AjwMAS6PGjD8PpYPYuYgDxr+YLKv6CAEL+gfeMqHIrCILsh2QNVZC7W
 nUlKVnNvOeQA7CoUpLwbwx9dNAWGbvkgOF67V4ccXWOIs9bka8/cAH11VKF5wAWC8WTAVqMdemFps
 Ijxo7vPl0eV+NhOKGhiSnAHraO4cqhjRnQEE4dZJyJUd3P8tk4e6NDgvLyhvPvd2JOpOWCQHaruMh
 vF0Wrh8nh9M6M4BkUdDgJOrzyVJqMbUpe2PKypqLHglY5VCsLCRC/M8XtJL3xstvnUMMUgXe9XQ49
 bu4SMoDytfoCAEIyWVeUwxA0CVJT9A/f9nTMQq9ohRPpTm+iKIn9AqyyV3J6PaM5eUHD0T6GUf/BN
 WdWGz9+45EYz9L6GK8yDunPI2Lk9gnktGkA3tlw7FRL1mbM4sJ8BQ/e2aHcZlTxXUZtCdI7Lj6H+x
 miUrXW1fGuIG1akpPhITOympoebowlxPPcRqPR9X3IcPqDIcJxtYeFNekJIlsGS0uVaxIakhyXEdh
 f/4utR8cdqbWrg2gu7D35/4w346WtsVbVEvs8JCvHNl8l77ZJvHuoKQVivA9azKUoxuQG5srVseDU
 JYa19qhNZWFqVrlAHP8N3qy2mrqH6ay30JvFsZapo=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGeQ-0001Qt-Oy; Fri, 14 Oct 2022 10:06:46 +0100
Message-ID: <a8ef2e11-ca1e-6838-f13e-10b42c7b0108@ilande.co.uk>
Date: Fri, 14 Oct 2022 10:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664827008.git.balaton@eik.bme.hu>
 <e626e83dadc82fba08c98e797d150bd8d4f8e22d.1664827008.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <e626e83dadc82fba08c98e797d150bd8d4f8e22d.1664827008.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 10/13] hw/ppc/mac.h: Move grackle-pcihost type
 declaration out to a header
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 03/10/2022 21:13, BALATON Zoltan wrote:

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   MAINTAINERS                   |  1 +
>   hw/pci-host/grackle.c         | 14 +----------
>   hw/ppc/mac.h                  |  3 ---
>   hw/ppc/mac_oldworld.c         |  1 +
>   include/hw/pci-host/grackle.h | 44 +++++++++++++++++++++++++++++++++++
>   5 files changed, 47 insertions(+), 16 deletions(-)
>   create mode 100644 include/hw/pci-host/grackle.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 789172b2a8..6e6819afcd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1345,6 +1345,7 @@ F: hw/intc/heathrow_pic.c
>   F: hw/input/adb*
>   F: include/hw/intc/heathrow_pic.h
>   F: include/hw/input/adb*
> +F: include/hw/pci-host/grackle.h
>   F: pc-bios/qemu_vga.ndrv
>   
>   PReP
> diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
> index b05facf463..e4c7303859 100644
> --- a/hw/pci-host/grackle.c
> +++ b/hw/pci-host/grackle.c
> @@ -24,7 +24,6 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "hw/pci/pci_host.h"
>   #include "hw/ppc/mac.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/pci/pci.h"
> @@ -33,18 +32,7 @@
>   #include "qemu/module.h"
>   #include "trace.h"
>   #include "qom/object.h"
> -
> -OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
> -
> -struct GrackleState {
> -    PCIHostState parent_obj;
> -
> -    uint32_t ofw_addr;
> -    qemu_irq irqs[4];
> -    MemoryRegion pci_mmio;
> -    MemoryRegion pci_hole;
> -    MemoryRegion pci_io;
> -};
> +#include "hw/pci-host/grackle.h"
>   
>   /* Don't know if this matches real hardware, but it agrees with OHW.  */
>   static int pci_grackle_map_irq(PCIDevice *pci_dev, int irq_num)
> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
> index 55cb02c990..fe77a6c6db 100644
> --- a/hw/ppc/mac.h
> +++ b/hw/ppc/mac.h
> @@ -35,9 +35,6 @@
>   #define KERNEL_LOAD_ADDR 0x01000000
>   #define KERNEL_GAP       0x00100000
>   
> -/* Grackle PCI */
> -#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
> -
>   /* Mac NVRAM */
>   #define TYPE_MACIO_NVRAM "macio-nvram"
>   OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index a10c884503..e1a22f8eba 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -38,6 +38,7 @@
>   #include "hw/isa/isa.h"
>   #include "hw/pci/pci.h"
>   #include "hw/pci/pci_host.h"
> +#include "hw/pci-host/grackle.h"
>   #include "hw/nvram/fw_cfg.h"
>   #include "hw/char/escc.h"
>   #include "hw/misc/macio/macio.h"
> diff --git a/include/hw/pci-host/grackle.h b/include/hw/pci-host/grackle.h
> new file mode 100644
> index 0000000000..7ad3a779f0
> --- /dev/null
> +++ b/include/hw/pci-host/grackle.h
> @@ -0,0 +1,44 @@
> +/*
> + * QEMU Grackle PCI host (heathrow OldWorld PowerMac)
> + *
> + * Copyright (c) 2006-2007 Fabrice Bellard
> + * Copyright (c) 2007 Jocelyn Mayer
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef GRACKLE_H
> +#define GRACKLE_H
> +
> +#include "hw/pci/pci_host.h"
> +
> +#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
> +OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
> +
> +struct GrackleState {
> +    PCIHostState parent_obj;
> +
> +    uint32_t ofw_addr;
> +    qemu_irq irqs[4];
> +    MemoryRegion pci_mmio;
> +    MemoryRegion pci_hole;
> +    MemoryRegion pci_io;
> +};
> +
> +#endif

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

