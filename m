Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D953362727
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:47:53 +0200 (CEST)
Received: from localhost ([::1]:39076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSZM-0003WM-AG
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lXRWT-0000Cq-Sw; Fri, 16 Apr 2021 12:40:50 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:60845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lXRWL-0006Yn-06; Fri, 16 Apr 2021 12:40:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 37CBE9AD5B91;
 Fri, 16 Apr 2021 18:40:36 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Apr
 2021 18:40:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b11849c2-2740-452e-9983-4ab8ddb79c9f,
 98643AE5B40D77660504470F9E4DE59E1F602129) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] aspeed: Add support for the quanta-q7l1-bmc board
To: Patrick Venture <venture@google.com>, <peter.maydell@linaro.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>
References: <20210416162426.3217033-1-venture@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4e5592b1-ea5b-0ef6-c837-1c7ac1476696@kaod.org>
Date: Fri, 16 Apr 2021 18:40:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416162426.3217033-1-venture@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c1b53316-44f5-4c77-8917-19b5c97873be
X-Ovh-Tracer-Id: 13692068769463503721
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelhedguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehvvghnthhurhgvsehgohhoghhlvgdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patrick,

On 4/16/21 6:24 PM, Patrick Venture wrote:
> The Quanta-Q71l BMC board is a board supported by OpenBMC.
> 
> Tested: Booted quanta-q71l firmware.
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

This looks good. 

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Some comments below, 


> ---
>  hw/arm/aspeed.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a17b75f494..4611996d21 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -138,6 +138,19 @@ struct AspeedMachineState {
>  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
>  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>  
> +/* Quanta-Q71l hardware value */
> +#define QUANTA_Q71L_BMC_HW_STRAP1 (                                     \
> +        SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_128MB) |               \
> +        SCU_AST2400_HW_STRAP_DRAM_CONFIG(2/* DDR3 with CL=6, CWL=5 */) | \
> +        SCU_AST2400_HW_STRAP_ACPI_DIS |                                 \
> +        SCU_AST2400_HW_STRAP_SET_CLK_SOURCE(AST2400_CLK_24M_IN) |       \
> +        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
> +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_PASS_THROUGH) |          \
> +        SCU_AST2400_HW_STRAP_SET_CPU_AHB_RATIO(AST2400_CPU_AHB_RATIO_2_1) | \
> +        SCU_HW_STRAP_SPI_WIDTH |                                        \
> +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_8M_DRAM) |                        \
> +        SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
> +
>  /* AST2600 evb hardware value */
>  #define AST2600_EVB_HW_STRAP1 0x000000C0
>  #define AST2600_EVB_HW_STRAP2 0x00000003
> @@ -433,6 +446,34 @@ static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
>      object_property_set_int(OBJECT(dev), "temperature3", 110000, &error_abort);
>  }
>  
> +static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    /*
> +     * The quanta-q71l platform expects tmp75s which are compatible with
> +     * tmp105s.
> +     */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4c);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4e);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4f);
> +
> +    /* TODO: i2c-1: Add baseboard FRU eeprom@54 24c64 */

Why not add the eeprom devices ? 

> +    /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
> +    /* TODO: Add Memory Riser i2c mux and eeproms. */
> +
> +    /* TODO: i2c-2: pca9546@74 */
> +    /* TODO: i2c-2: pca9548@77 */
> +    /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
> +    /* TODO: i2c-7: Add pca9546@70 */
> +    /*        - i2c@0: pmbus@59 */
> +    /*        - i2c@1: pmbus@58 */
> +    /*        - i2c@2: pmbus@58 */
> +    /*        - i2c@3: pmbus@59 */
> +    /* TODO: i2c-7: Add PDB FRU eeprom@52 */
> +    /* TODO: i2c-8: Add BMC FRU eeprom@50 */
> +}
> +
>  static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> @@ -728,6 +769,23 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
>          aspeed_soc_num_cpus(amc->soc_name);
>  };
>  
> +static void aspeed_machine_quanta_q71l_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Quanta-Q71l BMC (ARM926EJ-S)";
> +    amc->soc_name  = "ast2400-a1";
> +    amc->hw_strap1 = QUANTA_Q71L_BMC_HW_STRAP1;
> +    amc->fmc_model = "n25q256a";
> +    amc->spi_model = "mx25l25635e";
> +    amc->num_cs    = 1;
> +    amc->i2c_init  = quanta_q71l_bmc_i2c_init;
> +    mc->default_ram_size       = 128 * MiB;

I thought the board had more RAM ? 

Thanks,

C.

> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +}
> +
>  static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
>                                                          void *data)
>  {
> @@ -927,6 +985,10 @@ static const TypeInfo aspeed_machine_types[] = {
>          .name          = MACHINE_TYPE_NAME("g220a-bmc"),
>          .parent        = TYPE_ASPEED_MACHINE,
>          .class_init    = aspeed_machine_g220a_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("quanta-q71l-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_quanta_q71l_class_init,
>      }, {
>          .name          = TYPE_ASPEED_MACHINE,
>          .parent        = TYPE_MACHINE,
> 


