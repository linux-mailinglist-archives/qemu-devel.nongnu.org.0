Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82044C035
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 12:38:33 +0100 (CET)
Received: from localhost ([::1]:45672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mklw0-0001nW-Up
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 06:38:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mklv4-0000W1-44
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:37:34 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:3198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mklv0-0008B5-Si
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:37:33 -0500
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Hq2ps6qr5z8vKm;
 Wed, 10 Nov 2021 19:35:49 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 10 Nov 2021 19:37:26 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Wed, 10 Nov 2021 19:37:25 +0800
Subject: Re: [PATCH 2/2] tests/unit/test-smp-parse: Fix a check-patch complain
To: Markus Armbruster <armbru@redhat.com>
References: <20211110095208.448-1-wangyanan55@huawei.com>
 <20211110095208.448-3-wangyanan55@huawei.com>
 <87tugkz56m.fsf@dusky.pond.sub.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <7ea7a0d6-6086-fa8c-73e0-4675acefbb04@huawei.com>
Date: Wed, 10 Nov 2021 19:37:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87tugkz56m.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/11/10 18:16, Markus Armbruster wrote:
> Yanan Wang <wangyanan55@huawei.com> writes:
>
>> Checkpatch.pl reports errors like below for commit 9e8e393bb7. Fix it.
>> ERROR: space required after that close brace '}'
>> +    SMPTestData *data = &(SMPTestData){{ }};
>>
>> Fixes: 9e8e393bb7 ("tests/unit: Add an unit test for smp parsing")
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   tests/unit/test-smp-parse.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
>> index 872512aa37..3627fe61ad 100644
>> --- a/tests/unit/test-smp-parse.c
>> +++ b/tests/unit/test-smp-parse.c
>> @@ -514,7 +514,7 @@ static void test_generic(void)
>>       Object *obj = smp_test_machine_init();
>>       MachineState *ms = MACHINE(obj);
>>       MachineClass *mc = MACHINE_GET_CLASS(obj);
>> -    SMPTestData *data = &(SMPTestData){{ }};
>> +    SMPTestData *data = &(SMPTestData){ {0} };
>>       int i;
>>   
>>       for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
>> @@ -548,7 +548,7 @@ static void test_with_dies(void)
>>       Object *obj = smp_test_machine_init();
>>       MachineState *ms = MACHINE(obj);
>>       MachineClass *mc = MACHINE_GET_CLASS(obj);
>> -    SMPTestData *data = &(SMPTestData){{ }};
>> +    SMPTestData *data = &(SMPTestData){ {0} };
>>       unsigned int num_dies = 2;
>>       int i;
> Why not
>
>         SMPTestData *data = &(SMPTestData){};
>
> ?
>
Much simpler. Having tested {} format, it also works in zeroing the 
structure.
And it seems to have been mostly used in qemu. I will update.

The original double-layer braces tried to satisfy a clang compile warning:
"suggest braces around initialization of subobject 
[-Werror,-Wmissing-braces]".
But I assume {} *without* explicit 0 in it just won't trigger the 
warning. (?)

Thanks,
Yanan


