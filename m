Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594DE453034
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:21:06 +0100 (CET)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwWP-0005GC-Gf
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:21:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mmwRU-0007Mq-Ce
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:16:00 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:3200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mmwRQ-0006VL-2d
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:15:59 -0500
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Htk2d0JfGz8vQp;
 Tue, 16 Nov 2021 19:13:45 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 19:15:27 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 19:15:27 +0800
Subject: Re: [PATCH-for-6.2 v3 3/6] tests/unit/test-smp-parse: Explicit
 MachineClass name
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-4-philmd@redhat.com>
 <fee6d60b-9070-7fbb-3275-cdd4aa7ee144@huawei.com>
 <2d5bb4d9-b34c-65dc-f0de-0f1c7af28c83@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <3eb356ff-b770-08fe-e738-a6ecb4937a3c@huawei.com>
Date: Tue, 16 Nov 2021 19:15:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2d5bb4d9-b34c-65dc-f0de-0f1c7af28c83@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/11/15 18:16, Philippe Mathieu-Daudé wrote:
> On 11/12/21 03:28, wangyanan (Y) wrote:
>> On 2021/11/11 18:03, Philippe Mathieu-Daudé wrote:
>>> If the MachineClass::name pointer is not explicitly set, it is NULL.
>>> Per the C standard, passing a NULL pointer to printf "%s" format is
>>> undefined. Some implementations display it as 'NULL', other as 'null'.
>>> Since we are comparing the formatted output, we need a stable value.
>>> The easiest is to explicit a machine name string.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>    tests/unit/test-smp-parse.c | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>    @@ -481,6 +483,8 @@ static void machine_class_init(ObjectClass *oc,
>>> void *data)
>>>          mc->smp_props.prefer_sockets = true;
>>>        mc->smp_props.dies_supported = false;
>>> +
>>> +    mc->name = g_strdup(SMP_MACHINE_NAME);
>> I'm not very familiar with Qom code, so it may be a stupid question.
>> The mc->name will be automatically freed elsewhere when all the
>> testing is finished and exits, right? :)
> I'll defer that to Eduardo / Markus, but meanwhile my understanding
> is QOM classes are loaded once (the first time an instance requires
> it) and never unloaded. Only instances can be unloaded, their resources
> being released.
Yes, this is also how I found about "classes" when reading the code and
playing with tests in test-smp-parse.c
> The machine life time is tied to the process one, when we are done
> using a machine, it is simpler to exit() the process -- the kernel
> releases the resources for us -- and create another process for a new
> machine, rather than re-creating a different machine within the same
> process.
> If there is a need for it (like releasing class resources), it is doable
> but it seems we never worried about it.
Ok, I see. Thank you for the explanations. :)

Thanks,
Yanan
> .


