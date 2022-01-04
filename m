Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEA5483F48
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:41:05 +0100 (CET)
Received: from localhost ([::1]:46772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gJU-0005gE-JI
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:41:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4gIA-0004oF-Ar
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:39:42 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:36537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4gI8-0006GO-2k
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:39:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0E3A821961;
 Tue,  4 Jan 2022 09:39:38 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 4 Jan
 2022 10:39:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006d575f78b-fc68-4972-9edf-57eb70cd0b53,
 DC41CA294A1AC0AE13D8E7EBC58C249E9ADF812E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f90d26ce-28bb-81dd-b2c7-a5079101c793@kaod.org>
Date: Tue, 4 Jan 2022 10:39:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/9] target/ppc: powerpc_excp: Group unimplemented
 exceptions
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
 <20220103220746.3916246-4-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220103220746.3916246-4-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4aeff779-7388-4909-917f-9cd243962cb1
X-Ovh-Tracer-Id: 1574289545576680230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 23:07, Fabiano Rosas wrote:
> (I'll alter this to use powerpc_excp_name once it is merged)

Sure.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 76 ++++------------------------------------
>   1 file changed, 7 insertions(+), 69 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 4769abfb0c..160e06e3a3 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -628,23 +628,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
>       case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
>           env->spr[SPR_BOOKE_ESR] = ESR_SPV;
>           break;
> -    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Embedded floating point data exception "
> -                  "is not implemented yet !\n");
> -        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Embedded floating point round exception "
> -                  "is not implemented yet !\n");
> -        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "Performance counter exception is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
>           break;
>       case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
> @@ -709,19 +692,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
>       case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
>           trace_ppc_excp_print("PIT");
>           break;
> -    case POWERPC_EXCP_IO:        /* IO error exception                       */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "601 IO error exception is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_RUNM:      /* Run mode exception                       */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "601 run mode exception is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_EMUL:      /* Emulation trap exception                 */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "602 emulation trap exception "
> -                  "is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
>       case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
>       case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
> @@ -748,56 +718,24 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
>               break;
>           }
>           break;
> +    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
> +    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
> +    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
> +    case POWERPC_EXCP_IO:        /* IO error exception                       */
> +    case POWERPC_EXCP_RUNM:      /* Run mode exception                       */
> +    case POWERPC_EXCP_EMUL:      /* Emulation trap exception                 */
>       case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Floating point assist exception "
> -                  "is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "DABR exception is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "IABR exception is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_SMI:       /* System management interrupt              */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "SMI exception is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Thermal management exception "
> -                  "is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "Performance counter exception is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "VPU assist exception is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_SOFTP:     /* Soft patch exception                     */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "970 soft-patch exception is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "970 maintenance exception is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Maskable external exception "
> -                  "is not implemented yet !\n");
> -        break;
>       case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Non maskable external exception "
> -                  "is not implemented yet !\n");
> +        cpu_abort(cs, "Exception not implemented\n");
>           break;
>       default:
>       excp_invalid:
> 


