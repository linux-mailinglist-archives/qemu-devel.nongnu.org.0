Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B077E44058E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 00:38:18 +0200 (CEST)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgaVt-0006kY-Qz
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 18:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgaUS-000622-Vd
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:36:48 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgaUQ-000537-8j
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:36:47 -0400
Received: by mail-wr1-x431.google.com with SMTP id d27so1004008wrb.6
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 15:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LMLJyKR9SMRHxVp7Lwwc6bfqC4UPIU16ERd2ewx/iuE=;
 b=SzEORW7wjGHfIfRKhvgtaTzZqJhSeR3bSGKcSxfpj8gPibJAkJ77pJCLQ1neqkmLEf
 K5YAzJ5iq3Em/v43tX9I/q+Yo7S9E/s3q9XhE96YLQY54NwMPvo19xcpLbtpnReWoD1a
 gaqowd5mdANQ6TBThK2OBSTfOrxGas0x10qE404TDK6zbJOZHV+mYXAx/e4kfJhc6sEi
 4/s7hYTTjQkRIpXRa0iarR2q8Ov/kG87t2vgLS7OzIOzRSb9a0lASIFWTV8lTIW2NE/F
 S1HrjTeBtA/uF8rcsFOhGH4hjhXsaRdgwXIOFEvfzN2kxS///eZ+Dd8lCO/v/oUzU6G5
 AaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LMLJyKR9SMRHxVp7Lwwc6bfqC4UPIU16ERd2ewx/iuE=;
 b=fPd5OHC/NXqsRjbgkPX708kOK5VsZb5xgkJniP6UgKGrHl7kOGNjR9CXXbLd6Dvgc2
 GiDFUgQvn5VyinkTm6+sJRc5dlR2NP9AtmXm2V1jp/aQk4gdUMCge9iFj5k7G4xteUZT
 D3kqqTIZY/IrvIzTATW/HvdTyOWO50tspORvHjkADp9LzjyWgThIcJl8atUJNGw39QQ4
 b2cLJi17XhWDOMfjfa/fcerROtSvaFUmXlR3YVyXwXmwOqdCbR0OBpE6teRfghM1gsNZ
 08ci0IrCGpszUrsTMq16cxLQ7orv0VtK7MydMV1RU95yAwoRHYMa6NhN4inqVZ8CaMaJ
 Da7Q==
X-Gm-Message-State: AOAM531fgd/EhEY98qdbzVfqQ0l+TeRW2pXK10KYvMcZeykQApxhkM86
 SvuKNZDXFqv3nWZKLBg4Xcg=
X-Google-Smtp-Source: ABdhPJz5IIXyU1jfdtqv6EwgYABGCsR3dmdJCIuwk6PVujxmd2K2dNaFG4MBB8c65hCZMY0HrjCe2w==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr14738948wmc.117.1635547004300; 
 Fri, 29 Oct 2021 15:36:44 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k22sm6935984wrd.59.2021.10.29.15.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 15:36:43 -0700 (PDT)
Message-ID: <ffe5a75a-5f65-473f-9e0d-43d238819d6a@amsat.org>
Date: Sat, 30 Oct 2021 00:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 13/30] hw/char/sh_serial: QOM-ify
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <92902ba34fdf2c8c62232365fbb6531b1036d557.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <92902ba34fdf2c8c62232365fbb6531b1036d557.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 23:02, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/char/sh_serial.c | 98 +++++++++++++++++++++++++++------------------
>  hw/sh4/sh7750.c     | 56 +++++++++++++++++++-------
>  include/hw/sh4/sh.h |  9 +----
>  3 files changed, 101 insertions(+), 62 deletions(-)

> -void sh_serial_init(MemoryRegion *sysmem,
> -                    hwaddr base, int feat,
> -                    uint32_t freq, Chardev *chr,
> -                    qemu_irq eri_source,
> -                    qemu_irq rxi_source,
> -                    qemu_irq txi_source,
> -                    qemu_irq tei_source,
> -                    qemu_irq bri_source)
> +static void sh_serial_realize(DeviceState *d, Error **errp)
>  {
> -    SHSerialState *s = g_malloc0(sizeof(*s));
> -
> -    s->feat = feat;
> -    sh_serial_reset(s);
> -
> -    memory_region_init_io(&s->iomem, NULL, &sh_serial_ops, s,
> -                          "serial", 0x100000000ULL);
> -
> -    memory_region_init_alias(&s->iomem_p4, NULL, "serial-p4", &s->iomem,
> -                             0, 0x28);
> -    memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
> -
> -    memory_region_init_alias(&s->iomem_a7, NULL, "serial-a7", &s->iomem,
> -                             0, 0x28);
> -    memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
> -
> -    if (chr) {
> -        qemu_chr_fe_init(&s->chr, chr, &error_abort);
> +    SHSerialState *s = SH_SERIAL(d);
> +    MemoryRegion *iomem = g_malloc(sizeof(*iomem));
> +
> +    assert(d->id);

DeviceRealize() takes a Error* parameter... But well since this is
not user_creatable I suppose it is understandable enough.

> +    memory_region_init_io(iomem, OBJECT(d), &sh_serial_ops, s, d->id, 0x28);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(d), iomem);
> +    qdev_init_gpio_out_named(d, &s->eri, "eri", 1);
> +    qdev_init_gpio_out_named(d, &s->rxi, "rxi", 1);
> +    qdev_init_gpio_out_named(d, &s->txi, "txi", 1);
> +    qdev_init_gpio_out_named(d, &s->tei, "tei", 1);
> +    qdev_init_gpio_out_named(d, &s->bri, "bri", 1);
> +
> +    if (qemu_chr_fe_backend_connected(&s->chr)) {
>          qemu_chr_fe_set_handlers(&s->chr, sh_serial_can_receive1,
>                                   sh_serial_receive1,
>                                   sh_serial_event, NULL, s, NULL, true);
> @@ -435,9 +432,32 @@ void sh_serial_init(MemoryRegion *sysmem,
>      timer_init_ns(&s->fifo_timeout_timer, QEMU_CLOCK_VIRTUAL,
>                    sh_serial_timeout_int, s);
>      s->etu = NANOSECONDS_PER_SECOND / 9600;
> -    s->eri = eri_source;
> -    s->rxi = rxi_source;
> -    s->txi = txi_source;
> -    s->tei = tei_source;
> -    s->bri = bri_source;
> +}
> +
> +static void sh_serial_finalize(Object *obj)
> +{
> +    SHSerialState *s = SH_SERIAL(obj);
> +
> +    timer_del(&s->fifo_timeout_timer);
> +}
> +
> +static void sh_serial_init(Object *obj)
> +{
> +}
> +
> +static Property sh_serial_properties[] = {
> +    DEFINE_PROP_CHR("chardev", SHSerialState, chr),
> +    DEFINE_PROP_UINT8("features", SHSerialState, feat, 0),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static void sh_serial_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    device_class_set_props(dc, sh_serial_properties);
> +    dc->realize = sh_serial_realize;
> +    dc->reset = sh_serial_reset;
> +    /* Reason: part of SuperH CPU/SoC, needs to be wired up */
> +    dc->user_creatable = false;
>  }
> diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
> index 6c702d627c..7b21f1ce44 100644
> --- a/hw/sh4/sh7750.c
> +++ b/hw/sh4/sh7750.c
> @@ -24,9 +24,13 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/sysbus.h"
>  #include "hw/irq.h"
>  #include "hw/sh4/sh.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
>  #include "sh7750_regs.h"
>  #include "sh7750_regnames.h"
>  #include "hw/sh4/sh_intc.h"
> @@ -762,6 +766,9 @@ static const MemoryRegionOps sh7750_mmct_ops = {
>  SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
>  {
>      SH7750State *s;
> +    DeviceState *dev;
> +    SysBusDevice *sb;
> +    MemoryRegion *mr, *alias;
>  
>      s = g_malloc0(sizeof(SH7750State));
>      s->cpu = cpu;
> @@ -807,21 +814,40 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
>  
>      cpu->env.intc_handle = &s->intc;
>  
> -    sh_serial_init(sysmem, 0x1fe00000,
> -                   0, s->periph_freq, serial_hd(0),
> -                   s->intc.irqs[SCI1_ERI],
> -                   s->intc.irqs[SCI1_RXI],
> -                   s->intc.irqs[SCI1_TXI],
> -                   s->intc.irqs[SCI1_TEI],
> -                   NULL);
> -    sh_serial_init(sysmem, 0x1fe80000,
> -                   SH_SERIAL_FEAT_SCIF,
> -                   s->periph_freq, serial_hd(1),
> -                   s->intc.irqs[SCIF_ERI],
> -                   s->intc.irqs[SCIF_RXI],
> -                   s->intc.irqs[SCIF_TXI],
> -                   NULL,
> -                   s->intc.irqs[SCIF_BRI]);
> +    /* SCI */
> +    dev = qdev_new(TYPE_SH_SERIAL);
> +    dev->id = (char *)"sci";

No, this is g_strdup() (freed in device_finalize()).

> +    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
> +    sb = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(sb, &error_fatal);
> +    sysbus_mmio_map(sb, 0, 0xffe00000);
> +    alias = g_malloc(sizeof(*alias));
> +    mr = sysbus_mmio_get_region(sb, 0);
> +    memory_region_init_alias(alias, OBJECT(dev), "sci-a7", mr,
> +                             0, memory_region_size(mr));
> +    memory_region_add_subregion(sysmem, A7ADDR(0xffe00000), alias);
> +    qdev_connect_gpio_out_named(dev, "eri", 0, s->intc.irqs[SCI1_ERI]);
> +    qdev_connect_gpio_out_named(dev, "rxi", 0, s->intc.irqs[SCI1_RXI]);
> +    qdev_connect_gpio_out_named(dev, "txi", 0, s->intc.irqs[SCI1_TXI]);
> +    qdev_connect_gpio_out_named(dev, "tei", 0, s->intc.irqs[SCI1_TEI]);
> +
> +    /* SCIF */
> +    dev = qdev_new(TYPE_SH_SERIAL);
> +    dev->id =  (char *)"scif";

g_strdup()

If you agree I can fix when applying.

