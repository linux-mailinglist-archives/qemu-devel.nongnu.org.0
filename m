Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766C8477AA2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:33:18 +0100 (CET)
Received: from localhost ([::1]:54524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxud3-0002mS-DR
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:33:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxual-0001GC-De; Thu, 16 Dec 2021 12:30:56 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:52151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxuad-0000Ud-TA; Thu, 16 Dec 2021 12:30:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.51])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id CA73521DCC;
 Thu, 16 Dec 2021 17:30:37 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 16 Dec
 2021 18:30:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00313a1b285-ff0a-465d-89a8-25b18a7d8924,
 C4E9F14F77021FCD78381261BFC7BBA46F2BB44E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <09a593f8-a0fc-4971-5e69-b915ee9d724d@kaod.org>
Date: Thu, 16 Dec 2021 18:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] ppc: Add QOM interface for machine check injection
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20211013214042.618918-1-clg@kaod.org>
 <20211013214042.618918-2-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211013214042.618918-2-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c4632d9e-620b-43e6-bec1-3342479c5323
X-Ovh-Tracer-Id: 8628052463135001452
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrleeggddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 23:40, Cédric Le Goater wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
> 
> This implements a machine check injection framework and defines a
> 'mce' monitor command for ppc.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> [ clg: - moved definition under "hw/ppc/mce.h"
>         - renamed to PPCMceInjection
>         - simplified injection call in hmp_mce
>         - QMP support ]
> Message-Id: <20200325144147.221875-4-npiggin@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>


I did not initially copy the QAPI and HMP maintainers :/

One important question is about the stability of the API. MCE is
implementation specific and may change with CPUs. How much of it
can we change once it is merged ? May be this is not the right
approach.


Thanks,

C.

> ---
>   qapi/misc-target.json | 26 ++++++++++++++++++++
>   include/hw/ppc/mce.h  | 31 ++++++++++++++++++++++++
>   target/ppc/monitor.c  | 56 +++++++++++++++++++++++++++++++++++++++++++
>   hmp-commands.hx       | 20 +++++++++++++++-
>   4 files changed, 132 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/ppc/mce.h
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 594fbd1577fa..b1456901893c 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -394,3 +394,29 @@
>   #
>   ##
>   { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
> +
> +##
> +# @mce:
> +#
> +# This command injects a machine check exception
> +#
> +# @cpu-index: CPU number on which to inject the machine check exception
> +#
> +# @srr1-mask : possible reasons for the exception
> +#
> +# @dsisr : more reasons
> +#
> +# @dar : effective address of next instruction
> +#
> +# @recovered : recoverable exception. Set MSR[RI]
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'command': 'mce',
> +  'data': { 'cpu-index': 'uint32',
> +            'srr1-mask': 'uint64',
> +            'dsisr': 'uint32',
> +            'dar': 'uint64',
> +            'recovered': 'bool' },
> +  'if': 'TARGET_PPC' }
> diff --git a/include/hw/ppc/mce.h b/include/hw/ppc/mce.h
> new file mode 100644
> index 000000000000..b2b7dfa3342c
> --- /dev/null
> +++ b/include/hw/ppc/mce.h
> @@ -0,0 +1,31 @@
> +/*
> + * Copyright (c) 2021, IBM Corporation.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_PPC_MCE_H
> +#define HW_PPC_MCE_H
> +
> +typedef struct PPCMceInjectionParams {
> +    uint64_t srr1_mask;
> +    uint32_t dsisr;
> +    uint64_t dar;
> +    bool recovered;
> +} PPCMceInjectionParams;
> +
> +typedef struct PPCMceInjection PPCMceInjection;
> +
> +#define TYPE_PPC_MCE_INJECTION "ppc-mce-injection"
> +#define PPC_MCE_INJECTION(obj) \
> +    INTERFACE_CHECK(PPCMceInjection, (obj), TYPE_PPC_MCE_INJECTION)
> +typedef struct PPCMceInjectionClass PPCMceInjectionClass;
> +DECLARE_CLASS_CHECKERS(PPCMceInjectionClass, PPC_MCE_INJECTION,
> +                       TYPE_PPC_MCE_INJECTION)
> +
> +struct PPCMceInjectionClass {
> +    InterfaceClass parent_class;
> +    void (*inject_mce)(CPUState *cs, PPCMceInjectionParams *p);
> +};
> +
> +#endif
> diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
> index a475108b2dbc..ae1a047e86de 100644
> --- a/target/ppc/monitor.c
> +++ b/target/ppc/monitor.c
> @@ -23,11 +23,15 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-misc-target.h"
>   #include "cpu.h"
>   #include "monitor/monitor.h"
>   #include "qemu/ctype.h"
>   #include "monitor/hmp-target.h"
>   #include "monitor/hmp.h"
> +#include "qapi/qmp/qdict.h"
> +#include "hw/ppc/mce.h"
>   
>   static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
>                                      int val)
> @@ -76,6 +80,48 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict)
>       dump_mmu(env1);
>   }
>   
> +void qmp_mce(uint32_t cpu_index, uint64_t srr1_mask, uint32_t dsisr,
> +             uint64_t dar, bool recovered, Error **errp)
> +{
> +    PPCMceInjection *mce = (PPCMceInjection *)
> +        object_dynamic_cast(qdev_get_machine(), TYPE_PPC_MCE_INJECTION);
> +    CPUState *cs;
> +
> +    if (!mce) {
> +        error_setg(errp, "MCE injection not supported on this machine");
> +        return;
> +    }
> +
> +    cs = qemu_get_cpu(cpu_index);
> +
> +    if (cs != NULL) {
> +        PPCMceInjectionClass *mcec = PPC_MCE_INJECTION_GET_CLASS(mce);
> +        PPCMceInjectionParams p = {
> +            .srr1_mask = srr1_mask,
> +            .dsisr = dsisr,
> +            .dar = dar,
> +            .recovered = recovered,
> +        };
> +        mcec->inject_mce(cs, &p);
> +    }
> +}
> +
> +void hmp_mce(Monitor *mon, const QDict *qdict)
> +{
> +    uint32_t cpu_index = qdict_get_int(qdict, "cpu_index");
> +    uint64_t srr1_mask = qdict_get_int(qdict, "srr1_mask");
> +    uint32_t dsisr = qdict_get_int(qdict, "dsisr");
> +    uint64_t dar = qdict_get_int(qdict, "dar");
> +    bool recovered = qdict_get_int(qdict, "recovered");
> +    Error *err = NULL;
> +
> +    qmp_mce(cpu_index, srr1_mask, dsisr, dar, recovered, &err);
> +    if (err) {
> +        hmp_handle_error(mon, err);
> +        return;
> +    }
> +}
> +
>   const MonitorDef monitor_defs[] = {
>       { "fpscr", offsetof(CPUPPCState, fpscr) },
>       /* Next instruction pointer */
> @@ -156,3 +202,13 @@ int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
>   
>       return -EINVAL;
>   }
> +
> +static const TypeInfo type_infos[] = {
> +    {
> +        .name = TYPE_PPC_MCE_INJECTION,
> +        .parent = TYPE_INTERFACE,
> +        .class_size = sizeof(PPCMceInjectionClass),
> +    },
> +};
> +
> +DEFINE_TYPES(type_infos);
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index cf723c69acb7..15d939ae096e 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1461,12 +1461,30 @@ ERST
>           .cmd        = hmp_mce,
>       },
>   
> -#endif
>   SRST
>   ``mce`` *cpu* *bank* *status* *mcgstatus* *addr* *misc*
>     Inject an MCE on the given CPU (x86 only).
>   ERST
>   
> +#endif
> +
> +#if defined(TARGET_PPC)
> +
> +    {
> +        .name       = "mce",
> +        .args_type  = "cpu_index:i,srr1_mask:l,dsisr:i,dar:l,recovered:i",
> +        .params     = "cpu srr1_mask dsisr dar recovered",
> +        .help       = "inject a MCE on the given CPU",
> +        .cmd        = hmp_mce,
> +    },
> +
> +SRST
> +``mce`` *cpu* *srr1_mask* *dsisr* *dar* *recovered*
> +  Inject an MCE on the given CPU (PPC only).
> +ERST
> +
> +#endif
> +
>       {
>           .name       = "getfd",
>           .args_type  = "fdname:s",
> 


