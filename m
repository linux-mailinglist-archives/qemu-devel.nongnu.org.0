Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C1328F6F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 20:53:51 +0100 (CET)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGoc2-00055K-JI
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 14:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGoat-0004GI-S4
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:52:39 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:46641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGoaq-0001xz-K3
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:52:39 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MF3Y8-1l1TZE3xUW-00FUN9; Mon, 01 Mar 2021 20:52:29 +0100
Subject: Re: [PATCH v2 02/42] esp: rename existing ESP QOM type to SYSBUS_ESP
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <00975d17-c0ee-8a75-052c-0167cfd9aab8@vivier.eu>
Date: Mon, 1 Mar 2021 20:52:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B9h7nqy0hzdBVUP0Sbba1ij7F6SUe6N6NR8iD1jlOUXeZjA9EgZ
 krmhLXtAW2Ne5/vgrsNN9jEmZdDWBawh7z9DyI8xBKP2JoduUni1DJ0R5ya+5J6u/zQlmzI
 2qcYcABKMVInKFwcmQX+rfTTv4byBhl7KgvbaxE7uGnKEg4WZXy1obPXZeraAV69vhONIWS
 9PwB5sLcMVg5ljGaZWS6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AL28La07ZQs=:9sJlvUq5vX8Dsb3IGpFRKW
 jMn34Ee5x3i8lLIZfp7zin8d1vNws3ZgdncFfPNBrVXGdnUiUW2wBZ6ocvizMRJ0as4iCDjYg
 aNifAf9CZuxb2V3oHj2hQvIsV5NOs31lqoEf7ZPh+aB3bdJ4816330IMsNDzxq5UXX3r5PNUt
 7ChLlZNFS6EmGEQ6f5SPuuJc4rzNULUZhao3ciViXlY8gb5cd2h3MheV6DoCYcmwi3kn1EE2X
 2mtwQfwxUiss/xH1cT2JiYk3rzR/FWcI6R2P+TVNhCy51GZvuoLcBQ/EHcNbSJCdguCpSrRMo
 Fd2JhSXbrhWw4tehgIv2/5tp5iV3WSlkrF6rWYWyiha6Kuws94iqMhDFETfCGn8a8p2qwDaqI
 PMnqaiBhEIyi+eyVws6EqNFHeEmnv35g0rZDSZSLiBaQgze222g460A2pmRdF8akRJXkKrNli
 CTx/anQ1jw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
> The existing ESP QOM type currently represents a sysbus device with an embedded
> ESP state. Rename the type to SYSBUS_ESP accordingly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/dma/sparc32_dma.c  | 4 ++--
>  hw/m68k/q800.c        | 4 ++--
>  hw/mips/jazz.c        | 4 ++--
>  hw/scsi/esp.c         | 8 ++++----
>  hw/sparc/sun4m.c      | 2 +-
>  include/hw/scsi/esp.h | 4 ++--
>  6 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
> index b643b413c5..03bc500878 100644
> --- a/hw/dma/sparc32_dma.c
> +++ b/hw/dma/sparc32_dma.c
> @@ -295,13 +295,13 @@ static void sparc32_espdma_device_init(Object *obj)
>      memory_region_init_io(&s->iomem, OBJECT(s), &dma_mem_ops, s,
>                            "espdma-mmio", DMA_SIZE);
>  
> -    object_initialize_child(obj, "esp", &es->esp, TYPE_ESP);
> +    object_initialize_child(obj, "esp", &es->esp, TYPE_SYSBUS_ESP);
>  }
>  
>  static void sparc32_espdma_device_realize(DeviceState *dev, Error **errp)
>  {
>      ESPDMADeviceState *es = SPARC32_ESPDMA_DEVICE(dev);
> -    SysBusESPState *sysbus = ESP(&es->esp);
> +    SysBusESPState *sysbus = SYSBUS_ESP(&es->esp);
>      ESPState *esp = &sysbus->esp;
>  
>      esp->dma_memory_read = espdma_memory_read;
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 2af0e2532e..af54d509ff 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -356,8 +356,8 @@ static void q800_init(MachineState *machine)
>  
>      /* SCSI */
>  
> -    dev = qdev_new(TYPE_ESP);
> -    sysbus_esp = ESP(dev);
> +    dev = qdev_new(TYPE_SYSBUS_ESP);
> +    sysbus_esp = SYSBUS_ESP(dev);
>      esp = &sysbus_esp->esp;
>      esp->dma_memory_read = NULL;
>      esp->dma_memory_write = NULL;
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 83c8086062..1a0888a0fd 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -328,8 +328,8 @@ static void mips_jazz_init(MachineState *machine,
>      }
>  
>      /* SCSI adapter */
> -    dev = qdev_new(TYPE_ESP);
> -    sysbus_esp = ESP(dev);
> +    dev = qdev_new(TYPE_SYSBUS_ESP);
> +    sysbus_esp = SYSBUS_ESP(dev);
>      esp = &sysbus_esp->esp;
>      esp->dma_memory_read = rc4030_dma_read;
>      esp->dma_memory_write = rc4030_dma_write;
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 7073166ad1..aa38acc660 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -939,7 +939,7 @@ static const struct SCSIBusInfo esp_scsi_info = {
>  
>  static void sysbus_esp_gpio_demux(void *opaque, int irq, int level)
>  {
> -    SysBusESPState *sysbus = ESP(opaque);
> +    SysBusESPState *sysbus = SYSBUS_ESP(opaque);
>      ESPState *s = &sysbus->esp;
>  
>      switch (irq) {
> @@ -955,7 +955,7 @@ static void sysbus_esp_gpio_demux(void *opaque, int irq, int level)
>  static void sysbus_esp_realize(DeviceState *dev, Error **errp)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> -    SysBusESPState *sysbus = ESP(dev);
> +    SysBusESPState *sysbus = SYSBUS_ESP(dev);
>      ESPState *s = &sysbus->esp;
>  
>      sysbus_init_irq(sbd, &s->irq);
> @@ -977,7 +977,7 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
>  
>  static void sysbus_esp_hard_reset(DeviceState *dev)
>  {
> -    SysBusESPState *sysbus = ESP(dev);
> +    SysBusESPState *sysbus = SYSBUS_ESP(dev);
>      esp_hard_reset(&sysbus->esp);
>  }
>  
> @@ -1002,7 +1002,7 @@ static void sysbus_esp_class_init(ObjectClass *klass, void *data)
>  }
>  
>  static const TypeInfo sysbus_esp_info = {
> -    .name          = TYPE_ESP,
> +    .name          = TYPE_SYSBUS_ESP,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(SysBusESPState),
>      .class_init    = sysbus_esp_class_init,
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 38ca1e33c7..312e2afaf9 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -334,7 +334,7 @@ static void *sparc32_dma_init(hwaddr dma_base,
>                                     OBJECT(dma), "espdma"));
>      sysbus_connect_irq(SYS_BUS_DEVICE(espdma), 0, espdma_irq);
>  
> -    esp = ESP(object_resolve_path_component(OBJECT(espdma), "esp"));
> +    esp = SYSBUS_ESP(object_resolve_path_component(OBJECT(espdma), "esp"));
>  
>      ledma = SPARC32_LEDMA_DEVICE(object_resolve_path_component(
>                                   OBJECT(dma), "ledma"));
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index 60cc3047a5..9694825e71 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -65,8 +65,8 @@ struct ESPState {
>      void (*pdma_cb)(ESPState *s);
>  };
>  
> -#define TYPE_ESP "esp"
> -OBJECT_DECLARE_SIMPLE_TYPE(SysBusESPState, ESP)
> +#define TYPE_SYSBUS_ESP "sysbus-esp"
> +OBJECT_DECLARE_SIMPLE_TYPE(SysBusESPState, SYSBUS_ESP)
>  
>  struct SysBusESPState {
>      /*< private >*/
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

