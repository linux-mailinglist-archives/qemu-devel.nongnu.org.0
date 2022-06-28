Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E41455BEFC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:13:16 +0200 (CEST)
Received: from localhost ([::1]:49756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65PP-0001e8-Af
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o63Nz-0006mU-CD
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 01:03:40 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:39763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o63Nw-0001Bx-VZ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 01:03:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B691111202D7F;
 Tue, 28 Jun 2022 07:03:33 +0200 (CEST)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 07:03:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S00293ad9f36-b753-4a9e-a4c7-9e7d098cfc57,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <62c1c907-8c4a-7c75-5c63-ce799cbbfa70@kaod.org>
Date: Tue, 28 Jun 2022 07:03:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 7/8] aspeed: Make aspeed_board_init_flashes public
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-8-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624003701.1363500-8-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8bc2d5ff-5cef-447d-a236-43bb12139c50
X-Ovh-Tracer-Id: 10062448944434285536
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedgledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/24/22 02:37, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c             | 25 -------------------------
>   hw/arm/aspeed_soc.c         | 26 ++++++++++++++++++++++++++
>   include/hw/arm/aspeed_soc.h |  2 ++
>   3 files changed, 28 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index b43dc0fda8..a7352ca837 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -257,31 +257,6 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
>       rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
>   }
>   
> -static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> -                                      unsigned int count, int unit0)
> -{
> -    int i;
> -
> -    if (!flashtype) {
> -        return;
> -    }
> -
> -    for (i = 0; i < count; ++i) {
> -        DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
> -        qemu_irq cs_line;
> -        DeviceState *dev;
> -
> -        dev = qdev_new(flashtype);
> -        if (dinfo) {
> -            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> -        }
> -        qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
> -
> -        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
> -        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
> -    }
> -}
> -
>   static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
>   {
>           DeviceState *card;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 16394c8e0b..4183f5ffbf 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -21,6 +21,7 @@
>   #include "hw/i2c/aspeed_i2c.h"
>   #include "net/net.h"
>   #include "sysemu/sysemu.h"
> +#include "sysemu/blockdev.h"
>   
>   #define ASPEED_SOC_IOMEM_SIZE       0x00200000
>   
> @@ -626,3 +627,28 @@ void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
>       memory_region_add_subregion_overlap(s->memory, addr,
>                                           sysbus_mmio_get_region(dev, 0), -1000);
>   }
> +
> +void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> +                               unsigned int count, int unit0)
> +{
> +    int i;
> +
> +    if (!flashtype) {
> +        return;
> +    }
> +
> +    for (i = 0; i < count; ++i) {
> +        DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
> +        qemu_irq cs_line;
> +        DeviceState *dev;
> +
> +        dev = qdev_new(flashtype);
> +        if (dinfo) {
> +            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +        }
> +        qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
> +
> +        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
> +    }
> +}
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 6cfc063985..5cd31c1306 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -178,5 +178,7 @@ void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
>   void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
>                                      const char *name, hwaddr addr,
>                                      uint64_t size);
> +void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> +                               unsigned int count, int unit0);
>   
>   #endif /* ASPEED_SOC_H */


