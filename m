Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164BD3F1914
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 14:22:01 +0200 (CEST)
Received: from localhost ([::1]:54208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGh3X-0005Io-NS
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 08:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mGh2B-0004MZ-SP
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:20:35 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mGh29-0004Zc-3b
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:20:35 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gr3dx0HR7z8sXC;
 Thu, 19 Aug 2021 20:16:21 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 19 Aug 2021 20:20:24 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 19 Aug 2021 20:20:23 +0800
Subject: Re: [PATCH v6 01/16] docs/about/removed-features: Remove duplicated
 doc about -smp
To: Cornelia Huck <cohuck@redhat.com>, <qemu-devel@nongnu.org>
References: <20210819031027.41104-1-wangyanan55@huawei.com>
 <20210819031027.41104-2-wangyanan55@huawei.com> <87czq9smjz.fsf@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <03e5979f-5524-01ff-461b-a13697b662c7@huawei.com>
Date: Thu, 19 Aug 2021 20:20:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87czq9smjz.fsf@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.591,
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
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/8/19 19:26, Cornelia Huck wrote:
> On Thu, Aug 19 2021, Yanan Wang <wangyanan55@huawei.com> wrote:
>
>> There are two places describing the same thing about deprecation
>> of invalid topologies of -smp CLI, so remove the duplicated one.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   docs/about/removed-features.rst | 21 ++++-----------------
>>   1 file changed, 4 insertions(+), 17 deletions(-)
>>
>> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
>> index cbfa1a8e31..f5d6e2ea9c 100644
>> --- a/docs/about/removed-features.rst
>> +++ b/docs/about/removed-features.rst
>> @@ -194,7 +194,7 @@ by the ``tls-authz`` and ``sasl-authz`` options.
>>   The ``pretty=on|off`` switch has no effect for HMP monitors and
>>   its use is rejected.
>>   
>> -``-drive file=json:{...{'driver':'file'}}`` (removed 6.0)
>> +``-drive file=json:{...{'driver':'file'}}`` (removed in 6.0)
> I would not change this in this patch; while the cleanup looks fine,
> there are some more instances and also e.g. things like x.y.z being used
> sometimes, and it's probably better to clean that up via a separated patch.
Yes, I did notice that format (x.y,z) but didn't modify them...
I will make a separate patch only for subject format clean-up and
keep the duplicated text removal in another one.
>>   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>   
>>   The 'file' driver for drives is no longer appropriate for character or host
>> @@ -593,7 +593,7 @@ error when ``-u`` is not used.
>>   Command line options
>>   --------------------
>>   
>> -``-smp`` (invalid topologies) (removed 5.2)
>> +``-smp`` (invalid topologies) (removed in 5.2)
>>   '''''''''''''''''''''''''''''''''''''''''''
>>   
>>   CPU topology properties should describe whole machine topology including
>> @@ -606,7 +606,7 @@ Support for invalid topologies is removed, the user must ensure
>>   topologies described with -smp include all possible cpus, i.e.
>>   *sockets* * *cores* * *threads* = *maxcpus*.
>>   
>> -``-numa`` node (without memory specified) (removed 5.2)
>> +``-numa`` node (without memory specified) (removed in 5.2)
>>   '''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>   
>>   Splitting RAM by default between NUMA nodes had the same issues as ``mem``
>> @@ -647,20 +647,7 @@ as ignored. Currently, users are responsible for making sure the backing storage
>>   specified with ``-mem-path`` can actually provide the guest RAM configured with
>>   ``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
>>   
>> -``-smp`` (invalid topologies) (removed 5.2)
>> -'''''''''''''''''''''''''''''''''''''''''''
>> -
>> -CPU topology properties should describe whole machine topology including
>> -possible CPUs.
>> -
>> -However, historically it was possible to start QEMU with an incorrect topology
>> -where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
>> -which could lead to an incorrect topology enumeration by the guest.
>> -Support for invalid topologies is removed, the user must ensure
>> -topologies described with -smp include all possible cpus, i.e.
>> -*sockets* * *cores* * *threads* = *maxcpus*.
> Actually removing the duplicated section looks fine.
Thanks,
Yanan
.
>> -
>> -``-machine enforce-config-section=on|off`` (removed 5.2)
>> +``-machine enforce-config-section=on|off`` (removed in 5.2)
>>   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>   
>>   The ``enforce-config-section`` property was replaced by the
> .


