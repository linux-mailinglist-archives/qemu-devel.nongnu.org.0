Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C461E652F5C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 11:24:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7wFe-0002D1-Eo; Wed, 21 Dec 2022 05:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p7wFc-0002Bv-4I
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 05:23:04 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p7wFZ-00015F-Vj
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 05:23:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 57D4F20B7E;
 Wed, 21 Dec 2022 10:22:57 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 21 Dec
 2022 11:22:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0015332f8f8-ac9b-4c15-bd05-5bfab4c91e29,
 78B451B26E434E63100236457A08FF51A4610C03) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ea5ee3dc-b59e-6497-048e-dc991e38d2b7@kaod.org>
Date: Wed, 21 Dec 2022 11:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH RESEND v2 5/5] target/ppc: Restrict
 'qapi-commands-machine.h' to system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Greg Kurz
 <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, Xiaojuan
 Yang <yangxiaojuan@loongson.cn>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, <qemu-arm@nongnu.org>, David Gibson
 <david@gibson.dropbear.id.au>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Richard
 Henderson <richard.henderson@linaro.org>
References: <20221220111122.8966-1-philmd@linaro.org>
 <20221220111122.8966-6-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221220111122.8966-6-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 3951a8fa-c09e-4349-b441-da1f147c16d8
X-Ovh-Tracer-Id: 16033096148728056708
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeekgdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdihrghnghigihgrohhjuhgrnheslhhoohhnghhsohhnrdgtnhdprghurhgvlhhivghnsegruhhrvghlfedvrdhnvghtpdgthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdgrlhgvkhhsrghnug
 grrhdrrhhikhgrlhhosehshihrmhhirgdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprghrmhgsrhhusehrvgguhhgrthdrtghomhdpghgrohhsohhngheslhhoohhnghhsohhnrdgtnhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/20/22 12:11, Philippe Mathieu-Daudé wrote:
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
> 
> Move the QMP functions from cpu_init.c (which is always compiled) to
> monitor.c (which is only compiled when system-emulation is selected).
> Note ppc_cpu_class_by_name() is used by both file units, so we expose
> its prototype in "cpu-qom.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/cpu-qom.h  |  2 ++
>   target/ppc/cpu_init.c | 48 +----------------------------------------
>   target/ppc/monitor.c  | 50 ++++++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 52 insertions(+), 48 deletions(-)
> 
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 89ff88f28c..6431c520c8 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -31,6 +31,8 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
>   
> +ObjectClass *ppc_cpu_class_by_name(const char *name);
> +
>   typedef struct CPUArchState CPUPPCState;
>   typedef struct ppc_tb_t ppc_tb_t;
>   typedef struct ppc_dcr_t ppc_dcr_t;
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index cbf0081374..7858cc4c6c 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -40,7 +40,6 @@
>   #include "qemu/cutils.h"
>   #include "disas/capstone.h"
>   #include "fpu/softfloat.h"
> -#include "qapi/qapi-commands-machine-target.h"
>   
>   #include "helper_regs.h"
>   #include "internal.h"
> @@ -6816,7 +6815,7 @@ static const char *ppc_cpu_lookup_alias(const char *alias)
>       return NULL;
>   }
>   
> -static ObjectClass *ppc_cpu_class_by_name(const char *name)
> +ObjectClass *ppc_cpu_class_by_name(const char *name)
>   {
>       char *cpu_model, *typename;
>       ObjectClass *oc;
> @@ -6956,51 +6955,6 @@ void ppc_cpu_list(void)
>   #endif
>   }
>   
> -static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
> -{
> -    ObjectClass *oc = data;
> -    CpuDefinitionInfoList **first = user_data;
> -    const char *typename;
> -    CpuDefinitionInfo *info;
> -
> -    typename = object_class_get_name(oc);
> -    info = g_malloc0(sizeof(*info));
> -    info->name = g_strndup(typename,
> -                           strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
> -
> -    QAPI_LIST_PREPEND(*first, info);
> -}
> -
> -CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> -{
> -    CpuDefinitionInfoList *cpu_list = NULL;
> -    GSList *list;
> -    int i;
> -
> -    list = object_class_get_list(TYPE_POWERPC_CPU, false);
> -    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
> -    g_slist_free(list);
> -
> -    for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
> -        PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
> -        ObjectClass *oc;
> -        CpuDefinitionInfo *info;
> -
> -        oc = ppc_cpu_class_by_name(alias->model);
> -        if (oc == NULL) {
> -            continue;
> -        }
> -
> -        info = g_malloc0(sizeof(*info));
> -        info->name = g_strdup(alias->alias);
> -        info->q_typename = g_strdup(object_class_get_name(oc));
> -
> -        QAPI_LIST_PREPEND(cpu_list, info);
> -    }
> -
> -    return cpu_list;
> -}
> -
>   static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
>   {
>       PowerPCCPU *cpu = POWERPC_CPU(cs);
> diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
> index 8250b1304e..36e5b5eff8 100644
> --- a/target/ppc/monitor.c
> +++ b/target/ppc/monitor.c
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU monitor
> + * QEMU PPC (monitor definitions)
>    *
>    * Copyright (c) 2003-2004 Fabrice Bellard
>    *
> @@ -28,6 +28,9 @@
>   #include "qemu/ctype.h"
>   #include "monitor/hmp-target.h"
>   #include "monitor/hmp.h"
> +#include "qapi/qapi-commands-machine-target.h"
> +#include "cpu-models.h"
> +#include "cpu-qom.h"
>   
>   static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
>                                      int val)
> @@ -172,3 +175,48 @@ int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
>   
>       return -EINVAL;
>   }
> +
> +static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
> +{
> +    ObjectClass *oc = data;
> +    CpuDefinitionInfoList **first = user_data;
> +    const char *typename;
> +    CpuDefinitionInfo *info;
> +
> +    typename = object_class_get_name(oc);
> +    info = g_malloc0(sizeof(*info));
> +    info->name = g_strndup(typename,
> +                           strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
> +
> +    QAPI_LIST_PREPEND(*first, info);
> +}
> +
> +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> +{
> +    CpuDefinitionInfoList *cpu_list = NULL;
> +    GSList *list;
> +    int i;
> +
> +    list = object_class_get_list(TYPE_POWERPC_CPU, false);
> +    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
> +    g_slist_free(list);
> +
> +    for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
> +        PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
> +        ObjectClass *oc;
> +        CpuDefinitionInfo *info;
> +
> +        oc = ppc_cpu_class_by_name(alias->model);
> +        if (oc == NULL) {
> +            continue;
> +        }
> +
> +        info = g_malloc0(sizeof(*info));
> +        info->name = g_strdup(alias->alias);
> +        info->q_typename = g_strdup(object_class_get_name(oc));
> +
> +        QAPI_LIST_PREPEND(cpu_list, info);
> +    }
> +
> +    return cpu_list;
> +}


