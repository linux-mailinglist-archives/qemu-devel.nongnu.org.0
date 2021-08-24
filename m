Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF963F59D2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:25:39 +0200 (CEST)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIRkY-0000FI-IG
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIRiw-0005pH-JB
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:24:00 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIRir-0004qm-TN
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:23:58 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Gv2F04B2Zz89SJ;
 Tue, 24 Aug 2021 16:23:32 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 16:23:46 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 16:23:45 +0800
Subject: Re: [PATCH v7 05/15] machine: Improve the error reporting of smp
 parsing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
References: <20210823122804.7692-1-wangyanan55@huawei.com>
 <20210823122804.7692-6-wangyanan55@huawei.com>
 <c5a2bacc-ea23-6de7-2dd5-f0451034d2a8@redhat.com>
 <4b49fb0c-ec73-d8ca-f622-cc8e21ed0140@huawei.com>
 <a9adbc4d-c111-1280-965e-0242f9f43da8@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <18959f11-f40e-9faf-bc27-425fa5090a20@huawei.com>
Date: Tue, 24 Aug 2021 16:23:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a9adbc4d-c111-1280-965e-0242f9f43da8@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.023,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Thomas Huth <thuth@redhat.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/8/24 15:29, Philippe Mathieu-Daudé wrote:
> On 8/24/21 6:51 AM, wangyanan (Y) wrote:
>> On 2021/8/23 21:17, Philippe Mathieu-Daudé wrote:
>>> On 8/23/21 2:27 PM, Yanan Wang wrote:
>>>> We have two requirements for a valid SMP configuration:
>>>> the product of "sockets * cores * threads" must represent all the
>>>> possible cpus, i.e., max_cpus, and then must include the initially
>>>> present cpus, i.e., smp_cpus.
>>>>
>>>> So we only need to ensure 1) "sockets * cores * threads == maxcpus"
>>>> at first and then ensure 2) "maxcpus >= cpus". With a reasonable
>>>> order of the sanity check, we can simplify the error reporting code.
>>>> When reporting an error message we also report the exact value of
>>>> each topology member to make users easily see what's going on.
>>>>
>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
>>>> ---
>>>>    hw/core/machine.c | 22 +++++++++-------------
>>>>    hw/i386/pc.c      | 24 ++++++++++--------------
>>>>    2 files changed, 19 insertions(+), 27 deletions(-)
>>>>
>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>> index 85908abc77..093c0d382d 100644
>>>> --- a/hw/core/machine.c
>>>> +++ b/hw/core/machine.c
>>>> @@ -779,25 +779,21 @@ static void smp_parse(MachineState *ms,
>>>> SMPConfiguration *config, Error **errp)
>>>>        maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
>>>>        cpus = cpus > 0 ? cpus : maxcpus;
>>>>    -    if (sockets * cores * threads < cpus) {
>>>> -        error_setg(errp, "cpu topology: "
>>>> -                   "sockets (%u) * cores (%u) * threads (%u) < "
>>>> -                   "smp_cpus (%u)",
>>>> -                   sockets, cores, threads, cpus);
>>>> +    if (sockets * cores * threads != maxcpus) {
>>>> +        error_setg(errp, "Invalid CPU topology: "
>>>> +                   "product of the hierarchy must match maxcpus: "
>>>> +                   "sockets (%u) * cores (%u) * threads (%u) "
>>>> +                   "!= maxcpus (%u)",
>>>> +                   sockets, cores, threads, maxcpus);
>>>>            return;
>>>>        }
>>> Thinking about scalability, MachineClass could have a
>>> parse_cpu_topology() handler, and this would be the
>>> generic one. Principally because architectures don't
>>> use the same terms, and die/socket/core/thread arrangement
>>> is machine specific (besides being arch-spec).
>>> Not a problem as of today, but the way we try to handle
>>> this generically seems over-engineered to me.
>> Hi Philippe,
>>
>> The reason for introducing a generic implementation and avoiding
>> specific ones is that we thought there is little difference in parsing
>> logic between the specific parsers. Most part of the parsing is the
>> automatic calculation of missing values and the related error reporting,
>> in which the only difference between parsers is the handling of specific
>> (no matter of arch-specific or machine-specifc) parameters.
>>
>> So it may be better to keep the parsing logic unified if we can easily
>> realize that. And actually we can use compat stuff to handle specific
>> topology parameters well. See implementation in patch #10.
>>
>> There have been patches on list introducing new specific members
>> (s390 related in [1] and ARM related in [2]), and in each of them there
>> is a specific parser needed. However, based on generic one we can
>> extend without the increasing code duplication.
>>
>> There is also some discussion about generic/specific parser in [1],
>> which can be a reference.
>>
>> [1]
>> https://lore.kernel.org/qemu-devel/1626281596-31061-2-git-send-email-pmorel@linux.ibm.com/
>>
>> [2]
>> https://lore.kernel.org/qemu-devel/20210516103228.37792-1-wangyanan55@huawei.com/
> OK I read Daniel's rationale here:
> https://lore.kernel.org/qemu-devel/YPFN83pKBt7F97kW@redhat.com/
exactly. :)

Thanks,
Yanan
.
> Thanks,
>
> Phil.
>
> .


