Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04EA480EAC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 02:43:16 +0100 (CET)
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Nzn-0003HV-5H
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 20:43:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n2Nxb-0002If-9o; Tue, 28 Dec 2021 20:40:59 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n2NxY-0005DH-CZ; Tue, 28 Dec 2021 20:40:58 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JNvDt0g2Yz8v1q;
 Wed, 29 Dec 2021 09:38:22 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 09:40:48 +0800
Subject: Re: [PATCH v5 03/14] hw/core/machine: Wrap target specific parameters
 together
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon
 Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-4-wangyanan55@huawei.com>
 <21974630-06ee-bacd-ca83-0116f1c6d4ec@redhat.com>
Message-ID: <3e594b32-4878-622c-8fa0-545fee4c5b14@huawei.com>
Date: Wed, 29 Dec 2021 09:40:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <21974630-06ee-bacd-ca83-0116f1c6d4ec@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>


On 2021/12/29 3:23, Philippe Mathieu-Daudé wrote:
> On 12/28/21 10:22, Yanan Wang wrote:
>> Wrap the CPU target specific parameters together into a single
>> variable except generic sockets/cores/threads, to make related
>> code lines shorter and more concise.
>>
>> No functional change intended.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine-smp.c | 17 ++++++++++-------
>>   1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
>> index b39ed21e65..4547d7bbdc 100644
>> --- a/hw/core/machine-smp.c
>> +++ b/hw/core/machine-smp.c
>> @@ -79,6 +79,7 @@ void machine_parse_smp_config(MachineState *ms,
>>       unsigned cores   = config->has_cores ? config->cores : 0;
>>       unsigned threads = config->has_threads ? config->threads : 0;
>>       unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>> +    unsigned others;
>>   
>>       /*
>>        * Specified CPU topology parameters must be greater than zero,
>> @@ -111,6 +112,8 @@ void machine_parse_smp_config(MachineState *ms,
>>       dies = dies > 0 ? dies : 1;
>>       clusters = clusters > 0 ? clusters : 1;
>>   
>> +    others = dies * clusters;
> This doesn't seem clearer to me...
Ok. We can just drop this patch.

Thanks,
Yanan
>>       /* compute missing values based on the provided ones */
>>       if (cpus == 0 && maxcpus == 0) {
>>           sockets = sockets > 0 ? sockets : 1;
>> @@ -124,30 +127,30 @@ void machine_parse_smp_config(MachineState *ms,
>>               if (sockets == 0) {
>>                   cores = cores > 0 ? cores : 1;
>>                   threads = threads > 0 ? threads : 1;
>> -                sockets = maxcpus / (dies * clusters * cores * threads);
>> +                sockets = maxcpus / (cores * threads * others);
>>               } else if (cores == 0) {
>>                   threads = threads > 0 ? threads : 1;
>> -                cores = maxcpus / (sockets * dies * clusters * threads);
>> +                cores = maxcpus / (sockets * threads * others);
>>               }
>>           } else {
>>               /* prefer cores over sockets since 6.2 */
>>               if (cores == 0) {
>>                   sockets = sockets > 0 ? sockets : 1;
>>                   threads = threads > 0 ? threads : 1;
>> -                cores = maxcpus / (sockets * dies * clusters * threads);
>> +                cores = maxcpus / (sockets * threads * others);
>>               } else if (sockets == 0) {
>>                   threads = threads > 0 ? threads : 1;
>> -                sockets = maxcpus / (dies * clusters * cores * threads);
>> +                sockets = maxcpus / (cores * threads * others);
>>               }
>>           }
>>   
>>           /* try to calculate omitted threads at last */
>>           if (threads == 0) {
>> -            threads = maxcpus / (sockets * dies * clusters * cores);
>> +            threads = maxcpus / (sockets * cores * others);
>>           }
>>       }
>>   
>> -    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * clusters * cores * threads;
>> +    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads * others;
>>       cpus = cpus > 0 ? cpus : maxcpus;
>>   
>>       ms->smp.cpus = cpus;
>> @@ -159,7 +162,7 @@ void machine_parse_smp_config(MachineState *ms,
>>       ms->smp.max_cpus = maxcpus;
>>   
>>       /* sanity-check of the computed topology */
>> -    if (sockets * dies * clusters * cores * threads != maxcpus) {
>> +    if (sockets * cores * threads * others != maxcpus) {
>>           g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
>>           error_setg(errp, "Invalid CPU topology: "
>>                      "product of the hierarchy must match maxcpus: "
> .


