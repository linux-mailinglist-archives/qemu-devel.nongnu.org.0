Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB944F4BE
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 20:03:07 +0100 (CET)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlyIs-0000fL-3p
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 14:03:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mlyI0-0008Ng-BU; Sat, 13 Nov 2021 14:02:12 -0500
Received: from [2607:f8b0:4864:20::92c] (port=36596
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mlyHx-0000ru-Ov; Sat, 13 Nov 2021 14:02:12 -0500
Received: by mail-ua1-x92c.google.com with SMTP id e10so25988456uab.3;
 Sat, 13 Nov 2021 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ptxGtN3Hhp+4madqoikMRfV8gOhuCIjo6IhUf7r9URQ=;
 b=q2W0mL8CeHliABSO5mPlXd+cKdjh2alzGB+w9jfDj+ep4YOrvnidhaSmfdh2rpTvQy
 uBNP4voeXWL71mMGiqC5D/9LkaYDTMqW30NGLcVSAPudMhiy1xInsRoAvfyVthF3Q/Nc
 b0b1/3AKMOlYwJqyke6hONQSFX3lbmlpeFyPyGZYlG9ZfRbEkzRrDN8xwiwnOElUrlCB
 lH43RIepAzGie7VdXNpqzfwx1Oe7dRXPzgCXU7f0ZvL6j2/DJtJM6D6rP9wcL3hP48o+
 RUJVZ3q9aW98BukAMugBpY+df+KCZ1cdPlJPgW98GZy8S8/HPqAXGJzlqG83ydawdkle
 cqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ptxGtN3Hhp+4madqoikMRfV8gOhuCIjo6IhUf7r9URQ=;
 b=dstXNmakAgZtsbpbgz0iVnfLdiG9DvGAwxGG+BP+oPLIXDPf3XeoPpj6caeKmohyKj
 sOuh5d/VbD4QYwQhAGm7z2keIZR8rpY1yWpoP/T8864p3GxmO4kWjW288eGw7vZEt3z/
 +OXQzN/44JLytxaQZ8LI0S+J82WRWA6e4dJVsc09+mdbtw8bszXVjuFlEyde7DdQ0zPb
 TsoX7LKpn0SElgpZ/K1frMzJDY+MpBZW6cYoSuJru50gZyvedd89twQXYGDozbdwUyIm
 blPeJRMXaKPplcbSmSy1oLYAWR5Zt0/RwAM4duMq+f43Fxt20jmhnrDmc31J5hE/sZPz
 sa2w==
X-Gm-Message-State: AOAM531Ij6nPwJFKHSxL7SJHAqbHSYzW9RnSgXxp2uqgZxDHewhz+Nul
 2cUU9t8sy4GvPWJxY+vhlvw=
X-Google-Smtp-Source: ABdhPJw+/N5G9nLKKb8XxFg3dfAg9oGcBZDg+qBRN5vTXc0AL5JXTNqswrsa10qsKtljDh4yEJ3o3g==
X-Received: by 2002:a05:6102:214f:: with SMTP id
 h15mr23739462vsg.60.1636830127794; 
 Sat, 13 Nov 2021 11:02:07 -0800 (PST)
Received: from [192.168.10.222] ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id g187sm6437258vsc.10.2021.11.13.11.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Nov 2021 11:02:07 -0800 (PST)
Message-ID: <ffd6cfa3-8813-26b7-2bec-bfcfbb3e2758@gmail.com>
Date: Sat, 13 Nov 2021 16:02:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 01/10] target/ppc: introduce PMUEventType and PMU
 overflow timers
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20211108225047.1733607-1-danielhb413@gmail.com>
 <20211108225047.1733607-2-danielhb413@gmail.com> <YY3ZPV5C1O/gu9sj@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YY3ZPV5C1O/gu9sj@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.852,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/12/21 00:02, David Gibson wrote:
> On Mon, Nov 08, 2021 at 07:50:38PM -0300, Daniel Henrique Barboza wrote:
>> This patch starts an IBM Power8+ compatible PMU implementation by adding
>> the representation of PMU events that we are going to sample,
>> PMUEventType. This enum represents a Perf event that is being sampled by
>> a specific counter 'sprn'. Events that aren't available (i.e. no event
>> was set in MMCR1) will be of type 'PMU_EVENT_INVALID'. Other types added
>> in this patch are PMU_EVENT_CYCLES and PMU_EVENT_INSTRUCTIONS. More
>> types will be added later on.
>>
>> Let's also add the required PMU cycle overflow timers. They will be used
>> to trigger cycle overflows when cycle events are being sampled. This
>> timer will call cpu_ppc_pmu_timer_cb(), which in turn calls
>> fire_PMC_interrupt().  Both functions are stubs that will be implemented
>> later on when EBB support is added.
>>
>> Two new helper files are created to host this new logic.
>> cpu_ppc_pmu_init() will init all overflow timers during CPU init time.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr_cpu_core.c |  6 +++++
>>   target/ppc/cpu.h        | 15 +++++++++++
>>   target/ppc/meson.build  |  1 +
>>   target/ppc/power8-pmu.c | 57 +++++++++++++++++++++++++++++++++++++++++
>>   target/ppc/power8-pmu.h | 25 ++++++++++++++++++
>>   5 files changed, 104 insertions(+)
>>   create mode 100644 target/ppc/power8-pmu.c
>>   create mode 100644 target/ppc/power8-pmu.h
>>
>> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
>> index 58e7341cb7..45abffd891 100644
>> --- a/hw/ppc/spapr_cpu_core.c
>> +++ b/hw/ppc/spapr_cpu_core.c
>> @@ -20,6 +20,7 @@
>>   #include "target/ppc/kvm_ppc.h"
>>   #include "hw/ppc/ppc.h"
>>   #include "target/ppc/mmu-hash64.h"
>> +#include "target/ppc/power8-pmu.h"
>>   #include "sysemu/numa.h"
>>   #include "sysemu/reset.h"
>>   #include "sysemu/hw_accel.h"
>> @@ -266,6 +267,11 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
>>           return false;
>>       }
>>   
>> +    /* Init PMU interrupt timer (TCG only) */
>> +    if (!kvm_enabled()) {
>> +        cpu_ppc_pmu_init(env);
> 
> AFAIK, the PMU should be universal in the cpu model, not tied to spapr
> specifically, so this looks like the wrong place to trigger the
> initialization.


Do you mean something like this?

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 881f39ff76..7503fd76d7 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -45,6 +45,7 @@
  #include "helper_regs.h"
  #include "internal.h"
  #include "spr_tcg.h"
+#include "power8-pmu.h"
  
  /* #define PPC_DEBUG_SPR */
  /* #define USE_APPLE_GDB */
@@ -7377,6 +7378,20 @@ static void register_power9_mmu_sprs(CPUPPCState *env)
  #endif
  }
  
+/*
+ * Initialize PMU counter overflow timers for Power8 and
+ * newer Power chips when using TCG.
+ */
+static void init_tcg_pmu_common(CPUPPCState *env)
+{
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+    /* Init PMU overflow timers */
+    if (!kvm_enabled()) {
+        cpu_ppc_pmu_init(env);
+    }
+#endif
+}
+
  static void init_proc_book3s_common(CPUPPCState *env)
  {
      register_ne_601_sprs(env);
@@ -7694,6 +7709,9 @@ static void init_proc_POWER8(CPUPPCState *env)
      register_sdr1_sprs(env);
      register_book3s_207_dbg_sprs(env);
  
+    /* Common TCG PMU */
+    init_tcg_pmu_common(env);
+
      /* POWER8 Specific Registers */
      register_book3s_ids_sprs(env);
      register_rmor_sprs(env);
@@ -7888,6 +7906,9 @@ static void init_proc_POWER9(CPUPPCState *env)
      init_proc_book3s_common(env);
      register_book3s_207_dbg_sprs(env);
  
+    /* Common TCG PMU */
+    init_tcg_pmu_common(env);
+
      /* POWER8 Specific Registers */
      register_book3s_ids_sprs(env);
      register_amr_sprs(env);
@@ -8104,6 +8125,9 @@ static void init_proc_POWER10(CPUPPCState *env)
      init_proc_book3s_common(env);
      register_book3s_207_dbg_sprs(env);
  
+    /* Common TCG PMU */
+    init_tcg_pmu_common(env);
+
      /* POWER8 Specific Registers */
      register_book3s_ids_sprs(env);
      register_amr_sprs(env);



Daniel

> 
>> +    }
>> +
>>       if (!sc->pre_3_0_migration) {
>>           vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_state,
>>                            cpu->machine_data);
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index e946da5f3a..04ef9300af 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -296,6 +296,15 @@ typedef struct ppc_v3_pate_t {
>>       uint64_t dw1;
>>   } ppc_v3_pate_t;
>>   
>> +/* PMU related structs and defines */
>> +#define PMU_COUNTERS_NUM 6
>> +#define PMU_TIMERS_NUM   (PMU_COUNTERS_NUM - 1) /* PMC5 doesn't count cycles */
>> +typedef enum {
>> +    PMU_EVENT_INVALID = 0,
>> +    PMU_EVENT_CYCLES,
>> +    PMU_EVENT_INSTRUCTIONS,
>> +} PMUEventType;
>> +
>>   /*****************************************************************************/
>>   /* Machine state register bits definition                                    */
>>   #define MSR_SF   63 /* Sixty-four-bit mode                            hflags */
>> @@ -1191,6 +1200,12 @@ struct CPUPPCState {
>>       uint32_t tm_vscr;
>>       uint64_t tm_dscr;
>>       uint64_t tm_tar;
>> +
>> +    /*
>> +     * Timers used to fire performance monitor alerts
>> +     * when counting cycles.
>> +     */
>> +    QEMUTimer *pmu_cyc_overflow_timers[PMU_TIMERS_NUM];
>>   };
>>   
>>   #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
>> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
>> index b85f295703..a49a8911e0 100644
>> --- a/target/ppc/meson.build
>> +++ b/target/ppc/meson.build
>> @@ -51,6 +51,7 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
>>     'mmu-book3s-v3.c',
>>     'mmu-hash64.c',
>>     'mmu-radix64.c',
>> +  'power8-pmu.c',
>>   ))
>>   
>>   target_arch += {'ppc': ppc_ss}
>> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
>> new file mode 100644
>> index 0000000000..3c2f73896f
>> --- /dev/null
>> +++ b/target/ppc/power8-pmu.c
>> @@ -0,0 +1,57 @@
>> +/*
>> + * PMU emulation helpers for TCG IBM POWER chips
>> + *
>> + *  Copyright IBM Corp. 2021
>> + *
>> + * Authors:
>> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +
>> +#include "power8-pmu.h"
>> +#include "cpu.h"
>> +#include "helper_regs.h"
>> +#include "exec/exec-all.h"
>> +#include "exec/helper-proto.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/main-loop.h"
>> +#include "hw/ppc/ppc.h"
>> +
>> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>> +
>> +static void fire_PMC_interrupt(PowerPCCPU *cpu)
>> +{
>> +    CPUPPCState *env = &cpu->env;
>> +
>> +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
>> +        return;
>> +    }
>> +
>> +    /* PMC interrupt not implemented yet */
>> +    return;
>> +}
>> +
>> +static void cpu_ppc_pmu_timer_cb(void *opaque)
>> +{
>> +    PowerPCCPU *cpu = opaque;
>> +
>> +    fire_PMC_interrupt(cpu);
>> +}
>> +
>> +void cpu_ppc_pmu_init(CPUPPCState *env)
>> +{
>> +    PowerPCCPU *cpu = env_archcpu(env);
>> +    int i;
>> +
>> +    for (i = 0; i < PMU_TIMERS_NUM; i++) {
>> +        env->pmu_cyc_overflow_timers[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>> +                                                       &cpu_ppc_pmu_timer_cb,
>> +                                                       cpu);
>> +    }
>> +}
>> +
>> +#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
>> diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
>> new file mode 100644
>> index 0000000000..49a813a443
>> --- /dev/null
>> +++ b/target/ppc/power8-pmu.h
>> @@ -0,0 +1,25 @@
>> +/*
>> + * PMU emulation helpers for TCG IBM POWER chips
>> + *
>> + *  Copyright IBM Corp. 2021
>> + *
>> + * Authors:
>> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef POWER8_PMU
>> +#define POWER8_PMU
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "exec/exec-all.h"
>> +#include "exec/helper-proto.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/main-loop.h"
>> +
>> +void cpu_ppc_pmu_init(CPUPPCState *env);
>> +
>> +#endif
> 

