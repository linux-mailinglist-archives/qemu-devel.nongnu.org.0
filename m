Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3934846697D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:55:45 +0100 (CET)
Received: from localhost ([::1]:55114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqJ6-0005K1-Ac
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:55:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mspyf-0007Bd-RL; Thu, 02 Dec 2021 12:34:38 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mspyc-0004uH-8f; Thu, 02 Dec 2021 12:34:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.197])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5DC8ECF7BFA4;
 Thu,  2 Dec 2021 18:34:30 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 18:34:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00487f5e714-af66-464d-8b8e-77f1438ebe17,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3f9c6470-456e-4d51-9a32-1523c2d6441e@kaod.org>
Date: Thu, 2 Dec 2021 18:34:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 01/14] ppc/pnv: Reduce the maximum of PHB3 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-2-clg@kaod.org>
 <2c037046-f3fb-96da-c32b-b35fffb2429e@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <2c037046-f3fb-96da-c32b-b35fffb2429e@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2d5c77b9-1b4d-4f8e-bfbe-9874ae1da2b3
X-Ovh-Tracer-Id: 262897631649893283
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.3,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 18:27, Daniel Henrique Barboza wrote:
> 
> 
> On 12/2/21 11:42, Cédric Le Goater wrote:
>> All POWER8 machines have a maximum of 3 PHB3 devices. Adapt the
>> PNV8_CHIP_PHB3_MAX definition for consistency.
> 
> I suggest "3 PHB3 devices per chip" for clarity.

Fixed.

Thanks,

C.

> 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
>>   include/hw/ppc/pnv.h | 2 +-
>>   hw/ppc/pnv.c         | 6 +++---
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>> index aa08d79d24de..6f498c8f1b5f 100644
>> --- a/include/hw/ppc/pnv.h
>> +++ b/include/hw/ppc/pnv.h
>> @@ -79,7 +79,7 @@ struct Pnv8Chip {
>>       PnvOCC       occ;
>>       PnvHomer     homer;
>> -#define PNV8_CHIP_PHB3_MAX 4
>> +#define PNV8_CHIP_PHB3_MAX 3
>>       PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
>>       XICSFabric    *xics;
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 71e45515f136..bd768dcc28ad 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1256,7 +1256,7 @@ static void pnv_chip_power8e_class_init(ObjectClass *klass, void *data)
>>       k->chip_cfam_id = 0x221ef04980000000ull;  /* P8 Murano DD2.1 */
>>       k->cores_mask = POWER8E_CORE_MASK;
>> -    k->num_phbs = 3;
>> +    k->num_phbs = PNV8_CHIP_PHB3_MAX;
>>       k->core_pir = pnv_chip_core_pir_p8;
>>       k->intc_create = pnv_chip_power8_intc_create;
>>       k->intc_reset = pnv_chip_power8_intc_reset;
>> @@ -1280,7 +1280,7 @@ static void pnv_chip_power8_class_init(ObjectClass *klass, void *data)
>>       k->chip_cfam_id = 0x220ea04980000000ull; /* P8 Venice DD2.0 */
>>       k->cores_mask = POWER8_CORE_MASK;
>> -    k->num_phbs = 3;
>> +    k->num_phbs = PNV8_CHIP_PHB3_MAX;
>>       k->core_pir = pnv_chip_core_pir_p8;
>>       k->intc_create = pnv_chip_power8_intc_create;
>>       k->intc_reset = pnv_chip_power8_intc_reset;
>> @@ -1304,7 +1304,7 @@ static void pnv_chip_power8nvl_class_init(ObjectClass *klass, void *data)
>>       k->chip_cfam_id = 0x120d304980000000ull;  /* P8 Naples DD1.0 */
>>       k->cores_mask = POWER8_CORE_MASK;
>> -    k->num_phbs = 3;
>> +    k->num_phbs = PNV8_CHIP_PHB3_MAX;
>>       k->core_pir = pnv_chip_core_pir_p8;
>>       k->intc_create = pnv_chip_power8_intc_create;
>>       k->intc_reset = pnv_chip_power8_intc_reset;
>>


