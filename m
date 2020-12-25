Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E062E2953
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 01:40:35 +0100 (CET)
Received: from localhost ([::1]:35548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksb9m-0002Ci-8E
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 19:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1ksb77-0001L5-MS
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 19:37:49 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:37533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1ksb76-0002yD-5Y
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 19:37:49 -0500
Received: by mail-ot1-x331.google.com with SMTP id o11so2950687ote.4
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 16:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=m8yUKU5O7FWdKSnTa68az1pQhz4SvkEROVOe5OcVokU=;
 b=pf5tIUQrK96FvtMfUOPkGzck4LuPq5gs8Qjr3nepVVJClO8qlViyGShdhPqSaMox01
 0ezU51plozESypZ7QFD4AYCdGM2EmzdkynE8PnYzuQyX7PbPhvlNKJi8Db7bWefgl40g
 PtmG+N/JkQO1iJjwMuhswNgcScer2Q3ObXwIkNnkQMAn3i5uCFk+mcjMujk02KlgPhly
 EiIdP9vZWZI7saf0c/7hZKAz3rQ97St/qGXAHsv4gCA4PVQJ8nj4+D/+loHGr9cwI60j
 nB1Pm345imFwLrhaKKBbsCAOe71O67YdvItDg0aPeBOQe5laqVaL/zAUiFCcIrsmXp4I
 icoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=m8yUKU5O7FWdKSnTa68az1pQhz4SvkEROVOe5OcVokU=;
 b=jhmzwik3r/Lb/feNcT0X75tA1QE44Xpb/3qoiWgCSRsFHOhszpbsAsJwc7LGY0iOcP
 ZA10b4GmsIoKL+01R0Jm1v1sCVmYpny7YvBNP7FJZD4itNyDdrqooLo+VQX2oTZIOXVx
 OV2VDPh33GWj86B7e1vcUBumge0gBb8RwbazsBvV5HB/SUw2bmzoVIQB5Oql5ZpMElTT
 YF/jMO/RipN/llij443Bpl+Z4K/oUdQ+ZEy67KOQeIJjRXEpyfSk6xKUL4KymJDMP7XG
 h+ORP2/BE/eBsAxhg6o+a8hhp3uOLBpdiSlQ6YOqX7uZOgKXQ/zksw031PF4xAbqcDrU
 PpOA==
X-Gm-Message-State: AOAM531lFrmLWP7G4GtoYZoeR3QqAWHFt+Tjl1RnJK/QuGvrblZDcrAU
 KdWdOO+qboZ0PoE4wPBbIXQ=
X-Google-Smtp-Source: ABdhPJwX5f1/gDBh5dabMac0bfyJCgZoOFqS5JmuEcpCSQz9R+hae31auwTHyJyTJThfGdBF2cZTGw==
X-Received: by 2002:a05:6830:22f9:: with SMTP id
 t25mr24637178otc.14.1608856666952; 
 Thu, 24 Dec 2020 16:37:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id j194sm3472206oih.56.2020.12.24.16.37.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Dec 2020 16:37:46 -0800 (PST)
Date: Thu, 24 Dec 2020 16:37:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 2/2] via-ide: Fix fuloong2e support
Message-ID: <20201225003745.GA34107@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FAKE_REPLY_C=1.486, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: philmd@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 25, 2020 at 12:23:37AM +0100, BALATON Zoltan wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> Fuloong2e needs to use legacy mode for IDE support to work with Linux.
> Add property to via-ide driver to make the mode configurable, and set
> legacy mode for Fuloong2e.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> [balaton: Use bit in flags for property, add comment for missing BAR4]
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  hw/ide/via.c        | 19 +++++++++++++++++--
>  hw/mips/fuloong2e.c |  4 +++-
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index be09912b33..7d54d7e829 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -26,6 +26,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/pci/pci.h"
> +#include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  #include "qemu/module.h"
>  #include "sysemu/dma.h"
> @@ -185,12 +186,19 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>                            &d->bus[1], "via-ide1-cmd", 4);
>      pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>  
> -    bmdma_setup_bar(d);
> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    if (!(d->flags & BIT(PCI_IDE_LEGACY_MODE))) {
> +        /* Missing BAR4 will make Linux driver fall back to legacy PIO mode */
> +        bmdma_setup_bar(d);
> +        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    }
>  
>      qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>      for (i = 0; i < 2; i++) {
>          ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
> +        if (d->flags & BIT(PCI_IDE_LEGACY_MODE)) {
> +            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0,
> +                            i ? 0x376 : 0x3f6);
> +        }
>          ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>  
>          bmdma_init(&d->bus[i], &d->bmdma[i], d);
> @@ -210,6 +218,12 @@ static void via_ide_exitfn(PCIDevice *dev)
>      }
>  }
>  
> +static Property via_ide_properties[] = {
> +    DEFINE_PROP_BIT("legacy_mode", PCIIDEState, flags, PCI_IDE_LEGACY_MODE,
> +                    false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void via_ide_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -223,6 +237,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
>      k->device_id = PCI_DEVICE_ID_VIA_IDE;
>      k->revision = 0x06;
>      k->class_id = PCI_CLASS_STORAGE_IDE;
> +    device_class_set_props(dc, via_ide_properties);
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>  
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 45c596f4fe..f0733e87b7 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -253,7 +253,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>      /* Super I/O */
>      isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
>  
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
> +    dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
> +    qdev_prop_set_bit(&dev->qdev, "legacy_mode", true);
> +    pci_realize_and_unref(dev, pci_bus, &error_fatal);
>      pci_ide_create_devs(dev);
>  
>      pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
> -- 
> 2.21.3
> 

