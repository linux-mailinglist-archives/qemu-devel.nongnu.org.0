Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C58D54EFD2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 05:49:20 +0200 (CEST)
Received: from localhost ([::1]:57832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o22z0-0001mu-P5
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 23:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o22xN-0000cM-50
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 23:47:37 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o22xI-0004On-04
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 23:47:36 -0400
Received: by mail-pg1-x52a.google.com with SMTP id z14so3024040pgh.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 20:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WqTnA7tCQO4F5mu6M6ObtB6Km9VUnfCzoSiY8JeENnw=;
 b=L7kUqzLy0Zn6SmZTNW8XU2Wsp/SrfYeLEKmo0qqgJ11MUkswJZ6sIXVh6rLuwWSSVA
 yJG1BYAIGZqNr09fLn6SDzqQlB/rVMjHu2+3/gmPp3Cps1GTaVdbFVHSvHMUv486dtLh
 CIKRdOTz8ykGdSybYJigup+XlsCr3pVunVL4qcRBlDiictDu9TCfMWtlv2fdNzpXn7UJ
 ipflQNhjl8A/TwQQ+8iWLD17aQgZjMWrzb2PRVgsOvB5VNGx8AZBu1Y1Mu0Ou6dieAco
 FZ+IzphhPJk2oaijJvxCVOdGHgFOG8wNgf8fHUN+vtekzVimP25cdpSIqkQEGw0GyxIF
 Sq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WqTnA7tCQO4F5mu6M6ObtB6Km9VUnfCzoSiY8JeENnw=;
 b=T3XB87DjsItp8otFx5xF3ZfAHcnFLWAATics8GpsteFpnf/wVc07WNP3wKaOyo7pAd
 81KzzgcUNK/IUZzQb58BV7Wn9sv/8WYq0Q2Yg7k9HEog1nzxuPbSfwQF4UlQ35NSdLji
 b0/XmVcU+mDKwYVU/0NhBaTq5xvZNWdHHXMGhCWvY78jPK7qnBQbQ9/SN/q9Xd9ElflC
 ZWARtn/Mpoq4q7Xa+bogoQs4HnZY47lA93C2/fCEpSVJwsJ70pkegEaFzf0hzntbQJG7
 MIb3ANll7C3uy6adzNU8Y/a+qfyCQYK5NoIyXMkYcgpIe768EHE6PgDf/Q5MFMT3f9yT
 GgXQ==
X-Gm-Message-State: AJIora/raoS6aqfyurSojsOk3obfSe3yGwKBZ96YRjYmRNGK96BrgbDh
 A3/fzzIV0CBfG6hD28WESxS8Nw==
X-Google-Smtp-Source: AGRyM1sfO/SjcPo5QiOVxArQ4P4+BFsATcBDTodhss1wjiJwkft/RvtTFS+eCDblBQhf+dAqTVCGgQ==
X-Received: by 2002:a63:145e:0:b0:405:70e2:1d04 with SMTP id
 30-20020a63145e000000b0040570e21d04mr7296801pgu.487.1655437649228; 
 Thu, 16 Jun 2022 20:47:29 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 d10-20020a170902654a00b0015e8d4eb29csm2341713pln.230.2022.06.16.20.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 20:47:28 -0700 (PDT)
Message-ID: <f742b91b-25ce-c092-5689-18553e756c06@ozlabs.ru>
Date: Fri, 17 Jun 2022 13:47:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH qemu] ppc/spapr: Implement H_WATCHDOG
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Scott Cheloha <cheloha@linux.ibm.com>
References: <20220608030153.1862335-1-aik@ozlabs.ru>
 <43282864-6d82-e84d-bc8f-c04f76c27f8d@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <43282864-6d82-e84d-bc8f-c04f76c27f8d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/17/22 04:42, Daniel Henrique Barboza wrote:
> Hey,
> 
> As you might have seen in the kernel thread I was unable to test the 
> implementation.
> 
> The code errors out down there:
> 
> On 6/8/22 00:01, Alexey Kardashevskiy wrote:
>> The new PAPR 2.12 defines a watchdog facility managed via the new
>> H_WATCHDOG hypercall.
>>
>> This adds H_WATCHDOG support which a proposed driver for pseries uses:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=303120
>>
>> This was tested by running QEMU with a debug kernel and command line:
>> -append \
>>   "pseries-wdt.timeout=60 pseries-wdt.nowayout=1 pseries-wdt.action=2"
>>
>> and running "echo V > /dev/watchdog0" inside the VM.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>   include/hw/ppc/spapr.h  |  23 +++-
>>   hw/ppc/spapr.c          |   5 +
>>   hw/ppc/spapr_watchdog.c | 239 ++++++++++++++++++++++++++++++++++++++++
>>   hw/ppc/meson.build      |   1 +
>>   hw/ppc/trace-events     |   7 ++
>>   5 files changed, 274 insertions(+), 1 deletion(-)
>>   create mode 100644 hw/ppc/spapr_watchdog.c
>>
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index 072dda2c7265..39aa8609df7b 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -164,6 +164,19 @@ struct SpaprMachineClass {
>>       SpaprIrq *irq;
>>   };
>> +#define WDT_MAX_WATCHDOGS       4      /* Maximum number of watchdog 
>> devices */
>> +
>> +#define WDT_HARD_POWER_OFF      0
>> +#define WDT_HARD_RESTART        1
>> +#define WDT_DUMP_RESTART        2
>> +
>> +typedef struct SpaprWatchdog {
>> +    unsigned num;
>> +    QEMUTimer timer;
>> +    uint8_t action;
>> +    uint64_t timeout;
>> +} SpaprWatchdog;
>> +
>>   /**
>>    * SpaprMachineState:
>>    */
>> @@ -264,6 +277,8 @@ struct SpaprMachineState {
>>       uint32_t 
>> FORM2_assoc_array[NUMA_NODES_MAX_NUM][FORM2_NUMA_ASSOC_SIZE];
>>       Error *fwnmi_migration_blocker;
>> +
>> +    SpaprWatchdog wds[WDT_MAX_WATCHDOGS];
>>   };
>>   #define H_SUCCESS         0
>> @@ -344,6 +359,7 @@ struct SpaprMachineState {
>>   #define H_P7              -60
>>   #define H_P8              -61
>>   #define H_P9              -62
>> +#define H_NOOP            -63
>>   #define H_UNSUPPORTED     -67
>>   #define H_OVERLAP         -68
>>   #define H_UNSUPPORTED_FLAG -256
>> @@ -564,8 +580,9 @@ struct SpaprMachineState {
>>   #define H_SCM_HEALTH            0x400
>>   #define H_RPT_INVALIDATE        0x448
>>   #define H_SCM_FLUSH             0x44C
>> +#define H_WATCHDOG              0x45C
>> -#define MAX_HCALL_OPCODE        H_SCM_FLUSH
>> +#define MAX_HCALL_OPCODE        H_WATCHDOG
>>   /* The hcalls above are standardized in PAPR and implemented by pHyp
>>    * as well.
>> @@ -1027,6 +1044,7 @@ extern const VMStateDescription 
>> vmstate_spapr_cap_large_decr;
>>   extern const VMStateDescription vmstate_spapr_cap_ccf_assist;
>>   extern const VMStateDescription vmstate_spapr_cap_fwnmi;
>>   extern const VMStateDescription vmstate_spapr_cap_rpt_invalidate;
>> +extern const VMStateDescription vmstate_spapr_wdt;
>>   static inline uint8_t spapr_get_cap(SpaprMachineState *spapr, int cap)
>>   {
>> @@ -1063,4 +1081,7 @@ target_ulong 
>> spapr_vof_client_architecture_support(MachineState *ms,
>>                                                      target_ulong 
>> ovec_addr);
>>   void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
>> +/* H_WATCHDOG */
>> +void spapr_watchdog_init(SpaprMachineState *spapr);
>> +
>>   #endif /* HW_SPAPR_H */
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index fd4942e8813c..eaa75f5afd02 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -898,6 +898,8 @@ static void spapr_dt_rtas(SpaprMachineState 
>> *spapr, void *fdt)
>>           add_str(hypertas, "hcall-hpt-resize");
>>       }
>> +    add_str(hypertas, "hcall-watchdog");
>> +
>>       _FDT(fdt_setprop(fdt, rtas, "ibm,hypertas-functions",
>>                        hypertas->str, hypertas->len));
>>       g_string_free(hypertas, TRUE);
>> @@ -2067,6 +2069,7 @@ static const VMStateDescription vmstate_spapr = {
>>           &vmstate_spapr_cap_fwnmi,
>>           &vmstate_spapr_fwnmi,
>>           &vmstate_spapr_cap_rpt_invalidate,
>> +        &vmstate_spapr_wdt,
>>           NULL
>>       }
>>   };
>> @@ -3051,6 +3054,8 @@ static void spapr_machine_init(MachineState 
>> *machine)
>>           spapr->vof->fw_size = fw_size; /* for claim() on itself */
>>           spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, 
>> spapr_h_vof_client);
>>       }
>> +
>> +    spapr_watchdog_init(spapr);
>>   }
>>   #define DEFAULT_KVM_TYPE "auto"
>> diff --git a/hw/ppc/spapr_watchdog.c b/hw/ppc/spapr_watchdog.c
>> new file mode 100644
>> index 000000000000..5206e40078b5
>> --- /dev/null
>> +++ b/hw/ppc/spapr_watchdog.c
>> @@ -0,0 +1,239 @@
>> +/*
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License as published by the Free Software Foundation; either
>> + * version 2.1 of the License, or (at your option) any later version.
>> + *
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, see 
>> <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "sysemu/runstate.h"
>> +#include "migration/vmstate.h"
>> +#include "trace.h"
>> +
>> +#include "hw/ppc/spapr.h"
>> +
>> +#define PPC_BITLSHIFT(be)       (BITS_PER_LONG - 1 - (be))
>> +
>> +#define SETFIELD(val, start, end)   \
>> +    (((unsigned long)(val) << PPC_BITLSHIFT(end)) & 
>> PPC_BITMASK(start, end))
>> +#define GETFIELD(val, start, end)   \
>> +    (((unsigned long)(val) & PPC_BITMASK(start, end)) >> 
>> PPC_BITLSHIFT(end))
>> +
>> +/*
>> + * Bits 47: "leaveOtherWatchdogsRunningOnTimeout", specified on
>> + * the "Start watchdog" operation,
>> + * 0 - stop out-standing watchdogs on timeout,
>> + * 1 - leave outstanding watchdogs running on timeout
>> + */
>> +#define PSERIES_WDTF_LEAVE_OTHER    PPC_BIT(47)
>> +
>> +/*    Bits 48-55: "operation" */
>> +#define PSERIES_WDTF_OP(op)             SETFIELD((op), 48, 55)
>> +#define PSERIES_WDTF_OP_START           PSERIES_WDTF_OP(0x1)
>> +#define PSERIES_WDTF_OP_STOP            PSERIES_WDTF_OP(0x2)
>> +#define PSERIES_WDTF_OP_QUERY           PSERIES_WDTF_OP(0x3)
>> +#define PSERIES_WDTF_OP_QUERY_LPM       PSERIES_WDTF_OP(0x4)
>> +
>> +/*    Bits 56-63: "timeoutAction" */
>> +#define PSERIES_WDTF_ACTION(ac)             SETFIELD(ac, 56, 63)
>> +#define PSERIES_WDTF_ACTION_HARD_POWER_OFF  PSERIES_WDTF_ACTION(0x1)
>> +#define PSERIES_WDTF_ACTION_HARD_RESTART    PSERIES_WDTF_ACTION(0x2)
>> +#define PSERIES_WDTF_ACTION_DUMP_RESTART    PSERIES_WDTF_ACTION(0x3)
>> +
>> +#define PSERIES_WDTF_RESERVED           PPC_BITMASK(0, 46)
>> +
>> +/*
>> + * For the "Query watchdog capabilities" operation, a uint64 structure
>> + * defined as:
>> + * Bits 0-15: The minimum supported timeout in milliseconds
>> + * Bits 16-31: The number of watchdogs supported
>> + * Bits 32-63: Reserved
>> + */
>> +#define PSERIES_WDTQ_MIN_TIMEOUT(ms)    SETFIELD((ms), 0, 15)
>> +#define PSERIES_WDTQ_NUM(n)             SETFIELD((n), 16, 31)
>> +#define PSERIES_WDTQ_RESERVED           PPC_BITMASK(32, 63)
>> +
>> +/*
>> + * For the "Query watchdog LPM requirement" operation:
>> + * 1 = The given "watchdogNumber" must be stopped prior to suspending
>> + * 2 = The given "watchdogNumber" does not have to be stopped prior to
>> + * suspending
>> + */
>> +#define PSERIES_WDTQL_STOPPED               1
>> +#define PSERIES_WDTQL_QUERY_NOT_STOPPED     2
>> +
>> +#define WDT_MIN_TIMEOUT 1 /* 1ms */
>> +
>> +static void watchdog_expired(void *pw)
>> +{
>> +    struct SpaprWatchdog *w = pw;
>> +    CPUState *cs;
>> +
>> +    trace_spapr_watchdog_expired(w->num, w->action);
>> +    switch (w->action) {
>> +    case WDT_HARD_POWER_OFF:
>> +        qemu_system_vmstop_request(RUN_STATE_SHUTDOWN);
>> +        break;
>> +    case WDT_HARD_RESTART:
>> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>> +        break;
>> +    case WDT_DUMP_RESTART:
>> +        CPU_FOREACH(cs) {
>> +            async_run_on_cpu(cs, spapr_do_system_reset_on_cpu, 
>> RUN_ON_CPU_NULL);
>> +        }
>> +        break;
>> +    }
>> +}
>> +
>> +static target_ulong watchdog_stop(unsigned watchdogNumber,
>> +                                  struct SpaprWatchdog *w)
>> +{
>> +    target_ulong ret = H_NOOP;
>> +
>> +    if (timer_pending(&w->timer)) {
>> +        timer_del(&w->timer);
>> +        ret = H_SUCCESS;
>> +    }
>> +    trace_spapr_watchdog_stop(watchdogNumber, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static target_ulong h_watchdog(PowerPCCPU *cpu,
>> +                               SpaprMachineState *spapr,
>> +                               target_ulong opcode, target_ulong *args)
>> +{
>> +    target_ulong flags = args[0];
>> +    target_ulong watchdogNumber = args[1];
>> +    target_ulong timeoutInMs = args[2];
>> +    unsigned operation = flags & PSERIES_WDTF_OP(~0);
>> +    unsigned timeoutAction = flags & PSERIES_WDTF_ACTION(~0);
>> +    struct SpaprWatchdog *w;
>> +
>> +    if (flags & PSERIES_WDTF_RESERVED || watchdogNumber == 0) {
> 
> Here. I've put some old fashioned printfs (feel free to add more traces 
> btw) and
> it seems that watchdogNumber is == 0. H_PARAMETER is being returned and 
> the module
> fails probe().
> 
> There's a good chance that I'm missing something in my testing, so any 
> advice
> is welcome.


Nah, this sounds more like a bug as query is not supposed to pass a 
watchdog number and in my tests there probably was some garbage. Thanks,


> 
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
>> +        return H_PARAMETER;
>> +    }
>> +
>> +    switch (operation) {
>> +    case PSERIES_WDTF_OP_START:
>> +        if (watchdogNumber > ARRAY_SIZE(spapr->wds)) {
>> +            return H_P2;
>> +        }
>> +        if (timeoutInMs <= WDT_MIN_TIMEOUT) {
>> +            return H_P3;
>> +        }
>> +
>> +        w = &spapr->wds[watchdogNumber - 1];
>> +        switch (timeoutAction) {
>> +        case PSERIES_WDTF_ACTION_HARD_POWER_OFF:
>> +            w->action = WDT_HARD_POWER_OFF;
>> +            break;
>> +        case PSERIES_WDTF_ACTION_HARD_RESTART:
>> +            w->action = WDT_HARD_RESTART;
>> +            break;
>> +        case PSERIES_WDTF_ACTION_DUMP_RESTART:
>> +            w->action = WDT_DUMP_RESTART;
>> +            break;
>> +        default:
>> +            return H_PARAMETER;
>> +        }
>> +        timer_mod(&w->timer,
>> +                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + timeoutInMs);
>> +        trace_spapr_watchdog_start(flags, watchdogNumber, timeoutInMs);
>> +        break;
>> +    case PSERIES_WDTF_OP_STOP:
>> +        if (watchdogNumber == (uint64_t) ~0) {
>> +            int i;
>> +
>> +            for (i = 1; i <= ARRAY_SIZE(spapr->wds); ++i) {
>> +                watchdog_stop(i, &spapr->wds[i - 1]);
>> +            }
>> +        } else if (watchdogNumber <= ARRAY_SIZE(spapr->wds)) {
>> +            watchdog_stop(watchdogNumber, &spapr->wds[watchdogNumber 
>> - 1]);
>> +        } else {
>> +            return H_P2;
>> +        }
>> +        break;
>> +    case PSERIES_WDTF_OP_QUERY:
>> +        args[0] = PSERIES_WDTQ_MIN_TIMEOUT(WDT_MIN_TIMEOUT) |
>> +            PSERIES_WDTQ_NUM(ARRAY_SIZE(spapr->wds));
>> +        trace_spapr_watchdog_query(args[0]);
>> +        break;
>> +    case PSERIES_WDTF_OP_QUERY_LPM:
>> +        if (watchdogNumber > ARRAY_SIZE(spapr->wds)) {
>> +            return H_P2;
>> +        }
>> +        args[0] = PSERIES_WDTQL_QUERY_NOT_STOPPED;
>> +        trace_spapr_watchdog_query_lpm(args[0]);
>> +        break;
>> +    default:
>> +        return H_PARAMETER;
>> +    }
>> +
>> +    return H_SUCCESS;
>> +}
>> +
>> +void spapr_watchdog_init(SpaprMachineState *spapr)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(spapr->wds); ++i) {
>> +        SpaprWatchdog *w = &spapr->wds[i];
>> +
>> +        w->num = i + 1;
>> +        timer_init_ms(&w->timer, QEMU_CLOCK_VIRTUAL, 
>> watchdog_expired, w);
>> +    }
>> +}
>> +
>> +static const VMStateDescription vmstate_wdt = {
>> +    .name = "spapr_watchdog",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT8(action, SpaprWatchdog),
>> +        VMSTATE_UINT64(timeout, SpaprWatchdog),
>> +        VMSTATE_TIMER(timer, SpaprWatchdog),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static bool watchdog_needed(void *opaque)
>> +{
>> +    SpaprMachineState *spapr = opaque;
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(spapr->wds); ++i) {
>> +        if (timer_pending(&spapr->wds[i].timer)) {
>> +            return true;
>> +        }
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +const VMStateDescription vmstate_spapr_wdt = {
>> +    .name = "spapr_watchdogs",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .needed = watchdog_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_STRUCT_ARRAY(wds, SpaprMachineState, 
>> WDT_MAX_WATCHDOGS, 0,
>> +                             vmstate_wdt, SpaprWatchdog),
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +};
>> +
>> +static void spapr_watchdog_register_types(void)
>> +{
>> +    spapr_register_hypercall(H_WATCHDOG, h_watchdog);
>> +}
>> +
>> +type_init(spapr_watchdog_register_types)
>> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
>> index aa4c8e6a2eac..2d1f6c262ce9 100644
>> --- a/hw/ppc/meson.build
>> +++ b/hw/ppc/meson.build
>> @@ -27,6 +27,7 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
>>     'spapr_nvdimm.c',
>>     'spapr_rtas_ddw.c',
>>     'spapr_numa.c',
>> +  'spapr_watchdog.c',
>>     'pef.c',
>>   ))
>>   ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_TCG'], if_true: files(
>> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
>> index 5c0a215cad90..24f2eca26da0 100644
>> --- a/hw/ppc/trace-events
>> +++ b/hw/ppc/trace-events
>> @@ -71,6 +71,13 @@ spapr_rtas_ibm_configure_connector_invalid(uint32_t 
>> index) "DRC index: 0x%"PRIx3
>>   spapr_vio_h_reg_crq(uint64_t reg, uint64_t queue_addr, uint64_t 
>> queue_len) "CRQ for dev 0x%" PRIx64 " registered at 0x%" PRIx64 "/0x%" 
>> PRIx64
>>   spapr_vio_free_crq(uint32_t reg) "CRQ for dev 0x%" PRIx32 " freed"
>> +# spapr_watchdog.c
>> +spapr_watchdog_start(uint64_t flags, uint64_t num, uint64_t timeout) 
>> "Flags 0x%" PRIx64 " num=%" PRId64 " %" PRIu64 "ms"
>> +spapr_watchdog_stop(uint64_t num, uint64_t ret) "num=%" PRIu64 " 
>> ret=%" PRId64
>> +spapr_watchdog_query(uint64_t caps) "caps=0x%" PRIx64
>> +spapr_watchdog_query_lpm(uint64_t caps) "caps=0x%" PRIx64
>> +spapr_watchdog_expired(uint64_t num, unsigned action) "num=%" PRIu64 
>> " action=%u"
>> +
>>   # vof.c
>>   vof_error_str_truncated(const char *s, int len) "%s truncated to %d"
>>   vof_error_param(const char *method, int nargscheck, int nretcheck, 
>> int nargs, int nret) "%s takes/returns %d/%d, not %d/%d"

-- 
Alexey

