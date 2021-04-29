Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5036E779
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 10:57:10 +0200 (CEST)
Received: from localhost ([::1]:56306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc2Tt-00031O-EK
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 04:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lc2T4-0002Tw-Ry; Thu, 29 Apr 2021 04:56:18 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lc2T0-0006xe-Cs; Thu, 29 Apr 2021 04:56:18 -0400
Received: from dggeml706-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FW8Q16kSxz148Dy;
 Thu, 29 Apr 2021 16:52:09 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml706-chm.china.huawei.com (10.3.17.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 29 Apr 2021 16:56:07 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 29 Apr 2021 16:56:07 +0800
Subject: Re: [RFC PATCH v2 2/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
To: Andrew Jones <drjones@redhat.com>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-3-wangyanan55@huawei.com>
 <20210428103141.5qfhzcqko6hxhxee@gator>
 <262dba57-437c-36aa-7a86-8f0c59751887@huawei.com>
 <20210429071614.lywpbfpeyclqxnke@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <ce557539-ac8f-7245-747b-8212a4857811@huawei.com>
Date: Thu, 29 Apr 2021 16:56:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210429071614.lywpbfpeyclqxnke@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 yangyicong@huawei.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, Igor
 Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/4/29 15:16, Andrew Jones wrote:
> On Thu, Apr 29, 2021 at 10:14:37AM +0800, wangyanan (Y) wrote:
>> On 2021/4/28 18:31, Andrew Jones wrote:
>>> On Tue, Apr 13, 2021 at 04:31:45PM +0800, Yanan Wang wrote:
>>>>            } else if (sockets == 0) {
>>>>                threads = threads > 0 ? threads : 1;
>>>> -            sockets = cpus / (cores * threads);
>>>> +            sockets = cpus / (clusters * cores * threads);
>>>>                sockets = sockets > 0 ? sockets : 1;
>>> If we initialize clusters to zero instead of one and add lines in
>>> 'cpus == 0 || cores == 0' and 'sockets == 0' like
>>> 'clusters = clusters > 0 ? clusters : 1' as needed, then I think we can
>>> add
>>>
>>>    } else if (clusters == 0) {
>>>        threads = threads > 0 ? threads : 1;
>>>        clusters = cpus / (sockets * cores * thread);
>>>        clusters = clusters > 0 ? clusters : 1;
>>>    }
>>>
>>> here.
>> I have thought about this kind of format before, but there is a little bit
>> difference between these two ways. Let's chose the better and more
>> reasonable one of the two.
>>
>> Way A currently in this patch:
>> If value of clusters is not explicitly specified in -smp command line, we
>> assume
>> that users don't want to support clusters, for compatibility we initialized
>> the
>> value to 1. So that with cmdline "-smp cpus=24, sockets=2, cores=6", we will
>> parse out the topology description like below:
>> cpus=24, sockets=2, clusters=1, cores=6, threads=2
>>
>> Way B that you suggested for this patch:
>> Whether value of clusters is explicitly specified in -smp command line or
>> not,
>> we assume that clusters are supported and calculate the value. So that with
>> cmdline "-smp cpus=24, sockets=2, cores=6", we will parse out the topology
>> description like below:
>> cpus =24, sockets=2, clusters=2, cores=6, threads=1
>>
>> But I think maybe we should not assume too much about what users think
>> through the -smp command line. We should just assume that all levels of
>> cpu topology are supported and calculate them, and users should be more
>> careful if they want to get the expected results with not so complete
>> cmdline.
>> If I'm right, then Way B should be better. :)
>>
> Hi Yanan,
>
> We're already assuming the user wants to describe clusters to the guest
> because we require at least one per socket. If we want the user to have a
> choice between using clusters or not, then I guess we need to change the
> logic in the PPTT and the cpu-map to only generate the cluster level when
> the number of clusters is not zero. And then change this parser to not
> require clusters at all.
Hi Drew,

I think this kind of change will introduce more complexity and actually 
is not necessary.
Not generating cluster level at all and generating cluster level (one 
per socket) are same
to kernel. Without cluster description provided, kernel will initialize 
all cores in the same
cluster which also means one cluster per socket.

So we should only ensure value of clusters per socket is one if we don't 
want to use clusters,
and don't need to care about whether or not to generate description in 
PPTT and cpu-map.
Is this right?
> I'm not a big fan of these auto-calculated values either, but the
> documentation says that it'll do that, and it's been done that way
> forever, so I think we're stuck with it for the -smp option. Hmm, I was
> just about to say that x86 computes all its values, but I see the most
> recently added one, 'dies', is implemented the way you're proposing we
> implement 'clusters', i.e. default to one and don't calculate it when it's
> missing. I actually consider that either a documentation bug or an smp
> parsing bug, though.
My propose originally came from implementation of x86.
> Another possible option, for Arm, because only the cpus and maxcpus
> parameters of -smp have ever worked, is to document, for Arm, that if even
> one parameter other than cpus or maxcpus is provided, then all parameters
> must be provided. We can still decide if clusters=0 is valid, but we'll
> enforce that everything is explicit and that the product (with or without
> clusters) matches maxcpus.
Requiring every parameter explicitly will be most stable but indeed strict.

Currently all the parsers use way B to calculate value of thread if it 
is not provided explicitly.
So users should ensure the -smp cmdline they provided can result in that 
parsed threads will
be 1 if they don't want to support multiple threads in one core.

Very similar to thread, users should also ensure the provided cmdline 
can result in that parsed
clusters will be 1 if they don't want to support multiple clusters in 
one socket.

So I'm wondering if we can just add some commit in the documentation to 
tell users that they
should ensure this if they don't want support it. And as for calculation 
of clusters, we follow
the logic of other parameters as you suggested in way B.

Thanks,
Yanan
>
> Requiring every parameter might be stricter than necessary, though, I
> think we're mostly concerned with cpus/maxcpus, sockets, and cores.
> clusters can default to one or zero (whatever we choose and document),
> threads can default to one, and cpus can default to maxcpus or maxcpus can
> default to cpus, but at least one of those must be provided. And, if
> sockets are provided, then cores must be provided and vice versa. If
> neither sockets nor cores are provided, then nothing else besides cpus and
> maxcpus may be provided, and that would mean to not generate any topology
> descriptions for the guest.
> Thanks,
> drew
>
> .

