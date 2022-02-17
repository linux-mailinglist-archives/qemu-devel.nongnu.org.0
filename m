Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BC04BA157
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:35:51 +0100 (CET)
Received: from localhost ([::1]:34996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKgwn-00018G-Q8
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:35:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nKg5N-0006kt-K5
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:40:40 -0500
Received: from [2001:738:2001:2001::2001] (port=53120 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nKg5K-0000TR-TC
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:40:36 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 54E7C745712;
 Thu, 17 Feb 2022 13:40:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2CF847456FE; Thu, 17 Feb 2022 13:40:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2B09B7456E3;
 Thu, 17 Feb 2022 13:40:32 +0100 (CET)
Date: Thu, 17 Feb 2022 13:40:32 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v4 7/7] hw/mips/gt64xxx_pci: Resolve gt64120_register()
In-Reply-To: <20220217101924.15347-8-shentey@gmail.com>
Message-ID: <b514d656-9edd-a125-f334-4f1fabcfa8e@eik.bme.hu>
References: <20220217101924.15347-1-shentey@gmail.com>
 <20220217101924.15347-8-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-202673521-1645101632=:67559"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-202673521-1645101632=:67559
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 17 Feb 2022, Bernhard Beschow wrote:
> Now that gt64120_register() lost its pic parameter, there is an
> opportunity to remove it. gt64120_register() is old style by wrapping
> qdev API, and the new style is to use qdev directly. So take the
> opportunity and modernize the code.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/mips/gt64xxx_pci.c  | 21 ++++-----------------
> hw/mips/malta.c        |  3 ++-
> include/hw/mips/mips.h |  3 ---
> 3 files changed, 6 insertions(+), 21 deletions(-)
>
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index eb205d6d70..e0ff1b5566 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -26,7 +26,6 @@
> #include "qapi/error.h"
> #include "qemu/units.h"
> #include "qemu/log.h"
> -#include "hw/mips/mips.h"
> #include "hw/pci/pci.h"
> #include "hw/pci/pci_host.h"
> #include "migration/vmstate.h"
> @@ -1151,30 +1150,18 @@ static void gt64120_reset(DeviceState *dev)
> static void gt64120_realize(DeviceState *dev, Error **errp)
> {
>     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
> +    PCIHostState *phb = PCI_HOST_BRIDGE(dev);
>
>     memory_region_init_io(&s->ISD_mem, OBJECT(dev), &isd_mem_ops, s,
>                           "gt64120-isd", 0x1000);
> -}
> -
> -PCIBus *gt64120_register(void)
> -{
> -    GT64120State *d;
> -    PCIHostState *phb;
> -    DeviceState *dev;
> -
> -    dev = qdev_new(TYPE_GT64120_PCI_HOST_BRIDGE);
> -    d = GT64120_PCI_HOST_BRIDGE(dev);
> -    phb = PCI_HOST_BRIDGE(dev);
> -    memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
> -    address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");
> +    memory_region_init(&s->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
> +    address_space_init(&s->pci0_mem_as, &s->pci0_mem, "pci0-mem");
>     phb->bus = pci_root_bus_new(dev, "pci",
> -                                &d->pci0_mem,
> +                                &s->pci0_mem,
>                                 get_system_io(),
>                                 PCI_DEVFN(18, 0), TYPE_PCI_BUS);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
> -    return phb->bus;
> }
>
> static void gt64120_pci_realize(PCIDevice *d, Error **errp)
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 13254dbc89..55037eb90f 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1390,7 +1390,8 @@ void mips_malta_init(MachineState *machine)
>     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
>
>     /* Northbridge */
> -    pci_bus = gt64120_register();
> +    dev = sysbus_create_simple("gt64120", -1, NULL);
> +    pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
>     /*
>      * The whole address space decoded by the GT-64120A doesn't generate
>      * exception when accessing invalid memory. Create an empty slot to
> diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
> index ff88942e63..101799f7d3 100644
> --- a/include/hw/mips/mips.h
> +++ b/include/hw/mips/mips.h
> @@ -9,9 +9,6 @@
>
> #include "exec/memory.h"
>
> -/* gt64xxx.c */
> -PCIBus *gt64120_register(void);
> -
> /* bonito.c */
> PCIBus *bonito_init(qemu_irq *pic);
>
>
--3866299591-202673521-1645101632=:67559--

