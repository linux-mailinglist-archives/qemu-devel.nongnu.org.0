Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A346B920
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:29:29 +0100 (CET)
Received: from localhost ([::1]:35370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXiy-0001xC-T8
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXZZ-0004NP-S1
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:19:47 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:54819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXZW-0007bJ-GV
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:19:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 360D320902;
 Tue,  7 Dec 2021 10:19:40 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 11:19:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004bb537f5e-5c23-4e23-b737-32732b145a07,
 EDCC1E77E28A65BD51DFCD2B92BF934EEA10E5FB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4cf7bfef-c742-7a16-5363-a61e4e8375a0@kaod.org>
Date: Tue, 7 Dec 2021 11:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 06/14] ppc/pnv: Complete user created PHB3 devices
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-7-clg@kaod.org>
 <e3c2344f-a4bd-59c6-7dff-428e2d70a120@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e3c2344f-a4bd-59c6-7dff-428e2d70a120@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8440035e-2b55-4eb2-9db8-9c964b08ff38
X-Ovh-Tracer-Id: 3835940983043558307
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeehgdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
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

On 12/7/21 10:53, Frederic Barrat wrote:
> 
> 
> On 02/12/2021 15:42, Cédric Le Goater wrote:
>> PHB3s ared SysBus devices and should be allowed to be dynamically
>> created.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> This one is a bit of black magic for me. 

Yes. QEMU internals related to sysbus. I am not an expert either.

> I don't see an equivalent for P9 though. Not needed there? 

No because the phb4-pec devices are simple devices. Not tied to sysbus.

Thanks,

C.

> I'll have another comment about P8/P9 later.
> 
>    Fred
> 
> 
>>   hw/pci-host/pnv_phb3.c | 9 +++++++++
>>   hw/ppc/pnv.c           | 2 ++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>> index e91f658b0060..b61f9c369f64 100644
>> --- a/hw/pci-host/pnv_phb3.c
>> +++ b/hw/pci-host/pnv_phb3.c
>> @@ -1000,6 +1000,9 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>>       /* User created devices */
>>       if (!phb->chip) {
>> +        Error *local_err = NULL;
>> +        BusState *s;
>> +
>>           phb->chip = pnv_get_chip(pnv, phb->chip_id);
>>           if (!phb->chip) {
>>               error_setg(errp, "invalid chip id: %d", phb->chip_id);
>> @@ -1011,6 +1014,12 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>>            * correctly the device tree.
>>            */
>>           pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
>> +
>> +        s = qdev_get_parent_bus(DEVICE(phb->chip));
>> +        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>>       }
>>       /* LSI sources */
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 9a458655efd9..45d8ecbf2bf7 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1927,6 +1927,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
>>       pmc->compat = compat;
>>       pmc->compat_size = sizeof(compat);
>> +
>> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB3);
>>   }
>>   static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>>


