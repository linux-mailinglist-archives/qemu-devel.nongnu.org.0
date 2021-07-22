Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887AC3D1C2A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 05:02:37 +0200 (CEST)
Received: from localhost ([::1]:38768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Oyq-0006aQ-K3
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 23:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6Owx-0005c4-Bv
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 23:00:39 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6Owu-0007t4-7e
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 23:00:38 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GVcYc0T1WzZrbn;
 Thu, 22 Jul 2021 10:57:08 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 11:00:30 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 11:00:29 +0800
Subject: Re: [PATCH for-6.2 v2 03/11] machine: Uniformly use maxcpus to
 calculate the omitted parameters
To: Andrew Jones <drjones@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-4-wangyanan55@huawei.com>
 <20210719163647.or6tvr3rmgirctj4@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <3dc1c0df-8a30-3b8f-7dbd-1437e4f82002@huawei.com>
Date: Thu, 22 Jul 2021 11:00:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210719163647.or6tvr3rmgirctj4@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/20 0:36, Andrew Jones wrote:
> On Mon, Jul 19, 2021 at 11:20:35AM +0800, Yanan Wang wrote:
>> We are currently using maxcpus to calculate the omitted sockets
>> but using cpus to calculate the omitted cores/threads. This makes
>> cmdlines like:
>>    -smp cpus=8,maxcpus=16
>>    -smp cpus=8,cores=4,maxcpus=16
>>    -smp cpus=8,threads=2,maxcpus=16
>> work fine but the ones like:
>>    -smp cpus=8,sockets=2,maxcpus=16
>>    -smp cpus=8,sockets=2,cores=4,maxcpus=16
>>    -smp cpus=8,sockets=2,threads=2,maxcpus=16
>> break the invalid cpu topology check.
>>
>> Since we require for the valid config that the sum of "sockets * cores
>> * dies * threads" should equal to the maxcpus, we should uniformly use
>> maxcpus to calculate their omitted values.
>>
>> Also the if-branch of "cpus == 0 || sockets == 0" was splited into two
>> branches of "cpus == 0" and "sockets == 0" so that we can clearly read
>> that we are parsing -smp cmdlines with a preference of cpus over sockets
>> over cores over threads.
>>
>> Note: change in this patch won't affect any existing working cmdlines
>> but improves consistency and allow more incomplete configs to be valid.
> We also remove rounding of cores and threads when the math doesn't come
> out right, which could possible start reporting a bad config as invalid
> which worked before. Or were you able to prove that that can't happen with
> your testing?
I also had this concern, but I think that can't happen for sure.

Take the if-branch of "cores == 0" as an example,
Before this patch:
We use cpus to calculate the missing cores and round it up to 1 if the
result is zero, and at last set maxcpus to match cpus if it's omitted.
So the parsing result must have met the two conditions:
1) sockets * cores * threads == maxcpus
2) sockets * cores * threads >= cpus

After this patch:
We start to use maxcpus to calculate the missing cores and also remove
the rounding. For the same config mentioned above, it still works and the
parsing result will also not change, because we will never get a fractional
value of cores (maxcpus is multiple of (sockets * threads) ).

Like the valid config "-smp 8,sockets=16,maxcpus=16", we will get
"cpus=8,sockets=16,cores=1,threads=1,maxcpus=16" before, and
still get the same result after.

Please correct me if I missed something, thanks.
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine.c | 30 +++++++++++++++---------------
>>   1 file changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index ed6712e964..c9f15b15a5 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -768,24 +768,26 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>       }
>>   
>>       /* compute missing values, prefer sockets over cores over threads */
>> -    if (cpus == 0 || sockets == 0) {
>> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> +
>> +    if (cpus == 0) {
>> +        sockets = sockets > 0 ? sockets : 1;
>>           cores = cores > 0 ? cores : 1;
>>           threads = threads > 0 ? threads : 1;
>> -        if (cpus == 0) {
>> -            sockets = sockets > 0 ? sockets : 1;
>> -            cpus = sockets * dies * cores * threads;
>> -        } else {
>> -            maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> -            sockets = maxcpus / (dies * cores * threads);
>> -        }
>> +        cpus = sockets * dies * cores * threads;
>> +        maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> +    } else if (sockets == 0) {
>> +        cores = cores > 0 ? cores : 1;
>> +        threads = threads > 0 ? threads : 1;
>> +        sockets = maxcpus / (dies * cores * threads);
>>       } else if (cores == 0) {
>>           threads = threads > 0 ? threads : 1;
>> -        cores = cpus / (sockets * dies * threads);
>> -        cores = cores > 0 ? cores : 1;
>> +        cores = maxcpus / (sockets * dies * threads);
>>       } else if (threads == 0) {
>> -        threads = cpus / (sockets * dies * cores);
>> -        threads = threads > 0 ? threads : 1;
>> -    } else if (sockets * dies * cores * threads < cpus) {
>> +        threads = maxcpus / (sockets * dies * cores);
>> +    }
>> +
>> +    if (sockets * dies * cores * threads < cpus) {
>>           g_autofree char *dies_msg = g_strdup_printf(
>>               mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>>           error_setg(errp, "cpu topology: "
>> @@ -795,8 +797,6 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>           return;
>>       }
>>   
>> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> -
>>       if (maxcpus < cpus) {
>>           error_setg(errp, "maxcpus must be equal to or greater than smp");
>>           return;
>> -- 
>> 2.19.1
>>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
Thanks,
Yanan
.


