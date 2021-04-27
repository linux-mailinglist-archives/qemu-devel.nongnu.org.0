Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B836C62C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:37:45 +0200 (CEST)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMyG-00053C-4Y
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbMvg-0003QW-Ch; Tue, 27 Apr 2021 08:35:04 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbMvd-00043E-8D; Tue, 27 Apr 2021 08:35:04 -0400
Received: from dggeml755-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FV1PM2s9NzYd85;
 Tue, 27 Apr 2021 20:32:39 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml755-chm.china.huawei.com (10.1.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 27 Apr 2021 20:34:55 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 27 Apr 2021 20:34:55 +0800
Subject: Re: [RFC PATCH 0/6] Introduce cluster cpu topology support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20210331095343.12172-1-wangyanan55@huawei.com>
 <13983bec-8b6b-4277-288a-e243d096bfb3@redhat.com>
 <a883cf7e-b820-9d20-6424-e2add3007e9b@huawei.com>
 <d21d4ec0-9b2a-c881-5e2c-0542b4166704@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <9de0a498-89c6-d124-dfff-cf23567bc565@huawei.com>
Date: Tue, 27 Apr 2021 20:34:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d21d4ec0-9b2a-c881-5e2c-0542b4166704@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/4/27 20:08, Philippe Mathieu-Daudé wrote:
> On 4/27/21 1:00 PM, wangyanan (Y) wrote:
>> On 2021/4/27 17:57, Philippe Mathieu-Daudé wrote:
>>> On 3/31/21 11:53 AM, Yanan Wang wrote:
>>>> Hi,
>>>> This series introduces the cluster cpu topology support, besides now
>>>> existing sockets, cores, and threads.
>>>>
>>>> A cluster means a group of cores that share some resources (e.g. cache)
>>>> among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
>>>> 6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
>>>> share L3 cache data while cores within each cluster share the L2 cache.
>>>>
>>>> Also, there are some x86 CPU implementations (e.g. Jacobsville) where L2
>>>> cache is shared among a cluster of cores instead of being exclusive to
>>>> one single core. For example, on Jacobsville there are 6 clusters of 4
>>>> Atom cores, each cluster sharing a separate L2, and 24 cores sharing
>>>> L3).
>>>> About this series:
>>>> Note that, this series was implemented based on [3] and [4]. Although
>>>> they
>>>> have not merged into qemu mainline for now, it's still meaning to
>>>> post this
>>>> series to express the thoughts first. So a RFC is sent and any
>>>> comments are
>>>> welcomed and appreciated.
>>> At a glance: tests/unit/test-x86-cpuid.c should be adapted to be generic
>>> (but still supporting target-specific sub-tests) and some aarch64 tests
>>> added.
>>>
>>> Similarly the ARM PPTT tables tested in tests/qtest/bios-tables-test.c.
>>>
>>> Otherwise, the overall series looks good and coherent, but it isn't my
>>> area :)
>> Thank you for the reminder of the related tests. :)
>> I will have some work to make them cover the new features introduced
>> by this series.
> BTW if after 4 weeks and 2 pings nobody sent negative feedback or
> NAcked your series, it usually means the community is not against
> your purposal, but has some doubts this feature is necessary or
> well designed. Tests help to show your work is safe, as it doesn't
> break anything. You might need to better explain why this feature
> is needed, and what are the limitations of what is currently
> possible.
>
> OTOH QEMU has been in "feature freeze" for the next v6.0 release
> for the same amount of time, so maybe the maintainers/reviewers
> were busy with bugs and still have your series in their TODO list.
I fully understand your point, and thanks for the explanations.

I will just patiently wait for some feedback, and of course on the same 
time,
will also refine the solution with some convincing tests for later new 
version.

Thanks,
Yanan
> Regards,
>
> Phil.
>
> .

