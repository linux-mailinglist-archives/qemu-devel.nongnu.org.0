Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384673FD3DC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 08:36:05 +0200 (CEST)
Received: from localhost ([::1]:43912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLJqp-0000Je-Lf
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 02:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLJpd-0007Lo-CH; Wed, 01 Sep 2021 02:34:45 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:40073
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLJpb-00012Y-57; Wed, 01 Sep 2021 02:34:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id C641313EF2D;
 Wed,  1 Sep 2021 06:34:38 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 08:34:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005e5c9e7d6-7b12-47b8-a6a3-8460bcc5368a,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 1/1] hw/arm/aspeed: Allow machine to set serial_hd(0)
To: <pdel@fb.com>
References: <20210831233140.2659116-1-pdel@fb.com>
 <20210831233140.2659116-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3ffd8327-6b62-a39f-49db-100bb1475309@kaod.org>
Date: Wed, 1 Sep 2021 08:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831233140.2659116-2-pdel@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0cfc63ba-ddd3-4625-ac96-53bea7814186
X-Ovh-Tracer-Id: 2233222466928806764
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvvddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphguvghlsehfsgdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, andrew@aj.id.au,
 qemu-devel@nongnu.org, f4bug@amsat.org, patrick@stwcx.xyz, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding Peter Maydell and Joel.

On 9/1/21 1:31 AM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> When you run QEMU with an Aspeed machine and a single serial device
> using stdio like this:
> 
>     qemu -machine ast2600-evb -drive ... -serial stdio
> 
> The guest OS can read and write to the UART5 registers at 0x1E784000 and
> it will receive from stdin and write to stdout. The Aspeed SoC's have a
> lot more UART's though (AST2500 has 5, AST2600 has 13) and depending on
> the board design, may be using any of them as the serial console. (See
> "stdout-path" in a DTS to check which one is chosen).
> 
> Most boards, including all of those currently defined in
> hw/arm/aspeed.c, just use UART5, but some use UART1. This change adds
> some flexibility for different boards without requiring users to change
> their command-line invocation of QEMU.
> 
> I tested this doesn't break existing code by booting an AST2500 OpenBMC
> image and an AST2600 OpenBMC image, each using UART5 as the console.
> 
> Then I tested switching the default to UART1 and booting an AST2600
> OpenBMC image that uses UART1, and that worked too.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Some comments below, 

> ---
>  hw/arm/aspeed.c         |  1 +
>  hw/arm/aspeed_ast2600.c | 11 +++++++----
>  hw/arm/aspeed_soc.c     |  9 ++++++---
>  include/hw/arm/aspeed.h |  1 +
>  4 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 9d43e26c51..74379907ff 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -804,6 +804,7 @@ static void aspeed_machine_class_init(ObjectClass *oc, void *data)
>      mc->no_parallel = 1;
>      mc->default_ram_id = "ram";
>      amc->macs_mask = ASPEED_MAC0_ON;
> +    amc->serial_hd0 = ASPEED_DEV_UART5;
>  
>      aspeed_machine_class_props_init(oc);
>  }
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index e3013128c6..361a456214 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -10,6 +10,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/misc/unimp.h"
> +#include "hw/arm/aspeed.h"
>  #include "hw/arm/aspeed_soc.h"
>  #include "hw/char/serial.h"
>  #include "qemu/module.h"
> @@ -231,6 +232,8 @@ static uint64_t aspeed_calc_affinity(int cpu)
>  static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>  {
>      int i;
> +    AspeedMachineState *bmc = ASPEED_MACHINE(qdev_get_machine());
> +    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);

This is reaching into the machine from the SoC which is not good
practice.

What you should do is add an attribute in AspeedSoCState and a 
property in aspeed_soc_properties[]. This property would be set 
in aspeed_machine_init() before realizing the soc object. Look 
at "dram" for an example.

Then, in the aspeed_soc_*_realize routines, you would use the 
attribute to initialize the default serial device.

I don't really know what to call this attribute and property.
How about uart_default and "uart-default" ? 

Thanks,

C.

>      AspeedSoCState *s = ASPEED_SOC(dev);
>      AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>      Error *err = NULL;
> @@ -322,10 +325,10 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>      }
>  
> -    /* UART - attach an 8250 to the IO space as our UART5 */
> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
> -                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    /* Wire up the first serial device, usually either UART5 or UART1 */
> +    serial_mm_init(get_system_memory(), sc->memmap[amc->serial_hd0], 2,
> +                   aspeed_soc_get_irq(s, amc->serial_hd0), 38400,
> +                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
>  
>      /* I2C */
>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 3ad6c56fa9..77422bbeb1 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -13,6 +13,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/misc/unimp.h"
> +#include "hw/arm/aspeed.h"
>  #include "hw/arm/aspeed_soc.h"
>  #include "hw/char/serial.h"
>  #include "qemu/module.h"
> @@ -221,6 +222,8 @@ static void aspeed_soc_init(Object *obj)
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>  {
>      int i;
> +    AspeedMachineState *bmc = ASPEED_MACHINE(qdev_get_machine());
> +    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
>      AspeedSoCState *s = ASPEED_SOC(dev);
>      AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>      Error *err = NULL;
> @@ -287,9 +290,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>      }
>  
> -    /* UART - attach an 8250 to the IO space as our UART5 */
> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
> +    /* Wire up the first serial device, usually either UART5 or UART1 */
> +    serial_mm_init(get_system_memory(), sc->memmap[amc->serial_hd0], 2,
> +                   aspeed_soc_get_irq(s, amc->serial_hd0), 38400,
>                     serial_hd(0), DEVICE_LITTLE_ENDIAN);
>  
>      /* I2C */
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index c9747b15fc..bc0f27885a 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -38,6 +38,7 @@ struct AspeedMachineClass {
>      uint32_t num_cs;
>      uint32_t macs_mask;
>      void (*i2c_init)(AspeedMachineState *bmc);
> +    uint32_t serial_hd0;
>  };
>  
>  
> 


