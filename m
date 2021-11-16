Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC81452FF5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:11:23 +0100 (CET)
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwN0-0000ci-RW
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:11:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mmwJ2-0002ZL-6z
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:07:17 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:3199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mmwIy-0005Lw-B5
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:07:15 -0500
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Htjrj4nJJz8vQB;
 Tue, 16 Nov 2021 19:05:09 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 19:06:50 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 19:06:50 +0800
Subject: Re: [PATCH-for-6.2 v3 1/6] tests/unit/test-smp-parse: Restore
 MachineClass fields after modifying
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-2-philmd@redhat.com>
 <df6a0315-6b94-51c4-9854-96c6ba08f3db@huawei.com>
 <87120304-dc9d-ff4b-5973-85362c89f34f@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <7df37842-abd5-ee0a-d440-9aaf7fe044b6@huawei.com>
Date: Tue, 16 Nov 2021 19:06:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87120304-dc9d-ff4b-5973-85362c89f34f@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme713-chm.china.huawei.com (10.1.199.109) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/11/15 18:24, Philippe Mathieu-Daudé wrote:
> On 11/12/21 03:04, wangyanan (Y) wrote:
>> On 2021/11/11 18:03, Philippe Mathieu-Daudé wrote:
>>> There is a single MachineClass object, registered with
>>> type_register_static(&smp_machine_info). Since the same
>>> object is used multiple times (an MachineState object
>>> is instantiated in both test_generic and test_with_dies),
>>> we should restore its internal state after modifying for
>>> the test purpose.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>    tests/unit/test-smp-parse.c | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
>>> index cbe0c990494..bd11fbe91de 100644
>>> --- a/tests/unit/test-smp-parse.c
>>> +++ b/tests/unit/test-smp-parse.c
>>> @@ -512,7 +512,7 @@ static void test_generic(void)
>>>            smp_parse_test(ms, data, true);
>>>        }
>>>    -    /* Reset the supported min CPUs and max CPUs */
>>> +    /* Force invalid min CPUs and max CPUs */
>>>        mc->min_cpus = 2;
>>>        mc->max_cpus = 511;
>>>    @@ -523,6 +523,10 @@ static void test_generic(void)
>>>            smp_parse_test(ms, data, false);
>>>        }
>>>    +    /* Reset the supported min CPUs and max CPUs */
>>> +    mc->min_cpus = MIN_CPUS;
>>> +    mc->max_cpus = MAX_CPUS;
>>> +
>>>        object_unref(obj);
>>>    }
>>>    
>> Just want to have a note:
>> Besides the supported min/max CPUs, mc->smp_props is dirtied
>> too for test purpose in each sub-test function. But for now, it is
>> not functionally necessary to also restore them at the final of each
>> sub-test function. We need to do this when new specific parameters
>> are tested in separate tests.
> What we ought do is have an abstract TestMachineClass and have
> a specific TestCaseMachineClass for each of your test cases.
> This way we don't need to modify the class internal state at
> runtime. I chose to not do it now because this is a more invasive
> change past hard-freeze,
Yes, we can do that as an optimization for 7.0. I also have noticed
those for-7.0 patches submitted. I will have a look.
> and I just want to fix the Cirrus-CI
> jobs here.
And keep the fix for 6.2.
>> At that time, for example, we will need
>> to at least add:
>>
>> /* Restore the SMP compat properties */
>> mc->smp_props.dies_supported = false;
>>
>> at the bottom of test_with_dies()
> OK, I'll add that.

Thanks!
Yanan
>
>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>> Tested-by: Yanan Wang <wangyanan55@huawei.com>
>>
>> Thanks,
>> Yanan
>>
> .


