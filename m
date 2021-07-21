Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFD73D0EDC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 14:37:20 +0200 (CEST)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6BTT-0008M4-84
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 08:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6BRN-0006wh-VH
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 08:35:11 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6BRK-000190-Bh
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 08:35:09 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GVFLq3nG8zZrDN;
 Wed, 21 Jul 2021 20:31:31 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 20:34:54 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 20:34:53 +0800
Subject: Re: [PATCH for-6.2 v2 01/11] machine: Disallow specifying topology
 parameters as zero
To: Andrew Jones <drjones@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-2-wangyanan55@huawei.com>
 <20210719161148.lpkziyzgkuavl7nv@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <1f1d8732-84ce-c0e0-b56d-a5f35e16b363@huawei.com>
Date: Wed, 21 Jul 2021 20:34:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210719161148.lpkziyzgkuavl7nv@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
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

On 2021/7/20 0:11, Andrew Jones wrote:
> On Mon, Jul 19, 2021 at 11:20:33AM +0800, Yanan Wang wrote:
>> In the SMP configuration, we should either specify a topology
>> parameter with a reasonable value (equal to or greater than 1)
>> or just leave it omitted and QEMU will calculate its value.
>>
>> Configurations which explicitly specify the topology parameters
>> as zero like "sockets=0" are meaningless, so disallow them.
>>
>> Suggested-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine.c | 31 +++++++++++++++++++++++--------
>>   hw/i386/pc.c      | 29 +++++++++++++++++++++--------
>>   qapi/machine.json |  4 ++--
>>   3 files changed, 46 insertions(+), 18 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 775add0795..d73daa10f4 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -745,11 +745,25 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>   {
>>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
>>       unsigned sockets = config->has_sockets ? config->sockets : 0;
>> +    unsigned dies    = config->has_dies ? config->dies : 1;
>>       unsigned cores   = config->has_cores ? config->cores : 0;
>>       unsigned threads = config->has_threads ? config->threads : 0;
>> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>> +
>> +    if ((config->has_cpus && config->cpus == 0) ||
>> +        (config->has_sockets && config->sockets == 0) ||
>> +        (config->has_dies && config->dies == 0) ||
>> +        (config->has_cores && config->cores == 0) ||
>> +        (config->has_threads && config->threads == 0) ||
>> +        (config->has_maxcpus && config->maxcpus == 0)) {
>> +        error_setg(errp, "parameters must be equal to or greater than one"
>> +                   "if provided");
> Missing a space between 'one' and 'if'. It's better to just put the whole
> string on one line too (ignore the 80 char thing) for error grepping.
>
>> +        return;
>> +    }
>>   
>> -    if (config->has_dies && config->dies != 0 && config->dies != 1) {
>> +    if (dies > 1) {
>>           error_setg(errp, "dies not supported by this machine's CPU topology");
>> +        return;
>>       }
>>   
>>       /* compute missing values, prefer sockets over cores over threads */
>> @@ -760,8 +774,8 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>               sockets = sockets > 0 ? sockets : 1;
>>               cpus = cores * threads * sockets;
>>           } else {
>> -            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
>> -            sockets = ms->smp.max_cpus / (cores * threads);
>> +            maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> +            sockets = maxcpus / (cores * threads);
>>           }
>>       } else if (cores == 0) {
>>           threads = threads > 0 ? threads : 1;
>> @@ -778,26 +792,27 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>           return;
>>       }
>>   
>> -    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
>> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>>   
>> -    if (ms->smp.max_cpus < cpus) {
>> +    if (maxcpus < cpus) {
>>           error_setg(errp, "maxcpus must be equal to or greater than smp");
>>           return;
>>       }
>>   
>> -    if (sockets * cores * threads != ms->smp.max_cpus) {
>> +    if (sockets * cores * threads != maxcpus) {
>>           error_setg(errp, "Invalid CPU topology: "
>>                      "sockets (%u) * cores (%u) * threads (%u) "
>>                      "!= maxcpus (%u)",
>>                      sockets, cores, threads,
>> -                   ms->smp.max_cpus);
>> +                   maxcpus);
>>           return;
>>       }
>>   
>>       ms->smp.cpus = cpus;
>> +    ms->smp.sockets = sockets;
>>       ms->smp.cores = cores;
>>       ms->smp.threads = threads;
>> -    ms->smp.sockets = sockets;
>> +    ms->smp.max_cpus = maxcpus;
>>   }
>>   
>>   static void machine_get_smp(Object *obj, Visitor *v, const char *name,
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index c2b9d62a35..c6b63c00a5 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -719,6 +719,18 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>>       unsigned dies    = config->has_dies ? config->dies : 1;
>>       unsigned cores   = config->has_cores ? config->cores : 0;
>>       unsigned threads = config->has_threads ? config->threads : 0;
>> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>> +
>> +    if ((config->has_cpus && config->cpus == 0) ||
>> +        (config->has_sockets && config->sockets == 0) ||
>> +        (config->has_dies && config->dies == 0) ||
>> +        (config->has_cores && config->cores == 0) ||
>> +        (config->has_threads && config->threads == 0) ||
>> +        (config->has_maxcpus && config->maxcpus == 0)) {
>> +        error_setg(errp, "parameters must be equal to or greater than one"
>> +                   "if provided");
> Same comment as above.
Ok, I will fix them.
>> +        return;
>> +    }
>>   
>>       /* compute missing values, prefer sockets over cores over threads */
>>       if (cpus == 0 || sockets == 0) {
>> @@ -728,8 +740,8 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>>               sockets = sockets > 0 ? sockets : 1;
>>               cpus = cores * threads * dies * sockets;
>>           } else {
>> -            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
>> -            sockets = ms->smp.max_cpus / (cores * threads * dies);
>> +            maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> +            sockets = maxcpus / (cores * threads * dies);
>>           }
>>       } else if (cores == 0) {
>>           threads = threads > 0 ? threads : 1;
>> @@ -746,27 +758,28 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>>           return;
>>       }
>>   
>> -    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
>> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>>   
>> -    if (ms->smp.max_cpus < cpus) {
>> +    if (maxcpus < cpus) {
>>           error_setg(errp, "maxcpus must be equal to or greater than smp");
>>           return;
>>       }
>>   
>> -    if (sockets * dies * cores * threads != ms->smp.max_cpus) {
>> +    if (sockets * dies * cores * threads != maxcpus) {
>>           error_setg(errp, "Invalid CPU topology deprecated: "
>>                      "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
>>                      "!= maxcpus (%u)",
>>                      sockets, dies, cores, threads,
>> -                   ms->smp.max_cpus);
>> +                   maxcpus);
>>           return;
>>       }
>>   
>>       ms->smp.cpus = cpus;
>> -    ms->smp.cores = cores;
>> -    ms->smp.threads = threads;
>>       ms->smp.sockets = sockets;
>>       ms->smp.dies = dies;
>> +    ms->smp.cores = cores;
>> +    ms->smp.threads = threads;
>> +    ms->smp.max_cpus = maxcpus;
>>   }
>>   
>>   static
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index c3210ee1fb..c11b2e6f73 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1288,8 +1288,8 @@
>>   ##
>>   # @SMPConfiguration:
>>   #
>> -# Schema for CPU topology configuration.  "0" or a missing value lets
>> -# QEMU figure out a suitable value based on the ones that are provided.
>> +# Schema for CPU topology configuration. A missing value lets QEMU
>> +# figure out a suitable value based on the ones that are provided.
>>   #
>>   # @cpus: number of virtual CPUs in the virtual machine
>>   #
>> -- 
>> 2.19.1
>>
> Otherwise
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
> .
Thanks,
Yanan
.


