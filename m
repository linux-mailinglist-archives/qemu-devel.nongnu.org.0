Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5F34BB3EE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:11:10 +0100 (CET)
Received: from localhost ([::1]:59934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKyM8-0003d6-RW
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:11:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKyKX-0002kB-6V
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:09:30 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:37951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKyKC-0007Xf-CI
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:09:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 90FE5231FC;
 Fri, 18 Feb 2022 08:09:04 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Feb
 2022 09:09:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00285d26a04-92a2-4f89-86cc-a5fad62ba93f,
 07432D932CF505C4D002BA4105FABD7408393EAD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <db222e82-3474-dca7-7f00-40e3d1bceb91@kaod.org>
Date: Fri, 18 Feb 2022 09:09:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] arm: Remove swift-bmc machine
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20220217103141.385345-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220217103141.385345-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a5862fc5-154f-4e89-a791-d8dda47d8744
X-Ovh-Tracer-Id: 6061845099494476707
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeelgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 11:31, Joel Stanley wrote:
> It was scheduled for removal in 7.0.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> --
> v2: also remove from docs/about/deprecated.rst
> v3: remove strap define, add note to removed-features.rst
> ---
>   docs/about/deprecated.rst       |  7 ----
>   docs/about/removed-features.rst |  5 +++
>   docs/system/arm/aspeed.rst      |  1 -
>   hw/arm/aspeed.c                 | 64 ---------------------------------
>   4 files changed, 5 insertions(+), 72 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 26d00812ba94..85773db631c1 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -315,13 +315,6 @@ Use the more generic event ``DEVICE_UNPLUG_GUEST_ERROR`` instead.
>   System emulator machines
>   ------------------------
>   
> -Aspeed ``swift-bmc`` machine (since 6.1)
> -''''''''''''''''''''''''''''''''''''''''
> -
> -This machine is deprecated because we have enough AST2500 based OpenPOWER
> -machines. It can be easily replaced by the ``witherspoon-bmc`` or the
> -``romulus-bmc`` machines.
> -
>   PPC 405 ``taihu`` machine (since 7.0)
>   '''''''''''''''''''''''''''''''''''''
>   
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index cb0575fd4975..4b831ea29176 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -588,6 +588,11 @@ The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
>   to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
>   machines have been renamed ``raspi2b`` and ``raspi3b``.
>   
> +Aspeed ``swift-bmc`` machine (removed in 7.0)
> +'''''''''''''''''''''''''''''''''''''''''''''
> +
> +This machine was removed because it was unused. Alternative AST2500 based
> +OpenPOWER machines are ``witherspoon-bmc`` and ``romulus-bmc``.
>   
>   linux-user mode CPUs
>   --------------------
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index d8b102fa0ad0..60ed94f18759 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -22,7 +22,6 @@ AST2500 SoC based machines :
>   - ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
>   - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
>   - ``sonorapass-bmc``       OCP SonoraPass BMC
> -- ``swift-bmc``            OpenPOWER Swift BMC POWER9 (to be removed in v7.0)
>   - ``fp5280g2-bmc``         Inspur FP5280G2 BMC
>   - ``g220a-bmc``            Bytedance G220A BMC
>   
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index d911dc904fb3..faf7a9fd6863 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -106,17 +106,6 @@ struct AspeedMachineState {
>           SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
>           SCU_AST2500_HW_STRAP_RESERVED1)
>   
> -/* Swift hardware value: 0xF11AD206 */
> -#define SWIFT_BMC_HW_STRAP1 (                                           \
> -        AST2500_HW_STRAP1_DEFAULTS |                                    \
> -        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
> -        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
> -        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
> -        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
> -        SCU_H_PLL_BYPASS_EN |                                           \
> -        SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
> -        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
> -
>   #define G220A_BMC_HW_STRAP1 (                                      \
>           SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
>           SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
> @@ -544,35 +533,6 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
>   }
>   
> -static void swift_bmc_i2c_init(AspeedMachineState *bmc)
> -{
> -    AspeedSoCState *soc = &bmc->soc;
> -
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552", 0x60);
> -
> -    /* The swift board expects a TMP275 but a TMP105 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "tmp105", 0x48);
> -    /* The swift board expects a pca9551 but a pca9552 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552", 0x60);
> -
> -    /* The swift board expects an Epson RX8900 RTC but a ds1338 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "ds1338", 0x32);
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x60);
> -
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
> -    /* The swift board expects a pca9539 but a pca9552 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "pca9552", 0x74);
> -
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
> -    /* The swift board expects a pca9539 but a pca9552 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "pca9552",
> -                     0x74);
> -
> -    /* The swift board expects a TMP275 but a TMP105 is compatible */
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x48);
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x4a);
> -}
> -
>   static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -1102,26 +1062,6 @@ static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> -static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc = MACHINE_CLASS(oc);
> -    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> -
> -    mc->desc       = "OpenPOWER Swift BMC (ARM1176)";
> -    amc->soc_name  = "ast2500-a1";
> -    amc->hw_strap1 = SWIFT_BMC_HW_STRAP1;
> -    amc->fmc_model = "mx66l1g45g";
> -    amc->spi_model = "mx66l1g45g";
> -    amc->num_cs    = 2;
> -    amc->i2c_init  = swift_bmc_i2c_init;
> -    mc->default_ram_size       = 512 * MiB;
> -    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> -        aspeed_soc_num_cpus(amc->soc_name);
> -
> -    mc->deprecation_reason = "redundant system. Please use a similar "
> -        "OpenPOWER BMC, Witherspoon or Romulus.";
> -};
> -
>   static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1277,10 +1217,6 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("romulus-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_romulus_class_init,
> -    }, {
> -        .name          = MACHINE_TYPE_NAME("swift-bmc"),
> -        .parent        = TYPE_ASPEED_MACHINE,
> -        .class_init    = aspeed_machine_swift_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("sonorapass-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,


