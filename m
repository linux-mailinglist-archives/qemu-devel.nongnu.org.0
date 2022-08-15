Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EA4593A8E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 22:05:02 +0200 (CEST)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNgKb-0004tt-4i
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 16:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oNgIN-0003QU-Av
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 16:02:43 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:33825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oNgIK-0006yJ-LI
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 16:02:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id F1CDF20E42;
 Mon, 15 Aug 2022 20:02:25 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 15 Aug
 2022 22:02:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0026fa7910c-6eea-4cf4-8962-cdff7b4e9a94,
 ED195773DA48A3F619B8600B5AFD578ACA86CAE0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <012f86ce-25da-a42d-3a36-f13f64c248e9@kaod.org>
Date: Mon, 15 Aug 2022 22:02:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH 00/13] PowerPC interrupt rework
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: <danielhb413@gmail.com>, <david@gibson.dropbear.id.au>, <groug@kaod.org>, 
 <fbarrat@linux.ibm.com>, <alex.bennee@linaro.org>, Fabiano Rosas
 <farosas@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c7ad7e97-1e98-41b7-9eba-e4f4a7aec304
X-Ovh-Tracer-Id: 11984360087268002738
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgudegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeejueefjeehgeeiudffjedvheeitdffjeehkeetudehveduudeluddufeejvedtnecuffhomhgrihhnpehgnhhurdhorhhgpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

[ Adding Fabiano who reworked all exception models for 7.0 and Nick
   who rewrote the Linux side sometime ago ]

On 8/15/22 18:20, Matheus Ferst wrote:
> Currently, PowerPC interrupts are handled as follows:
> 
> 1) The CPU_INTERRUPT_HARD bit of cs->interrupt_request gates all
>     interrupts;
> 2) The bits of env->pending_interrupts identify which particular
>     interrupt is raised;
> 3) ppc_set_irq can be used to set/clear env->pending_interrupt bit and
>     CPU_INTERRUPT_HARD, but some places access env->pending_interrupt
>     directly;
> 4) ppc_cpu_exec_interrupt is called by cpu_handle_interrupt when
>     cs->interrupt_request indicates that there is some interrupt pending.
>     This method checks CPU_INTERRUPT_HARD and calls ppc_hw_interrupt. If
>     env->pending_interrupt is zero after this call, CPU_INTERRUPT_HARD
>     will be cleared.
> 5) ppc_hw_interrupt checks if there is any unmasked interrupt and calls
>     powerpc_excp with the appropriate POWERPC_EXCP_* value. The method
>     will also reset the corresponding bit in env->pending_interrupt for
>     interrupts that clear on delivery.
> 
> If all pending interrupts are masked, CPU_INTERRUPT_HARD will be set,
> but ppc_hw_interrupt will not deliver or clear the interrupt, so
> CPU_INTERRUPT_HARD will not be reset by ppc_cpu_exec_interrupt. With
> that, cs->has_work keeps returning true, creating a loop that acquires
> and release qemu_mutex_lock_iothread, causing the poor performance
> reported in [1].
> 
> This patch series attempts to rework the PowerPC interrupt code to set
> CPU_INTERRUPT_HARD only when there are unmasked interrupts. Then
> cs->has_work can be simplified to a check of CPU_INTERRUPT_HARD, so it
> also only returns true when at least one interrupt can be delivered.
> 
> To achieve that, we are basically following Alex Bannée's suggestion[2]
> in the original thread: the interrupt masking logic will be factored
> out of ppc_hw_interrupt in a new method, ppc_pending_interrupts. This
> method is then used to decide if CPU_INTERRUPT_HARD should be set or
> cleared after changes to MSR, LPCR, env->pending_interrupts, and
> power-management instructions.
> 
> We used [3] to check for regressions at each patch in this series. After
> patch 12, booting a powernv machine with a newer skiboot with "-smp 4"
> goes from 1m09s to 20.79s.

whaou ! PowerNV is really an heavy weight platform, so that's a great
improvement.

Did you try KVM guests under PowerNV (L1 under an emulated L0) and KVM
under pseries (L2 under an emulated L1) ? Try some intensive I/O on a
SMP machine, like a large scp transfer.

We should try the MacOS images also.

Thanks,

C.


> 
> [1] https://lists.gnu.org/archive/html/qemu-ppc/2022-06/msg00336.html
> [2] https://lists.gnu.org/archive/html/qemu-ppc/2022-06/msg00372.html
> [3] https://github.com/legoater/qemu-ppc-boot
> 
> Matheus Ferst (13):
>    target/ppc: define PPC_INTERRUPT_* values directly
>    target/ppc: always use ppc_set_irq to set env->pending_interrupts
>    target/ppc: move interrupt masking out of ppc_hw_interrupt
>    target/ppc: prepare to split ppc_interrupt_pending by excp_model
>    target/ppc: create a interrupt masking method for POWER9/POWER10
>    target/ppc: remove embedded interrupts from ppc_pending_interrupt_p9
>    target/ppc: create a interrupt masking method for POWER8
>    target/ppc: remove unused interrupts from ppc_pending_interrupt_p8
>    target/ppc: create a interrupt masking method for POWER7
>    target/ppc: remove unused interrupts from ppc_pending_interrupt_p7
>    target/ppc: remove ppc_store_lpcr from CONFIG_USER_ONLY builds
>    target/ppc: introduce ppc_maybe_interrupt
>    target/ppc: unify cpu->has_work based on cs->interrupt_request
> 
>   hw/ppc/ppc.c             |  17 +-
>   hw/ppc/trace-events      |   2 +-
>   target/ppc/cpu.c         |   2 +
>   target/ppc/cpu.h         |  43 +--
>   target/ppc/cpu_init.c    | 212 +------------
>   target/ppc/excp_helper.c | 651 ++++++++++++++++++++++++++++++++-------
>   target/ppc/helper_regs.c |   2 +
>   target/ppc/misc_helper.c |  11 +-
>   target/ppc/translate.c   |   8 +-
>   9 files changed, 580 insertions(+), 368 deletions(-)
> 


