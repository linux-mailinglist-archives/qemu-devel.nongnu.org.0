Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0B5823DF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:09:55 +0200 (CEST)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdzG-0008Oz-4F
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oGdvo-0005mB-Qv; Wed, 27 Jul 2022 06:06:21 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:45221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oGdvm-00014i-0u; Wed, 27 Jul 2022 06:06:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.192])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 02B5511AA13AA;
 Wed, 27 Jul 2022 12:06:13 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 27 Jul
 2022 12:06:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00469e61e53-652a-4331-90e8-38b25b7e1b70,
 E44A067E472E6C720F6619EB00F9B7C009C32E64) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <69fc7600-052b-a077-27b0-da5751ca3379@kaod.org>
Date: Wed, 27 Jul 2022 12:05:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/9] aspeed: Add AST2600 (BMC) to fby35
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220705191400.41632-1-peter@pjd.dev>
 <20220705191400.41632-7-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220705191400.41632-7-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 08e4de2a-a86f-4ae3-8694-cdb0fe5a2457
X-Ovh-Tracer-Id: 1011058119300582182
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduvddgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffgefgkeevvedvvdffleefheelfffhhfetgeekudeuveffffekjeeiveffledthfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/22 21:13, Peter Delevoryas wrote:
> You can test booting the BMC with both '-device loader' and '-drive
> file'. This is necessary because of how the fb-openbmc boot sequence
> works (jump to 0x20000000 after U-Boot SPL).
> 
>      wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
>      qemu-system-arm -machine fby35 -nographic \
>          -device loader,file=fby35.mtd,addr=0,cpu-num=0 -drive file=fby35.mtd,format=raw,if=mtd
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/arm/fby35.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> index 03b458584c..5c5224d374 100644
> --- a/hw/arm/fby35.c
> +++ b/hw/arm/fby35.c
> @@ -6,17 +6,55 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qapi/error.h"
> +#include "sysemu/sysemu.h"
>   #include "hw/boards.h"
> +#include "hw/arm/aspeed_soc.h"
>   
>   #define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
>   OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
>   
>   struct Fby35State {
>       MachineState parent_obj;
> +
> +    MemoryRegion bmc_memory;
> +    MemoryRegion bmc_dram;
> +    MemoryRegion bmc_boot_rom;
> +
> +    AspeedSoCState bmc;
>   };
>   
> +#define FBY35_BMC_RAM_SIZE (2 * GiB)
> +
> +static void fby35_bmc_init(Fby35State *s)
> +{
> +    memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
> +    memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
> +                           FBY35_BMC_RAM_SIZE, &error_abort);

A MachineState object is used as a owner of the RAM region and this
should assert in memory_region_init_ram() :

     /* This will assert if owner is neither NULL nor a DeviceState.
      * We only want the owner here for the purposes of defining a
      * unique name for migration. TODO: Ideally we should implement
      * a naming scheme for Objects which are not DeviceStates, in
      * which case we can relax this restriction.
      */
     owner_dev = DEVICE(owner);

It went unnoticed until I started experimenting with some MachineState
modifications. CONFIG_QOM_CAST_DEBUG needs to be defined to catch the
error. I would have thought that CI was doing this check. It seems not,
which is surprising.

Anyhow, this needs a fix for 7.1 and I will work on it.

C.

> +
> +    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
> +    object_property_set_int(OBJECT(&s->bmc), "ram-size", FBY35_BMC_RAM_SIZE,
> +                            &error_abort);
> +    object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_memory),
> +                             &error_abort);
> +    object_property_set_link(OBJECT(&s->bmc), "dram", OBJECT(&s->bmc_dram),
> +                             &error_abort);
> +    object_property_set_int(OBJECT(&s->bmc), "hw-strap1", 0x000000C0,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(&s->bmc), "hw-strap2", 0x00000003,
> +                            &error_abort);
> +    aspeed_soc_uart_set_chr(&s->bmc, ASPEED_DEV_UART5, serial_hd(0));
> +    qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
> +
> +    aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
> +}
> +
>   static void fby35_init(MachineState *machine)
>   {
> +    Fby35State *s = FBY35(machine);
> +
> +    fby35_bmc_init(s);
>   }
>   
>   static void fby35_class_init(ObjectClass *oc, void *data)
> @@ -25,6 +63,9 @@ static void fby35_class_init(ObjectClass *oc, void *data)
>   
>       mc->desc = "Meta Platforms fby35";
>       mc->init = fby35_init;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
>   }
>   
>   static const TypeInfo fby35_types[] = {


