Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61BE58C932
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:14:48 +0200 (CEST)
Received: from localhost ([::1]:56260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2al-0002xR-Br
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL2Ws-0006vR-R9
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:10:46 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:46017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL2Wq-0004MX-Eu
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:10:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.62])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 81EE42179E;
 Mon,  8 Aug 2022 13:10:40 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 15:10:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0021c08359c-f9ce-44b0-9ee6-36d44bbbe6a4,
 014009DFAA8B86078D729D00C01D9476BEEC0396) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <db56128c-4e25-5c23-97a4-c9a8a2fa0f49@kaod.org>
Date: Mon, 8 Aug 2022 15:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 00/22] ppc: QOM'ify 405 board
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220808102734.133084-1-clg@kaod.org>
 <65dff991-cf15-75e9-8cb-d55e72ae5560@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <65dff991-cf15-75e9-8cb-d55e72ae5560@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 014adbe5-f6fb-4c91-b251-b1a8faae936d
X-Ovh-Tracer-Id: 815151536807906211
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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

On 8/8/22 14:16, BALATON Zoltan wrote:
> On Mon, 8 Aug 2022, Cédric Le Goater wrote:
>> Hello,
>>
>> Here is large series QOM'ifying the PPC405 board. It introduces a new
>> generic machine and SoC models, converts the current device models to
>> QOM and populates the SoC. The process is quite mechanical without too
>> much issues to handle. The noisy part is the initial patch introducing
>> the SoC realize routine.
>>
>> What's left ?
>>
>> * the SDRAM mappings are very baroque and certainly could be simplified.
>>  I think we should QOMify the ppc440 machines before addressing this
>>  part.
> 
> The issue with SDRAM controller and the likely reason why its model looks so complex is that it can't handle any RAM size because of how the bank sizes are encoded in the registers so it only really supports real RAM modules which are predefined sizes. Also the firmware discovers RAM by looking at SPD data and may only check the slots that the real hardware has which may not be the first one. 
>
> Previously I had code to round down the memory size specified on the command line to an acceptable size and issue a warning to let the user know but this was dropped because of some changes in code elsewhere which now allocates memory before the machine could check and ajust it so we can only adjust it by wasting some. 

I don't think we should care adjusting the values. the machine init
routine should check that the RAM size is valid or fail. The machine
should also have a sane RAM size value by default.

See how the aspeed machine deals with similar constraints of its SDRAM
controller in aspeed_machine_init(). If the sdram controller does not
validate the RAM size, aspeed_sdmc_set_ram_size() fails with an error.

C.

> Take this into account and check the ppc4xx_sdram_banks() function and 440 machines before changing this.
> 
> Regards,
> BALATON Zoltan
> 
> 
>> Thanks,
>>
>> C.
>>
>> Changes in v3 :
>>
>> - New device model Ppc4xxDcrDeviceState
>> - Removal of ppc4xx_mal_init(), ppc4xx_plb_init() and ppc405_ebc_init()
>> - Fixes for some reset issues
>> - Kept 2 RAM banks at the Soc level but only one is initialized.
>> - Moved SRAM under the machine. It's not part of the SoC according
>>   to the 405 specs
>>
>> Changes in v2 :
>>
>> - docs/about/removed-features.rst update
>> - Fix compile breakage (uic)
>> - Fix CPU reset, which breaking u-boot boot
>> - Changed prefix of memory regions to "ppc405"
>> - Reduced the number of RAM banks to 1. Second was a dummy one to
>>   please ppc405ep_init()
>>
>> Cédric Le Goater (22):
>>  ppc/ppc405: Remove taihu machine
>>  ppc/ppc405: Introduce a PPC405 generic machine
>>  ppc/ppc405: Move devices under the ref405ep machine
>>  ppc/ppc405: Move SRAM under the ref405ep machine
>>  ppc/ppc405: Introduce a PPC405 SoC
>>  ppc/ppc405: Start QOMification of the SoC
>>  ppc/ppc405: QOM'ify CPU
>>  ppc/ppc4xx: Introduce a DCR device model
>>  ppc/ppc405: QOM'ify CPC
>>  ppc/ppc405: QOM'ify GPT
>>  ppc/ppc405: QOM'ify OCM
>>  ppc/ppc405: QOM'ify GPIO
>>  ppc/ppc405: QOM'ify DMA
>>  ppc/ppc405: QOM'ify EBC
>>  ppc/ppc405: QOM'ify OPBA
>>  ppc/ppc405: QOM'ify POB
>>  ppc/ppc405: QOM'ify PLB
>>  ppc/ppc405: QOM'ify MAL
>>  ppc/ppc405: QOM'ify FPGA
>>  ppc/ppc405: Use an explicit PPCUIC object
>>  ppc/ppc405: Use an explicit I2C object
>>  ppc/ppc4xx: Fix sdram trace events
>>
>> docs/about/deprecated.rst       |   9 -
>> docs/about/removed-features.rst |   6 +
>> docs/system/ppc/embedded.rst    |   1 -
>> hw/ppc/ppc405.h                 | 198 +++++++-
>> include/hw/ppc/ppc4xx.h         |  48 +-
>> hw/ppc/ppc405_boards.c          | 375 ++++-----------
>> hw/ppc/ppc405_uc.c              | 828 +++++++++++++++++---------------
>> hw/ppc/ppc4xx_devs.c            | 184 ++++---
>> hw/ppc/sam460ex.c               |  24 +-
>> MAINTAINERS                     |   2 +-
>> 10 files changed, 903 insertions(+), 772 deletions(-)
>>
>>


