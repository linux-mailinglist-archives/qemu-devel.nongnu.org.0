Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE423FFAD9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 09:07:18 +0200 (CEST)
Received: from localhost ([::1]:47228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM3ID-0007tq-9w
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 03:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mM3Gu-0006wd-9K; Fri, 03 Sep 2021 03:05:56 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mM3Gq-0005s3-UA; Fri, 03 Sep 2021 03:05:56 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H17xz6C5BzblJB;
 Fri,  3 Sep 2021 15:01:43 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 3 Sep 2021 15:05:40 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Fri, 3 Sep 2021 15:05:39 +0800
Subject: Re: [PATCH v6 0/5] hw/arm/virt: Introduce cpu topology support
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <CAFEAcA99urPQ4ZnmZrOG4JvL-sO-=kTGXF5Fuz-FoVHV6+J=pg@mail.gmail.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <77ee3e41-e985-74f8-8510-1c47903689a8@huawei.com>
Date: Fri, 3 Sep 2021 15:05:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA99urPQ4ZnmZrOG4JvL-sO-=kTGXF5Fuz-FoVHV6+J=pg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme719-chm.china.huawei.com (10.1.199.115) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.225,
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
Cc: Salil Mehta <salil.mehta@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/9/2 23:56, Peter Maydell wrote:
> On Tue, 24 Aug 2021 at 13:20, Yanan Wang <wangyanan55@huawei.com> wrote:
>> This new version is based on patch series [1] which introduces some
>> fix and improvement for smp parsing.
>>
>> Description:
>> Once the view of an accurate virtual cpu topology is provided to guest,
>> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
>> e.g., the scheduling performance improvement. See Dario Faggioli's
>> research and the related performance tests in [2] for reference.
>>
>> This patch series introduces cpu topology support for ARM platform.
>> Both cpu-map in DT and ACPI PPTT table are introduced to store the
>> topology information. And we only describe the topology information
>> to 6.2 and newer virt machines, considering compatibility.
>>
>> patches not yet reviewed: #1 and #3.
>>
>> [1] https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
>> [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
>> -friend-or-foe-dario-faggioli-suse
>
> Hi; this series doesn't apply to current head-of-git. Is it
> intended to be based on some other series ?
>
Yes, it was based on the -smp parsing changes in [1] which hasn't been
picked yet. Given that [1] somehow affects the topology parsing results
which we will describe to guest, I think it may be better that [1] can be
merged first and then this series follows.

But actually the only conflict with current upstream is in patch#1 about
machine type compat, so I can also send a new version of this series
rebased on the latest upstream with minor update, if the precedence
consideration of the two series is not so necessary as I thought.

[1] 
https://lore.kernel.org/qemu-devel/20210902110330.18036-1-wangyanan55@huawei.com/

Thanks,
Yanan
.


