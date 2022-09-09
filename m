Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903035B405D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 22:12:24 +0200 (CEST)
Received: from localhost ([::1]:34264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWkMQ-0006Dq-8r
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 16:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oWkKi-0004X9-Sv; Fri, 09 Sep 2022 16:10:36 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oWkKf-0005sY-VO; Fri, 09 Sep 2022 16:10:36 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 432D35C0167;
 Fri,  9 Sep 2022 16:10:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 09 Sep 2022 16:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1662754232; x=
 1662840632; bh=9PDpPZTqFshPHB1UqU3r8jfBpHe+n8gy/8zU6+toGrY=; b=V
 f2W9cO+CU7l51DSy1cPCkX8BiGVxaBex5WkyvV9tCeENFubQFpbSdwpg9VBRXjKL
 rRCtlnsQWfXMpcZz2Ym4oX3SD9kDf+a9V6HIzMC+Mtsn4B/DcQC3ipH29CqFiSnv
 Et9MicbVJYazJfoQoWnev3E0099TXenYdXxDAL7zEaBPDqER9Y2LQNiPg2W//DUf
 ec+pRMNT667eiE5t0e9naSEmM0cJMAB2PBcaTzdJ6BXOX886IDs84jt/CbTdLUtz
 T5pTKP4Z+fLYDQvjBsOYWWcCzoCenDcrNADsPMqHqAy6twIR3w0nZ/kAZneCg/U0
 dXbwtHHAX9BpUO15jNA3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662754232; x=
 1662840632; bh=9PDpPZTqFshPHB1UqU3r8jfBpHe+n8gy/8zU6+toGrY=; b=R
 AglTD6STBiBiT3aHjbCgmZsJwvIUBteDU2uxfWmo8v2UgFn9aSmhDt/hJZGR5/Kp
 bZikjWuRNFHQj/9nbje76iviVD/KROfVbDSlbI9sLdZNKdfeQ2Qt/jaeaJReEPWs
 zN+0++lRvF4o7bWdzRhZQvVmVmLac26nXWmfx+0VDgt+lmjMTHwgrXUM6geC/EIZ
 oq3iffJmE2MvP6Th1ltVt/HmmGRaG7Lqw/baBY/z3pxIr00P47Z8b14Jqf//Pc7B
 wJYw7HvpjYNUgAm/MBRbvC75ZNdB25OcIK/D7B17WAB7r+xc+AIGveyFogfT0ov/
 9qtiQr4GXEVwUWeQpznYw==
X-ME-Sender: <xms:t50bY4Lxcz9dbPp09oVS-ca23X3vTGC2edx4vDKiMrEKkH6bdJnyIg>
 <xme:t50bY4K8JtduRt0R4AezJmR6BiwE1mms19l7CjdTNPV9ij1xlWU5_IPC5IIRsMyic
 J7QvgOs4NDZzswZ6jM>
X-ME-Received: <xmr:t50bY4tnE-TyFBQr0KCtc810Vv7KnfdPlmHRPGmyuKpd7dTsbAYwFy4MnAehEwPY8ytibBBtrcox>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgudeglecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekrodttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepffeiuddthfeifedtleektedvtdellefgffeujeehjeejiefhffduveeg
 leeiledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:uJ0bY1ZkUc71mgLwI7HhoP5UQMJYUg4RMBZWGF_9gUlwrSqmPU_OlQ>
 <xmx:uJ0bY_bAWEg5Y-bHKyt8pHso9trAlgVuqYR2_bFybs5dSoYdaATFlw>
 <xmx:uJ0bYxDJ1UJmXQjP1QrU6SmnzBDQbXgOMXhY4ApBYYtRGh8LZpRlWw>
 <xmx:uJ0bY0O7qN6RJ6vulPFpTrOvFaDYh0HSMZGR7yH41cEIoiAzb0U3lA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 16:10:31 -0400 (EDT)
Date: Fri, 9 Sep 2022 13:10:29 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Titus Rwantare <titusr@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz,
 iwona.winiarska@intel.com, tmaimon77@gmail.com,
 quic_jaehyoo@quicinc.com, Patrick Venture <venture@google.com>
Subject: Re: [RFC PATCH 2/3] hw/peci: add PECI support for NPCM7xx BMCs
Message-ID: <YxudtdPtwPIurlZD@pdel-fedora-MJ0HJWH9>
References: <20220906220552.1243998-1-titusr@google.com>
 <20220906220552.1243998-3-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906220552.1243998-3-titusr@google.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 06, 2022 at 10:05:51PM +0000, Titus Rwantare wrote:
> This allows BMC firmware for npcm7xx BMCs to talk to a PECI client
> in qemu.
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>

Looks good to me!

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> ---
>  MAINTAINERS                    |   3 +-
>  hw/arm/Kconfig                 |   1 +
>  hw/arm/npcm7xx.c               |   9 ++
>  hw/peci/meson.build            |   1 +
>  hw/peci/npcm7xx_peci.c         | 204 +++++++++++++++++++++++++++++++++
>  hw/peci/trace-events           |   5 +
>  include/hw/arm/npcm7xx.h       |   2 +
>  include/hw/peci/npcm7xx_peci.h |  37 ++++++
>  8 files changed, 261 insertions(+), 1 deletion(-)
>  create mode 100644 hw/peci/npcm7xx_peci.c
>  create mode 100644 include/hw/peci/npcm7xx_peci.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 14ab29679d..f87dfe5bfa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2959,7 +2959,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
>  R: Bandan Das <bsd@redhat.com>
>  R: Stefan Hajnoczi <stefanha@redhat.com>
>  R: Thomas Huth <thuth@redhat.com>
> -R: Darren Kenny <darren.kenny@oracle.com> 
> +R: Darren Kenny <darren.kenny@oracle.com>
>  R: Qiuhao Li <Qiuhao.Li@outlook.com>
>  S: Maintained
>  F: tests/qtest/fuzz/
> @@ -3218,6 +3218,7 @@ S: Maintained
>  F: hw/peci/peci-core.c
>  F: hw/peci/peci-client.c
>  F: include/hw/peci/peci.h
> +F: hw/peci/npcm7xx_peci.c
>  
>  Firmware schema specifications
>  M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 15fa79afd3..cb38c6c88f 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -408,6 +408,7 @@ config NPCM7XX
>      select SSI
>      select UNIMP
>      select PCA954X
> +    select PECI
>  
>  config FSL_IMX25
>      bool
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index d85cc02765..d408dd7eb4 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -45,6 +45,7 @@
>  #define NPCM7XX_CLK_BA          (0xf0801000)
>  #define NPCM7XX_MC_BA           (0xf0824000)
>  #define NPCM7XX_RNG_BA          (0xf000b000)
> +#define NPCM7XX_PECI_BA         (0xf0100000)
>  
>  /* USB Host modules */
>  #define NPCM7XX_EHCI_BA         (0xf0806000)
> @@ -83,6 +84,7 @@ enum NPCM7xxInterrupt {
>      NPCM7XX_UART1_IRQ,
>      NPCM7XX_UART2_IRQ,
>      NPCM7XX_UART3_IRQ,
> +    NPCM7XX_PECI_IRQ            = 6,
>      NPCM7XX_EMC1RX_IRQ          = 15,
>      NPCM7XX_EMC1TX_IRQ,
>      NPCM7XX_MMC_IRQ             = 26,
> @@ -445,6 +447,7 @@ static void npcm7xx_init(Object *obj)
>      }
>  
>      object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
> +    object_initialize_child(obj, "peci", &s->peci, TYPE_NPCM7XX_PECI);
>  }
>  
>  static void npcm7xx_realize(DeviceState *dev, Error **errp)
> @@ -715,6 +718,12 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc), 0,
>              npcm7xx_irq(s, NPCM7XX_MMC_IRQ));
>  
> +     /* PECI */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->peci), &error_abort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->peci), 0, NPCM7XX_PECI_BA);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peci), 0,
> +                       npcm7xx_irq(s, NPCM7XX_PECI_IRQ));
> +
>      create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
>      create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
>      create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
> diff --git a/hw/peci/meson.build b/hw/peci/meson.build
> index 01cfa95abe..ee033eb915 100644
> --- a/hw/peci/meson.build
> +++ b/hw/peci/meson.build
> @@ -1 +1,2 @@
>  softmmu_ss.add(when: 'CONFIG_PECI', if_true: files('peci-core.c', 'peci-client.c'))
> +softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_peci.c'))
> diff --git a/hw/peci/npcm7xx_peci.c b/hw/peci/npcm7xx_peci.c
> new file mode 100644
> index 0000000000..17a2642898
> --- /dev/null
> +++ b/hw/peci/npcm7xx_peci.c
> @@ -0,0 +1,204 @@
> +/*
> + * Nuvoton NPCM7xx PECI Module
> + *
> + * Copyright 2021 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/peci/npcm7xx_peci.h"
> +#include "qemu/bitops.h"
> +#include "qemu/log.h"
> +#include "qemu/units.h"
> +#include "trace.h"
> +
> +#define PECI_CTL_STS            0
> +#define     PECI_CTL_STS_DONE_EN      BIT(6)
> +#define     PECI_CTL_STS_ABRT_ERR     BIT(4)
> +#define     PECI_CTL_STS_CRC_ERR      BIT(3)
> +#define     PECI_CTL_STS_DONE         BIT(1)
> +#define     PECI_CTL_STS_START_BUSY   BIT(0)
> +#define PECI_RD_LENGTH          0x4
> +#define PECI_ADDR               0x8
> +#define PECI_CMD                0xC
> +#define PECI_CTL2               0x10
> +#define PECI_WR_LENGTH          0x1C
> +#define PECI_PDDR               0x2C
> +#define PECI_DAT_INOUT(reg)    (0x100 + (reg) * 4)
> +
> +static uint64_t npcm7xx_peci_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    NPCM7xxPECIState *ps = NPCM7XX_PECI(opaque);
> +    uint8_t ret = 0;
> +
> +    if (!ps->bus->num_clients) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: no peci clients added to board\n",
> +                      __func__);
> +        return 0;
> +    }
> +
> +    qemu_irq_lower(ps->irq);
> +
> +    switch (offset) {
> +    case PECI_CTL_STS:
> +        ret = ps->status;
> +        break;
> +
> +    case PECI_RD_LENGTH:
> +        ret = ps->pcmd.rd_length;
> +        break;
> +
> +    case PECI_ADDR:
> +        ret = ps->pcmd.addr;
> +        break;
> +
> +    case PECI_CMD:
> +        ret = ps->pcmd.cmd;
> +        break;
> +
> +    case PECI_CTL2:
> +        ret = ps->ctl2;
> +        break;
> +
> +    case PECI_WR_LENGTH:
> +        ret = ps->pcmd.wr_length;
> +        break;
> +
> +    case PECI_PDDR:
> +        qemu_log_mask(LOG_UNIMP, "%s: PECI PDDR is unimplemented.\n", __func__);
> +        ret = ps->pddr;  /* undoc register */
> +        break;
> +
> +    case PECI_DAT_INOUT(0) ... PECI_DAT_INOUT(63):
> +        ret = ps->pcmd.tx[(offset - PECI_DAT_INOUT(0)) / 4];
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: unknown register 0x%lx\n",
> +                      __func__, offset);
> +        ret = 0xff;
> +        break;
> +    }
> +    trace_npcm7xx_peci_read(offset, ret);
> +    return ret;
> +}
> +
> +static void npcm7xx_peci_write(void *opaque, hwaddr offset, uint64_t input,
> +                               unsigned size)
> +{
> +    NPCM7xxPECIState *ps = NPCM7XX_PECI(opaque);
> +    uint8_t data = input & 0xff;
> +
> +    trace_npcm7xx_peci_write(offset, input);
> +
> +    /* ignore writes if the bus has not been populated */
> +    if (!ps->bus->num_clients) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: no peci clients added to board\n",
> +                      __func__);
> +        return;
> +    }
> +
> +    switch (offset) {
> +    case PECI_CTL_STS:
> +        ps->status = data;
> +        /* STS_START busy is set by the bmc when the request is written */
> +        if (data & PECI_CTL_STS_START_BUSY) {
> +            if (!peci_handle_cmd(ps->bus, &(ps->pcmd))) {
> +                ps->status |= PECI_CTL_STS_ABRT_ERR;
> +            }
> +            ps->status |= PECI_CTL_STS_DONE;
> +            ps->status &= ~PECI_CTL_STS_START_BUSY;
> +            qemu_irq_raise(ps->irq);
> +        }
> +        break;
> +
> +    case PECI_RD_LENGTH:
> +        ps->pcmd.rd_length = data;
> +        break;
> +
> +    case PECI_ADDR:
> +        ps->pcmd.addr = data;
> +        break;
> +
> +    case PECI_CMD:
> +        ps->pcmd.cmd = data;
> +        break;
> +
> +    case PECI_CTL2:
> +        ps->ctl2 = data;
> +        break;
> +
> +    case PECI_WR_LENGTH:
> +        ps->pcmd.wr_length = data;
> +        break;
> +
> +    case PECI_PDDR:
> +        ps->pddr = data;
> +        break;
> +
> +    case PECI_DAT_INOUT(0) ... PECI_DAT_INOUT(63):
> +        ps->pcmd.rx[(offset - PECI_DAT_INOUT(0)) / 4] = data;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: to unknown register 0x%lx : 0x%lx\n",
> +                      __func__, offset, input);
> +        return;
> +    }
> +
> +}
> +
> +static void npcm7xx_peci_reset(Object *obj, ResetType type)
> +{
> +    NPCM7xxPECIState *ps = NPCM7XX_PECI(obj);
> +
> +    ps->status = PECI_CTL_STS_DONE_EN;
> +}
> +
> +static const MemoryRegionOps npcm7xx_peci_ops = {
> +    .read = npcm7xx_peci_read,
> +    .write = npcm7xx_peci_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .min_access_size = 1,
> +        .unaligned = false,
> +    },
> +};
> +
> +static void npcm7xx_peci_realize(DeviceState *dev, Error **errp)
> +{
> +    NPCM7xxPECIState *ps = NPCM7XX_PECI(dev);
> +    SysBusDevice *sbd = &ps->parent;
> +
> +    memory_region_init_io(&ps->iomem, OBJECT(ps), &npcm7xx_peci_ops, ps,
> +                          TYPE_NPCM7XX_PECI, 4 * KiB);
> +
> +    sysbus_init_mmio(sbd, &ps->iomem);
> +    sysbus_init_irq(sbd, &ps->irq);
> +
> +    ps->bus = peci_bus_create(DEVICE(ps));
> +}
> +
> +static void npcm7xx_peci_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "NPCM7xx PECI Module";
> +    dc->realize = npcm7xx_peci_realize;
> +    rc->phases.enter = npcm7xx_peci_reset;
> +}
> +
> +static const TypeInfo npcm7xx_peci_types[] = {
> +    {
> +        .name = TYPE_NPCM7XX_PECI,
> +        .parent = TYPE_SYS_BUS_DEVICE,
> +        .instance_size = sizeof(NPCM7xxPECIState),
> +        .class_init = npcm7xx_peci_class_init,
> +    },
> +};
> +
> +DEFINE_TYPES(npcm7xx_peci_types)
> diff --git a/hw/peci/trace-events b/hw/peci/trace-events
> index f90c998dd9..a895b21f7b 100644
> --- a/hw/peci/trace-events
> +++ b/hw/peci/trace-events
> @@ -3,3 +3,8 @@
>  # peci-core.c
>  peci_handle_cmd(const char* s, uint8_t addr) "%s @ 0x%02" PRIx8
>  peci_rd_pkg_cfg(const char* s) "%s"
> +
> +# npcm7xx_peci.c
> +npcm7xx_peci_cmd(uint64_t cmd) "cmd: 0x%04" PRIx64
> +npcm7xx_peci_read(uint64_t offset, uint64_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx64
> +npcm7xx_peci_write(uint64_t offset, uint64_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx64
> diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
> index ce593235d9..9e7cf8b774 100644
> --- a/include/hw/arm/npcm7xx.h
> +++ b/include/hw/arm/npcm7xx.h
> @@ -30,6 +30,7 @@
>  #include "hw/misc/npcm7xx_rng.h"
>  #include "hw/net/npcm7xx_emc.h"
>  #include "hw/nvram/npcm7xx_otp.h"
> +#include "hw/peci/npcm7xx_peci.h"
>  #include "hw/timer/npcm7xx_timer.h"
>  #include "hw/ssi/npcm7xx_fiu.h"
>  #include "hw/usb/hcd-ehci.h"
> @@ -105,6 +106,7 @@ typedef struct NPCM7xxState {
>      NPCM7xxFIUState     fiu[2];
>      NPCM7xxEMCState     emc[2];
>      NPCM7xxSDHCIState   mmc;
> +    NPCM7xxPECIState    peci;
>  } NPCM7xxState;
>  
>  #define TYPE_NPCM7XX    "npcm7xx"
> diff --git a/include/hw/peci/npcm7xx_peci.h b/include/hw/peci/npcm7xx_peci.h
> new file mode 100644
> index 0000000000..421f445041
> --- /dev/null
> +++ b/include/hw/peci/npcm7xx_peci.h
> @@ -0,0 +1,37 @@
> +/*
> + * Nuvoton NPCM7xx PECI Module
> + *
> + * Copyright 2021 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef NPCM7XX_PECI_H
> +#define NPCM7XX_PECI_H
> +
> +#include "exec/memory.h"
> +#include "hw/irq.h"
> +#include "hw/peci/peci.h"
> +#include "hw/sysbus.h"
> +
> +typedef struct NPCM7xxPECIState {
> +    SysBusDevice parent;
> +
> +    MemoryRegion iomem;
> +
> +    PECIBus      *bus;
> +    qemu_irq      irq;
> +
> +    PECICmd       pcmd;
> +
> +    /* Registers */
> +    uint8_t       status;
> +    uint8_t       ctl2;
> +    uint8_t       pddr;
> +} NPCM7xxPECIState;
> +
> +#define TYPE_NPCM7XX_PECI "npcm7xx-peci"
> +#define NPCM7XX_PECI(obj)                                               \
> +    OBJECT_CHECK(NPCM7xxPECIState, (obj), TYPE_NPCM7XX_PECI)
> +
> +#endif /* NPCM7XX_PECI_H */
> -- 
> 2.37.2.789.g6183377224-goog
> 

