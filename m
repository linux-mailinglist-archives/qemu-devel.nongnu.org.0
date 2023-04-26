Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C09B6EF581
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:28:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prfAp-00080z-4m; Wed, 26 Apr 2023 09:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfAl-00080j-SK; Wed, 26 Apr 2023 09:27:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfAk-0004D7-3N; Wed, 26 Apr 2023 09:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xbq3z2iKt3G7E3eT3E90s7hJ/5ytzhx9wUtIAZAkM/I=; b=OdGTTiNKDqNI+wz1Lgx3fOSNNO
 cnzKMshpd7u/wnYiNAtieWtNu9ZeMefwMyCqAbOvTy8OaLRClk6J1CKXMX76E6i2/+v0Mg+O4GRrs
 ZG5i5ppyu8tb1+3pDnrAd2iqj1RpR/3iSQG+aBtuot8GemcpMU6fQSOgMLhZc11q+9v3/ekqP864h
 N5ltINA1QO1RGJRfI/zEfTUFkbSclt5XIFiIErZDK/sVFFH4YL0UmGIw3ZpxB2McpiRWzU7pydlL3
 56Mi/qmyiMuF8pxHaz4O3yArmck/+98dhq7DOFxPdSCzw/aaSrYSNG9CsU+RwRwB2xa2rJI0fK4PP
 +Sx/17FEmssEp2XwlQeqoxwBT05BMp1h6x5IHpng5IXxwCH/oeLzyn/uufgkpHN5K1U4J492RhqQD
 X9N2nJvq6L3Ti/IyQfNg3unsBtPC0uEYQi8Fw6wzK0Nj1BW//OBdV5UdMAIqJ0LLLOX5TLksFCaGR
 qvHKuAhU0lRrETS70vQE8iqbx6JpreLn2neIf7BQs3IkLADGGBDCkMCmNmMEg0OYEcv7gHzixcsK0
 R+fD4VZ+yXKVxaDMBVBMQ/d4afa/wpNIpaGE3KLQGOOYGjt2Rsxs4t9C3C3+mi1FCz1uVam0YJbSj
 IiId1qO7V4gyM0mOC398GQvzOJAmJlMBG06AHbMy4=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf9h-0002lO-NQ; Wed, 26 Apr 2023 14:26:01 +0100
Message-ID: <1ad3f615-e4fd-e61b-44e8-a9cb15378c37@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-14-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 13/18] exec/ioport: Factor
 portio_list_register_flush_coalesced() out
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:

> We always follow the same pattern when registering
> coalesced portio:
> 
>    - portio_list_init()
>    - portio_list_set_flush_coalesced()
>    - portio_list_add()
> 
> Factor these 3 operations in a single helper named
> portio_list_register_flush_coalesced().
> 
> Drop portio_list_set_flush_coalesced() which is now
> inlined.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <20230207234615.77300-2-philmd@linaro.org>
> ---
>   hw/display/qxl.c      |  7 +++----
>   hw/display/vga.c      |  5 ++---
>   include/exec/ioport.h |  5 ++++-
>   softmmu/ioport.c      | 27 ++++++++++++++++++++++-----
>   4 files changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index ec712d3ca2..2ecaa0643f 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -2224,10 +2224,9 @@ static void qxl_realize_primary(PCIDevice *dev, Error **errp)
>       }
>       vga_init(vga, OBJECT(dev),
>                pci_address_space(dev), pci_address_space_io(dev), false);
> -    portio_list_init(&qxl->vga_port_list, OBJECT(dev), qxl_vga_portio_list,
> -                     vga, "vga");
> -    portio_list_set_flush_coalesced(&qxl->vga_port_list);
> -    portio_list_add(&qxl->vga_port_list, pci_address_space_io(dev), 0x3b0);
> +    portio_list_register_flush_coalesced(&qxl->vga_port_list, OBJECT(dev),
> +                                         qxl_vga_portio_list, vga, "vga",
> +                                         pci_address_space_io(dev), 0x3b0);
>       qxl->have_vga = true;
>   
>       vga->con = graphic_console_init(DEVICE(dev), 0, &qxl_ops, qxl);
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 7a5fdff649..98d644922e 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -2309,9 +2309,8 @@ void vga_init(VGACommonState *s, Object *obj, MemoryRegion *address_space,
>                                           1);
>       memory_region_set_coalescing(vga_io_memory);
>       if (init_vga_ports) {
> -        portio_list_init(&s->vga_port_list, obj, vga_ports, s, "vga");
> -        portio_list_set_flush_coalesced(&s->vga_port_list);
> -        portio_list_add(&s->vga_port_list, address_space_io, 0x3b0);
> +        portio_list_register_flush_coalesced(&s->vga_port_list, obj, vga_ports,
> +                                             s, "vga", address_space_io, 0x3b0);
>       }
>       if (vbe_ports) {
>           portio_list_init(&s->vbe_port_list, obj, vbe_ports, s, "vbe");
> diff --git a/include/exec/ioport.h b/include/exec/ioport.h
> index e34f668998..eb9882a3ee 100644
> --- a/include/exec/ioport.h
> +++ b/include/exec/ioport.h
> @@ -65,7 +65,10 @@ typedef struct PortioList {
>   void portio_list_init(PortioList *piolist, Object *owner,
>                         const struct MemoryRegionPortio *callbacks,
>                         void *opaque, const char *name);
> -void portio_list_set_flush_coalesced(PortioList *piolist);
> +void portio_list_register_flush_coalesced(PortioList *piolist, Object *owner,
> +                                          const MemoryRegionPortio *callbacks,
> +                                          void *opaque, const char *name,
> +                                          MemoryRegion *mr, uint32_t offset);
>   void portio_list_destroy(PortioList *piolist);
>   void portio_list_add(PortioList *piolist,
>                        struct MemoryRegion *address_space,
> diff --git a/softmmu/ioport.c b/softmmu/ioport.c
> index cb8adb0b93..be0c920c5c 100644
> --- a/softmmu/ioport.c
> +++ b/softmmu/ioport.c
> @@ -124,6 +124,7 @@ void portio_list_init(PortioList *piolist,
>           ++n;
>       }
>   
> +    assert(owner);
>       piolist->ports = callbacks;
>       piolist->nr = 0;
>       piolist->regions = g_new0(MemoryRegion *, n);
> @@ -134,11 +135,6 @@ void portio_list_init(PortioList *piolist,
>       piolist->flush_coalesced_mmio = false;
>   }
>   
> -void portio_list_set_flush_coalesced(PortioList *piolist)
> -{
> -    piolist->flush_coalesced_mmio = true;
> -}
> -
>   void portio_list_destroy(PortioList *piolist)
>   {
>       MemoryRegionPortioList *mrpio;
> @@ -297,3 +293,24 @@ void portio_list_del(PortioList *piolist)
>           memory_region_del_subregion(piolist->address_space, &mrpio->mr);
>       }
>   }
> +
> +static void do_portio_list_register(PortioList *piolist, Object *owner,
> +                                    const MemoryRegionPortio *callbacks,
> +                                    void *opaque, const char *name,
> +                                    MemoryRegion *mr, uint32_t offset,
> +                                    bool flush_coalesced_mmio)
> +{
> +    assert(piolist && !piolist->owner);
> +    portio_list_init(piolist, owner, callbacks, opaque, name);
> +    piolist->flush_coalesced_mmio = flush_coalesced_mmio;
> +    portio_list_add(piolist, mr, offset);
> +}
> +
> +void portio_list_register_flush_coalesced(PortioList *piolist, Object *owner,
> +                                          const MemoryRegionPortio *callbacks,
> +                                          void *opaque, const char *name,
> +                                          MemoryRegion *mr, uint32_t offset)
> +{
> +    do_portio_list_register(piolist, owner, callbacks,
> +                            opaque, name, mr, offset, true);
> +}

Would it be better to have a portio_list_register() that calls portio_list_init() 
followed by portio_list_add() and still keep portio_list_set_flush_coalesced() 
separate? Then it seems that other portio users can benefit in a slight reduction in 
line count given that there only appear to be 2 users of 
portio_list_set_flush_coalesced().


ATB,

Mark.

