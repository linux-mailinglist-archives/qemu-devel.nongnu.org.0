Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56755784A6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:01:41 +0200 (CEST)
Received: from localhost ([::1]:33222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRJd-0004r9-0A
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oDRG2-0007fg-8S; Mon, 18 Jul 2022 09:57:58 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oDRG0-00033k-0Q; Mon, 18 Jul 2022 09:57:57 -0400
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Lmk241tylz6H7cp;
 Mon, 18 Jul 2022 21:53:16 +0800 (CST)
Received: from lhreml751-chm.china.huawei.com (10.201.108.201) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Jul 2022 15:57:46 +0200
Received: from [10.202.227.118] (10.202.227.118) by
 lhreml751-chm.china.huawei.com (10.201.108.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Jul 2022 14:57:44 +0100
Message-ID: <40c29d62-147a-71b6-b649-e6032d9dccff@huawei.com>
Date: Mon, 18 Jul 2022 14:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/8] hmat acpi: Don't require initiator value in -numa
To: Igor Mammedov <imammedo@redhat.com>
CC: <qemu-devel@nongnu.org>, <yangyicong@huawei.com>,
 <chenxiang66@hisilicon.com>, <linuxarm@huawei.com>, <qemu-arm@nongnu.org>,
 <peter.maydell@linaro.org>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-2-hesham.almatary@huawei.com>
 <20220718155425.6975f812@redhat.com>
In-Reply-To: <20220718155425.6975f812@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.118]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
 lhreml751-chm.china.huawei.com (10.201.108.201)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-devel@nongnu.org>


On 7/18/2022 2:54 PM, Igor Mammedov wrote:
> On Mon, 11 Jul 2022 11:44:29 +0100
> Hesham Almatary <hesham.almatary@huawei.com> wrote:
>
>> From: Brice Goglin <Brice.Goglin@inria.fr>
>>
>> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
>> has a "Processor Proximity Domain Valid" flag that is currently
>> always set because Qemu -numa requires an initiator=X value
>> when hmat=on. Unsetting this flag allows to create more complex
>> memory topologies by having multiple best initiators for a single
>> memory target.
>>
>> This patch allows -numa without initiator=X when hmat=on by keeping
>> the default value MAX_NODES in numa_state->nodes[i].initiator.
>> All places reading numa_state->nodes[i].initiator already check
>> whether it's different from MAX_NODES before using it.
> [...]
>> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
> when re-posting patches from someone else, I think one is supposed to add
> his/her own SoB at the end
>
Sure, I can do that in v2. I wasn't sure as I haven't modified any of these patches.
>> ---
>>   hw/core/machine.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index a673302cce..d4d7e77401 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1173,9 +1173,7 @@ static void numa_validate_initiator(NumaState *numa_state)
>>   
>>       for (i = 0; i < numa_state->num_nodes; i++) {
>>           if (numa_info[i].initiator == MAX_NODES) {
>> -            error_report("The initiator of NUMA node %d is missing, use "
>> -                         "'-numa node,initiator' option to declare it", i);
>> -            exit(1);
>> +            continue;
>>           }
>>   
>>           if (!numa_info[numa_info[i].initiator].present) {

