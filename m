Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C375599E0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:51:45 +0200 (CEST)
Received: from localhost ([::1]:38218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4iml-0004mZ-1i
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4ijq-0002Sl-KS; Fri, 24 Jun 2022 08:48:42 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:44822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4ijm-0004EQ-2X; Fri, 24 Jun 2022 08:48:41 -0400
Received: by mail-oi1-x230.google.com with SMTP id h65so3439494oia.11;
 Fri, 24 Jun 2022 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AbZOXBl+nH+njYRvgljyt2pLU0CtOyjUOFUcUqthoZg=;
 b=EwwubRPylmzXlGXpygyGMgblV7XfUrKbABRrf3UAo2QCfwmMLE2YxXEVC8iGwwSCyS
 70z/AKbDuM9ZXIwG3b69pK2yBwbCq3TgvkFsQWH74JbNMSIF9hdBpR2bPvQT3Ui49ZEE
 yJi0uxWElYX//P3iUYtp2pqhyDCOY1MipkKI+qLSei8EYDVSodLNzYOpqu+Q6Cra2oL5
 GxzGOq1ojEyhQEfC60hN7+/umR5/uFFasEyONAy7CmSeQbLydao19mose9S8Vro6b7Hk
 0rKW2Lm4HWwr8FRchIMjakFFOhgLGmN5uAk6iw74eF5ZFc8JKh38z1omyjpZMULimI9M
 xPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AbZOXBl+nH+njYRvgljyt2pLU0CtOyjUOFUcUqthoZg=;
 b=3FedqaizDo6VBf14/+e5xujlQKbuwYRI40vpQc8qtkck36VLH7MUhwquoMLzYFlSQT
 qeq0w0IbUVC3fhS8blXuEZeZbCOexn6Jqox6Bx5Dbnhv7gULYV7cjE619vkD1S8NdI5s
 wNhzCnHmjY/LUpJ6Clkrkeoi4M3YZrLb2k1m6m0LLFWxPNLZs42mLDjYOvtWuMERkpoJ
 TBmln6PMMVkIl7loW4RmAsfZZBNgC3/WgpwSzS5aLSZSV+7XWV8klWiglvibATHm+hrC
 Er4EdOVadnOLzWukjuHgzBxOgNSH4sBkAEc/UwZaj5QD7Z9A4Z/r6xiOwWYesXLEG/7m
 UspA==
X-Gm-Message-State: AJIora8QyHN4BkSfhnMEITJiGSKyZopWAw8x/iYpFiBPQfdWkYDhHPLz
 v2oBoAWAlim06K3m6UKtv4A=
X-Google-Smtp-Source: AGRyM1vQWH7I/nMk+qlNjIIbgSyUJxO/2YjLOUD6rjy9Eew+msAUsY9zhvfhmnvVhAe8zCnb/VNWeg==
X-Received: by 2002:a05:6808:2126:b0:32e:a750:f8b4 with SMTP id
 r38-20020a056808212600b0032ea750f8b4mr1848742oiw.278.1656074916396; 
 Fri, 24 Jun 2022 05:48:36 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a4ad415000000b0042560c9876dsm1297541oos.23.2022.06.24.05.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 05:48:36 -0700 (PDT)
Message-ID: <f2b9eeb6-5055-fe3c-1935-6425bd1037b7@gmail.com>
Date: Fri, 24 Jun 2022 09:48:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu v3] ppc/spapr: Implement H_WATCHDOG
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Scott Cheloha <cheloha@linux.ibm.com>
References: <20220622051008.1067464-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220622051008.1067464-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 6/22/22 02:10, Alexey Kardashevskiy wrote:
> The new PAPR 2.12 defines a watchdog facility managed via the new
> H_WATCHDOG hypercall.
> 
> This adds H_WATCHDOG support which a proposed driver for pseries uses:
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=303120
> 
> This was tested by running QEMU with a debug kernel and command line:
> -append \
>   "pseries-wdt.timeout=60 pseries-wdt.nowayout=1 pseries-wdt.action=2"
> 
> and running "echo V > /dev/watchdog0" inside the VM.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> Changes:
> v3:
> * removed @num from SpaprWatchdog
> * reworked to use standard FIELD_EX/FIELD_OP
> * expire_time is a property now
> * added handling of leaveOtherWatchdogsRunningOnTimeout
> 
> v2:
> * QOM'ed timers, "action" and "expire" are available via QMP
> * removed @timeout from SpaprWatchdog
> * moved the driver to hw/watchdog
> * fixed error handling in the hcall handler
> * used new SETFIELD/GETFIELD
> ---
>   include/hw/ppc/spapr.h       |  25 +++-
>   hw/ppc/spapr.c               |   4 +
>   hw/watchdog/spapr_watchdog.c | 274 +++++++++++++++++++++++++++++++++++
>   hw/watchdog/meson.build      |   1 +
>   hw/watchdog/trace-events     |   7 +
>   5 files changed, 310 insertions(+), 1 deletion(-)
>   create mode 100644 hw/watchdog/spapr_watchdog.c
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 072dda2c7265..891be79604fe 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -164,6 +164,21 @@ struct SpaprMachineClass {
>       SpaprIrq *irq;
>   };
>   
> +#define WDT_MAX_WATCHDOGS       4      /* Maximum number of watchdog devices */
> +
> +#define TYPE_SPAPR_WDT "spapr-wdt"
> +OBJECT_DECLARE_SIMPLE_TYPE(SpaprWatchdog, SPAPR_WDT)
> +
> +typedef struct SpaprWatchdog {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +    /*< public >*/
> +
> +    QEMUTimer timer;
> +    uint8_t action;         /* One of PSERIES_WDTF_ACTION_xxx */
> +    uint8_t leave_others;   /* leaveOtherWatchdogsRunningOnTimeout */
> +} SpaprWatchdog;
> +
>   /**
>    * SpaprMachineState:
>    */
> @@ -264,6 +279,8 @@ struct SpaprMachineState {
>       uint32_t FORM2_assoc_array[NUMA_NODES_MAX_NUM][FORM2_NUMA_ASSOC_SIZE];
>   
>       Error *fwnmi_migration_blocker;
> +
> +    SpaprWatchdog wds[WDT_MAX_WATCHDOGS];
>   };
>   
>   #define H_SUCCESS         0
> @@ -344,6 +361,7 @@ struct SpaprMachineState {
>   #define H_P7              -60
>   #define H_P8              -61
>   #define H_P9              -62
> +#define H_NOOP            -63
>   #define H_UNSUPPORTED     -67
>   #define H_OVERLAP         -68
>   #define H_UNSUPPORTED_FLAG -256
> @@ -564,8 +582,9 @@ struct SpaprMachineState {
>   #define H_SCM_HEALTH            0x400
>   #define H_RPT_INVALIDATE        0x448
>   #define H_SCM_FLUSH             0x44C
> +#define H_WATCHDOG              0x45C
>   
> -#define MAX_HCALL_OPCODE        H_SCM_FLUSH
> +#define MAX_HCALL_OPCODE        H_WATCHDOG
>   
>   /* The hcalls above are standardized in PAPR and implemented by pHyp
>    * as well.
> @@ -1027,6 +1046,7 @@ extern const VMStateDescription vmstate_spapr_cap_large_decr;
>   extern const VMStateDescription vmstate_spapr_cap_ccf_assist;
>   extern const VMStateDescription vmstate_spapr_cap_fwnmi;
>   extern const VMStateDescription vmstate_spapr_cap_rpt_invalidate;
> +extern const VMStateDescription vmstate_spapr_wdt;
>   
>   static inline uint8_t spapr_get_cap(SpaprMachineState *spapr, int cap)
>   {
> @@ -1063,4 +1083,7 @@ target_ulong spapr_vof_client_architecture_support(MachineState *ms,
>                                                      target_ulong ovec_addr);
>   void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
>   
> +/* H_WATCHDOG */
> +void spapr_watchdog_init(SpaprMachineState *spapr);
> +
>   #endif /* HW_SPAPR_H */
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index fd4942e8813c..9a5382d5270f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -898,6 +898,8 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
>           add_str(hypertas, "hcall-hpt-resize");
>       }
>   
> +    add_str(hypertas, "hcall-watchdog");
> +
>       _FDT(fdt_setprop(fdt, rtas, "ibm,hypertas-functions",
>                        hypertas->str, hypertas->len));
>       g_string_free(hypertas, TRUE);
> @@ -3051,6 +3053,8 @@ static void spapr_machine_init(MachineState *machine)
>           spapr->vof->fw_size = fw_size; /* for claim() on itself */
>           spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, spapr_h_vof_client);
>       }
> +
> +    spapr_watchdog_init(spapr);
>   }
>   
>   #define DEFAULT_KVM_TYPE "auto"
> diff --git a/hw/watchdog/spapr_watchdog.c b/hw/watchdog/spapr_watchdog.c
> new file mode 100644
> index 000000000000..55ff1f03c1da
> --- /dev/null
> +++ b/hw/watchdog/spapr_watchdog.c
> @@ -0,0 +1,274 @@
> +/*
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "target/ppc/cpu.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +#include "hw/ppc/spapr.h"
> +
> +#define FIELD_BE(reg, field, start, len) \
> +    FIELD(reg, field, 64 - (start + len), len)
> +
> +/*
> + * Bits 47: "leaveOtherWatchdogsRunningOnTimeout", specified on
> + * the "Start watchdog" operation,
> + * 0 - stop out-standing watchdogs on timeout,
> + * 1 - leave outstanding watchdogs running on timeout
> + */
> +FIELD_BE(PSERIES_WDTF, LEAVE_OTHER, 47, 1)
> +
> +/*    Bits 48-55: "operation" */
> +FIELD_BE(PSERIES_WDTF, OP, 48, 8)
> +#define PSERIES_WDTF_OP_START           0x1
> +#define PSERIES_WDTF_OP_STOP            0x2
> +#define PSERIES_WDTF_OP_QUERY           0x3
> +#define PSERIES_WDTF_OP_QUERY_LPM       0x4
> +
> +/*    Bits 56-63: "timeoutAction" */
> +FIELD_BE(PSERIES_WDTF, ACTION, 56, 8)
> +#define PSERIES_WDTF_ACTION_HARD_POWER_OFF  0x1
> +#define PSERIES_WDTF_ACTION_HARD_RESTART    0x2
> +#define PSERIES_WDTF_ACTION_DUMP_RESTART    0x3
> +
> +FIELD_BE(PSERIES_WDTF, RESERVED, 0, 47)
> +
> +/* Special watchdogNumber for the "stop all watchdogs" operation */
> +#define PSERIES_WDT_STOP_ALL            ((uint64_t)~0)
> +
> +/*
> + * For the "Query watchdog capabilities" operation, a uint64 structure
> + * defined as:
> + * Bits 0-15: The minimum supported timeout in milliseconds
> + * Bits 16-31: The number of watchdogs supported
> + * Bits 32-63: Reserved
> + */
> +FIELD_BE(PSERIES_WDTQ, MIN_TIMEOUT, 0, 16)
> +FIELD_BE(PSERIES_WDTQ, NUM, 16, 16)
> +
> +/*
> + * For the "Query watchdog LPM requirement" operation:
> + * 1 = The given "watchdogNumber" must be stopped prior to suspending
> + * 2 = The given "watchdogNumber" does not have to be stopped prior to
> + * suspending
> + */
> +#define PSERIES_WDTQL_STOPPED               1
> +#define PSERIES_WDTQL_QUERY_NOT_STOPPED     2
> +
> +#define WDT_MIN_TIMEOUT 1 /* 1ms */
> +
> +static target_ulong watchdog_stop(unsigned watchdogNumber, SpaprWatchdog *w)
> +{
> +    target_ulong ret = H_NOOP;
> +
> +    if (timer_pending(&w->timer)) {
> +        timer_del(&w->timer);
> +        ret = H_SUCCESS;
> +    }
> +    trace_spapr_watchdog_stop(watchdogNumber, ret);
> +
> +    return ret;
> +}
> +
> +static target_ulong watchdog_stop_all(SpaprMachineState *spapr)
> +{
> +    target_ulong ret = H_NOOP;
> +    int i;
> +
> +    for (i = 1; i <= ARRAY_SIZE(spapr->wds); ++i) {
> +        target_ulong r = watchdog_stop(i, &spapr->wds[i - 1]);
> +
> +        if (r != H_NOOP && r != H_SUCCESS) {
> +            ret = r;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +static void watchdog_expired(void *pw)
> +{
> +    SpaprWatchdog *w = pw;
> +    CPUState *cs;
> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> +    unsigned num = w - spapr->wds;
> +
> +    g_assert(num < ARRAY_SIZE(spapr->wds));
> +    trace_spapr_watchdog_expired(num, w->action);
> +    switch (w->action) {
> +    case PSERIES_WDTF_ACTION_HARD_POWER_OFF:
> +        qemu_system_vmstop_request(RUN_STATE_SHUTDOWN);
> +        break;
> +    case PSERIES_WDTF_ACTION_HARD_RESTART:
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        break;
> +    case PSERIES_WDTF_ACTION_DUMP_RESTART:
> +        CPU_FOREACH(cs) {
> +            async_run_on_cpu(cs, spapr_do_system_reset_on_cpu, RUN_ON_CPU_NULL);
> +        }
> +        break;
> +    }
> +    if (!w->leave_others) {
> +        watchdog_stop_all(spapr);
> +    }
> +}
> +
> +static target_ulong h_watchdog(PowerPCCPU *cpu,
> +                               SpaprMachineState *spapr,
> +                               target_ulong opcode, target_ulong *args)
> +{
> +    target_ulong ret = H_SUCCESS;
> +    target_ulong flags = args[0];
> +    target_ulong watchdogNumber = args[1]; /* 1-Based per PAPR */
> +    target_ulong timeoutInMs = args[2];
> +    unsigned operation = FIELD_EX64(flags, PSERIES_WDTF, OP);
> +    unsigned timeoutAction = FIELD_EX64(flags, PSERIES_WDTF, ACTION);
> +    SpaprWatchdog *w;
> +
> +    if (FIELD_EX64(flags, PSERIES_WDTF, RESERVED)) {
> +        return H_PARAMETER;
> +    }
> +
> +    switch (operation) {
> +    case PSERIES_WDTF_OP_START:
> +        if (watchdogNumber > ARRAY_SIZE(spapr->wds)) {
> +            return H_P2;
> +        }
> +        if (timeoutInMs <= WDT_MIN_TIMEOUT) {
> +            return H_P3;
> +        }
> +
> +        w = &spapr->wds[watchdogNumber - 1];
> +        switch (timeoutAction) {
> +        case PSERIES_WDTF_ACTION_HARD_POWER_OFF:
> +        case PSERIES_WDTF_ACTION_HARD_RESTART:
> +        case PSERIES_WDTF_ACTION_DUMP_RESTART:
> +            w->action = timeoutAction;
> +            break;
> +        default:
> +            return H_PARAMETER;
> +        }
> +        w->leave_others = FIELD_EX64(flags, PSERIES_WDTF, LEAVE_OTHER);
> +        timer_mod(&w->timer,
> +                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + timeoutInMs);
> +        trace_spapr_watchdog_start(flags, watchdogNumber, timeoutInMs);
> +        break;
> +    case PSERIES_WDTF_OP_STOP:
> +        if (watchdogNumber == PSERIES_WDT_STOP_ALL) {
> +            ret = watchdog_stop_all(spapr);
> +        } else if (watchdogNumber <= ARRAY_SIZE(spapr->wds)) {
> +            ret = watchdog_stop(watchdogNumber,
> +                                &spapr->wds[watchdogNumber - 1]);
> +        } else {
> +            return H_P2;
> +        }
> +        break;
> +    case PSERIES_WDTF_OP_QUERY:
> +        args[0] = FIELD_DP64(0, PSERIES_WDTQ, MIN_TIMEOUT, WDT_MIN_TIMEOUT);
> +        args[0] = FIELD_DP64(args[0], PSERIES_WDTQ, NUM,
> +                             ARRAY_SIZE(spapr->wds));
> +        trace_spapr_watchdog_query(args[0]);
> +        break;
> +    case PSERIES_WDTF_OP_QUERY_LPM:
> +        if (watchdogNumber > ARRAY_SIZE(spapr->wds)) {
> +            return H_P2;
> +        }
> +        args[0] = PSERIES_WDTQL_QUERY_NOT_STOPPED;
> +        trace_spapr_watchdog_query_lpm(args[0]);
> +        break;
> +    default:
> +        return H_PARAMETER;
> +    }
> +
> +    return ret;
> +}
> +
> +void spapr_watchdog_init(SpaprMachineState *spapr)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(spapr->wds); ++i) {
> +        char name[16];
> +        SpaprWatchdog *w = &spapr->wds[i];
> +
> +        snprintf(name, sizeof(name) - 1, "wdt%d", i + 1);
> +        object_initialize_child_with_props(OBJECT(spapr), name, w,
> +                                           sizeof(SpaprWatchdog),
> +                                           TYPE_SPAPR_WDT,
> +                                           &error_fatal, NULL);
> +        qdev_realize(DEVICE(w), NULL, &error_fatal);
> +    }
> +}
> +
> +static bool watchdog_needed(void *opaque)
> +{
> +    SpaprWatchdog *w = opaque;
> +
> +    return timer_pending(&w->timer);
> +}
> +
> +static const VMStateDescription vmstate_wdt = {
> +    .name = "spapr_watchdog",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = watchdog_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_TIMER(timer, SpaprWatchdog),
> +        VMSTATE_UINT8(action, SpaprWatchdog),
> +        VMSTATE_UINT8(leave_others, SpaprWatchdog),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void spapr_wdt_realize(DeviceState *dev, Error **errp)
> +{
> +    SpaprWatchdog *w = SPAPR_WDT(dev);
> +    Object *o = OBJECT(dev);
> +
> +    timer_init_ms(&w->timer, QEMU_CLOCK_VIRTUAL, watchdog_expired, w);
> +
> +    object_property_add_uint64_ptr(o, "expire",
> +                                   (uint64_t *)&w->timer.expire_time,
> +                                   OBJ_PROP_FLAG_READ);
> +    object_property_add_uint8_ptr(o, "action", &w->action, OBJ_PROP_FLAG_READ);
> +    object_property_add_uint8_ptr(o, "leaveOtherWatchdogsRunningOnTimeout",
> +                                  &w->leave_others, OBJ_PROP_FLAG_READ);
> +}
> +
> +static void spapr_wdt_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = spapr_wdt_realize;
> +    dc->vmsd = &vmstate_wdt;
> +    dc->user_creatable = false;
> +}
> +
> +static const TypeInfo spapr_wdt_info = {
> +    .name          = TYPE_SPAPR_WDT,
> +    .parent        = TYPE_DEVICE,
> +    .instance_size = sizeof(SpaprWatchdog),
> +    .class_init    = spapr_wdt_class_init,
> +};
> +
> +static void spapr_watchdog_register_types(void)
> +{
> +    spapr_register_hypercall(H_WATCHDOG, h_watchdog);
> +    type_register_static(&spapr_wdt_info);
> +}
> +
> +type_init(spapr_watchdog_register_types)
> diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
> index 054c403dea7c..8974b5cf4c8a 100644
> --- a/hw/watchdog/meson.build
> +++ b/hw/watchdog/meson.build
> @@ -6,3 +6,4 @@ softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
>   softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
>   softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
>   softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
> +specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_watchdog.c'))
> diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
> index e7523e22aaf2..89ccbcfdfd20 100644
> --- a/hw/watchdog/trace-events
> +++ b/hw/watchdog/trace-events
> @@ -9,3 +9,10 @@ cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog: lock %" PRIu32
>   # wdt-aspeed.c
>   aspeed_wdt_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
>   aspeed_wdt_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
> +
> +# spapr_watchdog.c
> +spapr_watchdog_start(uint64_t flags, uint64_t num, uint64_t timeout) "Flags 0x%" PRIx64 " num=%" PRId64 " %" PRIu64 "ms"
> +spapr_watchdog_stop(uint64_t num, uint64_t ret) "num=%" PRIu64 " ret=%" PRId64
> +spapr_watchdog_query(uint64_t caps) "caps=0x%" PRIx64
> +spapr_watchdog_query_lpm(uint64_t caps) "caps=0x%" PRIx64
> +spapr_watchdog_expired(uint64_t num, unsigned action) "num=%" PRIu64 " action=%u"

