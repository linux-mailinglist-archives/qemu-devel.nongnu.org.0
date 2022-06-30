Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED95624BF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 23:01:59 +0200 (CEST)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o71IR-0007Rb-Tk
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 17:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o71Fh-0005fO-B4; Thu, 30 Jun 2022 16:59:05 -0400
Received: from [200.168.210.66] (port=30885 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o71Ff-0006QQ-17; Thu, 30 Jun 2022 16:59:05 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 30 Jun 2022 17:58:57 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 578A5800028;
 Thu, 30 Jun 2022 17:58:57 -0300 (-03)
Message-ID: <e2bd1433-23a5-9998-0059-30af7dd887bf@eldorado.org.br>
Date: Thu, 30 Jun 2022 17:58:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] target/ppc: Return default CPU for max CPU
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 mopsfelder@gmail.com, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, "Matheus K . Ferst"
 <matheus.ferst@eldorado.org.br>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220628205513.81917-1-muriloo@linux.ibm.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <20220628205513.81917-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Jun 2022 20:58:57.0573 (UTC)
 FILETIME=[373E2D50:01D88CC4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 28/06/2022 17:55, Murilo Opsfelder Araujo wrote:
> All ppc CPUs represent hardware that exists in the real world, i.e.: we
> do not have a "max" CPU with all possible emulated features enabled.
> Return the default CPU type for the machine because that has greater
> chance of being useful as the "max" CPU.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1038
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Matheus K. Ferst <matheus.ferst@eldorado.org.br>
> Cc: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
> v2:
> - Return the default CPU of the machine instead of hard-coded alias.
> 
> v1: https://lore.kernel.org/qemu-devel/20220531172711.94564-1-muriloo@linux.ibm.com/
> 
>   target/ppc/cpu-models.c |  1 -
>   target/ppc/cpu_init.c   | 19 +++++++++++++++++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 976be5e0d1..05589eb21d 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -879,7 +879,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>       { "755", "755_v2.8" },
>       { "goldfinger", "755_v2.8" },
>       { "7400", "7400_v2.9" },
> -    { "max", "7400_v2.9" },
>       { "g4",  "7400_v2.9" },
>       { "7410", "7410_v1.4" },
>       { "nitro", "7410_v1.4" },
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index c16cb8dbe7..8ee0b7c785 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -47,6 +47,10 @@
>   #include "spr_common.h"
>   #include "power8-pmu.h"
> 
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/boards.h"
> +#endif
> +
>   /* #define PPC_DEBUG_SPR */
>   /* #define USE_APPLE_GDB */
> 
> @@ -6963,6 +6967,21 @@ static ObjectClass *ppc_cpu_class_by_name(const char *name)
>           }
>       }
> 
> +    /*
> +     * All ppc CPUs represent hardware that exists in the real world, i.e.: we
> +     * do not have a "max" CPU with all possible emulated features enabled.
> +     * Return the default CPU type for the machine because that has greater
> +     * chance of being useful as the "max" CPU.
> +     */
> +#if !defined(CONFIG_USER_ONLY)
> +    if (strcmp(name, "max") == 0) {
> +        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> +        if (mc) {
> +            return object_class_by_name(mc->default_cpu_type);
> +        }
> +    }
> +#endif
> +
>       cpu_model = g_ascii_strdown(name, -1);
>       p = ppc_cpu_lookup_alias(cpu_model);
>       if (p) {
> --
> 2.36.1
> 
> 

Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>

Best regards,

-- 
Víctor Cora Colombo
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

