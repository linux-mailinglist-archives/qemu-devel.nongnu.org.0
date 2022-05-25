Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C3C5338B7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 10:44:23 +0200 (CEST)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntmcw-0006aa-SU
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 04:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntmZp-0005Eo-Kh
 for qemu-devel@nongnu.org; Wed, 25 May 2022 04:41:09 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntmZn-0007qO-6J
 for qemu-devel@nongnu.org; Wed, 25 May 2022 04:41:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.208])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CEFB5103A932F;
 Wed, 25 May 2022 10:41:03 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 25 May
 2022 10:41:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0065c4b3ead-4188-4fd3-bef9-c089c6fd6928,
 D6A97ED6E11FF164423AFC60B0B43C9491D8EECB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b9d55cf6-6240-003b-c9d4-c7bb73327685@kaod.org>
Date: Wed, 25 May 2022 10:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220503225925.1798324-1-pdel@fb.com>
 <20220503225925.1798324-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220503225925.1798324-2-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e6e45f9d-040c-40c3-aac5-0864c42e64e4
X-Ovh-Tracer-Id: 16978289120680971232
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrjeehgddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgffgvdeffeefleeigfevleegtdegteegtdelgeejhfevgeegfedvkeehffejteeinecuffhomhgrihhnpehgihhthhhusgdrtghomhdpshgvthhuphdquggvvhdrshhhnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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

Hello Peter,

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

Machine "fby35-bmc" inherits from the "ast2600-evb" machine definitions
which means that any changes in "ast2600-evb" will silently modify
"fby35-bmc". Is that what you want ?

Thanks,

C.

> +        .class_init    = aspeed_machine_fby35_class_init,
>       }, {
>           .name           = MACHINE_TYPE_NAME("ast1030-evb"),
>           .parent         = TYPE_ASPEED_MACHINE,


