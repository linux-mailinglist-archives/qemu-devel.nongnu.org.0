Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322525F38A3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:12:35 +0200 (CEST)
Received: from localhost ([::1]:48322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTft-0001PI-G0
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSsR-0006CX-VU; Mon, 03 Oct 2022 17:21:28 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSsP-0003IZ-Oc; Mon, 03 Oct 2022 17:21:27 -0400
Received: by mail-pl1-x634.google.com with SMTP id 10so7169352pli.0;
 Mon, 03 Oct 2022 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=gf2lrL9+dArGjo6+d93jZAbnsURiGZAjXtOc6BLIspo=;
 b=AAH+WP1y12e1nTw6n94CoxOxU2Uu5mCkc3zbe0gnFHQudLvizC+MKGW++AwPgm76+O
 k9HNHac7WqKEcCxqUVPb3/dyzBoYSjhc8K4gK8Ao+7c3o34nUbMaXwnfHz2MPG6FUrh9
 F1UQxqLde+C2l5FvwH3w9iiSSzOH49LoDxuQTYrudHowUExo5m9kBV6hzne/GVizLFnG
 xxoj0p2KCZH2EjVcwKn0Km/ZLuN5RQAqNsivFC/VD/i3n2TXHbow5zM2v6douMx59kE+
 JsEkWZDxW6MtDHAgwjM/iPTq+XbUGQHWy+HBjTmqYKPY+KYpDbAWx6UQaijCnjF3r8Cm
 X8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=gf2lrL9+dArGjo6+d93jZAbnsURiGZAjXtOc6BLIspo=;
 b=Nssx68KMx14nuJufaLbRYVi5qAMyJvaCl851r7VJy8VBN24f4jOnh+Vqg7Hb6DUKZ0
 l02gkp1ZEpJiK1YzCKRuqn6bXCbAg4AIig4VGtvtmp6holvwl4GLhq2+8Y5dq9/T8oEP
 bgjWBtYnwqo9nvUo1NdXR2XOmhpvWMNp8PjkkRYZNzGx3/krFSJ/WnOP79pxj2efsf05
 6WZq09D5DQPrktJOGS8HLgmYYtXRPFLA3sTpW8xcZvcPDIzvBwSqdn2G60eKOp8u8Ds2
 4mrMGYx2xLBkHIuNxh5at5hBhQq2LREfSnYxA6OVAPMwrLOmioCtU8seO4vzankZJ4Fw
 2PnA==
X-Gm-Message-State: ACrzQf2zqMUZucUU3a3wfxOMz85al3uitpa3+eYZb8F5IQrYb4e+TpW6
 dj322FCLX3TifFzmiYtvjrI=
X-Google-Smtp-Source: AMsMyM7EhqC6ystAPfea1HUL3rEocUR2odsSZ36s5Jh5efBlvzDqNAGpqKsEVgCC2xHYtNND+wWqPQ==
X-Received: by 2002:a17:903:1109:b0:179:d220:1f55 with SMTP id
 n9-20020a170903110900b00179d2201f55mr23452292plh.42.1664832080295; 
 Mon, 03 Oct 2022 14:21:20 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b0017305e99f00sm7804524plh.107.2022.10.03.14.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 14:21:19 -0700 (PDT)
Message-ID: <0fdd52fc-4a4d-c172-dbc9-0f7bf8e7a65e@amsat.org>
Date: Mon, 3 Oct 2022 23:21:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 09/13] hw/ppc/e500: Implement pflash handling
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-10-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/10/22 22:31, Bernhard Beschow wrote:
> Allows e500 boards to have their root file system reside on flash using
> only builtin devices located in the eLBC memory region.
> 
> Note that the flash memory area is only created when a -pflash argument is
> given, and that the size is determined by the given file. The idea is to
> put users into control.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   docs/system/ppc/ppce500.rst | 12 ++++++
>   hw/ppc/Kconfig              |  1 +
>   hw/ppc/e500.c               | 76 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 89 insertions(+)

> @@ -856,6 +892,7 @@ void ppce500_init(MachineState *machine)
>       unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
>       IrqLines *irqs;
>       DeviceState *dev, *mpicdev;
> +    DriveInfo *dinfo;
>       CPUPPCState *firstenv = NULL;
>       MemoryRegion *ccsr_addr_space;
>       SysBusDevice *s;
> @@ -1024,6 +1061,45 @@ void ppce500_init(MachineState *machine)
>                                   pmc->platform_bus_base,
>                                   &pms->pbus_dev->mmio);
>   
> +    dinfo = drive_get(IF_PFLASH, 0, 0);
> +    if (dinfo) {
> +        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
> +        BlockDriverState *bs = blk_bs(blk);
> +        uint64_t size = bdrv_getlength(bs);
> +        uint64_t mmio_size = pms->pbus_dev->mmio.size;
> +        uint32_t sector_len = 64 * KiB;
> +
> +        if (ctpop64(size) != 1) {
> +            error_report("Size of pflash file must be a power of two.");

This is a PFLASH restriction (which you already fixed in the previous
patch), not a board one.

> +            exit(1);
> +        }
> +
> +        if (size > mmio_size) {
> +            error_report("Size of pflash file must not be bigger than %" PRIu64
> +                         " bytes.", mmio_size);

There is no hardware limitation here, you can wire flash bigger than the
memory aperture. What is above the aperture will simply be ignored.

Should we display a warning here instead of a fatal error?

> +            exit(1);
> +        }
> +
> +        assert(QEMU_IS_ALIGNED(size, sector_len));

Similarly, this doesn't seem a problem the board code should worry
about: better to defer it to PFLASH realize().

> +        dev = qdev_new(TYPE_PFLASH_CFI01);
> +        qdev_prop_set_drive(dev, "drive", blk);
> +        qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
> +        qdev_prop_set_uint64(dev, "sector-length", sector_len);
> +        qdev_prop_set_uint8(dev, "width", 2);
> +        qdev_prop_set_bit(dev, "big-endian", true);
> +        qdev_prop_set_uint16(dev, "id0", 0x89);
> +        qdev_prop_set_uint16(dev, "id1", 0x18);
> +        qdev_prop_set_uint16(dev, "id2", 0x0000);
> +        qdev_prop_set_uint16(dev, "id3", 0x0);
> +        qdev_prop_set_string(dev, "name", "e500.flash");
> +        s = SYS_BUS_DEVICE(dev);
> +        sysbus_realize_and_unref(s, &error_fatal);
> +
> +        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
> +                                    sysbus_mmio_get_region(s, 0));
> +    }
> +
>       /*
>        * Smart firmware defaults ahead!
>        *


