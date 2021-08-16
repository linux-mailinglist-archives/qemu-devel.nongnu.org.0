Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E33ECFDC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 10:01:55 +0200 (CEST)
Received: from localhost ([::1]:47906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFXZB-000196-Ku
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 04:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mFXXh-0000Mi-8P
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 04:00:21 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:37478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mFXXd-0004E3-L8
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 04:00:20 -0400
Received: by mail-il1-x12c.google.com with SMTP id f15so13640000ilk.4
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 01:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G6/W8BZQeXcD1MZCO8ekEw0XpaBG/8PKXNZHJQ3yNk4=;
 b=h/PvEQWqjtDRhB54oIPu4pc8IRLtfrZ8oNDkCE4PJ3mcU+kfSEtpb4+4UmdS9QgKIi
 ayDw+tj/SPCxs3K/D0y4v279lKUt4I8H8dyg1AWVfLHlKUNZYAmrGr1Q59Uk7/vU/por
 0aW7Z3hAAvkj4d6EGc7OXhZPDGx/YXA3nQ0h7g0Pcq1jIvjWQm5+9TrJmFkdr0Pxpwpw
 0HlrXrDWIjv8Qt/YowdBFYI6/2TV8Z/4haw2ySayziADsMDeyzlSqn9JrS16rs4WAQC4
 0JMbnQ1RhWzzvr5hWS+l2CE5BljOrVKidPDuiB4Gtp2JiIoip5510T0FgVjHbdlGXnbc
 IhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G6/W8BZQeXcD1MZCO8ekEw0XpaBG/8PKXNZHJQ3yNk4=;
 b=HG3ukgcxUa74+8gY3DzYLjmcsdqDYvRL+IB3hlJ0KziBjMx+2XghvcmibDGDZm/5XZ
 AWnj0q0UtGWboisxUkt/f/OpQMrXaFSVELdGKmPRzYfaSFkS+QoVXLXpJfSn0/HBycOB
 HJ1bnTy41hD97dIcrNSGxzs60Xsk/71jXALJt02aW+l8EAlV6mhakhtgPdbToaahAp5f
 nyoo56G154YJWLXeJfm9nSHhM6IkocdzQr1degPSumxX6YcRthRpCmss85igu23mOMYn
 JqRoNIFApHCcp9XIql5mEXCuSaCoMzabfPG2OmKaobYGYjqZenwEotVao1ppUQsC7qQd
 UO4g==
X-Gm-Message-State: AOAM530L8DGwwwzcNn1eWFDBQaLmds+mFn95VhkOYCAhjfZIs6KuqFOB
 4q0IR56MMEf2t52kiHKQcVADW7DeW+DNu1Au2mM=
X-Google-Smtp-Source: ABdhPJyKeccM4OQrNC2Qrkh8GO5aw9hLzb5CtcOcaqcsORU98f0b3t2OWnxy6PT3OHITnLQGk4mNHA8gSIMkwu/jtUs=
X-Received: by 2002:a92:de4b:: with SMTP id e11mr10689638ilr.22.1629100814688; 
 Mon, 16 Aug 2021 01:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210813023912.105880-1-wangyanan55@huawei.com>
 <20210813023912.105880-7-wangyanan55@huawei.com>
 <CAM9Jb+jtVV9SMPOKz_hXM-Lz6NqyCu9tEbHG-9uM19VgBCX=jg@mail.gmail.com>
 <353654b0-b3de-2c33-b2c6-43b764d6d51d@huawei.com>
In-Reply-To: <353654b0-b3de-2c33-b2c6-43b764d6d51d@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 16 Aug 2021 10:00:03 +0200
Message-ID: <CAM9Jb+ieJtS2dpe6U46cAsQpb1VH0odtEVaajp-5=4Z8S21Xaw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v5 06/14] machine: Prefer cores over sockets in
 smp parsing since 6.2
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On 2021/8/14 0:30, Pankaj Gupta wrote:
> >> In the real SMP hardware topology world, it's much more likely that
> >> we have high cores-per-socket counts and few sockets totally. While
> >> the current preference of sockets over cores in smp parsing results
> >> in a virtual cpu topology with low cores-per-sockets counts and a
> >> large number of sockets, which is just contrary to the real world.
> >>
> >> Given that it is better to make the virtual cpu topology be more
> >> reflective of the real world and also for the sake of compatibility,
> >> we start to prefer cores over sockets over threads in smp parsing
> >> since machine type 6.2 for different arches.
> >>
> >> In this patch, a boolean "smp_prefer_sockets" is added, and we only
> >> enable the old preference on older machines and enable the new one
> >> since type 6.2 for all arches by using the machine compat mechanism.
> >>
> >> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> >> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> >> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> >> Acked-by: Cornelia Huck <cohuck@redhat.com>
> >> Reviewed-by: Andrew Jones <drjones@redhat.com>
> >> ---
> >>   hw/arm/virt.c              |  1 +
> >>   hw/core/machine.c          | 35 ++++++++++++++++++++++++++---------
> >>   hw/i386/pc.c               | 35 ++++++++++++++++++++++++++---------
> >>   hw/i386/pc_piix.c          |  1 +
> >>   hw/i386/pc_q35.c           |  1 +
> >>   hw/ppc/spapr.c             |  1 +
> >>   hw/s390x/s390-virtio-ccw.c |  1 +
> >>   include/hw/boards.h        |  1 +
> >>   qemu-options.hx            |  3 ++-
> >>   9 files changed, 60 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 01165f7f53..7babea40dc 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -2797,6 +2797,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
> >>   {
> >>       virt_machine_6_2_options(mc);
> >>       compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> >> +    mc->smp_prefer_sockets = true;
> > Will this be set for virt_machine_6_2_?
> >
> Hi,
>
> We hope to start to assume cores over sockets on virt_6_2 machines
> and the later, and keep the old style of assuming sockets over cores
> on virt_6_1 machines and the older. Is there any concern here?

O.k. Thank you for clarifying.

Best regards,
Pankaj

>
> Thanks,
> Yanan
> >>   }
> >>   DEFINE_VIRT_MACHINE(6, 1)
> >>
> >> diff --git a/hw/core/machine.c b/hw/core/machine.c
> >> index bdce80df32..15b41c52e8 100644
> >> --- a/hw/core/machine.c
> >> +++ b/hw/core/machine.c
> >> @@ -748,6 +748,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
> >>
> >>   static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> >>   {
> >> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> >>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
> >>       unsigned sockets = config->has_sockets ? config->sockets : 0;
> >>       unsigned cores   = config->has_cores ? config->cores : 0;
> >> @@ -759,7 +760,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> >>           return;
> >>       }
> >>
> >> -    /* compute missing values, prefer sockets over cores over threads */
> >> +    /* compute missing values based on the provided ones */
> >>       if (cpus == 0 && maxcpus == 0) {
> >>           sockets = sockets > 0 ? sockets : 1;
> >>           cores = cores > 0 ? cores : 1;
> >> @@ -767,14 +768,30 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> >>       } else {
> >>           maxcpus = maxcpus > 0 ? maxcpus : cpus;
> >>
> >> -        if (sockets == 0) {
> >> -            cores = cores > 0 ? cores : 1;
> >> -            threads = threads > 0 ? threads : 1;
> >> -            sockets = maxcpus / (cores * threads);
> >> -        } else if (cores == 0) {
> >> -            threads = threads > 0 ? threads : 1;
> >> -            cores = maxcpus / (sockets * threads);
> >> -        } else if (threads == 0) {
> >> +        if (mc->smp_prefer_sockets) {
> >> +            /* prefer sockets over cores before 6.2 */
> >> +            if (sockets == 0) {
> >> +                cores = cores > 0 ? cores : 1;
> >> +                threads = threads > 0 ? threads : 1;
> >> +                sockets = maxcpus / (cores * threads);
> >> +            } else if (cores == 0) {
> >> +                threads = threads > 0 ? threads : 1;
> >> +                cores = maxcpus / (sockets * threads);
> >> +            }
> >> +        } else {
> >> +            /* prefer cores over sockets since 6.2 */
> >> +            if (cores == 0) {
> >> +                sockets = sockets > 0 ? sockets : 1;
> >> +                threads = threads > 0 ? threads : 1;
> >> +                cores = maxcpus / (sockets * threads);
> >> +            } else if (sockets == 0) {
> >> +                threads = threads > 0 ? threads : 1;
> >> +                sockets = maxcpus / (cores * threads);
> >> +            }
> >> +        }
> >> +
> >> +        /* try to calculate omitted threads at last */
> >> +        if (threads == 0) {
> >>               threads = maxcpus / (sockets * cores);
> >>           }
> >>       }
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index afd8b9c283..4b05ff7160 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -717,6 +717,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
> >>    */
> >>   static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> >>   {
> >> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> >>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
> >>       unsigned sockets = config->has_sockets ? config->sockets : 0;
> >>       unsigned dies    = config->has_dies ? config->dies : 0;
> >> @@ -727,7 +728,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
> >>       /* directly default dies to 1 if it's omitted */
> >>       dies = dies > 0 ? dies : 1;
> >>
> >> -    /* compute missing values, prefer sockets over cores over threads */
> >> +    /* compute missing values based on the provided ones */
> >>       if (cpus == 0 && maxcpus == 0) {
> >>           sockets = sockets > 0 ? sockets : 1;
> >>           cores = cores > 0 ? cores : 1;
> >> @@ -735,14 +736,30 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
> >>       } else {
> >>           maxcpus = maxcpus > 0 ? maxcpus : cpus;
> >>
> >> -        if (sockets == 0) {
> >> -            cores = cores > 0 ? cores : 1;
> >> -            threads = threads > 0 ? threads : 1;
> >> -            sockets = maxcpus / (dies * cores * threads);
> >> -        } else if (cores == 0) {
> >> -            threads = threads > 0 ? threads : 1;
> >> -            cores = maxcpus / (sockets * dies * threads);
> >> -        } else if (threads == 0) {
> >> +        if (mc->smp_prefer_sockets) {
> >> +            /* prefer sockets over cores before 6.2 */
> >> +            if (sockets == 0) {
> >> +                cores = cores > 0 ? cores : 1;
> >> +                threads = threads > 0 ? threads : 1;
> >> +                sockets = maxcpus / (dies * cores * threads);
> >> +            } else if (cores == 0) {
> >> +                threads = threads > 0 ? threads : 1;
> >> +                cores = maxcpus / (sockets * dies * threads);
> >> +            }
> >> +        } else {
> >> +            /* prefer cores over sockets since 6.2 */
> >> +            if (cores == 0) {
> >> +                sockets = sockets > 0 ? sockets : 1;
> >> +                threads = threads > 0 ? threads : 1;
> >> +                cores = maxcpus / (sockets * dies * threads);
> >> +            } else if (sockets == 0) {
> >> +                threads = threads > 0 ? threads : 1;
> >> +                sockets = maxcpus / (dies * cores * threads);
> >> +            }
> >> +        }
> >> +
> >> +        /* try to calculate omitted threads at last */
> >> +        if (threads == 0) {
> >>               threads = maxcpus / (sockets * dies * cores);
> >>           }
> >>       }
> >> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >> index fd5c2277f2..9b811fc6ca 100644
> >> --- a/hw/i386/pc_piix.c
> >> +++ b/hw/i386/pc_piix.c
> >> @@ -432,6 +432,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
> >>       m->is_default = false;
> >>       compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> >>       compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> >> +    m->smp_prefer_sockets = true;
> >>   }
> >>
> >>   DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
> >> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> >> index b45903b15e..88efb7fde4 100644
> >> --- a/hw/i386/pc_q35.c
> >> +++ b/hw/i386/pc_q35.c
> >> @@ -372,6 +372,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
> >>       m->alias = NULL;
> >>       compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> >>       compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> >> +    m->smp_prefer_sockets = true;
> >>   }
> >>
> >>   DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
> >> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >> index d39fd4e644..a481fade51 100644
> >> --- a/hw/ppc/spapr.c
> >> +++ b/hw/ppc/spapr.c
> >> @@ -4702,6 +4702,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
> >>   {
> >>       spapr_machine_6_2_class_options(mc);
> >>       compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> >> +    mc->smp_prefer_sockets = true;
> >>   }
> >>
> >>   DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
> >> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> >> index 4d25278cf2..b40e647883 100644
> >> --- a/hw/s390x/s390-virtio-ccw.c
> >> +++ b/hw/s390x/s390-virtio-ccw.c
> >> @@ -809,6 +809,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
> >>   {
> >>       ccw_machine_6_2_class_options(mc);
> >>       compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> >> +    mc->smp_prefer_sockets = true;
> >>   }
> >>   DEFINE_CCW_MACHINE(6_1, "6.1", false);
> >>
> >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> >> index 463a5514f9..2ae039b74f 100644
> >> --- a/include/hw/boards.h
> >> +++ b/include/hw/boards.h
> >> @@ -247,6 +247,7 @@ struct MachineClass {
> >>       bool nvdimm_supported;
> >>       bool numa_mem_supported;
> >>       bool auto_enable_numa;
> >> +    bool smp_prefer_sockets;
> >>       const char *default_ram_id;
> >>
> >>       HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> >> diff --git a/qemu-options.hx b/qemu-options.hx
> >> index 06f819177e..451d2cd817 100644
> >> --- a/qemu-options.hx
> >> +++ b/qemu-options.hx
> >> @@ -238,7 +238,8 @@ SRST
> >>       Historically preference was given to the coarsest topology parameters
> >>       when computing missing values (ie sockets preferred over cores, which
> >>       were preferred over threads), however, this behaviour is considered
> >> -    liable to change.
> >> +    liable to change. Prior to 6.2 the preference was sockets over cores
> >> +    over threads. Since 6.2 the preference is cores over sockets over threads.
> >>   ERST
> >>
> >>   DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> >> --
> >> 2.19.1
> >>
> > .
>

