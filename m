Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B34B58C99D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:40:28 +0200 (CEST)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2zb-0001p9-5z
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL2xz-0000DL-Hf
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:38:47 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:46849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL2xu-0000Lw-U7
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:38:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2709B213F5;
 Mon,  8 Aug 2022 13:38:37 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 15:38:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a06b2d43-106c-4036-9d3b-db11af31198c,
 014009DFAA8B86078D729D00C01D9476BEEC0396) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c9582419-1aeb-dd2a-63d8-f6705e263b46@kaod.org>
Date: Mon, 8 Aug 2022 15:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 04/22] ppc/ppc405: Move SRAM under the ref405ep machine
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-5-clg@kaod.org>
 <8110c8fc-6638-6b51-a3c4-508870dea3d4@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8110c8fc-6638-6b51-a3c4-508870dea3d4@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a70fa7b2-7cb3-4bfc-93cc-b62c36936537
X-Ovh-Tracer-Id: 1287185072661171107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/22 14:25, BALATON Zoltan wrote:
> On Mon, 8 Aug 2022, Cédric Le Goater wrote:
>> It doesn't belong to the generic machine nor the SoC.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405_boards.c | 13 +++++++------
>> 1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index f4794ba40ce6..c6fa559b03d9 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -235,7 +235,6 @@ static void ppc405_init(MachineState *machine)
>>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>>     const char *kernel_filename = machine->kernel_filename;
>>     PowerPCCPU *cpu;
>> -    MemoryRegion *sram = g_new(MemoryRegion, 1);
>>     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
>>     hwaddr ram_bases[2], ram_sizes[2];
>>     MemoryRegion *sysmem = get_system_memory();
>> @@ -260,11 +259,6 @@ static void ppc405_init(MachineState *machine)
>>     cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
>>                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>>
>> -    /* allocate SRAM */
>> -    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
>> -                           &error_fatal);
>> -    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
>> -
>>     /* allocate and load BIOS */
>>     if (machine->firmware) {
>>         MemoryRegion *bios = g_new(MemoryRegion, 1);
>> @@ -328,9 +322,16 @@ static void ref405ep_init(MachineState *machine)
>> {
>>     DeviceState *dev;
>>     SysBusDevice *s;
>> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
>> +    MemoryRegion *sysmem = get_system_memory();
> 
> You could drop thi "system" local and just use get_system_memory() in add_subregion

Yes. Let's drop it.

Thanks,

C.

> 
>>     ppc405_init(machine);
>>
>> +    /* allocate SRAM */
>> +    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
>> +                           &error_fatal);
>> +    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
>> +
>>     /* Register FPGA */
>>     ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
> 
> or use it everywhere consistently.
> 
> Regards,
> BALATON Zoltan
> 
>>     /* Register NVRAM */
>>


