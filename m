Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD84312A0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 10:57:39 +0200 (CEST)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOSg-0007zQ-G9
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 04:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcOQI-0006e3-Gr
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 04:55:10 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:43039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcOQF-0006kN-AL
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 04:55:10 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.44])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 157A61FFB0;
 Mon, 18 Oct 2021 08:54:53 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 10:54:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004f7323a95-aad4-4790-8c2e-f46c28792758,
 87243DFB5E7D9912E7F5CCDD2980C2FEBA95BD79) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0b06bada-4f7e-1d22-a81f-8c0241a9dcdc@kaod.org>
Date: Mon, 18 Oct 2021 10:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/4] aspeed/smc: Improve support for the alternate boot
 function
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211004154635.394258-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211004154635.394258-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f34e59e1-1df0-401a-8a3a-e985de4eb487
X-Ovh-Tracer-Id: 3917005778477091622
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphguvghlsehfsgdrtghomh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 17:46, Cédric Le Goater wrote:
> Hello,
> 
> The Aspeed SoCs have a dual boot function for firmware fail-over
> recovery. The system auto-reboots from the second flash if the main
> flash does not boot successfully within a certain amount of time. This
> function is called alternate boot (ABR) in the FMC controllers.
> 
> On the AST2600, the ABR registers controlling the 2nd watchdog timer
> were moved from the watchdog register to the FMC controller. To
> control WDT2 through the FMC model register set, this series creates a
> local address space on top of WDT2 memory region.
> 
> To test on the fuji-bmc machine, run :
> 
>      devmem 0x1e620064
>      devmem 0x1e78504C
> 
>      devmem 0x1e620064 32 0xffffffff
>      devmem 0x1e620064
>      devmem 0x1e78504C
>      
> Thanks
> 
> C.
> 
> 
> Cédric Le Goater (4):
>    aspeed/wdt: Add trace events
>    aspeed/smc: Dump address offset in trace events
>    aspeed/wdt: Add an alias for the MMIO region
>    aspeed/smc: Improve support for the alternate boot function


Andrew, Peter D., Joel,

Would you have time to tell me what you think about the last 2 patches ?
It would be a nice extension for the Fuji in QEMU 6.2.

Here are some images for tests.

   https://github.com/peterdelevoryas/openbmc/releases/download/fuji-v0.1-alpha/fuji.mtd

This one is recent :

   https://github.com/peterdelevoryas/openbmc/releases/download/fuji.mtd.0/fuji.mtd


   U-Boot 2019.04 fuji-bd6ee58668 (Sep 13 2021 - 21:29:46 +0000)
   [    0.000000] Linux version 5.10.23-fuji (oe-user@oe-host) (arm-fb-linux-gnueabi-gcc (GCC) 9.3.0, GNU ld (GNU Binutils) 2.34.0.20200220) #1 SMP Thu Sep 9 23:22:29 UTC 2021


Thanks,

C.


> 
>   include/hw/ssi/aspeed_smc.h      |  3 ++
>   include/hw/watchdog/wdt_aspeed.h |  1 +
>   hw/arm/aspeed_ast2600.c          |  2 +
>   hw/ssi/aspeed_smc.c              | 84 ++++++++++++++++++++++++++++++--
>   hw/watchdog/wdt_aspeed.c         | 20 ++++++--
>   hw/ssi/trace-events              |  1 +
>   hw/watchdog/trace-events         |  4 ++
>   7 files changed, 107 insertions(+), 8 deletions(-)
> 


