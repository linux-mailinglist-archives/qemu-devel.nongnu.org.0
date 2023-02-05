Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5614968B1F6
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 22:35:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOmeT-0003Wt-8q; Sun, 05 Feb 2023 16:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOmeR-0003WH-Dk; Sun, 05 Feb 2023 16:34:19 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOmeP-0005VM-HO; Sun, 05 Feb 2023 16:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c0ghIHSYGOAeFQC0FxPldJqkLvQM4x/WtOPeD9dp2v0=; b=Ujg9WHD4pvrPYdin6/QciMI3LZ
 adrN+vtm2f2wpk8c6Fnc/ZrToddY1xw4Jq7yuF1zSOJAlPngKwLb2M/g2dQzC1tOUOLXd4EDv0srl
 mPhv7jDF9sVXya+4v86gWmaq1yDF+SsQ6wfNolfqlfyeHx/1t08pLCqzzvr0I1uZNRt/n+tY6UhSp
 JOUzE36cj05POCucYkfBqA299VM43ZUzQjYudDNC7qgG8skuUs/+QHuMPI5md4+OIv1DX52TyqyXn
 upt8lEqZ8gq8P+m/WZLOfBeB9dtx7tSMCzOnAWBV5ntP9Wib4Ax0GkSYQB5yoTRatZY5nGb47NkkT
 TP/8ogKMVpSd3cze1qnLpf/hwY58DwitxXda1QeprNk4au4/UXRRThh9cBwBMT+sETN1834Ym7zmC
 JcAaq/zbKaj/GS29TpdstaXtjSVDqdCA4cAn0GyMHGsarPdq4EEFt3j5pnsGdcBkyMrJ8f4VDC4r1
 kkN4Qz6jtJq5/LfYI3EPAiF28hpDSS69lcFfZBIwz87F3Vrdr2p8h2xoGJqtDDY1R8WZkQDEAFBw+
 F0rq0EMnH0IiQF58HZqdf8kOq9hCuCTki6V6zcHkglFMTWBZnrdt+vaNXfTZBdQjmdnk+jS3+ndsS
 EZnH21/qW2DaAc8EjgaeDYqvzD9a/VEwmXU6MAQ6s=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOmdl-0007gt-Ck; Sun, 05 Feb 2023 21:33:37 +0000
Message-ID: <c5f0b455-f629-ce37-d34e-2d336aa79de3@ilande.co.uk>
Date: Sun, 5 Feb 2023 21:34:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 20210518215545.1793947-9-philmd@redhat.com
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-3-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230126211740.66874-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 02/10] softmmu/ioport: Merge portio_list_add() into
 portio_list_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/01/2023 21:17, Bernhard Beschow wrote:

> Both functions are always used together and in the same order. Let's
> reflect this in the API.
> 
> Inspired-by: <20210518215545.1793947-9-philmd@redhat.com>
>            'hw/isa: Extract bus part from isa_register_portio_list()'
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/exec/ioport.h   |  6 ++----
>   hw/audio/adlib.c        |  4 ++--
>   hw/display/qxl.c        |  5 ++---
>   hw/display/vga.c        |  8 ++++----
>   hw/dma/i82374.c         |  6 ++----
>   hw/isa/isa-bus.c        |  6 ++----
>   hw/watchdog/wdt_ib700.c |  4 ++--
>   softmmu/ioport.c        | 19 +++++++------------
>   8 files changed, 23 insertions(+), 35 deletions(-)
> 
> diff --git a/include/exec/ioport.h b/include/exec/ioport.h
> index e34f668998..ec3e8e5942 100644
> --- a/include/exec/ioport.h
> +++ b/include/exec/ioport.h
> @@ -64,12 +64,10 @@ typedef struct PortioList {
>   
>   void portio_list_init(PortioList *piolist, Object *owner,
>                         const struct MemoryRegionPortio *callbacks,
> -                      void *opaque, const char *name);
> +                      void *opaque, const char *name,
> +                      MemoryRegion *address_space_io, uint16_t start);
>   void portio_list_set_flush_coalesced(PortioList *piolist);
>   void portio_list_destroy(PortioList *piolist);
> -void portio_list_add(PortioList *piolist,
> -                     struct MemoryRegion *address_space,
> -                     uint32_t addr);
>   void portio_list_del(PortioList *piolist);
>   
>   #endif /* IOPORT_H */
> diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
> index 5f979b1487..957abe3da7 100644
> --- a/hw/audio/adlib.c
> +++ b/hw/audio/adlib.c
> @@ -291,8 +291,8 @@ static void adlib_realizefn (DeviceState *dev, Error **errp)
>   
>       adlib_portio_list[0].offset = s->port;
>       adlib_portio_list[1].offset = s->port + 8;
> -    portio_list_init (&s->port_list, OBJECT(s), adlib_portio_list, s, "adlib");
> -    portio_list_add (&s->port_list, isa_address_space_io(&s->parent_obj), 0);
> +    portio_list_init(&s->port_list, OBJECT(s), adlib_portio_list, s, "adlib",
> +                     isa_address_space_io(&s->parent_obj), 0);
>   }
>   
>   static Property adlib_properties[] = {
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index ec712d3ca2..6d5a931425 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -2224,10 +2224,9 @@ static void qxl_realize_primary(PCIDevice *dev, Error **errp)
>       }
>       vga_init(vga, OBJECT(dev),
>                pci_address_space(dev), pci_address_space_io(dev), false);
> -    portio_list_init(&qxl->vga_port_list, OBJECT(dev), qxl_vga_portio_list,
> -                     vga, "vga");
> +    portio_list_init(&qxl->vga_port_list, OBJECT(dev), qxl_vga_portio_list, vga,
> +                     "vga", pci_address_space_io(dev), 0x3b0);
>       portio_list_set_flush_coalesced(&qxl->vga_port_list);
> -    portio_list_add(&qxl->vga_port_list, pci_address_space_io(dev), 0x3b0);
>       qxl->have_vga = true;
>   
>       vga->con = graphic_console_init(DEVICE(dev), 0, &qxl_ops, qxl);
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 7a5fdff649..2b606a526c 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -2309,12 +2309,12 @@ void vga_init(VGACommonState *s, Object *obj, MemoryRegion *address_space,
>                                           1);
>       memory_region_set_coalescing(vga_io_memory);
>       if (init_vga_ports) {
> -        portio_list_init(&s->vga_port_list, obj, vga_ports, s, "vga");
> +        portio_list_init(&s->vga_port_list, obj, vga_ports, s, "vga",
> +                         address_space_io, 0x3b0);
>           portio_list_set_flush_coalesced(&s->vga_port_list);
> -        portio_list_add(&s->vga_port_list, address_space_io, 0x3b0);
>       }
>       if (vbe_ports) {
> -        portio_list_init(&s->vbe_port_list, obj, vbe_ports, s, "vbe");
> -        portio_list_add(&s->vbe_port_list, address_space_io, 0x1ce);
> +        portio_list_init(&s->vbe_port_list, obj, vbe_ports, s, "vbe",
> +                         address_space_io, 0x1ce);
>       }
>   }
> diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
> index 34c3aaf7d3..5914b34079 100644
> --- a/hw/dma/i82374.c
> +++ b/hw/dma/i82374.c
> @@ -131,10 +131,8 @@ static void i82374_realize(DeviceState *dev, Error **errp)
>       }
>       i8257_dma_init(isa_bus, true);
>   
> -    portio_list_init(&s->port_list, OBJECT(s), i82374_portio_list, s,
> -                     "i82374");
> -    portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj),
> -                    s->iobase);
> +    portio_list_init(&s->port_list, OBJECT(s), i82374_portio_list, s, "i82374",
> +                     isa_address_space_io(&s->parent_obj), s->iobase);
>   
>       memset(s->commands, 0, sizeof(s->commands));
>   }
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 1bee1a47f1..b3497dad61 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -124,8 +124,6 @@ int isa_register_portio_list(ISADevice *dev,
>                                const MemoryRegionPortio *pio_start,
>                                void *opaque, const char *name)
>   {
> -    assert(piolist && !piolist->owner);
> -
>       if (!isabus) {
>           return -ENODEV;
>       }
> @@ -135,8 +133,8 @@ int isa_register_portio_list(ISADevice *dev,
>          actually handled e.g. the FDC device.  */
>       isa_init_ioport(dev, start);
>   
> -    portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
> -    portio_list_add(piolist, isabus->address_space_io, start);
> +    portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name,
> +                     isabus->address_space_io, start);
>   
>       return 0;
>   }
> diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
> index b116c3a3aa..e53e474b83 100644
> --- a/hw/watchdog/wdt_ib700.c
> +++ b/hw/watchdog/wdt_ib700.c
> @@ -115,8 +115,8 @@ static void wdt_ib700_realize(DeviceState *dev, Error **errp)
>   
>       s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ib700_timer_expired, s);
>   
> -    portio_list_init(&s->port_list, OBJECT(s), wdt_portio_list, s, "ib700");
> -    portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj), 0);
> +    portio_list_init(&s->port_list, OBJECT(s), wdt_portio_list, s, "ib700",
> +                     isa_address_space_io(&s->parent_obj), 0);
>   }
>   
>   static void wdt_ib700_reset(DeviceState *dev)
> diff --git a/softmmu/ioport.c b/softmmu/ioport.c
> index 215344467b..c92e3cb27d 100644
> --- a/softmmu/ioport.c
> +++ b/softmmu/ioport.c
> @@ -231,8 +231,13 @@ static void portio_list_add_1(PortioList *piolist,
>   
>   void portio_list_init(PortioList *piolist, Object *owner,
>                         const MemoryRegionPortio *callbacks,
> -                      void *opaque, const char *name)
> +                      void *opaque, const char *name,
> +                      MemoryRegion *address_space_io, uint16_t start)
>   {
> +    assert(piolist && !piolist->owner);
> +
> +    const MemoryRegionPortio *pio, *pio_start = callbacks;
> +    unsigned int off_low, off_high, off_last, count;
>       unsigned n = 0;
>   
>       while (callbacks[n].size) {
> @@ -242,21 +247,11 @@ void portio_list_init(PortioList *piolist, Object *owner,
>       piolist->ports = callbacks;
>       piolist->nr = 0;
>       piolist->regions = g_new0(MemoryRegion *, n);
> -    piolist->address_space = NULL;
> +    piolist->address_space = address_space_io;
>       piolist->opaque = opaque;
>       piolist->owner = owner;
>       piolist->name = name;
>       piolist->flush_coalesced_mmio = false;
> -}
> -
> -void portio_list_add(PortioList *piolist,
> -                     MemoryRegion *address_space,
> -                     uint32_t start)
> -{
> -    const MemoryRegionPortio *pio, *pio_start = piolist->ports;
> -    unsigned int off_low, off_high, off_last, count;
> -
> -    piolist->address_space = address_space;
>   
>       /* Handle the first entry specially.  */
>       off_last = off_low = pio_start->offset;

As a general comment: is portio used outside of ISA bus devices at all? It seems to 
me that portio is really a wrapper around the the old x86 IO port functionality, and 
so I could see PortioList being moved exclusively to within ISADevice which could 
allow the address_space, opaque and owner to be resolved automatically with the 
PortioList being owned by ISADevice.


ATB,

Mark.

