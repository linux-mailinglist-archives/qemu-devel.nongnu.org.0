Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CCD5BB017
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 17:21:23 +0200 (CEST)
Received: from localhost ([::1]:58696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZD9d-0005Kx-Mz
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 11:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZD3n-0001CP-6j; Fri, 16 Sep 2022 11:15:19 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:41572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZD3k-0006Ln-W4; Fri, 16 Sep 2022 11:15:18 -0400
Received: by mail-qv1-xf32.google.com with SMTP id l14so8410399qvq.8;
 Fri, 16 Sep 2022 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rAE6w3n8pW31SAudZP+8pNRjp4Cmu2KyD3JcTFrkQMU=;
 b=kGJEngoX8q05XK3NjclSha/gw3U4J2fDoQdk/6fbEbTqbZigSXk/34Ln9G6SuRukCB
 3juUPdq4FoKwzGURnvsbPP305kdLqbRKWI/FMNL04CjSi4L+DpXkp6RsELYfuBUp7DVQ
 ESpSI8sIWWwPAI2HhijAsxnpIghsTuTM7vP/iPCMRo/TjJ6AUvZ0Zb0x6eqh2g19umOE
 j65oYOCrdMz5yhjdgWq6j5WuxgMn99dafy/OWQzb31ALahC5AmxkVp40qi7LbrQMvV8t
 /YXozzxziouKqVCl7N/tuUCRxyH8HFLfoFO0n4t4ROqSeCe2G2mmzHTcJSrOLZtVHd2N
 kA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rAE6w3n8pW31SAudZP+8pNRjp4Cmu2KyD3JcTFrkQMU=;
 b=etVqX+q9tyweICPrY36OPp6NHj3tsjLfDRAGUd7zZbGNbCjpYGvAXp0nWoCNCtqZ+u
 yPGqE+2FLxePkruMEg1PHMVK3nmvQ1YVbKRy9iarTPlvgrDo7BvV28oh8cmKfpLIQRhN
 qQPIBKRGwSX5AMN3z9APz0iityFpAGWxxXIPegyrKrtElqZ75TtEjAJzmet8ar2gjKMM
 6ZBjkWK+K75Vc6183BwK3k6gAiOKXLEgfm58u/GBF6sP8nc2w6YB8mH7jNGDjbZ5GRN/
 2Ery1LkUVeuEUEtS+FJSXeDSkZo9hVQdlp6ty+Frc0XtERYpEBu+WrB5kQsdVJSFWu8N
 G9xg==
X-Gm-Message-State: ACrzQf0ZlsdJWDlI7OFgtTvIhaSrIW+ll57KrGFZLRyCEfI2OIb3ANV7
 ySCCzMVgZgKFLd5lRXMp6j08mQSQOfOxlw5LptY=
X-Google-Smtp-Source: AMsMyM5Rh5YsgINkYMYoZZnBi+IX2qJ1HXvbqcVmZjsks46xqX1qUo8mlOutcIKi4BIMdWDGxWQfRoxVtgRgFkKTYsw=
X-Received: by 2002:a05:6214:20a8:b0:4ac:b917:ccae with SMTP id
 8-20020a05621420a800b004acb917ccaemr4170735qvd.85.1663341315139; Fri, 16 Sep
 2022 08:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-11-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-11-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 23:15:03 +0800
Message-ID: <CAEUhbmWgSLJa-zm38R_itVGHnLgt64yzTLo3G7joE41=9V2_rA@mail.gmail.com>
Subject: Re: [PATCH 10/11] hw/sd/sdhci: Implement Freescale eSDHC device model
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 15, 2022 at 11:30 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Will allow e500 boards to access SD cards using just their own devices.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/sd/sdhci.c         | 147 +++++++++++++++++++++++++++++++++++++++++-
>  include/hw/sd/sdhci.h |   3 +
>  2 files changed, 149 insertions(+), 1 deletion(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 7a5996caad..09285ccfa1 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1369,6 +1369,7 @@ void sdhci_initfn(SDHCIState *s)
>      s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
>
>      s->io_ops = &sdhci_mmio_ops;
> +    s->io_registers_map_size = SDHC_REGISTERS_MAP_SIZE;
>  }
>
>  void sdhci_uninitfn(SDHCIState *s)
> @@ -1392,7 +1393,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
>      s->fifo_buffer = g_malloc0(s->buf_maxsz);
>
>      memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
> -                          SDHC_REGISTERS_MAP_SIZE);
> +                          s->io_registers_map_size);
>  }
>
>  void sdhci_common_unrealize(SDHCIState *s)
> @@ -1575,6 +1576,149 @@ static const TypeInfo sdhci_bus_info = {
>      .class_init = sdhci_bus_class_init,
>  };
>
> +/* --- qdev Freescale eSDHC --- */
> +
> +/* Host Controller Capabilities Register 2 */
> +#define ESDHC_CAPABILITIES_1        0x114
> +
> +/* Control Register for DMA transfer */
> +#define ESDHC_DMA_SYSCTL            0x40c
> +#define ESDHC_PERIPHERAL_CLK_SEL    0x00080000
> +#define ESDHC_FLUSH_ASYNC_FIFO      0x00040000
> +#define ESDHC_DMA_SNOOP             0x00000040

It looks the above 3 bit fields are not used?

> +
> +#define ESDHC_REGISTERS_MAP_SIZE    0x410
> +
> +static uint64_t esdhci_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    uint64_t ret;
> +
> +    if (size != 4) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
> +                      " wrong size\n", size, offset);
> +        return 0;
> +    }
> +
> +    if (offset & 0x3) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
> +                      " unaligned\n", size, offset);
> +        return 0;
> +    }
> +
> +    switch (offset) {
> +    case SDHC_SYSAD:
> +    case SDHC_BLKSIZE:
> +    case SDHC_ARGUMENT:
> +    case SDHC_TRNMOD:
> +    case SDHC_RSPREG0:
> +    case SDHC_RSPREG1:
> +    case SDHC_RSPREG2:
> +    case SDHC_RSPREG3:
> +    case SDHC_BDATA:
> +    case SDHC_PRNSTS:
> +    case SDHC_HOSTCTL:
> +    case SDHC_CLKCON:
> +    case SDHC_NORINTSTS:
> +    case SDHC_NORINTSTSEN:
> +    case SDHC_NORINTSIGEN:
> +    case SDHC_ACMD12ERRSTS:
> +    case SDHC_CAPAB:
> +    case SDHC_SLOT_INT_STATUS:
> +        ret = sdhci_read(opaque, offset, size);
> +        break;
> +
> +    case ESDHC_DMA_SYSCTL:
> +    case 0x44:

Can we define a macro for this offset?

> +        ret = 0;
> +        qemu_log_mask(LOG_UNIMP, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
> +                      " not implemented\n", size, offset);
> +        break;
> +
> +    default:
> +        ret = 0;
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
> +                      " unknown offset\n", size, offset);
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void esdhci_write(void *opaque, hwaddr offset, uint64_t val,
> +                         unsigned size)
> +{
> +    if (size != 4) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
> +                      " <- 0x%08lx wrong size\n", size, offset, val);
> +        return;
> +    }
> +
> +    if (offset & 0x3) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
> +                      " <- 0x%08lx unaligned\n", size, offset, val);
> +        return;
> +    }
> +
> +    switch (offset) {
> +    case SDHC_SYSAD:
> +    case SDHC_BLKSIZE:
> +    case SDHC_ARGUMENT:
> +    case SDHC_TRNMOD:
> +    case SDHC_BDATA:
> +    case SDHC_HOSTCTL:
> +    case SDHC_CLKCON:
> +    case SDHC_NORINTSTS:
> +    case SDHC_NORINTSTSEN:
> +    case SDHC_NORINTSIGEN:
> +    case SDHC_FEAER:
> +        sdhci_write(opaque, offset, val, size);
> +        break;
> +
> +    case ESDHC_DMA_SYSCTL:
> +    case 0x44:

ditto

> +        qemu_log_mask(LOG_UNIMP, "ESDHC wr_%ub @0x%02" HWADDR_PRIx " <- 0x%08lx "
> +                      "not implemented\n", size, offset, val);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
> +                      " <- 0x%08lx unknown offset\n", size, offset, val);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps esdhc_mmio_ops = {
> +    .read = esdhci_read,
> +    .write = esdhci_write,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +        .unaligned = false
> +    },
> +    .endianness = DEVICE_BIG_ENDIAN,
> +};
> +
> +static void esdhci_init(Object *obj)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    SDHCIState *s = SYSBUS_SDHCI(obj);
> +
> +    s->io_ops = &esdhc_mmio_ops;
> +    s->io_registers_map_size = ESDHC_REGISTERS_MAP_SIZE;
> +
> +    /*
> +     * Compatible with:
> +     * - SD Host Controller Specification Version 2.0 Part A2
> +     */
> +    qdev_prop_set_uint8(dev, "sd-spec-version", 2);
> +}
> +
> +static const TypeInfo esdhc_info = {
> +    .name = TYPE_FSL_ESDHC,
> +    .parent = TYPE_SYSBUS_SDHCI,
> +    .instance_init = esdhci_init,
> +};
> +
>  /* --- qdev i.MX eSDHC --- */
>
>  #define USDHC_MIX_CTRL                  0x48
> @@ -1907,6 +2051,7 @@ static void sdhci_register_types(void)
>  {
>      type_register_static(&sdhci_sysbus_info);
>      type_register_static(&sdhci_bus_info);
> +    type_register_static(&esdhc_info);
>      type_register_static(&imx_usdhc_info);
>      type_register_static(&sdhci_s3c_info);
>  }
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 01a64c5442..5b32e83eee 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -45,6 +45,7 @@ struct SDHCIState {
>      AddressSpace *dma_as;
>      MemoryRegion *dma_mr;
>      const MemoryRegionOps *io_ops;
> +    uint64_t io_registers_map_size;
>
>      QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
>      QEMUTimer *transfer_timer;
> @@ -122,6 +123,8 @@ DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
>  DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
>                           TYPE_SYSBUS_SDHCI)
>
> +#define TYPE_FSL_ESDHC "fsl-esdhc"
> +
>  #define TYPE_IMX_USDHC "imx-usdhc"
>
>  #define TYPE_S3C_SDHCI "s3c-sdhci"
> --

Regards,
Bin

