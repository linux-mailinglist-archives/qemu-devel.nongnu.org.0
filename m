Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B546B8D2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:24:28 +0100 (CET)
Received: from localhost ([::1]:52172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXe7-0002P7-W4
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:24:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXbD-0005xr-3C
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:21:27 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:54239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXbA-0007zF-Ii
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:21:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.27])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 310F120902;
 Tue,  7 Dec 2021 10:21:23 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 11:21:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004dd799a09-d77a-4744-8a41-676224721982,
 EDCC1E77E28A65BD51DFCD2B92BF934EEA10E5FB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a9af8739-464e-8261-7c8c-f26bd654e07b@kaod.org>
Date: Tue, 7 Dec 2021 11:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 08/14] ppc/pnv: Introduce version and device_id class
 atributes for PHB4 devices
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-9-clg@kaod.org>
 <3d301cf4-2130-9422-011f-c4d961539ec6@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <3d301cf4-2130-9422-011f-c4d961539ec6@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6f9a4555-8957-4fd8-abb8-0273363aa58c
X-Ovh-Tracer-Id: 3864932908635163555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeehgdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 11:01, Frederic Barrat wrote:
> 
> 
> On 02/12/2021 15:42, Cédric Le Goater wrote:
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> 
> Empty log message ok in qemu?

checkpatch didn't complain :) I might make an effort for v2.

Thanks,

C.


> But it looks ok to me.> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
> 
>>   include/hw/pci-host/pnv_phb4.h | 2 ++
>>   hw/pci-host/pnv_phb4_pec.c     | 2 ++
>>   hw/ppc/pnv.c                   | 4 ++--
>>   3 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
>> index 27556ae53425..b2864233641e 100644
>> --- a/include/hw/pci-host/pnv_phb4.h
>> +++ b/include/hw/pci-host/pnv_phb4.h
>> @@ -219,6 +219,8 @@ struct PnvPhb4PecClass {
>>       int compat_size;
>>       const char *stk_compat;
>>       int stk_compat_size;
>> +    uint64_t version;
>> +    uint64_t device_id;
>>   };
>>   #endif /* PCI_HOST_PNV_PHB4_H */
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 741ddc90ed8d..9f722729ac50 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -499,6 +499,8 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>>       pecc->compat_size = sizeof(compat);
>>       pecc->stk_compat = stk_compat;
>>       pecc->stk_compat_size = sizeof(stk_compat);
>> +    pecc->version = PNV_PHB4_VERSION;
>> +    pecc->device_id = PNV_PHB4_DEVICE_ID;
>>   }
>>   static const TypeInfo pnv_pec_type_info = {
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 185464a1d443..0c65e1e88cf5 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1408,9 +1408,9 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>>               object_property_set_int(obj, "index", phb_id, &error_fatal);
>>               object_property_set_int(obj, "chip-id", chip->chip_id,
>>                                       &error_fatal);
>> -            object_property_set_int(obj, "version", PNV_PHB4_VERSION,
>> +            object_property_set_int(obj, "version", pecc->version,
>>                                       &error_fatal);
>> -            object_property_set_int(obj, "device-id", PNV_PHB4_DEVICE_ID,
>> +            object_property_set_int(obj, "device-id", pecc->device_id,
>>                                       &error_fatal);
>>               object_property_set_link(obj, "stack", OBJECT(stack),
>>                                        &error_abort);
>>


