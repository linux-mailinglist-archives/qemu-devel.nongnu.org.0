Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A51C46B92D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:30:54 +0100 (CET)
Received: from localhost ([::1]:37926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXkL-0003kX-Hc
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:30:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXij-0002AN-CV
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:29:13 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:45073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXig-0003fl-Jq
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:29:13 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9B5FF20838;
 Tue,  7 Dec 2021 10:29:08 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 11:29:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00365d85165-15af-49af-baaa-10fe81258f1f,
 EDCC1E77E28A65BD51DFCD2B92BF934EEA10E5FB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ef28793c-14aa-2218-99e0-d7f732061de5@kaod.org>
Date: Tue, 7 Dec 2021 11:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 12/14] ppc/pnv: Remove "system-memory" property for he
 PHB4 PEC model
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-13-clg@kaod.org>
 <37a13a84-8e5c-7115-20b9-b23305a6bbd4@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <37a13a84-8e5c-7115-20b9-b23305a6bbd4@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2e25f5c8-f238-455e-a390-d90b18f1ecaa
X-Ovh-Tracer-Id: 3995818773404814243
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeehgddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 11:08, Frederic Barrat wrote:
> 
> 
> On 02/12/2021 15:42, Cédric Le Goater wrote:
>> This is not useful and will be in the way for support of user created
>> PHB4 devices.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> 
> I doubt I see all the implications here, 

It is good practice to avoid statics in models or calls like
get_system_memory() or qdev_get_machine(). With dynamic models,
it becomes more complex.

Thanks,

C.

> but it doesn't look wrong to me, so:
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
>    Fred
> 
> 
>>   hw/pci-host/pnv_phb4_pec.c | 6 +-----
>>   hw/ppc/pnv.c               | 2 --
>>   2 files changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index a7dd4173d598..dfed2af0f7df 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -124,7 +124,7 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
>>   static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>>   {
>>       PnvPhb4PecState *pec = stack->pec;
>> -    MemoryRegion *sysmem = pec->system_memory;
>> +    MemoryRegion *sysmem = get_system_memory();
>>       uint64_t bar_en = stack->nest_regs[PEC_NEST_STK_BAR_EN];
>>       uint64_t bar, mask, size;
>>       char name[64];
>> @@ -394,8 +394,6 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>>       char name[64];
>>       int i;
>> -    assert(pec->system_memory);
>> -
>>       if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
>>           error_setg(errp, "invalid PEC index: %d", pec->index);
>>           return;
>> @@ -486,8 +484,6 @@ static Property pnv_pec_properties[] = {
>>           DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
>>           DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
>>                            PnvChip *),
>> -        DEFINE_PROP_LINK("system-memory", PnvPhb4PecState, system_memory,
>> -                     TYPE_MEMORY_REGION, MemoryRegion *),
>>           DEFINE_PROP_END_OF_LIST(),
>>   };
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index f8b0b2a28383..3a550eed0f36 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1383,8 +1383,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>>                                   &error_fatal);
>>           object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
>>                                    &error_fatal);
>> -        object_property_set_link(OBJECT(pec), "system-memory",
>> -                                 OBJECT(get_system_memory()), &error_abort);
>>           if (!qdev_realize(DEVICE(pec), NULL, errp)) {
>>               return;
>>           }
>>


