Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA5411072
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:46:48 +0200 (CEST)
Received: from localhost ([::1]:42526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSE0l-0001m4-B0
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSDwj-0005x3-J0
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:42:37 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:43495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSDwb-00068l-HV
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:42:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A51D620679;
 Mon, 20 Sep 2021 07:42:26 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 09:42:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0060fd5d774-e8ee-4325-a78a-6683c556bc87,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0d083d2d-0f76-a14b-4576-e546ba5203ec@kaod.org>
Date: Mon, 20 Sep 2021 09:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 3/4] target/ppc: Convert debug to trace events
 (decrementer and IRQ)
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210920061203.989563-1-clg@kaod.org>
 <20210920061203.989563-4-clg@kaod.org> <YUg5mDQtmL711Uw/@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YUg5mDQtmL711Uw/@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8c9eaecc-60d8-4879-aa7d-95f317676c1a
X-Ovh-Tracer-Id: 4278982597430709216
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiuddguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 09:34, David Gibson wrote:
> On Mon, Sep 20, 2021 at 08:12:02AM +0200, Cédric Le Goater wrote:
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> So.. all the functions here are called *set_irq*, but you've named the
> tracepoints *irq_set*.


Yes. I did that on purpose to identify easily the PPC IRQ subsystem,
and to be able to use '-trace ppc_irq*' from the command line and in
the monitor.

> It's not a big deal, but it seems like it
> would be less confusing if you flipped that around to match the
> function names.

but you would loose the ability to do what I described above.

Thanks,

C.
  
>> ---
>>   hw/ppc/ppc.c        | 169 ++++++++++++++++----------------------------
>>   hw/ppc/trace-events |  22 +++++-
>>   2 files changed, 82 insertions(+), 109 deletions(-)
>>
>> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
>> index a327206a0a1e..b813ef732ec1 100644
>> --- a/hw/ppc/ppc.c
>> +++ b/hw/ppc/ppc.c
>> @@ -37,22 +37,6 @@
>>   #include "migration/vmstate.h"
>>   #include "trace.h"
>>   
>> -//#define PPC_DEBUG_IRQ
>> -//#define PPC_DEBUG_TB
>> -
>> -#ifdef PPC_DEBUG_IRQ
>> -#  define LOG_IRQ(...) qemu_log_mask(CPU_LOG_INT, ## __VA_ARGS__)
>> -#else
>> -#  define LOG_IRQ(...) do { } while (0)
>> -#endif
>> -
>> -
>> -#ifdef PPC_DEBUG_TB
>> -#  define LOG_TB(...) qemu_log(__VA_ARGS__)
>> -#else
>> -#  define LOG_TB(...) do { } while (0)
>> -#endif
>> -
>>   static void cpu_ppc_tb_stop (CPUPPCState *env);
>>   static void cpu_ppc_tb_start (CPUPPCState *env);
>>   
>> @@ -86,9 +70,8 @@ void ppc_set_irq(PowerPCCPU *cpu, int n_IRQ, int level)
>>       }
>>   
>>   
>> -    LOG_IRQ("%s: %p n_IRQ %d level %d => pending %08" PRIx32
>> -                "req %08x\n", __func__, env, n_IRQ, level,
>> -                env->pending_interrupts, CPU(cpu)->interrupt_request);
>> +    trace_ppc_irq_set_exit(env, n_IRQ, level, env->pending_interrupts,
>> +                           CPU(cpu)->interrupt_request);
>>   
>>       if (locked) {
>>           qemu_mutex_unlock_iothread();
>> @@ -102,8 +85,8 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
>>       CPUPPCState *env = &cpu->env;
>>       int cur_level;
>>   
>> -    LOG_IRQ("%s: env %p pin %d level %d\n", __func__,
>> -                env, pin, level);
>> +    trace_ppc_irq_set(env, pin, level);
>> +
>>       cur_level = (env->irq_input_state >> pin) & 1;
>>       /* Don't generate spurious events */
>>       if ((cur_level == 1 && level == 0) || (cur_level == 0 && level != 0)) {
>> @@ -112,8 +95,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
>>           switch (pin) {
>>           case PPC6xx_INPUT_TBEN:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: %s the time base\n",
>> -                        __func__, level ? "start" : "stop");
>> +            trace_ppc_irq_set_state("time base", level);
>>               if (level) {
>>                   cpu_ppc_tb_start(env);
>>               } else {
>> @@ -122,14 +104,12 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
>>               break;
>>           case PPC6xx_INPUT_INT:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: set the external IRQ state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("external IRQ", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_EXT, level);
>>               break;
>>           case PPC6xx_INPUT_SMI:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: set the SMI IRQ state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("SMI IRQ", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_SMI, level);
>>               break;
>>           case PPC6xx_INPUT_MCP:
>> @@ -138,8 +118,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
>>                *            603/604/740/750: check HID0[EMCP]
>>                */
>>               if (cur_level == 1 && level == 0) {
>> -                LOG_IRQ("%s: raise machine check state\n",
>> -                            __func__);
>> +                trace_ppc_irq_set_state("machine check", 1);
>>                   ppc_set_irq(cpu, PPC_INTERRUPT_MCK, 1);
>>               }
>>               break;
>> @@ -148,20 +127,19 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
>>               /* XXX: TODO: relay the signal to CKSTP_OUT pin */
>>               /* XXX: Note that the only way to restart the CPU is to reset it */
>>               if (level) {
>> -                LOG_IRQ("%s: stop the CPU\n", __func__);
>> +                trace_ppc_irq_cpu("stop");
>>                   cs->halted = 1;
>>               }
>>               break;
>>           case PPC6xx_INPUT_HRESET:
>>               /* Level sensitive - active low */
>>               if (level) {
>> -                LOG_IRQ("%s: reset the CPU\n", __func__);
>> +                trace_ppc_irq_reset("CPU");
>>                   cpu_interrupt(cs, CPU_INTERRUPT_RESET);
>>               }
>>               break;
>>           case PPC6xx_INPUT_SRESET:
>> -            LOG_IRQ("%s: set the RESET IRQ state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("RESET IRQ", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_RESET, level);
>>               break;
>>           default:
>> @@ -190,8 +168,8 @@ static void ppc970_set_irq(void *opaque, int pin, int level)
>>       CPUPPCState *env = &cpu->env;
>>       int cur_level;
>>   
>> -    LOG_IRQ("%s: env %p pin %d level %d\n", __func__,
>> -                env, pin, level);
>> +    trace_ppc_irq_set(env, pin, level);
>> +
>>       cur_level = (env->irq_input_state >> pin) & 1;
>>       /* Don't generate spurious events */
>>       if ((cur_level == 1 && level == 0) || (cur_level == 0 && level != 0)) {
>> @@ -200,14 +178,12 @@ static void ppc970_set_irq(void *opaque, int pin, int level)
>>           switch (pin) {
>>           case PPC970_INPUT_INT:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: set the external IRQ state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("external IRQ", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_EXT, level);
>>               break;
>>           case PPC970_INPUT_THINT:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: set the SMI IRQ state to %d\n", __func__,
>> -                        level);
>> +            trace_ppc_irq_set_state("SMI IRQ", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_THERM, level);
>>               break;
>>           case PPC970_INPUT_MCP:
>> @@ -216,8 +192,7 @@ static void ppc970_set_irq(void *opaque, int pin, int level)
>>                *            603/604/740/750: check HID0[EMCP]
>>                */
>>               if (cur_level == 1 && level == 0) {
>> -                LOG_IRQ("%s: raise machine check state\n",
>> -                            __func__);
>> +                trace_ppc_irq_set_state("machine check", 1);
>>                   ppc_set_irq(cpu, PPC_INTERRUPT_MCK, 1);
>>               }
>>               break;
>> @@ -225,10 +200,10 @@ static void ppc970_set_irq(void *opaque, int pin, int level)
>>               /* Level sensitive - active low */
>>               /* XXX: TODO: relay the signal to CKSTP_OUT pin */
>>               if (level) {
>> -                LOG_IRQ("%s: stop the CPU\n", __func__);
>> +                trace_ppc_irq_cpu("stop");
>>                   cs->halted = 1;
>>               } else {
>> -                LOG_IRQ("%s: restart the CPU\n", __func__);
>> +                trace_ppc_irq_cpu("restart");
>>                   cs->halted = 0;
>>                   qemu_cpu_kick(cs);
>>               }
>> @@ -240,13 +215,11 @@ static void ppc970_set_irq(void *opaque, int pin, int level)
>>               }
>>               break;
>>           case PPC970_INPUT_SRESET:
>> -            LOG_IRQ("%s: set the RESET IRQ state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("RESET IRQ", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_RESET, level);
>>               break;
>>           case PPC970_INPUT_TBEN:
>> -            LOG_IRQ("%s: set the TBEN state to %d\n", __func__,
>> -                        level);
>> +            trace_ppc_irq_set_state("TBEN IRQ", level);
>>               /* XXX: TODO */
>>               break;
>>           default:
>> @@ -272,14 +245,12 @@ static void power7_set_irq(void *opaque, int pin, int level)
>>   {
>>       PowerPCCPU *cpu = opaque;
>>   
>> -    LOG_IRQ("%s: env %p pin %d level %d\n", __func__,
>> -            &cpu->env, pin, level);
>> +    trace_ppc_irq_set(&cpu->env, pin, level);
>>   
>>       switch (pin) {
>>       case POWER7_INPUT_INT:
>>           /* Level sensitive - active high */
>> -        LOG_IRQ("%s: set the external IRQ state to %d\n",
>> -                __func__, level);
>> +        trace_ppc_irq_set_state("external IRQ", level);
>>           ppc_set_irq(cpu, PPC_INTERRUPT_EXT, level);
>>           break;
>>       default:
>> @@ -300,24 +271,22 @@ static void power9_set_irq(void *opaque, int pin, int level)
>>   {
>>       PowerPCCPU *cpu = opaque;
>>   
>> -    LOG_IRQ("%s: env %p pin %d level %d\n", __func__,
>> -            &cpu->env, pin, level);
>> +    trace_ppc_irq_set(&cpu->env, pin, level);
>>   
>>       switch (pin) {
>>       case POWER9_INPUT_INT:
>>           /* Level sensitive - active high */
>> -        LOG_IRQ("%s: set the external IRQ state to %d\n",
>> -                __func__, level);
>> +        trace_ppc_irq_set_state("external IRQ", level);
>>           ppc_set_irq(cpu, PPC_INTERRUPT_EXT, level);
>>           break;
>>       case POWER9_INPUT_HINT:
>>           /* Level sensitive - active high */
>> -        LOG_IRQ("%s: set the external IRQ state to %d\n",
>> -                __func__, level);
>> +        trace_ppc_irq_set_state("HV external IRQ", level);
>>           ppc_set_irq(cpu, PPC_INTERRUPT_HVIRT, level);
>>           break;
>>       default:
>>           g_assert_not_reached();
>> +        return;
>>       }
>>   }
>>   
>> @@ -393,8 +362,8 @@ static void ppc40x_set_irq(void *opaque, int pin, int level)
>>       CPUPPCState *env = &cpu->env;
>>       int cur_level;
>>   
>> -    LOG_IRQ("%s: env %p pin %d level %d\n", __func__,
>> -                env, pin, level);
>> +    trace_ppc_irq_set(env, pin, level);
>> +
>>       cur_level = (env->irq_input_state >> pin) & 1;
>>       /* Don't generate spurious events */
>>       if ((cur_level == 1 && level == 0) || (cur_level == 0 && level != 0)) {
>> @@ -403,51 +372,47 @@ static void ppc40x_set_irq(void *opaque, int pin, int level)
>>           switch (pin) {
>>           case PPC40x_INPUT_RESET_SYS:
>>               if (level) {
>> -                LOG_IRQ("%s: reset the PowerPC system\n",
>> -                            __func__);
>> +                trace_ppc_irq_reset("system");
>>                   ppc40x_system_reset(cpu);
>>               }
>>               break;
>>           case PPC40x_INPUT_RESET_CHIP:
>>               if (level) {
>> -                LOG_IRQ("%s: reset the PowerPC chip\n", __func__);
>> +                trace_ppc_irq_reset("chip");
>>                   ppc40x_chip_reset(cpu);
>>               }
>>               break;
>>           case PPC40x_INPUT_RESET_CORE:
>>               /* XXX: TODO: update DBSR[MRR] */
>>               if (level) {
>> -                LOG_IRQ("%s: reset the PowerPC core\n", __func__);
>> +                trace_ppc_irq_reset("core");
>>                   ppc40x_core_reset(cpu);
>>               }
>>               break;
>>           case PPC40x_INPUT_CINT:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: set the critical IRQ state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("critical IRQ", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_CEXT, level);
>>               break;
>>           case PPC40x_INPUT_INT:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: set the external IRQ state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("external IRQ", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_EXT, level);
>>               break;
>>           case PPC40x_INPUT_HALT:
>>               /* Level sensitive - active low */
>>               if (level) {
>> -                LOG_IRQ("%s: stop the CPU\n", __func__);
>> +                trace_ppc_irq_cpu("stop");
>>                   cs->halted = 1;
>>               } else {
>> -                LOG_IRQ("%s: restart the CPU\n", __func__);
>> +                trace_ppc_irq_cpu("restart");
>>                   cs->halted = 0;
>>                   qemu_cpu_kick(cs);
>>               }
>>               break;
>>           case PPC40x_INPUT_DEBUG:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: set the debug pin state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("debug pin", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_DEBUG, level);
>>               break;
>>           default:
>> @@ -475,41 +440,37 @@ static void ppce500_set_irq(void *opaque, int pin, int level)
>>       CPUPPCState *env = &cpu->env;
>>       int cur_level;
>>   
>> -    LOG_IRQ("%s: env %p pin %d level %d\n", __func__,
>> -                env, pin, level);
>> +    trace_ppc_irq_set(env, pin, level);
>> +
>>       cur_level = (env->irq_input_state >> pin) & 1;
>>       /* Don't generate spurious events */
>>       if ((cur_level == 1 && level == 0) || (cur_level == 0 && level != 0)) {
>>           switch (pin) {
>>           case PPCE500_INPUT_MCK:
>>               if (level) {
>> -                LOG_IRQ("%s: reset the PowerPC system\n",
>> -                            __func__);
>> +                trace_ppc_irq_reset("system");
>>                   qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>>               }
>>               break;
>>           case PPCE500_INPUT_RESET_CORE:
>>               if (level) {
>> -                LOG_IRQ("%s: reset the PowerPC core\n", __func__);
>> +                trace_ppc_irq_reset("core");
>>                   ppc_set_irq(cpu, PPC_INTERRUPT_MCK, level);
>>               }
>>               break;
>>           case PPCE500_INPUT_CINT:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: set the critical IRQ state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("critical IRQ", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_CEXT, level);
>>               break;
>>           case PPCE500_INPUT_INT:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: set the core IRQ state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("core IRQ", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_EXT, level);
>>               break;
>>           case PPCE500_INPUT_DEBUG:
>>               /* Level sensitive - active high */
>> -            LOG_IRQ("%s: set the debug pin state to %d\n",
>> -                        __func__, level);
>> +            trace_ppc_irq_set_state("debug pin", level);
>>               ppc_set_irq(cpu, PPC_INTERRUPT_DEBUG, level);
>>               break;
>>           default:
>> @@ -564,7 +525,7 @@ uint64_t cpu_ppc_load_tbl (CPUPPCState *env)
>>       }
>>   
>>       tb = cpu_ppc_get_tb(tb_env, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), tb_env->tb_offset);
>> -    LOG_TB("%s: tb %016" PRIx64 "\n", __func__, tb);
>> +    trace_ppc_tb_load(tb);
>>   
>>       return tb;
>>   }
>> @@ -575,7 +536,7 @@ static inline uint32_t _cpu_ppc_load_tbu(CPUPPCState *env)
>>       uint64_t tb;
>>   
>>       tb = cpu_ppc_get_tb(tb_env, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), tb_env->tb_offset);
>> -    LOG_TB("%s: tb %016" PRIx64 "\n", __func__, tb);
>> +    trace_ppc_tb_load(tb);
>>   
>>       return tb >> 32;
>>   }
>> @@ -595,8 +556,7 @@ static inline void cpu_ppc_store_tb(ppc_tb_t *tb_env, uint64_t vmclk,
>>       *tb_offsetp = value -
>>           muldiv64(vmclk, tb_env->tb_freq, NANOSECONDS_PER_SECOND);
>>   
>> -    LOG_TB("%s: tb %016" PRIx64 " offset %08" PRIx64 "\n",
>> -                __func__, value, *tb_offsetp);
>> +    trace_ppc_tb_store(value, *tb_offsetp);
>>   }
>>   
>>   void cpu_ppc_store_tbl (CPUPPCState *env, uint32_t value)
>> @@ -632,7 +592,7 @@ uint64_t cpu_ppc_load_atbl (CPUPPCState *env)
>>       uint64_t tb;
>>   
>>       tb = cpu_ppc_get_tb(tb_env, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), tb_env->atb_offset);
>> -    LOG_TB("%s: tb %016" PRIx64 "\n", __func__, tb);
>> +    trace_ppc_tb_load(tb);
>>   
>>       return tb;
>>   }
>> @@ -643,7 +603,7 @@ uint32_t cpu_ppc_load_atbu (CPUPPCState *env)
>>       uint64_t tb;
>>   
>>       tb = cpu_ppc_get_tb(tb_env, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), tb_env->atb_offset);
>> -    LOG_TB("%s: tb %016" PRIx64 "\n", __func__, tb);
>> +    trace_ppc_tb_load(tb);
>>   
>>       return tb >> 32;
>>   }
>> @@ -762,7 +722,7 @@ static inline int64_t _cpu_ppc_load_decr(CPUPPCState *env, uint64_t next)
>>       }  else {
>>           decr = -muldiv64(-diff, tb_env->decr_freq, NANOSECONDS_PER_SECOND);
>>       }
>> -    LOG_TB("%s: %016" PRIx64 "\n", __func__, decr);
>> +    trace_ppc_decr_load(decr);
>>   
>>       return decr;
>>   }
>> @@ -821,7 +781,7 @@ uint64_t cpu_ppc_load_purr (CPUPPCState *env)
>>   static inline void cpu_ppc_decr_excp(PowerPCCPU *cpu)
>>   {
>>       /* Raise it */
>> -    LOG_TB("raise decrementer exception\n");
>> +    trace_ppc_decr_excp("raise");
>>       ppc_set_irq(cpu, PPC_INTERRUPT_DECR, 1);
>>   }
>>   
>> @@ -835,7 +795,7 @@ static inline void cpu_ppc_hdecr_excp(PowerPCCPU *cpu)
>>       CPUPPCState *env = &cpu->env;
>>   
>>       /* Raise it */
>> -    LOG_TB("raise hv decrementer exception\n");
>> +    trace_ppc_decr_excp("raise HV");
>>   
>>       /* The architecture specifies that we don't deliver HDEC
>>        * interrupts in a PM state. Not only they don't cause a
>> @@ -870,8 +830,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
>>           value |= (0xFFFFFFFFULL << nr_bits);
>>       }
>>   
>> -    LOG_TB("%s: " TARGET_FMT_lx " => " TARGET_FMT_lx "\n", __func__,
>> -                decr, value);
>> +    trace_ppc_decr_store(nr_bits, decr, value);
>>   
>>       if (kvm_enabled()) {
>>           /* KVM handles decrementer exceptions, we don't need our own timer */
>> @@ -1199,9 +1158,8 @@ static void cpu_4xx_fit_cb (void *opaque)
>>       if ((env->spr[SPR_40x_TCR] >> 23) & 0x1) {
>>           ppc_set_irq(cpu, PPC_INTERRUPT_FIT, 1);
>>       }
>> -    LOG_TB("%s: ir %d TCR " TARGET_FMT_lx " TSR " TARGET_FMT_lx "\n", __func__,
>> -           (int)((env->spr[SPR_40x_TCR] >> 23) & 0x1),
>> -           env->spr[SPR_40x_TCR], env->spr[SPR_40x_TSR]);
>> +    trace_ppc4xx_fit((int)((env->spr[SPR_40x_TCR] >> 23) & 0x1),
>> +                         env->spr[SPR_40x_TCR], env->spr[SPR_40x_TSR]);
>>   }
>>   
>>   /* Programmable interval timer */
>> @@ -1215,11 +1173,10 @@ static void start_stop_pit (CPUPPCState *env, ppc_tb_t *tb_env, int is_excp)
>>           !((env->spr[SPR_40x_TCR] >> 26) & 0x1) ||
>>           (is_excp && !((env->spr[SPR_40x_TCR] >> 22) & 0x1))) {
>>           /* Stop PIT */
>> -        LOG_TB("%s: stop PIT\n", __func__);
>> +        trace_ppc4xx_pit_stop();
>>           timer_del(tb_env->decr_timer);
>>       } else {
>> -        LOG_TB("%s: start PIT %016" PRIx64 "\n",
>> -                    __func__, ppc40x_timer->pit_reload);
>> +        trace_ppc4xx_pit_start(ppc40x_timer->pit_reload);
>>           now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>           next = now + muldiv64(ppc40x_timer->pit_reload,
>>                                 NANOSECONDS_PER_SECOND, tb_env->decr_freq);
>> @@ -1248,9 +1205,7 @@ static void cpu_4xx_pit_cb (void *opaque)
>>           ppc_set_irq(cpu, ppc40x_timer->decr_excp, 1);
>>       }
>>       start_stop_pit(env, tb_env, 1);
>> -    LOG_TB("%s: ar %d ir %d TCR " TARGET_FMT_lx " TSR " TARGET_FMT_lx " "
>> -           "%016" PRIx64 "\n", __func__,
>> -           (int)((env->spr[SPR_40x_TCR] >> 22) & 0x1),
>> +    trace_ppc4xx_pit((int)((env->spr[SPR_40x_TCR] >> 22) & 0x1),
>>              (int)((env->spr[SPR_40x_TCR] >> 26) & 0x1),
>>              env->spr[SPR_40x_TCR], env->spr[SPR_40x_TSR],
>>              ppc40x_timer->pit_reload);
>> @@ -1290,8 +1245,7 @@ static void cpu_4xx_wdt_cb (void *opaque)
>>       next = now + muldiv64(next, NANOSECONDS_PER_SECOND, tb_env->decr_freq);
>>       if (next == now)
>>           next++;
>> -    LOG_TB("%s: TCR " TARGET_FMT_lx " TSR " TARGET_FMT_lx "\n", __func__,
>> -           env->spr[SPR_40x_TCR], env->spr[SPR_40x_TSR]);
>> +    trace_ppc4xx_wdt(env->spr[SPR_40x_TCR], env->spr[SPR_40x_TSR]);
>>       switch ((env->spr[SPR_40x_TSR] >> 30) & 0x3) {
>>       case 0x0:
>>       case 0x1:
>> @@ -1334,7 +1288,7 @@ void store_40x_pit (CPUPPCState *env, target_ulong val)
>>   
>>       tb_env = env->tb_env;
>>       ppc40x_timer = tb_env->opaque;
>> -    LOG_TB("%s val" TARGET_FMT_lx "\n", __func__, val);
>> +    trace_ppc40x_store_pit(val);
>>       ppc40x_timer->pit_reload = val;
>>       start_stop_pit(env, tb_env, 0);
>>   }
>> @@ -1349,8 +1303,7 @@ static void ppc_40x_set_tb_clk (void *opaque, uint32_t freq)
>>       CPUPPCState *env = opaque;
>>       ppc_tb_t *tb_env = env->tb_env;
>>   
>> -    LOG_TB("%s set new frequency to %" PRIu32 "\n", __func__,
>> -                freq);
>> +    trace_ppc40x_set_tb_clk(freq);
>>       tb_env->tb_freq = freq;
>>       tb_env->decr_freq = freq;
>>       /* XXX: we should also update all timers */
>> @@ -1369,7 +1322,7 @@ clk_setup_cb ppc_40x_timers_init (CPUPPCState *env, uint32_t freq,
>>       tb_env->tb_freq = freq;
>>       tb_env->decr_freq = freq;
>>       tb_env->opaque = ppc40x_timer;
>> -    LOG_TB("%s freq %" PRIu32 "\n", __func__, freq);
>> +    trace_ppc40x_timers_init(freq);
>>       if (ppc40x_timer != NULL) {
>>           /* We use decr timer for PIT */
>>           tb_env->decr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_4xx_pit_cb, env);
>> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
>> index da6e74b80dc1..3bf43fa340fe 100644
>> --- a/hw/ppc/trace-events
>> +++ b/hw/ppc/trace-events
>> @@ -97,7 +97,27 @@ vof_claimed(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0x%"PRIx6
>>   
>>   # ppc.c
>>   ppc_tb_adjust(uint64_t offs1, uint64_t offs2, int64_t diff, int64_t seconds) "adjusted from 0x%"PRIx64" to 0x%"PRIx64", diff %"PRId64" (%"PRId64"s)"
>> -
>> +ppc_tb_load(uint64_t tb) "tb 0x%016" PRIx64
>> +ppc_tb_store(uint64_t tb, uint64_t offset) "tb 0x%016" PRIx64 " offset 0x%08" PRIx64
>> +
>> +ppc_decr_load(uint64_t tb) "decr 0x%016" PRIx64
>> +ppc_decr_excp(const char *action) "%s decrementer"
>> +ppc_decr_store(uint32_t nr_bits, uint64_t decr, uint64_t value) "%d-bit 0x%016" PRIx64 " => 0x%016" PRIx64
>> +
>> +ppc4xx_fit(uint32_t ir, uint64_t tcr, uint64_t tsr) "ir %d TCR 0x%" PRIx64 " TSR 0x%" PRIx64
>> +ppc4xx_pit_stop(void) ""
>> +ppc4xx_pit_start(uint64_t reload) "PIT 0x%016" PRIx64
>> +ppc4xx_pit(uint32_t ar, uint32_t ir, uint64_t tcr, uint64_t tsr, uint64_t reload) "ar %d ir %d TCR 0x%" PRIx64 " TSR 0x%" PRIx64 " PIT 0x%016" PRIx64
>> +ppc4xx_wdt(uint64_t tcr, uint64_t tsr) "TCR 0x%" PRIx64 " TSR 0x%" PRIx64
>> +ppc40x_store_pit(uint64_t value) "val 0x%" PRIx64
>> +ppc40x_set_tb_clk(uint32_t value) "new frequency %" PRIu32
>> +ppc40x_timers_init(uint32_t value) "frequency %" PRIu32
>> +
>> +ppc_irq_set(void *env, uint32_t pin, uint32_t level) "env [%p] pin %d level %d"
>> +ppc_irq_set_exit(void *env, uint32_t n_IRQ, uint32_t level, uint32_t pending, uint32_t request) "env [%p] n_IRQ %d level %d => pending 0x%08" PRIx32 " req 0x%08" PRIx32
>> +ppc_irq_set_state(const char *name, uint32_t level) "\"%s\" level %d"
>> +ppc_irq_reset(const char *name) "%s"
>> +ppc_irq_cpu(const char *action) "%s"
>>   
>>   # prep_systemio.c
>>   prep_systemio_read(uint32_t addr, uint32_t val) "read addr=0x%x val=0x%x"
> 


