Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B9325183
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:33:29 +0100 (CET)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHho-0004w7-Bh
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFHfe-0003uu-Uz
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:31:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFHfb-0004Yk-7J
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614263470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EuUiffr8mGqXR3rC5xkY3vR8T7E5RPaHPuB/slS5uW4=;
 b=i7kkHeKlMwsQzVuqeLFI1sqZQ1lZj//1xGYiP2M5ALeubut58MD26KLtkZ0aMGkFnZZGyP
 3y+llUraGUi8OkpBk3F2BazQRSlmX2bXF/emXtdKglEjSmfmcGYu0BN776Klkor2hf++m1
 cnrfzdo66JaXNBm2VEufmKS1GLrSFAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-NKx7XvBJMaSaOL9doyRmEw-1; Thu, 25 Feb 2021 09:31:04 -0500
X-MC-Unique: NKx7XvBJMaSaOL9doyRmEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BE60845EEB;
 Thu, 25 Feb 2021 14:30:47 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37F961346D;
 Thu, 25 Feb 2021 14:30:39 +0000 (UTC)
Date: Thu, 25 Feb 2021 15:30:37 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 2/5] hw/arm/virt: Add cpu-map to device tree
Message-ID: <20210225143037.ey6dosjbvv2aigzz@kamzik.brq.redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-3-fangying1@huawei.com>
 <20210225111610.mejof5pe2y5fe5xr@kamzik.brq.redhat.com>
 <5fc765dd-52fa-2936-f298-d2635c863eb3@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5fc765dd-52fa-2936-f298-d2635c863eb3@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 09:18:22PM +0800, Ying Fang wrote:
> 
> 
> On 2/25/2021 7:16 PM, Andrew Jones wrote:
> > Hi Ying Fang,
> > 
> > The only difference between this and what I have in my tree[*]
> > is the removal of the socket node (which has been in the Linux
> > docs since June 2019). Any reason why you removed that node? In
> > any case, I think I deserve a bit more credit for this patch.
> 
> Sorry, you surely deserve it. I forget to add it here.
> Should I have a SOB of you here ?
> 
> The latest linux kernel use a four level cpu topology defined in
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/cpu/cpu-topology.txt?h=v5.11
> 
> ie. socket node, cluster node, core node, thread node.

Yes, this is why the code I wrote uses the 'socket' node.

> 
> The linux kernel 4.19 LTS use a three level cpu topology defined in
> Documentation/devicetree/bindings/arm/topology.txt

I don't think we want to target that guest kernel with this
new QEMU feature. If we must support that guest kernel, then
I would do it under a machine property, like compat_cpumap
or something.

> 
> ie. cluster node, core node, thread node.
> 
> Currently Qemu x86 has 4 level of cpu topology as: socket, die, core,
> thread. Should arm64 active like it here ?

Does the arm64 guest kernel support the concept of 'die'? (I don't
think so) Anyway, there's no such concept in the current cpu-map
definition. So, if the guest kernel does support die, then what
does it map that to from DT and ACPI?

> 
> Further more, latest linux kernel define the cpu topology struct as.
> So maybe it only cares about the socket, core, thread topology levels.
> 
> struct cpu_topology {
> 
>     int thread_id;
> 
>     int core_id;
> 
>     int package_id;
> 
>     int llc_id;
> 
>     cpumask_t thread_sibling;
> 
>     cpumask_t core_sibling;
> 
>     cpumask_t llc_sibling;
> 
> };
> 
> > 
> > [*] https://github.com/rhdrjones/qemu/commit/35feecdd43475608c8f55973a0c159eac4aafefd
> > 
> > Thanks,
> > drew
> > 
> > On Thu, Feb 25, 2021 at 04:56:24PM +0800, Ying Fang wrote:
> > > Support device tree CPU topology descriptions.
> > > 
> > > Signed-off-by: Ying Fang <fangying1@huawei.com>
> > > ---
> > >   hw/arm/virt.c         | 38 +++++++++++++++++++++++++++++++++++++-
> > >   include/hw/arm/virt.h |  1 +
> > >   2 files changed, 38 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 371147f3ae..c133b342b8 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -351,10 +351,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> > >       int cpu;
> > >       int addr_cells = 1;
> > >       const MachineState *ms = MACHINE(vms);
> > > +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> > >       int smp_cpus = ms->smp.cpus;
> > >       /*
> > > -     * From Documentation/devicetree/bindings/arm/cpus.txt
> > > +     * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
> > >        *  On ARM v8 64-bit systems value should be set to 2,
> > >        *  that corresponds to the MPIDR_EL1 register size.
> > >        *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> > > @@ -407,8 +408,42 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> > >                   ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
> > >           }
> > > +        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> > > +            qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
> > > +                                  qemu_fdt_alloc_phandle(vms->fdt));
> > > +        }
> > > +
> > >           g_free(nodename);
> > >       }
> > > +
> > > +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> > > +        /*
> > > +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> > > +         */
> > > +        qemu_fdt_add_subnode(vms->fdt, "/cpus/cpu-map");
> > > +
> > > +        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
> > > +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
> > > +            char *map_path;
> > > +
> > > +            if (ms->smp.threads > 1) {
> > > +                map_path = g_strdup_printf(
> > > +                            "/cpus/cpu-map/%s%d/%s%d/%s%d",
> > > +                            "cluster", cpu / (ms->smp.cores * ms->smp.threads),
> 
> a cluster node may be replaced by socket to keep accord with the latest
> kernel.

Right, in which case this patch would be identical to the one in my
branch.

Thanks,
drew

> 
> > > +                            "core", (cpu / ms->smp.threads) % ms->smp.cores,
> > > +                            "thread", cpu % ms->smp.threads);
> > > +            } else {
> > > +                map_path = g_strdup_printf(
> > > +                            "/cpus/cpu-map/%s%d/%s%d",
> > > +                            "cluster", cpu / ms->smp.cores,
> > > +                            "core", cpu % ms->smp.cores);
> > > +            }
> > > +            qemu_fdt_add_path(vms->fdt, map_path);
> > > +            qemu_fdt_setprop_phandle(vms->fdt, map_path, "cpu", cpu_path);
> > > +            g_free(map_path);
> > > +            g_free(cpu_path);
> > > +        }
> > > +    }
> > >   }
> > >   static void fdt_add_its_gic_node(VirtMachineState *vms)
> > > @@ -2742,6 +2777,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
> > >       virt_machine_6_0_options(mc);
> > >       compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> > >       vmc->no_secure_gpio = true;
> > > +    vmc->no_cpu_topology = true;
> > >   }
> > >   DEFINE_VIRT_MACHINE(5, 2)
> > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > > index ee9a93101e..7ef6d08ac3 100644
> > > --- a/include/hw/arm/virt.h
> > > +++ b/include/hw/arm/virt.h
> > > @@ -129,6 +129,7 @@ struct VirtMachineClass {
> > >       bool no_kvm_steal_time;
> > >       bool acpi_expose_flash;
> > >       bool no_secure_gpio;
> > > +    bool no_cpu_topology;
> > >   };
> > >   struct VirtMachineState {
> > > -- 
> > > 2.23.0
> > > 
> > > 
> > 
> > .
> > 
> 


