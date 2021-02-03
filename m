Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D390E30DFFA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:47:41 +0100 (CET)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LJb-0004eP-MA
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7LFy-0002x8-Is
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:43:55 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7LFv-0005w8-In
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:43:53 -0500
Received: by mail-wr1-x42b.google.com with SMTP id b3so7051695wrj.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=c6/MiV2+qMrcMnZ1lz/3t+cfvSEp3JQTjVugLaBv9Ds=;
 b=lsw4TZU9nr3ommNblCRpL3hzJAvhPrSwlN1jE4T1vFbxNW2dTE6QTjMOZZnMxhixtz
 DnlxxG6886qeXSPKRmOt8u2yhHYx2d7Bndo4HP0BigJCwAmGyTbRvBI7iGc3Cl/a0qD4
 hhi/oRwYPG6smc+AZvLVd9r26qxRzO952DumDrgOH1lk6BPHzPNYn0QN6rX56tReox8a
 dNvCWGIUYmZaygg+tBwOIbjWL7nkF2XRjMcTIu4S0q+TkeISo07pfncgiRh0MekPKNr1
 lkV76lQSrtSOeCtwsXgX9i+ynSzDYRu5JyoLpUuJQAxQk77lNLmGMrto4OTThxmBAzh+
 Qgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=c6/MiV2+qMrcMnZ1lz/3t+cfvSEp3JQTjVugLaBv9Ds=;
 b=osbHebtYDQjstlKK4Ep86U5wBg0tqpuvJhXCnPYKWew0S55peb0t/o8yCgsp+MUSYR
 DrgYhBC1/6CF2VQGN2/LLFOixk6DiobDt/DUZfDgI2gajYako7mWyqinsZJtkikhJhN6
 EgamsmC9oEa+UjSfL8DomoCyNIPFWx0vSFNeP8sgNmK5CzDJtOZQjpmawiw09EZJO8Ku
 EkfpjGYWlVLQPUr9NZnjQedIp3ED3EYllv2j3XZwJTKF35JqHIutXJMMjYciyEwG//zQ
 hmC4HJyBa5ANL+Lyp8ezr7spceOKBtRGH3M+FJWIqG4KFocfnH+PZ7Xs+4YdmDIqmj1s
 NgIA==
X-Gm-Message-State: AOAM531xLH73YTvil0ejRhEsUmGjzu5JgejLnx3+409MR5e9R1Vgn7pY
 9B7ahXlQsvJ3BlCnhG61jIDlFg==
X-Google-Smtp-Source: ABdhPJzTqNFFFxES5w3V2jLy1o7rlHTUpybxP3Cm1KDBF23efkMzOQW4EviXMdUQe6La4mTKyN7h1A==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr4655807wrw.166.1612370629510; 
 Wed, 03 Feb 2021 08:43:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d9sm4670942wrq.74.2021.02.03.08.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 08:43:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 791E11FF7E;
 Wed,  3 Feb 2021 16:43:47 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-18-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 17/23] accel: replace struct CpusAccel with
 AccelOpsClass
Date: Wed, 03 Feb 2021 14:43:27 +0000
In-reply-to: <20210201100903.17309-18-cfontana@suse.de>
Message-ID: <877dnprtj0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

I'm confused as to the benefit of this classification because (see
bellow).

> also centralize the registration of the cpus.c module
> accelerator operations in accel/accel-softmmu.c
>
> Consequently, rename all tcg-cpus.c, kvm-cpus.c etc to
> tcg-accel-ops.c, kvm-accel-ops.c etc, also matching the
> object type names.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  accel/accel-softmmu.h                         | 15 ++++++
>  accel/kvm/kvm-cpus.h                          |  2 -
>  ...g-cpus-icount.h =3D> tcg-accel-ops-icount.h} |  2 +
>  accel/tcg/tcg-accel-ops-mttcg.h               | 19 ++++++++
>  .../tcg/{tcg-cpus-rr.h =3D> tcg-accel-ops-rr.h} |  0
>  accel/tcg/{tcg-cpus.h =3D> tcg-accel-ops.h}     |  6 +--
>  include/qemu/accel.h                          |  2 +
>  include/sysemu/accel-ops.h                    | 45 ++++++++++++++++++
>  include/sysemu/cpus.h                         | 26 ++--------
>  .../i386/hax/{hax-cpus.h =3D> hax-accel-ops.h}  |  2 -
>  target/i386/hax/hax-windows.h                 |  2 +-
>  .../i386/hvf/{hvf-cpus.h =3D> hvf-accel-ops.h}  |  2 -
>  .../whpx/{whpx-cpus.h =3D> whpx-accel-ops.h}    |  2 -
>  accel/accel-common.c                          | 11 +++++
>  accel/accel-softmmu.c                         | 43 +++++++++++++++--
>  accel/kvm/{kvm-cpus.c =3D> kvm-accel-ops.c}     | 26 +++++++---
>  accel/kvm/kvm-all.c                           |  2 -
>  accel/qtest/qtest.c                           | 23 ++++++---
>  ...g-cpus-icount.c =3D> tcg-accel-ops-icount.c} | 21 +++------
>  ...tcg-cpus-mttcg.c =3D> tcg-accel-ops-mttcg.c} | 14 ++----
>  .../tcg/{tcg-cpus-rr.c =3D> tcg-accel-ops-rr.c} | 13 ++---
>  accel/tcg/{tcg-cpus.c =3D> tcg-accel-ops.c}     | 47 ++++++++++++++++++-
>  accel/tcg/tcg-all.c                           | 12 -----
>  accel/xen/xen-all.c                           | 22 ++++++---
>  bsd-user/main.c                               |  3 +-
>  linux-user/main.c                             |  1 +
>  softmmu/cpus.c                                | 12 ++---
>  softmmu/vl.c                                  |  7 ++-
>  .../i386/hax/{hax-cpus.c =3D> hax-accel-ops.c}  | 31 ++++++++----
>  target/i386/hax/hax-all.c                     |  5 +-
>  target/i386/hax/hax-mem.c                     |  2 +-
>  target/i386/hax/hax-posix.c                   |  2 +-
>  target/i386/hax/hax-windows.c                 |  2 +-
>  .../i386/hvf/{hvf-cpus.c =3D> hvf-accel-ops.c}  | 29 +++++++++---
>  target/i386/hvf/hvf.c                         |  3 +-
>  target/i386/hvf/x86hvf.c                      |  2 +-
>  .../whpx/{whpx-cpus.c =3D> whpx-accel-ops.c}    | 31 ++++++++----
>  target/i386/whpx/whpx-all.c                   |  7 +--
>  MAINTAINERS                                   |  3 +-
>  accel/kvm/meson.build                         |  2 +-
>  accel/tcg/meson.build                         |  8 ++--
>  target/i386/hax/meson.build                   |  2 +-
>  target/i386/hvf/meson.build                   |  2 +-
>  target/i386/whpx/meson.build                  |  2 +-
>  44 files changed, 353 insertions(+), 162 deletions(-)
>  create mode 100644 accel/accel-softmmu.h
>  rename accel/tcg/{tcg-cpus-icount.h =3D> tcg-accel-ops-icount.h} (88%)
>  create mode 100644 accel/tcg/tcg-accel-ops-mttcg.h
>  rename accel/tcg/{tcg-cpus-rr.h =3D> tcg-accel-ops-rr.h} (100%)
>  rename accel/tcg/{tcg-cpus.h =3D> tcg-accel-ops.h} (72%)
>  create mode 100644 include/sysemu/accel-ops.h
>  rename target/i386/hax/{hax-cpus.h =3D> hax-accel-ops.h} (95%)
>  rename target/i386/hvf/{hvf-cpus.h =3D> hvf-accel-ops.h} (94%)
>  rename target/i386/whpx/{whpx-cpus.h =3D> whpx-accel-ops.h} (96%)
>  rename accel/kvm/{kvm-cpus.c =3D> kvm-accel-ops.c} (72%)
>  rename accel/tcg/{tcg-cpus-icount.c =3D> tcg-accel-ops-icount.c} (89%)
>  rename accel/tcg/{tcg-cpus-mttcg.c =3D> tcg-accel-ops-mttcg.c} (92%)
>  rename accel/tcg/{tcg-cpus-rr.c =3D> tcg-accel-ops-rr.c} (97%)
>  rename accel/tcg/{tcg-cpus.c =3D> tcg-accel-ops.c} (63%)
>  rename target/i386/hax/{hax-cpus.c =3D> hax-accel-ops.c} (69%)
>  rename target/i386/hvf/{hvf-cpus.c =3D> hvf-accel-ops.c} (84%)
>  rename target/i386/whpx/{whpx-cpus.c =3D> whpx-accel-ops.c} (71%)
>
> diff --git a/accel/accel-softmmu.h b/accel/accel-softmmu.h
> new file mode 100644
> index 0000000000..5e192f1882
> --- /dev/null
> +++ b/accel/accel-softmmu.h
> @@ -0,0 +1,15 @@
> +/*
> + * QEMU System Emulation accel internal functions
> + *
> + * Copyright 2021 SUSE LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef ACCEL_SOFTMMU_H
> +#define ACCEL_SOFTMMU_H
> +
> +void accel_init_ops_interfaces(AccelClass *ac);
> +
> +#endif /* ACCEL_SOFTMMU_H */
> diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
> index 3df732b816..bf0bd1bee4 100644
> --- a/accel/kvm/kvm-cpus.h
> +++ b/accel/kvm/kvm-cpus.h
> @@ -12,8 +12,6 @@
>=20=20
>  #include "sysemu/cpus.h"
>=20=20
> -extern const CpusAccel kvm_cpus;
> -
>  int kvm_init_vcpu(CPUState *cpu, Error **errp);
>  int kvm_cpu_exec(CPUState *cpu);
>  void kvm_destroy_vcpu(CPUState *cpu);
> diff --git a/accel/tcg/tcg-cpus-icount.h b/accel/tcg/tcg-accel-ops-icount=
.h
> similarity index 88%
> rename from accel/tcg/tcg-cpus-icount.h
> rename to accel/tcg/tcg-accel-ops-icount.h
> index b695939dfa..d884aa2aaa 100644
> --- a/accel/tcg/tcg-cpus-icount.h
> +++ b/accel/tcg/tcg-accel-ops-icount.h
> @@ -14,4 +14,6 @@ void icount_handle_deadline(void);
>  void icount_prepare_for_run(CPUState *cpu);
>  void icount_process_data(CPUState *cpu);
>=20=20
> +void icount_handle_interrupt(CPUState *cpu, int mask);
> +
>  #endif /* TCG_CPUS_ICOUNT_H */
> diff --git a/accel/tcg/tcg-accel-ops-mttcg.h b/accel/tcg/tcg-accel-ops-mt=
tcg.h
> new file mode 100644
> index 0000000000..9fdc5a2ab5
> --- /dev/null
> +++ b/accel/tcg/tcg-accel-ops-mttcg.h
> @@ -0,0 +1,19 @@
> +/*
> + * QEMU TCG Multi Threaded vCPUs implementation
> + *
> + * Copyright 2021 SUSE LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef TCG_CPUS_MTTCG_H
> +#define TCG_CPUS_MTTCG_H
> +
> +/* kick MTTCG vCPU thread */
> +void mttcg_kick_vcpu_thread(CPUState *cpu);
> +
> +/* start an mttcg vCPU thread */
> +void mttcg_start_vcpu_thread(CPUState *cpu);
> +
> +#endif /* TCG_CPUS_MTTCG_H */
> diff --git a/accel/tcg/tcg-cpus-rr.h b/accel/tcg/tcg-accel-ops-rr.h
> similarity index 100%
> rename from accel/tcg/tcg-cpus-rr.h
> rename to accel/tcg/tcg-accel-ops-rr.h
> diff --git a/accel/tcg/tcg-cpus.h b/accel/tcg/tcg-accel-ops.h
> similarity index 72%
> rename from accel/tcg/tcg-cpus.h
> rename to accel/tcg/tcg-accel-ops.h
> index d6893a32f8..48130006de 100644
> --- a/accel/tcg/tcg-cpus.h
> +++ b/accel/tcg/tcg-accel-ops.h
> @@ -14,12 +14,8 @@
>=20=20
>  #include "sysemu/cpus.h"
>=20=20
> -extern const CpusAccel tcg_cpus_mttcg;
> -extern const CpusAccel tcg_cpus_icount;
> -extern const CpusAccel tcg_cpus_rr;
> -
>  void tcg_cpus_destroy(CPUState *cpu);
>  int tcg_cpus_exec(CPUState *cpu);
> -void tcg_cpus_handle_interrupt(CPUState *cpu, int mask);
> +void tcg_handle_interrupt(CPUState *cpu, int mask);
>=20=20
>  #endif /* TCG_CPUS_H */
> diff --git a/include/qemu/accel.h b/include/qemu/accel.h
> index fac4a18703..b9d6d69eb8 100644
> --- a/include/qemu/accel.h
> +++ b/include/qemu/accel.h
> @@ -69,6 +69,8 @@ typedef struct AccelClass {
>  AccelClass *accel_find(const char *opt_name);
>  AccelState *current_accel(void);
>=20=20
> +void accel_init_interfaces(AccelClass *ac);
> +
>  #ifndef CONFIG_USER_ONLY
>  int accel_init_machine(AccelState *accel, MachineState *ms);
>=20=20
> diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
> new file mode 100644
> index 0000000000..032f6979d7
> --- /dev/null
> +++ b/include/sysemu/accel-ops.h
> @@ -0,0 +1,45 @@
> +/*
> + * Accelerator OPS, used for cpus.c module
> + *
> + * Copyright 2021 SUSE LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */

AhH I think the comment from the earlier patch was intended to be added
in this one ;-)

> +/* initialize the arch-independent accel operation interfaces */
> +void accel_init_ops_interfaces(AccelClass *ac)
> +{
> +    const char *ac_name;
> +    char *ops_name;
> +    AccelOpsClass *ops;
> +
> +    ac_name =3D object_class_get_name(OBJECT_CLASS(ac));
> +    g_assert(ac_name !=3D NULL);
> +
> +    ops_name =3D g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
> +    ops =3D ACCEL_OPS_CLASS(object_class_by_name(ops_name));
> +    g_free(ops_name);
> +
> +    /*
> +     * all accelerators need to define ops, providing at least a mandato=
ry
> +     * non-NULL create_vcpu_thread operation.
> +     */
> +    g_assert(ops !=3D NULL);

If create_vcpu_thread is mandatory then surely:

  g_assert(ops && ops->create_vcpu_thread);

> +    if (ops->ops_init) {
> +        ops->ops_init(ops);
> +    }
> +    cpus_register_accel(ops);
> +}
> +
<snip>
>=20=20
> -const CpusAccel kvm_cpus =3D {
> -    .create_vcpu_thread =3D kvm_start_vcpu_thread,
> +static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelOpsClass *ops =3D ACCEL_OPS_CLASS(oc);
>=20=20
> -    .synchronize_post_reset =3D kvm_cpu_synchronize_post_reset,
> -    .synchronize_post_init =3D kvm_cpu_synchronize_post_init,
> -    .synchronize_state =3D kvm_cpu_synchronize_state,
> -    .synchronize_pre_loadvm =3D kvm_cpu_synchronize_pre_loadvm,
> +    ops->create_vcpu_thread =3D kvm_start_vcpu_thread;
> +    ops->synchronize_post_reset =3D kvm_cpu_synchronize_post_reset;
> +    ops->synchronize_post_init =3D kvm_cpu_synchronize_post_init;
> +    ops->synchronize_state =3D kvm_cpu_synchronize_state;
> +    ops->synchronize_pre_loadvm =3D kvm_cpu_synchronize_pre_loadvm;
>  };

(continuing)

comparing the above with...

> +
> +static void tcg_accel_ops_init(AccelOpsClass *ops)
> +{
> +    if (qemu_tcg_mttcg_enabled()) {
> +        ops->create_vcpu_thread =3D mttcg_start_vcpu_thread;
> +        ops->kick_vcpu_thread =3D mttcg_kick_vcpu_thread;
> +        ops->handle_interrupt =3D tcg_handle_interrupt;
> +
> +    } else if (icount_enabled()) {
> +        ops->create_vcpu_thread =3D rr_start_vcpu_thread;
> +        ops->kick_vcpu_thread =3D rr_kick_vcpu_thread;
> +        ops->handle_interrupt =3D icount_handle_interrupt;
> +        ops->get_virtual_clock =3D icount_get;
> +        ops->get_elapsed_ticks =3D icount_get;
> +
> +    } else {
> +        ops->create_vcpu_thread =3D rr_start_vcpu_thread;
> +        ops->kick_vcpu_thread =3D rr_kick_vcpu_thread;
> +        ops->handle_interrupt =3D tcg_handle_interrupt;
> +    }
> +}
> +

..I wonder if loosing the const structures are worth it. Why not keep
them const and have the initial assignment:

 if(qemu_tcg_mttcg_enabled()) {
    ops =3D &mttcg_ops;
 } else {
    ...

is this an unavoidable result of the classification process? In which
case I want a better argument for it in the commit log.

--=20
Alex Benn=C3=A9e

