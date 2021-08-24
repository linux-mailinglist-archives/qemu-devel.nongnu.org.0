Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDC53F569D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 05:20:54 +0200 (CEST)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIMza-0001AU-5f
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 23:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIMyO-0007dg-C7; Mon, 23 Aug 2021 23:19:36 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIMyJ-0003IZ-P8; Mon, 23 Aug 2021 23:19:36 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GtvPb2k9qzbhb1;
 Tue, 24 Aug 2021 11:15:31 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 11:19:19 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 11:19:18 +0800
Subject: Re: [PATCH for-6.2 v5 0/5] hw/arm/virt: Introduce cpu topology support
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210805123921.62540-1-wangyanan55@huawei.com>
 <20210823195243-mutt-send-email-mst@kernel.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <6c2cbbc1-8004-4e8c-a867-4e09efd84594@huawei.com>
Date: Tue, 24 Aug 2021 11:19:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210823195243-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.023,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 Salil Mehta <salil.mehta@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/8/24 7:53, Michael S. Tsirkin wrote:
> On Thu, Aug 05, 2021 at 08:39:16PM +0800, Yanan Wang wrote:
>> Hi,
>>
>> This is a new version (v5) of the series [1] that I posted to introduce
>> support for generating cpu topology descriptions to virt machine guest.
>>
>> Once the view of an accurate virtual cpu topology is provided to guest,
>> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
>> e.g., the scheduling performance improvement. See Dario Faggioli's
>> research and the related performance tests in [2] for reference.
>>
>> This patch series introduces cpu topology support for ARM platform.
>> Both cpu-map in DT and ACPI PPTT table are introduced to store the
>> topology information. And we only describe the topology information
>> to 6.2 and newer virt machines, considering compatibility.
> ACPI things:
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Thanks for the reviewing.
> pls merge through ARM tree.
Sure, got it.

Yanan
.
>
>> [1] https://lore.kernel.org/qemu-devel/20210622093413.13360-1-wangyanan55@huawei.com/
>> [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
>> -friend-or-foe-dario-faggioli-suse
>>
>> Some tests:
>> 1) -smp 16,sockets=2,cores=4,threads=2,maxcpus=16
>> lscpu:
>> Architecture:        aarch64
>> Byte Order:          Little Endian
>> CPU(s):              16
>> On-line CPU(s) list: 0-15
>> Thread(s) per core:  2
>> Core(s) per socket:  4
>> Socket(s):           2
>> NUMA node(s):        1
>> Vendor ID:           ARM
>> Model:               2
>> Model name:          Cortex-A72
>> Stepping:            r0p2
>> BogoMIPS:            100.00
>> NUMA node0 CPU(s):   0-15
>>
>> cat /sys/devices/system/cpu/present  -->  0-15
>> cat /sys/devices/system/cpu/possible -->  0-15
>>
>> 2) -smp 8,sockets=2,cores=4,threads=2,maxcpus=16
>> lscpu:
>> Architecture:        aarch64
>> Byte Order:          Little Endian
>> CPU(s):              8
>> On-line CPU(s) list: 0-7
>> Thread(s) per core:  2
>> Core(s) per socket:  4
>> Socket(s):           1
>> NUMA node(s):        1
>> Vendor ID:           ARM
>> Model:               2
>> Model name:          Cortex-A72
>> Stepping:            r0p2
>> BogoMIPS:            100.00
>> NUMA node0 CPU(s):   0-7
>>
>> cat /sys/devices/system/cpu/present  -->  0-7
>> cat /sys/devices/system/cpu/possible -->  0-7
>>
>> ---
>>
>> Changelogs:
>>
>> v4->v5:
>> - drop the added -smp "expose=on|off" parameter and only describe topology
>>    for 6.2 and newer machines
>> - rebased the code on patch series [3] which has introduced some fix and
>>    improvement for smp parsing
>> - [3]: https://lore.kernel.org/qemu-devel/20210803080527.156556-1-wangyanan55@huawei.com/
>>
>> v3->v4:
>> - add new -smp parameter "expose=on|off" for users to enable/disable the feature
>> - add stricter -smp cmdline parsing rules on "expose=on" case
>> - move build_pptt to generic aml-build.c
>> - add default cluster node in the cpu-map
>> - rebase on top of latest upstream master
>> - v3: https://lore.kernel.org/qemu-devel/20210516102900.28036-1-wangyanan55@huawei.com/
>>
>> v2->v3:
>> - address comments from David, Philippe, and Andrew. Thanks!
>> - split some change into separate commits for ease of review
>> - adjust parsing rules of virt_smp_parse to be more strict
>>    (after discussion with Andrew)
>> - adjust author credit for the patches
>>
>> v1->v2:
>> - Address Andrew Jones's comments
>> - Address Michael S. Tsirkin's comments
>>
>> ---
>>
>> Andrew Jones (2):
>>    hw/arm/virt: Add cpu-map to device tree
>>    hw/acpi/aml-build: Generate PPTT table
>>
>> Yanan Wang (3):
>>    hw/arm/virt: Only describe cpu topology to guest since virt 6.2
>>    device_tree: Add qemu_fdt_add_path
>>    hw/acpi/aml-build: Add Processor hierarchy node structure
>>
>>   hw/acpi/aml-build.c          | 76 ++++++++++++++++++++++++++++++++++++
>>   hw/arm/virt-acpi-build.c     |  8 +++-
>>   hw/arm/virt.c                | 62 ++++++++++++++++++++++++-----
>>   include/hw/acpi/aml-build.h  |  7 ++++
>>   include/hw/arm/virt.h        |  4 +-
>>   include/sysemu/device_tree.h |  1 +
>>   softmmu/device_tree.c        | 44 ++++++++++++++++++++-
>>   7 files changed, 188 insertions(+), 14 deletions(-)
>>
>> -- 
>> 2.19.1
>
> .


