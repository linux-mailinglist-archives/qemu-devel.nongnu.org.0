Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B87D41C6F0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:38:29 +0200 (CEST)
Received: from localhost ([::1]:33012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaj6-0000cT-2Q
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVaeP-0006Gi-0l
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:33:37 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:53344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVaeM-0007OK-Ty
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:33:36 -0400
Received: from [192.168.15.226] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id DB58921C6C;
 Wed, 29 Sep 2021 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632926012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgOZnnSPCd8Q1+j9fF4M1G6UozGN3g6xEFj/OJdg7Ps=;
 b=W2jAxrLq68uzlHdfzrP5DicoGgBqerDShHyw2nUQAqcZbpl61350yhB3IEPta12GSize+i
 VlM2oLwgjgN5bqKwd61i6xLzmbfEjRO6pXpJ03rXRY9JFJGEi/yPgPOITA+AVckaQTH2pJ
 E9Y1P6S/W7rONSUd367MdTnkDv+ejnE=
Message-ID: <a829a153-dd96-8038-2ced-b2e0b8c5ab12@greensocs.com>
Date: Wed, 29 Sep 2021 16:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/3] hw/input/lasips2: QOM'ify the Lasi PS/2
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210920064048.2729397-1-f4bug@amsat.org>
 <20210920064048.2729397-4-f4bug@amsat.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20210920064048.2729397-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.03,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/20/21 08:40, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

> ---
>   include/hw/input/lasips2.h | 17 +++++++++++++----
>   hw/hppa/lasi.c             | 10 +++++++++-
>   hw/input/lasips2.c         | 38 ++++++++++++++++++++++++++++----------
>   3 files changed, 50 insertions(+), 15 deletions(-)
> 
> diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
> index c88f1700162..834b6d867d9 100644
> --- a/include/hw/input/lasips2.h
> +++ b/include/hw/input/lasips2.h
> @@ -7,11 +7,11 @@
>   #ifndef HW_INPUT_LASIPS2_H
>   #define HW_INPUT_LASIPS2_H
>   
> -#include "exec/hwaddr.h"
> +#include "hw/sysbus.h"
>   
>   #define TYPE_LASIPS2 "lasips2"
> +OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
>   
> -struct LASIPS2State;
>   typedef struct LASIPS2Port {
>       struct LASIPS2State *parent;
>       MemoryRegion reg;
> @@ -23,12 +23,21 @@ typedef struct LASIPS2Port {
>       bool irq;
>   } LASIPS2Port;
>   
> +/*
> + * QEMU interface:
> + *  + sysbus MMIO region 0 is the keyboard port interface
> + *  + sysbus MMIO region 1 is the mouse port interface
> + *  + sysbus IRQ 0 is the interrupt line shared between
> + *    keyboard and mouse ports
> + */
>   typedef struct LASIPS2State {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
>       LASIPS2Port kbd;
>       LASIPS2Port mouse;
>       qemu_irq irq;
>   } LASIPS2State;
>   
> -void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
> -
>   #endif /* HW_INPUT_LASIPS2_H */
> diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
> index 88c3791eb68..91414748b70 100644
> --- a/hw/hppa/lasi.c
> +++ b/hw/hppa/lasi.c
> @@ -297,6 +297,7 @@ static int lasi_get_irq(unsigned long hpa)
>   DeviceState *lasi_init(MemoryRegion *address_space)
>   {
>       DeviceState *dev;
> +    SysBusDevice *sbd;
>       LasiState *s;
>   
>       dev = qdev_new(TYPE_LASI_CHIP);
> @@ -340,7 +341,14 @@ DeviceState *lasi_init(MemoryRegion *address_space)
>       /* PS/2 Keyboard/Mouse */
>       qemu_irq ps2kbd_irq = qemu_allocate_irq(lasi_set_irq, s,
>               lasi_get_irq(LASI_PS2KBD_HPA));
> -    lasips2_init(address_space, LASI_PS2KBD_HPA,  ps2kbd_irq);
> +
> +    sbd = SYS_BUS_DEVICE(qdev_new(TYPE_LASIPS2));
> +    sysbus_realize_and_unref(sbd, &error_fatal);
> +    memory_region_add_subregion(address_space, LASI_PS2KBD_HPA,
> +                                sysbus_mmio_get_region(sbd, 0));
> +    memory_region_add_subregion(address_space, LASI_PS2MOU_HPA,
> +                                sysbus_mmio_get_region(sbd, 1));
> +    sysbus_connect_irq(sbd, 0, ps2kbd_irq);
>   
>       return dev;
>   }
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 0f8362f17bc..46cd32316da 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -243,28 +243,46 @@ static void ps2dev_update_irq(void *opaque, int level)
>       lasips2_update_irq(port->parent);
>   }
>   
> -void lasips2_init(MemoryRegion *address_space,
> -                  hwaddr base, qemu_irq irq)
> +static void lasips2_init(Object *obj)
>   {
> -    LASIPS2State *s;
> +    LASIPS2State *s = LASIPS2(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>   
> -    s = g_malloc0(sizeof(LASIPS2State));
> -
> -    s->irq = irq;
> +    sysbus_init_irq(sbd, &s->irq);
>       s->mouse.id = 1;
>       s->kbd.parent = s;
>       s->mouse.parent = s;
>   
> -    vmstate_register(NULL, base, &vmstate_lasips2, s);
> -
>       s->kbd.dev = ps2_kbd_init(ps2dev_update_irq, &s->kbd);
>       s->mouse.dev = ps2_mouse_init(ps2dev_update_irq, &s->mouse);
>   
>       memory_region_init_io(&s->kbd.reg, NULL, &lasips2_reg_ops, &s->kbd,
>                             "lasips2-kbd", 0x100);
> -    memory_region_add_subregion(address_space, base, &s->kbd.reg);
> +    sysbus_init_mmio(sbd, &s->kbd.reg);
>   
>       memory_region_init_io(&s->mouse.reg, NULL, &lasips2_reg_ops, &s->mouse,
>                             "lasips2-mouse", 0x100);
> -    memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
> +    sysbus_init_mmio(sbd, &s->mouse.reg);
>   }
> +
> +static void lasips2_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->vmsd = &vmstate_lasips2;
> +}
> +
> +static const TypeInfo lasips2_info = {
> +    .name          = TYPE_LASIPS2,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(LASIPS2State),
> +    .instance_init = lasips2_init,
> +    .class_init    = lasips2_class_init,
> +};
> +
> +static void lasips2_register_types(void)
> +{
> +    type_register_static(&lasips2_info);
> +}
> +
> +type_init(lasips2_register_types)
> 

