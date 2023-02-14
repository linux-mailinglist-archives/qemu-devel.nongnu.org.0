Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D148D69625B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtPc-0002nd-2O; Tue, 14 Feb 2023 06:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pRtPY-0002bY-O9
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:23:48 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pRtPV-0002Vx-H9
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:23:48 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PGJcb6PVrzJr6d;
 Tue, 14 Feb 2023 19:18:55 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Tue, 14 Feb 2023 19:23:38 +0800
Message-ID: <408794ae-b389-2b10-748e-b6e2df911e4e@huawei.com>
Date: Tue, 14 Feb 2023 19:23:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 06/52] hw/cpu: Introduce hybrid CPU topology
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-7-zhao1.liu@linux.intel.com>
 <f99004e0-0e62-de55-b9ee-f584de5553e9@huawei.com>
 <Y+tfhFU88fG1cI2U@liuzhao-OptiPlex-7080>
In-Reply-To: <Y+tfhFU88fG1cI2U@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

在 2023/2/14 18:16, Zhao Liu 写道:
> On Mon, Feb 13, 2023 at 09:18:05PM +0800, wangyanan (Y) wrote:
>> Date: Mon, 13 Feb 2023 21:18:05 +0800
>> From: "wangyanan (Y)" <wangyanan55@huawei.com>
>> Subject: Re: [RFC 06/52] hw/cpu: Introduce hybrid CPU topology
>>
>> Hi Zhao,
>>
>> 在 2023/2/13 17:49, Zhao Liu 写道:
>>> From: Zhao Liu <zhao1.liu@intel.com>
>>>
>>> For smp systems, the parts in one topology level are the same. But now
>>> there are more and more systems with hybrid architectures. Different
>>> parts of the same topology level may have differences. For example,
>>> Intel's Alder Lake series CPU has two types of cores, so the CPU
>>> topology is no longer symmetrical.
>>>
>>> The hybrid topology is compatible with the smp topology type, that is,
>>> different parts on the same level of the hybrid topology can set to be
>>> the same, but the hybrid topology will introduce more complexity (need
>>> to allocate more memory, organized with array or linked-list), so the
>>> original smp topology support is retained while introducing the hybrid
>>> topology, and the hybrid topology is only built when the hybrid is
>>> explicitly required.
>>>
>>> Therefore, we introduce the definition support of hybrid cpu topology
>>> here. At the same time, in order to unify with the original smp, we
>>> introduce a new cpu topology structure that can support smp topology
>>> or hybrid topology. This structure will replace the CpuTopology type (in
>>> include/hw/boards.h) used by MachineState.smp.
>>>
>>> As for now, we only support two hybrid topology levels: core and
>>> cluster.
>>>
>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>> ---
>>>    MAINTAINERS                   |   1 +
>>>    include/hw/cpu/cpu-topology.h | 117 ++++++++++++++++++++++++++++++++++
>>>    qapi/machine.json             |  12 ++++
>>>    3 files changed, 130 insertions(+)
>>>    create mode 100644 include/hw/cpu/cpu-topology.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 58794885ced3..918a9418d98e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1742,6 +1742,7 @@ F: qapi/machine-target.json
>>>    F: include/hw/boards.h
>>>    F: include/hw/core/cpu.h
>>>    F: include/hw/cpu/cluster.h
>>> +F: include/hw/cpu/cpu-topology.h
>> Should't it be in include/hw/core/* directory？
> Yes, I'll move it to the correct place.
>
>>>    F: include/sysemu/numa.h
>>>    F: tests/unit/test-smp-parse.c
>>>    T: git https://gitlab.com/ehabkost/qemu.git machine-next
>>> diff --git a/include/hw/cpu/cpu-topology.h b/include/hw/cpu/cpu-topology.h
>>> new file mode 100644
>>> index 000000000000..8268ea3a8569
>>> --- /dev/null
>>> +++ b/include/hw/cpu/cpu-topology.h
>>> @@ -0,0 +1,117 @@
>>> +/*
>>> + * CPU topology defination for Machine core
>>> + *
>>> + * Copyright (c) 2023 Intel Corporation
>>> + * Author: Zhao Liu <zhao1.liu@intel.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License,
>>> + * or (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#ifndef CPU_TOPOLOGY_H
>>> +#define CPU_TOPOLOGY_H
>>> +
>>> +#include "qemu/queue.h"
>>> +
>>> +/**
>>> + * SmpCpuTopology - smp cpu topology defination.
>>> + *
>>> + * For smp system, the parts in one topology level are the same.
>>> + *
>>> + * @sockets: the number of sockets on the machine
>>> + * @dies: the number of dies in one socket
>>> + * @clusters: the number of clusters in one die
>>> + * @cores: the number of cores in one cluster
>>> + * @threads: the number of threads in one core
>>> + */
>>> +typedef struct SmpCpuTopology {
>>> +    unsigned int sockets;
>>> +    unsigned int dies;
>>> +    unsigned int clusters;
>>> +    unsigned int cores;
>>> +    unsigned int threads;
>>> +} SmpCpuTopology;
>>> +
>>> +/**
>>> + * HybridCore - hybrid core topology defination:
>>> + * @threads: the number of threads in one core.
>>> + */
>>> +typedef struct HybridCore {
>>> +    unsigned int threads;
>>> +} HybridCore;
>>> +
>>> +/**
>>> + * HybridCluster - hybrid cluster topology defination:
>>> + * @cores: the number of cores in current cluster.
>>> + * @core_list: the array includes all the cores that belong to current
>>> + *             cluster.
>>> + */
>>> +typedef struct HybridCluster {
>>> +    unsigned int cores;
>>> +    HybridCore *core_list;
>>> +} HybridCluster;
>>> +
>>> +/**
>>> + * HybridCpuTopology - hybrid cpu topology defination.
>>> + *
>>> + * At present we only support two heterogeneous topology levels: core
>>> + * and cluster. For heterogeneous levels, we need additional structs
>>> + * to define their custom internal topology. So here we defines
>>> + * symmetric topology levels, and use a list to point to heterogeneous
>>> + * levels.
>>> + *
>>> + * @sockets: the number of sockets on the machine. All sockets are the
>>> + *           same.
>>> + * @dies: the number of dies in one socket. All dies are the same.
>>> + * @clusters: the number of clusters in one die. Cluster may be
>>> + *            different. This field indicates the length of
>>> + *            cluster_list.
>>> + * @cluster_list: the array includes all the clusters in one die.
>>> + */
>>> +typedef struct HybridCpuTopology {
>>> +    unsigned int sockets;
>>> +    unsigned int dies;
>>> +    unsigned int clusters;
>>> +    HybridCluster *cluster_list;
>>> +} HybridCpuTopology;
>>> +
>>> +/**
>>> + * GeneralCpuTopology - General cpu topology defination.
>>> + *
>>> + * It supports one of two topologies: smp topology or hybrid topology.
>>> + *
>>> + * @cpus: the number of present logical processors on the machine
>>> + * @max_cpus: the maximum number of logical processors on the machine
>>> + * @topo_type: the topology type of the machine and this decides which
>>> + *             member of the union to visit: smp or hybrid.
>>> + * @smp: the smp cpu topology informantion. Only valid when topo_type is
>>> + *       CPU_TOPO_TYPE_SMP.
>>> + * @hybrid: the hybrid cpu topology informantion. Only valid when
>>> + *          topo_type is CPU_TOPO_TYPE_HYBRID.
>>> + */
>>> +typedef struct GeneralCpuTopology {
>>> +    unsigned int cpus;
>>> +    unsigned int max_cpus;
>>> +    CpuTopoType topo_type;
>>> +    union {
>>> +        SmpCpuTopology smp;
>>> +        HybridCpuTopology hybrid;
>>> +    };
>>> +} GeneralCpuTopology; /*
>>> +                       * TODO: This name is temporary, just to distinguish it
>>> +                       * from the CpuTopology in boards.h. When CpuTopology in
>>> +                       * boards.h is merged here, it will be uniformly named as
>>> +                       * CpuTopology.
>>> +                       */
>>> +
>> A suggestion:
>> 1、Move definition of CpuTopology from boards.h to cpu-topology.h
>> and re-structure it to include SmpCpuTopology, being a generic cpu
>> topology structure.
>> 2、Rename "CpuTopology smp" in MachineState to a generic name
>> "CpuTopology topo".
> Here we need to change the access to MachineState.smp to
> MachineState.topo.smp in other modules.
>
> If replacement of MachineState.topo is in a single patch, do we also
> need to include the modification of access to MachineState.topo.smp
> in other modules? Otherwise, it will break the compilation.
>
> In this way, the patch seems be too large.
Oh, I understand. The temporary "GeneralCpuTopology" seems necessary.
With this patch and help of the introduced generic helpers, we can replace
access to MachineState.smp gradually. And that's what you are doing in
this series.

But is it possible to strip the whole hybrid related code from the re-work
of smp. After MachineState.smp is re-worked/generalized completely,
then we add the hybrid extansion? Now the re-work code of smp and
hybrid code looks coupled all the way.

Thanks,
Yanan
>
> Thanks,
> Zhao
>
>> 3、Adapt all the code in QEMU to above change.
>>
>> If you can pack above into a single patch, and then add the hybird
>> topology extansion in a next patch, we will not need the temporary
>> thing "GeneralCpuTopology" and the TODO comments, which makes
>> code clearer.
>>
>> Thanks,
>> Yanan
>>> +#endif /* CPU_TOPOLOGY_H */
>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>> index b9228a5e4616..bd7303f34497 100644
>>> --- a/qapi/machine.json
>>> +++ b/qapi/machine.json
>>> @@ -36,6 +36,18 @@
>>>                 'sh4eb', 'sparc', 'sparc64', 'tricore',
>>>                 'x86_64', 'xtensa', 'xtensaeb' ] }
>>> +##
>>> +# @CpuTopoType:
>>> +#
>>> +# An enumeration of cpu topology type
>>> +# TODO: Expose topology type in query-cpus-fast
>>> +#
>>> +# Since: 8.0
>>> +##
>>> +{ 'enum': 'CpuTopoType',
>>> +  'prefix': 'CPU_TOPO_TYPE',
>>> +  'data': [ 'smp', 'hybrid' ] }
>>> +
>>>    ##
>>>    # @CpuS390State:
>>>    #


