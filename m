Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA32F8CCC
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 11:26:10 +0100 (CET)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0imV-0008LU-G2
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 05:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0ilK-0007u9-PM
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 05:24:54 -0500
Received: from mail-ed1-f47.google.com ([209.85.208.47]:41254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0ilI-00015w-RB
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 05:24:54 -0500
Received: by mail-ed1-f47.google.com with SMTP id bm23so22340edb.8
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 02:24:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bdaRSf/n5FcirFIxbetozzcSwe+KiFuAG5P2ZNNrKYw=;
 b=oAHYDgJPq74GaqNmYRHqRZSr6bXD4+ImF9pTxIbL2YBMPRHTmEEns8/OFb0bwJZC/s
 60mbr+J4aoj9ynag+FvzsGkYusYgu7pDqFkc0PN1yYpRN7kkbJGy0REbiuAG4UnFEXX9
 4IU6UM5mWZDMHHu6649wxBhf6fg5kq+pM15CeIzeNHdDvkHlQH2iyYqDD4YNjth2TybM
 0aC9rtlatCWn7txTl+5Ur7DsdsCghbGhXtEbcocF/gwQSWbakvKxREuKK0VoqAFFDrnT
 FCNFVQmNwvMVd5uvsDyZobU3p7LtQ9YYyXtk/3WvoWGefmoYeZJuUgVNZrXAI6lG9uIN
 3EbA==
X-Gm-Message-State: AOAM533c/yybRCegKamIWd5WvPkVpSOkLndTxr92UKRsmQpN72R7HYOZ
 ZuWUNfo5qAmlxue9uI2g26M=
X-Google-Smtp-Source: ABdhPJyVJ+B14Kg+C65krz0mqn35mjlOztun2tmISkJ5OO+3s3m5/9kUPdOWYhvLvero8PCVmTBgYw==
X-Received: by 2002:a50:9ee9:: with SMTP id a96mr4656809edf.343.1610792691181; 
 Sat, 16 Jan 2021 02:24:51 -0800 (PST)
Received: from localhost (pd9e83641.dip0.t-ipconnect.de. [217.232.54.65])
 by smtp.gmail.com with ESMTPSA id zg24sm6127996ejb.120.2021.01.16.02.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 02:24:50 -0800 (PST)
Date: Sat, 16 Jan 2021 11:24:48 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 07/11] hw/m68k/next-cube: Make next_irq GPIO inputs to
 NEXT_PC device
Message-ID: <20210116112448.15c2b8dd@tuxfamily.org>
In-Reply-To: <20210115201206.17347-8-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
 <20210115201206.17347-8-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.208.47; envelope-from=th.huth@gmail.com;
 helo=mail-ed1-f47.google.com
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Fri, 15 Jan 2021 20:12:02 +0000
schrieb Peter Maydell <peter.maydell@linaro.org>:

> Make the next_irq function be GPIO inputs to the NEXT_PC
> device, rather than a freestanding set of qemu_irq lines.
> 
> This fixes a minor Coverity issue where it correctly points
> out the trivial memory leak of the memory allocated in the
> call to qemu_allocate_irqs().
> 
> Fixes: CID 1421962
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/m68k/next-cube.h |  3 ++-
>  hw/m68k/next-cube.c         | 21 ++++-----------------
>  2 files changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
> index 5a56c354b8e..d38c52d540d 100644
> --- a/include/hw/m68k/next-cube.h
> +++ b/include/hw/m68k/next-cube.h
> @@ -39,7 +39,8 @@ enum next_irqs {
>      NEXT_ENRX_DMA_I,
>      NEXT_SCSI_DMA_I,
>      NEXT_SCC_DMA_I,
> -    NEXT_SND_I
> +    NEXT_SND_I,
> +    NEXT_NUM_IRQS
>  };
>  
>  #endif /* NEXT_CUBE_H */
> diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
> index 6b4bcfd4b9b..5a8fc24ed35 100644
> --- a/hw/m68k/next-cube.c
> +++ b/hw/m68k/next-cube.c
> @@ -734,10 +734,6 @@ static const MemoryRegionOps dma_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> -/*
> - * TODO: set the shift numbers as values in the enum, so the first
> switch
> - * will not be needed
> - */
>  static void next_irq(void *opaque, int number, int level)
>  {
>      NeXTPC *s = NEXT_PC(opaque);
> @@ -838,19 +834,8 @@ static void next_irq(void *opaque, int number,
> int level) }
>  }
>  
> -static void next_serial_irq(void *opaque, int n, int level)
> -{
> -    /* DPRINTF("SCC IRQ NUM %i\n",n); */
> -    if (n) {
> -        next_irq(opaque, NEXT_SCC_DMA_I, level);
> -    } else {
> -        next_irq(opaque, NEXT_SCC_I, level);
> -    }
> -}
> -
>  static void next_escc_init(DeviceState *pcdev)
>  {
> -    qemu_irq *ser_irq = qemu_allocate_irqs(next_serial_irq, pcdev,
> 2); DeviceState *dev;
>      SysBusDevice *s;
>  
> @@ -866,8 +851,8 @@ static void next_escc_init(DeviceState *pcdev)
>  
>      s = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_connect_irq(s, 0, ser_irq[0]);
> -    sysbus_connect_irq(s, 1,  ser_irq[1]);
> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(pcdev, NEXT_SCC_I));
> +    sysbus_connect_irq(s, 1, qdev_get_gpio_in(pcdev,
> NEXT_SCC_DMA_I)); sysbus_mmio_map(s, 0, 0x2118000);
>  }
>  
> @@ -886,6 +871,8 @@ static void next_pc_realize(DeviceState *dev,
> Error **errp) NeXTPC *s = NEXT_PC(dev);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>  
> +    qdev_init_gpio_in(dev, next_irq, NEXT_NUM_IRQS);
> +
>      memory_region_init_io(&s->mmiomem, OBJECT(s), &mmio_ops, s,
>                            "next.mmio", 0xD0000);
>      memory_region_init_io(&s->scrmem, OBJECT(s), &scr_ops, s,

Acked-by: Thomas Huth <huth@tuxfamily.org>

