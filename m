Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056C843431E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 03:52:47 +0200 (CEST)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md0mc-00061h-4w
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 21:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1md0bs-00084r-TP; Tue, 19 Oct 2021 21:41:40 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1md0bn-0005hF-Vj; Tue, 19 Oct 2021 21:41:40 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HYtZk6ZyRz1DHlB;
 Wed, 20 Oct 2021 09:39:42 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 09:41:28 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 09:41:28 +0800
Subject: Re: [PATCH v8 0/8] hw/arm/virt: Introduce cpu topology support
To: "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <872c74b2-3078-d53d-9faa-620bd7d9d02a@huawei.com>
Date: Wed, 20 Oct 2021 09:41:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211014132206.19220-1-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping... for review of the newly added ACPI patches.

On 2021/10/14 21:21, Yanan Wang wrote:
> Hi,
>
> This is the latest v8 with update in patch #6 and #8. Now only one
> generic reference file for PPTT is added in tests/data/acpi/virt.
> Machiel and Igor, please help to have a look, thanks!
And sorry for the name typo, definitely should be Michael of course.

Thanks,
Yanan
> Description of this series:
> Once the view of an accurate virtual cpu topology is provided to guest,
> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> e.g., the scheduling performance improvement. See Dario Faggioli's
> research and the related performance tests in [1] for reference.
>
> This patch series introduces cpu topology support for Arm platform.
> Both cpu-map in DT and ACPI PPTT table are introduced to store the
> topology information. And we only describe the topology information
> to 6.2 and newer virt machines, considering compatibility.
>
> [1] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
> -friend-or-foe-dario-faggioli-suse
>
> Series tested locally on Arm64 machines kunpeng920.
> After booting a Linux guest with "-smp 16,sockets=4,cores=4,threads=1,maxcpus=16",
> through lscpu we will see the information about CPU topology like:
> Architecture:        aarch64
> Byte Order:          Little Endian
> CPU(s):              16
> On-line CPU(s) list: 0-15
> Thread(s) per core:  1
> Core(s) per socket:  4
> Socket(s):           4
> NUMA node(s):        1
> Vendor ID:           0x48
> Model:               0
> Stepping:            0x1
> BogoMIPS:            200.00
> NUMA node0 CPU(s):   0-15
>
> and with "-smp 16" we will see:
> Architecture:        aarch64
> Byte Order:          Little Endian
> CPU(s):              16
> On-line CPU(s) list: 0-15
> Thread(s) per core:  1
> Core(s) per socket:  16
> Socket(s):           1
> NUMA node(s):        1
> Vendor ID:           0x48
> Model:               0
> Stepping:            0x1
> BogoMIPS:            200.00
> NUMA node0 CPU(s):   0-15
>
> Changelog:
> v7->v8:
> - rebased on top of master (commit e5b2333f24)
> - only add one generic expected file for PPTT instead of four, which works
>    fine enough for now (patch #6 and #8 updated)
> - v7: https://lore.kernel.org/qemu-devel/20211007030746.10420-1-wangyanan55@huawei.com/
>
> v6->v7:
> - rebased on top of master (commit ca61fa4b80)
> - use newly introduced acpi_table_begin/acpi_table_end APIs to build PPTT
>    (patch #5 updated)
> - add reference files for PPTT to fix broken bios-table-test for Aarch64
>    virt machine (patch #6-#8 added)
> - v6: https://lore.kernel.org/qemu-devel/20210824122016.144364-1-wangyanan55@huawei.com/
>
> Andrew Jones (2):
>    hw/arm/virt: Add cpu-map to device tree
>    hw/acpi/aml-build: Add PPTT table
>
> Yanan Wang (6):
>    hw/arm/virt: Only describe cpu topology since virt-6.2
>    device_tree: Add qemu_fdt_add_path
>    hw/acpi/aml-build: Add Processor hierarchy node structure
>    tests/data/acpi/virt: Add an empty expected file for PPTT
>    hw/arm/virt-acpi-build: Generate PPTT table
>    tests/data/acpi/virt: Update the empty expected file for PPTT
>
>   hw/acpi/aml-build.c          |  86 +++++++++++++++++++++++++++++++++++
>   hw/arm/virt-acpi-build.c     |   8 +++-
>   hw/arm/virt.c                |  71 +++++++++++++++++++++++++----
>   include/hw/acpi/aml-build.h  |   7 +++
>   include/hw/arm/virt.h        |   4 +-
>   include/sysemu/device_tree.h |   1 +
>   softmmu/device_tree.c        |  44 +++++++++++++++++-
>   tests/data/acpi/virt/PPTT    | Bin 0 -> 76 bytes
>   8 files changed, 207 insertions(+), 14 deletions(-)
>   create mode 100644 tests/data/acpi/virt/PPTT
>
> --
> 2.19.1
>
> .


