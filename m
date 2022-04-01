Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB68E4EEA08
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:56:15 +0200 (CEST)
Received: from localhost ([::1]:32966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naD4o-0008Q0-PN
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:56:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1naCwA-0007mN-IJ
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:47:18 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:46693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1naCw8-0002Hw-8G
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:47:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B21EE207F9;
 Fri,  1 Apr 2022 08:47:11 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Apr
 2022 10:47:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003d7d9c958-51e4-4a36-a220-dd7c1a09a9f3,
 BF19997ACFFB9775C4837E30A1DE169AA6CF9E32) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <66be2d94-2092-a8fa-f107-c5beee17baa1@kaod.org>
Date: Fri, 1 Apr 2022 10:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 8/9] aspeed: Add an AST1030 eval board
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
 <20220401083850.15266-9-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220401083850.15266-9-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b8db2d3c-71cd-42d5-b6f9-110388df36a7
X-Ovh-Tracer-Id: 13550768330510011323
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 10:38, Jamin Lin wrote:
> The image should be supplied with ELF binary.
> $ qemu-system-arm -M ast1030-evb -kernel zephyr.elf -nographic
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index d205384d98..4e27060324 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -24,6 +24,7 @@
>   #include "hw/loader.h"
>   #include "qemu/error-report.h"
>   #include "qemu/units.h"
> +#include "hw/qdev-clock.h"
>   
>   static struct arm_boot_info aspeed_board_binfo = {
>       .board_id = -1, /* device-tree-only board */
> @@ -1292,6 +1293,67 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   }
>   
> +#define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
> +/* Main SYSCLK frequency in Hz (200MHz) */
> +#define SYSCLK_FRQ 200000000ULL
> +
> +static void aspeed_minibmc_machine_init(MachineState *machine)
> +{
> +    AspeedMachineState *bmc = ASPEED_MACHINE(machine);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
> +    Clock *sysclk;
> +
> +    sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(sysclk, SYSCLK_FRQ);
> +
> +    object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
> +    qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
> +
> +    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
> +                         amc->uart_default);
> +    qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
> +
> +    aspeed_board_init_flashes(&bmc->soc.fmc,
> +                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
> +                              amc->num_cs,
> +                              0);
> +
> +    aspeed_board_init_flashes(&bmc->soc.spi[0],
> +                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
> +                              amc->num_cs, amc->num_cs);
> +
> +    aspeed_board_init_flashes(&bmc->soc.spi[1],
> +                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
> +                              amc->num_cs, (amc->num_cs * 2));
> +
> +    if (amc->i2c_init) {
> +        amc->i2c_init(bmc);
> +    }
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu),
> +                       machine->kernel_filename,
> +                       AST1030_INTERNAL_FLASH_SIZE);
> +}
> +
> +static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
> +                                                          void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc = "Aspeed AST1030 MiniBMC (Cortex-M4)";
> +    amc->soc_name = "ast1030-a1";
> +    amc->hw_strap1 = 0;
> +    amc->hw_strap2 = 0;
> +    mc->init = aspeed_minibmc_machine_init;
> +    mc->default_ram_size = 0;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
> +    amc->fmc_model = "sst25vf032b";
> +    amc->spi_model = "sst25vf032b";
> +    amc->num_cs = 2;
> +    amc->macs_mask = 0;
> +}
> +
>   static const TypeInfo aspeed_machine_types[] = {
>       {
>           .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -1349,6 +1411,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("bletchley-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_bletchley_class_init,
> +    }, {
> +        .name           = MACHINE_TYPE_NAME("ast1030-evb"),
> +        .parent         = TYPE_ASPEED_MACHINE,
> +        .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
>       }, {
>           .name          = TYPE_ASPEED_MACHINE,
>           .parent        = TYPE_MACHINE,


