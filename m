Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CDA3D36F3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:41:38 +0200 (CEST)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qkT-0006iL-BL
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6qjD-000627-1O
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:40:19 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6qj9-0001OC-Eo
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:40:18 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GWN2z234PzchZF;
 Fri, 23 Jul 2021 16:36:43 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 16:40:07 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 16:40:06 +0800
Subject: Re: [PATCH for-6.1 v2] machine: Disallow specifying topology
 parameters as zero
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210722154326.1464-1-wangyanan55@huawei.com>
 <20210722154326.1464-2-wangyanan55@huawei.com> <YPmWTutShepWX32R@redhat.com>
 <87o8atcva4.fsf@dusky.pond.sub.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <553158b7-3705-8570-d3b8-e772ae49ed2c@huawei.com>
Date: Fri, 23 Jul 2021 16:40:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87o8atcva4.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.203,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com, yuzenghui@huawei.com, Paolo
 Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/23 16:02, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
>
>> On Thu, Jul 22, 2021 at 11:43:26PM +0800, Yanan Wang wrote:
>>> In the SMP configuration, we should either specify a topology
>>> parameter with a reasonable value (equal to or greater than 1)
>>> or just leave it omitted and QEMU will calculate its value.
>>> Configurations which explicitly specify the topology parameters
>>> as zero like "sockets=0" are meaningless, so disallow them.
>>>
>>> However, the commit 1e63fe685804d
>>> (machine: pass QAPI struct to mc->smp_parse) has documented that
>>> '0' has the same semantics as omitting a parameter in the qapi
>>> comment for SMPConfiguration. So this patch fixes the doc and
>>> also adds the corresponding sanity check in the smp parsers.
>>>
>>> Suggested-by: Andrew Jones <drjones@redhat.com>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> ---
>>>   hw/core/machine.c | 14 ++++++++++++++
>>>   qapi/machine.json |  6 +++---
>>>   qemu-options.hx   | 12 +++++++-----
>>>   3 files changed, 24 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index 775add0795..db129d937b 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -829,6 +829,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>>>           return;
>>>       }
>>>   
>>> +    /*
>>> +     * The topology parameters must be specified equal to or great than one
>>> +     * or just omitted, explicit configuration like "cpus=0" is not allowed.
>>> +     */
>>> +    if ((config->has_cpus && config->cpus == 0) ||
>>> +        (config->has_sockets && config->sockets == 0) ||
>>> +        (config->has_dies && config->dies == 0) ||
>>> +        (config->has_cores && config->cores == 0) ||
>>> +        (config->has_threads && config->threads == 0) ||
>>> +        (config->has_maxcpus && config->maxcpus == 0)) {
>>> +        error_setg(errp, "parameters must be equal to or greater than one if provided");
>> I'd suggest a slight tweak since when seen it lacks context:
>>
>> $ ./qemu-system-x86_64 -smp 4,cores=0,sockets=2
>> qemu-system-x86_64: parameters must be equal to or greater than one if provided
>>
>>
>>      error_setg(errp, "CPU topology parameters must be equal to or greater than one if provided");
> Let's scratch "if provided".
>
> I'd replace "must be equal to or greater than one" by "must be
> positive", or maybe "must be greater than zero".
How about we use "must be greater than zero" ?
After a grep search of these two sentences in QEMU, they both show up
in several places. "must be positive" always reports an invalid value that
is "< 0". While the check in this patch actually reject an invalid zero 
value.
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 99ed5ec5f1..b0168f8c48 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -223,11 +223,13 @@ SRST
>>>       of computing the CPU maximum count.
>>>   
>>>       Either the initial CPU count, or at least one of the topology parameters
>>> -    must be specified. Values for any omitted parameters will be computed
>>> -    from those which are given. Historically preference was given to the
>>> -    coarsest topology parameters when computing missing values (ie sockets
>>> -    preferred over cores, which were preferred over threads), however, this
>>> -    behaviour is considered liable to change.
>>> +    must be specified. The specified parameters must be equal to or great
>> s/great/greater/
>>
>>> +    than one, explicit configuration like "cpus=0" is not allowed. Values
> "positive" again.
Thanks,
Yanan
>>> +    for any omitted parameters will be computed from those which are given.
>>> +    Historically preference was given to the coarsest topology parameters
>>> +    when computing missing values (ie sockets preferred over cores, which
>>> +    were preferred over threads), however, this behaviour is considered
>>> +    liable to change.
>>>   ERST
>>
>> If you make the text changes, then feel free to add this when posting v2:
>>
>>   Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>   Tested-by: Daniel P. Berrangé <berrange@redhat.com>
>>   
>>
>>
>> Regards,
>> Daniel
> .


