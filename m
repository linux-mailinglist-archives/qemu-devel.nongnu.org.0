Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED49F3D1FAB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:11:40 +0200 (CEST)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Tnv-0004HJ-Su
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6Tmz-00031A-Qx
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:10:41 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6Tmw-0003pd-VG
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:10:41 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GVlRL5VrjzZrcp;
 Thu, 22 Jul 2021 16:07:10 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 16:10:34 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 16:10:33 +0800
Subject: Re: [PATCH for-6.2 v2 05/11] machine: Improve the error reporting of
 smp parsing
To: Andrew Jones <drjones@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-6-wangyanan55@huawei.com>
 <20210719165337.goazi5iwmmtz5jpg@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <f235161b-09cc-269b-9adf-c02f03e427e2@huawei.com>
Date: Thu, 22 Jul 2021 16:10:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210719165337.goazi5iwmmtz5jpg@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
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

On 2021/7/20 0:53, Andrew Jones wrote:
> On Mon, Jul 19, 2021 at 11:20:37AM +0800, Yanan Wang wrote:
>> We totally have two requirements for a valid SMP configuration:
> s/totally//
>
>> the sum of "sockets * dies * cores * threads" must represent all
> the product
>
>> the possible cpus, i.e., max_cpus, and must include the initial
>> present cpus, i.e., smp_cpus.
>>
>> We only need to ensure "sockets * dies * cores * threads == maxcpus"
>> at first and then ensure "sockets * dies * cores * threads >= cpus".
> Or, "maxcpus >= cpus"
>
>> With a reasonable order of the sanity-check, we can simplify the
>> error reporting code.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine.c | 25 ++++++++++---------------
>>   1 file changed, 10 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 668f0a1553..8b4d07d3fc 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -788,21 +788,6 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>       cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
>>       maxcpus = maxcpus > 0 ? maxcpus : cpus;
>>   
>> -    if (sockets * dies * cores * threads < cpus) {
>> -        g_autofree char *dies_msg = g_strdup_printf(
>> -            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>> -        error_setg(errp, "cpu topology: "
>> -                   "sockets (%u)%s * cores (%u) * threads (%u) < "
>> -                   "smp_cpus (%u)",
>> -                   sockets, dies_msg, cores, threads, cpus);
>> -        return;
>> -    }
>> -
>> -    if (maxcpus < cpus) {
>> -        error_setg(errp, "maxcpus must be equal to or greater than smp");
>> -        return;
>> -    }
> This may be redundant when determining a valid config, but by checking it
> separately we can provide a more useful error message.
Yes, this message is more useful. Can we also report the exact values of the
parameters within this error message ? How about the following:

if (sockets * cores * threads != maxcpus) {
     error_setg("product of the topology must be equal to maxcpus"
                "sockets (%u) * cores (%u) * threads (%u)"
                "!= maxcpus (%u)",
                sockets, cores, threads, maxcpus);
return;
}

if (maxcpus < cpus) {
     error_setg("maxcpus must be equal to or greater than smp:"
                "sockets (%u) * cores (%u) * threads (%u)"
                "== maxcpus (%u) < smp_cpus (%u)",
                sockets, cores, threads, maxcpus, cpus);
return;
}

Thanks,
Yanan
.
>> -
>>       if (sockets * dies * cores * threads != maxcpus) {
>>           g_autofree char *dies_msg = g_strdup_printf(
>>               mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>> @@ -814,6 +799,16 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>           return;
>>       }
>>   
>> +    if (sockets * dies * cores * threads < cpus) {
>> +        g_autofree char *dies_msg = g_strdup_printf(
>> +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>> +        error_setg(errp, "Invalid CPU topology: "
>> +                   "sockets (%u)%s * cores (%u) * threads (%u) < "
>> +                   "smp_cpus (%u)",
>> +                   sockets, dies_msg, cores, threads, cpus);
>> +        return;
>> +    }
>> +
>>       ms->smp.cpus = cpus;
>>       ms->smp.sockets = sockets;
>>       ms->smp.dies = dies;
>> -- 
>> 2.19.1
>>
> I'm not sure we need this patch.
>
> Thanks,
> drew
>
> .


