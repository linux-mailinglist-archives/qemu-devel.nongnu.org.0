Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4347340F349
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 09:30:00 +0200 (CEST)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR8Jq-0007sm-UL
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 03:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mR8IM-0006jw-0q; Fri, 17 Sep 2021 03:28:26 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mR8II-000202-Qb; Fri, 17 Sep 2021 03:28:25 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H9lmq4Zv1z8yZ3;
 Fri, 17 Sep 2021 15:23:39 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 17 Sep 2021 15:28:07 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Fri, 17 Sep 2021 15:28:06 +0800
Subject: Re: [PATCH v9 00/16] machine: smp parsing fixes and improvement
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <63616770-e88a-66ab-2bce-c2afecf67d64@huawei.com>
Date: Fri, 17 Sep 2021 15:28:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210910073025.16480-1-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
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
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Greg Kurz <groug@kaod.org>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping...

Hello maintainers,
Is this series mature enough to be accepted?
Now each one patch in this version has been Reviewd/Acked.

Considering that I have another patchset on list that depends on this 
series,
and AFAIK there is another s390 patch series caring about the SMP changes
too, so I would appreciate your feedback. If there is still something to 
fix I
can do the work in time. Sorry for bothering. 😉

Thanks,
Yanan

On 2021/9/10 15:30, Yanan Wang wrote:
> Hello,
>
> This is a new version v9 rebased on latest upstream commit bd662023e6.
> There are two more patches (#6 and #7) added to optimize qtest/numa-test
> to avoid affect from -smp parsing changes. Please review.
>
> This series has been tested locally on x86_64 and aarch64 machines,
> which are available for me.
>
> Description:
> This series introduces some fixes and improvement for the SMP parsing.
>
> 1) Specifying a CPU topology parameter as zero was implicitly allowed
> but undocumented before, while now it's explicitly deprecated.
>
> 2) To keep consistency, maxcpus is now uniformly used to calculate the
> omitted topology members.
>
> 3) Improve the error reporting.
>
> 4) It's also suggested that we should start to prefer cores over sockets
> over threads on the newer machine types, which will make the computed
> virtual topology more reflective of the real hardware. Related discussion
> can be found in [1].
> [1] https://lore.kernel.org/qemu-devel/YNIgInK00yNNI4Dy@redhat.com/
>
> 5) In order to reduce code duplication and ease the code maintenance,
> smp_parse() is converted into a generic enough parser for all arches,
> so that the arch-specific ones (e.g. pc_smp_parse) can be removed.
> It's also convenient to introduce more topology members to the generic
> parser in the future. Related discussions can be found in [2] and [3].
> [2] https://lore.kernel.org/qemu-devel/20210630115602.txmvmfe2jrzu7o67@gator.home/
> [3] https://lore.kernel.org/qemu-devel/YPFN83pKBt7F97kW@redhat.com/
>
> 6) A unit test for the SMP parsing is added. In the test, all possible
> collections of the topology parameters and the corresponding expected
> results are listed, including the valid and invalid ones. The preference
> of sockets over cores and the preference of cores over sockets, and the
> support of dies are also taken into consideration.
>
> ---
>
> Changelogs:
>
> v8->v9:
> - rebased on latest upstream commit bd662023e6, only updated patch 01/16
>    to resolve code conflict, no change in the others.
> - added two more patches (06/16 and 07/16) to optimize qtest/numa-test.c
>    to avoid affect from -smp parsing changes.
> - v8: https://lore.kernel.org/qemu-devel/20210902110330.18036-1-wangyanan55@huawei.com/
>
> v7->v8:
> - merge patch (hw: Add compat machines for 6.2) separately
> - rebased on upstream commit 079b1252e9
> - v7: https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
>
> v6->v7:
> - drop the two docs/about clean-up patches and they have been resent separately
> - v6: https://lore.kernel.org/qemu-devel/20210819031027.41104-1-wangyanan55@huawei.com/
>
> v5->v6:
> - deprecate "parameter=0" SMP configurations (patch #1 and #2 added)
> - rebased on upstream v6.1.0-rc4
> - v5: https://lore.kernel.org/qemu-devel/20210813023912.105880-1-wangyanan55@huawei.com/
>
> v4->v5:
> - refactor out the duplicated "threads == 0" case in patch #6 (Pankaj)
> - pick up more R-b tags from v4 (thanks very much for the review!)
> - v4: https://lore.kernel.org/qemu-devel/20210803080527.156556-1-wangyanan55@huawei.com/
>
> v3->v4:
> - put all the sanity check into the parser
> - refine the unit test and add it back to the series
> - add the R-b/A-b tags for the reviewed/acked patches
> - v3: https://lore.kernel.org/qemu-devel/20210728034848.75228-1-wangyanan55@huawei.com/
>
> v2->v3:
> - apply the calculation improvement to smp_parse and pc_smp_parse
>    separately and then convert the finally improved parsers into a
>    generic one, so that patches can be reviewed separately.
> - to ease review, drop the unit test part for a while until we have
>    a good enough generic parser.
> - send the patch "machine: Disallow specifying topology parameters as zero"
>    for 6.1 separately.
> - v2: https://lore.kernel.org/qemu-devel/20210719032043.25416-1-wangyanan55@huawei.com/
>
> v1->v2:
> - disallow "anything=0" in the smp configuration (Andrew)
> - make function smp_parse() a generic helper for all arches
> - improve the error reporting in the parser
> - start to prefer cores over sockets since 6.2 (Daniel)
> - add a unit test for the smp parsing (Daniel)
> - v1: https://lore.kernel.org/qemu-devel/20210702100739.13672-1-wangyanan55@huawei.com/
>
> ---
>
> Yanan Wang (16):
>    machine: Deprecate "parameter=0" SMP configurations
>    machine: Minor refactor/fix for the smp parsers
>    machine: Uniformly use maxcpus to calculate the omitted parameters
>    machine: Set the value of cpus to match maxcpus if it's omitted
>    machine: Improve the error reporting of smp parsing
>    qtest/numa-test: Use detailed -smp CLIs in pc_dynamic_cpu_cfg
>    qtest/numa-test: Use detailed -smp CLI in test_def_cpu_split
>    machine: Prefer cores over sockets in smp parsing since 6.2
>    machine: Use ms instead of global current_machine in sanity-check
>    machine: Tweak the order of topology members in struct CpuTopology
>    machine: Make smp_parse generic enough for all arches
>    machine: Remove smp_parse callback from MachineClass
>    machine: Move smp_prefer_sockets to struct SMPCompatProps
>    machine: Put all sanity-check in the generic SMP parser
>    machine: Split out the smp parsing code
>    tests/unit: Add a unit test for smp parsing
>
>   MAINTAINERS                 |   2 +
>   docs/about/deprecated.rst   |  15 +
>   hw/arm/virt.c               |   1 +
>   hw/core/machine-smp.c       | 200 +++++++++
>   hw/core/machine.c           |  90 +---
>   hw/core/meson.build         |   1 +
>   hw/i386/pc.c                |  63 +--
>   hw/i386/pc_piix.c           |   1 +
>   hw/i386/pc_q35.c            |   1 +
>   hw/ppc/spapr.c              |   1 +
>   hw/s390x/s390-virtio-ccw.c  |   1 +
>   include/hw/boards.h         |  24 +-
>   qapi/machine.json           |   2 +-
>   qemu-options.hx             |  24 +-
>   tests/qtest/numa-test.c     |   6 +-
>   tests/unit/meson.build      |   1 +
>   tests/unit/test-smp-parse.c | 866 ++++++++++++++++++++++++++++++++++++
>   17 files changed, 1134 insertions(+), 165 deletions(-)
>   create mode 100644 hw/core/machine-smp.c
>   create mode 100644 tests/unit/test-smp-parse.c
>
> --
> 2.23.0
>
> .


