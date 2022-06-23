Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FFB557ECC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:44:36 +0200 (CEST)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4P0V-0005lx-7i
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4Ovm-0003en-VU
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:39:43 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:51441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4Ovh-0002WR-4L
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:39:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 7A40227577;
 Thu, 23 Jun 2022 15:39:28 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 23 Jun
 2022 17:39:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0031f79f41d-64ae-44e7-bed5-542ac9071772,
 1905447EDF4A6B95D61F03ED56167C5A36471571) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6b7975b5-754b-c2d8-a46f-93a6f1827c66@kaod.org>
Date: Thu, 23 Jun 2022 17:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 08/14] aspeed: Replace direct get_system_memory() calls
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>
CC: <andrew@aj.id.au>, <joel@jms.id.au>, <pbonzini@redhat.com>,
 <berrange@redhat.com>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
 <richard.henderson@linaro.org>, <f4bug@amsat.org>, <ani@anisinha.ca>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <kvm@vger.kernel.org>
References: <20220623102617.2164175-1-pdel@fb.com>
 <20220623102617.2164175-9-pdel@fb.com>
 <CAFEAcA9GAr=Rv9GMsnUux3_PNk1gRPBOcSyPzD9MRP5UzOZO1Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA9GAr=Rv9GMsnUux3_PNk1gRPBOcSyPzD9MRP5UzOZO1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dfb66119-dc4c-46c5-add0-9c9f6baed10d
X-Ovh-Tracer-Id: 9885401182681860926
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhhvmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
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

On 6/23/22 14:57, Peter Maydell wrote:
> On Thu, 23 Jun 2022 at 13:37, Peter Delevoryas <pdel@fb.com> wrote:
>>
>> Note: sysbus_mmio_map(), sysbus_mmio_map_overlap(), and others are still
>> using get_system_memory indirectly.
>>
>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>> ---
>>   hw/arm/aspeed.c         | 8 ++++----
>>   hw/arm/aspeed_ast10x0.c | 5 ++---
>>   hw/arm/aspeed_ast2600.c | 2 +-
>>   hw/arm/aspeed_soc.c     | 6 +++---
>>   4 files changed, 10 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 8dae155183..3aa74e88fb 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -371,7 +371,7 @@ static void aspeed_machine_init(MachineState *machine)
>>                            amc->uart_default);
>>       qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>>
>> -    memory_region_add_subregion(get_system_memory(),
>> +    memory_region_add_subregion(bmc->soc.system_memory,
>>                                   sc->memmap[ASPEED_DEV_SDRAM],
>>                                   &bmc->ram_container);
> 
> This is board code, it shouldn't be reaching into the internals
> of the SoC object like this. The board code probably already
> has the right MemoryRegion because it was the one that passed
> it to the SoC link porperty in the first place.

It's a bit messy currently. May be I got it wrong initially. The
board allocates a ram container region in which the machine ram
region is mapped. See commit ad1a9782186d ("aspeed: add a RAM memory
region container")

There is an extra region after ram in the ram container to catch
invalid access done by FW. That's how FW determines the size of
ram. See commit ebe31c0a8ef7 ("aspeed: add a max_ram_size property
to the memory controller")

But I think I can safely move all the RAM logic under the board.
I will send a patch.

Thanks,

C.

> 
> thanks
> -- PMM


