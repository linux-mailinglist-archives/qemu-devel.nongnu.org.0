Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E7958E753
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 08:31:27 +0200 (CEST)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLfFV-00060B-NL
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 02:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLf99-0001t7-7o
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 02:24:51 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:56437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLf97-0000rr-Gt
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 02:24:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.98])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9985E21D0A;
 Wed, 10 Aug 2022 06:24:47 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 10 Aug
 2022 08:24:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00207573768-23c3-49cc-8115-651aa881dc2f,
 043EABA4B22CD34FCE1B70F8CBB6C707CA017DB3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f566d22f-39ed-8eb6-41a8-dc8641de87ea@kaod.org>
Date: Wed, 10 Aug 2022 08:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 24/24] ppc/ppc405: Add check on minimum RAM size
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-25-clg@kaod.org>
 <4118a946-7754-98c2-2475-68546ab773ad@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <4118a946-7754-98c2-2475-68546ab773ad@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c5347c63-dfe4-4490-9dec-2a5e192dc6a4
X-Ovh-Tracer-Id: 5705779253063027619
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeguddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
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

On 8/9/22 19:55, BALATON Zoltan wrote:
> On Tue, 9 Aug 2022, Cédric Le Goater wrote:
>> The check on invalid RAM size is now performed in the SDRAM controller
>> but not all values will boot a machine. A minimum of 2*16 is required.
> 
> 2*16 or 16 MiB? The code has the latter which does not match commit message.

Indeed. It should be 32MB below.

Thanks,

C.

> 
> Regards,
> BALATON Zoltan
> 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405_boards.c | 7 ++-----
>> 1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 4ff6715f3533..9a3fec38cce1 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -251,14 +251,11 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
>> static void ppc405_init(MachineState *machine)
>> {
>>     Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
>> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
>>     const char *kernel_filename = machine->kernel_filename;
>>     MemoryRegion *sysmem = get_system_memory();
>>
>> -    if (machine->ram_size != mc->default_ram_size) {
>> -        char *sz = size_to_str(mc->default_ram_size);
>> -        error_report("Invalid RAM size, should be %s", sz);
>> -        g_free(sz);
>> +    if (machine->ram_size < 16 * MiB) {
>> +        error_report("Not enough RAM !");
>>         exit(EXIT_FAILURE);
>>     }
>>
>>


