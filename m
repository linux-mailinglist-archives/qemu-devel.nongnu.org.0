Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396723FA480
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 10:27:24 +0200 (CEST)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJtgR-0005YX-2K
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 04:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mJtfA-0004Ze-LU
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 04:26:04 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:40751
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mJtf7-0006tG-B7
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 04:26:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 9ED6913B189;
 Sat, 28 Aug 2021 08:25:58 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sat, 28 Aug
 2021 10:25:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0035ad9a698-70b6-4ccf-b521-d650c3036cff,
 6CE952B1E590FC391734534FA2C2FCCDA042449D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.199.102.86
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
To: <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
Date: Sat, 28 Aug 2021 10:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827210417.4022054-3-pdel@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 53743f80-4081-4276-ba5b-5c0d12bcec40
X-Ovh-Tracer-Id: 17516187803589708768
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudduhedgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.437,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 11:04 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> This change replaces the UART serial device initialization code with machine
> configuration data, making it so that we have a single code path for console
> UART initialization, but allowing different machines to use different
> UART's. This is relevant because the Aspeed chips have 2 debug UART's, UART5
> and UART1, and while most machines just use UART5, some use UART1.

I think this is controlled by SCU510. If so, we should have a different HW 
strapping for the new machine and check the configuration at the SoC level,
in aspeed_ast2600.c, to change the serial initialization.


Thanks,

C. 
 
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed.c         | 7 +++++++
>  hw/arm/aspeed_ast2600.c | 5 -----
>  hw/arm/aspeed_soc.c     | 5 -----
>  include/hw/arm/aspeed.h | 1 +
>  4 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 9d43e26c51..ff53d12395 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -14,6 +14,7 @@
>  #include "hw/arm/boot.h"
>  #include "hw/arm/aspeed.h"
>  #include "hw/arm/aspeed_soc.h"
> +#include "hw/char/serial.h"
>  #include "hw/i2c/i2c_mux_pca954x.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/misc/pca9552.h"
> @@ -21,6 +22,7 @@
>  #include "hw/misc/led.h"
>  #include "hw/qdev-properties.h"
>  #include "sysemu/block-backend.h"
> +#include "sysemu/sysemu.h"
>  #include "hw/loader.h"
>  #include "qemu/error-report.h"
>  #include "qemu/units.h"
> @@ -352,6 +354,10 @@ static void aspeed_machine_init(MachineState *machine)
>      }
>      qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>  
> +    serial_mm_init(get_system_memory(), sc->memmap[amc->serial_dev], 2,
> +                   sc->get_irq(&bmc->soc, amc->serial_dev), 38400,
> +                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +
>      memory_region_add_subregion(get_system_memory(),
>                                  sc->memmap[ASPEED_DEV_SDRAM],
>                                  &bmc->ram_container);
> @@ -804,6 +810,7 @@ static void aspeed_machine_class_init(ObjectClass *oc, void *data)
>      mc->no_parallel = 1;
>      mc->default_ram_id = "ram";
>      amc->macs_mask = ASPEED_MAC0_ON;
> +    amc->serial_dev = ASPEED_DEV_UART5;
>  
>      aspeed_machine_class_props_init(oc);
>  }
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 56e1adb343..a27b0de482 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -322,11 +322,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>      }
>  
> -    /* UART - attach an 8250 to the IO space as our UART5 */
> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
> -                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> -
>      /* I2C */
>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>                               &error_abort);
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index c373182299..0c09d1e5b4 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -287,11 +287,6 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>      }
>  
> -    /* UART - attach an 8250 to the IO space as our UART5 */
> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
> -                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> -
>      /* I2C */
>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>                               &error_abort);
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index c9747b15fc..9f5b9f04d6 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -38,6 +38,7 @@ struct AspeedMachineClass {
>      uint32_t num_cs;
>      uint32_t macs_mask;
>      void (*i2c_init)(AspeedMachineState *bmc);
> +    uint32_t serial_dev;
>  };
>  
>  
> 


