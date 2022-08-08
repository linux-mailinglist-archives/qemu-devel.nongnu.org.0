Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0158C3E2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 09:18:45 +0200 (CEST)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKx2A-0002rv-MJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 03:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oKwxa-0000uQ-Oo
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 03:13:59 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:43169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oKwxY-0002pr-9s
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 03:13:58 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3B0C311D4AEDE;
 Mon,  8 Aug 2022 09:13:48 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 09:13:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005cc0263df-b253-4d1b-8dff-b6c4be9f3ace,
 014009DFAA8B86078D729D00C01D9476BEEC0396) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <13e63a36-dbc4-cf4c-93d0-b2cf8af2d538@kaod.org>
Date: Mon, 8 Aug 2022 09:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v2 09/20] hw/ppc: set machine->fdt in pnv_reset()
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <alistair.francis@wdc.com>, <david@gibson.dropbear.id.au>, Frederic Barrat
 <fbarrat@linux.ibm.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-10-danielhb413@gmail.com>
 <1312fa72-d742-5528-714f-f1e5d30a9e59@kaod.org>
In-Reply-To: <1312fa72-d742-5528-714f-f1e5d30a9e59@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e31ae5de-6011-4d31-ba44-e7b7acd69cd2
X-Ovh-Tracer-Id: 13234953408000527267
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefjedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvvehfjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieejheeiveeuledthfehheeltedtgfetkeevgffguedujefgfeejgfetueelleegnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
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

On 8/8/22 08:47, Cédric Le Goater wrote:
> On 8/5/22 11:39, Daniel Henrique Barboza wrote:
>> This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
>> all powernv machines.
> 
> I might have missed some emails but dumpdtb is already suppported :
> commit 8d4092614161 ("ppc/pnv: activate the "dumpdtb" option on the
> powernv machine")

ok. found the patchset "QMP/HMP: add 'dumpdtb' and 'info fdt' commands"

'info fdt' would have been of great help when we were developing the
PowerNV machine. Initially, I was even using pmemsave to extract the
FDT blob ... So this is a great idea ! (which needs a g_free() )

Do we have something similar to dump ACPI tables, btw ?

Thanks,
  
C.


>>
>> Cc: Cédric Le Goater <clg@kaod.org>
>> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/pnv.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index d3f77c8367..f5162f8b7b 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -608,7 +608,11 @@ static void pnv_reset(MachineState *machine)
>>       qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>>       cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
>> -    g_free(fdt);
>> +    /*
>> +     * Update the machine->fdt pointer to enable support for
>> +     * 'dumpdtb' and 'info fdt' commands.
>> +     */
>> +    machine->fdt = fdt;
>>   }
>>   static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
> 


