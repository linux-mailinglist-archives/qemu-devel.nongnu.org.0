Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A804A4346E2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:28:30 +0200 (CEST)
Received: from localhost ([::1]:35810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6xZ-0003G2-PO
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1md6wG-00027P-3s; Wed, 20 Oct 2021 04:27:09 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:50609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1md6w9-0008Mo-GM; Wed, 20 Oct 2021 04:27:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 44D8820386;
 Wed, 20 Oct 2021 08:26:57 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 10:26:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0063a189efb-6948-4089-a117-928ae1924440,
 92A7CFA44A7A8A14732DBB4BB7777608D4B8F25C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2c54310f-2800-33ac-7c47-500a24f88b8f@kaod.org>
Date: Wed, 20 Oct 2021 10:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/5] aspeed/smc: Improve support for the alternate boot
 function
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20211018132609.160008-1-clg@kaod.org>
 <DDD67A99-FA65-4671-ACE6-5D3BACE3F45A@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <DDD67A99-FA65-4671-ACE6-5D3BACE3F45A@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7baec4d8-74f6-4904-90a2-dedc32a66c49
X-Ovh-Tracer-Id: 15190923019149675369
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 06:57, Peter Delevoryas wrote:
> 
> 
>> On Oct 18, 2021, at 6:26 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Hello,
>>
>> The Aspeed SoCs have a dual boot function for firmware fail-over
>> recovery. The system auto-reboots from the second flash if the main
>> flash does not boot successfully within a certain amount of time. This
>> function is called alternate boot (ABR) in the FMC controllers.
>>
>> On the AST2600, the ABR registers controlling the 2nd watchdog timer
>> were moved from the watchdog register to the FMC controller. To
>> control WDT2 through the FMC model register set, this series creates a
>> local address space on top of WDT2 memory region.
>>
>> To test on the fuji-bmc machine, run :
>>
>>     devmem 0x1e620064
>>     devmem 0x1e78504C
>>
>>     devmem 0x1e620064 32 0xffffffff
>>     devmem 0x1e620064
>>     devmem 0x1e78504C
> 
> This looks good to me! I looked at the whole
> patch series, I think all the changes look right.
> 
> By the way, just to make sure I’m understanding correctly:
> 
> The AST2400 datasheet shows only 2 watchdog timers, and
> the first to be used as the primary system deadlock
> reset (but still reboot from the primary flash), and the
> second watchdog is designated as an alternate boot
> watchdog, which reboots from secondary flash and is
> only enabled if there’s a specific hw strap pin enabled,
> and the second watchdog is usually disabled once booting
> is successful, right?

Yes. I think WDT2 was activated in uboot on these platforms.

> The AST2600 datasheet shows there’s 8 watchdogs (but
> we only have 4 declared in QEMU? I see only the first
> four support external reset signals, maybe that’s why?)

Indeed. The datasheet also says :

   Watchdog Timer (WDT) includes 4 sets of 32-bit decrement
   counters,

which might have induced us in error :) I will include a fix
for it.

> but it doesn’t seem to say explicitly that the 2nd
> watchdog is the alternate boot watchdog, 

True. That's my assumption for the model and we could also
instantiate a new watchdog in the SMC/FMC model.

> it’s probably
> just implied that the user read the AST2400/AST2500 docs right? 

I think Aspeed is cleaning up the WDT logic by moving "exotic"
features to other controllers. that would be why some registers
of WDT1 and WDT2 are exposed in the FMC register space for 4B
detection and alternate boot :

   FMC60: FMC WDT1 Control/Status Register for Address Mode Detection
   FMC64: FMC WDT2 Control/Status Register for Alternate Boot
   FMC68: FMC WDT2 Timer Reload Value Register
   FMC6C: FMC WDT2 Timer Restart Register

and the FMC also has a new signal/pin : GPIOY6/FWSPIABR to handle ABR.
That's the most important change.


> And the FMC registers are just an alias to write
> to these watchdog 2 registers? 

If this is the same watchdog mapped into the FMC, I would say yes
and the logic generate load/stores transactions on the AHB bus.
Adding an address space for the WDT registers in the model is the
closer we can get without implementing the bus protocol.

> Just curious, is it
> strictly necessary to use the FMC registers to disable
> the alternate boot watchdog, or could you just use the
> old address, 0x1e78504C? 

Hey, this is something to try on HW and check how both register
sets evolve. Would you have time ?

> In our OpenBMC initialization
> for Fuji, we’re using the FMC registers, but would
> it still work if we used the old addresses? Just curious,
> the more I think about it, it seems odd to me that these
> FMC watchdog registers exist if they’re just an alias.

We should ask the HW designers.

> Also, I was wondering: does the alternate boot
> watchdog actually switch the flash device or flash
> region that we boot from, or does it just reboot from
> the primary partition? 

No. This is not modeled.

> I don’t see anything in
> watchdog_perform_action() that obviously indicates we’re
> actually switching to a secondary flash, so I was curious
> about that.

It is certainly feasible but it would require some thinking on
how the models interact with one another.

If a FMC_WDT2 watchdog model is owned by the SMC model, it would
be simpler. That's seem to be going in the direction of your
questions :)

> Thanks for adding this though! This is very useful, we’re
> using QEMU more and more for testing, especially the
> boot process, so more accurate emulation of this functionality
> is great.

Good. That's the goal.

> Thanks,
> Peter
> 
> Reviewed-by: Peter Delevoryas <pdel@fb.com>

It's worth checking with the HW designers before pushing anything.

Thanks,

C.


> 
>>
>> Thanks
>>
>> C.
>>
>> Changes since v2:
>>
>> - introduce a container region for the WDT2 register address space
>> - introduce a container region for the flash mmio address space
>>
>> CÃ©dric Le Goater (5):
>>   aspeed/wdt: Introduce a container for the MMIO region
>>   aspeed: Initialize the watchdog device models before the FMC models
>>   aspeed/smc: Improve support for the alternate boot function
>>   aspeed/smc: Use a container for the flash mmio address space
>>   speed/sdhci: Add trace events
>>
>> include/hw/ssi/aspeed_smc.h      |  5 +-
>> include/hw/watchdog/wdt_aspeed.h |  1 +
>> hw/arm/aspeed_ast2600.c          | 38 +++++++-------
>> hw/arm/aspeed_soc.c              | 36 ++++++-------
>> hw/sd/aspeed_sdhci.c             |  5 ++
>> hw/ssi/aspeed_smc.c              | 89 +++++++++++++++++++++++++++++---
>> hw/watchdog/wdt_aspeed.c         |  6 ++-
>> hw/sd/trace-events               |  4 ++
>> hw/ssi/trace-events              |  1 +
>> 9 files changed, 141 insertions(+), 44 deletions(-)
>>
>> -- 
>> 2.31.1
>>
>>
>>
> 


