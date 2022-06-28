Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB87A55BEF2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:03:14 +0200 (CEST)
Received: from localhost ([::1]:39552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65Fh-00029H-QI
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o63M3-0005HS-7E
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 01:01:39 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o63M0-0000zt-1u
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 01:01:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4D17D24B60;
 Tue, 28 Jun 2022 05:01:31 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 07:01:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00125de806b-0c1c-439f-a5fd-f30486f6647c,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ca9813f5-50f6-4391-8ec9-824d38b697d0@kaod.org>
Date: Tue, 28 Jun 2022 07:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 8/8] aspeed: Add AST2600 (BMC) to fby35
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-9-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624003701.1363500-9-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5ad385bf-4158-4ece-a2a0-f3df997218c1
X-Ovh-Tracer-Id: 10028108998342052832
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedgledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> You can test booting the BMC with both '-device loader' and '-drive
> file'. This is necessary because of how the fb-openbmc boot sequence
> works (jump to 0x20000000 after U-Boot SPL).
>
> 
>      wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
>      qemu-system-arm -machine fby35 -nographic \
>          -device loader,file=fby35.mtd,addr=0,cpu-num=0 -drive file=fby35.mtd,format=raw,if=mtd
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>   hw/arm/fby35.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> index dc1ae8e62a..1e24cbf3f8 100644
> --- a/hw/arm/fby35.c
> +++ b/hw/arm/fby35.c
> @@ -21,17 +21,53 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qapi/error.h"
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
> +static void fby35_bmc_init(Fby35State *s)
> +{
> +    uint32_t boot_rom_size;
> +
> +    memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
> +    memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram", 2 * GiB, &error_abort);
> +
> +    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
> +    object_property_set_int(OBJECT(&s->bmc), "ram-size", s->bmc_dram.size, &error_abort);

This fails to compile on some platforms :

./hw/arm/fby35.c: In function ‘fby35_bmc_init’:
../hw/arm/fby35.c:50:69: error: incompatible type for argument 3 of ‘object_property_set_int’
    50 |     object_property_set_int(OBJECT(&s->bmc), "ram-size", s->bmc_dram.size, &error_abort);
       |                                                          ~~~~~~~~~~~^~~~~
       |                                                                     |
       |                                                                     Int128
In file included from /builds/legoater/qemu/include/exec/memory.h:28,
                  from /builds/legoater/qemu/include/hw/boards.h:6,
                  from ../hw/arm/fby35.c:26:
/builds/legoater/qemu/include/qom/object.h:1342:38: note: expected ‘int64_t’ {aka ‘long long int’} but argument is of type ‘Int128’
  1342 |                              int64_t value, Error **errp);
       |                              ~~~~~~~~^~~~~


You don't need to resend the patches 1-7. I have pulled them in my branch
for the next PR.

> +    object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_memory), &error_abort);
> +    object_property_set_link(OBJECT(&s->bmc), "dram", OBJECT(&s->bmc_dram), &error_abort);
> +    object_property_set_int(OBJECT(&s->bmc), "hw-strap1", 0x000000C0, &error_abort);
> +    object_property_set_int(OBJECT(&s->bmc), "hw-strap2", 0x00000003, &error_abort);

We could share common definitions with the BMC machine in .h file.

> +    object_property_set_int(OBJECT(&s->bmc), "uart-default", ASPEED_DEV_UART5, &error_abort);
> +    qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
> +
> +    boot_rom_size = ASPEED_SMC_GET_CLASS(&s->bmc.fmc)->segments[0].size;
> +
> +    memory_region_init_rom(&s->bmc_boot_rom, OBJECT(s), "bmc-boot-rom", boot_rom_size, &error_abort);
> +    memory_region_add_subregion(&s->bmc_memory, 0, &s->bmc_boot_rom);
> +
> +    aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);

I am not totally convinced with the ROM because it complexifies how the
machine is started but I haven't tried the other way using the loader
either. It is my TODO list.

Thanks,

C.
  

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
> @@ -40,6 +76,9 @@ static void fby35_class_init(ObjectClass *oc, void *data)
>   
>       mc->desc = "Meta Platforms fby35";
>       mc->init = fby35_init;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
>   }
>   
>   static const TypeInfo fby35_types[] = {


