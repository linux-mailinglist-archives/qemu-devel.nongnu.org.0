Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3EE402607
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:14:24 +0200 (CEST)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXBQ-0004TQ-1k
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mNXA3-0002vp-2I; Tue, 07 Sep 2021 05:12:59 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mNX9z-0003em-IN; Tue, 07 Sep 2021 05:12:58 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H3fZj3rYFzbmHp;
 Tue,  7 Sep 2021 17:08:45 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 17:12:36 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 17:12:35 +0800
Subject: Re: [PATCH v6 0/5] hw/arm/virt: Introduce cpu topology support
To: Andrew Jones <drjones@redhat.com>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <CAFEAcA99urPQ4ZnmZrOG4JvL-sO-=kTGXF5Fuz-FoVHV6+J=pg@mail.gmail.com>
 <77ee3e41-e985-74f8-8510-1c47903689a8@huawei.com>
 <CAFEAcA9n10wZY5vO1ZpwO-P3u=dV2G4J8j3xtSjzfA5YX0oouQ@mail.gmail.com>
 <342f66ab-5c03-4aa3-b398-1e02926d86f7@huawei.com>
 <20210906161523.4kc5l3usbw6l2s6r@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <7bed1b6f-562f-8b43-b63b-5e2530170523@huawei.com>
Date: Tue, 7 Sep 2021 17:12:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210906161523.4kc5l3usbw6l2s6r@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Salil Mehta <salil.mehta@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU
 Developers <qemu-devel@nongnu.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/9/7 0:15, Andrew Jones wrote:
> On Fri, Sep 03, 2021 at 03:38:13PM +0800, wangyanan (Y) wrote:
>> On 2021/9/3 15:25, Peter Maydell wrote:
>>> On Fri, 3 Sept 2021 at 08:05, wangyanan (Y) <wangyanan55@huawei.com> wrote:
>>>> On 2021/9/2 23:56, Peter Maydell wrote:
>>>>> On Tue, 24 Aug 2021 at 13:20, Yanan Wang <wangyanan55@huawei.com> wrote:
>>>>>> This new version is based on patch series [1] which introduces some
>>>>>> fix and improvement for smp parsing.
>>>>>>
>>>>>> Description:
>>>>>> Once the view of an accurate virtual cpu topology is provided to guest,
>>>>>> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
>>>>>> e.g., the scheduling performance improvement. See Dario Faggioli's
>>>>>> research and the related performance tests in [2] for reference.
>>>>>>
>>>>>> This patch series introduces cpu topology support for ARM platform.
>>>>>> Both cpu-map in DT and ACPI PPTT table are introduced to store the
>>>>>> topology information. And we only describe the topology information
>>>>>> to 6.2 and newer virt machines, considering compatibility.
>>>>>>
>>>>>> patches not yet reviewed: #1 and #3.
>>>>>>
>>>>>> [1] https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
>>>>>> [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
>>>>>> -friend-or-foe-dario-faggioli-suse
>>>>> Hi; this series doesn't apply to current head-of-git. Is it
>>>>> intended to be based on some other series ?
>>>>>
>>>> Yes, it was based on the -smp parsing changes in [1] which hasn't been
>>>> picked yet. Given that [1] somehow affects the topology parsing results
>>>> which we will describe to guest, I think it may be better that [1] can be
>>>> merged first and then this series follows.
>>> OK. I'll ignore this for now; please resend once that other series
>>> has been accepted.
>> Got it.
> Also, you'll likely want to rebase on Igor's acpi refactor series[*]
>
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg822151.html
>
Ok, sure. I can wait for a while and will rebase the ACPI changes on Igor's
series for next version.

Thanks,
Yanan


