Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A0B4EB2BD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 19:34:24 +0200 (CEST)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZFja-00027h-OT
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 13:34:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nZFiJ-0001IS-PR; Tue, 29 Mar 2022 13:33:03 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:41695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nZFiH-0003rR-S9; Tue, 29 Mar 2022 13:33:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.240])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1A0B9F107898;
 Tue, 29 Mar 2022 19:32:58 +0200 (CEST)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 29 Mar
 2022 19:32:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001477accfe-6bfd-44d2-810a-a96bc563baab,
 8492F743BA62A400BA08EF67B2FF744DE97A922C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <505dbcab-a7c2-338f-b8e3-0877083dafe6@kaod.org>
Date: Tue, 29 Mar 2022 19:32:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] hw/ppc: free env->tb_env in spapr_unrealize_vcpu()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220329124545.529145-1-danielhb413@gmail.com>
 <20220329124545.529145-2-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220329124545.529145-2-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9e0a8180-3016-4152-81dc-602fe6905f3d
X-Ovh-Tracer-Id: 4812659153198615520
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeitddgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/22 14:45, Daniel Henrique Barboza wrote:
> The timebase is allocated during spapr_realize_vcpu() and it's not
> freed. This results in memory leaks when doing vcpu unplugs:
> 
> ==636935==
> ==636935== 144 (96 direct, 48 indirect) bytes in 1 blocks are definitely lost in loss record 6
> ,461 of 8,135
> ==636935==    at 0x4897468: calloc (vg_replace_malloc.c:760)
> ==636935==    by 0x5077213: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.6400.4)
> ==636935==    by 0x507757F: g_malloc0_n (in /usr/lib64/libglib-2.0.so.0.6400.4)
> ==636935==    by 0x93C3FB: cpu_ppc_tb_init (ppc.c:1066)
> ==636935==    by 0x97BC2B: spapr_realize_vcpu (spapr_cpu_core.c:268)
> ==636935==    by 0x97C01F: spapr_cpu_core_realize (spapr_cpu_core.c:337)
> ==636935==    by 0xD4626F: device_set_realized (qdev.c:531)
> ==636935==    by 0xD55273: property_set_bool (object.c:2273)
> ==636935==    by 0xD523DF: object_property_set (object.c:1408)
> ==636935==    by 0xD588B7: object_property_set_qobject (qom-qobject.c:28)
> ==636935==    by 0xD52897: object_property_set_bool (object.c:1477)
> ==636935==    by 0xD4579B: qdev_realize (qdev.c:333)
> ==636935==
> 
> This patch adds a cpu_ppc_tb_free() helper in hw/ppc/ppc.c to allow us
> to free the timebase. This leak is then solved by calling
> cpu_ppc_tb_free() in spapr_unrealize_vcpu().
> 
> Fixes: 6f4b5c3ec590 ("spapr: CPU hot unplug support")
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>   hw/ppc/ppc.c            | 7 +++++++
>   hw/ppc/spapr_cpu_core.c | 3 +++
>   include/hw/ppc/ppc.h    | 1 +
>   3 files changed, 11 insertions(+)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index faa02d6710..fea70df45e 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -1083,6 +1083,13 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
>       return &cpu_ppc_set_tb_clk;
>   }
>   
> +void cpu_ppc_tb_free(CPUPPCState *env)
> +{
> +    timer_free(env->tb_env->decr_timer);
> +    timer_free(env->tb_env->hdecr_timer);
> +    g_free(env->tb_env);
> +}
> +
>   /* cpu_ppc_hdecr_init may be used if the timer is not used by HDEC emulation */
>   void cpu_ppc_hdecr_init(CPUPPCState *env)
>   {
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index ed84713960..8a4861f45a 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -189,10 +189,13 @@ static const VMStateDescription vmstate_spapr_cpu_state = {
>   
>   static void spapr_unrealize_vcpu(PowerPCCPU *cpu, SpaprCpuCore *sc)
>   {
> +    CPUPPCState *env = &cpu->env;
> +
>       if (!sc->pre_3_0_migration) {
>           vmstate_unregister(NULL, &vmstate_spapr_cpu_state, cpu->machine_data);
>       }
>       spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
> +    cpu_ppc_tb_free(env);
>       qdev_unrealize(DEVICE(cpu));
>   }
>   
> diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
> index b0ba4bd6b9..364f165b4b 100644
> --- a/include/hw/ppc/ppc.h
> +++ b/include/hw/ppc/ppc.h
> @@ -54,6 +54,7 @@ struct ppc_tb_t {
>   
>   uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_offset);
>   clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq);
> +void cpu_ppc_tb_free(CPUPPCState *env);
>   void cpu_ppc_hdecr_init(CPUPPCState *env);
>   void cpu_ppc_hdecr_exit(CPUPPCState *env);
>   


