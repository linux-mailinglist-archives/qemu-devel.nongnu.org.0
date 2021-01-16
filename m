Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC9F2F8C33
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 09:20:26 +0100 (CET)
Received: from localhost ([::1]:39686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0gom-0000Km-SK
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 03:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0gnV-0008K7-Ao
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 03:19:01 -0500
Received: from mail-ej1-f43.google.com ([209.85.218.43]:38322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0gnT-0002Nc-6N
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 03:19:01 -0500
Received: by mail-ej1-f43.google.com with SMTP id 6so16613388ejz.5
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 00:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IcyrWM9l8UkUwBoZAGxzZiZvvC6fZs3OIdcPkqYLbQI=;
 b=E8yUQwDBi6D9I2lisXL+u5gqhXOEAAJkzcjOJSE5NqNw5JIq4kWOFpnmLoNpMqsrib
 41VEw5qjs46mwCeg0fkDZ6YZKw4m3tX7e+ACxtwFRnUWu7yZkNmsYRCyOWfdyYoJDP/w
 ZJ4AT7CpHpqNQqI7fMhwGWM3H2wtZPxqMsBtF3d+FbdDl9GS5qZhTAmEsJCDRfEdQCI3
 F4C/jkTkIFxZ+NGYW5KTrJ8Qy/QYW6jSLNiCIY4mvSxoeVy06R6qe/SAwkWapHOfZfLp
 aoCvA5/5MpLxK090wwGdSVfAURBHkipL0zjGC3q+7WB4lJcsb2wwja4roqtqW62Cjuv0
 ntPQ==
X-Gm-Message-State: AOAM531nbSaU6HaGNhuBXkLFFEZHsuN/OHe8xSWxk2QMPIMVkqGHPshg
 EETVOW3UBTE5POJSvWPr008=
X-Google-Smtp-Source: ABdhPJx8mJkehnW7ISzLNdrD7eDoxcN0JvrSgeDc9TQJcDFsEuhpSTg5E21+CHl4fAgjbV9D9mOaZg==
X-Received: by 2002:a17:906:c00c:: with SMTP id
 e12mr11180904ejz.103.1610785137379; 
 Sat, 16 Jan 2021 00:18:57 -0800 (PST)
Received: from localhost (pd9e834f0.dip0.t-ipconnect.de. [217.232.52.240])
 by smtp.gmail.com with ESMTPSA id a22sm3354719edv.67.2021.01.16.00.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 00:18:56 -0800 (PST)
Date: Sat, 16 Jan 2021 09:18:53 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 04/11] hw/m68k/next-cube: Move scr_ops into NeXTPC device
Message-ID: <20210116091853.089f5e80@tuxfamily.org>
In-Reply-To: <20210115201206.17347-5-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
 <20210115201206.17347-5-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.218.43; envelope-from=th.huth@gmail.com;
 helo=mail-ej1-f43.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bryce Lanham <blanham@gmail.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Fri, 15 Jan 2021 20:11:59 +0000
schrieb Peter Maydell <peter.maydell@linaro.org>:

> Move the registers handled by the scr_ops struct into the NeXTPC
> device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/m68k/next-cube.c | 50
> ++++++++++++++++++++++----------------------- 1 file changed, 25
> insertions(+), 25 deletions(-)
> 
> diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
> index ff121143e92..f5575cb43b8 100644
> --- a/hw/m68k/next-cube.c
> +++ b/hw/m68k/next-cube.c
> @@ -76,8 +76,6 @@ struct NeXTState {
>      uint32_t int_mask;
>      uint32_t int_status;
>  
> -    uint8_t scsi_csr_1;
> -    uint8_t scsi_csr_2;
>      next_dma dma[10];
>      qemu_irq *scsi_irq;
>      qemu_irq scsi_dma;
> @@ -97,9 +95,12 @@ struct NeXTPC {
>      NeXTState *ns;
>  
>      MemoryRegion mmiomem;
> +    MemoryRegion scrmem;
>  
>      uint32_t scr1;
>      uint32_t scr2;
> +    uint8_t scsi_csr_1;
> +    uint8_t scsi_csr_2;
>  };
>  
>  /* Thanks to NeXT forums for this */
> @@ -402,7 +403,7 @@ static const MemoryRegionOps mmio_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> -static uint32_t scr_readb(NeXTState *s, hwaddr addr)
> +static uint32_t scr_readb(NeXTPC *s, hwaddr addr)
>  {
>      switch (addr) {
>      case 0x14108:
> @@ -436,13 +437,13 @@ static uint32_t scr_readb(NeXTState *s, hwaddr
> addr) }
>  }
>  
> -static uint32_t scr_readw(NeXTState *s, hwaddr addr)
> +static uint32_t scr_readw(NeXTPC *s, hwaddr addr)
>  {
>      DPRINTF("BMAP Read W @ %x\n", (unsigned int)addr);
>      return 0;
>  }
>  
> -static uint32_t scr_readl(NeXTState *s, hwaddr addr)
> +static uint32_t scr_readl(NeXTPC *s, hwaddr addr)
>  {
>      DPRINTF("BMAP Read L @ %x\n", (unsigned int)addr);
>      return 0;
> @@ -455,7 +456,7 @@ static uint32_t scr_readl(NeXTState *s, hwaddr
> addr) #define SCSICSR_CPUDMA  0x10  /* if set, dma enabled */
>  #define SCSICSR_INTMASK 0x20  /* if set, interrupt enabled */
>  
> -static void scr_writeb(NeXTState *s, hwaddr addr, uint32_t value)
> +static void scr_writeb(NeXTPC *s, hwaddr addr, uint32_t value)
>  {
>      switch (addr) {
>      case 0x14108:
> @@ -501,9 +502,9 @@ static void scr_writeb(NeXTState *s, hwaddr addr,
> uint32_t value) DPRINTF("SCSICSR CPUDMA\n");
>              /* qemu_irq_raise(s->scsi_dma); */
>  
> -            s->int_status |= 0x4000000;
> +            s->ns->int_status |= 0x4000000;
>          } else {
> -            s->int_status &= ~(0x4000000);
> +            s->ns->int_status &= ~(0x4000000);
>          }
>          if (value & SCSICSR_INTMASK) {
>              DPRINTF("SCSICSR INTMASK\n");
> @@ -533,27 +534,27 @@ static void scr_writeb(NeXTState *s, hwaddr
> addr, uint32_t value) }
>  }
>  
> -static void scr_writew(NeXTState *s, hwaddr addr, uint32_t value)
> +static void scr_writew(NeXTPC *s, hwaddr addr, uint32_t value)
>  {
>      DPRINTF("BMAP Write W @ %x with %x\n", (unsigned int)addr,
> value); }
>  
> -static void scr_writel(NeXTState *s, hwaddr addr, uint32_t value)
> +static void scr_writel(NeXTPC *s, hwaddr addr, uint32_t value)
>  {
>      DPRINTF("BMAP Write L @ %x with %x\n", (unsigned int)addr,
> value); }
>  
>  static uint64_t scr_readfn(void *opaque, hwaddr addr, unsigned size)
>  {
> -    NeXTState *ns = NEXT_MACHINE(opaque);
> +    NeXTPC *s = NEXT_PC(opaque);
>  
>      switch (size) {
>      case 1:
> -        return scr_readb(ns, addr);
> +        return scr_readb(s, addr);
>      case 2:
> -        return scr_readw(ns, addr);
> +        return scr_readw(s, addr);
>      case 4:
> -        return scr_readl(ns, addr);
> +        return scr_readl(s, addr);
>      default:
>          g_assert_not_reached();
>      }
> @@ -562,17 +563,17 @@ static uint64_t scr_readfn(void *opaque, hwaddr
> addr, unsigned size) static void scr_writefn(void *opaque, hwaddr
> addr, uint64_t value, unsigned size)
>  {
> -    NeXTState *ns = NEXT_MACHINE(opaque);
> +    NeXTPC *s = NEXT_PC(opaque);
>  
>      switch (size) {
>      case 1:
> -        scr_writeb(ns, addr, value);
> +        scr_writeb(s, addr, value);
>          break;
>      case 2:
> -        scr_writew(ns, addr, value);
> +        scr_writew(s, addr, value);
>          break;
>      case 4:
> -        scr_writel(ns, addr, value);
> +        scr_writel(s, addr, value);
>          break;
>      default:
>          g_assert_not_reached();
> @@ -886,8 +887,10 @@ static void next_pc_realize(DeviceState *dev,
> Error **errp) 
>      memory_region_init_io(&s->mmiomem, OBJECT(s), &mmio_ops, s,
>                            "next.mmio", 0xD0000);
> -
> +    memory_region_init_io(&s->scrmem, OBJECT(s), &scr_ops, s,
> +                          "next.scr", 0x20000);
>      sysbus_init_mmio(sbd, &s->mmiomem);
> +    sysbus_init_mmio(sbd, &s->scrmem);
>  }
>  
>  static void next_pc_class_init(ObjectClass *klass, void *data)
> @@ -912,7 +915,6 @@ static void next_cube_init(MachineState *machine)
>      M68kCPU *cpu;
>      CPUM68KState *env;
>      MemoryRegion *rom = g_new(MemoryRegion, 1);
> -    MemoryRegion *scrmem = g_new(MemoryRegion, 1);
>      MemoryRegion *dmamem = g_new(MemoryRegion, 1);
>      MemoryRegion *bmapm1 = g_new(MemoryRegion, 1);
>      MemoryRegion *bmapm2 = g_new(MemoryRegion, 1);
> @@ -956,6 +958,9 @@ static void next_cube_init(MachineState *machine)
>      /* MMIO */
>      sysbus_mmio_map(SYS_BUS_DEVICE(pcdev), 0, 0x02000000);
>  
> +    /* BMAP IO - acts as a catch-all for now */
> +    sysbus_mmio_map(SYS_BUS_DEVICE(pcdev), 1, 0x02100000);
> +
>      /* BMAP memory */
>      memory_region_init_ram_shared_nomigrate(bmapm1, NULL,
> "next.bmapmem", 64, true, &error_fatal);
> @@ -964,11 +969,6 @@ static void next_cube_init(MachineState *machine)
>      memory_region_init_alias(bmapm2, NULL, "next.bmapmem2", bmapm1,
> 0x0, 64); memory_region_add_subregion(sysmem, 0x820c0000, bmapm2);
>  
> -    /* BMAP IO - acts as a catch-all for now */
> -    memory_region_init_io(scrmem, NULL, &scr_ops, machine,
> "next.scr",
> -                          0x20000);
> -    memory_region_add_subregion(sysmem, 0x02100000, scrmem);
> -
>      /* KBD */
>      dev = qdev_new(TYPE_NEXTKBD);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


