Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2973946E3A8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 09:01:36 +0100 (CET)
Received: from localhost ([::1]:56706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvEMx-00033u-5w
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 03:01:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvEK3-0007w1-E4
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:58:35 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:43529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvEK0-0000SX-6U
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:58:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.149])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3D59FD0C600C;
 Thu,  9 Dec 2021 08:58:29 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 9 Dec
 2021 08:58:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0029db4f86f-c128-4239-beec-ad55c1d97f3c,
 8D04C9E66DC1FB38CABDD9E51B1330B7D999B631) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4330aa78-00a1-3de7-764d-dae2222654c9@kaod.org>
Date: Thu, 9 Dec 2021 08:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/3] target/ppc: Remove 603e exception model
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211208123029.2052625-1-farosas@linux.ibm.com>
 <20211208123029.2052625-3-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211208123029.2052625-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 512eb7a1-7fa6-4c6b-b1eb-739925c26392
X-Ovh-Tracer-Id: 13196954285487000483
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeelgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.803,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/21 13:30, Fabiano Rosas wrote:
> The 603e uses the same exception code as 603 so we don't need a
> dedicated entry for it.
> 
> This is only a removal of redundant code, no functional change.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

QEMU really only supports the 604. I think we could drop the
previous 60x CPUs also.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/cpu-qom.h     |  2 --
>   target/ppc/cpu_init.c    | 32 ++------------------------------
>   target/ppc/excp_helper.c |  1 -
>   3 files changed, 2 insertions(+), 33 deletions(-)
> 
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 5800fa324e..e585912571 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -94,8 +94,6 @@ enum powerpc_excp_t {
>       POWERPC_EXCP_602,
>       /* PowerPC 603 exception model      */
>       POWERPC_EXCP_603,
> -    /* PowerPC 603e exception model     */
> -    POWERPC_EXCP_603E,
>       /* PowerPC G2 exception model       */
>       POWERPC_EXCP_G2,
>       /* PowerPC 604 exception model      */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 55af48769a..8100b89033 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -4749,41 +4749,13 @@ POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
>                    POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
>   }
>   
> -static void init_proc_603E(CPUPPCState *env)
> -{
> -    register_ne_601_sprs(env);
> -    register_sdr1_sprs(env);
> -    register_603_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
> -    /* hardware implementation registers */
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Memory management */
> -    register_low_BATs(env);
> -    register_6xx_7xx_soft_tlb(env, 64, 2);
> -    init_excp_603(env);
> -    env->dcache_line_size = 32;
> -    env->icache_line_size = 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc6xx_irq_init(env_archcpu(env));
> -}
> -
>   POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(oc);
>       PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
>   
>       dc->desc = "PowerPC 603e";
> -    pcc->init_proc = init_proc_603E;
> +    pcc->init_proc = init_proc_603;
>       pcc->check_pow = check_pow_hid0;
>       pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
>                          PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
> @@ -4809,7 +4781,7 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
> -    pcc->excp_model = POWERPC_EXCP_603E;
> +    pcc->excp_model = POWERPC_EXCP_603;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_ec603e;
>       pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 17607adbe4..f15a859fe4 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -672,7 +672,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>           switch (excp_model) {
>           case POWERPC_EXCP_602:
>           case POWERPC_EXCP_603:
> -        case POWERPC_EXCP_603E:
>           case POWERPC_EXCP_G2:
>               /* Swap temporary saved registers with GPRs */
>               if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
> 


