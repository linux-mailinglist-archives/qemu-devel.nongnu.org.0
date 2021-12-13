Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C392F472AD6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:07:35 +0100 (CET)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjB7-0003sS-GV
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:07:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwj9L-0003B8-6j
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:05:43 -0500
Received: from [2a00:1450:4864:20::42e] (port=38770
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwj9I-0004FE-Jy
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:05:42 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q3so26339107wru.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q5aSvSw2XITgz3ByuIMlCE3R33mHwttErC9uv4II7NM=;
 b=L4lnNu+mPtwQOHItxXDpa9miwJnAaDTttuJ8P2rt00MidHwkhS3SByYbvc1qD1uwmS
 meXaXnXqhmG97VrhW9NDrNtqaAyAkBq+NjWOvJRA0M4yPeVdgeORP6lEuDMDHcpy+Pb/
 kdX6H7AEYfESRgfrG63lfJam7h0P1fJMTWKQfe1cLD+oQTAdFRFCXhTG5nr5YwD5ZDZ9
 Bl8Da72KD92TUwBEoJB99IQA6g5bSMucGpN+xQ1Ppdb60uBb8sJtitMTwiBLk9hX/O8C
 KwmS4PRNgo3UBu1zzw0puj+biTw+/2Syp0M/nbUkuI1wWQQxZ1ovzMm9aliGU44ttN2l
 APtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q5aSvSw2XITgz3ByuIMlCE3R33mHwttErC9uv4II7NM=;
 b=Fd48ALpOjdeCqfxtJ9ZdBrX+bl8xYCxPxQuL6NzDXzKxp8DwxDoruLOO5qQHyXWyAC
 hRGTP2zlyV7KBLKRIWvVQsLHfq3PWNzy8l02fto6hpbJ4pHMX6EPOp6RNHuPbxv+PE/m
 13sWqKOcHKft2noLCuSgrwLQjAHpHsfc1+5Pv/evZdnurbbkj8q8u1XNVlXGtOz15oMi
 BdIjWcY9iY27hwiUNjwyPxJ4ZC6ku6ahv/v4vqcwmpmLm2fjftIdZLR780aw2Wb5Mozd
 LUh/rpGp2XPTZoroR7LTUFYpU/2m/+XVeIJdOEqiRUDB4j/8OACDHuKAvRrPXrIFKnOO
 9ABQ==
X-Gm-Message-State: AOAM532gfCGrJvXsze1FmiMsvgrxk5dw7NjANo2nfpTEL614CPZlechA
 p9ViIrsFnAN6ig/6mtfXngV8lYTOO8JUPg==
X-Google-Smtp-Source: ABdhPJyfyRbMTEjHoiCRGxhawDTMHS9ehC5KzfIocJRopWtcPFuvAwjaWHGj8nIbGMsv3L6Mxrvogw==
X-Received: by 2002:adf:c5d1:: with SMTP id v17mr30318978wrg.571.1639393539304; 
 Mon, 13 Dec 2021 03:05:39 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id q26sm10449135wrc.39.2021.12.13.03.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 03:05:38 -0800 (PST)
Message-ID: <ee3af451-212d-fe82-d63d-e410374ae2d2@amsat.org>
Date: Mon, 13 Dec 2021 12:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 3/4] hw/display/vga-mmio: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211206224528.563588-1-f4bug@amsat.org>
 <20211206224528.563588-4-f4bug@amsat.org>
 <99ebc4fb-f061-1e57-da07-e66035bacf9b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <99ebc4fb-f061-1e57-da07-e66035bacf9b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Finn Thain <fthain@telegraphics.com.au>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 11:48, Thomas Huth wrote:
> On 06/12/2021 23.45, Philippe Mathieu-Daudé wrote:
>> Introduce TYPE_VGA_MMIO, a sysbus device.
>>
>> While there is no change in the vga_mmio_init()
>> interface, this is a migration compatibility break
>> of the MIPS Acer Pica 61 Jazz machine (pica61).
> 
> It's unfortunate, but as far as I know, it would be pretty difficult or
> even impossible to get this done without versioned machine types? So
> IMHO it's ok to break this in this case here.

Hervé and Zoltan were already Cc'ed, adding Mark and Finn;
I am not sure who else would be annoyed by that change.

>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/hw/display/vga.h |   2 +
>>   hw/display/vga-mmio.c    | 132 +++++++++++++++++++++++++++------------
>>   2 files changed, 94 insertions(+), 40 deletions(-)
>>
>> diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
>> index c16a5c26dae..98b2e560f9b 100644
>> --- a/include/hw/display/vga.h
>> +++ b/include/hw/display/vga.h
>> @@ -24,6 +24,8 @@ enum vga_retrace_method {
>>     extern enum vga_retrace_method vga_retrace_method;
>>   +#define TYPE_VGA_MMIO "vga-mmio"
>> +
>>   int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
>>                     int it_shift, MemoryRegion *address_space);
>>   diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
>> index 5671fdb920f..10bde32af5c 100644
>> --- a/hw/display/vga-mmio.c
>> +++ b/hw/display/vga-mmio.c
>> @@ -23,21 +23,34 @@
>>    */
>>     #include "qemu/osdep.h"
>> -#include "qemu/bitops.h"
>> -#include "qemu/units.h"
>> -#include "migration/vmstate.h"
>> +#include "qapi/error.h"
>>   #include "hw/display/vga.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/display/vga.h"
>> +#include "hw/qdev-properties.h"
>>   #include "vga_int.h"
>> -#include "ui/pixel_ops.h"
>>   -#define VGA_RAM_SIZE (8 * MiB)
>> +/*
>> + * QEMU interface:
>> + *  + sysbus MMIO region 0: VGA I/O registers
>> + *  + sysbus MMIO region 1: VGA MMIO registers
>> + *  + sysbus MMIO region 2: VGA memory
>> + */
>>   -typedef struct VGAMmioState {
>> +OBJECT_DECLARE_SIMPLE_TYPE(VGAMmioState, VGA_MMIO)
>> +
>> +struct VGAMmioState {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +
>> +    /*< public >*/
>>       VGACommonState vga;
>> -    int it_shift;
>> -} VGAMmioState;
>> +    MemoryRegion iomem;
>> +    MemoryRegion lowmem;
>> +
>> +    uint8_t it_shift;
>> +};
>>   -/* Memory mapped interface */
>>   static uint64_t vga_mm_read(void *opaque, hwaddr addr, unsigned size)
>>   {
>>       VGAMmioState *s = opaque;
>> @@ -65,42 +78,81 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
>>       .endianness = DEVICE_NATIVE_ENDIAN,
>>   };
>>   +static void vga_mmio_reset(DeviceState *dev)
>> +{
>> +    VGAMmioState *s = VGA_MMIO(dev);
>> +
>> +    vga_common_reset(&s->vga);
>> +}
>> +
>>   int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
>>                     int it_shift, MemoryRegion *address_space)
>>   {
>> -    VGAMmioState *s;
>> -    MemoryRegion *s_ioport_ctrl, *vga_io_memory;
>> +    DeviceState *dev;
>> +    SysBusDevice *s;
>>   -    s = g_malloc0(sizeof(*s));
>> +    dev = qdev_new(TYPE_VGA_MMIO);
>> +    qdev_prop_set_uint8(dev, "it_shift", it_shift);
>> +    s = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(s, &error_fatal);
>>   -    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
>> -    s->vga.global_vmstate = true;
>> -    vga_common_init(&s->vga, NULL);
>> -
>> -    s->it_shift = it_shift;
>> -    s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
>> -    memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
>> -                          "vga-mm-ctrl", 0x100000);
>> -    memory_region_set_flush_coalesced(s_ioport_ctrl);
>> -
>> -    vga_io_memory = g_malloc(sizeof(*vga_io_memory));
>> -    /* XXX: endianness? */
>> -    memory_region_init_io(vga_io_memory, NULL, &vga_mem_ops, &s->vga,
>> -                          "vga-mem", 0x20000);
>> -
>> -    vmstate_register(NULL, 0, &vmstate_vga_common, s);
>> -
>> -    memory_region_add_subregion(address_space, ctrl_base,
>> s_ioport_ctrl);
>> -    s->vga.bank_offset = 0;
>> -    memory_region_add_subregion(address_space,
>> -                                vram_base + 0x000a0000, vga_io_memory);
>> -    memory_region_set_coalescing(vga_io_memory);
>> -
>> -    s->vga.con = graphic_console_init(NULL, 0, s->vga.hw_ops, s);
>> -
>> -    memory_region_add_subregion(address_space,
>> -                                VBE_DISPI_LFB_PHYSICAL_ADDRESS,
>> -                                &s->vga.vram);
>> +    sysbus_mmio_map(s, 0, ctrl_base);
>> +    sysbus_mmio_map(s, 1, vram_base + 0x000a0000);
>> +    sysbus_mmio_map(s, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
>>         return 0;
>>   }
>> +
>> +static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
>> +{
>> +    VGAMmioState *s = VGA_MMIO(dev);
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> +
>> +    memory_region_init_io(&s->iomem, OBJECT(dev), &vga_mm_ctrl_ops, s,
>> +                          "vga-mmio", 0x100000);
>> +    memory_region_set_flush_coalesced(&s->iomem);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>> +
>> +    /* XXX: endianness? */
>> +    memory_region_init_io(&s->lowmem, OBJECT(dev), &vga_mem_ops,
>> &s->vga,
>> +                          "vga-lowmem", 0x20000);
>> +    memory_region_set_coalescing(&s->lowmem);
>> +    sysbus_init_mmio(sbd, &s->lowmem);
>> +
>> +    s->vga.bank_offset = 0;
>> +    s->vga.global_vmstate = true;
>> +    vga_common_init(&s->vga, OBJECT(dev));
>> +    sysbus_init_mmio(sbd, &s->vga.vram);
>> +    s->vga.con = graphic_console_init(dev, 0, s->vga.hw_ops, &s->vga);
>> +}
>> +
>> +static Property vga_mmio_properties[] = {
>> +    DEFINE_PROP_UINT8("it_shift", VGAMmioState, it_shift, 0),
>> +    DEFINE_PROP_UINT32("vgamem_mb", VGAMmioState, vga.vram_size_mb, 8),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void vga_mmio_class_initfn(ObjectClass *klass, void *data)
> 
> Just a matter of taste, but I'd prefer "oc" instead of "klass".
> 
> Anyway:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 

