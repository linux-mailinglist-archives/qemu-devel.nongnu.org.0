Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AAD42D375
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 09:21:49 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mav3k-0007R2-Bn
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 03:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mav1x-0006Rz-32; Thu, 14 Oct 2021 03:19:57 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:48777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mav1u-000846-1e; Thu, 14 Oct 2021 03:19:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 689DF1FE41;
 Thu, 14 Oct 2021 07:19:49 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Thu, 14 Oct
 2021 09:19:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00198175531-913d-4adf-a08a-36bab54abd5c,
 B7F254A9178130F56DF3A81D7C4824236E38FE77) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f636c41c-30dd-85ba-1654-dafb0f65d0d3@kaod.org>
Date: Thu, 14 Oct 2021 09:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] aspeed: Add support for the fp5280g2-bmc board
Content-Language: en-US
To: John Wang <wangzq.jn@gmail.com>, <lintao.lc@inspur.com>,
 <liuxiwei@inspur.com>, <duanzhijia01@inspur.com>
References: <20211014064548.934799-1-wangzhiqiang02@inspur.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211014064548.934799-1-wangzhiqiang02@inspur.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9c8672e9-d6af-43a1-8092-6914cc0c5673
X-Ovh-Tracer-Id: 15714466477586680623
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduuddgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 08:45, John Wang wrote:
> The fp5280g2-bmc is supported by OpenBMC, It's
> based on the following device tree
> 
> https://github.com/openbmc/linux/blob/dev-5.10/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> 
> Signed-off-by: John Wang <wangzhiqiang02@inspur.com>

Is a flash image available so that we can give this new machine a try ?

LGTM.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 01c1747972..21b690334e 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -141,6 +141,21 @@ struct AspeedMachineState {
>           SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
>           SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
>   
> +/* FP5280G2 hardware value: 0XF100D286 */
> +#define FP5280G2_BMC_HW_STRAP1 (                                      \
> +        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
> +        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
> +        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
> +        SCU_AST2500_HW_STRAP_RESERVED28 |                               \
> +        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
> +        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
> +        SCU_HW_STRAP_LPC_RESET_PIN |                                    \
> +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |                \
> +        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     \
> +        SCU_HW_STRAP_MAC1_RGMII |                                       \
> +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
> +        SCU_AST2500_HW_STRAP_RESERVED1)
> +
>   /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
>   #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>   
> @@ -456,6 +471,15 @@ static void aspeed_machine_init(MachineState *machine)
>       arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
>   }
>   
> +static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> +    DeviceState *dev = DEVICE(i2c_dev);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +}
> +
>   static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -717,6 +741,34 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
>                             eeprom_buf);
>   }
>   
> +static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +    I2CSlave *i2c_mux;
> +
> +    /* The at24c256 */
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x50, 32768);
> +
> +    /* The fp5280g2 expects a TMP112 but a TMP105 is compatible */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP105,
> +                     0x48);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP105,
> +                     0x49);
> +
> +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2),
> +                     "pca9546", 0x70);
> +    /* It expects a TMP112 but a TMP105 is compatible */
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0), TYPE_TMP105,
> +                     0x4a);
> +
> +    /* It expects a ds3232 but a ds1338 is good enough */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "ds1338", 0x68);
> +
> +    /* It expects a pca9555 but a pca9552 is compatible */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_PCA9552,
> +                     0x20);
> +}
> +
>   static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -1082,6 +1134,24 @@ static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> +static void aspeed_machine_fp5280g2_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Inspur FP5280G2 BMC (ARM1176)";
> +    amc->soc_name  = "ast2500-a1";
> +    amc->hw_strap1 = FP5280G2_BMC_HW_STRAP1;
> +    amc->fmc_model = "n25q512a";
> +    amc->spi_model = "mx25l25635e";
> +    amc->num_cs    = 2;
> +    amc->macs_mask  = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
> +    amc->i2c_init  = fp5280g2_bmc_i2c_init;
> +    mc->default_ram_size = 512 * MiB;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>   static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1146,6 +1216,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("g220a-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_g220a_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_fp5280g2_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("quanta-q71l-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
> 


