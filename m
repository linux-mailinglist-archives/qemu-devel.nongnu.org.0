Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD49F3FED05
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:31:51 +0200 (CEST)
Received: from localhost ([::1]:54136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLkwg-0008Vv-K1
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLklq-000277-0t; Thu, 02 Sep 2021 07:20:38 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkln-0001jo-5h; Thu, 02 Sep 2021 07:20:37 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H0dfT6ZMDzblD5;
 Thu,  2 Sep 2021 19:16:33 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 2 Sep 2021 19:20:30 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 2 Sep 2021 19:20:29 +0800
Subject: Re: [PATCH v6 3/5] hw/arm/virt: Add cpu-map to device tree
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <20210824122016.144364-4-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <647bb539-76e6-aeb3-8138-0d44359292d1@huawei.com>
Date: Thu, 2 Sep 2021 19:20:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210824122016.144364-4-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
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
Cc: Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair
 Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Salil Mehta <salil.mehta@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

Is the solution in this patch ok for you? Would appreciate if I can get 
some feedback. :)

Thanks,
Yanan
.

On 2021/8/24 20:20, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
>
> Support device tree CPU topology descriptions.
>
> In accordance with the Devicetree Specification, the Linux Doc
> "arm/cpus.yaml" requires that cpus and cpu nodes in the DT are
> present. And we have already met the requirement by generating
> /cpus/cpu@* nodes for members within ms->smp.cpus. Accordingly,
> we should also create subnodes in cpu-map for the present cpus,
> each of which relates to an unique cpu node.
>
> The Linux Doc "cpu/cpu-topology.txt" states that the hierarchy
> of CPUs in a SMP system is defined through four entities and
> they are socket/cluster/core/thread. It is also required that
> a socket node's child nodes must be one or more cluster nodes.
> Given that currently we are only provided with information of
> socket/core/thread, we assume there is one cluster child node
> in each socket node when creating cpu-map.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>   hw/arm/virt.c | 70 +++++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 60 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 82f2eba6bd..bdcf7435f0 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -350,20 +350,21 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>       int cpu;
>       int addr_cells = 1;
>       const MachineState *ms = MACHINE(vms);
> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>       int smp_cpus = ms->smp.cpus;
>   
>       /*
> -     * From Documentation/devicetree/bindings/arm/cpus.txt
> -     *  On ARM v8 64-bit systems value should be set to 2,
> -     *  that corresponds to the MPIDR_EL1 register size.
> -     *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> -     *  in the system, #address-cells can be set to 1, since
> -     *  MPIDR_EL1[63:32] bits are not used for CPUs
> -     *  identification.
> +     * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
> +     * On ARM v8 64-bit systems value should be set to 2,
> +     * that corresponds to the MPIDR_EL1 register size.
> +     * If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> +     * in the system, #address-cells can be set to 1, since
> +     * MPIDR_EL1[63:32] bits are not used for CPUs
> +     * identification.
>        *
> -     *  Here we actually don't know whether our system is 32- or 64-bit one.
> -     *  The simplest way to go is to examine affinity IDs of all our CPUs. If
> -     *  at least one of them has Aff3 populated, we set #address-cells to 2.
> +     * Here we actually don't know whether our system is 32- or 64-bit one.
> +     * The simplest way to go is to examine affinity IDs of all our CPUs. If
> +     * at least one of them has Aff3 populated, we set #address-cells to 2.
>        */
>       for (cpu = 0; cpu < smp_cpus; cpu++) {
>           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
> @@ -406,8 +407,57 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>                   ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>           }
>   
> +        if (!vmc->no_cpu_topology) {
> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> +                                  qemu_fdt_alloc_phandle(ms->fdt));
> +        }
> +
>           g_free(nodename);
>       }
> +
> +    if (!vmc->no_cpu_topology) {
> +        /*
> +         * Add vCPU topology description through fdt node cpu-map.
> +         *
> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> +         * In a SMP system, the hierarchy of CPUs can be defined through
> +         * four entities that are used to describe the layout of CPUs in
> +         * the system: socket/cluster/core/thread.
> +         *
> +         * A socket node represents the boundary of system physical package
> +         * and its child nodes must be one or more cluster nodes. A system
> +         * can contain several layers of clustering within a single physical
> +         * package and cluster nodes can be contained in parent cluster nodes.
> +         *
> +         * Given that cluster is not yet supported in the vCPU topology,
> +         * we currently generate one cluster node within each socket node
> +         * by default.
> +         */
> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> +
> +        for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
> +            char *map_path;
> +
> +            if (ms->smp.threads > 1) {
> +                map_path = g_strdup_printf(
> +                    "/cpus/cpu-map/socket%d/cluster0/core%d/thread%d",
> +                    cpu / (ms->smp.cores * ms->smp.threads),
> +                    (cpu / ms->smp.threads) % ms->smp.cores,
> +                    cpu % ms->smp.threads);
> +            } else {
> +                map_path = g_strdup_printf(
> +                    "/cpus/cpu-map/socket%d/cluster0/core%d",
> +                    cpu / ms->smp.cores,
> +                    cpu % ms->smp.cores);
> +            }
> +            qemu_fdt_add_path(ms->fdt, map_path);
> +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
> +
> +            g_free(map_path);
> +            g_free(cpu_path);
> +        }
> +    }
>   }
>   
>   static void fdt_add_its_gic_node(VirtMachineState *vms)


