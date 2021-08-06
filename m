Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0903E272D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:23:47 +0200 (CEST)
Received: from localhost ([::1]:60438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBw4w-0008V9-Ia
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mBw3x-0007mZ-FN
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:22:46 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:42927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mBw3t-0000Hg-Dl
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:22:45 -0400
Received: by mail-il1-x134.google.com with SMTP id i9so8166075ilk.9
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p7r5jJlnhw2321pJyjyQuw/aIicQNob0Dao1EhZhCew=;
 b=Pt3A1j+VL2dmzRkh3F3uYWCEsbTK8ZDbldX1o3nkZ5meo3CGr/FLY4+bm1VnaEm4oc
 dO/9+/o4wH2frOgfLBVyZbCfDhsFWZmZ3VJPmHmXMKARZVub4qohT6ylF1emnu2jGf5f
 6CvtawAQFe0iW5Vr4PHybqmA/OLvh4PJ5EmtYFSUeAWg+e5T6C0skUX3CCOoDO6sLjsp
 b7oO8cKtnZJNS6uv7WzKVlzwJXBID9BDUACXxYqckYTLtXSyWO32dGI376djNo4k+b23
 zI4z2yx+dUlvjtCCHoB69esT12y6ijCYjDWB9Gjd+JAR0iKWzN1Wb3x0KfAP12h2juN0
 rhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p7r5jJlnhw2321pJyjyQuw/aIicQNob0Dao1EhZhCew=;
 b=L7n9nZczCKMW6pl3B+AgEkHmiWUO9Pat9q4vHt6hSnYXg97aP+3tBVkmcune9Lva2s
 L0SCkk+wPBeEwe+MnvrFGPmGnmK+tqf+vh3StdaGUmiQFGsw8fEqA2wVhRjUpa31e7qR
 QpK+h7Dj2FZpMQA60eG99IYvRCjPAlrCJI0DIg6Iqa/3hzbh/MjNuUO1n6YfZa+jCa5s
 vTyjMAzLUwseud2JrVM+NNxrs3FK19DeEJrA85Y9FhoIVLvnLCpHL0Yhddp8YAzbxwrQ
 8j5DvIl18/cxaNxDjejv6R/xshEjziC/lPTzEsmWG9Di4AgxrDD6WvgfYoy5lqy51TAe
 aLXQ==
X-Gm-Message-State: AOAM530pMOIFUJSm5vRC8/zBY9u39E9vNjwZ/t6I8I8ZJl+FGtnim6Ax
 pz1bMm/PK6bI1DKn5tXp4buuEIo3s5lozZbfREY=
X-Google-Smtp-Source: ABdhPJz1jgKGBb84ViNW7pqQ7fGYFtrM1opShs9OkN6v+7x79icrmD1+TUMp/+dxGKQlJITBew/oPgXDvAftXvtRHjo=
X-Received: by 2002:a92:5205:: with SMTP id g5mr112941ilb.22.1628241759662;
 Fri, 06 Aug 2021 02:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210803080527.156556-1-wangyanan55@huawei.com>
 <20210803080527.156556-7-wangyanan55@huawei.com>
 <CAM9Jb+jwNAJWtjA1c3CQ=a4t--03_0kY9ZuMB+0LXfTWbOSVcA@mail.gmail.com>
 <5252d579-5a5a-a62a-69f6-17ab109c8f92@huawei.com>
In-Reply-To: <5252d579-5a5a-a62a-69f6-17ab109c8f92@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 6 Aug 2021 11:22:28 +0200
Message-ID: <CAM9Jb+iZMOC07V-Zb1BK4D6CWTuQqt=pJXPcDTFUiuhVQyBp3Q@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v4 06/14] machine: Prefer cores over sockets in
 smp parsing since 6.2
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x134.google.com
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
 Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
> >> Reviewed-by: Andrew Jones <drjones@redhat.com>
> >> Acked-by: Cornelia Huck <cohuck@redhat.com>
> >> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> >> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> >> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> >> ---
> >>   hw/arm/virt.c              |  1 +
> >>   hw/core/machine.c          | 36 ++++++++++++++++++++++++++----------
> >>   hw/i386/pc.c               | 36 ++++++++++++++++++++++++++----------
> >>   hw/i386/pc_piix.c          |  1 +
> >>   hw/i386/pc_q35.c           |  1 +
> >>   hw/ppc/spapr.c             |  1 +
> >>   hw/s390x/s390-virtio-ccw.c |  1 +
> >>   include/hw/boards.h        |  1 +
> >>   qemu-options.hx            |  3 ++-
> >>   9 files changed, 60 insertions(+), 21 deletions(-)
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
> >>   }
> >>   DEFINE_VIRT_MACHINE(6, 1)
> >>
> >> diff --git a/hw/core/machine.c b/hw/core/machine.c
> >> index 458d9736e3..a8173a0f45 100644
> >> --- a/hw/core/machine.c
> >> +++ b/hw/core/machine.c
> >> @@ -746,6 +746,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
> >>
> >>   static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> >>   {
> >> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> >>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
> >>       unsigned sockets = config->has_sockets ? config->sockets : 0;
> >>       unsigned cores   = config->has_cores ? config->cores : 0;
> >> @@ -757,7 +758,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> >>           return;
> >>       }
> >>
> >> -    /* compute missing values, prefer sockets over cores over threads */
> >> +    /* compute missing values based on the provided ones */
> >>       if (cpus == 0 && maxcpus == 0) {
> >>           sockets = sockets > 0 ? sockets : 1;
> >>           cores = cores > 0 ? cores : 1;
> >> @@ -765,15 +766,30 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
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
> >> -            threads = maxcpus / (sockets * cores);
> >> +        if (mc->smp_prefer_sockets) {
> >> +            /* prefer sockets over cores over threads before 6.2 */
> >> +            if (sockets == 0) {
> >> +                cores = cores > 0 ? cores : 1;
> >> +                threads = threads > 0 ? threads : 1;
> >> +                sockets = maxcpus / (cores * threads);
> >> +            } else if (cores == 0) {
> >> +                threads = threads > 0 ? threads : 1;
> >> +                cores = maxcpus / (sockets * threads);
> >> +            } else if (threads == 0) {
> >> +                threads = maxcpus / (sockets * cores);
> >> +            }
> >> +        } else {
> >> +            /* prefer cores over sockets over threads since 6.2 */
> >> +            if (cores == 0) {
> >> +                sockets = sockets > 0 ? sockets : 1;
> >> +                threads = threads > 0 ? threads : 1;
> >> +                cores = maxcpus / (sockets * threads);
> >> +            } else if (sockets == 0) {
> >> +                threads = threads > 0 ? threads : 1;
> >> +                sockets = maxcpus / (cores * threads);
> >> +            } else if (threads == 0) {
> >> +                threads = maxcpus / (sockets * cores);
> >> +            }
> > I feel this code is repeated at multiple places. Also, (threads == 0) case
> > at the end is common for all the cases, we can move it out of if-else?
> Hi Pankaj,
>
> Do you mean the code is repeated in the "if (mc->smp_prefer_sockets)"
> branch and "else" branch? The calculations of sockets and cores are
> different in the two branches, I think we have to keep them separately.
>
> I agree that (threads=0) case is common and we can try to move it out
> to a common place, I will refine this in next version.

exactly.

Thanks,
Pankaj

>
> Thanks,
> Yanan
> >>           }
> >>       }
> >>
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index afd8b9c283..5d7c3efc43 100644
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
> >> @@ -735,15 +736,30 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
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
> >> -            threads = maxcpus / (sockets * dies * cores);
> >> +        if (mc->smp_prefer_sockets) {
> >> +            /* prefer sockets over cores over threads before 6.2 */
> >> +            if (sockets == 0) {
> >> +                cores = cores > 0 ? cores : 1;
> >> +                threads = threads > 0 ? threads : 1;
> >> +                sockets = maxcpus / (dies * cores * threads);
> >> +            } else if (cores == 0) {
> >> +                threads = threads > 0 ? threads : 1;
> >> +                cores = maxcpus / (sockets * dies * threads);
> >> +            } else if (threads == 0) {
> >> +                threads = maxcpus / (sockets * dies * cores);
> >> +            }
> >> +        } else {
> >> +            /* prefer cores over sockets over threads since 6.2 */
> >> +            if (cores == 0) {
> >> +                sockets = sockets > 0 ? sockets : 1;
> >> +                threads = threads > 0 ? threads : 1;
> >> +                cores = maxcpus / (sockets * dies * threads);
> >> +            } else if (sockets == 0) {
> >> +                threads = threads > 0 ? threads : 1;
> >> +                sockets = maxcpus / (dies * cores * threads);
> >> +            } else if (threads == 0) {
> >> +                threads = maxcpus / (sockets * dies * cores);
> >> +            }
> >>           }
> >>       }
> >>
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

