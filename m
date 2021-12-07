Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E45F46B888
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:12:32 +0100 (CET)
Received: from localhost ([::1]:53572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXSZ-0000iZ-Bx
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXRC-0007St-Qd
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:11:06 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXR9-0003UG-29
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:11:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.26])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AB7A32187C;
 Tue,  7 Dec 2021 10:11:00 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 11:11:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00363037a62-e16b-48c2-962a-34195e693ef7,
 EDCC1E77E28A65BD51DFCD2B92BF934EEA10E5FB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <32407b4c-e885-f897-213e-37843dfc2eaf@kaod.org>
Date: Tue, 7 Dec 2021 11:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 01/14] ppc/pnv: Reduce the maximum of PHB3 devices
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-2-clg@kaod.org>
 <8e7e89cd-f8dd-00fd-8aca-1a8e2d40027a@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8e7e89cd-f8dd-00fd-8aca-1a8e2d40027a@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6e0840ee-16ce-4d94-bb4a-a4775ac8631f
X-Ovh-Tracer-Id: 3689573994916973475
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeehgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
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

On 12/7/21 10:40, Frederic Barrat wrote:
> 
> 
> On 02/12/2021 15:42, Cédric Le Goater wrote:
>> All POWER8 machines have a maximum of 3 PHB3 devices. Adapt the
>> PNV8_CHIP_PHB3_MAX definition for consistency.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> 
> The Naples chip (Garrison) can have 4 PHBs and it seems we have a power8nvl machine type for it. So I guess we should keep a max PHB count of 4 there.

Ah yes. This is the reason behind the 4. I should update the power8nvl
chip then.

Thanks,

C.

> 
>    Fred
> 
> 
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


