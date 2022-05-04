Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7700B5198DA
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:51:54 +0200 (CEST)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9nd-00019G-Fo
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nm9bj-0001qz-Hn
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:39:35 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:50515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nm9bh-0006fx-E6
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:39:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 39C4CFC64C85;
 Wed,  4 May 2022 09:39:29 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 4 May 2022
 09:39:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0012475992e-03d6-4cc2-a593-60781ae098d2,
 2ED07F56FA4068EED65A7C5DE2D93F2CD8BACCEF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <2ab490a2-875d-ae82-38d0-425415f9818c@kaod.org>
Date: Wed, 4 May 2022 09:39:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter
 Maydell <peter.maydell@linaro.org>
References: <20220503225925.1798324-1-pdel@fb.com>
 <20220503225925.1798324-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220503225925.1798324-2-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 23d505c7-d4b4-43dd-8646-fa51ee5c1ce2
X-Ovh-Tracer-Id: 3292412806409391011
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekgeejtefghffhkeegudehieevieetgfegieeuteethfeiveekhefhleffteektdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsvghtuhhpqdguvghvrdhshhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/4/22 00:59, Peter Delevoryas wrote:
> Add the 'fby35-bmc' machine type based on the kernel DTS[1] and userspace
> i2c setup scripts[2]. Undefined values are inherited from the AST2600-EVB.
> 
> Reference images can be found in Facebook OpenBMC Github Release assets
> as "fby35.mtd". [3]
> 
> You can boot the reference images as follows (fby35 uses dual-flash):
> 
> qemu-system-arm -machine fby35-bmc \
>      -drive file=fby35.mtd,format=raw,if=mtd \
>      -drive file=fby35.mtd,format=raw,if=mtd \
>      -nographic
> 
> [1] https://github.com/facebook/openbmc-linux/blob/412d5053258007117e94b1e36015aefc1301474b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
> [2] https://github.com/facebook/openbmc/blob/e2294ff5d31dd65c248fe396a385286d6d5c463d/meta-facebook/meta-fby35/recipes-fby35/plat-utils/files/setup-dev.sh
> [3] https://github.com/facebook/openbmc/releases
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

a question below,

> ---
> 
> v2: Removed avocado test, updated commit message.
> 
>   hw/arm/aspeed.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a74c13ab0f..725c169488 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -21,6 +21,7 @@
>   #include "hw/misc/led.h"
>   #include "hw/qdev-properties.h"
>   #include "sysemu/block-backend.h"
> +#include "sysemu/reset.h"
>   #include "hw/loader.h"
>   #include "qemu/error-report.h"
>   #include "qemu/units.h"
> @@ -951,6 +952,35 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
>   }
>   
> +static void fby35_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +    I2CBus *i2c[16];
> +
> +    for (int i = 0; i < 16; i++) {
> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> +    }
> +
> +    i2c_slave_create_simple(i2c[2], TYPE_LM75, 0x4f);
> +    i2c_slave_create_simple(i2c[8], TYPE_TMP421, 0x1f);
> +    /* Hotswap controller is actually supposed to be mp5920 or ltc4282. */
> +    i2c_slave_create_simple(i2c[11], "adm1272", 0x44);
> +    i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4e);
> +    i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4f);
> +
> +    aspeed_eeprom_init(i2c[4], 0x51, 128 * KiB);
> +    aspeed_eeprom_init(i2c[6], 0x51, 128 * KiB);
> +    aspeed_eeprom_init(i2c[8], 0x50, 32 * KiB);
> +    aspeed_eeprom_init(i2c[11], 0x51, 128 * KiB);
> +    aspeed_eeprom_init(i2c[11], 0x54, 128 * KiB);
> +
> +    /*
> +     * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
> +     * buses 0, 1, 2, 3, and 9. Source address 0x10, target address 0x20 on
> +     * each.
> +     */


Have you considered extending the emulation to include a AST1030 SoC
in a larger machine ?

The AST1030 SoC is merged and I think that QEMU could run a cortex-m4
CPU and a A7 CPU. A + R CPUs is supported (Xilinx boards).

Thanks,

C.


> +}
> +
>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>   {
>       return ASPEED_MACHINE(obj)->mmio_exec;
> @@ -1293,6 +1323,35 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   }
>   
> +static void fby35_reset(MachineState *state)
> +{
> +    AspeedMachineState *bmc = ASPEED_MACHINE(state);
> +    AspeedGPIOState *gpio = &bmc->soc.gpio;
> +
> +    qemu_devices_reset();
> +
> +    /* Board ID */
> +    object_property_set_bool(OBJECT(gpio), "gpioV4", true, &error_fatal);
> +    object_property_set_bool(OBJECT(gpio), "gpioV5", true, &error_fatal);
> +    object_property_set_bool(OBJECT(gpio), "gpioV6", true, &error_fatal);
> +    object_property_set_bool(OBJECT(gpio), "gpioV7", false, &error_fatal);
> +}
> +
> +static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Facebook fby35 BMC (Cortex-A7)";
> +    mc->reset      = fby35_reset;
> +    amc->fmc_model = "mx66l1g45g";
> +    amc->num_cs    = 2;
> +    amc->macs_mask = ASPEED_MAC3_ON;
> +    amc->i2c_init  = fby35_i2c_init;
> +    /* FIXME: Replace this macro with something more general */
> +    mc->default_ram_size = FUJI_BMC_RAM_SIZE;
> +}
> +
>   #define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
>   /* Main SYSCLK frequency in Hz (200MHz) */
>   #define SYSCLK_FRQ 200000000ULL
> @@ -1411,6 +1470,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("bletchley-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_bletchley_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("fby35-bmc"),
> +        .parent        = MACHINE_TYPE_NAME("ast2600-evb"),
> +        .class_init    = aspeed_machine_fby35_class_init,
>       }, {
>           .name           = MACHINE_TYPE_NAME("ast1030-evb"),
>           .parent         = TYPE_ASPEED_MACHINE,


