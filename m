Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F4A43F762
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 08:41:49 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgLaG-0003pH-GS
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 02:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgL13-0005dd-Is
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:05:25 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgL0x-0007ns-VV
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:05:23 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 207-20020a1c04d8000000b0033123de3425so1180915wme.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 23:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rct1UurwpIM5ZWS7MMXBBRXlrLUoj2PHwtsAXxM+f1A=;
 b=lgDx5bchb/TeuHt/8URa3nxBPCvaNk4RihtajP+hksvEvtzdvOESW+ZO9h1I1Yhx1p
 lBKDSEr32gO3FQq+mKwg7fF1rDg/5wt858p8PhjbM9cpE5iTXtwED4aaFCMm4FpennAJ
 WVIXapt+tpNPVsZT/t/+loxpezBb7TGo0OIpNastOtKir4ediV7f3H3TDtfE+iJr3lC/
 B3Vik3bn4g/4Wz6uyvKCQZ5YTu8nVztuqnaT2zYccdAOX3TUJWwzPkm4uedpLKU+xZjP
 xXWpg1joLWppxE9JxeCnj20PRr6REp0gTrElu7wpF3m5jL62W9/FwOm3n7oGR3C1X4XG
 hvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rct1UurwpIM5ZWS7MMXBBRXlrLUoj2PHwtsAXxM+f1A=;
 b=hqdYRlbLQ3U24VvFGDQUOH69+dphLFoKM8sDgVsiLMR5NemHMBiXd8/mh3psKOxNoj
 gfLLLDBsN95JpFEMc2S8eBPMMtvXkHeVNe+t2Vs21vjS5mborMTHRaYC8CDFnN6w4EUV
 rhlc9t5QHAknmaFumEg+e0dmfE59ttzghn+PbK02pkbVGnRBkHZrLafT0ko5j3wix0ma
 7m3rwdmRYf1WAxLT3EpHuvYkpaYKUPA9svLd5uCx9gulwohlI9sCNbLUyXhS6krOOwiW
 vKTiATfQDgWzjfcdlF1FmWCZFjsNRu5MZ1haAmVKXxeQ5CnFsQjsnEVivZgXfAbrImcj
 LtwA==
X-Gm-Message-State: AOAM531ooEHoQRFQXo1kcGjzA+pQh3odfhvLLAEhJF3cAdhctOZoOCMB
 7A8fwaeyOKD25iKp8/uXbRI=
X-Google-Smtp-Source: ABdhPJyCuIMfK+8No+FVMtqnQ92maFoH8uttd8ixp77JyNcaDG32aNXkNXxNYJEy89C5y/wDAaKmeA==
X-Received: by 2002:a1c:1b41:: with SMTP id b62mr1540979wmb.93.1635487518342; 
 Thu, 28 Oct 2021 23:05:18 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t12sm4456853wmq.44.2021.10.28.23.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 23:05:17 -0700 (PDT)
Message-ID: <3a630845-7f67-7b45-db14-c72dc67c5b26@amsat.org>
Date: Fri, 29 Oct 2021 08:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 06/23] hw/char/sh_serial: QOM-ify
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <3208b60a33e3452b832089aecd5c1aed800eb6bc.1635449225.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <3208b60a33e3452b832089aecd5c1aed800eb6bc.1635449225.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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

On 10/28/21 21:27, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/char/sh_serial.c | 107 +++++++++++++++++++++++++++-----------------
>  hw/sh4/sh7750.c     |  62 ++++++++++++++++++-------
>  include/hw/sh4/sh.h |   9 +---
>  3 files changed, 114 insertions(+), 64 deletions(-)

> +OBJECT_DECLARE_SIMPLE_TYPE(SHSerialState, SH_SERIAL)
> +
> +struct SHSerialState {
> +    SysBusDevice parent;
[...]
> -} SHSerialState;
> +};
> +
> +typedef struct {} SHSerialStateClass;

OBJECT_DECLARE_TYPE()?

> -void sh_serial_init(MemoryRegion *sysmem,
> -                    hwaddr base, int feat,
> -                    uint32_t freq, Chardev *chr,
> -                    qemu_irq eri_source,
> -                    qemu_irq rxi_source,
> -                    qemu_irq txi_source,
> -                    qemu_irq tei_source,
> -                    qemu_irq bri_source)
> +static void sh_serial_reset(DeviceState *dev)

Can you extract sh_serial_reset() in a previous patch?

>  {
> -    SHSerialState *s = g_malloc0(sizeof(*s));
> +    SHSerialState *s = SH_SERIAL(dev);
>  
> -    s->feat = feat;
>      s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
>      s->rtrg = 1;
>  
> @@ -397,38 +396,64 @@ void sh_serial_init(MemoryRegion *sysmem,
>      s->scr = 1 << 5; /* pretend that TX is enabled so early printk works */
>      s->sptr = 0;
>  
> -    if (feat & SH_SERIAL_FEAT_SCIF) {
> +    if (s->feat & SH_SERIAL_FEAT_SCIF) {
>          s->fcr = 0;
>      } else {
>          s->dr = 0xff;
>      }
>  
>      sh_serial_clear_fifo(s);
> +}
>  
> -    memory_region_init_io(&s->iomem, NULL, &sh_serial_ops, s,
> -                          "serial", 0x100000000ULL);

Keep that, ...

> -    memory_region_init_alias(&s->iomem_p4, NULL, "serial-p4", &s->iomem,
> -                             0, 0x28);
> -    memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
> -
> -    memory_region_init_alias(&s->iomem_a7, NULL, "serial-a7", &s->iomem,
> -                             0, 0x28);
> -    memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);

... and these lines become one single sysbus_init_mmio() ...

> -
> -    if (chr) {
> -        qemu_chr_fe_init(&s->chr, chr, &error_abort);
> +static void sh_serial_realize(DeviceState *d, Error **errp)
> +{
> +    SHSerialState *s = SH_SERIAL(d);
> +    MemoryRegion *iomem = g_malloc(sizeof(*iomem));
> +
> +    assert(d->id);
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
>      }
>  
> -    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> -                                         sh_serial_timeout_int, s);
> +    timer_init_ns(&s->fifo_timeout_timer, QEMU_CLOCK_VIRTUAL,
> +                  sh_serial_timeout_int, s);
>      s->etu = NANOSECONDS_PER_SECOND / 9600;
> -    s->eri = eri_source;
> -    s->rxi = rxi_source;
> -    s->txi = txi_source;
> -    s->tei = tei_source;
> -    s->bri = bri_source;
> +}

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
> @@ -807,21 +814,46 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
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
> +    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
> +    sb = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(sb, &error_fatal);
> +    mr = sysbus_mmio_get_region(sb, 0);
> +    alias = g_malloc(sizeof(*alias));
> +    memory_region_init_alias(alias, OBJECT(dev), "sci-p4", mr,
> +                             0, memory_region_size(mr));
> +    memory_region_add_subregion(sysmem, P4ADDR(0x1fe00000), alias);
> +    alias = g_malloc(sizeof(*alias));
> +    memory_region_init_alias(alias, OBJECT(dev), "sci-a7", mr,
> +                             0, memory_region_size(mr));
> +    memory_region_add_subregion(sysmem, A7ADDR(0x1fe00000), alias);

... then you can replace the aliases by 2 sysbus_mmio_map() calls.

> +    qdev_connect_gpio_out_named(dev, "eri", 0, s->intc.irqs[SCI1_ERI]);
> +    qdev_connect_gpio_out_named(dev, "rxi", 0, s->intc.irqs[SCI1_RXI]);
> +    qdev_connect_gpio_out_named(dev, "txi", 0, s->intc.irqs[SCI1_TXI]);
> +    qdev_connect_gpio_out_named(dev, "tei", 0, s->intc.irqs[SCI1_TEI]);
> +
> +    /* SCIF */
> +    dev = qdev_new(TYPE_SH_SERIAL);
> +    dev->id =  (char *)"scif";
> +    qdev_prop_set_chr(dev, "chardev", serial_hd(1));
> +    qdev_prop_set_uint8(dev, "features", SH_SERIAL_FEAT_SCIF);
> +    sb = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(sb, &error_fatal);
> +    mr = sysbus_mmio_get_region(sb, 0);
> +    alias = g_malloc(sizeof(*alias));
> +    memory_region_init_alias(alias, OBJECT(dev), "scif-p4", mr,
> +                             0, memory_region_size(mr));
> +    memory_region_add_subregion(sysmem, P4ADDR(0x1fe80000), alias);
> +    alias = g_malloc(sizeof(*alias));
> +    memory_region_init_alias(alias, OBJECT(dev), "scif-a7", mr,
> +                             0, memory_region_size(mr));
> +    memory_region_add_subregion(sysmem, A7ADDR(0x1fe80000), alias);
> +    qdev_connect_gpio_out_named(dev, "eri", 0, s->intc.irqs[SCIF_ERI]);
> +    qdev_connect_gpio_out_named(dev, "rxi", 0, s->intc.irqs[SCIF_RXI]);
> +    qdev_connect_gpio_out_named(dev, "txi", 0, s->intc.irqs[SCIF_TXI]);
> +    qdev_connect_gpio_out_named(dev, "bri", 0, s->intc.irqs[SCIF_BRI]);
>  

