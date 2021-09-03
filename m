Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C03FFB30
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 09:39:41 +0200 (CEST)
Received: from localhost ([::1]:45806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM3nX-0002fa-Rf
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 03:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mM3mM-0001mb-9L; Fri, 03 Sep 2021 03:38:26 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mM3mJ-0008MP-ML; Fri, 03 Sep 2021 03:38:26 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4H18lG5BPzz1DG2L;
 Fri,  3 Sep 2021 15:37:30 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 3 Sep 2021 15:38:14 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Fri, 3 Sep 2021 15:38:14 +0800
Subject: Re: [PATCH v6 0/5] hw/arm/virt: Introduce cpu topology support
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <CAFEAcA99urPQ4ZnmZrOG4JvL-sO-=kTGXF5Fuz-FoVHV6+J=pg@mail.gmail.com>
 <77ee3e41-e985-74f8-8510-1c47903689a8@huawei.com>
 <CAFEAcA9n10wZY5vO1ZpwO-P3u=dV2G4J8j3xtSjzfA5YX0oouQ@mail.gmail.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <342f66ab-5c03-4aa3-b398-1e02926d86f7@huawei.com>
Date: Fri, 3 Sep 2021 15:38:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9n10wZY5vO1ZpwO-P3u=dV2G4J8j3xtSjzfA5YX0oouQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme717-chm.china.huawei.com (10.1.199.113) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.225,
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
Cc: Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 Salil Mehta <salil.mehta@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/9/3 15:25, Peter Maydell wrote:
> On Fri, 3 Sept 2021 at 08:05, wangyanan (Y) <wangyanan55@huawei.com> wrote:
>>
>> On 2021/9/2 23:56, Peter Maydell wrote:
>>> On Tue, 24 Aug 2021 at 13:20, Yanan Wang <wangyanan55@huawei.com> wrote:
>>>> This new version is based on patch series [1] which introduces some
>>>> fix and improvement for smp parsing.
>>>>
>>>> Description:
>>>> Once the view of an accurate virtual cpu topology is provided to guest,
>>>> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
>>>> e.g., the scheduling performance improvement. See Dario Faggioli's
>>>> research and the related performance tests in [2] for reference.
>>>>
>>>> This patch series introduces cpu topology support for ARM platform.
>>>> Both cpu-map in DT and ACPI PPTT table are introduced to store the
>>>> topology information. And we only describe the topology information
>>>> to 6.2 and newer virt machines, considering compatibility.
>>>>
>>>> patches not yet reviewed: #1 and #3.
>>>>
>>>> [1] https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
>>>> [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
>>>> -friend-or-foe-dario-faggioli-suse
>>> Hi; this series doesn't apply to current head-of-git. Is it
>>> intended to be based on some other series ?
>>>
>> Yes, it was based on the -smp parsing changes in [1] which hasn't been
>> picked yet. Given that [1] somehow affects the topology parsing results
>> which we will describe to guest, I think it may be better that [1] can be
>> merged first and then this series follows.
> OK. I'll ignore this for now; please resend once that other series
> has been accepted.
Got it.

Thanks,
Yanan
> thanks
> -- PMM
>
> .


