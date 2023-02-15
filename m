Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D0697784
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 08:45:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSCT8-0002ai-Dx; Wed, 15 Feb 2023 02:44:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSCT3-0002Yp-VA
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:44:41 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSCT1-0005k7-Mh
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:44:41 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PGqlt2FzXzRs5x;
 Wed, 15 Feb 2023 15:42:02 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Wed, 15 Feb 2023 15:44:35 +0800
Message-ID: <cb71b9bb-ef6b-1bf0-bc06-97d23a80e75b@huawei.com>
Date: Wed, 15 Feb 2023 15:44:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 02/18] tests: Rename test-x86-cpuid.c to
 test-x86-apicid.c
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, <qemu-devel@nongnu.org>, Zhenyu Wang
 <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>, Zhuocheng Ding
 <zhuocheng.ding@intel.com>, Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao
 Li <xiaoyao.li@intel.com>, Like Xu <like.xu.linux@gmail.com>, Zhao Liu
 <zhao1.liu@intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-3-zhao1.liu@linux.intel.com>
 <cf0e39e0-4c49-18ed-5b5a-b438bd6e76b7@huawei.com>
 <Y+xTBXvOEOpOJEj0@liuzhao-OptiPlex-7080>
In-Reply-To: <Y+xTBXvOEOpOJEj0@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

在 2023/2/15 11:35, Zhao Liu 写道:
> On Wed, Feb 15, 2023 at 10:36:34AM +0800, wangyanan (Y) wrote:
>> Date: Wed, 15 Feb 2023 10:36:34 +0800
>> From: "wangyanan (Y)" <wangyanan55@huawei.com>
>> Subject: Re: [PATCH RESEND 02/18] tests: Rename test-x86-cpuid.c to
>>   test-x86-apicid.c
>>
>> 在 2023/2/13 17:36, Zhao Liu 写道:
>>> From: Zhao Liu <zhao1.liu@intel.com>
>>>
>>> In fact, this unit tests APIC ID other than CPUID.
>>> Rename to test-x86-apicid.c to make its name more in line with its
>>> actual content.
>>>
>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>> ---
>>>    MAINTAINERS                                        | 2 +-
>>>    tests/unit/meson.build                             | 4 ++--
>>>    tests/unit/{test-x86-cpuid.c => test-x86-apicid.c} | 2 +-
>>>    3 files changed, 4 insertions(+), 4 deletions(-)
>>>    rename tests/unit/{test-x86-cpuid.c => test-x86-apicid.c} (99%)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 96e25f62acaa..71c1bc24371b 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1679,7 +1679,7 @@ F: include/hw/southbridge/piix.h
>>>    F: hw/misc/sga.c
>>>    F: hw/isa/apm.c
>>>    F: include/hw/isa/apm.h
>>> -F: tests/unit/test-x86-cpuid.c
>>> +F: tests/unit/test-x86-apicid.c
>>>    F: tests/qtest/test-x86-cpuid-compat.c
>>>    PC Chipset
>>> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
>>> index ffa444f4323c..a9df2843e92e 100644
>>> --- a/tests/unit/meson.build
>>> +++ b/tests/unit/meson.build
>>> @@ -20,8 +20,8 @@ tests = {
>>>      'test-opts-visitor': [testqapi],
>>>      'test-visitor-serialization': [testqapi],
>>>      'test-bitmap': [],
>>> -  # all code tested by test-x86-cpuid is inside topology.h
>>> -  'test-x86-cpuid': [],
>>> +  # all code tested by test-x86-apicid is inside topology.h
>>> +  'test-x86-apicid': [],
>>>      'test-cutils': [],
>>>      'test-div128': [],
>>>      'test-shift128': [],
>>> diff --git a/tests/unit/test-x86-cpuid.c b/tests/unit/test-x86-apicid.c
>>> similarity index 99%
>>> rename from tests/unit/test-x86-cpuid.c
>>> rename to tests/unit/test-x86-apicid.c
>>> index bfabc0403a1a..2b104f86d7c2 100644
>>> --- a/tests/unit/test-x86-cpuid.c
>>> +++ b/tests/unit/test-x86-apicid.c
>>> @@ -1,5 +1,5 @@
>>>    /*
>>> - *  Test code for x86 CPUID and Topology functions
>>> + *  Test code for x86 APIC ID and Topology functions
>>>     *
>> I'm not very sure. The "CPUID" sounds like a general test for kinds of CPU
>> IDs.
> CPUID usually refers to that basic instruction in the x86 to obtain basic
> cpu information. So such naming is prone to ambiguity.
>
> The cpu topology info of x86 is parsed based on the apic id, including
> the sub-ids of each topology levels (such as thread id/core id...etc.).
> These sub-ids are all part of the apic id.
>
>> Besides APIC IDs computed from x86_apicid_from_cpu_idx(), there are also
>> topo IDs computed from x86_topo_ids_from_idx() although this kind of IDs
>> are not tested in test-x86-cpuid.c so far.
> What about "test-x86-topo.c" or "test-x86-topo-ids.c"?
The first one is general enough, I think.
>> Thanks,
>> Yanan
>>>     *  Copyright (c) 2012 Red Hat Inc.
>>>     *


