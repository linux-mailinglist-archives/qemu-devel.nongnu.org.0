Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85445453F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 11:54:29 +0100 (CET)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnIaC-0007TC-RC
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 05:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mnIXS-0004YF-73
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:51:38 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mnIXN-0004il-KH
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:51:37 -0500
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HvKRj1fJszZcZD;
 Wed, 17 Nov 2021 18:49:05 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 18:51:28 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 18:51:28 +0800
Subject: Re: [PATCH-for-7.0 v4 08/11] tests/unit/test-smp-parse: Add
 'smp-without-dies-valid' machine type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-9-philmd@redhat.com>
 <06bcb095-66f5-6c11-0cd2-fa9defce799e@huawei.com>
 <32c42141-18e2-aa2c-8019-19aae50d4c24@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <f4852ea6-ff3d-93bd-91eb-ed62041ad95e@huawei.com>
Date: Wed, 17 Nov 2021 18:51:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <32c42141-18e2-aa2c-8019-19aae50d4c24@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
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


On 2021/11/17 16:08, Philippe Mathieu-Daudé wrote:
> Hi Yanan,
>
> On 11/17/21 08:37, wangyanan (Y) wrote:
>> On 2021/11/15 22:58, Philippe Mathieu-Daudé wrote:
>>> Keep the common TYPE_MACHINE class initialization in
>>> machine_base_class_init(), make it abstract, and move
>>> the non-common code to a new class: "smp-without-dies-valid".
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>    tests/unit/test-smp-parse.c | 19 +++++++++++++++----
>>>    1 file changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
>>> index dfe7f1313b0..90a249fe8c8 100644
>>> --- a/tests/unit/test-smp-parse.c
>>> +++ b/tests/unit/test-smp-parse.c
>>> @@ -478,13 +478,19 @@ static void machine_base_class_init(ObjectClass
>>> *oc, void *data)
>>>    {
>>>        MachineClass *mc = MACHINE_CLASS(oc);
>>>    +    mc->smp_props.prefer_sockets = true;
>>> +
>>> +    mc->name = g_strdup(SMP_MACHINE_NAME);
>>> +}
>>> +
>>> +static void machine_without_dies_valid_class_init(ObjectClass *oc,
>>> void *data)
>>> +{
>>> +    MachineClass *mc = MACHINE_CLASS(oc);
>>> +
>>>        mc->min_cpus = MIN_CPUS;
>>>        mc->max_cpus = MAX_CPUS;
>>>    -    mc->smp_props.prefer_sockets = true;
>>>        mc->smp_props.dies_supported = false;
>>> -
>>> -    mc->name = g_strdup(SMP_MACHINE_NAME);
>>>    }
>>>      static void machine_without_dies_invalid_class_init(ObjectClass
>>> *oc, void *data)
>>> @@ -606,9 +612,14 @@ static const TypeInfo smp_machine_types[] = {
>>>        {
>>>            .name           = TYPE_MACHINE,
>>>            .parent         = TYPE_OBJECT,
>>> +        .abstract       = true,
>>>            .class_init     = machine_base_class_init,
>>>            .class_size     = sizeof(MachineClass),
>>>            .instance_size  = sizeof(MachineState),
>>> +    }, {
>>> +        .name           = MACHINE_TYPE_NAME("smp-without-dies-valid"),
>>> +        .parent         = TYPE_MACHINE,
>>> +        .class_init     = machine_without_dies_valid_class_init,
>>>        }, {
>>>            .name           =
>>> MACHINE_TYPE_NAME("smp-without-dies-invalid"),
>>>            .parent         = TYPE_MACHINE,
>>> @@ -629,7 +640,7 @@ int main(int argc, char *argv[])
>>>        g_test_init(&argc, &argv, NULL);
>>>          g_test_add_data_func("/test-smp-parse/generic/valid",
>>> -                         TYPE_MACHINE,
>>> +                         MACHINE_TYPE_NAME("smp-without-dies-valid"),
>>>                             test_generic_valid);
>>>        g_test_add_data_func("/test-smp-parse/generic/invalid",
>>>                             MACHINE_TYPE_NAME("smp-without-dies-invalid"),
>> After patch #7 and #8, we will have sub-tests as below. It looks nice,
>> but it will
>> probably be better to tweak "smp-without-dies-valid" to
>> "smp-generic-valid",
>> and "smp-without-dies-invalid" to "smp-generic-invalid", which will be more
>> consistent with the corresponding sub-test name.
>>
>> It's Ok now as we only have dies currently besides generic
>> sockets/cores/threads,
>> but "smp-without-dies-xxx" will become a bit confusing when new topology
>> members are introduced and tested here.
> OK I modified it and will respin once v6.2 is released.
>
> Also test_with_dies() should be split in 2 tests: valid/invalid;
> then smp_parse_test() should split tests further regarding the
> socket preference. But I'll let that to you,
Sure, I can do this in an appropriate time. But IMHO, I don't see a
strong necessity to split test_with_dies for now, as the valid/invalid
scenarios share the same class properties. We can probably keep it
as is until we have to split it.

As for socket preference, I can foresee code duplication if we split
all the tests into two parts just regarding the socket preference.
Isn't it clear enough to use current smp_parse_test() for each
test data sample? Do we have other concern here?
> I wanted to 1/ fix
> our Windows CI and 2/ show you how to structure the tests.
Understood. The test architecture is indeed improved a lot.
Thanks for your education. 😉

Thanks,
Yanan
> Regards,
>
> Phil.
>
> .


