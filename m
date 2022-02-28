Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D04C6576
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 10:11:00 +0100 (CET)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOc3S-0004KO-T8
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 04:10:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nOc18-0003QR-A6
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:08:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nOc13-0000Ny-U8
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646039304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8Fbj1wN8eX17xPIqPyKUR0w+Qgtq8Ssi1l7S6KmJXk=;
 b=cR8uZUn/z0QjGaO5FZIbU0n/9HvzbHvMXDOquczaHPcf+qmg8MbwPWq+WC06FBvJB0xMb/
 XXLQWgjdbg2ngLHjZpkY/N8MXmSuJuj1B7oFlVS0XrtAvJScxvxk/4XFkpXf6Hc9svjy9c
 pbHw5kAq7pOqOtp2U4onwiiOzRWH1yM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-YoS2OJVuP0izNd2IX5mPyA-1; Mon, 28 Feb 2022 04:08:23 -0500
X-MC-Unique: YoS2OJVuP0izNd2IX5mPyA-1
Received: by mail-ed1-f71.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso5498752edh.1
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 01:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8Fbj1wN8eX17xPIqPyKUR0w+Qgtq8Ssi1l7S6KmJXk=;
 b=DOIcQyJNG2eOTGNEobml6mUaBUvYlQtYawiNXFie5zR1YLf+mz016uHQYt/vL152tb
 eDH7H73VttEUgf219w99PG2YMCSJZeHmLMz6+yJ+jzLXyB2da1aCZsFO01jVsJt4ccHM
 kcXuqORvOYkk7DOK9yHx/+b10cah3UyWbMlW+qXsqHSVzmxTcGOBqpT8dUMdKW/Xn0+O
 yavs4JB3ZHtaq/pDcuR4a31riRr5Vm+RRCBkhbMWwR4Yp0OUU4DAJYZctn76zhvwKgHc
 ZnybouGWYITYYvazqaMN7qUlp9fgtLxEmrKGX5ByVxBzHvoQJY4NerYlLd4HeM0VKHJ6
 8QqA==
X-Gm-Message-State: AOAM530I+Sl8d3795J8hnOO+k/M1/SYkj7mcetbHKz6qO8IilHwMW9o8
 +NcuHpXZ74hE6Pi7runDfMI1ACnlHdbPWigZ5ENaAQ0LbEQ+3GDDjbFz7aGXG70r5fIJPRRPnI8
 dMsdtJs6GZqAWsgs=
X-Received: by 2002:a05:6402:424b:b0:410:92aa:30b1 with SMTP id
 g11-20020a056402424b00b0041092aa30b1mr18063790edb.297.1646039302402; 
 Mon, 28 Feb 2022 01:08:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4yjNIhK5hQfb5Tqey+68/pC0+xDUrD8tkQXqGO8nBxkBE4xZJZADHUiGeMAjKsYdAoUZR8A==
X-Received: by 2002:a05:6402:424b:b0:410:92aa:30b1 with SMTP id
 g11-20020a056402424b00b0041092aa30b1mr18063757edb.297.1646039302093; 
 Mon, 28 Feb 2022 01:08:22 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090729d200b006ce7917fe37sm4165567ejc.85.2022.02.28.01.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 01:08:21 -0800 (PST)
Date: Mon, 28 Feb 2022 10:08:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
Message-ID: <20220228100820.477e2311@redhat.com>
In-Reply-To: <20220228075203.60064-1-gshan@redhat.com>
References: <20220228075203.60064-1-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 15:52:03 +0800
Gavin Shan <gshan@redhat.com> wrote:

> When the memory size on the first NUMA node is less than 128MB, the
> guest hangs inside EDK2 as the following logs show.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64         \
>   -accel kvm -machine virt,gic-version=host                       \
>   -cpu host -smp 8,sockets=2,cores=2,threads=2                    \
>   -m 1024M,slots=16,maxmem=64G                                    \
>   -object memory-backend-ram,id=mem0,size=127M                    \
>   -object memory-backend-ram,id=mem1,size=897M                    \
>   -numa node,nodeid=0,memdev=mem0                                 \
>   -numa node,nodeid=1,memdev=mem1                                 \
>   -L /home/gavin/sandbox/qemu.main/build/pc-bios                  \
>    :
>   QemuVirtMemInfoPeiLibConstructor: System RAM @ 0x47F00000 - 0x7FFFFFFF
>   QemuVirtMemInfoPeiLibConstructor: System RAM @ 0x40000000 - 0x47EFFFFF
>   ASSERT [MemoryInit] /home/lacos/src/upstream/qemu/roms/edk2/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibConstructor.c(93): NewSize >= 0x08000000
> 
> This adds MachineClass::validate_numa_nodes() to validate the memory
> size on the first NUMA node. The guest is stopped from booting and
> the reason is given for this specific case.

Unless it architecturally wrong thing i.e. (node size less than 128Mb)
,in which case limiting it in QEMU would be justified, I'd prefer
firmware being fixed or it reporting more useful for user error message.
 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c       | 9 +++++++++
>  hw/core/numa.c      | 5 +++++
>  include/hw/boards.h | 1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 46bf7ceddf..234e7fca28 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2491,6 +2491,14 @@ static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>      return idx % ms->numa_state->num_nodes;
>  }
>  
> +static void virt_validate_numa_nodes(MachineState *ms)
> +{
> +    if (ms->numa_state->nodes[0].node_mem < 128 * MiB) {
> +        error_report("The first NUMA node should have at least 128MB memory");
> +        exit(1);

perhaps error_fatal() would be better

> +    }
> +}
> +
>  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>  {
>      int n;
> @@ -2836,6 +2844,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +    mc->validate_numa_nodes = virt_validate_numa_nodes;
>      mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 1aa05dcf42..543a2eaf11 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -724,6 +724,11 @@ void numa_complete_configuration(MachineState *ms)
>              /* Validation succeeded, now fill in any missing distances. */
>              complete_init_numa_distance(ms);
>          }
> +
> +        /* Validate NUMA nodes for the individual machine */
> +        if (mc->validate_numa_nodes) {
> +            mc->validate_numa_nodes(ms);
> +        }
>      }
>  }
>  
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index c92ac8815c..9709a35eeb 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -282,6 +282,7 @@ struct MachineClass {
>                                                           unsigned cpu_index);
>      const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
>      int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
> +    void (*validate_numa_nodes)(MachineState *ms);
>      ram_addr_t (*fixup_ram_size)(ram_addr_t size);
>  };
>  


