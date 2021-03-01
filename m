Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B8327B1E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 10:49:48 +0100 (CET)
Received: from localhost ([::1]:57700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGfBS-0001Tc-Sd
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 04:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lGfA8-0000um-2D
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 04:48:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lGfA5-0006k6-DQ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 04:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614592100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o4Y6pTc9YlNQ4rmZXgBdyvc/3INnL0aHSIpLmHnvFnE=;
 b=UpgPl4kziWzynxjwfkWIkJ8M2jirg6AWF3kWNUp9qXUmY1NviXE3FfOPJqzFWRTPQKTpgs
 VEQdtF4ugIdscL67h2GNw3cagiwcUBh92PtLiUrYe0gn9jyuGMIXUUptbeZAIFsDx9Nn1P
 VsH++EFTmgr3dGemjvnSG6GM7b/NJ00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-SLQw83lAObms14H0k_vZlw-1; Mon, 01 Mar 2021 04:48:16 -0500
X-MC-Unique: SLQw83lAObms14H0k_vZlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E376801976;
 Mon,  1 Mar 2021 09:48:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33DD1620DE;
 Mon,  1 Mar 2021 09:48:07 +0000 (UTC)
Date: Mon, 1 Mar 2021 10:48:04 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210301094804.teo4szecdppo5dp5@kamzik.brq.redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225120255.4gfbtsflbdsyxizn@kamzik.brq.redhat.com>
 <261f7e04-ea59-6883-981f-3891c240416e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <261f7e04-ea59-6883-981f-3891c240416e@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Feb 26, 2021 at 04:41:45PM +0800, Ying Fang wrote:
> 
> 
> On 2/25/2021 8:02 PM, Andrew Jones wrote:
> > On Thu, Feb 25, 2021 at 04:56:22PM +0800, Ying Fang wrote:
> > > An accurate cpu topology may help improve the cpu scheduler's decision
> > > making when dealing with multi-core system. So cpu topology description
> > > is helpful to provide guest with the right view. Dario Faggioli's talk
> > > in [0] also shows the virtual topology may has impact on sched performace.
> > > Thus this patch series is posted to introduce cpu topology support for
> > > arm platform.
> > > 
> > > Both fdt and ACPI are introduced to present the cpu topology. To describe
> > > the cpu topology via ACPI, a PPTT table is introduced according to the
> > > processor hierarchy node structure. This series is derived from [1], in
> > > [1] we are trying to bring both cpu and cache topology support for arm
> > > platform, but there is still some issues to solve to support the cache
> > > hierarchy. So we split the cpu topology part out and send it seperately.
> > > The patch series to support cache hierarchy will be send later since
> > > Salil Mehta's cpu hotplug feature need the cpu topology enabled first and
> > > he is waiting for it to be upstreamed.
> > > 
> > > This patch series was initially based on the patches posted by Andrew Jones [2].
> > > I jumped in on it since some OS vendor cooperative partner are eager for it.
> > > Thanks for Andrew's contribution.
> > > 
> > > After applying this patch series, launch a guest with virt-6.0 and cpu
> > > topology configured with sockets:cores:threads = 2:4:2, you will get the
> > > bellow messages with the lscpu command.
> > > 
> > > -----------------------------------------
> > > Architecture:                    aarch64
> > > CPU op-mode(s):                  64-bit
> > > Byte Order:                      Little Endian
> > > CPU(s):                          16
> > > On-line CPU(s) list:             0-15
> > > Thread(s) per core:              2
> > 
> > What CPU model was used? Did it actually support threads? If these were
> 
> It's tested on Huawei Kunpeng 920 CPU model and vcpu host-passthrough.
> It does not support threads for now, but the next version 930 may
> support it. Here we emulate a virtual cpu topology, a virtual 2 threads
> is used to do the test.
> 
> 
> > KVM VCPUs, then I guess MPIDR.MT was not set on the CPUs. Apparently
> > that didn't confuse Linux? See [1] for how I once tried to deal with
> > threads.
> > 
> > [1] https://github.com/rhdrjones/qemu/commit/60218e0dd7b331031b644872d56f2aca42d0ff1e
> > 
> 
> If ACPI PPTT table is specified, the linux kernel won't check the MPIDR
> register to populate cpu topology. Moreover MPIDR does not ensure a
> right cpu topology. So it won't be a problem if MPIDR.MT is not set.

OK, so Linux doesn't care about MPIDR.MT with ACPI. What happens with
DT?

> 
> > > Core(s) per socket:              4
> > > Socket(s):                       2
> > 
> > Good, but what happens if you specify '-smp 16'? Do you get 16 sockets
              ^^ You didn't answer this question.

> > each with 1 core? Or, do you get 1 socket with 16 cores? And, which do
> > we want and why? If you look at [2], then you'll see I was assuming we
> > want to prefer cores over sockets, since without topology descriptions
> > that's what the Linux guest kernel would do.
> > 
> > [2] https://github.com/rhdrjones/qemu/commit/c0670b1bccb4d08c7cf7c6957cc8878a2af131dd
> > 
> > > NUMA node(s):                    2
> > 
> > Why do we have two NUMA nodes in the guest? The two sockets in the
> > guest should not imply this.
> 
> The two NUMA nodes are emulated by Qemu since we already have guest numa
> topology feature.

That's what I suspected, and I presume only a single node is present when
you don't use QEMU's NUMA feature - even when you supply a VCPU topology
with multiple sockets?

Thanks,
drew

> So the two sockets in the guest has nothing to do with
> it. Actually even one socket may have two numa nodes in it in real cpu
> model.
> 
> > 
> > Thanks,
> > drew
> > 
> > > Vendor ID:                       HiSilicon
> > > Model:                           0
> > > Model name:                      Kunpeng-920
> > > Stepping:                        0x1
> > > BogoMIPS:                        200.00
> > > NUMA node0 CPU(s):               0-7
> > > NUMA node1 CPU(s):               8-15
> > > 
> > > [0] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse
> > > [1] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02166.html
> > > [2] https://patchwork.ozlabs.org/project/qemu-devel/cover/20180704124923.32483-1-drjones@redhat.com
> > > 
> > > Ying Fang (5):
> > >    device_tree: Add qemu_fdt_add_path
> > >    hw/arm/virt: Add cpu-map to device tree
> > >    hw/arm/virt-acpi-build: distinguish possible and present cpus
> > >    hw/acpi/aml-build: add processor hierarchy node structure
> > >    hw/arm/virt-acpi-build: add PPTT table
> > > 
> > >   hw/acpi/aml-build.c          | 40 ++++++++++++++++++++++
> > >   hw/arm/virt-acpi-build.c     | 64 +++++++++++++++++++++++++++++++++---
> > >   hw/arm/virt.c                | 40 +++++++++++++++++++++-
> > >   include/hw/acpi/acpi-defs.h  | 13 ++++++++
> > >   include/hw/acpi/aml-build.h  |  7 ++++
> > >   include/hw/arm/virt.h        |  1 +
> > >   include/sysemu/device_tree.h |  1 +
> > >   softmmu/device_tree.c        | 45 +++++++++++++++++++++++--
> > >   8 files changed, 204 insertions(+), 7 deletions(-)
> > > 
> > > -- 
> > > 2.23.0
> > > 
> > 
> > .
> > 
> 


