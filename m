Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9215B44D6FB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:04:49 +0100 (CET)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml9l2-0002zq-6w
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:04:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1ml9hE-0006I4-Hs
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:00:52 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1ml9hB-0003fs-Ev
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:00:52 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hqhbn5Dt1z1DJLR;
 Thu, 11 Nov 2021 20:58:29 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 11 Nov 2021 21:00:45 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 11 Nov 2021 21:00:44 +0800
Subject: Re: [PATCH v4 2/2] tests/unit: Add an unit test for smp parsing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211028150913.1975305-1-philmd@redhat.com>
 <20211028150913.1975305-3-philmd@redhat.com>
 <fd32e519-f970-d039-8291-897363b20add@redhat.com>
 <14250bbd-c3fb-9afc-f08d-587326f0382c@huawei.com>
 <440cee74-13e0-ba38-070f-49f939f33319@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <36288eb7-328b-3d3d-ad40-02e3be1edcfd@huawei.com>
Date: Thu, 11 Nov 2021 21:00:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <440cee74-13e0-ba38-070f-49f939f33319@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/11/11 17:37, Philippe Mathieu-Daudé wrote:
> On 11/11/21 10:31, wangyanan (Y) wrote:
>> On 2021/11/11 17:14, Philippe Mathieu-Daudé wrote:
>>> On 10/28/21 17:09, Philippe Mathieu-Daudé wrote:
>>>> From: Yanan Wang <wangyanan55@huawei.com>
>>>>
>>>> Now that we have a generic parser smp_parse(), let's add an unit
>>>> test for the code. All possible valid/invalid SMP configurations
>>>> that the user can specify are covered.
>>>>
>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> Message-Id: <20211026034659.22040-3-wangyanan55@huawei.com>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>    tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++
>>>>    MAINTAINERS                 |   1 +
>>>>    tests/unit/meson.build      |   1 +
>>>>    3 files changed, 596 insertions(+)
>>>>    create mode 100644 tests/unit/test-smp-parse.c
>>>> +static struct SMPTestData data_generic_valid[] = {
>>>> +    {
>>>> +        /* config: no configuration provided
>>>> +         * expect: cpus=1,sockets=1,cores=1,threads=1,maxcpus=1 */
>>> [1]
>>>
>>>> +        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, F, 0, F, 0, F, 0),
>>>> +        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(1, 1, 1, 1, 1),
>>>> +        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(1, 1, 1, 1, 1),
>>>> +    }, {
>>>> +static void test_generic(void)
>>>> +{
>>>> +    Object *obj = object_new(TYPE_MACHINE);
>>>> +    MachineState *ms = MACHINE(obj);
>>>> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
>>> Watch out, while you create a machine instance in each
>>> test, there is only one machine class registered (see
>>> type_register_static(&smp_machine_info) below in [2]),
>>> ...
>> Yes, I noticed this. So on the top of each sub-test function, the
>> properties
>> of the single machine class is re-initialized by
>> smp_machine_class_init(mc).
>> See [*] below.
>>>> +    SMPTestData *data = &(SMPTestData){0};
>>>> +    int i;
>>>> +
>>>> +    smp_machine_class_init(mc);
>> [*]
>>>> +
>>>> +    for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
>>>> +        *data = data_generic_valid[i];
>>>> +        unsupported_params_init(mc, data);
>>>> +
>>>> +        smp_parse_test(ms, data, true);
>>>> +
>>>> +        /* Unsupported parameters can be provided with their values
>>>> as 1 */
>>>> +        data->config.has_dies = true;
>>>> +        data->config.dies = 1;
>>>> +        smp_parse_test(ms, data, true);
>>>> +    }
>>>> +
>>>> +    /* Reset the supported min CPUs and max CPUs */
>>>> +    mc->min_cpus = 2;
>>>> +    mc->max_cpus = 511;
>>> ... and here you are modifying the single machine class state, ...
>>>
>>>> +
>>>> +    for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
>>>> +        *data = data_generic_invalid[i];
>>>> +        unsupported_params_init(mc, data);
>>>> +
>>>> +        smp_parse_test(ms, data, false);
>>>> +    }
>>>> +
>>>> +    object_unref(obj);
>>>> +}
>>>> +
>>>> +static void test_with_dies(void)
>>>> +{
>>>> +    Object *obj = object_new(TYPE_MACHINE);
>>>> +    MachineState *ms = MACHINE(obj);
>>>> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
>>> ... so here the machine class state is inconsistent, ...
>>>
>>>> +    SMPTestData *data = &(SMPTestData){0};
>>>> +    unsigned int num_dies = 2;
>>>> +    int i;
>>>> +
>>>> +    smp_machine_class_init(mc);
>> And here [*].
>>>> +    mc->smp_props.dies_supported = true;
>>>> +
>>>> +    for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
>>>> +        *data = data_generic_valid[i];
>>>> +        unsupported_params_init(mc, data);
>>>> +
>>>> +        /* when dies parameter is omitted, it will be set as 1 */
>>>> +        data->expect_prefer_sockets.dies = 1;
>>>> +        data->expect_prefer_cores.dies = 1;
>>>> +
>>>> +        smp_parse_test(ms, data, true);
>>> ... in particular the first test [1] is tested with mc->min_cpus = 2.
>>>
>>> I wonder why you are not getting:
>>>
>>> Output error report: Invalid SMP CPUs 1. The min CPUs supported by
>>> machine '(null)' is 2
>>>
>>> for [1].
>> So as I have explained above, we won't get an output error report like
>> this here. :)
> I see. IMHO this is bad practice example, so I'll send a cleanup patch.
>
> .
Sure! I'm very happy that we can have a better solution. Thank you for 
doing that.

Thanks,
Yanan


