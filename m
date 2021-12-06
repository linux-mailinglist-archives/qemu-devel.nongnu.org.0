Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8285F468FDE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 05:40:14 +0100 (CET)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu5nR-0006Xb-D6
	for lists+qemu-devel@lfdr.de; Sun, 05 Dec 2021 23:40:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1mu5m5-0005V7-EL
 for qemu-devel@nongnu.org; Sun, 05 Dec 2021 23:38:49 -0500
Received: from [2a00:1450:4864:20::433] (port=38775
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1mu5m3-0000tW-Q3
 for qemu-devel@nongnu.org; Sun, 05 Dec 2021 23:38:49 -0500
Received: by mail-wr1-x433.google.com with SMTP id q3so19706564wru.5
 for <qemu-devel@nongnu.org>; Sun, 05 Dec 2021 20:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Id3VWnlVZA9EEK4GGSk7mCeUau2Jnoghi/HVhpGH9Jk=;
 b=XomD37xkNmbib1ufnIHImpKkLdcIEOK9vVitlFMhBf+dp2YEnGBXjA2QGutyanAQ+8
 bU5ulP9QdWSrdpqz1x3EHkOYt4PHEOqPK8Zoa/hgMBrgYLPAMyB5EJZNyYvk0VUTZan1
 hJJ7Zzm4Xd5xYgxnm69GxVZ5MW3qck2E5LRJ3fkYdDKeqbMjzxBaTmdTC5OSkfAByIlw
 /vCFAesFTJ65NVr2ET8JBTE6+CP/Ridyb/cEy9PWfXwqdpLKGIpyxI86iLxtsoXmO67t
 FxU3JJjZJ/EVzIzaDT6FYYSGAhSArXjiPf9PzO4RvO8gwB81cXVyF0L91atRjPj9eMbN
 qKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Id3VWnlVZA9EEK4GGSk7mCeUau2Jnoghi/HVhpGH9Jk=;
 b=Rsjxu7k30gNWr/pAIHWLae+pjGRv8QN/fqmFT890c0D6nerU1ELQ+xIBNqT3fuJJWw
 HYlPk7OlTiATbkjsh2QisAoNhOhmpp4CYfVfxvIJn0xqEcYc/EFn6vfTpX9G3FFER5+Y
 u2lTmPpwPgxBhhnPy9NzQfpWHdn1fvwCorbJyoiyPgnDZbRsIRWhHaJZ+Q2VfqFHImw0
 tHWYqvtkUSseFXDQ6CS646Gmo3D14Z1JJdE6Y46OfHJm5j2GlFcJp6C2i+rCPps1VCK6
 94dfn2TUBscC54LZWeFoK8fpdKxYj0gqhMyP1Lfk3BTED6U7jka1jRyr6vFQkjK8KSY4
 xJ2Q==
X-Gm-Message-State: AOAM532FXy32xYyQ+kL+7h5PaFTO4/zTBd92j+SXYO0kxNpjborqqPWK
 GbqEj1wGaVc4AlX0Ium60hA+/aAjhY+Qg3ub4J4=
X-Google-Smtp-Source: ABdhPJzmMSrXJUvO8uSvnm6O6mdYZFnG38jNSACkT7bITxOzX3w91TChyf+qFMWel0QH7mqeTmkShX9auwa91Q8ONMg=
X-Received: by 2002:a5d:4b8a:: with SMTP id b10mr40967075wrt.413.1638765526345; 
 Sun, 05 Dec 2021 20:38:46 -0800 (PST)
MIME-Version: 1.0
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-6-git-send-email-yangxiaojuan@loongson.cn>
In-Reply-To: <1638619645-11283-6-git-send-email-yangxiaojuan@loongson.cn>
From: chen huacai <zltjiangshi@gmail.com>
Date: Mon, 6 Dec 2021 12:38:35 +0800
Message-ID: <CABDp7Vr5b_gpE3d3U1NL1VMw4xoZMEqtnOiiVe=j-5ODerefng@mail.gmail.com>
Subject: Re: [RFC PATCH v3 05/27] target/loongarch: Add stabletimer support
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=zltjiangshi@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 mark.cave-ayland@ilande.co.uk, qemu-level <qemu-devel@nongnu.org>,
 peterx@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 alistair.francis@wdc.com, maobibo@loongson.cn, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, i.qemu@xen0n.name,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Xiaojuan,

Maybe it is better to use "constant timer" instead of "stable timer",
which is more "native" in English.

Huacai

On Sat, Dec 4, 2021 at 8:11 PM Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  target/loongarch/cpu.c         |  9 +++++
>  target/loongarch/cpu.h         | 10 ++++++
>  target/loongarch/meson.build   |  1 +
>  target/loongarch/stabletimer.c | 63 ++++++++++++++++++++++++++++++++++
>  4 files changed, 83 insertions(+)
>  create mode 100644 target/loongarch/stabletimer.c
>
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 343632c644..f34e9763af 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -234,12 +234,21 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
>      LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(dev);
>      Error *local_err = NULL;
>
> +#ifndef CONFIG_USER_ONLY
> +    LoongArchCPU *cpu = LOONGARCH_CPU(dev);
> +#endif
> +
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err != NULL) {
>          error_propagate(errp, local_err);
>          return;
>      }
>
> +#ifndef CONFIG_USER_ONLY
> +    timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
> +                  &loongarch_stable_timer_cb, cpu);
> +#endif
> +
>      cpu_reset(cs);
>      qemu_init_vcpu(cs);
>
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index a4acd3b285..aeb8a5d397 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -12,6 +12,7 @@
>  #include "fpu/softfloat-types.h"
>  #include "hw/registerfields.h"
>  #include "cpu-csr.h"
> +#include "qemu/timer.h"
>
>  #define TCG_GUEST_DEFAULT_MO (0)
>
> @@ -148,6 +149,9 @@ FIELD(CPUCFG20, L3IU_SIZE, 24, 7)
>  extern const char * const regnames[];
>  extern const char * const fregnames[];
>
> +#define N_IRQS      14
> +#define IRQ_TIMER   11
> +
>  typedef struct CPULoongArchState CPULoongArchState;
>  struct CPULoongArchState {
>      uint64_t gpr[32];
> @@ -242,6 +246,7 @@ struct LoongArchCPU {
>
>      CPUNegativeOffsetState neg;
>      CPULoongArchState env;
> +    QEMUTimer timer; /* Internal timer */
>  };
>
>  #define TYPE_LOONGARCH_CPU "loongarch-cpu"
> @@ -306,4 +311,9 @@ enum {
>  #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
>
> +void loongarch_stable_timer_cb(void *opaque);
> +uint64_t cpu_loongarch_get_stable_counter(LoongArchCPU *cpu);
> +uint64_t cpu_loongarch_get_stable_timer_ticks(LoongArchCPU *cpu);
> +void cpu_loongarch_store_stable_timer_config(LoongArchCPU *cpu,
> +                                             uint64_t value);
>  #endif /* LOONGARCH_CPU_H */
> diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
> index 103f36ee15..bda9f47ae4 100644
> --- a/target/loongarch/meson.build
> +++ b/target/loongarch/meson.build
> @@ -17,6 +17,7 @@ loongarch_tcg_ss.add(zlib)
>  loongarch_softmmu_ss = ss.source_set()
>  loongarch_softmmu_ss.add(files(
>    'machine.c',
> +  'stabletimer.c',
>  ))
>
>  loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
> diff --git a/target/loongarch/stabletimer.c b/target/loongarch/stabletimer.c
> new file mode 100644
> index 0000000000..151f5073f5
> --- /dev/null
> +++ b/target/loongarch/stabletimer.c
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch timer support
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "qemu/timer.h"
> +#include "cpu.h"
> +
> +#define TIMER_PERIOD                10 /* 10 ns period for 100 Mhz frequency */
> +#define STABLETIMER_TICK_MASK       0xfffffffffffcUL
> +#define STABLETIMER_ENABLE          0x1UL
> +
> +/* LoongArch timer */
> +uint64_t cpu_loongarch_get_stable_counter(LoongArchCPU *cpu)
> +{
> +    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / TIMER_PERIOD;
> +}
> +
> +uint64_t cpu_loongarch_get_stable_timer_ticks(LoongArchCPU *cpu)
> +{
> +    uint64_t now, expire;
> +
> +    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    expire = timer_expire_time_ns(&cpu->timer);
> +
> +    return (expire - now) / TIMER_PERIOD;
> +}
> +
> +void cpu_loongarch_store_stable_timer_config(LoongArchCPU *cpu,
> +                                             uint64_t value)
> +{
> +    CPULoongArchState *env = &cpu->env;
> +    uint64_t now, next;
> +
> +    env->CSR_TCFG = value;
> +    if (value & STABLETIMER_ENABLE) {
> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next = now + (value & STABLETIMER_TICK_MASK) * TIMER_PERIOD;
> +        timer_mod(&cpu->timer, next);
> +    }
> +}
> +
> +void loongarch_stable_timer_cb(void *opaque)
> +{
> +    LoongArchCPU *cpu  = opaque;
> +    CPULoongArchState *env = &cpu->env;
> +    uint64_t now, next;
> +
> +    if (FIELD_EX64(env->CSR_TCFG, CSR_TCFG, PERIODIC)) {
> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next = now + (env->CSR_TCFG & STABLETIMER_TICK_MASK) * TIMER_PERIOD;
> +        timer_mod(&cpu->timer, next);
> +    } else {
> +        env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
> +    }
> +
> +    env->CSR_ESTAT |= 1 << IRQ_TIMER;
> +    cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
> +}
> --
> 2.27.0
>
>


-- 
Huacai Chen

