Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF55472AA8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:49:35 +0100 (CET)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwiti-0006s2-CM
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:49:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwisd-0006Bk-H6
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:48:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwisb-0001ZF-9l
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639392504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYtyLbTMa4+SG5YXdVTqznolcJ3tr37n7izZQrO21RU=;
 b=K/qH0CY3uwnDQSHlueRRp5bxFZoHCbJFI0r1qhyAtJR7cLyVjy84EndWljwYXN6/JItfC1
 m7C34t4hZnDljEoZvdTKn/fTd0Z/T+IweZaIm293Ed7GOyHLA7Cit9jGUUBe/XJCjv2+hk
 4lbL5rdnxg5tFLO4EMUvnSGDM6QdhRc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-K01o_8tPMm2eYflpquzEnw-1; Mon, 13 Dec 2021 05:48:23 -0500
X-MC-Unique: K01o_8tPMm2eYflpquzEnw-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso6340240wms.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RYtyLbTMa4+SG5YXdVTqznolcJ3tr37n7izZQrO21RU=;
 b=cy9kvT38eUz+7IB8ODXj+4CT/8czhAqeBQnYoWYxTpGZohX0M2egHDWg+ku1OXSi5F
 nIbkgaDTOCdhG18xyfLu9aLDRCcD7dB1GvOYmzykAhvxkGsHQbmJW9vyCc61UVcI6xAC
 rUs3mU0d9tVNscL/q6kgnRP6CuSoVRGDphzlwmax6SDUzBQvz51J2RGifx7EH3ckILyi
 lDZ9bXvpdQqw0Zv66mjtHsAKZM3RZFnW2ggQ264F4hfSu77VIAgUAT7GGUXCVzl18T4R
 6yBMsVaUrJStBs7CCydCsw97Ussq+E03CSHYqTZQGKevId61ZXjld6ZAPFY2q/OIHC+g
 yuqw==
X-Gm-Message-State: AOAM5332PaKbLTQMuTHwnSN3WgctZWvCEH3tE81KiYtYh2cV6TZlL1CX
 rJ74zBjsrxA3/sFZfJrgK0NGCf/vhHoAVvfn6hLjcNtpSohfcCrBlwvzHPt/sf8Vb3C6pAIU0tk
 eeZi8YxmDLizjYoQ=
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr30856422wrh.51.1639392502138; 
 Mon, 13 Dec 2021 02:48:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJYFeW9CQ4Sz0gGuM3X4FEGOk1ikE/OfTfhqqpCcamGhAeLQ3f5R2WsnjsqTSuguYQSwv5uQ==
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr30856395wrh.51.1639392501913; 
 Mon, 13 Dec 2021 02:48:21 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id p13sm7436262wmi.0.2021.12.13.02.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 02:48:21 -0800 (PST)
Message-ID: <99ebc4fb-f061-1e57-da07-e66035bacf9b@redhat.com>
Date: Mon, 13 Dec 2021 11:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 3/4] hw/display/vga-mmio: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211206224528.563588-1-f4bug@amsat.org>
 <20211206224528.563588-4-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211206224528.563588-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 23.45, Philippe Mathieu-Daudé wrote:
> Introduce TYPE_VGA_MMIO, a sysbus device.
> 
> While there is no change in the vga_mmio_init()
> interface, this is a migration compatibility break
> of the MIPS Acer Pica 61 Jazz machine (pica61).

It's unfortunate, but as far as I know, it would be pretty difficult or even 
impossible to get this done without versioned machine types? So IMHO it's ok 
to break this in this case here.

> Suggested-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/display/vga.h |   2 +
>   hw/display/vga-mmio.c    | 132 +++++++++++++++++++++++++++------------
>   2 files changed, 94 insertions(+), 40 deletions(-)
> 
> diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
> index c16a5c26dae..98b2e560f9b 100644
> --- a/include/hw/display/vga.h
> +++ b/include/hw/display/vga.h
> @@ -24,6 +24,8 @@ enum vga_retrace_method {
>   
>   extern enum vga_retrace_method vga_retrace_method;
>   
> +#define TYPE_VGA_MMIO "vga-mmio"
> +
>   int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
>                     int it_shift, MemoryRegion *address_space);
>   
> diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
> index 5671fdb920f..10bde32af5c 100644
> --- a/hw/display/vga-mmio.c
> +++ b/hw/display/vga-mmio.c
> @@ -23,21 +23,34 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "qemu/bitops.h"
> -#include "qemu/units.h"
> -#include "migration/vmstate.h"
> +#include "qapi/error.h"
>   #include "hw/display/vga.h"
> +#include "hw/sysbus.h"
> +#include "hw/display/vga.h"
> +#include "hw/qdev-properties.h"
>   #include "vga_int.h"
> -#include "ui/pixel_ops.h"
>   
> -#define VGA_RAM_SIZE (8 * MiB)
> +/*
> + * QEMU interface:
> + *  + sysbus MMIO region 0: VGA I/O registers
> + *  + sysbus MMIO region 1: VGA MMIO registers
> + *  + sysbus MMIO region 2: VGA memory
> + */
>   
> -typedef struct VGAMmioState {
> +OBJECT_DECLARE_SIMPLE_TYPE(VGAMmioState, VGA_MMIO)
> +
> +struct VGAMmioState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
>       VGACommonState vga;
> -    int it_shift;
> -} VGAMmioState;
> +    MemoryRegion iomem;
> +    MemoryRegion lowmem;
> +
> +    uint8_t it_shift;
> +};
>   
> -/* Memory mapped interface */
>   static uint64_t vga_mm_read(void *opaque, hwaddr addr, unsigned size)
>   {
>       VGAMmioState *s = opaque;
> @@ -65,42 +78,81 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };
>   
> +static void vga_mmio_reset(DeviceState *dev)
> +{
> +    VGAMmioState *s = VGA_MMIO(dev);
> +
> +    vga_common_reset(&s->vga);
> +}
> +
>   int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
>                     int it_shift, MemoryRegion *address_space)
>   {
> -    VGAMmioState *s;
> -    MemoryRegion *s_ioport_ctrl, *vga_io_memory;
> +    DeviceState *dev;
> +    SysBusDevice *s;
>   
> -    s = g_malloc0(sizeof(*s));
> +    dev = qdev_new(TYPE_VGA_MMIO);
> +    qdev_prop_set_uint8(dev, "it_shift", it_shift);
> +    s = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(s, &error_fatal);
>   
> -    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
> -    s->vga.global_vmstate = true;
> -    vga_common_init(&s->vga, NULL);
> -
> -    s->it_shift = it_shift;
> -    s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
> -    memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
> -                          "vga-mm-ctrl", 0x100000);
> -    memory_region_set_flush_coalesced(s_ioport_ctrl);
> -
> -    vga_io_memory = g_malloc(sizeof(*vga_io_memory));
> -    /* XXX: endianness? */
> -    memory_region_init_io(vga_io_memory, NULL, &vga_mem_ops, &s->vga,
> -                          "vga-mem", 0x20000);
> -
> -    vmstate_register(NULL, 0, &vmstate_vga_common, s);
> -
> -    memory_region_add_subregion(address_space, ctrl_base, s_ioport_ctrl);
> -    s->vga.bank_offset = 0;
> -    memory_region_add_subregion(address_space,
> -                                vram_base + 0x000a0000, vga_io_memory);
> -    memory_region_set_coalescing(vga_io_memory);
> -
> -    s->vga.con = graphic_console_init(NULL, 0, s->vga.hw_ops, s);
> -
> -    memory_region_add_subregion(address_space,
> -                                VBE_DISPI_LFB_PHYSICAL_ADDRESS,
> -                                &s->vga.vram);
> +    sysbus_mmio_map(s, 0, ctrl_base);
> +    sysbus_mmio_map(s, 1, vram_base + 0x000a0000);
> +    sysbus_mmio_map(s, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
>   
>       return 0;
>   }
> +
> +static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
> +{
> +    VGAMmioState *s = VGA_MMIO(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(dev), &vga_mm_ctrl_ops, s,
> +                          "vga-mmio", 0x100000);
> +    memory_region_set_flush_coalesced(&s->iomem);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +
> +    /* XXX: endianness? */
> +    memory_region_init_io(&s->lowmem, OBJECT(dev), &vga_mem_ops, &s->vga,
> +                          "vga-lowmem", 0x20000);
> +    memory_region_set_coalescing(&s->lowmem);
> +    sysbus_init_mmio(sbd, &s->lowmem);
> +
> +    s->vga.bank_offset = 0;
> +    s->vga.global_vmstate = true;
> +    vga_common_init(&s->vga, OBJECT(dev));
> +    sysbus_init_mmio(sbd, &s->vga.vram);
> +    s->vga.con = graphic_console_init(dev, 0, s->vga.hw_ops, &s->vga);
> +}
> +
> +static Property vga_mmio_properties[] = {
> +    DEFINE_PROP_UINT8("it_shift", VGAMmioState, it_shift, 0),
> +    DEFINE_PROP_UINT32("vgamem_mb", VGAMmioState, vga.vram_size_mb, 8),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vga_mmio_class_initfn(ObjectClass *klass, void *data)

Just a matter of taste, but I'd prefer "oc" instead of "klass".

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


